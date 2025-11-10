require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemIconColorPicker" )
require( "ui.uieditor.menus.Craft.Paintshop.PaintshopLayerOptions" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemChooseIcon" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemEditorMaterialPicker" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemLayerContainer" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemPulseLayerWidget" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorLayerProperties" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemIconClipboard" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChoosePaintSide" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopControlsFull" )
require( "ui.uieditor.widgets.PC.Craft.CraftEmblemEditMouseInstructions" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemBrowseControlsBar" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.layermofn" )
require( "ui.uieditor.widgets.PC.Craft.CraftActionHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local f0_local0 = 145
local f0_local1 = 225
local f0_local2 = 315
local f0_local3 = 45
local f0_local4 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = 100
	local f1_local1 = 0.8
	local f1_local2 = function ( f2_arg0, f2_arg1 )
		if f0_local0 <= f2_arg0 and f2_arg0 <= f0_local1 then
			return "left"
		elseif f0_local2 <= f2_arg0 or f2_arg0 <= f0_local3 then
			return "right"
		else
			
		end
	end
	
	local f1_local3 = function ()
		if f1_local1 < f1_arg0.length and f1_arg0.isRightStickRepeated == false then
			f1_arg0.isRightStickRepeated = true
			local f3_local0 = f1_local2( f1_arg0.degrees, f1_arg1 )
			if f3_local0 == "left" then
				PaintjobEditor_ChangeViewLeftBumper( f1_arg0, f1_arg0, f1_arg1 )
				PlaySoundSetSound( f1_arg0, "switch_camera" )
			elseif f3_local0 == "right" then
				PaintjobEditor_ChangeViewRightBumper( f1_arg0, f1_arg0, f1_arg1 )
				PlaySoundSetSound( f1_arg0, "switch_camera" )
			end
		elseif f1_arg0.length <= f1_local1 and f1_arg0.isRightStickRepeated == true then
			f1_arg0.isRightStickRepeated = false
		end
	end
	
	local f1_local4 = function ( f4_arg0, f4_arg1 )
		local f4_local0 = Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "RightStick" )
		if f4_local0 and IsBrowseMode( f1_arg1 ) and IsPaintshop( f1_arg1 ) then
			f4_arg0.length = Engine.GetModelValue( Engine.GetModel( f4_local0, "Length" ) )
			f4_arg0.degrees = Engine.GetModelValue( Engine.GetModel( f4_local0, "Degrees" ) )
			f1_local3()
		end
	end
	
	f1_arg0:addElement( LUI.UITimer.new( f1_local0, "get_right_stick_values", false, f1_arg0 ) )
	f1_arg0:registerEventHandler( "get_right_stick_values", f1_local4 )
end

if CoD.isPC then
	require( "ui.uieditor.widgets.PC.Craft.CraftActionButton" )
	require( "ui.uieditor.widgets.PC.Craft.CraftActionSlider" )
	DataSources.CraftActionsPC = DataSourceHelpers.ListSetup( "PC.CraftActionsPC", function ( f5_arg0 )
		local f5_local0 = {}
		if CoD.GetEditorProperties( f5_arg0, "editorMode" ) == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT then
			return CoD.PCUtil.Craft_GetEmblemEditorEditModeActions( f5_arg0 )
		else
			return CoD.PCUtil.Craft_GetEmblemEditorBrowseModeActions( f5_arg0 )
		end
	end )
	DataSources.CraftActionsPC.getWidgetTypeForItem = CoD.PCUtil.Craft_WidgetSelectorFunc
