-- 649ecb8141405e1f7266a07f21124fb2
-- This hash is used for caching, delete to decompile the file again

CoD.bleedout_dot = InheritFrom( LUI.UIElement )
CoD.bleedout_dot.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.bleedout_dot )
	self.id = "bleedout_dot"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 24 )
	
	local dotTopLeftRGB = LUI.UIImage.new()
	dotTopLeftRGB:setLeftRight( false, false, -12, 12 )
	dotTopLeftRGB:setTopBottom( false, false, -12, 12 )
	dotTopLeftRGB:setRGB( 0.73, 0.89, 0.93 )
	dotTopLeftRGB:setAlpha( 0.15 )
	dotTopLeftRGB:setXRot( 180 )
	dotTopLeftRGB:setZoom( -25 )
	dotTopLeftRGB:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_dotrgb" ) )
	dotTopLeftRGB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( dotTopLeftRGB )
	self.dotTopLeftRGB = dotTopLeftRGB
	
	local dotTopLeft = LUI.UIImage.new()
	dotTopLeft:setLeftRight( false, false, -12, 12 )
	dotTopLeft:setTopBottom( false, false, -12, 12 )
	dotTopLeft:setRGB( 0.73, 0.89, 0.93 )
	dotTopLeft:setAlpha( 0.5 )
	dotTopLeft:setXRot( 180 )
	dotTopLeft:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_dot" ) )
	dotTopLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( dotTopLeft )
	self.dotTopLeft = dotTopLeft
	
	self:mergeStateConditions( {
		{
			stateName = "BleedingOut",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "bleedingOut" ) and IsSelfModelValueGreaterThan( element, controller, "clockPercent", 0.3 )
			end
		},
		{
			stateName = "BleedingOut_Low",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "bleedingOut" )
			end
		},
		{
			stateName = "Reviving",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "beingRevived" )
			end
		}
	} )
	self:linkToElementModel( self, "bleedingOut", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bleedingOut"
		} )
	end )
	self:linkToElementModel( self, "clockPercent", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clockPercent"
		} )
	end )
	self:linkToElementModel( self, "beingRevived", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "beingRevived"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

