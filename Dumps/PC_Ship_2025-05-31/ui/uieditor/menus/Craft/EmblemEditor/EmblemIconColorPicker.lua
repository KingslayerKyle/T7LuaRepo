require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorGradient" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorMixerContainer" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorSwatchContainer" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorGradientColorSwatch" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopColorSwatchControls" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorControls" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopColorLayerInfo" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorTypeHeader" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChoosePaintSide" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.PC.Craft.CraftActionHeader" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	CoD.SwapFocusableElements( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg1:hide()
	f1_arg2:show()
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg2 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID then
		if f2_arg0.colorGradientSwatchContainer.m_focusable then
			f0_local0( f2_arg1, f2_arg0.colorGradientSwatchContainer, f2_arg0.colorSwatchContainer )
			f2_arg0.colorGradientContainer:hide()
		elseif f2_arg0.colorGradientMixerContainer.m_focusable then
			f0_local0( f2_arg1, f2_arg0.colorGradientMixerContainer, f2_arg0.colorSwatchContainer )
			f2_arg0.colorGradientContainer:hide()
		elseif f2_arg0.colorMixerContainer.m_focusable then
			f0_local0( f2_arg1, f2_arg0.colorMixerContainer, f2_arg0.colorSwatchContainer )
		elseif f2_arg0.colorGradientContainer.m_focusable then
			f0_local0( f2_arg1, f2_arg0.colorGradientContainer, f2_arg0.colorSwatchContainer )
		elseif CoD.isPC then
			CoD.SwapFocusableElements( f2_arg1, f2_arg0.colorSwatchContainer, f2_arg0.colorSwatchContainer )
		end
	elseif f2_arg2 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
		if f2_arg0.colorSwatchContainer.m_focusable then
			f0_local0( f2_arg1, f2_arg0.colorSwatchContainer, f2_arg0.colorMixerContainer )
		elseif f2_arg0.colorGradientContainer.m_focusable then
			f0_local0( f2_arg1, f2_arg0.colorGradientContainer, f2_arg0.colorMixerContainer )
		elseif CoD.isPC then
			CoD.SwapFocusableElements( f2_arg1, f2_arg0.colorMixerContainer, f2_arg0.colorMixerContainer )
		end
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	if f3_arg2 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID then
		if f3_arg0.colorSwatchContainer.m_focusable then
			f0_local0( f3_arg1, f3_arg0.colorSwatchContainer, f3_arg0.colorGradientContainer )
		elseif f3_arg0.colorGradientMixerContainer.m_focusable then
			f0_local0( f3_arg1, f3_arg0.colorGradientMixerContainer, f3_arg0.colorGradientSwatchContainer )
		end
	elseif f3_arg2 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
		if f3_arg0.colorMixerContainer.m_focusable then
			f0_local0( f3_arg1, f3_arg0.colorMixerContainer, f3_arg0.colorGradientContainer )
		elseif f3_arg0.colorGradientSwatchContainer.m_focusable then
			f0_local0( f3_arg1, f3_arg0.colorGradientSwatchContainer, f3_arg0.colorGradientMixerContainer )
		end
	elseif CoD.isPC then
		CoD.SwapFocusableElements( f3_arg1, f3_arg0.colorGradientContainer, f3_arg0.colorGradientContainer )
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	f4_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, CoD.GetEditorProperties( f4_arg1, "isGradientMode" ) )
end

if CoD.isPC then
	require( "ui.uieditor.widgets.PC.Craft.CraftActionButton" )
	require( "ui.uieditor.widgets.PC.Craft.CraftActionSlider" )
	DataSources.CraftColorActionsPC = DataSourceHelpers.ListSetup( "PC.CraftColorActionsPC", function ( f5_arg0 )
		if IsModelValueEqualTo( f5_arg0, "Emblem.EmblemProperties.isGradientMode", 0 ) then
			return CoD.PCUtil.Craft_GetEmblemEditorSolidColorActions( f5_arg0 )
		else
			return CoD.PCUtil.Craft_GetEmblemEditorGradientModeActions( f5_arg0 )
		end
	end, true )
	DataSources.CraftColorActionsPC.getWidgetTypeForItem = CoD.PCUtil.Craft_WidgetSelectorFunc
