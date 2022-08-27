-- 6171c44ebddfd069343e733c9571af9b
-- This hash is used for caching, delete to decompile the file again

CoD.bleedout_ring1 = InheritFrom( LUI.UIElement )
CoD.bleedout_ring1.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.bleedout_ring1 )
	self.id = "bleedout_ring1"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 228 )
	self:setTopBottom( true, false, 0, 228 )
	
	local ring1 = LUI.UIImage.new()
	ring1:setLeftRight( false, false, -114, 114 )
	ring1:setTopBottom( false, false, -114, 114 )
	ring1:setRGB( 0.73, 0.89, 0.93 )
	ring1:setAlpha( 0.4 )
	ring1:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_ring1" ) )
	ring1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ring1 )
	self.ring1 = ring1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -114, 114 )
	Image0:setTopBottom( false, false, -114, 114 )
	Image0:setRGB( 0.73, 0.89, 0.93 )
	Image0:setAlpha( 0.4 )
	Image0:setZoom( -15 )
	Image0:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_ring1rgb" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
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

