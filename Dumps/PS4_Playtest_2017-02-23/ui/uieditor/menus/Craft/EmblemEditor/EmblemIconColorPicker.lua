require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorControls" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorMixerContainer" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorSwatchContainer" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorTypeHeader" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorGradient" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorGradientColorSwatch" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChoosePaintSide" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopColorLayerInfo" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopColorSwatchControls" )
require( "ui.uieditor.widgets.PC.Craft.CraftActionHeader" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )

local SwapFocusWithVisibility = function ( controller, from, to )
	CoD.SwapFocusableElements( controller, from, to )
	from:hide()
	to:show()
end

local SwapNonGradientModeColorWidgetFocus = function ( self, controller, colorMode )
	if colorMode == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID then
		if self.colorGradientSwatchContainer.m_focusable then
			SwapFocusWithVisibility( controller, self.colorGradientSwatchContainer, self.colorSwatchContainer )
			self.colorGradientContainer:hide()
		elseif self.colorGradientMixerContainer.m_focusable then
			SwapFocusWithVisibility( controller, self.colorGradientMixerContainer, self.colorSwatchContainer )
			self.colorGradientContainer:hide()
		elseif self.colorMixerContainer.m_focusable then
			SwapFocusWithVisibility( controller, self.colorMixerContainer, self.colorSwatchContainer )
		elseif self.colorGradientContainer.m_focusable then
			SwapFocusWithVisibility( controller, self.colorGradientContainer, self.colorSwatchContainer )
		elseif CoD.isPC then
			CoD.SwapFocusableElements( controller, self.colorSwatchContainer, self.colorSwatchContainer )
		end
	elseif colorMode == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
		if self.colorSwatchContainer.m_focusable then
			SwapFocusWithVisibility( controller, self.colorSwatchContainer, self.colorMixerContainer )
		elseif self.colorGradientContainer.m_focusable then
			SwapFocusWithVisibility( controller, self.colorGradientContainer, self.colorMixerContainer )
		elseif CoD.isPC then
			CoD.SwapFocusableElements( controller, self.colorMixerContainer, self.colorMixerContainer )
		end
	end
end

local SwapGradientModeColorWidgetFocus = function ( self, controller, colorMode )
	if colorMode == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID then
		if self.colorSwatchContainer.m_focusable then
			SwapFocusWithVisibility( controller, self.colorSwatchContainer, self.colorGradientContainer )
		elseif self.colorGradientMixerContainer.m_focusable then
			SwapFocusWithVisibility( controller, self.colorGradientMixerContainer, self.colorGradientSwatchContainer )
		end
	elseif colorMode == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
		if self.colorMixerContainer.m_focusable then
			SwapFocusWithVisibility( controller, self.colorMixerContainer, self.colorGradientContainer )
		elseif self.colorGradientSwatchContainer.m_focusable then
			SwapFocusWithVisibility( controller, self.colorGradientSwatchContainer, self.colorGradientMixerContainer )
		end
	elseif CoD.isPC then
		CoD.SwapFocusableElements( controller, self.colorGradientContainer, self.colorGradientContainer )
	end
end

local SetupSelectedLayerEditorPorperties = function ( self, controller )
	local isGradientMode = CoD.GetEditorProperties( controller, "isGradientMode" )
	self:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, isGradientMode )
end

if CoD.isPC then
	require( "ui.uieditor.widgets.PC.Craft.CraftActionButton" )
	require( "ui.uieditor.widgets.PC.Craft.CraftActionSlider" )
	DataSources.CraftColorActionsPC = DataSourceHelpers.ListSetup( "PC.CraftColorActionsPC", function ( controller )
		if IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 0 ) then
			return CoD.PCUtil.Craft_GetEmblemEditorSolidColorActions( controller )
		else
			return CoD.PCUtil.Craft_GetEmblemEditorGradientModeActions( controller )
		end
	end, true )
	DataSources.CraftColorActionsPC.getWidgetTypeForItem = CoD.PCUtil.Craft_WidgetSelectorFunc
