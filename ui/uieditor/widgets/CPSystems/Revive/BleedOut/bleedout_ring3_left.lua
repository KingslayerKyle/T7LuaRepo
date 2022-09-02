-- c6674ba25e7569b4023671be93b33538
-- This hash is used for caching, delete to decompile the file again

CoD.bleedout_ring3_left = InheritFrom( LUI.UIElement )
CoD.bleedout_ring3_left.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.bleedout_ring3_left )
	self.id = "bleedout_ring3_left"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, true, -36, 0 )
	Image0:setTopBottom( false, false, -60, 60 )
	Image0:setRGB( 0.73, 0.89, 0.93 )
	Image0:setAlpha( 0.15 )
	Image0:setXRot( 180 )
	Image0:setZoom( -25 )
	Image0:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_ring3right_rgb" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local ring3right = LUI.UIImage.new()
	ring3right:setLeftRight( false, true, -36, 0 )
	ring3right:setTopBottom( false, false, -60, 60 )
	ring3right:setRGB( 0.73, 0.89, 0.93 )
	ring3right:setAlpha( 0.3 )
	ring3right:setXRot( 180 )
	ring3right:setZoom( 10 )
	ring3right:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_ring3right" ) )
	ring3right:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ring3right )
	self.ring3right = ring3right
	
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

