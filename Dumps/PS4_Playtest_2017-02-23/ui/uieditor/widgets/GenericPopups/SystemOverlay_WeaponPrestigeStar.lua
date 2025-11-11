CoD.SystemOverlay_WeaponPrestigeStar = InheritFrom( LUI.UIElement )
CoD.SystemOverlay_WeaponPrestigeStar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlay_WeaponPrestigeStar )
	self.id = "SystemOverlay_WeaponPrestigeStar"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 33 )
	self:setTopBottom( 0, 0, 0, 33 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 0, 33 )
	Image0:setTopBottom( 0, 0, 0, 33 )
	Image0:setRGB( 0.97, 0.93, 0.07 )
	Image0:setImage( RegisterImage( "uie_t7_arena_star_lrg_white" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.resetProperties = function ()
		Image0:completeAnimation()
		Image0:setRGB( 0.97, 0.93, 0.07 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		DoubleWeaponXP = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Image0:completeAnimation()
				self.Image0:setRGB( 0.59, 0.36, 0.89 )
				self.clipFinished( Image0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DoubleWeaponXP",
			condition = function ( menu, element, event )
				return IsDoubleWeaponXP( controller )
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