end
local f0_local5 = function ( f6_arg0, f6_arg1, f6_arg2 )
	f6_arg0.emblemDrawWidget:registerEventHandler( "button_action", function ( element, event )
		return true
	end )
	CoD.Menu.AddButtonCallbackFunction( f6_arg0, f6_arg0, f6_arg1, Enum.LUIButton.LUI_KEY_PCKEY_MWHEELUP, "MWHEELUP", function ( element, menu, controller, f8_arg3 )
		if not f6_arg0.m_disableNavigation then
			Engine.ExecNow( controller, "emblemScale 0.02 0.02" )
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( f6_arg0, f6_arg0, f6_arg1, Enum.LUIButton.LUI_KEY_PCKEY_MWHEELDOWN, "MWHEELDOWN", function ( element, menu, controller, f9_arg3 )
		if not f6_arg0.m_disableNavigation then
			Engine.ExecNow( controller, "emblemScale -0.02 -0.02" )
		end
	end )
	f6_arg0:registerEventHandler( "change_paintshop_view", function ( element, event )
		if event.direction == "left" then
			PaintjobEditor_ChangeViewLeftBumper( f6_arg0, f6_arg0, f6_arg1 )
			PlaySoundSetSound( f6_arg0, "switch_camera" )
		elseif event.direction == "right" then
			PaintjobEditor_ChangeViewRightBumper( f6_arg0, f6_arg0, f6_arg1 )
			PlaySoundSetSound( f6_arg0, "switch_camera" )
		end
		return true
	end )
	f6_arg0.actionsListPC:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f6_arg1 ), "Emblem.EmblemProperties.editorMode" ), function ( model )
		if not f6_arg0.m_layerEmpty and not Engine.LastInput_Gamepad() then
			f6_arg0.actionsListPC:show()
		else
			f6_arg0.actionsListPC:hide()
		end
		f6_arg0.actionsListPC:updateDataSource()
	end )
	f6_arg0.actionsListPC.m_menu = f6_arg0
	f6_arg0.actionsListPC.navigation = nil
end

