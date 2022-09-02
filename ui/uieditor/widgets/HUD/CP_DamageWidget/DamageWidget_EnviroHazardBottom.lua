-- 6f972b904ce9635b4918bf6e2dbe0151
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_IconEnviroHazardMeterBottom" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_IconEnviroHazard" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackCircleOutter" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Arrow" )

CoD.DamageWidget_EnviroHazardBottom = InheritFrom( LUI.UIElement )
CoD.DamageWidget_EnviroHazardBottom.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_EnviroHazardBottom )
	self.id = "DamageWidget_EnviroHazardBottom"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 161 )
	self:setTopBottom( true, false, 0, 24 )
	self.anyChildUsesUpdateState = true
	
	local EnviroHazardMeter = CoD.DamageWidget_IconEnviroHazardMeterBottom.new( menu, controller )
	EnviroHazardMeter:setLeftRight( true, false, 35, 88 )
	EnviroHazardMeter:setTopBottom( false, false, -11.5, 12.5 )
	EnviroHazardMeter:linkToElementModel( self, nil, false, function ( model )
		EnviroHazardMeter:setModel( model, controller )
	end )
	EnviroHazardMeter:linkToElementModel( self, "ratio", true, function ( model )
		local ratio = Engine.GetModelValue( model )
		if ratio then
			EnviroHazardMeter.ImgMeterEnvFill:setShaderVector( 0, CoD.GetVectorComponentFromString( ratio, 1 ), CoD.GetVectorComponentFromString( ratio, 2 ), CoD.GetVectorComponentFromString( ratio, 3 ), CoD.GetVectorComponentFromString( ratio, 4 ) )
		end
	end )
	EnviroHazardMeter:mergeStateConditions( {
		{
			stateName = "Critical",
			condition = function ( menu, element, event )
				return IsSelfModelValueLessThanOrEqualTo( element, controller, "ratio", 0.2 )
			end
		}
	} )
	EnviroHazardMeter:linkToElementModel( EnviroHazardMeter, "ratio", true, function ( model )
		menu:updateElementState( EnviroHazardMeter, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ratio"
		} )
	end )
	self:addElement( EnviroHazardMeter )
	self.EnviroHazardMeter = EnviroHazardMeter
	
	local IconEnviroHazard = CoD.DamageWidget_IconEnviroHazard.new( menu, controller )
	IconEnviroHazard:setLeftRight( true, false, 2.5, 25.5 )
	IconEnviroHazard:setTopBottom( false, false, -10.5, 10.5 )
	IconEnviroHazard:linkToElementModel( self, nil, false, function ( model )
		IconEnviroHazard:setModel( model, controller )
	end )
	IconEnviroHazard:mergeStateConditions( {
		{
			stateName = "Normal",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "ratio", 0.2 )
			end
		},
		{
			stateName = "Critical",
			condition = function ( menu, element, event )
				return IsSelfModelValueLessThanOrEqualTo( element, controller, "ratio", 0.2 )
			end
		}
	} )
	IconEnviroHazard:linkToElementModel( IconEnviroHazard, "ratio", true, function ( model )
		menu:updateElementState( IconEnviroHazard, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ratio"
		} )
	end )
	self:addElement( IconEnviroHazard )
	self.IconEnviroHazard = IconEnviroHazard
	
	local MeterText = LUI.UIText.new()
	MeterText:setLeftRight( false, false, 12.46, 101.46 )
	MeterText:setTopBottom( false, false, -7.5, 8.5 )
	MeterText:setTTF( "fonts/escom.ttf" )
	MeterText:setLetterSpacing( 0.4 )
	MeterText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MeterText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	MeterText:linkToElementModel( self, "type", true, function ( model )
		local type = Engine.GetModelValue( model )
		if type then
			MeterText:setText( Engine.Localize( HessTypeToString( type ) ) )
		end
	end )
	self:addElement( MeterText )
	self.MeterText = MeterText
	
	local AmmoWidgetBackCircleOutter0 = CoD.AmmoWidget_BackCircleOutter.new( menu, controller )
	AmmoWidgetBackCircleOutter0:setLeftRight( false, false, -103.69, -29.31 )
	AmmoWidgetBackCircleOutter0:setTopBottom( false, false, -36.67, 36.67 )
	AmmoWidgetBackCircleOutter0:setAlpha( 0 )
	AmmoWidgetBackCircleOutter0:setZoom( 5 )
	self:addElement( AmmoWidgetBackCircleOutter0 )
	self.AmmoWidgetBackCircleOutter0 = AmmoWidgetBackCircleOutter0
	
	local DamageWidgetArrow0 = CoD.DamageWidget_Arrow.new( menu, controller )
	DamageWidgetArrow0:setLeftRight( false, false, -69, -64 )
	DamageWidgetArrow0:setTopBottom( false, false, -18.5, -11.5 )
	DamageWidgetArrow0:setAlpha( 0 )
	DamageWidgetArrow0:setZRot( 90 )
	self:addElement( DamageWidgetArrow0 )
	self.DamageWidgetArrow0 = DamageWidgetArrow0
	
	local DamageWidgetArrow1 = CoD.DamageWidget_Arrow.new( menu, controller )
	DamageWidgetArrow1:setLeftRight( false, false, -69, -64 )
	DamageWidgetArrow1:setTopBottom( false, false, 10.5, 17.5 )
	DamageWidgetArrow1:setAlpha( 0 )
	DamageWidgetArrow1:setZRot( -90 )
	self:addElement( DamageWidgetArrow1 )
	self.DamageWidgetArrow1 = DamageWidgetArrow1
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.EnviroHazardMeter:close()
		element.IconEnviroHazard:close()
		element.AmmoWidgetBackCircleOutter0:close()
		element.DamageWidgetArrow0:close()
		element.DamageWidgetArrow1:close()
		element.MeterText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