end
local f0_local4 = function ( f6_arg0, f6_arg1 )
	f6_arg0.emblemDrawWidget:registerEventHandler( "button_action", function ( element, event )
		return true
	end )
	LUI.OverrideFunction_CallOriginalFirst( f6_arg0, "setState", function ( element, controller )
		if controller == "EmblemEditor" or controller == "Paintshop" then
			local f8_local0 = CoD.GetEditorProperties( f6_arg1, "colorMode" )
			if IsModelValueEqualTo( f6_arg1, "Emblem.EmblemProperties.isGradientMode", 0 ) then
				f0_local1( f6_arg0, f6_arg1, f8_local0 )
			else
				f0_local2( f6_arg0, f6_arg1, f8_local0 )
			end
			f6_arg0.actionsListPC.m_inputDisabled = true
			f6_arg0.actionsListPC:processEvent( {
				name = "lose_focus",
				controller = f6_arg1
			} )
		else
			f6_arg0.actionsListPC.m_inputDisabled = nil
		end
	end )
	f6_arg0.actionsListPC:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f6_arg1 ), "Emblem.EmblemProperties.isGradientMode" ), function ( model )
		f6_arg0.actionsListPC:updateDataSource()
	end )
	f6_arg0.actionsListPC:setDataSource( "CraftColorActionsPC" )
	f6_arg0.actionsListPC.navigation = nil
end