end
local SetupPC = function ( self, controller )
	self.emblemDrawWidget:registerEventHandler( "button_action", function ( element, event )
		return true
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if state == "EmblemEditor" or state == "Paintshop" then
			local colorMode = CoD.GetEditorProperties( controller, "colorMode" )
			if IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 0 ) then
				SwapNonGradientModeColorWidgetFocus( self, controller, colorMode )
			else
				SwapGradientModeColorWidgetFocus( self, controller, colorMode )
			end
			self.actionsListPC.m_inputDisabled = true
			self.actionsListPC:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
		else
			self.actionsListPC.m_inputDisabled = nil
		end
	end )
	self.actionsListPC:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.isGradientMode" ), function ( model )
		self.actionsListPC:updateDataSource()
	end )
	self.actionsListPC:setDataSource( "CraftColorActionsPC" )
	self.actionsListPC.navigation = nil
end

local PostLoadFunc = function ( self, controller )
	self.updateMode = function ( self, colorMode, isGradient, element )
		if isGradient == 1 then
			CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
			if colorMode == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID then
				SwapGradientModeColorWidgetFocus( self, controller, colorMode )
			elseif colorMode == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
				SwapGradientModeColorWidgetFocus( self, controller, colorMode )
			end
		elseif colorMode == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID then
			SwapNonGradientModeColorWidgetFocus( self, controller, colorMode )
		elseif colorMode == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
			SwapNonGradientModeColorWidgetFocus( self, controller, colorMode )
		end
	end
	
	self.colorGradientSwatchContainer:hide()
	self.colorGradientSwatchContainer:makeNotFocusable()
	self.colorMixerContainer:hide()
	self.colorMixerContainer:makeNotFocusable()
	self.colorGradientMixerContainer:hide()
	self.colorGradientMixerContainer:makeNotFocusable()
	self.colorGradientContainer:hide()
	self.colorGradientContainer:makeNotFocusable()
	if IsPaintshop( controller ) and Dvar.ui_disablePSControlWidgets:get() == true then
		self.controls:setAlpha( 0 )
		self.layersUsed:setAlpha( 0 )
		self.layersUsedValue:setAlpha( 0 )
		self.opacity:setAlpha( 0 )
		self.opacityValue:setAlpha( 0 )
	end
	self.colorGradientMixerContainer.navigation = nil
	self.colorGradientSwatchContainer.navigation = nil
	self.colorGradientContainer.navigation = nil
	self.colorSwatchContainer.navigation = nil
	self.colorMixerContainer.navigation = nil
	SetupSelectedLayerEditorPorperties( self, controller )
	local gradientSlider = self.colorGradientContainer.gradientSlider
	EmblemGradient_UpdateGradientFillByStep( gradientSlider, gradientSlider, 0, controller )
	if CoD.isPC then
		SetupPC( self, controller )
	end
end

local PreLoadFunc = function ( self, controller )
	local selectedColor = Engine.GetSelectedLayerColor( controller )
	local selectedColor1 = Engine.GetSelectedLayerColor1( controller )
	CoD.SetNoColorDataModel( controller )
	if selectedColor.red == selectedColor1.red and selectedColor.green == selectedColor1.green and selectedColor.blue == selectedColor1.blue and selectedColor.alpha == selectedColor1.alpha then
		CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
		CoD.SetEditorProperties( controller, 0, "isGradientMode" )
		CoD.SetEditorProperties( controller, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE, "colorNum" )
		return 
	else
		CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
		CoD.SetEditorProperties( controller, 1, "isGradientMode" )
		CoD.SetEditorProperties( controller, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0, "colorNum" )
	end
end

