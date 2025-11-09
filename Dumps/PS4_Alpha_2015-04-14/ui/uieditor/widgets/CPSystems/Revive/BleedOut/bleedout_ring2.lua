CoD.bleedout_ring2 = InheritFrom( LUI.UIElement )
CoD.bleedout_ring2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.bleedout_ring2 )
	self.id = "bleedout_ring2"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 228 )
	self:setTopBottom( true, false, 0, 228 )
	
	local ring2RGB = LUI.UIImage.new()
	ring2RGB:setLeftRight( false, false, -114, 114 )
	ring2RGB:setTopBottom( false, false, -114, 114 )
	ring2RGB:setRGB( 0.73, 0.89, 0.93 )
	ring2RGB:setAlpha( 0.15 )
	ring2RGB:setZoom( -25 )
	ring2RGB:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_ring2rgb" ) )
	ring2RGB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ring2RGB )
	self.ring2RGB = ring2RGB
	
	local ring2 = LUI.UIImage.new()
	ring2:setLeftRight( false, false, -114, 114 )
	ring2:setTopBottom( false, false, -114, 114 )
	ring2:setRGB( 0.73, 0.89, 0.93 )
	ring2:setAlpha( 0.4 )
	ring2:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_ring2" ) )
	ring2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ring2 )
	self.ring2 = ring2
	
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