local PostLoadFunc = function ( f10_arg0, f10_arg1 )
	f10_arg0.updateMode = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if f11_arg2 == 1 then
			CoD.SetEditorProperties( f10_arg1, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
			if f11_arg1 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID then
				f0_local2( f11_arg0, f10_arg1, f11_arg1 )
			elseif f11_arg1 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
				f0_local2( f11_arg0, f10_arg1, f11_arg1 )
			end
		elseif f11_arg1 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID then
			f0_local1( f11_arg0, f10_arg1, f11_arg1 )
		elseif f11_arg1 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
			f0_local1( f11_arg0, f10_arg1, f11_arg1 )
		end
	end
	
	f10_arg0.colorGradientSwatchContainer:hide()
	f10_arg0.colorGradientSwatchContainer:makeNotFocusable()
	f10_arg0.colorMixerContainer:hide()
	f10_arg0.colorMixerContainer:makeNotFocusable()
	f10_arg0.colorGradientMixerContainer:hide()
	f10_arg0.colorGradientMixerContainer:makeNotFocusable()
	f10_arg0.colorGradientContainer:hide()
	f10_arg0.colorGradientContainer:makeNotFocusable()
	if IsPaintshop( f10_arg1 ) and Dvar.ui_disablePSControlWidgets:get() == true then
		f10_arg0.controls:setAlpha( 0 )
		f10_arg0.layersUsed:setAlpha( 0 )
		f10_arg0.layersUsedValue:setAlpha( 0 )
		f10_arg0.opacity:setAlpha( 0 )
		f10_arg0.opacityValue:setAlpha( 0 )
	end
	f10_arg0.colorGradientMixerContainer.navigation = nil
	f10_arg0.colorGradientSwatchContainer.navigation = nil
	f10_arg0.colorGradientContainer.navigation = nil
	f10_arg0.colorSwatchContainer.navigation = nil
	f10_arg0.colorMixerContainer.navigation = nil
	f0_local3( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg0.colorGradientContainer.gradientSlider
	EmblemGradient_UpdateGradientFillByStep( f10_local0, f10_local0, 0, f10_arg1 )
	if CoD.isPC then
		f0_local4( f10_arg0, f10_arg1 )
	end
end

local PreLoadFunc = function ( self, controller )
	local f12_local0 = Engine.GetSelectedLayerColor( controller )
	local f12_local1 = Engine.GetSelectedLayerColor1( controller )
	CoD.SetNoColorDataModel( controller )
	if f12_local0.red == f12_local1.red and f12_local0.green == f12_local1.green and f12_local0.blue == f12_local1.blue and f12_local0.alpha == f12_local1.alpha then
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemIconColorPicker.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, false, -638, 642 )
	Background:setTopBottom( false, false, -360, 360 )
	Background:setScale( 1 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local ScreenBkgd = LUI.UIImage.new()
	ScreenBkgd:setLeftRight( true, true, 0, 0 )
	ScreenBkgd:setTopBottom( true, true, 0, 0 )
	ScreenBkgd:setRGB( 0, 0, 0 )
	ScreenBkgd:setAlpha( 0 )
	self:addElement( ScreenBkgd )
	self.ScreenBkgd = ScreenBkgd
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 79, -139 )
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
	
	local colorGradientContainer = CoD.EmblemEditorGradient.new( self, controller )
	colorGradientContainer:setLeftRight( true, false, 306.5, 977.5 )
	colorGradientContainer:setTopBottom( true, false, 472, 647 )
	self:addElement( colorGradientContainer )
	self.colorGradientContainer = colorGradientContainer
	
	local colorMixerContainer = CoD.EmblemEditorColorMixerContainer.new( self, controller )
	colorMixerContainer:setLeftRight( true, false, 306.5, 977.5 )
	colorMixerContainer:setTopBottom( true, false, 472, 647 )
	colorMixerContainer:setAlpha( 0 )
	colorMixerContainer:subscribeToGlobalModel( controller, "EmblemSelectedLayerEdittingColor", nil, function ( model )
		colorMixerContainer:setModel( model, controller )
	end )
	self:addElement( colorMixerContainer )
	self.colorMixerContainer = colorMixerContainer
	
	local colorSwatchContainer = CoD.EmblemEditorColorSwatchContainer.new( self, controller )
	colorSwatchContainer:setLeftRight( true, false, 306.5, 977.5 )
	colorSwatchContainer:setTopBottom( true, false, 472, 647 )
	colorSwatchContainer:subscribeToGlobalModel( controller, "EmblemSelectedLayerColor", nil, function ( model )
		colorSwatchContainer:setModel( model, controller )
	end )
	self:addElement( colorSwatchContainer )
	self.colorSwatchContainer = colorSwatchContainer
	
	local colorGradientSwatchContainer = CoD.EmblemEditorGradientColorSwatch.new( self, controller )
	colorGradientSwatchContainer:setLeftRight( true, false, 286.75, 996.25 )
	colorGradientSwatchContainer:setTopBottom( true, false, 472, 647 )
	colorGradientSwatchContainer:setAlpha( 0.99 )
	colorGradientSwatchContainer:subscribeToGlobalModel( controller, "EmblemSelectedLayerEdittingColor", nil, function ( model )
		colorGradientSwatchContainer:setModel( model, controller )
	end )
	self:addElement( colorGradientSwatchContainer )
	self.colorGradientSwatchContainer = colorGradientSwatchContainer
	
	local colorGradientMixerContainer = CoD.EmblemEditorColorMixerContainer.new( self, controller )
	colorGradientMixerContainer:setLeftRight( true, false, 306.5, 977.5 )
	colorGradientMixerContainer:setTopBottom( true, false, 472, 647 )
	colorGradientMixerContainer:setAlpha( 0 )
	colorGradientMixerContainer:subscribeToGlobalModel( controller, "EmblemSelectedLayerEdittingColor", nil, function ( model )
		colorGradientMixerContainer:setModel( model, controller )
	end )
	self:addElement( colorGradientMixerContainer )
	self.colorGradientMixerContainer = colorGradientMixerContainer
	
	local PaintshopColorSwatchControls = CoD.PaintshopColorSwatchControls.new( self, controller )
	PaintshopColorSwatchControls:setLeftRight( true, false, 110, 360 )
	PaintshopColorSwatchControls:setTopBottom( true, false, 130, 290 )
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
	self:addElement( PaintshopColorSwatchControls )
	self.PaintshopColorSwatchControls = PaintshopColorSwatchControls
	
	local emblemEditorColorControls = CoD.EmblemEditorColorControls.new( self, controller )
	emblemEditorColorControls:setLeftRight( true, false, 64, 314 )
	emblemEditorColorControls:setTopBottom( true, false, 112, 272 )
	emblemEditorColorControls:setAlpha( 0 )
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
	self:addElement( emblemEditorColorControls )
	self.emblemEditorColorControls = emblemEditorColorControls
	
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
	PaintshopColorLayerInfo:setLeftRight( false, true, -232, -63 )
	PaintshopColorLayerInfo:setTopBottom( true, false, 109, 258 )
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
	self:addElement( PaintshopColorLayerInfo )
	self.PaintshopColorLayerInfo = PaintshopColorLayerInfo
	
	local ColorPickerTitle = CoD.cac_3dTitleIntermediary.new( self, controller )
	ColorPickerTitle:setLeftRight( true, false, -73.33, 504.67 )
	ColorPickerTitle:setTopBottom( true, false, -6, 140 )
	ColorPickerTitle:setAlpha( 0 )
	ColorPickerTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EDIT_DECAL_COLOR" ) )
	self:addElement( ColorPickerTitle )
	self.ColorPickerTitle = ColorPickerTitle
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 78, 86 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 6, 73.87 )
	ElemsSideList:setTopBottom( true, false, 44, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local emblemDrawWidget = CoD.EmblemDrawWidgetNew.new( self, controller )
	emblemDrawWidget:setLeftRight( true, false, 390, 890 )
	emblemDrawWidget:setTopBottom( true, false, 130, 441 )
	self:addElement( emblemDrawWidget )
	self.emblemDrawWidget = emblemDrawWidget
	
	local EmblemEditorColorTypeHeader0 = CoD.EmblemEditorColorTypeHeader.new( self, controller )
	EmblemEditorColorTypeHeader0:setLeftRight( true, false, 308.5, 976.25 )
	EmblemEditorColorTypeHeader0:setTopBottom( true, false, 444.5, 474.5 )
	EmblemEditorColorTypeHeader0.colorTypeHeader.text:setText( Engine.Localize( "MENU_EMBLEM_SOLID_COLOR" ) )
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
	self:addElement( EmblemEditorColorTypeHeader0 )
	self.EmblemEditorColorTypeHeader0 = EmblemEditorColorTypeHeader0
	
	local choosePaintSide = CoD.PaintshopChoosePaintSide.new( self, controller )
	choosePaintSide:setLeftRight( true, true, 1048, -63 )
	choosePaintSide:setTopBottom( true, false, 109, 136 )
	choosePaintSide:setAlpha( 0.89 )
	choosePaintSide:subscribeToGlobalModel( controller, "Customization", "view_string_ref", function ( model )
		local viewStringRef = Engine.GetModelValue( model )
		if viewStringRef then
			choosePaintSide.PaintshopChooseSide.text:setText( Engine.Localize( viewStringRef ) )
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
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_EMBLEM_COLOR_PICKER_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_COLOR_PICKER_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_paintshop" ) )
	MenuFrame:registerEventHandler( "menu_loaded", function ( element, event )
		local f43_local0 = nil
		if IsEmblemEditor( controller ) then
			ShowHeaderIconOnly( self )
		elseif IsPaintshop( controller ) then
			ShowHeaderKickerAndIcon( self )
			SetHeadingKickerTextToSelectedWeapon( controller )
		end
		if not f43_local0 then
			f43_local0 = element:dispatchEventToChildren( event )
		end
		return f43_local0
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local actionsListPC = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	actionsListPC:makeFocusable()
	actionsListPC:setLeftRight( true, false, 61, 311 )
	actionsListPC:setTopBottom( true, false, 112, 330 )
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0.75 )
				self.clipFinished( ScreenBkgd, {} )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0.37 )
				self.clipFinished( StartMenuBackground0, {} )
				colorMixerContainer:completeAnimation()
				self.colorMixerContainer:setAlpha( 0 )
				self.clipFinished( colorMixerContainer, {} )
				colorSwatchContainer:completeAnimation()
				self.colorSwatchContainer:setAlpha( 0 )
				self.clipFinished( colorSwatchContainer, {} )
				emblemEditorColorControls:completeAnimation()
				self.emblemEditorColorControls:setAlpha( 0 )
				self.clipFinished( emblemEditorColorControls, {} )
				PaintshopColorLayerInfo:completeAnimation()
				self.PaintshopColorLayerInfo:setLeftRight( false, true, -364, -195 )
				self.PaintshopColorLayerInfo:setTopBottom( true, false, 101, 250 )
				self.PaintshopColorLayerInfo:setAlpha( 1 )
				self.clipFinished( PaintshopColorLayerInfo, {} )
				EmblemEditorColorTypeHeader0:completeAnimation()
				self.EmblemEditorColorTypeHeader0:setAlpha( 1 )
				self.clipFinished( EmblemEditorColorTypeHeader0, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setLeftRight( true, true, 915, -196 )
				self.choosePaintSide:setTopBottom( true, false, 108, 135 )
				self.choosePaintSide:setAlpha( 0 )
				self.clipFinished( choosePaintSide, {} )
			end
		},
		EmblemEditor_PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0.75 )
				self.clipFinished( ScreenBkgd, {} )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0.37 )
				self.clipFinished( StartMenuBackground0, {} )
				PaintshopColorSwatchControls:completeAnimation()
				self.PaintshopColorSwatchControls:setAlpha( 0 )
				self.clipFinished( PaintshopColorSwatchControls, {} )
				emblemEditorColorControls:completeAnimation()
				self.emblemEditorColorControls:setAlpha( 0 )
				self.clipFinished( emblemEditorColorControls, {} )
				PaintshopColorLayerInfo:completeAnimation()
				self.PaintshopColorLayerInfo:setLeftRight( false, true, -364, -195 )
				self.PaintshopColorLayerInfo:setTopBottom( true, false, 101, 250 )
				self.PaintshopColorLayerInfo:setRGB( 1, 1, 1 )
				self.PaintshopColorLayerInfo:setAlpha( 1 )
				self.clipFinished( PaintshopColorLayerInfo, {} )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setAlpha( 1 )
				self.clipFinished( emblemDrawWidget, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 0 )
				self.clipFinished( choosePaintSide, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setLeftRight( true, false, 110, 360 )
				self.actionsListPC:setTopBottom( true, false, 130, 348 )
				self.actionsListPC:setAlpha( 1 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		EmblemEditor = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0.75 )
				self.clipFinished( ScreenBkgd, {} )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0.37 )
				self.clipFinished( StartMenuBackground0, {} )
				PaintshopColorSwatchControls:completeAnimation()
				self.PaintshopColorSwatchControls:setAlpha( 0 )
				self.clipFinished( PaintshopColorSwatchControls, {} )
				emblemEditorColorControls:completeAnimation()
				self.emblemEditorColorControls:setLeftRight( true, false, 110, 360 )
				self.emblemEditorColorControls:setTopBottom( true, false, 130, 290 )
				self.emblemEditorColorControls:setAlpha( 1 )
				self.clipFinished( emblemEditorColorControls, {} )
				PaintshopColorLayerInfo:completeAnimation()
				self.PaintshopColorLayerInfo:setLeftRight( false, true, -364, -195 )
				self.PaintshopColorLayerInfo:setTopBottom( true, false, 101, 250 )
				self.PaintshopColorLayerInfo:setRGB( 1, 1, 1 )
				self.PaintshopColorLayerInfo:setAlpha( 1 )
				self.clipFinished( PaintshopColorLayerInfo, {} )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setAlpha( 1 )
				self.clipFinished( emblemDrawWidget, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 0 )
				self.clipFinished( choosePaintSide, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setAlpha( 0 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		Paintshop_PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0 )
				self.clipFinished( ScreenBkgd, {} )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0 )
				self.clipFinished( StartMenuBackground0, {} )
				PaintshopColorSwatchControls:completeAnimation()
				self.PaintshopColorSwatchControls:setAlpha( 0 )
				self.clipFinished( PaintshopColorSwatchControls, {} )
				emblemEditorColorControls:completeAnimation()
				self.emblemEditorColorControls:setAlpha( 0 )
				self.clipFinished( emblemEditorColorControls, {} )
				PaintshopColorLayerInfo:completeAnimation()
				self.PaintshopColorLayerInfo:setAlpha( 1 )
				self.clipFinished( PaintshopColorLayerInfo, {} )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setLeftRight( true, false, 392.5, 887.5 )
				self.emblemDrawWidget:setTopBottom( true, false, 110, 391 )
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
				self:setupElementClipCounter( 9 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0 )
				self.clipFinished( ScreenBkgd, {} )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0 )
				self.clipFinished( StartMenuBackground0, {} )
				PaintshopColorSwatchControls:completeAnimation()
				self.PaintshopColorSwatchControls:setLeftRight( true, false, 64, 314 )
				self.PaintshopColorSwatchControls:setTopBottom( true, false, 114, 274 )
				self.PaintshopColorSwatchControls:setAlpha( 1 )
				self.clipFinished( PaintshopColorSwatchControls, {} )
				emblemEditorColorControls:completeAnimation()
				self.emblemEditorColorControls:setAlpha( 0 )
				self.clipFinished( emblemEditorColorControls, {} )
				PaintshopColorLayerInfo:completeAnimation()
				self.PaintshopColorLayerInfo:setAlpha( 1 )
				self.clipFinished( PaintshopColorLayerInfo, {} )
				emblemDrawWidget:completeAnimation()
				self.emblemDrawWidget:setLeftRight( true, false, 392.5, 887.5 )
				self.emblemDrawWidget:setTopBottom( true, false, 110, 391 )
				self.emblemDrawWidget:setAlpha( 0 )
				self.clipFinished( emblemDrawWidget, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 1 )
				self.clipFinished( choosePaintSide, {} )
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
		local f13_local22 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return f13_local22( self, event )
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
		local f55_local0 = self
		local f55_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.isGradientMode"
		}
		CoD.Menu.UpdateButtonShownState( f55_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( f55_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f55_local0, self, controller, Enum.LUIButton.LUI_KEY_LTRIG )
		CoD.Menu.UpdateButtonShownState( f55_local0, self, controller, Enum.LUIButton.LUI_KEY_RTRIG )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.colorMode" ), function ( model )
		local f56_local0 = self
		local f56_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.colorMode"
		}
		CoD.Menu.UpdateButtonShownState( f56_local0, self, controller, Enum.LUIButton.LUI_KEY_BACK )
		CoD.Menu.UpdateButtonShownState( f56_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f56_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( f56_local0, self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		elseif IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		elseif IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 0 ) then
			return true
		elseif IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			return true
		elseif IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) and not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		EmblemChooseColor_UpdateOpacityByStep( self, element, "-0.01", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		EmblemChooseColor_UpdateOpacityByStep( self, element, "0.01", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_BACK, "" )
		if not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "G", function ( element, menu, controller, model )
		EmblemChooseColor_ToggleGradientMode( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, nil, function ( element, menu, controller, model )
		if IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) then
			EmblemGradient_UpdateAngleByStep( self, element, "-1", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LTRIG, "" )
		if IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) then
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RTRIG, "" )
		if IsModelValueEqualTo( controller, "Emblem.EmblemProperties.isGradientMode", 1 ) then
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
		if IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE ) then
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		if IsPaintshop( controller ) then
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.colorGradientContainer:close()
		element.colorMixerContainer:close()
		element.colorSwatchContainer:close()
		element.colorGradientSwatchContainer:close()
		element.colorGradientMixerContainer:close()
		element.PaintshopColorSwatchControls:close()
		element.emblemEditorColorControls:close()
		element.PaintshopColorLayerInfo:close()
		element.ColorPickerTitle:close()
		element.ElemsSideList:close()
		element.emblemDrawWidget:close()
		element.EmblemEditorColorTypeHeader0:close()
		element.choosePaintSide:close()
		element.MenuFrame:close()
		element.actionsListPC:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemIconColorPicker.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

