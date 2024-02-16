-- ec1442670198d1a31108124d7dc7c2a2
-- This hash is used for caching, delete to decompile the file again

CoD.lmgInfiniteReticle_AmmoBar = InheritFrom( LUI.UIElement )
CoD.lmgInfiniteReticle_AmmoBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.lmgInfiniteReticle_AmmoBar )
	self.id = "lmgInfiniteReticle_AmmoBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 103 )
	self:setTopBottom( true, false, 0, 12 )
	
	local ammoEmpty = LUI.UIImage.new()
	ammoEmpty:setLeftRight( true, true, 0, 0 )
	ammoEmpty:setTopBottom( true, true, 0, 0 )
	ammoEmpty:setRGB( 0.16, 0.16, 0.16 )
	ammoEmpty:setAlpha( 0.9 )
	ammoEmpty:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_ammo_empty" ) )
	self:addElement( ammoEmpty )
	self.ammoEmpty = ammoEmpty
	
	local ammoFull = LUI.UIImage.new()
	ammoFull:setLeftRight( true, true, 0, 0 )
	ammoFull:setTopBottom( true, true, 0, 0 )
	ammoFull:setRGB( 0.33, 0.95, 0.81 )
	ammoFull:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_ammo" ) )
	ammoFull:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ammoFull:setShaderVector( 0, 1, 0, 0, 0 )
	ammoFull:setShaderVector( 1, 0, 0, 0, 0 )
	ammoFull:setShaderVector( 2, 1, 0, 0, 0 )
	ammoFull:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( ammoFull )
	self.ammoFull = ammoFull
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
