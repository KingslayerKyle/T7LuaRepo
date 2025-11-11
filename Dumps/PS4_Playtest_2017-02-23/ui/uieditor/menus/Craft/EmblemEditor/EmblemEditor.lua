require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemChooseIcon" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemEditorMaterialPicker" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemIconColorPicker" )
require( "ui.uieditor.menus.Craft.Paintshop.PaintshopLayerOptions" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemBrowseControlsBar" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorLayerProperties" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemIconClipboard" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemLayerContainer" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemPulseLayerWidget" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.layermofn" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChoosePaintSide" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopControlsFull" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.PC.Craft.CraftActionHeader" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )

local MIN_RIGHT_STICK_LEFT_ANGLE = 145
local MAX_RIGHT_STICK_LEFT_ANGLE = 225
local MIN_RIGHT_STICK_RIGHT_ANGLE = 315
local MAX_RIGHT_STICK_RIGHT_ANGLE = 45
local SubscribeToRightStickUpdates = function ( self, controller )
	local rightStickUpdateTimer = 100
	local minRightStickLength = 0.8
	local GetRightStickDirection = function ( degrees, controller )
		if MIN_RIGHT_STICK_LEFT_ANGLE <= degrees and degrees <= MAX_RIGHT_STICK_LEFT_ANGLE then
			return "left"
		elseif MIN_RIGHT_STICK_RIGHT_ANGLE <= degrees or degrees <= MAX_RIGHT_STICK_RIGHT_ANGLE then
			return "right"
		else
			
		end
	end
	
	local UpdatePaintshopView = function ()
		if minRightStickLength < self.length and self.isRightStickRepeated == false then
			self.isRightStickRepeated = true
			local direction = GetRightStickDirection( self.degrees, controller )
			if direction == "left" then
				PaintjobEditor_ChangeViewLeftBumper( self, self, controller )
				PlaySoundSetSound( self, "switch_camera" )
			elseif direction == "right" then
				PaintjobEditor_ChangeViewRightBumper( self, self, controller )
				PlaySoundSetSound( self, "switch_camera" )
			end
		elseif self.length <= minRightStickLength and self.isRightStickRepeated == true then
			self.isRightStickRepeated = false
		end
	end
	
	local GetRightStickValues = function ( self, event )
		local rightStickModel = Engine.GetModel( Engine.GetModelForController( controller ), "RightStick" )
		local isBrowseMode = IsBrowseMode( controller )
		local isPaintshop = IsPaintshop( controller )
		if rightStickModel and isBrowseMode and isPaintshop then
			self.length = Engine.GetModelValue( Engine.GetModel( rightStickModel, "Length" ) )
			self.degrees = Engine.GetModelValue( Engine.GetModel( rightStickModel, "Degrees" ) )
			UpdatePaintshopView()
		end
	end
	
	self:addElement( LUI.UITimer.new( rightStickUpdateTimer, "get_right_stick_values", false, self ) )
	self:registerEventHandler( "get_right_stick_values", GetRightStickValues )
end

if CoD.isPC then
	require( "ui.uieditor.widgets.PC.Craft.CraftActionButton" )
	require( "ui.uieditor.widgets.PC.Craft.CraftActionSlider" )
	DataSources.CraftActionsPC = DataSourceHelpers.ListSetup( "PC.CraftActionsPC", function ( controller )
		local actions = {}
		local mode = CoD.GetEditorProperties( controller, "editorMode" )
		if mode == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT then
			return CoD.PCUtil.Craft_GetEmblemEditorEditModeActions( controller )
		else
			return CoD.PCUtil.Craft_GetEmblemEditorBrowseModeActions( controller )
		end
	end )
	DataSources.CraftActionsPC.getWidgetTypeForItem = CoD.PCUtil.Craft_WidgetSelectorFunc
end
local SetupPC = function ( self, controller, menu )
	self.emblemDrawWidget:registerEventHandler( "button_action", function ( element, event )
		return true
	end )
	CoD.Menu.AddButtonCallbackFunction( self, self, controller, Enum.LUIButton.LUI_KEY_PCKEY_MWHEELUP, "MWHEELUP", function ( element, menu, controller, model )
		if not self.m_disableNavigation then
			Engine.ExecNow( controller, "emblemScale 0.02 0.02" )
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( self, self, controller, Enum.LUIButton.LUI_KEY_PCKEY_MWHEELDOWN, "MWHEELDOWN", function ( element, menu, controller, model )
		if not self.m_disableNavigation then
			Engine.ExecNow( controller, "emblemScale -0.02 -0.02" )
		end
	end )
	self.actionsListPC:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.editorMode" ), function ( model )
		self.actionsListPC:updateDataSource()
	end )
	self.actionsListPC.m_menu = self
	self.actionsListPC.navigation = nil
end

local PostLoadFunc = function ( self, controller, menu )
	local controller = self.m_ownerController
	EmblemEditor_SetupEditorBasedOnMode( self, self, controller )
	self.isRightStickRepeated = false
	SubscribeToRightStickUpdates( self, controller )
	if IsPaintshop( controller ) and Dvar.ui_disablePSControlWidgets:get() == true then
		self.editorControlsGuide:setAlpha( 0 )
		self.layerProperties:setAlpha( 0 )
		self.paintshopControls:setAlpha( 0 )
		self.choosePaintSide:setAlpha( 0 )
	end
	if CoD.isPC then
		SetupPC( self, controller, menu )
	end
end

local PreLoadFunc = function ( self, controller )
	self.disableLeaderChangePopupShutdown = true
end

LUI.createMenu.EmblemEditor = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmblemEditor" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CustomizationEditor"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemEditor.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0.5, 0.5, -957, 963 )
	Background:setTopBottom( 0.5, 0.5, -540, 540 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local editorBackground = LUI.UIImage.new()
	editorBackground:setLeftRight( 0, 1, 0, 0 )
	editorBackground:setTopBottom( 0, 1, 0, 0 )
	editorBackground:setRGB( 0, 0, 0 )
	editorBackground:setAlpha( 0.75 )
	self:addElement( editorBackground )
	self.editorBackground = editorBackground
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	StartMenuBackground0:setLeftRight( 0, 1, 0, 0 )
	StartMenuBackground0:setTopBottom( 0, 1, 164, -164 )
	StartMenuBackground0:setAlpha( 0.37 )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local layerCarousel = LUI.UIList.new( self, controller, 2, 200, nil, false, true, 595, 0, false, false )
	layerCarousel:makeFocusable()
	layerCarousel:mergeStateConditions( {
		{
			stateName = "EditMode_Selected",
			condition = function ( menu, element, event )
				return not IsParentListInFocus( element )
			end
		}
	} )
	layerCarousel:setLeftRight( 0, 0, 126, 3631 )
	layerCarousel:setTopBottom( 0, 0, 734, 914 )
	layerCarousel:setWidgetType( CoD.EmblemLayerContainer )
	layerCarousel:setHorizontalCount( 16 )
	layerCarousel:setDataSource( "EmblemLayerList" )
	layerCarousel:linkToElementModel( layerCarousel, "isGrouped", true, function ( model )
		local element = layerCarousel
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isGrouped"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RTRIG )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
	end )
	layerCarousel:linkToElementModel( layerCarousel, "isLinked", true, function ( model )
		local element = layerCarousel
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLinked"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	layerCarousel:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if not IsLayerEmpty( self, element, controller ) then
			EmblemEditor_LayerGainFocus( self, self, element, controller )
			UpdateElementState( self, "layermofn", controller )
			UpdateElementState( self, "browseControlBar", controller )
			UpdateElementState( self, "clipboard", controller )
			PlayClipOnElement( self, {
				elementName = "emblemHiddenPulseLayer",
				clipName = "DefaultClip"
			}, controller )
		elseif IsLayerEmpty( self, element, controller ) then
			EmblemEditor_LayerGainFocus( self, self, element, controller )
			UpdateElementState( self, "layermofn", controller )
			UpdateElementState( self, "browseControlBar", controller )
			UpdateElementState( self, "clipboard", controller )
			PlayClipOnElement( self, {
				elementName = "emblemHiddenPulseLayer",
				clipName = "Hide"
			}, controller )
		end
		return retVal
	end )
	layerCarousel:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RTRIG )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
		return retVal
	end )
	layerCarousel:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( layerCarousel, controller, Enum.LUIButton.LUI_KEY_RTRIG, nil, function ( element, menu, controller, model )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and not Emblem_IsLayerGrouped( element, controller ) and not IsRepeatButtonPress( model ) and not Paintjobs_DisableGroupsFeature() then
			EmblemEditor_LinkUnlinkLayers( self, element, controller )
			UpdateElementState( self, "browseControlBar", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		local model = nil
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and not Emblem_IsLayerGrouped( element, controller ) and not IsRepeatButtonPress( model ) and not Paintjobs_DisableGroupsFeature() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RTRIG, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( layerCarousel, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and Emblem_IsLayerGrouped( element, controller ) and not Paintjobs_DisableGroupsFeature() then
			EmblemEditor_SaveSelectedGroup( self, element, controller, event )
			UpdateElementState( self, "browseControlBar", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and Emblem_IsLayerGrouped( element, controller ) and not Paintjobs_DisableGroupsFeature() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( layerCarousel, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and Emblems_IsLayerLinked( element, controller ) and not IsRepeatButtonPress( model ) and not Paintjobs_DisableGroupsFeature() then
			EmblemEditor_GroupUngroupLayers( self, element, controller )
			UpdateElementState( self, "browseControlBar", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		local model = nil
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and Emblems_IsLayerLinked( element, controller ) and not IsRepeatButtonPress( model ) and not Paintjobs_DisableGroupsFeature() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( layerCarousel )
	self.layerCarousel = layerCarousel
	
	local emblemDrawWidget = CoD.EmblemDrawWidgetNew.new( self, controller )
	emblemDrawWidget:setLeftRight( 0, 0, 585, 1335 )
	emblemDrawWidget:setTopBottom( 0, 0, 195, 661 )
	self:addElement( emblemDrawWidget )
	self.emblemDrawWidget = emblemDrawWidget
	
	local emblemHiddenPulseLayer = CoD.EmblemPulseLayerWidget.new( self, controller )
	emblemHiddenPulseLayer:setLeftRight( 0, 0, 600, 1320 )
	emblemHiddenPulseLayer:setTopBottom( 0, 0, 210, 646 )
	self:addElement( emblemHiddenPulseLayer )
	self.emblemHiddenPulseLayer = emblemHiddenPulseLayer
	
	local layerProperties = CoD.EmblemEditorLayerProperties.new( self, controller )
	layerProperties:mergeStateConditions( {
		{
			stateName = "EditModeLayerProperties",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
			end
		}
	} )
	layerProperties:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.editorMode" ), function ( model )
		self:updateElementState( layerProperties, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.editorMode"
		} )
	end )
	layerProperties:setLeftRight( 1, 1, -546, -292 )
	layerProperties:setTopBottom( 0, 0, 195, 481 )
	layerProperties:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", nil, function ( model )
		layerProperties:setModel( model, controller )
	end )
	self:addElement( layerProperties )
	self.layerProperties = layerProperties
	
	local clipboard = CoD.EmblemIconClipboard.new( self, controller )
	clipboard:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return Emblem_HideClipboard( element, controller )
			end
		},
		{
			stateName = "PasteState",
			condition = function ( menu, element, event )
				return Emblem_CanPastFromClipboard( element, controller )
			end
		},
		{
			stateName = "AllGroupsUsed",
			condition = function ( menu, element, event )
				local f32_local0
				if not IsGroupSlotAvailable( controller ) then
					f32_local0 = IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE )
					if f32_local0 then
						f32_local0 = IsClipboardEmblemGrouped( controller )
					end
				else
					f32_local0 = false
				end
				return f32_local0
			end
		}
	} )
	clipboard:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.editorMode" ), function ( model )
		self:updateElementState( clipboard, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.editorMode"
		} )
	end )
	clipboard:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.groupsUsed" ), function ( model )
		self:updateElementState( clipboard, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.groupsUsed"
		} )
	end )
	clipboard:setLeftRight( 0, 0, 1374, 1610 )
	clipboard:setTopBottom( 0, 0, 346, 586 )
	self:addElement( clipboard )
	self.clipboard = clipboard
	
	local choosePaintSide = CoD.PaintshopChoosePaintSide.new( self, controller )
	choosePaintSide:mergeStateConditions( {
		{
			stateName = "BrowseModeControlsState",
			condition = function ( menu, element, event )
				return IsPaintshop( controller ) and not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
			end
		}
	} )
	choosePaintSide:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.editorMode" ), function ( model )
		self:updateElementState( choosePaintSide, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.editorMode"
		} )
	end )
	choosePaintSide:setLeftRight( 1, 1, -575, -200 )
	choosePaintSide:setTopBottom( 0, 0, 171, 246 )
	choosePaintSide:setAlpha( 0 )
	choosePaintSide:subscribeToGlobalModel( controller, "Customization", "view_string_ref", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			choosePaintSide.PaintshopChooseSide.text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( choosePaintSide )
	self.choosePaintSide = choosePaintSide
	
	local PaintshopControlsFull = CoD.PaintshopControlsFull.new( self, controller )
	PaintshopControlsFull:mergeStateConditions( {
		{
			stateName = "BrowseModeControlsState",
			condition = function ( menu, element, event )
				return not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
			end
		},
		{
			stateName = "FixedScale",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.scaleMode", Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED ) and IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
			end
		},
		{
			stateName = "FreeScale",
			condition = function ( menu, element, event )
				local f40_local0
				if not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.scaleMode", Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED ) then
					f40_local0 = IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
				else
					f40_local0 = false
				end
				return f40_local0
			end
		}
	} )
	PaintshopControlsFull:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.editorMode" ), function ( model )
		self:updateElementState( PaintshopControlsFull, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.editorMode"
		} )
	end )
	PaintshopControlsFull:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.scaleMode" ), function ( model )
		self:updateElementState( PaintshopControlsFull, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.scaleMode"
		} )
	end )
	PaintshopControlsFull:setLeftRight( 0, 0, 164.5, 539.5 )
	PaintshopControlsFull:setTopBottom( 0, 0, 195, 711 )
	self:addElement( PaintshopControlsFull )
	self.PaintshopControlsFull = PaintshopControlsFull
	
	local EmblemEditorFrame = CoD.GenericMenuFrame.new( self, controller )
	EmblemEditorFrame:setLeftRight( 0, 1, 0, 0 )
	EmblemEditorFrame:setTopBottom( 0, 1, 0, 0 )
	EmblemEditorFrame.titleLabel:setText( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
	EmblemEditorFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
	EmblemEditorFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( EmblemEditorFrame )
	self.EmblemEditorFrame = EmblemEditorFrame
	
	local PaintshopFrame = CoD.GenericMenuFrame.new( self, controller )
	PaintshopFrame:setLeftRight( 0, 1, 0, 0 )
	PaintshopFrame:setTopBottom( 0, 1, 0, 0 )
	PaintshopFrame:setAlpha( 0 )
	PaintshopFrame.titleLabel:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	PaintshopFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	PaintshopFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_paintshop" ) )
	self:addElement( PaintshopFrame )
	self.PaintshopFrame = PaintshopFrame
	
	local browseControlBar = CoD.EmblemBrowseControlsBar.new( self, controller )
	browseControlBar:mergeStateConditions( {
		{
			stateName = "BrowseModeLinkedLayer",
			condition = function ( menu, element, event )
				return BrowseModeLinkedLayer( self, element, controller )
			end
		},
		{
			stateName = "BrowseModeGroupedLayer",
			condition = function ( menu, element, event )
				return BrowseModeGroupedLayer( self, element, controller )
			end
		},
		{
			stateName = "BrowseModeOneLayerLinked",
			condition = function ( menu, element, event )
				return BrowseModeOneLayerLinked( self, element, controller )
			end
		},
		{
			stateName = "BrowseMode",
			condition = function ( menu, element, event )
				return BrowseMode( self, element, controller )
			end
		},
		{
			stateName = "GroupsDisabledMode",
			condition = function ( menu, element, event )
				return GroupsDisabledMode( self, element, controller )
			end
		}
	} )
	browseControlBar:setLeftRight( 0, 1, 0, 0 )
	browseControlBar:setTopBottom( 1, 1, -54, 0 )
	browseControlBar:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( browseControlBar )
	self.browseControlBar = browseControlBar
	
	local layermofn = CoD.layermofn.new( self, controller )
	layermofn:mergeStateConditions( {
		{
			stateName = "EmptyLayer",
			condition = function ( menu, element, event )
				return IsLayerEmpty( self, element, controller )
			end
		}
	} )
	layermofn:setLeftRight( 0, 0, 757, 1139 )
	layermofn:setTopBottom( 0, 0, 914, 996 )
	self:addElement( layermofn )
	self.layermofn = layermofn
	
	local actionsListPC = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	actionsListPC:makeFocusable()
	actionsListPC:setLeftRight( 0, 0, 96, 471 )
	actionsListPC:setTopBottom( 0, 0, 171, 649 )
	actionsListPC:setAlpha( 0 )
	actionsListPC:setWidgetType( CoD.CraftActionHeader )
	actionsListPC:setVerticalCount( 15 )
	actionsListPC:setDataSource( "CraftActionsPC" )
	self:addElement( actionsListPC )
	self.actionsListPC = actionsListPC
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	emblemHiddenPulseLayer:linkToElementModel( layerCarousel, nil, false, function ( model )
		emblemHiddenPulseLayer:setModel( model, controller )
	end )
	emblemHiddenPulseLayer:linkToElementModel( layerCarousel, "layerAndGroupIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblemHiddenPulseLayer.emblemHiddenPulseLayer:setupHiddenEmblemLayer( GetEmblemLayerAndGroupIndex( controller, modelValue ) )
		end
	end )
	browseControlBar:linkToElementModel( layerCarousel, nil, false, function ( model )
		browseControlBar:setModel( model, controller )
	end )
	layermofn:linkToElementModel( layerCarousel, nil, false, function ( model )
		layermofn:setModel( model, controller )
	end )
	layermofn:linkToElementModel( layerCarousel, "layerNumberString", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			layermofn.layerMOfN:setText( LocalizeLayerMOfN( "MENU_EMBLEM_LAYER_M_OF_N", controller, modelValue ) )
		end
	end )
	layerCarousel.navigation = {
		up = emblemDrawWidget
	}
	emblemDrawWidget.navigation = {
		left = actionsListPC,
		down = layerCarousel
	}
	actionsListPC.navigation = {
		right = emblemDrawWidget,
		down = layerCarousel
	}
	self.resetProperties = function ()
		clipboard:completeAnimation()
		choosePaintSide:completeAnimation()
		PaintshopControlsFull:completeAnimation()
		actionsListPC:completeAnimation()
		layerProperties:completeAnimation()
		emblemDrawWidget:completeAnimation()
		editorBackground:completeAnimation()
		StartMenuBackground0:completeAnimation()
		Background:completeAnimation()
		EmblemEditorFrame:completeAnimation()
		PaintshopFrame:completeAnimation()
		clipboard:setLeftRight( 0, 0, 1374, 1610 )
		clipboard:setTopBottom( 0, 0, 346, 586 )
		clipboard:setAlpha( 1 )
		choosePaintSide:setLeftRight( 1, 1, -575, -200 )
		choosePaintSide:setTopBottom( 0, 0, 171, 246 )
		choosePaintSide:setAlpha( 0 )
		PaintshopControlsFull:setLeftRight( 0, 0, 164.5, 539.5 )
		PaintshopControlsFull:setTopBottom( 0, 0, 195, 711 )
		PaintshopControlsFull:setAlpha( 1 )
		actionsListPC:setAlpha( 0 )
		layerProperties:setLeftRight( 1, 1, -546, -292 )
		layerProperties:setTopBottom( 0, 0, 195, 481 )
		emblemDrawWidget:setLeftRight( 0, 0, 585, 1335 )
		emblemDrawWidget:setTopBottom( 0, 0, 195, 661 )
		emblemDrawWidget:setAlpha( 1 )
		editorBackground:setAlpha( 0.75 )
		StartMenuBackground0:setAlpha( 0.37 )
		Background:setAlpha( 1 )
		EmblemEditorFrame:setAlpha( 1 )
		PaintshopFrame:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				clipboard:completeAnimation()
				self.clipboard:setLeftRight( 0, 0, 1572, 1826 )
				self.clipboard:setTopBottom( 0, 0, 346, 586 )
				self.clipboard:setAlpha( 0.89 )
				self.clipFinished( clipboard, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 1 )
				self.clipFinished( choosePaintSide, {} )
				PaintshopControlsFull:completeAnimation()
				self.PaintshopControlsFull:setLeftRight( 0, 0, 96.5, 471.5 )
				self.PaintshopControlsFull:setTopBottom( 0, 0, 163, 637 )
				self.PaintshopControlsFull:setAlpha( 0 )
				self.clipFinished( PaintshopControlsFull, {} )
			end
		},
		EmblemEditor_PC = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				PaintshopControlsFull:completeAnimation()
				self.PaintshopControlsFull:setAlpha( 0 )
				self.clipFinished( PaintshopControlsFull, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setAlpha( 1 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		EmblemEditor = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Paintshop_PC = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				editorBackground:completeAnimation()
				self.editorBackground:setAlpha( 0 )
				self.clipFinished( editorBackground, {} )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0 )
				self.clipFinished( StartMenuBackground0, {} )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setLeftRight( 0, 0, 506, 1544 )
				self.emblemDrawWidget:setTopBottom( 0, 0, 186, 610 )
				self.emblemDrawWidget:setAlpha( 0.01 )
				self.clipFinished( emblemDrawWidget, {} )
				layerProperties:completeAnimation()
				self.layerProperties:setLeftRight( 1, 1, -348, -96 )
				self.layerProperties:setTopBottom( 0, 0, 210, 494 )
				self.clipFinished( layerProperties, {} )
				clipboard:completeAnimation()
				self.clipboard:setLeftRight( 0, 0, 1572, 1824 )
				self.clipboard:setTopBottom( 0, 0, 346, 586 )
				self.clipFinished( clipboard, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setLeftRight( 1, 1, -348.5, -96.5 )
				self.choosePaintSide:setTopBottom( 0, 0, 166.5, 206.5 )
				self.choosePaintSide:setAlpha( 1 )
				self.clipFinished( choosePaintSide, {} )
				PaintshopControlsFull:completeAnimation()
				self.PaintshopControlsFull:setLeftRight( 0, 0, 96.5, 471.5 )
				self.PaintshopControlsFull:setTopBottom( 0, 0, 163.5, 678.5 )
				self.PaintshopControlsFull:setAlpha( 0 )
				self.clipFinished( PaintshopControlsFull, {} )
				EmblemEditorFrame:completeAnimation()
				self.EmblemEditorFrame:setAlpha( 0 )
				self.clipFinished( EmblemEditorFrame, {} )
				PaintshopFrame:completeAnimation()
				self.PaintshopFrame:setAlpha( 1 )
				self.clipFinished( PaintshopFrame, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setAlpha( 1 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		Paintshop = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				editorBackground:completeAnimation()
				self.editorBackground:setAlpha( 0 )
				self.clipFinished( editorBackground, {} )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0 )
				self.clipFinished( StartMenuBackground0, {} )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setLeftRight( 0, 0, 506, 1544 )
				self.emblemDrawWidget:setTopBottom( 0, 0, 186, 610 )
				self.emblemDrawWidget:setAlpha( 0 )
				self.clipFinished( emblemDrawWidget, {} )
				layerProperties:completeAnimation()
				self.layerProperties:setLeftRight( 1, 1, -348, -96 )
				self.layerProperties:setTopBottom( 0, 0, 210, 494 )
				self.clipFinished( layerProperties, {} )
				clipboard:completeAnimation()
				self.clipboard:setLeftRight( 0, 0, 1572, 1824 )
				self.clipboard:setTopBottom( 0, 0, 346, 586 )
				self.clipFinished( clipboard, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setLeftRight( 1, 1, -348.5, -96.5 )
				self.choosePaintSide:setTopBottom( 0, 0, 166.5, 206.5 )
				self.choosePaintSide:setAlpha( 1 )
				self.clipFinished( choosePaintSide, {} )
				PaintshopControlsFull:completeAnimation()
				self.PaintshopControlsFull:setLeftRight( 0, 0, 96.5, 471.5 )
				self.PaintshopControlsFull:setTopBottom( 0, 0, 163.5, 678.5 )
				self.clipFinished( PaintshopControlsFull, {} )
				EmblemEditorFrame:completeAnimation()
				self.EmblemEditorFrame:setAlpha( 0 )
				self.clipFinished( EmblemEditorFrame, {} )
				PaintshopFrame:completeAnimation()
				self.PaintshopFrame:setAlpha( 1 )
				self.clipFinished( PaintshopFrame, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "EmblemEditor_PC",
			condition = function ( menu, element, event )
				local f61_local0 = IsEmblemEditor( controller )
				if f61_local0 then
					if not IsGamepad( controller ) then
						f61_local0 = IsPC()
					else
						f61_local0 = false
					end
				end
				return f61_local0
			end
		},
		{
			stateName = "EmblemEditor",
			condition = function ( menu, element, event )
				return IsEmblemEditor( controller )
			end
		},
		{
			stateName = "Paintshop_PC",
			condition = function ( menu, element, event )
				local f63_local0 = IsPaintshop( controller )
				if f63_local0 then
					if not IsGamepad( controller ) then
						f63_local0 = IsPC()
					else
						f63_local0 = false
					end
				end
				return f63_local0
			end
		},
		{
			stateName = "Paintshop",
			condition = function ( menu, element, event )
				return IsPaintshop( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.editorMode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.editorMode"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsEmblemEditor( controller ) then
			ShowHeaderIconOnly( self )
		elseif IsPaintshop( controller ) then
			ShowHeaderKickerAndIcon( self )
			SetHeadingKickerTextToSelectedWeapon( controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( element, menu, controller, model )
		if IsEditMode( controller ) then
			EmblemEditor_ToggleOutline( self, element, controller )
			PlaySoundSetSound( self, "toggle_outline" )
			return true
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) then
			EmblemEditor_CutLayer( self, element, controller )
			EmblemEditor_UpdateLayerData( self, controller )
			PlaySoundSetSound( self, "opacity" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsEditMode( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "", nil )
			return false
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "E", function ( element, menu, controller, model )
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) then
			EmblemEditor_EndEdit( self, element, controller )
			NavigateToMenu( self, "EmblemIconColorPicker", true, controller )
			EmblemChooseColor_ClearSelectedLayerMaterial( self, element, controller )
			return true
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and not Emblem_IsLayerGroupedByLayerIndex( element, controller ) then
			NavigateToMenu( self, "EmblemChooseIcon", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and not Emblem_IsLayerGroupedByLayerIndex( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		if IsEditMode( controller ) then
			PlaySoundSetSound( self, "opacity" )
			EmblemChooseColor_UpdateBothColorOpacity( self, element, "-0.01", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsEditMode( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		if IsEditMode( controller ) then
			PlaySoundSetSound( self, "opacity" )
			EmblemChooseColor_UpdateBothColorOpacity( self, element, "0.01", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsEditMode( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, "C", function ( element, menu, controller, model )
		if IsEditMode( controller ) then
			EmblemEditor_FlipIcon( self, element, controller )
			PlaySoundSetSound( self, "flip_image" )
			return true
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) then
			EmblemEditor_CopyLayerToClipboard( self, element, controller )
			UpdateElementState( self, "clipboard", controller )
			PlaySoundSetSound( self, "scale" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsEditMode( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_BACK, "", nil )
			return false
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_BACK, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) and not IsDemoBuildBeta() then
			EmblemEditor_EndEdit( self, element, controller )
			OpenPopup( self, "PaintshopLayerOptions", controller, "", "" )
			PlaySoundSetSound( self, "options" )
			return true
		elseif IsBrowseMode( controller ) and not IsClipboardEmpty( controller ) and Emblem_CanPastFromClipboard( element, controller ) then
			EmblemEditor_InsertLayer( self, element, controller )
			EmblemEditor_UpdateLayerData( self, controller )
			PlaySoundSetSound( self, "opacity" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) and not IsDemoBuildBeta() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
			return true
		elseif IsBrowseMode( controller ) and not IsClipboardEmpty( controller ) and Emblem_CanPastFromClipboard( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsBrowseMode( controller ) and IsEmblemEditor( controller ) and not IsEmblemEmpty( controller ) then
			EmblemEditor_OpenSavePopup( self, element, controller, menu )
			PlaySoundSetSound( self, "save_box" )
			return true
		elseif IsEditMode( controller ) then
			EmblemEditor_HandleBackInEditMode( self, element, controller )
			PlaySoundSetSound( self, "list_action" )
			return true
		elseif IsBrowseMode( controller ) and IsPaintshop( controller ) and not IsPaintjobAllSidesEmpty( controller ) then
			PaintjobEditor_OpenSavePopup( self, element, controller, menu )
			PlaySoundSetSound( self, "save_box" )
			return true
		elseif IsBrowseMode( controller ) then
			OpenSystemOverlay( self, menu, controller, "CraftNoChangesNotification", nil )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsBrowseMode( controller ) and IsEmblemEditor( controller ) and not IsEmblemEmpty( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "PLATFORM_EMBLEM_EDIT_DONE", nil )
			return true
		elseif IsEditMode( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		elseif IsBrowseMode( controller ) and IsPaintshop( controller ) and not IsPaintjobAllSidesEmpty( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		elseif IsBrowseMode( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsEditMode( controller ) then
			EmblemEditor_HandleBackInEditMode( self, element, controller )
			return true
		elseif not IsLayerEmpty( self, element, controller ) then
			EmblemEditor_EditSelectedLayer( self, element, controller )
			UpdateElementState( self, "browseControlBar", controller )
			PlayClipOnElement( self, {
				elementName = "emblemHiddenPulseLayer",
				clipName = "DefaultClip"
			}, controller )
			return true
		elseif IsLayerEmpty( self, element, controller ) then
			NavigateToMenu( self, "EmblemChooseIcon", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsEditMode( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_APPLY_CHANGES", nil )
			return true
		elseif not IsLayerEmpty( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_APPLY_CHANGES", nil )
			return true
		elseif IsLayerEmpty( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_APPLY_CHANGES", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if IsEditMode( controller ) then
			EmblemEditor_ToggleScaleMode( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsEditMode( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, "N", function ( element, menu, controller, model )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and IsDpadButton( model ) and Emblem_IsAnyLayerEmpty( controller ) then
			EmblemEditor_InsertDecalPressed( self, element, controller )
			NavigateToMenu( self, "EmblemChooseIcon", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		local model = nil
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and IsDpadButton( model ) and Emblem_IsAnyLayerEmpty( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_DOWN, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, "M", function ( element, menu, controller, model )
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) and IsDpadButton( model ) then
			EmblemEditor_EndEdit( self, element, controller )
			NavigateToMenu( self, "EmblemEditorMaterialPicker", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		local model = nil
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) and IsDpadButton( model ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_UP, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, function ( element, menu, controller, model )
		if IsEditMode( controller ) and IsDpadButton( model ) and not IsRepeatButtonPress( model ) then
			EmblemEditor_MoveLayer( self, element, controller, "left" )
			PlaySoundSetSound( self, "layer_switch" )
			PlayClipOnElement( self, {
				elementName = "emblemHiddenPulseLayer",
				clipName = "DefaultClip"
			}, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		local model = nil
		if IsEditMode( controller ) and IsDpadButton( model ) and not IsRepeatButtonPress( model ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LEFT, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( element, menu, controller, model )
		if IsEditMode( controller ) and IsDpadButton( model ) and not IsRepeatButtonPress( model ) then
			EmblemEditor_MoveLayer( self, element, controller, "right" )
			PlaySoundSetSound( self, "layer_switch" )
			PlayClipOnElement( self, {
				elementName = "emblemHiddenPulseLayer",
				clipName = "DefaultClip"
			}, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		local model = nil
		if IsEditMode( controller ) and IsDpadButton( model ) and not IsRepeatButtonPress( model ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RIGHT, "", nil )
			return false
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		UploadStats( self, controller )
	end )
	layerCarousel.id = "layerCarousel"
	emblemDrawWidget.id = "emblemDrawWidget"
	EmblemEditorFrame:setModel( self.buttonModel, controller )
	PaintshopFrame:setModel( self.buttonModel, controller )
	actionsListPC.id = "actionsListPC"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.layerCarousel:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.layerCarousel:close()
		self.emblemDrawWidget:close()
		self.emblemHiddenPulseLayer:close()
		self.layerProperties:close()
		self.clipboard:close()
		self.choosePaintSide:close()
		self.PaintshopControlsFull:close()
		self.EmblemEditorFrame:close()
		self.PaintshopFrame:close()
		self.browseControlBar:close()
		self.layermofn:close()
		self.actionsListPC:close()
		self.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemEditor.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

