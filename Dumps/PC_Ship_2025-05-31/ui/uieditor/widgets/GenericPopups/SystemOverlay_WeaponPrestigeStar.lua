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
	self:setLeftRight( true, false, 0, 22 )
	self:setTopBottom( true, false, 0, 22 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 22 )
	Image0:setTopBottom( true, false, 0, 22 )
	Image0:setRGB( 0.97, 0.93, 0.07 )
	Image0:setImage( RegisterImage( "uie_t7_arena_star_lrg_white" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Image0:completeAnimation()
				self.Image0:setRGB( 0.97, 0.93, 0.07 )
				self.clipFinished( Image0, {} )
			end
		},
		DoubleWeaponXP = {
			DefaultClip = function ()
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

