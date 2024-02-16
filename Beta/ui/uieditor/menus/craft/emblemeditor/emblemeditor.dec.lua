require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemIconColorPicker" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemEditorSaveChanges" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemChooseIcon" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemEditorMaterialPicker" )
require( "ui.uieditor.menus.Craft.Paintshop.PaintjobSaveChanges" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemLayerContainer" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorLayerProperties" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemIconClipboard" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChoosePaintSide" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopControlsFull" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemBrowseControlsBar" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.layermofn" )

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

local PostLoadFunc = function ( self )
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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemEditor.buttonPrompts" )
	local menu = self
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
	
	local HelpBacking0 = LUI.UIImage.new()
	HelpBacking0:setLeftRight( true, true, 0, 0 )
	HelpBacking0:setTopBottom( false, true, -68, 0 )
	HelpBacking0:setRGB( 0.06, 0.08, 0.09 )
	HelpBacking0:setAlpha( 0 )
	self:addElement( HelpBacking0 )
	self.HelpBacking0 = HelpBacking0
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( menu, controller )
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
	
	local CategoryListLine2 = LUI.UIImage.new()
	CategoryListLine2:setLeftRight( true, false, 0, 1280 )
	CategoryListLine2:setTopBottom( true, false, 673, 681 )
	CategoryListLine2:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine2:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine2 )
	self.CategoryListLine2 = CategoryListLine2
	
	local HelpBacking01 = LUI.UIImage.new()
	HelpBacking01:setLeftRight( true, true, 0, 0 )
	HelpBacking01:setTopBottom( false, true, -42, 14 )
	HelpBacking01:setRGB( 0, 0, 0 )
	self:addElement( HelpBacking01 )
	self.HelpBacking01 = HelpBacking01
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( menu, controller )
	TitleDotsWidget0:setLeftRight( true, false, 0, 525.34 )
	TitleDotsWidget0:setTopBottom( true, false, -70, 88 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local TitleBacking00 = LUI.UIImage.new()
	TitleBacking00:setLeftRight( true, true, 0, 0 )
	TitleBacking00:setTopBottom( true, false, -7, 84 )
	TitleBacking00:setRGB( 0, 0.01, 0.02 )
	self:addElement( TitleBacking00 )
	self.TitleBacking00 = TitleBacking00
	
	local layerCarousel = LUI.UIList.new( menu, controller, 2, 200, nil, false, true, 595, 0, false, false )
	layerCarousel:makeFocusable()
	layerCarousel:setLeftRight( true, false, -16, 2529 )
	layerCarousel:setTopBottom( true, false, 490, 610 )
	layerCarousel:setDataSource( "EmblemLayerList" )
	layerCarousel:setWidgetType( CoD.EmblemLayerContainer )
	layerCarousel:setHorizontalCount( 16 )
	layerCarousel:linkToElementModel( "isGrouped", true, function ( model )
		local element = layerCarousel
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isGrouped"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RTRIG )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LB )
	end )
	layerCarousel:linkToElementModel( "isLinked", true, function ( model )
		local element = layerCarousel
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLinked"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	layerCarousel:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		EmblemEditor_LayerGainFocus( menu, self, element, controller )
		UpdateElementState( self, "layermofn", controller )
		return retVal
	end )
	layerCarousel:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RTRIG )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RB )
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
	menu:AddButtonCallbackFunction( layerCarousel, controller, Enum.LUIButton.LUI_KEY_RTRIG, nil, function ( element, menu, controller, model )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and not Emblem_IsLayerGrouped( element, controller ) and not IsRepeatButtonPress( model ) and not IsDemoBuildBeta() then
			EmblemEditor_LinkUnlinkLayers( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RTRIG, "" )
		local model = nil
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and not Emblem_IsLayerGrouped( element, controller ) and not IsRepeatButtonPress( model ) and not IsDemoBuildBeta() then
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( layerCarousel, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and Emblem_IsLayerGrouped( element, controller ) and not IsDemoBuildBeta() then
			EmblemEditor_SaveSelectedGroup( self, element, controller, event )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and Emblem_IsLayerGrouped( element, controller ) and not IsDemoBuildBeta() then
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( layerCarousel, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and Emblems_IsLayerLinked( element, controller ) and not IsRepeatButtonPress( model ) and not IsDemoBuildBeta() then
			EmblemEditor_GroupUngroupLayers( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
		local model = nil
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and Emblems_IsLayerLinked( element, controller ) and not IsRepeatButtonPress( model ) and not IsDemoBuildBeta() then
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
	
	local emblemDrawWidget = CoD.EmblemDrawWidgetNew.new( menu, controller )
	emblemDrawWidget:setLeftRight( true, false, 390, 890 )
	emblemDrawWidget:setTopBottom( true, false, 130, 441 )
	self:addElement( emblemDrawWidget )
	self.emblemDrawWidget = emblemDrawWidget
	
	local layerProperties = CoD.EmblemEditorLayerProperties.new( menu, controller )
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
		menu:updateElementState( layerProperties, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.editorMode"
		} )
	end )
	self:addElement( layerProperties )
	self.layerProperties = layerProperties
	
	local clipboard = CoD.EmblemIconClipboard.new( menu, controller )
	clipboard:setLeftRight( true, false, 916, 1073 )
	clipboard:setTopBottom( true, false, 231, 391 )
	clipboard:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
			end
		}
	} )
	clipboard:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.editorMode" ), function ( model )
		menu:updateElementState( clipboard, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.editorMode"
		} )
	end )
	self:addElement( clipboard )
	self.clipboard = clipboard
	
	local choosePaintSide = CoD.PaintshopChoosePaintSide.new( menu, controller )
	choosePaintSide:setLeftRight( false, true, -383.33, -133.33 )
	choosePaintSide:setTopBottom( true, false, 114, 164 )
	choosePaintSide:setAlpha( 0 )
	choosePaintSide:subscribeToGlobalModel( controller, "Customization", "view_string_ref", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			choosePaintSide.PaintshopChooseSide.text:setText( Engine.Localize( modelValue ) )
		end
	end )
	choosePaintSide:mergeStateConditions( {
		{
			stateName = "BrowseModeControlsState",
			condition = function ( menu, element, event )
				local f26_local0 = IsPaintshop( controller )
				if f26_local0 then
					f26_local0 = not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
				end
				return f26_local0
			end
		}
	} )
	choosePaintSide:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.editorMode" ), function ( model )
		menu:updateElementState( choosePaintSide, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.editorMode"
		} )
	end )
	self:addElement( choosePaintSide )
	self.choosePaintSide = choosePaintSide
	
	local PaintshopControlsFull = CoD.PaintshopControlsFull.new( menu, controller )
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
				local f29_local0 = IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.scaleMode", Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED )
				if f29_local0 then
					f29_local0 = IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
				end
				return f29_local0
			end
		},
		{
			stateName = "FreeScale",
			condition = function ( menu, element, event )
				local f30_local0
				if not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.scaleMode", Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED ) then
					f30_local0 = IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
				else
					f30_local0 = false
				end
				return f30_local0
			end
		}
	} )
	PaintshopControlsFull:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.editorMode" ), function ( model )
		menu:updateElementState( PaintshopControlsFull, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.editorMode"
		} )
	end )
	PaintshopControlsFull:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.scaleMode" ), function ( model )
		menu:updateElementState( PaintshopControlsFull, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.scaleMode"
		} )
	end )
	self:addElement( PaintshopControlsFull )
	self.PaintshopControlsFull = PaintshopControlsFull
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( menu, controller )
	ElemsSideList:setLeftRight( true, false, 5, 78.87 )
	ElemsSideList:setTopBottom( true, false, 44, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local paintjobTitle = CoD.cac_3dTitleIntermediary.new( menu, controller )
	paintjobTitle:setLeftRight( true, false, -73.33, 504.67 )
	paintjobTitle:setTopBottom( true, false, -7, 139 )
	paintjobTitle:setAlpha( 0 )
	paintjobTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	paintjobTitle.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_paintshop" ) )
	paintjobTitle:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsPaintshop( controller ) then
			ShowHeaderKickerAndIcon( menu )
			SetHeadingKickerTextToSelectedWeapon( controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( paintjobTitle )
	self.paintjobTitle = paintjobTitle
	
	local emblemEditorTitle = CoD.cac_3dTitleIntermediary.new( menu, controller )
	emblemEditorTitle:setLeftRight( true, false, -77.33, 500.67 )
	emblemEditorTitle:setTopBottom( true, false, 0, 145 )
	emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
	emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	emblemEditorTitle:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsEmblemEditor( controller ) then
			ShowHeaderIconOnly( menu )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( emblemEditorTitle )
	self.emblemEditorTitle = emblemEditorTitle
	
	local browseControlBar = CoD.EmblemBrowseControlsBar.new( menu, controller )
	browseControlBar:setLeftRight( true, false, 13.5, 1280 )
	browseControlBar:setTopBottom( true, false, 678, 711 )
	browseControlBar:mergeStateConditions( {
		{
			stateName = "BrowseModeLinkedLayer",
			condition = function ( menu, element, event )
				local f35_local0 = IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE )
				if f35_local0 then
					f35_local0 = Emblems_IsLayerLinked( element, controller )
					if f35_local0 then
						f35_local0 = IsModelValueGreaterThanOrEqualTo( controller, "Emblem.EmblemProperties.linkedLayerCount", 2 )
						if f35_local0 then
							if not Emblem_IsLayerGrouped( element, controller ) then
								f35_local0 = not IsDemoBuildBeta()
							else
								f35_local0 = false
							end
						end
					end
				end
				return f35_local0
			end
		},
		{
			stateName = "BrowseModeGroupedLayer",
			condition = function ( menu, element, event )
				local f36_local0 = IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE )
				if f36_local0 then
					f36_local0 = Emblem_IsLayerGrouped( element, controller )
					if f36_local0 then
						f36_local0 = not IsDemoBuildBeta()
					end
				end
				return f36_local0
			end
		},
		{
			stateName = "BrowseModeOneLayerLinked",
			condition = function ( menu, element, event )
				local f37_local0 = Emblem_IsLayerInBrowseMode( element, controller )
				if f37_local0 then
					if not IsLayerEmpty( self, element, controller ) then
						f37_local0 = IsModelValueEqualTo( controller, "Emblem.EmblemProperties.linkedLayerCount", 1 )
						if f37_local0 then
							f37_local0 = not IsDemoBuildBeta()
						end
					else
						f37_local0 = false
					end
				end
				return f37_local0
			end
		},
		{
			stateName = "BrowseMode",
			condition = function ( menu, element, event )
				local f38_local0 = IsBrowseMode( controller )
				if f38_local0 then
					if not IsLayerEmpty( self, element, controller ) then
						f38_local0 = not IsDemoBuildBeta()
					else
						f38_local0 = false
					end
				end
				return f38_local0
			end
		},
		{
			stateName = "Beta",
			condition = function ( menu, element, event )
				local f39_local0 = IsDemoBuildBeta()
				if f39_local0 then
					f39_local0 = IsBrowseMode( controller )
					if f39_local0 then
						f39_local0 = not IsLayerEmpty( self, element, controller )
					end
				end
				return f39_local0
			end
		}
	} )
	browseControlBar:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.editorMode" ), function ( model )
		menu:updateElementState( browseControlBar, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.editorMode"
		} )
	end )
	browseControlBar:linkToElementModel( "isLinked", true, function ( model )
		menu:updateElementState( browseControlBar, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLinked"
		} )
	end )
	browseControlBar:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.linkedLayerCount" ), function ( model )
		menu:updateElementState( browseControlBar, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.linkedLayerCount"
		} )
	end )
	browseControlBar:linkToElementModel( "isGrouped", true, function ( model )
		menu:updateElementState( browseControlBar, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isGrouped"
		} )
	end )
	self:addElement( browseControlBar )
	self.browseControlBar = browseControlBar
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	leftButtonBar:setLeftRight( true, false, 10.5, 442.5 )
	leftButtonBar:setTopBottom( true, false, 679, 711 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	local layermofn = CoD.layermofn.new( menu, controller )
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
	
	browseControlBar:linkToElementModel( layerCarousel, nil, false, function ( model )
		browseControlBar:setModel( model, controller )
	end )
	layermofn:linkToElementModel( layerCarousel, nil, false, function ( model )
		layermofn:setModel( model, controller )
	end )
	layermofn:linkToElementModel( layerCarousel, "layerNumberString", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			layermofn.layerMOfN:setText( Engine.Localize( LocalizeLayerMOfN( "MENU_EMBLEM_LAYER_M_OF_N", controller, modelValue ) ) )
		end
	end )
	layerCarousel.navigation = {
		up = emblemDrawWidget
	}
	emblemDrawWidget.navigation = {
		down = layerCarousel
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
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
				self.emblemDrawWidget:setTopBottom( true, false, 102, 413 )
				self.emblemDrawWidget:setAlpha( 1 )
				self.clipFinished( emblemDrawWidget, {} )
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
				paintjobTitle:completeAnimation()
				self.paintjobTitle:setAlpha( 0 )
				self.clipFinished( paintjobTitle, {} )
				emblemEditorTitle:completeAnimation()
				emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.emblemEditorTitle:setAlpha( 1 )
				self.emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
				self.clipFinished( emblemEditorTitle, {} )
			end
		},
		EmblemEditor = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
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
				clipboard:completeAnimation()
				self.clipboard:setAlpha( 1 )
				self.clipFinished( clipboard, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 0 )
				self.clipFinished( choosePaintSide, {} )
				PaintshopControlsFull:completeAnimation()
				self.PaintshopControlsFull:setAlpha( 1 )
				self.clipFinished( PaintshopControlsFull, {} )
				paintjobTitle:completeAnimation()
				self.paintjobTitle:setAlpha( 0 )
				self.clipFinished( paintjobTitle, {} )
				emblemEditorTitle:completeAnimation()
				emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.emblemEditorTitle:setAlpha( 1 )
				self.emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
				self.clipFinished( emblemEditorTitle, {} )
			end
		},
		Paintshop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				editorBackground:completeAnimation()
				self.editorBackground:setAlpha( 0 )
				self.clipFinished( editorBackground, {} )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0 )
				self.clipFinished( StartMenuBackground0, {} )
				TitleDotsWidget0:completeAnimation()
				self.TitleDotsWidget0:setLeftRight( true, false, 0, 525.34 )
				self.TitleDotsWidget0:setTopBottom( true, false, -70, 88 )
				self.clipFinished( TitleDotsWidget0, {} )
				TitleBacking00:completeAnimation()
				self.TitleBacking00:setLeftRight( true, true, 0, 0 )
				self.TitleBacking00:setTopBottom( true, false, -7, 84 )
				self.clipFinished( TitleBacking00, {} )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setLeftRight( true, false, 337.17, 1029.25 )
				self.emblemDrawWidget:setTopBottom( true, false, 123.5, 406.5 )
				self.emblemDrawWidget:setAlpha( 0 )
				self.clipFinished( emblemDrawWidget, {} )
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
				paintjobTitle:completeAnimation()
				paintjobTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.paintjobTitle:setLeftRight( true, false, -77.33, 500.67 )
				self.paintjobTitle:setTopBottom( true, false, 0, 146 )
				self.paintjobTitle:setAlpha( 1 )
				self.paintjobTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
				self.clipFinished( paintjobTitle, {} )
				emblemEditorTitle:completeAnimation()
				emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.emblemEditorTitle:setAlpha( 0 )
				self.emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_PAINTJOB" ) )
				self.clipFinished( emblemEditorTitle, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "EmblemEditor",
			condition = function ( menu, element, event )
				return IsEmblemEditor( controller )
			end
		},
		{
			stateName = "Paintshop",
			condition = function ( menu, element, event )
				return IsPaintshop( controller )
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( element, menu, controller, model )
		if IsEditMode( controller ) then
			EmblemEditor_ToggleOutline( self, element, controller )
			PlaySoundSetSound( self, "toggle_outline" )
			return true
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and not IsPC() then
			EmblemEditor_CutLayer( self, element, controller )
			EmblemEditor_UpdateLayerData( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
		if IsEditMode( controller ) then
			return false
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and not IsPC() then
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "E", function ( element, menu, controller, model )
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) then
			EmblemEditor_EndEdit( self, element, controller )
			NavigateToMenu( self, "EmblemIconColorPicker", true, controller )
			EmblemChooseColor_ClearSelectedLayerMaterial( self, element, controller )
			return true
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and not Emblem_IsLayerGroupedByLayerIndex( element, controller ) and not IsPC() then
			NavigateToMenu( self, "EmblemChooseIcon", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) then
			return false
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and not Emblem_IsLayerGroupedByLayerIndex( element, controller ) and not IsPC() then
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "R", function ( element, menu, controller, model )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) then
			EmblemEditor_CutLayer( self, element, controller )
			EmblemEditor_UpdateLayerData( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) then
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, "F", function ( element, menu, controller, model )
		if IsEditMode( controller ) then
			EmblemEditor_FlipIcon( self, element, controller )
			PlaySoundSetSound( self, "flip_image" )
			return true
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) then
			EmblemEditor_CopyLayerToClipboard( self, element, controller )
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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) and not IsDemoBuildBeta() then
			EmblemEditor_EndEdit( self, element, controller )
			EmblemEditor_OpenLayerOptionsPopup( self, element, controller )
			PlaySoundSetSound( self, "options" )
			return true
		elseif IsBrowseMode( controller ) and not IsClipboardEmpty( controller ) then
			EmblemEditor_InsertLayer( self, element, controller )
			EmblemEditor_UpdateLayerData( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) and not IsDemoBuildBeta() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		elseif IsBrowseMode( controller ) and not IsClipboardEmpty( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsBrowseMode( controller ) and IsEmblemEditor( controller ) then
			OpenPopup( self, "EmblemEditorSaveChanges", controller )
			PlaySoundSetSound( self, "save_box" )
			return true
		elseif IsEditMode( controller ) then
			EmblemEditor_HandleBackInEditMode( self, element, controller )
			PlaySoundSetSound( self, "list_action" )
			return true
		elseif IsBrowseMode( controller ) and IsPaintshop( controller ) then
			OpenPopup( self, "PaintjobSaveChanges", controller )
			PlaySoundSetSound( self, "save_box" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsBrowseMode( controller ) and IsEmblemEditor( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "PLATFORM_EMBLEM_EDIT_DONE" )
			return true
		elseif IsEditMode( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		elseif IsBrowseMode( controller ) and IsPaintshop( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsEditMode( controller ) then
			EmblemEditor_HandleBackInEditMode( self, element, controller )
			return true
		elseif not IsLayerEmpty( self, element, controller ) then
			EmblemEditor_EditSelectedLayer( self, element, controller )
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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, nil, function ( element, menu, controller, model )
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and IsDpadButton( model ) then
			EmblemEditor_InsertDecalPressed( self, element, controller )
			NavigateToMenu( self, "EmblemChooseIcon", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_DOWN, "" )
		local model = nil
		if IsBrowseMode( controller ) and not IsLayerEmpty( self, element, controller ) and IsDpadButton( model ) then
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, "E", function ( element, menu, controller, model )
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) and IsDpadButton( model ) then
			EmblemEditor_EndEdit( self, element, controller )
			NavigateToMenu( self, "EmblemEditorMaterialPicker", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_UP, "" )
		local model = nil
		if IsEditMode( controller ) and not IsLayerEmpty( self, element, controller ) and IsDpadButton( model ) then
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, function ( element, menu, controller, model )
		if IsEditMode( controller ) and IsDpadButton( model ) and not IsRepeatButtonPress( model ) then
			EmblemEditor_MoveLayer( self, element, controller, "left" )
			PlaySoundSetSound( self, "layer_switch" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LEFT, "" )
		local model = nil
		if IsEditMode( controller ) and IsDpadButton( model ) and not IsRepeatButtonPress( model ) then
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( element, menu, controller, model )
		if IsEditMode( controller ) and IsDpadButton( model ) and not IsRepeatButtonPress( model ) then
			EmblemEditor_MoveLayer( self, element, controller, "right" )
			PlaySoundSetSound( self, "layer_switch" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RIGHT, "" )
		local model = nil
		if IsEditMode( controller ) and IsDpadButton( model ) and not IsRepeatButtonPress( model ) then
			return false
		else
			return false
		end
	end, false )
	layerCarousel.id = "layerCarousel"
	emblemDrawWidget.id = "emblemDrawWidget"
	leftButtonBar:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.layerCarousel:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.TitleDotsWidget0:close()
		self.layerCarousel:close()
		self.emblemDrawWidget:close()
		self.layerProperties:close()
		self.clipboard:close()
		self.choosePaintSide:close()
		self.PaintshopControlsFull:close()
		self.ElemsSideList:close()
		self.paintjobTitle:close()
		self.emblemEditorTitle:close()
		self.browseControlBar:close()
		self.leftButtonBar:close()
		self.layermofn:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemEditor.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

