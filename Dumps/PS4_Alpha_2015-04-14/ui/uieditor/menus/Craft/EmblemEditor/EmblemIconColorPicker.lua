require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorSwatchControls" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorMixerContainer" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorSwatchContainer" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopColorSwatchControls" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopColorLayerInfo" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )

local PostLoadFunc = function ( self, controller )
	CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
	self.colorMixerContainer:makeNotFocusable()
	if IsPaintshop( controller ) and Dvar.ui_disablePSControlWidgets:get() == true then
		self.controls:setAlpha( 0 )
		self.layersUsed:setAlpha( 0 )
		self.layersUsedValue:setAlpha( 0 )
		self.opacity:setAlpha( 0 )
		self.opacityValue:setAlpha( 0 )
	end
	self.colorSwatchContainer.navigation.up = nil
end

LUI.createMenu.EmblemIconColorPicker = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmblemIconColorPicker" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "SelectColor"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local HelpBacking0 = LUI.UIImage.new()
	HelpBacking0:setLeftRight( true, true, 0, 0 )
	HelpBacking0:setTopBottom( false, true, -68, 0 )
	HelpBacking0:setRGB( 0.02, 0.02, 0.03 )
	HelpBacking0:setAlpha( 0.6 )
	HelpBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HelpBacking0 )
	self.HelpBacking0 = HelpBacking0
	
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
	TitleBacking0:setTopBottom( true, false, 0, 82 )
	TitleBacking0:setRGB( 0.04, 0.05, 0.06 )
	TitleBacking0:setAlpha( 0.6 )
	TitleBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local ScreenBkgd = LUI.UIImage.new()
	ScreenBkgd:setLeftRight( true, true, 0, 0 )
	ScreenBkgd:setTopBottom( true, true, 0, 0 )
	ScreenBkgd:setRGB( 0, 0, 0 )
	ScreenBkgd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ScreenBkgd )
	self.ScreenBkgd = ScreenBkgd
	
	local controls = CoD.EmblemEditorColorSwatchControls.new( self, controller )
	controls:setLeftRight( true, false, 157, 407 )
	controls:setTopBottom( true, false, 143, 387 )
	controls:setRGB( 1, 1, 1 )
	controls:mergeStateConditions( {
		{
			stateName = "colorMixerMode",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER )
			end
		},
		{
			stateName = "solidColorMode",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID )
			end
		}
	} )
	controls:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.colorMode" ), function ( model )
		self:updateElementState( controls, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.colorMode"
		} )
	end )
	self:addElement( controls )
	self.controls = controls
	
	local colorMixerContainer = CoD.EmblemEditorColorMixerContainer.new( self, controller )
	colorMixerContainer:setLeftRight( true, false, 282, 955.5 )
	colorMixerContainer:setTopBottom( true, false, 470.5, 634.5 )
	colorMixerContainer:setRGB( 1, 1, 1 )
	colorMixerContainer:mergeStateConditions( {
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER )
			end
		},
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID )
			end
		}
	} )
	colorMixerContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.colorMode" ), function ( model )
		self:updateElementState( colorMixerContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.colorMode"
		} )
	end )
	self:addElement( colorMixerContainer )
	self.colorMixerContainer = colorMixerContainer
	
	local colorSwatchContainer = CoD.EmblemEditorColorSwatchContainer.new( self, controller )
	colorSwatchContainer:setLeftRight( true, false, 282, 953 )
	colorSwatchContainer:setTopBottom( true, false, 470.5, 631.5 )
	colorSwatchContainer:setRGB( 1, 1, 1 )
	colorSwatchContainer:mergeStateConditions( {
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID )
			end
		},
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER )
			end
		}
	} )
	colorSwatchContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.colorMode" ), function ( model )
		self:updateElementState( colorSwatchContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.colorMode"
		} )
	end )
	self:addElement( colorSwatchContainer )
	self.colorSwatchContainer = colorSwatchContainer
	
	local PaintshopColorSwatchControls = CoD.PaintshopColorSwatchControls.new( self, controller )
	PaintshopColorSwatchControls:setLeftRight( true, false, 64, 314 )
	PaintshopColorSwatchControls:setTopBottom( true, false, 110, 219 )
	PaintshopColorSwatchControls:setRGB( 1, 1, 1 )
	PaintshopColorSwatchControls:mergeStateConditions( {
		{
			stateName = "colorMixerMode",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER )
			end
		},
		{
			stateName = "solidColorMode",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID )
			end
		}
	} )
	PaintshopColorSwatchControls:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.colorMode" ), function ( model )
		self:updateElementState( PaintshopColorSwatchControls, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.colorMode"
		} )
	end )
	self:addElement( PaintshopColorSwatchControls )
	self.PaintshopColorSwatchControls = PaintshopColorSwatchControls
	
	local title0 = LUI.UIText.new()
	title0:setLeftRight( true, false, 64, 696 )
	title0:setTopBottom( true, false, 28, 76 )
	title0:setRGB( 0.87, 0.88, 0.78 )
	title0:setAlpha( 0 )
	title0:setText( Engine.Localize( "MENU_EMBLEM_COLOR_PICKER_CAPS" ) )
	title0:setTTF( "fonts/escom.ttf" )
	title0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title0 )
	self.title0 = title0
	
	local PaintshopColorLayerInfo = CoD.PaintshopColorLayerInfo.new( self, controller )
	PaintshopColorLayerInfo:setLeftRight( false, true, -232, -64 )
	PaintshopColorLayerInfo:setTopBottom( true, false, 110, 219 )
	PaintshopColorLayerInfo:setRGB( 1, 1, 1 )
	self:addElement( PaintshopColorLayerInfo )
	self.PaintshopColorLayerInfo = PaintshopColorLayerInfo
	
	local ColorPickerTitle = CoD.cac_3dTitleIntermediary.new( self, controller )
	ColorPickerTitle:setLeftRight( true, false, -67.33, 510.67 )
	ColorPickerTitle:setTopBottom( true, false, -7, 139 )
	ColorPickerTitle:setRGB( 1, 1, 1 )
	ColorPickerTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeIntoString( "MENU_EMBLEM_COLOR_PICKER_CAPS", "MENU_PAINTSHOP_WEAPON_PAINTJOB" ) ) )
	self:addElement( ColorPickerTitle )
	self.ColorPickerTitle = ColorPickerTitle
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 78, 86 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 11, 78.87 )
	ElemsSideList:setTopBottom( true, false, 44, 718 )
	ElemsSideList:setRGB( 1, 1, 1 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local emblemDrawWidget = CoD.EmblemDrawWidgetNew.new( self, controller )
	emblemDrawWidget:setLeftRight( true, false, 424.5, 882.5 )
	emblemDrawWidget:setTopBottom( true, false, 143, 423.5 )
	emblemDrawWidget:setRGB( 1, 1, 1 )
	self:addElement( emblemDrawWidget )
	self.emblemDrawWidget = emblemDrawWidget
	
	colorMixerContainer.navigation = {
		left = colorSwatchContainer,
		up = colorSwatchContainer
	}
	colorSwatchContainer.navigation = {
		up = emblemDrawWidget,
		right = colorMixerContainer,
		down = colorMixerContainer
	}
	emblemDrawWidget.navigation = {
		down = {
			colorMixerContainer,
			colorSwatchContainer
		}
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		EmblemEditor = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 1 )
				self.clipFinished( ScreenBkgd, {} )
				controls:completeAnimation()
				self.controls:setLeftRight( true, false, 130, 380 )
				self.controls:setTopBottom( true, false, 143, 387 )
				self.controls:setAlpha( 1 )
				self.clipFinished( controls, {} )
				colorMixerContainer:completeAnimation()
				self.colorMixerContainer:setLeftRight( true, false, 324, 997.5 )
				self.colorMixerContainer:setTopBottom( true, false, 470.5, 634.5 )
				self.clipFinished( colorMixerContainer, {} )
				colorSwatchContainer:completeAnimation()
				self.colorSwatchContainer:setLeftRight( true, false, 322, 993 )
				self.colorSwatchContainer:setTopBottom( true, false, 470.5, 631.5 )
				self.clipFinished( colorSwatchContainer, {} )
				PaintshopColorSwatchControls:completeAnimation()
				self.PaintshopColorSwatchControls:setAlpha( 0 )
				self.clipFinished( PaintshopColorSwatchControls, {} )
				PaintshopColorLayerInfo:completeAnimation()
				self.PaintshopColorLayerInfo:setLeftRight( false, true, -324.5, -156.5 )
				self.PaintshopColorLayerInfo:setTopBottom( true, false, 143, 252 )
				self.clipFinished( PaintshopColorLayerInfo, {} )
			end
		},
		Paintshop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0 )
				self.clipFinished( ScreenBkgd, {} )
				controls:completeAnimation()
				self.controls:setLeftRight( true, false, 64, 314 )
				self.controls:setTopBottom( true, false, 110, 219 )
				self.controls:setAlpha( 0 )
				self.clipFinished( controls, {} )
				colorMixerContainer:completeAnimation()
				self.colorMixerContainer:setLeftRight( true, false, 303.25, 976.75 )
				self.colorMixerContainer:setTopBottom( true, false, 470.5, 634.5 )
				self.clipFinished( colorMixerContainer, {} )
				colorSwatchContainer:completeAnimation()
				self.colorSwatchContainer:setLeftRight( true, false, 304.5, 975.5 )
				self.colorSwatchContainer:setTopBottom( true, false, 470.5, 631.5 )
				self.clipFinished( colorSwatchContainer, {} )
				PaintshopColorSwatchControls:completeAnimation()
				self.PaintshopColorSwatchControls:setAlpha( 1 )
				self.clipFinished( PaintshopColorSwatchControls, {} )
				PaintshopColorLayerInfo:completeAnimation()
				self.PaintshopColorLayerInfo:setLeftRight( false, true, -232, -64 )
				self.PaintshopColorLayerInfo:setTopBottom( true, false, 110, 211 )
				self.clipFinished( PaintshopColorLayerInfo, {} )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setLeftRight( true, false, 411, 869 )
				self.emblemDrawWidget:setTopBottom( true, false, 110, 390 )
				self.emblemDrawWidget:setAlpha( 0 )
				self.clipFinished( emblemDrawWidget, {} )
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
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.shoulderl = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.shoulderr = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.select = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
			ClearSavedState( self, controller )
		end
		if not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "ENTER") then
			GoBack( self, controller )
			ClearSavedState( self, controller )
		end
		if not self.occludedBy and (event.button == "shoulderl" or event.button == "key_shortcut" and event.key == "A") then
			EmblemChooseColor_DecreaseOpacity( self, element, controller )
		end
		if not self.occludedBy and (event.button == "shoulderr" or event.button == "key_shortcut" and event.key == "A") then
			EmblemChooseColor_IncreaseOpacity( self, element, controller )
		end
		if not self.occludedBy and (event.button == "select" or event.button == "key_shortcut" and event.key == "E") then
			EmblemChooseColor_ToggleMode( self, element, controller )
			PlaySoundSetSound( self, "toggle_color_picker" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	colorMixerContainer.id = "colorMixerContainer"
	colorSwatchContainer.id = "colorSwatchContainer"
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
		self.colorSwatchContainer:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.controls:close()
		self.colorMixerContainer:close()
		self.colorSwatchContainer:close()
		self.PaintshopColorSwatchControls:close()
		self.PaintshopColorLayerInfo:close()
		self.ColorPickerTitle:close()
		self.ElemsSideList:close()
		self.emblemDrawWidget:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

