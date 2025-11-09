require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemIconColorPicker" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemChooseIcon" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemEditorMaterialPicker" )
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
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopControls" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemEditorClearLayer" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemEditorLayerOptions" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemEditorSaveChanges" )

local PostLoadFunc = function ( self )
	local controller = self.m_ownerController
	EmblemEditor_SetupEditorBasedOnMode( self, self, controller )
	local leftButtonPressed = false
	local rightButtonPressed = false
	local gamepadButtonEventHandler = self.m_eventHandlers.gamepad_button
	self.m_eventHandlers.gamepad_button = function ( self, event )
		local retVal = gamepadButtonEventHandler( self, event )
		if not self.occludedBy and (not (event.button ~= "left" or event.qualifier ~= "dpad") or event.button == "key_shortcut" and event.key == "A") and IsEditMode( controller ) then
			if leftButtonPressed == false and event.down == true then
				EmblemEditor_MoveLayer( self, nil, controller, "left" )
				leftButtonPressed = true
			end
			if leftButtonPressed == true and event.down == false then
				leftButtonPressed = false
			end
		end
		if not self.occludedBy and (not (event.button ~= "right" or event.qualifier ~= "dpad") or event.button == "key_shortcut" and event.key == "A") and IsEditMode( controller ) then
			if rightButtonPressed == false and event.down == true then
				EmblemEditor_MoveLayer( self, nil, controller, "right" )
				rightButtonPressed = true
			end
			if rightButtonPressed == true and event.down == false then
				rightButtonPressed = false
			end
		end
		return retVal
	end
	
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
	self.anyChildUsesUpdateState = true
	
	local editorBackground = LUI.UIImage.new()
	editorBackground:setLeftRight( true, true, 0, 0 )
	editorBackground:setTopBottom( true, true, 0, 0 )
	editorBackground:setRGB( 0, 0, 0 )
	editorBackground:setAlpha( 0 )
	editorBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( editorBackground )
	self.editorBackground = editorBackground
	
	local HelpBacking0 = LUI.UIImage.new()
	HelpBacking0:setLeftRight( true, true, 0, 0 )
	HelpBacking0:setTopBottom( false, true, -68, 0 )
	HelpBacking0:setRGB( 0.06, 0.08, 0.09 )
	HelpBacking0:setAlpha( 0.6 )
	HelpBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HelpBacking0 )
	self.HelpBacking0 = HelpBacking0
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 109, -109 )
	StartMenuBackground0:setRGB( 1, 1, 1 )
	StartMenuBackground0:setAlpha( 0 )
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
	
	local HelpBacking00 = LUI.UIImage.new()
	HelpBacking00:setLeftRight( true, true, 0, 0 )
	HelpBacking00:setTopBottom( false, false, 292, 294 )
	HelpBacking00:setRGB( 0.01, 0.02, 0.02 )
	HelpBacking00:setAlpha( 0.7 )
	HelpBacking00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HelpBacking00 )
	self.HelpBacking00 = HelpBacking00
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( true, true, 0, 0 )
	TitleBacking0:setTopBottom( true, false, -7, 81 )
	TitleBacking0:setRGB( 0.06, 0.08, 0.09 )
	TitleBacking0:setAlpha( 0.6 )
	TitleBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local HelpBacking01 = LUI.UIImage.new()
	HelpBacking01:setLeftRight( true, true, 0, 0 )
	HelpBacking01:setTopBottom( false, true, -68, 0 )
	HelpBacking01:setRGB( 0, 0, 0 )
	HelpBacking01:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HelpBacking01 )
	self.HelpBacking01 = HelpBacking01
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( true, false, 0, 525.34 )
	TitleDotsWidget0:setTopBottom( true, false, -70, 88 )
	TitleDotsWidget0:setRGB( 1, 1, 1 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local TitleBacking00 = LUI.UIImage.new()
	TitleBacking00:setLeftRight( true, true, 0, 0 )
	TitleBacking00:setTopBottom( true, false, -7, 80 )
	TitleBacking00:setRGB( 0, 0.01, 0.02 )
	TitleBacking00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking00 )
	self.TitleBacking00 = TitleBacking00
	
	local layerCarousel = LUI.UIList.new( self, controller, 0.5, 200, nil, false, true, 595, 0, false, false )
	layerCarousel:makeFocusable()
	layerCarousel:setLeftRight( true, false, 0, 2042.5 )
	layerCarousel:setTopBottom( true, false, 529, 619 )
	layerCarousel:setRGB( 1, 1, 1 )
	layerCarousel:setDataSource( "EmblemLayerList" )
	layerCarousel:setWidgetType( CoD.EmblemLayerContainer )
	layerCarousel:setHorizontalCount( 16 )
	layerCarousel:setSpacing( 0.5 )
	layerCarousel:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		EmblemEditor_LayerGainFocus( self, element, controller )
		return retVal
	end )
	layerCarousel:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsLayerEmpty( element, controller ) then
			EmblemEditor_EditSelectedLayer( self, element, controller, self )
		elseif IsLayerEmpty( element, controller ) then
			NavigateToMenu( self, "EmblemChooseIcon", true, controller )
		end
		return retVal
	end )
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
	emblemDrawWidget:setLeftRight( true, false, 337.17, 694.25 )
	emblemDrawWidget:setTopBottom( true, false, 123.5, 406.5 )
	emblemDrawWidget:setRGB( 1, 1, 1 )
	emblemDrawWidget:setAlpha( 0 )
	self:addElement( emblemDrawWidget )
	self.emblemDrawWidget = emblemDrawWidget
	
	local layerProperties = CoD.EmblemEditorLayerProperties.new( self, controller )
	layerProperties:setLeftRight( false, true, -232, -64 )
	layerProperties:setTopBottom( true, false, 139, 300 )
	layerProperties:setRGB( 1, 1, 1 )
	layerProperties:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", nil, function ( model )
		layerProperties:setModel( model, controller )
	end )
	layerProperties:mergeStateConditions( {
		{
			stateName = "BrowseModeLayerProperties",
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
	clipboard:setLeftRight( true, false, 1048, 1216 )
	clipboard:setTopBottom( true, false, 170, 330 )
	clipboard:setRGB( 1, 1, 1 )
	clipboard:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
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
	self:addElement( clipboard )
	self.clipboard = clipboard
	
	local choosePaintSide = CoD.PaintshopChoosePaintSide.new( self, controller )
	choosePaintSide:setLeftRight( false, true, -232, -64 )
	choosePaintSide:setTopBottom( true, false, 110, 137 )
	choosePaintSide:setRGB( 1, 1, 1 )
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
	self:addElement( choosePaintSide )
	self.choosePaintSide = choosePaintSide
	
	local layerMOfN = LUI.UIText.new()
	layerMOfN:setLeftRight( true, false, 390, 890 )
	layerMOfN:setTopBottom( true, false, 630, 646 )
	layerMOfN:setRGB( 1, 1, 1 )
	layerMOfN:setText( Engine.Localize( "MENU_EMBLEM_LAYER_M_OF_N" ) )
	layerMOfN:setTTF( "fonts/UnitedSansSmCdLt_0.ttf" )
	layerMOfN:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	layerMOfN:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( layerMOfN )
	self.layerMOfN = layerMOfN
	
	local PaintshopControlsFull = CoD.PaintshopControlsFull.new( self, controller )
	PaintshopControlsFull:setLeftRight( true, false, 64, 314 )
	PaintshopControlsFull:setTopBottom( true, false, 108.5, 358.5 )
	PaintshopControlsFull:setRGB( 1, 1, 1 )
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
				local f18_local0
				if not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.scaleMode", Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED ) then
					f18_local0 = IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
				else
					f18_local0 = false
				end
				return f18_local0
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
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 11, 78.87 )
	ElemsSideList:setTopBottom( true, false, 44, 718 )
	ElemsSideList:setRGB( 1, 1, 1 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 78, 86 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local paintjobTitle = CoD.cac_3dTitleIntermediary.new( self, controller )
	paintjobTitle:setLeftRight( true, false, -73.33, 504.67 )
	paintjobTitle:setTopBottom( true, false, -7, 139 )
	paintjobTitle:setRGB( 1, 1, 1 )
	paintjobTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeIntoString( "MENU_PAINTSHOP_CAPS", "MENU_PAINTSHOP_WEAPON_PAINTJOB" ) ) )
	self:addElement( paintjobTitle )
	self.paintjobTitle = paintjobTitle
	
	local emblemEditorTitle = CoD.cac_3dTitleIntermediary.new( self, controller )
	emblemEditorTitle:setLeftRight( true, false, -73.33, 504.67 )
	emblemEditorTitle:setTopBottom( true, false, -7, 139 )
	emblemEditorTitle:setRGB( 1, 1, 1 )
	emblemEditorTitle:setAlpha( 0 )
	emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_PAINTJOB" ) )
	self:addElement( emblemEditorTitle )
	self.emblemEditorTitle = emblemEditorTitle
	
	local paintshopControls = CoD.PaintshopControls.new( self, controller )
	paintshopControls:setLeftRight( true, false, 64, 314 )
	paintshopControls:setTopBottom( true, false, 110, 259 )
	paintshopControls:setRGB( 1, 1, 1 )
	paintshopControls:mergeStateConditions( {
		{
			stateName = "BrowseModeControlsState",
			condition = function ( menu, element, event )
				return not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
			end
		}
	} )
	paintshopControls:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.editorMode" ), function ( model )
		self:updateElementState( paintshopControls, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.editorMode"
		} )
	end )
	self:addElement( paintshopControls )
	self.paintshopControls = paintshopControls
	
	layerCarousel.navigation = {
		up = emblemDrawWidget
	}
	emblemDrawWidget.navigation = {
		down = layerCarousel
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				editorBackground:completeAnimation()
				self.editorBackground:setAlpha( 1 )
				self.clipFinished( editorBackground, {} )
				layerProperties:completeAnimation()
				self.layerProperties:setLeftRight( false, true, -233, -64 )
				self.layerProperties:setTopBottom( true, false, 135.5, 295.5 )
				self.clipFinished( layerProperties, {} )
				clipboard:completeAnimation()
				self.clipboard:setLeftRight( true, false, 1046.5, 1216 )
				self.clipboard:setTopBottom( true, false, 137, 299 )
				self.clipboard:setAlpha( 0 )
				self.clipFinished( clipboard, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setLeftRight( false, true, -320, -70 )
				self.choosePaintSide:setTopBottom( true, false, 139, 189 )
				self.choosePaintSide:setAlpha( 1 )
				self.clipFinished( choosePaintSide, {} )
				PaintshopControlsFull:completeAnimation()
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
				self:setupElementClipCounter( 10 )
				editorBackground:completeAnimation()
				self.editorBackground:setAlpha( 1 )
				self.clipFinished( editorBackground, {} )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setLeftRight( true, true, 0, 0 )
				self.StartMenuBackground0:setTopBottom( true, true, 109, -109 )
				self.StartMenuBackground0:setAlpha( 0.37 )
				self.clipFinished( StartMenuBackground0, {} )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setLeftRight( true, false, 424.67, 882.67 )
				self.emblemDrawWidget:setTopBottom( true, false, 142.5, 423 )
				self.emblemDrawWidget:setAlpha( 1 )
				self.clipFinished( emblemDrawWidget, {} )
				layerProperties:completeAnimation()
				self.layerProperties:setLeftRight( false, true, -365, -196 )
				self.layerProperties:setTopBottom( true, false, 142.5, 307.5 )
				self.clipFinished( layerProperties, {} )
				clipboard:completeAnimation()
				self.clipboard:setLeftRight( true, false, 920, 1077 )
				self.clipboard:setTopBottom( true, false, 239.5, 396.5 )
				self.clipboard:setAlpha( 1 )
				self.clipFinished( clipboard, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setLeftRight( false, true, -382, -132 )
				self.choosePaintSide:setTopBottom( true, false, 142.5, 192.5 )
				self.choosePaintSide:setAlpha( 0 )
				self.clipFinished( choosePaintSide, {} )
				PaintshopControlsFull:completeAnimation()
				self.PaintshopControlsFull:setLeftRight( true, false, 124.17, 358.17 )
				self.PaintshopControlsFull:setTopBottom( true, false, 145.5, 410.5 )
				self.PaintshopControlsFull:setAlpha( 1 )
				self.clipFinished( PaintshopControlsFull, {} )
				paintjobTitle:completeAnimation()
				self.paintjobTitle:setAlpha( 0 )
				self.clipFinished( paintjobTitle, {} )
				emblemEditorTitle:completeAnimation()
				emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.emblemEditorTitle:setLeftRight( true, false, -73.33, 504.67 )
				self.emblemEditorTitle:setTopBottom( true, false, -6, 140 )
				self.emblemEditorTitle:setAlpha( 1 )
				self.emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
				self.clipFinished( emblemEditorTitle, {} )
				paintshopControls:completeAnimation()
				self.paintshopControls:setLeftRight( true, false, 124.17, 374.17 )
				self.paintshopControls:setTopBottom( true, false, 145.5, 294.5 )
				self.paintshopControls:setAlpha( 1 )
				self.clipFinished( paintshopControls, {} )
			end
		},
		Paintshop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
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
				self.TitleBacking00:setTopBottom( true, false, -7, 80 )
				self.clipFinished( TitleBacking00, {} )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setLeftRight( true, false, 337.17, 694.25 )
				self.emblemDrawWidget:setTopBottom( true, false, 123.5, 406.5 )
				self.emblemDrawWidget:setAlpha( 0 )
				self.clipFinished( emblemDrawWidget, {} )
				layerProperties:completeAnimation()
				self.layerProperties:setLeftRight( false, true, -232, -64 )
				self.layerProperties:setTopBottom( true, false, 140, 301 )
				self.clipFinished( layerProperties, {} )
				clipboard:completeAnimation()
				self.clipboard:setLeftRight( true, false, 1048, 1216 )
				self.clipboard:setTopBottom( true, false, 170, 330 )
				self.clipboard:setAlpha( 1 )
				self.clipFinished( clipboard, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setLeftRight( false, true, -232, -64 )
				self.choosePaintSide:setTopBottom( true, false, 110, 137 )
				self.choosePaintSide:setAlpha( 1 )
				self.clipFinished( choosePaintSide, {} )
				PaintshopControlsFull:completeAnimation()
				self.PaintshopControlsFull:setLeftRight( true, false, 64, 314 )
				self.PaintshopControlsFull:setTopBottom( true, false, 108.5, 358.5 )
				self.PaintshopControlsFull:setAlpha( 1 )
				self.clipFinished( PaintshopControlsFull, {} )
				paintjobTitle:completeAnimation()
				paintjobTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.paintjobTitle:setAlpha( 1 )
				self.paintjobTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeIntoString( "MENU_PAINTSHOP_CAPS", "MENU_PAINTSHOP_WEAPON_PAINTJOB" ) ) )
				self.clipFinished( paintjobTitle, {} )
				emblemEditorTitle:completeAnimation()
				emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.emblemEditorTitle:setLeftRight( true, false, -73.33, 504.67 )
				self.emblemEditorTitle:setTopBottom( true, false, -7, 139 )
				self.emblemEditorTitle:setAlpha( 0 )
				self.emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_PAINTJOB" ) )
				self.clipFinished( emblemEditorTitle, {} )
				paintshopControls:completeAnimation()
				self.paintshopControls:setLeftRight( true, false, 64, 314 )
				self.paintshopControls:setTopBottom( true, false, 110, 259 )
				self.clipFinished( paintshopControls, {} )
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
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.start = function ( menu, element, event )
		if IsEditMode( controller ) then
			return true
		elseif IsBrowseMode( controller ) and not IsClipboardEmpty( controller ) then
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		if IsEditMode( controller ) and not IsLayerEmpty( element, controller ) then
			return true
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( element, controller ) then
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.shoulderl = function ( menu, element, event )
		if IsEditMode( controller ) then
			return true
		elseif IsBrowseMode( controller ) and IsPaintshop( controller ) then
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.shoulderr = function ( menu, element, event )
		if IsEditMode( controller ) then
			return true
		elseif IsBrowseMode( controller ) and IsPaintshop( controller ) then
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if IsBrowseMode( controller ) and not IsLayerEmpty( element, controller ) then
			return true
		elseif IsEditMode( controller ) and not IsLayerEmpty( element, controller ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_OPTIONS" ), "R", element )
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.select = function ( menu, element, event )
		if IsEditMode( controller ) then
			return true
		elseif IsBrowseMode( controller ) and not IsLayerEmpty( element, controller ) then
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		if IsBrowseMode( controller ) then
			menu:addButtonPrompt( "secondary", Engine.Localize( "PLATFORM_EMBLEM_EDIT_DONE" ), "ESCAPE", element )
			return true
		elseif IsEditMode( controller ) then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE", element )
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		if IsEditMode( controller ) then
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.right_stick_pressed = function ( menu, element, event )
		if IsEditMode( controller ) then
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.dpad_down = function ( menu, element, event )
		if IsBrowseMode( controller ) and not IsLayerEmpty( element, controller ) then
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.dpad_up = function ( menu, element, event )
		if IsEditMode( controller ) and not IsLayerEmpty( element, controller ) and not IsBooleanDvarSet( "ui_execdemo" ) then
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.alt1( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "start" or event.button == "key_shortcut" and event.key == "O") then
			if IsEditMode( controller ) then
				EmblemEditor_ToggleOutline( self, element, controller )
				PlaySoundSetSound( self, "toggle_outline" )
			elseif IsBrowseMode( controller ) and not IsClipboardEmpty( controller ) then
				EmblemEditor_InsertLayer( self, element, controller )
			end
		end
		if not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "E") and IsEditMode( controller ) and not IsLayerEmpty( element, controller ) then
			EmblemEditor_EndEdit( self, element, controller )
			NavigateToMenu( self, "EmblemIconColorPicker", true, controller )
		end
		if not self.occludedBy and (event.button == "shoulderl" or event.button == "key_shortcut" and event.key == "A") then
			if IsEditMode( controller ) then
				EmblemChooseColor_DecreaseOpacity( self, element, controller )
				PlaySoundSetSound( self, "opacity" )
			elseif IsBrowseMode( controller ) and IsPaintshop( controller ) then
				PaintjobEditor_ChangeViewLeftBumper( self, element, controller )
				PlaySoundSetSound( self, "switch_camera" )
			end
		end
		if not self.occludedBy and (event.button == "shoulderr" or event.button == "key_shortcut" and event.key == "A") then
			if IsEditMode( controller ) then
				EmblemChooseColor_IncreaseOpacity( self, element, controller )
				PlaySoundSetSound( self, "opacity" )
			elseif IsBrowseMode( controller ) and IsPaintshop( controller ) then
				PaintjobEditor_ChangeViewRightBumper( self, element, controller )
				PlaySoundSetSound( self, "switch_camera" )
			end
		end
		if not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "R") then
			if IsBrowseMode( controller ) and not IsLayerEmpty( element, controller ) then
				EmblemEditor_CutLayer( self, element, controller )
			elseif IsEditMode( controller ) and not IsLayerEmpty( element, controller ) then
				EmblemEditor_EndEdit( self, element, controller )
				EmblemEditor_OpenLayerOptionsPopup( self, element, controller )
				PlaySoundSetSound( self, "options" )
			end
		end
		if not self.occludedBy and (event.button == "select" or event.button == "key_shortcut" and event.key == "F") then
			if IsEditMode( controller ) then
				EmblemEditor_FlipIcon( self, element, controller )
				PlaySoundSetSound( self, "flip_image" )
			elseif IsBrowseMode( controller ) and not IsLayerEmpty( element, controller ) then
				EmblemEditor_CopyLayerToClipboard( self, element, controller )
			end
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			if IsBrowseMode( controller ) then
				EmblemEditor_OpenSaveEmblemPopup( self, element, controller )
				PlaySoundSetSound( self, "save_box" )
			elseif IsEditMode( controller ) then
				EmblemEditor_HandleBackInEditMode( self, element, controller, event, self )
				PlaySoundSetSound( self, "list_action" )
			end
		end
		if not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "ENTER") and IsEditMode( controller ) then
			EmblemEditor_HandleBackInEditMode( self, element, controller, event, self )
		end
		if not self.occludedBy and (event.button == "right_stick_pressed" or event.button == "key_shortcut" and event.key == "A") and IsEditMode( controller ) then
			EmblemEditor_ToggleScaleMode( self, element, controller )
		end
		if not self.occludedBy and (not (event.button ~= "down" or event.qualifier ~= "dpad") or event.button == "key_shortcut" and event.key == "A") and IsBrowseMode( controller ) and not IsLayerEmpty( element, controller ) then
			EmblemEditor_InsertDecalPressed( self, element, controller )
			NavigateToMenu( self, "EmblemChooseIcon", true, controller )
		end
		if not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "A") and IsBrowseMode( controller ) and not IsLayerEmpty( element, controller ) then
			NavigateToMenu( self, "EmblemChooseIcon", true, controller )
		end
		if not self.occludedBy and (not (event.button ~= "up" or event.qualifier ~= "dpad") or event.button == "key_shortcut" and event.key == "E") and IsEditMode( controller ) and not IsLayerEmpty( element, controller ) and not IsBooleanDvarSet( "ui_execdemo" ) then
			EmblemEditor_EndEdit( self, element, controller )
			NavigateToMenu( self, "EmblemEditorMaterialPicker", true, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	layerCarousel.id = "layerCarousel"
	emblemDrawWidget.id = "emblemDrawWidget"
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
	self.close = function ( self )
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
		self.paintshopControls:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

