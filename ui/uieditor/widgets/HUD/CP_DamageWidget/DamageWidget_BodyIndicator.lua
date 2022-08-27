-- b15fb02b1d1eb4bba948527f2316cf52
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_BodyIndicatorQ1" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_BodyIndicatorQ4" )

CoD.DamageWidget_BodyIndicator = InheritFrom( LUI.UIElement )
CoD.DamageWidget_BodyIndicator.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_BodyIndicator )
	self.id = "DamageWidget_BodyIndicator"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 22 )
	self:setTopBottom( true, false, 0, 51 )
	self.anyChildUsesUpdateState = true
	
	local ImgBodyFull = LUI.UIImage.new()
	ImgBodyFull:setLeftRight( true, false, 0, 21.33 )
	ImgBodyFull:setTopBottom( true, false, 0, 50.67 )
	ImgBodyFull:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_bodyfull" ) )
	self:addElement( ImgBodyFull )
	self.ImgBodyFull = ImgBodyFull
	
	local BodyIndicatorQ1 = CoD.DamageWidget_BodyIndicatorQ1.new( menu, controller )
	BodyIndicatorQ1:setLeftRight( true, false, 10.66, 21.67 )
	BodyIndicatorQ1:setTopBottom( true, false, 8.67, 30.67 )
	BodyIndicatorQ1:mergeStateConditions( {
		{
			stateName = "DamageLarge",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "hudItems.health", 12 )
			end
		},
		{
			stateName = "DamageSmall",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "hudItems.health", 76 )
			end
		}
	} )
	BodyIndicatorQ1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.health" ), function ( model )
		menu:updateElementState( BodyIndicatorQ1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.health"
		} )
	end )
	self:addElement( BodyIndicatorQ1 )
	self.BodyIndicatorQ1 = BodyIndicatorQ1
	
	local BodyIndicatorQ4 = CoD.DamageWidget_BodyIndicatorQ4.new( menu, controller )
	BodyIndicatorQ4:setLeftRight( true, false, 12.25, 18.25 )
	BodyIndicatorQ4:setTopBottom( true, false, 25, 51 )
	BodyIndicatorQ4:mergeStateConditions( {
		{
			stateName = "DamageLarge",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "hudItems.health", 36 )
			end
		},
		{
			stateName = "DamageSmall",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "hudItems.health", 88 )
			end
		}
	} )
	BodyIndicatorQ4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.health" ), function ( model )
		menu:updateElementState( BodyIndicatorQ4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.health"
		} )
	end )
	self:addElement( BodyIndicatorQ4 )
	self.BodyIndicatorQ4 = BodyIndicatorQ4
	
	local BodyIndicatorQ2 = CoD.DamageWidget_BodyIndicatorQ1.new( menu, controller )
	BodyIndicatorQ2:setLeftRight( true, false, -0.34, 10.67 )
	BodyIndicatorQ2:setTopBottom( true, false, 8.67, 30.67 )
	BodyIndicatorQ2:setYRot( -180 )
	BodyIndicatorQ2:mergeStateConditions( {
		{
			stateName = "DamageLarge",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "hudItems.health", 24 )
			end
		},
		{
			stateName = "DamageSmall",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "hudItems.health", 76 )
			end
		}
	} )
	BodyIndicatorQ2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.health" ), function ( model )
		menu:updateElementState( BodyIndicatorQ2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.health"
		} )
	end )
	self:addElement( BodyIndicatorQ2 )
	self.BodyIndicatorQ2 = BodyIndicatorQ2
	
	local BodyIndicatorQ3 = CoD.DamageWidget_BodyIndicatorQ4.new( menu, controller )
	BodyIndicatorQ3:setLeftRight( true, false, 3, 9 )
	BodyIndicatorQ3:setTopBottom( true, false, 25, 51 )
	BodyIndicatorQ3:setYRot( -180 )
	BodyIndicatorQ3:mergeStateConditions( {
		{
			stateName = "DamageLarge",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "hudItems.health", 60 )
			end
		},
		{
			stateName = "DamageSmall",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "hudItems.health", 100 )
			end
		}
	} )
	BodyIndicatorQ3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.health" ), function ( model )
		menu:updateElementState( BodyIndicatorQ3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.health"
		} )
	end )
	self:addElement( BodyIndicatorQ3 )
	self.BodyIndicatorQ3 = BodyIndicatorQ3
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BodyIndicatorQ1:close()
		element.BodyIndicatorQ4:close()
		element.BodyIndicatorQ2:close()
		element.BodyIndicatorQ3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