LUI.createMenu.EmblemIconColorPicker = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmblemIconColorPicker" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "SelectColor"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemIconColorPicker.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0.5, 0.5, -957, 963 )
	Background:setTopBottom( 0.5, 0.5, -540, 540 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local ScreenBkgd = LUI.UIImage.new()
	ScreenBkgd:setLeftRight( 0, 1, 0, 0 )
	ScreenBkgd:setTopBottom( 0, 1, 0, 0 )
	ScreenBkgd:setRGB( 0, 0, 0 )
	ScreenBkgd:setAlpha( 0 )
	self:addElement( ScreenBkgd )
	self.ScreenBkgd = ScreenBkgd
	
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
	StartMenuBackground0:setTopBottom( 0, 1, 119, -209 )
	StartMenuBackground0:setAlpha( 0.37 )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local colorGradientContainer = CoD.EmblemEditorGradient.new( self, controller )
	colorGradientContainer:setLeftRight( 0, 0, 460, 1466 )
	colorGradientContainer:setTopBottom( 0, 0, 708, 970 )
	self:addElement( colorGradientContainer )
	self.colorGradientContainer = colorGradientContainer
	
	local colorMixerContainer = CoD.EmblemEditorColorMixerContainer.new( self, controller )
	colorMixerContainer:setLeftRight( 0, 0, 460, 1466 )
	colorMixerContainer:setTopBottom( 0, 0, 708, 970 )
	colorMixerContainer:setAlpha( 0 )
	colorMixerContainer:subscribeToGlobalModel( controller, "EmblemSelectedLayerEdittingColor", nil, function ( model )
		colorMixerContainer:setModel( model, controller )
	end )
	self:addElement( colorMixerContainer )
	self.colorMixerContainer = colorMixerContainer
	
	local colorSwatchContainer = CoD.EmblemEditorColorSwatchContainer.new( self, controller )
	colorSwatchContainer:setLeftRight( 0, 0, 460, 1466 )
	colorSwatchContainer:setTopBottom( 0, 0, 708, 970 )
	colorSwatchContainer:subscribeToGlobalModel( controller, "EmblemSelectedLayerColor", nil, function ( model )
		colorSwatchContainer:setModel( model, controller )
	end )
	self:addElement( colorSwatchContainer )
	self.colorSwatchContainer = colorSwatchContainer
	
	local colorGradientSwatchContainer = CoD.EmblemEditorGradientColorSwatch.new( self, controller )
	colorGradientSwatchContainer:setLeftRight( 0, 0, 430, 1494 )
	colorGradientSwatchContainer:setTopBottom( 0, 0, 708, 970 )
	colorGradientSwatchContainer:setAlpha( 0.99 )
	colorGradientSwatchContainer:subscribeToGlobalModel( controller, "EmblemSelectedLayerEdittingColor", nil, function ( model )
		colorGradientSwatchContainer:setModel( model, controller )
	end )
	self:addElement( colorGradientSwatchContainer )
	self.colorGradientSwatchContainer = colorGradientSwatchContainer
	
	local colorGradientMixerContainer = CoD.EmblemEditorColorMixerContainer.new( self, controller )
	colorGradientMixerContainer:setLeftRight( 0, 0, 460, 1466 )
	colorGradientMixerContainer:setTopBottom( 0, 0, 708, 970 )
	colorGradientMixerContainer:setAlpha( 0 )
	colorGradientMixerContainer:subscribeToGlobalModel( controller, "EmblemSelectedLayerEdittingColor", nil, function ( model )
		colorGradientMixerContainer:setModel( model, controller )
	end )
	self:addElement( colorGradientMixerContainer )
	self.colorGradientMixerContainer = colorGradientMixerContainer
	
	local PaintshopColorSwatchControls = CoD.PaintshopColorSwatchControls.new( self, controller )
	PaintshopColorSwatchControls:mergeStateConditions( {
		{
			stateName = "Gradient",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 0 )
			end
		},
		{
			stateName = "Solid",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and not IsSelectedColorEmpty( element, controller )
			end
		},
		{
			stateName = "NoColor",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and IsSelectedColorEmpty( element, controller )
			end
		}
	} )
	PaintshopColorSwatchControls:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.isGradientMode" ), function ( model )
		self:updateElementState( PaintshopColorSwatchControls, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.isGradientMode"
		} )
	end )
	PaintshopColorSwatchControls:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.isColor0NoColor" ), function ( model )
		self:updateElementState( PaintshopColorSwatchControls, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.isColor0NoColor"
		} )
	end )
	PaintshopColorSwatchControls:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.isColor1NoColor" ), function ( model )
		self:updateElementState( PaintshopColorSwatchControls, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.isColor1NoColor"
		} )
	end )
	PaintshopColorSwatchControls:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.colorNum" ), function ( model )
		self:updateElementState( PaintshopColorSwatchControls, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.colorNum"
		} )
	end )
	PaintshopColorSwatchControls:setLeftRight( 0, 0, 164.5, 539.5 )
	PaintshopColorSwatchControls:setTopBottom( 0, 0, 195, 435 )
	self:addElement( PaintshopColorSwatchControls )
	self.PaintshopColorSwatchControls = PaintshopColorSwatchControls
	
	local emblemEditorColorControls = CoD.EmblemEditorColorControls.new( self, controller )
	emblemEditorColorControls:mergeStateConditions( {
		{
			stateName = "Gradient",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 0 )
			end
		},
		{
			stateName = "Solid",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and not IsSelectedColorEmpty( element, controller )
			end
		},
		{
			stateName = "NoColor",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and IsSelectedColorEmpty( element, controller )
			end
		}
	} )
	emblemEditorColorControls:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.isGradientMode" ), function ( model )
		self:updateElementState( emblemEditorColorControls, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.isGradientMode"
		} )
	end )
	emblemEditorColorControls:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.isColor0NoColor" ), function ( model )
		self:updateElementState( emblemEditorColorControls, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.isColor0NoColor"
		} )
	end )
	emblemEditorColorControls:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.isColor1NoColor" ), function ( model )
		self:updateElementState( emblemEditorColorControls, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.isColor1NoColor"
		} )
	end )
	emblemEditorColorControls:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.colorNum" ), function ( model )
		self:updateElementState( emblemEditorColorControls, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.colorNum"
		} )
	end )
	emblemEditorColorControls:setLeftRight( 0, 0, 96.5, 471.5 )
	emblemEditorColorControls:setTopBottom( 0, 0, 168, 408 )
	emblemEditorColorControls:setAlpha( 0 )
	self:addElement( emblemEditorColorControls )
	self.emblemEditorColorControls = emblemEditorColorControls
	
	local title0 = LUI.UIText.new()
	title0:setLeftRight( 0, 0, 96, 1044 )
	title0:setTopBottom( 0, 0, 42, 114 )
	title0:setRGB( 0.87, 0.88, 0.78 )
	title0:setAlpha( 0 )
	title0:setText( Engine.Localize( "MENU_EMBLEM_COLOR_PICKER_CAPS" ) )
	title0:setTTF( "fonts/escom.ttf" )
	title0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title0 )
	self.title0 = title0
	
	local PaintshopColorLayerInfo = CoD.PaintshopColorLayerInfo.new( self, controller )
	PaintshopColorLayerInfo:mergeStateConditions( {
		{
			stateName = "GradientColorInfo",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 )
			end
		}
	} )
	PaintshopColorLayerInfo:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.isGradientMode" ), function ( model )
		self:updateElementState( PaintshopColorLayerInfo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.isGradientMode"
		} )
	end )
	PaintshopColorLayerInfo:setLeftRight( 1, 1, -348, -94 )
	PaintshopColorLayerInfo:setTopBottom( 0, 0, 163, 387 )
	self:addElement( PaintshopColorLayerInfo )
	self.PaintshopColorLayerInfo = PaintshopColorLayerInfo
	
	local ColorPickerTitle = CoD.cac_3dTitleIntermediary.new( self, controller )
	ColorPickerTitle:setLeftRight( 0, 0, -109.5, 757.5 )
	ColorPickerTitle:setTopBottom( 0, 0, -9.5, 209.5 )
	ColorPickerTitle:setAlpha( 0 )
	ColorPickerTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EDIT_DECAL_COLOR" ) )
	self:addElement( ColorPickerTitle )
	self.ColorPickerTitle = ColorPickerTitle
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, 0, 1920 )
	CategoryListLine:setTopBottom( 0, 0, 117, 129 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( 0, 0, 9, 111 )
	ElemsSideList:setTopBottom( 0, 0, 66, 1077 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local emblemDrawWidget = CoD.EmblemDrawWidgetNew.new( self, controller )
	emblemDrawWidget:setLeftRight( 0, 0, 585, 1335 )
	emblemDrawWidget:setTopBottom( 0, 0, 195, 661 )
	self:addElement( emblemDrawWidget )
	self.emblemDrawWidget = emblemDrawWidget
	
	local EmblemEditorColorTypeHeader0 = CoD.EmblemEditorColorTypeHeader.new( self, controller )
	EmblemEditorColorTypeHeader0:mergeStateConditions( {
		{
			stateName = "Gradient",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "isGradientMode" ) and IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 )
			end
		},
		{
			stateName = "Solid",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID ) and IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 0 )
			end
		},
		{
			stateName = "Mixer",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER ) and IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 0 )
			end
		}
	} )
	EmblemEditorColorTypeHeader0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.isGradientMode" ), function ( model )
		self:updateElementState( EmblemEditorColorTypeHeader0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.isGradientMode"
		} )
	end )
	EmblemEditorColorTypeHeader0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.colorMode" ), function ( model )
		self:updateElementState( EmblemEditorColorTypeHeader0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.colorMode"
		} )
	end )
	EmblemEditorColorTypeHeader0:setLeftRight( 0, 0, 463, 1465 )
	EmblemEditorColorTypeHeader0:setTopBottom( 0, 0, 666.5, 711.5 )
	EmblemEditorColorTypeHeader0.colorTypeHeader.text:setText( Engine.Localize( "MENU_EMBLEM_SOLID_COLOR" ) )
	self:addElement( EmblemEditorColorTypeHeader0 )
	self.EmblemEditorColorTypeHeader0 = EmblemEditorColorTypeHeader0
	
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
	choosePaintSide:setLeftRight( 0, 1, 1572, -94 )
	choosePaintSide:setTopBottom( 0, 0, 164, 204 )
	choosePaintSide:setAlpha( 0.89 )
	choosePaintSide:subscribeToGlobalModel( controller, "Customization", "view_string_ref", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			choosePaintSide.PaintshopChooseSide.text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( choosePaintSide )
	self.choosePaintSide = choosePaintSide
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_EMBLEM_COLOR_PICKER_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_COLOR_PICKER_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_paintshop" ) )
	MenuFrame:registerEventHandler( "menu_loaded", function ( element, event )
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
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local actionsListPC = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	actionsListPC:makeFocusable()
	actionsListPC:setLeftRight( 0, 0, 92, 467 )
	actionsListPC:setTopBottom( 0, 0, 173, 491 )
	actionsListPC:setAlpha( 0 )
	actionsListPC:setWidgetType( CoD.CraftActionHeader )
	actionsListPC:setVerticalCount( 10 )
	self:addElement( actionsListPC )
	self.actionsListPC = actionsListPC
	
	colorGradientContainer.navigation = {
		left = colorGradientSwatchContainer,
		up = emblemDrawWidget
	}
	colorMixerContainer.navigation = {
		left = colorGradientSwatchContainer,
		up = emblemDrawWidget
	}
	colorSwatchContainer.navigation = {
		left = colorGradientSwatchContainer,
		up = emblemDrawWidget
	}
	colorGradientSwatchContainer.navigation = {
		up = emblemDrawWidget,
		right = {
			colorGradientContainer,
			colorMixerContainer,
			colorSwatchContainer,
			colorGradientMixerContainer
		}
	}
	colorGradientMixerContainer.navigation = {
		left = colorGradientSwatchContainer,
		up = emblemDrawWidget
	}
	emblemDrawWidget.navigation = {
		left = actionsListPC,
		down = {
			colorGradientSwatchContainer,
			colorGradientContainer,
			colorMixerContainer,
			colorSwatchContainer,
			colorGradientMixerContainer
		}
	}
	actionsListPC.navigation = {
		right = emblemDrawWidget,
		down = {
			colorGradientSwatchContainer,
			colorGradientContainer,
			colorMixerContainer,
			colorSwatchContainer,
			colorGradientMixerContainer
		}
	}
	self.resetProperties = function ()
		colorSwatchContainer:completeAnimation()
		PaintshopColorLayerInfo:completeAnimation()
		ScreenBkgd:completeAnimation()
		choosePaintSide:completeAnimation()
		PaintshopColorSwatchControls:completeAnimation()
		actionsListPC:completeAnimation()
		emblemEditorColorControls:completeAnimation()
		emblemDrawWidget:completeAnimation()
		Background:completeAnimation()
		StartMenuBackground0:completeAnimation()
		colorSwatchContainer:setAlpha( 1 )
		PaintshopColorLayerInfo:setLeftRight( 1, 1, -348, -94 )
		PaintshopColorLayerInfo:setTopBottom( 0, 0, 163, 387 )
		ScreenBkgd:setAlpha( 0 )
		choosePaintSide:setLeftRight( 0, 1, 1572, -94 )
		choosePaintSide:setTopBottom( 0, 0, 164, 204 )
		choosePaintSide:setAlpha( 0.89 )
		PaintshopColorSwatchControls:setLeftRight( 0, 0, 164.5, 539.5 )
		PaintshopColorSwatchControls:setTopBottom( 0, 0, 195, 435 )
		PaintshopColorSwatchControls:setAlpha( 1 )
		actionsListPC:setLeftRight( 0, 0, 92, 467 )
		actionsListPC:setTopBottom( 0, 0, 173, 491 )
		actionsListPC:setAlpha( 0 )
		emblemEditorColorControls:setLeftRight( 0, 0, 96.5, 471.5 )
		emblemEditorColorControls:setTopBottom( 0, 0, 168, 408 )
		emblemEditorColorControls:setAlpha( 0 )
		emblemDrawWidget:setLeftRight( 0, 0, 585, 1335 )
		emblemDrawWidget:setTopBottom( 0, 0, 195, 661 )
		emblemDrawWidget:setAlpha( 1 )
		Background:setAlpha( 1 )
		StartMenuBackground0:setAlpha( 0.37 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0.75 )
				self.clipFinished( ScreenBkgd, {} )
				colorSwatchContainer:completeAnimation()
				self.colorSwatchContainer:setAlpha( 0 )
				self.clipFinished( colorSwatchContainer, {} )
				PaintshopColorLayerInfo:completeAnimation()
				self.PaintshopColorLayerInfo:setLeftRight( 1, 1, -546, -292 )
				self.PaintshopColorLayerInfo:setTopBottom( 0, 0, 151, 375 )
				self.clipFinished( PaintshopColorLayerInfo, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setLeftRight( 0, 1, 1372, -294 )
				self.choosePaintSide:setTopBottom( 0, 0, 162, 202 )
				self.choosePaintSide:setAlpha( 0 )
				self.clipFinished( choosePaintSide, {} )
			end
		},
		EmblemEditor_PC = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0.75 )
				self.clipFinished( ScreenBkgd, {} )
				PaintshopColorSwatchControls:completeAnimation()
				self.PaintshopColorSwatchControls:setAlpha( 0 )
				self.clipFinished( PaintshopColorSwatchControls, {} )
				PaintshopColorLayerInfo:completeAnimation()
				self.PaintshopColorLayerInfo:setLeftRight( 1, 1, -546, -292 )
				self.PaintshopColorLayerInfo:setTopBottom( 0, 0, 151, 375 )
				self.clipFinished( PaintshopColorLayerInfo, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 0 )
				self.clipFinished( choosePaintSide, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setLeftRight( 0, 0, 165, 540 )
				self.actionsListPC:setTopBottom( 0, 0, 194.5, 521.5 )
				self.actionsListPC:setAlpha( 1 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		EmblemEditor = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0.75 )
				self.clipFinished( ScreenBkgd, {} )
				PaintshopColorSwatchControls:completeAnimation()
				self.PaintshopColorSwatchControls:setAlpha( 0 )
				self.clipFinished( PaintshopColorSwatchControls, {} )
				emblemEditorColorControls:completeAnimation()
				self.emblemEditorColorControls:setLeftRight( 0, 0, 164.5, 539.5 )
				self.emblemEditorColorControls:setTopBottom( 0, 0, 195, 435 )
				self.emblemEditorColorControls:setAlpha( 1 )
				self.clipFinished( emblemEditorColorControls, {} )
				PaintshopColorLayerInfo:completeAnimation()
				self.PaintshopColorLayerInfo:setLeftRight( 1, 1, -546, -292 )
				self.PaintshopColorLayerInfo:setTopBottom( 0, 0, 151, 375 )
				self.clipFinished( PaintshopColorLayerInfo, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 0 )
				self.clipFinished( choosePaintSide, {} )
			end
		},
		Paintshop_PC = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0 )
				self.clipFinished( StartMenuBackground0, {} )
				PaintshopColorSwatchControls:completeAnimation()
				self.PaintshopColorSwatchControls:setAlpha( 0 )
				self.clipFinished( PaintshopColorSwatchControls, {} )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setLeftRight( 0, 0, 589, 1331 )
				self.emblemDrawWidget:setTopBottom( 0, 0, 165, 587 )
				self.emblemDrawWidget:setAlpha( 0 )
				self.clipFinished( emblemDrawWidget, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 1 )
				self.clipFinished( choosePaintSide, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setAlpha( 1 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		Paintshop = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0 )
				self.clipFinished( StartMenuBackground0, {} )
				PaintshopColorSwatchControls:completeAnimation()
				self.PaintshopColorSwatchControls:setLeftRight( 0, 0, 96.5, 471.5 )
				self.PaintshopColorSwatchControls:setTopBottom( 0, 0, 171, 411 )
				self.clipFinished( PaintshopColorSwatchControls, {} )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setLeftRight( 0, 0, 589, 1331 )
				self.emblemDrawWidget:setTopBottom( 0, 0, 165, 587 )
				self.emblemDrawWidget:setAlpha( 0 )
				self.clipFinished( emblemDrawWidget, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 1 )
				self.clipFinished( choosePaintSide, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "EmblemEditor_PC",
			condition = function ( menu, element, event )
				local f50_local0 = IsEmblemEditor( controller )
				if f50_local0 then
					if not IsGamepad( controller ) then
						f50_local0 = IsPC()
					else
						f50_local0 = false
					end
				end
				return f50_local0
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
				local f52_local0 = IsPaintshop( controller )
				if f52_local0 then
					if not IsGamepad( controller ) then
						f52_local0 = IsPC()
					else
						f52_local0 = false
					end
				end
				return f52_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.isGradientMode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.isGradientMode"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LTRIG )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RTRIG )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.colorMode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.colorMode"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_BACK )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 0 ) then
			GoBack( self, controller )
			ClearSavedState( self, controller )
			return true
		elseif IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			GoBack( self, controller )
			ClearMenuSavedState( menu )
			EmblemGradient_BackFromGradientPicker( self, element, controller )
			return true
		elseif IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			EmblemGradient_BackFromColorPicker( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		elseif IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		elseif IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 0 ) then
			GoBack( self, controller )
			ClearSavedState( self, controller )
			return true
		elseif IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			EmblemGradient_ShowSwatchContainer( self, element, controller )
			return true
		elseif IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			EmblemGradient_BackFromColorPicker( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		EmblemChooseColor_UpdateOpacityByStep( self, element, "-0.01", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		EmblemChooseColor_UpdateOpacityByStep( self, element, "0.01", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, "E", function ( element, menu, controller, model )
		if not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			EmblemChooseColor_ToggleColorMode( self, element, controller )
			PlaySoundSetSound( self, "toggle_color_picker" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_BACK, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "G", function ( element, menu, controller, model )
		EmblemChooseColor_ToggleGradientMode( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, nil, function ( element, menu, controller, model )
		if IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) then
			EmblemGradient_UpdateAngleByStep( self, element, "-1", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LTRIG, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, nil, function ( element, menu, controller, model )
		if IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) then
			EmblemGradient_UpdateAngleByStep( self, element, "1", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RTRIG, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			EmblemGradient_ToggleGradientType( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsPaintshop( controller ) then
			EmblemChooseColor_ToggleBlend( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsPaintshop( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	colorGradientContainer.id = "colorGradientContainer"
	colorMixerContainer.id = "colorMixerContainer"
	colorSwatchContainer.id = "colorSwatchContainer"
	colorGradientSwatchContainer.id = "colorGradientSwatchContainer"
	colorGradientMixerContainer.id = "colorGradientMixerContainer"
	emblemDrawWidget.id = "emblemDrawWidget"
	MenuFrame:setModel( self.buttonModel, controller )
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
		self.colorSwatchContainer:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.colorGradientContainer:close()
		self.colorMixerContainer:close()
		self.colorSwatchContainer:close()
		self.colorGradientSwatchContainer:close()
		self.colorGradientMixerContainer:close()
		self.PaintshopColorSwatchControls:close()
		self.emblemEditorColorControls:close()
		self.PaintshopColorLayerInfo:close()
		self.ColorPickerTitle:close()
		self.ElemsSideList:close()
		self.emblemDrawWidget:close()
		self.EmblemEditorColorTypeHeader0:close()
		self.choosePaintSide:close()
		self.MenuFrame:close()
		self.actionsListPC:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemIconColorPicker.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