local PostLoadFunc = function ( self, controller, menu )
	local f12_local0 = self.m_ownerController
	EmblemEditor_SetupEditorBasedOnMode( self, self, f12_local0 )
	self.isRightStickRepeated = false
	f0_local4( self, f12_local0 )
	if IsPaintshop( f12_local0 ) and Dvar.ui_disablePSControlWidgets:get() == true then
		self.editorControlsGuide:setAlpha( 0 )
		self.layerProperties:setAlpha( 0 )
		self.paintshopControls:setAlpha( 0 )
		self.choosePaintSide:setAlpha( 0 )
	end
	if CoD.isPC then
		f0_local5( self, f12_local0, menu )
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemEditor.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, false, -638, 642 )
	Background:setTopBottom( false, false, -360, 360 )
	Background:setScale( 1 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local editorBackground = LUI.UIImage.new()
	editorBackground:setLeftRight( true, true, 0, 0 )
	editorBackground:setTopBottom( true, true, 0, 0 )
	editorBackground:setRGB( 0, 0, 0 )
	editorBackground:setAlpha( 0.75 )
	self:addElement( editorBackground )
	self.editorBackground = editorBackground
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 109, -109 )
	StartMenuBackground0:setAlpha( 0.37 )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local layerCarousel = LUI.UIList.new( self, controller, 2, 200, nil, false, true, 595, 0, false, false )
	layerCarousel:makeFocusable()
	layerCarousel:setLeftRight( true, true, 0, 0 )
	layerCarousel:setTopBottom( true, false, 489, 609 )
	layerCarousel:setDataSource( "EmblemLayerList" )
	layerCarousel:setWidgetType( CoD.EmblemLayerContainer )
	layerCarousel:setHorizontalCount( 16 )
	layerCarousel:linkToElementModel( layerCarousel, "isGrouped", true, function ( model )
		local f16_local0 = layerCarousel
		local f16_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isGrouped"
		}
		CoD.Menu.UpdateButtonShownState( f16_local0, self, controller, Enum.LUIButton.LUI_KEY_RTRIG )
		CoD.Menu.UpdateButtonShownState( f16_local0, self, controller, Enum.LUIButton.LUI_KEY_LB )
	end )
	layerCarousel:linkToElementModel( layerCarousel, "isLinked", true, function ( model )
		local f17_local0 = layerCarousel
		local f17_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLinked"
		}
		CoD.Menu.UpdateButtonShownState( f17_local0, self, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	layerCarousel:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f18_local0 = nil
		EmblemEditor_LayerGainFocus( self, self, element, controller )
		UpdateElementState( self, "layermofn", controller )
		UpdateElementState( self, "browseControlBar", controller )
		UpdateElementState( self, "clipboard", controller )
		PlayClipOnElement( self, {
			elementName = "emblemHiddenPulseLayer",
			clipName = "DefaultClip"
		}, controller )
		return f18_local0
	end )
	layerCarousel:registerEventHandler( "gain_focus", function ( element, event )
		local f19_local0 = nil
		if element.gainFocus then
			f19_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f19_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RTRIG )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
		return f19_local0
	end )
	layerCarousel:registerEventHandler( "lose_focus", function ( element, event )
		local f20_local0 = nil
		if element.loseFocus then
			f20_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f20_local0 = element.super:loseFocus( event )
		end
		return f20_local0
	end )
	self:AddButtonCallbackFunction( layerCarousel, controller, Enum.LUIButton.LUI_KEY_RTRIG, nil, function ( element, menu, controller, model )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and not Emblem_IsLayerGrouped( element, controller ) and not IsRepeatButtonPress( model ) and not Paintjobs_DisableGroupsFeature() then
			EmblemEditor_LinkUnlinkLayers( self, element, controller )
			UpdateElementState( self, "browseControlBar", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RTRIG, "" )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and not Emblem_IsLayerGrouped( element, controller ) and not IsRepeatButtonPress( nil ) and not Paintjobs_DisableGroupsFeature() then
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and Emblem_IsLayerGrouped( element, controller ) and not Paintjobs_DisableGroupsFeature() then
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and Emblems_IsLayerLinked( element, controller ) and not IsRepeatButtonPress( nil ) and not Paintjobs_DisableGroupsFeature() then
			return false
		else
			return false
		end
	end, false )
	layerCarousel:mergeStateConditions( {
		{
			stateName = "EditMode_Selected",
			condition = function ( menu, element, event )
				return not IsParentListInFocus( element )
			end
		}
	} )
	self:addElement( layerCarousel )
	self.layerCarousel = layerCarousel
	
	local emblemDrawWidget = CoD.EmblemDrawWidgetNew.new( self, controller )
	emblemDrawWidget:setLeftRight( true, false, 390, 890 )
	emblemDrawWidget:setTopBottom( true, false, 130, 441 )
	self:addElement( emblemDrawWidget )
	self.emblemDrawWidget = emblemDrawWidget
	
	local emblemHiddenPulseLayer = CoD.EmblemPulseLayerWidget.new( self, controller )
	emblemHiddenPulseLayer:setLeftRight( true, false, 400, 880 )
	emblemHiddenPulseLayer:setTopBottom( true, false, 140, 431 )
	self:addElement( emblemHiddenPulseLayer )
	self.emblemHiddenPulseLayer = emblemHiddenPulseLayer
	
	local layerProperties = CoD.EmblemEditorLayerProperties.new( self, controller )
	layerProperties:setLeftRight( false, true, -364, -195 )
	layerProperties:setTopBottom( true, false, 130, 321 )
	layerProperties:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", nil, function ( model )
		layerProperties:setModel( model, controller )
	end )
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
	self:addElement( layerProperties )
	self.layerProperties = layerProperties
	
	local clipboard = CoD.EmblemIconClipboard.new( self, controller )
	clipboard:setLeftRight( true, false, 916, 1073 )
	clipboard:setTopBottom( true, false, 231, 391 )
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
				local f33_local0
				if not IsGroupSlotAvailable( controller ) then
					f33_local0 = IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE )
					if f33_local0 then
						f33_local0 = IsClipboardEmblemGrouped( controller )
					end
				else
					f33_local0 = false
				end
				return f33_local0
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
	self:addElement( clipboard )
	self.clipboard = clipboard
	
	local choosePaintSide = CoD.PaintshopChoosePaintSide.new( self, controller )
	choosePaintSide:setLeftRight( false, true, -383.33, -133.33 )
	choosePaintSide:setTopBottom( true, false, 114, 164 )
	choosePaintSide:setAlpha( 0 )
	choosePaintSide:subscribeToGlobalModel( controller, "Customization", "view_string_ref", function ( model )
		local viewStringRef = Engine.GetModelValue( model )
		if viewStringRef then
			choosePaintSide.PaintshopChooseSide.text:setText( Engine.Localize( viewStringRef ) )
		end
	end )
	choosePaintSide:mergeStateConditions( {
		{
			stateName = "BrowseModeControlsState_PC",
			condition = function ( menu, element, event )
				local f37_local0 = IsPaintshop( controller )
				if f37_local0 then
					if not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT ) then
						f37_local0 = not IsGamepad( controller )
					else
						f37_local0 = false
					end
				end
				return f37_local0
			end
		},
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
	if choosePaintSide.m_eventHandlers.input_source_changed then
		local PaintshopControlsFull = choosePaintSide.m_eventHandlers.input_source_changed
		choosePaintSide:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or self
			element:updateState( event )
			return PaintshopControlsFull( element, event )
		end )
	else
		choosePaintSide:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	choosePaintSide:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		self:updateElementState( choosePaintSide, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( choosePaintSide )
	self.choosePaintSide = choosePaintSide
	
	local PaintshopControlsFull = CoD.PaintshopControlsFull.new( self, controller )
	PaintshopControlsFull:setLeftRight( true, false, 110, 360 )
	PaintshopControlsFull:setTopBottom( true, false, 130, 474 )
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
				local f44_local0
				if not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.scaleMode", Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED ) then
					f44_local0 = IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
				else
					f44_local0 = false
				end
				return f44_local0
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
	self:addElement( PaintshopControlsFull )
	self.PaintshopControlsFull = PaintshopControlsFull
	
	local mouseInstructions = CoD.CraftEmblemEditMouseInstructions.new( self, controller )
	mouseInstructions:setLeftRight( true, false, 916, 1085 )
	mouseInstructions:setTopBottom( true, false, 331.5, 411.5 )
	mouseInstructions:setAlpha( 0 )
	mouseInstructions:mergeStateConditions( {
		{
			stateName = "MaterialScale",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
			end
		}
	} )
	mouseInstructions:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.editorMode" ), function ( model )
		self:updateElementState( mouseInstructions, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.editorMode"
		} )
	end )
	self:addElement( mouseInstructions )
	self.mouseInstructions = mouseInstructions
	
	local EmblemEditorFrame = CoD.GenericMenuFrame.new( self, controller )
	EmblemEditorFrame:setLeftRight( true, true, 0, 0 )
	EmblemEditorFrame:setTopBottom( true, true, 0, 0 )
	EmblemEditorFrame.titleLabel:setText( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
	EmblemEditorFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
	EmblemEditorFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( EmblemEditorFrame )
	self.EmblemEditorFrame = EmblemEditorFrame
	
	local PaintshopFrame = CoD.GenericMenuFrame.new( self, controller )
	PaintshopFrame:setLeftRight( true, true, 0, 0 )
	PaintshopFrame:setTopBottom( true, true, 0, 0 )
	PaintshopFrame:setAlpha( 0 )
	PaintshopFrame.titleLabel:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	PaintshopFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	PaintshopFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_paintshop" ) )
	self:addElement( PaintshopFrame )
	self.PaintshopFrame = PaintshopFrame
	
	local browseControlBar = CoD.EmblemBrowseControlsBar.new( self, controller )
	browseControlBar:setLeftRight( true, true, 0, 0 )
	browseControlBar:setTopBottom( false, true, -36, 0 )
	browseControlBar:registerEventHandler( "menu_loaded", function ( element, event )
		local f50_local0 = nil
		SizeToSafeArea( element, controller )
		if not f50_local0 then
			f50_local0 = element:dispatchEventToChildren( event )
		end
		return f50_local0
	end )
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
	self:addElement( browseControlBar )
	self.browseControlBar = browseControlBar
	
	local layermofn = CoD.layermofn.new( self, controller )
	layermofn:setLeftRight( true, false, 504.67, 759.67 )
	layermofn:setTopBottom( true, false, 609, 664 )
	layermofn:mergeStateConditions( {
		{
			stateName = "EmptyLayer",
			condition = function ( menu, element, event )
				return IsLayerEmpty( self, element, controller )
			end
		}
	} )
	self:addElement( layermofn )
	self.layermofn = layermofn
	
	local actionsListPC = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	actionsListPC:makeFocusable()
	actionsListPC:setLeftRight( true, false, 64, 314 )
	actionsListPC:setTopBottom( true, false, 109, 437 )
	actionsListPC:setAlpha( 0 )
	actionsListPC:setDataSource( "CraftActionsPC" )
	actionsListPC:setWidgetType( CoD.CraftActionHeader )
	actionsListPC:setVerticalCount( 15 )
	self:addElement( actionsListPC )
	self.actionsListPC = actionsListPC
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	emblemHiddenPulseLayer:linkToElementModel( layerCarousel, nil, false, function ( model )
		emblemHiddenPulseLayer:setModel( model, controller )
	end )
	emblemHiddenPulseLayer:linkToElementModel( layerCarousel, "layerAndGroupIndex", true, function ( model )
		local layerAndGroupIndex = Engine.GetModelValue( model )
		if layerAndGroupIndex then
			emblemHiddenPulseLayer.emblemHiddenPulseLayer:setupHiddenEmblemLayer( GetEmblemLayerAndGroupIndex( controller, layerAndGroupIndex ) )
		end
	end )
	browseControlBar:linkToElementModel( layerCarousel, nil, false, function ( model )
		browseControlBar:setModel( model, controller )
	end )
	layermofn:linkToElementModel( layerCarousel, nil, false, function ( model )
		layermofn:setModel( model, controller )
	end )
	layermofn:linkToElementModel( layerCarousel, "layerNumberString", true, function ( model )
		local layerNumberString = Engine.GetModelValue( model )
		if layerNumberString then
			layermofn.layerMOfN:setText( Engine.Localize( LocalizeLayerMOfN( "MENU_EMBLEM_LAYER_M_OF_N", controller, layerNumberString ) ) )
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				editorBackground:completeAnimation()
				self.editorBackground:setAlpha( 0.75 )
				self.clipFinished( editorBackground, {} )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0.37 )
				self.clipFinished( StartMenuBackground0, {} )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setLeftRight( true, false, 390, 890 )
				self.emblemDrawWidget:setTopBottom( true, false, 130, 441 )
				self.emblemDrawWidget:setAlpha( 1 )
				self.clipFinished( emblemDrawWidget, {} )
				emblemHiddenPulseLayer:completeAnimation()
				self.emblemHiddenPulseLayer:setAlpha( 1 )
				self.clipFinished( emblemHiddenPulseLayer, {} )
				clipboard:completeAnimation()
				self.clipboard:setLeftRight( true, false, 1048, 1217.5 )
				self.clipboard:setTopBottom( true, false, 231, 391 )
				self.clipboard:setAlpha( 0.89 )
				self.clipFinished( clipboard, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 1 )
				self.clipFinished( choosePaintSide, {} )
				PaintshopControlsFull:completeAnimation()
				self.PaintshopControlsFull:setLeftRight( true, false, 64, 314 )
				self.PaintshopControlsFull:setTopBottom( true, false, 108.5, 424.5 )
				self.PaintshopControlsFull:setAlpha( 0 )
				self.clipFinished( PaintshopControlsFull, {} )
				mouseInstructions:completeAnimation()
				self.mouseInstructions:setAlpha( 0 )
				self.clipFinished( mouseInstructions, {} )
				browseControlBar:completeAnimation()
				self.browseControlBar:setAlpha( 1 )
				self.clipFinished( browseControlBar, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setAlpha( 0 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		EmblemEditor_PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				editorBackground:completeAnimation()
				self.editorBackground:setAlpha( 0.75 )
				self.clipFinished( editorBackground, {} )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0.37 )
				self.clipFinished( StartMenuBackground0, {} )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setLeftRight( true, false, 390, 890 )
				self.emblemDrawWidget:setTopBottom( true, false, 130, 441 )
				self.emblemDrawWidget:setAlpha( 1 )
				self.clipFinished( emblemDrawWidget, {} )
				emblemHiddenPulseLayer:completeAnimation()
				self.emblemHiddenPulseLayer:setAlpha( 1 )
				self.clipFinished( emblemHiddenPulseLayer, {} )
				clipboard:completeAnimation()
				self.clipboard:setAlpha( 1 )
				self.clipFinished( clipboard, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 0 )
				self.clipFinished( choosePaintSide, {} )
				PaintshopControlsFull:completeAnimation()
				self.PaintshopControlsFull:setAlpha( 0 )
				self.clipFinished( PaintshopControlsFull, {} )
				mouseInstructions:completeAnimation()
				self.mouseInstructions:setAlpha( 1 )
				self.clipFinished( mouseInstructions, {} )
				EmblemEditorFrame:completeAnimation()
				self.EmblemEditorFrame:setAlpha( 1 )
				self.clipFinished( EmblemEditorFrame, {} )
				PaintshopFrame:completeAnimation()
				self.PaintshopFrame:setAlpha( 0 )
				self.clipFinished( PaintshopFrame, {} )
				browseControlBar:completeAnimation()
				self.browseControlBar:setAlpha( 0 )
				self.clipFinished( browseControlBar, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setAlpha( 1 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		EmblemEditor = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				editorBackground:completeAnimation()
				self.editorBackground:setAlpha( 0.75 )
				self.clipFinished( editorBackground, {} )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0.37 )
				self.clipFinished( StartMenuBackground0, {} )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setLeftRight( true, false, 390, 890 )
				self.emblemDrawWidget:setTopBottom( true, false, 130, 441 )
				self.emblemDrawWidget:setAlpha( 1 )
				self.clipFinished( emblemDrawWidget, {} )
				emblemHiddenPulseLayer:completeAnimation()
				self.emblemHiddenPulseLayer:setAlpha( 1 )
				self.clipFinished( emblemHiddenPulseLayer, {} )
				clipboard:completeAnimation()
				self.clipboard:setAlpha( 1 )
				self.clipFinished( clipboard, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 0 )
				self.clipFinished( choosePaintSide, {} )
				PaintshopControlsFull:completeAnimation()
				self.PaintshopControlsFull:setAlpha( 1 )
				self.clipFinished( PaintshopControlsFull, {} )
				mouseInstructions:completeAnimation()
				self.mouseInstructions:setAlpha( 0 )
				self.clipFinished( mouseInstructions, {} )
				EmblemEditorFrame:completeAnimation()
				self.EmblemEditorFrame:setAlpha( 1 )
				self.clipFinished( EmblemEditorFrame, {} )
				PaintshopFrame:completeAnimation()
				self.PaintshopFrame:setAlpha( 0 )
				self.clipFinished( PaintshopFrame, {} )
				browseControlBar:completeAnimation()
				self.browseControlBar:setAlpha( 1 )
				self.clipFinished( browseControlBar, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setAlpha( 0 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		Paintshop_PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
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
				self.emblemDrawWidget:setLeftRight( true, false, 337.17, 1029.25 )
				self.emblemDrawWidget:setTopBottom( true, false, 123.5, 406.5 )
				self.emblemDrawWidget:setAlpha( 0.01 )
				self.clipFinished( emblemDrawWidget, {} )
				emblemHiddenPulseLayer:completeAnimation()
				self.emblemHiddenPulseLayer:setAlpha( 0 )
				self.clipFinished( emblemHiddenPulseLayer, {} )
				layerProperties:completeAnimation()
				self.layerProperties:setLeftRight( false, true, -232, -64 )
				self.layerProperties:setTopBottom( true, false, 140, 329 )
				self.clipFinished( layerProperties, {} )
				clipboard:completeAnimation()
				self.clipboard:setLeftRight( true, false, 1048, 1216 )
				self.clipboard:setTopBottom( true, false, 231, 391 )
				self.clipboard:setAlpha( 1 )
				self.clipFinished( clipboard, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setLeftRight( false, true, -232, -64 )
				self.choosePaintSide:setTopBottom( true, false, 111, 138 )
				self.choosePaintSide:setAlpha( 1 )
				self.clipFinished( choosePaintSide, {} )
				PaintshopControlsFull:completeAnimation()
				self.PaintshopControlsFull:setLeftRight( true, false, 64, 314 )
				self.PaintshopControlsFull:setTopBottom( true, false, 109, 452.5 )
				self.PaintshopControlsFull:setAlpha( 0 )
				self.clipFinished( PaintshopControlsFull, {} )
				mouseInstructions:completeAnimation()
				self.mouseInstructions:setLeftRight( true, false, 1047, 1216 )
				self.mouseInstructions:setTopBottom( true, false, 337.5, 417.5 )
				self.mouseInstructions:setAlpha( 1 )
				self.clipFinished( mouseInstructions, {} )
				EmblemEditorFrame:completeAnimation()
				self.EmblemEditorFrame:setAlpha( 0 )
				self.clipFinished( EmblemEditorFrame, {} )
				PaintshopFrame:completeAnimation()
				self.PaintshopFrame:setAlpha( 1 )
				self.clipFinished( PaintshopFrame, {} )
				browseControlBar:completeAnimation()
				self.browseControlBar:setAlpha( 0 )
				self.clipFinished( browseControlBar, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setAlpha( 1 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		Paintshop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
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
				self.emblemDrawWidget:setLeftRight( true, false, 337.17, 1029.25 )
				self.emblemDrawWidget:setTopBottom( true, false, 123.5, 406.5 )
				self.emblemDrawWidget:setAlpha( 0 )
				self.clipFinished( emblemDrawWidget, {} )
				emblemHiddenPulseLayer:completeAnimation()
				self.emblemHiddenPulseLayer:setAlpha( 0 )
				self.clipFinished( emblemHiddenPulseLayer, {} )
				layerProperties:completeAnimation()
				self.layerProperties:setLeftRight( false, true, -232, -64 )
				self.layerProperties:setTopBottom( true, false, 140, 329 )
				self.clipFinished( layerProperties, {} )
				clipboard:completeAnimation()
				self.clipboard:setLeftRight( true, false, 1048, 1216 )
				self.clipboard:setTopBottom( true, false, 231, 391 )
				self.clipboard:setAlpha( 1 )
				self.clipFinished( clipboard, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setLeftRight( false, true, -232, -64 )
				self.choosePaintSide:setTopBottom( true, false, 111, 138 )
				self.choosePaintSide:setAlpha( 1 )
				self.clipFinished( choosePaintSide, {} )
				PaintshopControlsFull:completeAnimation()
				self.PaintshopControlsFull:setLeftRight( true, false, 64, 314 )
				self.PaintshopControlsFull:setTopBottom( true, false, 109, 452.5 )
				self.PaintshopControlsFull:setAlpha( 1 )
				self.clipFinished( PaintshopControlsFull, {} )
				mouseInstructions:completeAnimation()
				self.mouseInstructions:setLeftRight( true, false, 1047, 1216 )
				self.mouseInstructions:setTopBottom( true, false, 337.5, 417.5 )
				self.mouseInstructions:setAlpha( 0 )
				self.clipFinished( mouseInstructions, {} )
				EmblemEditorFrame:completeAnimation()
				self.EmblemEditorFrame:setAlpha( 0 )
				self.clipFinished( EmblemEditorFrame, {} )
				PaintshopFrame:completeAnimation()
				self.PaintshopFrame:setAlpha( 1 )
				self.clipFinished( PaintshopFrame, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setAlpha( 0 )
				self.clipFinished( actionsListPC, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "EmblemEditor_PC",
			condition = function ( menu, element, event )
				return IsEmblemEditor( controller ) and not IsGamepad( controller )
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
				return IsPaintshop( controller ) and not IsGamepad( controller )
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
		local f14_local19 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return f14_local19( self, event )
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
		local f73_local0 = self
		local f73_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.editorMode"
		}
		CoD.Menu.UpdateButtonShownState( f73_local0, self, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f74_local0 = nil
		if IsEmblemEditor( controller ) then
			ShowHeaderIconOnly( self )
		elseif IsPaintshop( controller ) then
			ShowHeaderKickerAndIcon( self )
			SetHeadingKickerTextToSelectedWeapon( controller )
		end
		if not f74_local0 then
			f74_local0 = self:dispatchEventToChildren( event )
		end
		return f74_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
		if IsEditMode( controller ) then
			return false
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) then
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) then
			return false
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and not Emblem_IsLayerGroupedByLayerIndex( element, controller ) then
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
		if IsEditMode( controller ) then
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
		if IsEditMode( controller ) then
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, nil, function ( element, menu, controller, model )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_BACK, "" )
		if IsEditMode( controller ) then
			return false
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) then
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) and not IsDemoBuildBeta() then
			EmblemEditor_EndEdit( self, element, controller )
			OpenPopup( self, "PaintshopLayerOptions", controller )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		elseif IsBrowseMode( controller ) and not IsClipboardEmpty( controller ) and Emblem_CanPastFromClipboard( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "" )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "PLATFORM_EMBLEM_EDIT_DONE" )
			return true
		elseif IsEditMode( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		elseif IsBrowseMode( controller ) and IsPaintshop( controller ) and not IsPaintjobAllSidesEmpty( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		elseif IsBrowseMode( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_APPLY_CHANGES" )
		if IsEditMode( controller ) then
			return true
		elseif not IsLayerEmpty( self, element, controller ) then
			return true
		elseif IsLayerEmpty( self, element, controller ) then
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
		if IsEditMode( controller ) then
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, nil, function ( element, menu, controller, model )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and IsDpadButton( model ) and Emblem_IsAnyLayerEmpty( controller ) then
			EmblemEditor_InsertDecalPressed( self, element, controller )
			NavigateToMenu( self, "EmblemChooseIcon", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_DOWN, "" )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and IsDpadButton( nil ) and Emblem_IsAnyLayerEmpty( controller ) then
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, nil, function ( element, menu, controller, model )
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) and IsDpadButton( model ) then
			EmblemEditor_EndEdit( self, element, controller )
			NavigateToMenu( self, "EmblemEditorMaterialPicker", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_UP, "" )
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) and IsDpadButton( nil ) then
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LEFT, "" )
		local f98_local0 = nil
		if IsEditMode( controller ) and IsDpadButton( f98_local0 ) and not IsRepeatButtonPress( f98_local0 ) then
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RIGHT, "" )
		local f100_local0 = nil
		if IsEditMode( controller ) and IsDpadButton( f100_local0 ) and not IsRepeatButtonPress( f100_local0 ) then
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.layerCarousel:close()
		element.emblemDrawWidget:close()
		element.emblemHiddenPulseLayer:close()
		element.layerProperties:close()
		element.clipboard:close()
		element.choosePaintSide:close()
		element.PaintshopControlsFull:close()
		element.mouseInstructions:close()
		element.EmblemEditorFrame:close()
		element.PaintshopFrame:close()
		element.browseControlBar:close()
		element.layermofn:close()
		element.actionsListPC:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemEditor.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

