CoD.bleedout_ring3_top = InheritFrom( LUI.UIElement )
CoD.bleedout_ring3_top.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.bleedout_ring3_top )
	self.id = "bleedout_ring3_top"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 36 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -60, 60 )
	Image0:setTopBottom( true, false, 0, 36 )
	Image0:setRGB( 0.73, 0.89, 0.93 )
	Image0:setAlpha( 0.15 )
	Image0:setZoom( -25 )
	Image0:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_ring3rgb" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local ring3top = LUI.UIImage.new()
	ring3top:setLeftRight( false, false, -60, 60 )
	ring3top:setTopBottom( true, false, 0, 36 )
	ring3top:setRGB( 0.73, 0.89, 0.93 )
	ring3top:setAlpha( 0.3 )
	ring3top:setZoom( 10 )
	ring3top:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_ring3" ) )
	ring3top:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ring3top )
	self.ring3top = ring3top
	
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

