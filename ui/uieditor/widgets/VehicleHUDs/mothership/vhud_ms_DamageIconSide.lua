-- bc2e1b9d004dd465363ddb3db2a12de3
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_ms_DamageIconSide = InheritFrom( LUI.UIElement )
CoD.vhud_ms_DamageIconSide.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_DamageIconSide )
	self.id = "vhud_ms_DamageIconSide"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 26 )
	self:setTopBottom( true, false, 0, 26 )
	
	local msDamageRight = LUI.UIImage.new()
	msDamageRight:setLeftRight( true, true, 0, 0 )
	msDamageRight:setTopBottom( true, true, 0, 0 )
	msDamageRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_damageredside" ) )
	self:addElement( msDamageRight )
	self.msDamageRight = msDamageRight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				msDamageRight:completeAnimation()
				self.msDamageRight:setAlpha( 1 )
				self.clipFinished( msDamageRight, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				msDamageRight:completeAnimation()
				self.msDamageRight:setAlpha( 0 )
				self.clipFinished( msDamageRight, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

