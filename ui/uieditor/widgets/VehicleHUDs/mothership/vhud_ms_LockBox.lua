-- 456e4998a111d341538f5a1abd9466b0
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_ms_LockBox = InheritFrom( LUI.UIElement )
CoD.vhud_ms_LockBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_LockBox )
	self.id = "vhud_ms_LockBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 55 )
	self:setTopBottom( true, false, 0, 55 )
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( false, false, -39.35, 39.35 )
	Glow:setTopBottom( false, false, -23.5, 22.59 )
	Glow:setRGB( 1, 0.52, 0 )
	Glow:setAlpha( 0.4 )
	Glow:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_textlockonglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local msLockOn = LUI.UIImage.new()
	msLockOn:setLeftRight( false, false, -27.59, 27.59 )
	msLockOn:setTopBottom( false, false, -27.5, 27.68 )
	msLockOn:setRGB( 1, 0.07, 0 )
	msLockOn:setAlpha( 0.7 )
	msLockOn:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_textlockon" ) )
	msLockOn:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msLockOn )
	self.msLockOn = msLockOn
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )

				msLockOn:completeAnimation()
				self.msLockOn:setAlpha( 0 )
				self.clipFinished( msLockOn, {} )
			end
		},
		On = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0.2 )
				self.clipFinished( Glow, {} )

				msLockOn:completeAnimation()
				self.msLockOn:setAlpha( 0.7 )
				self.clipFinished( msLockOn, {} )
			end
		},
		HasLock = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )

				msLockOn:completeAnimation()
				self.msLockOn:setAlpha( 0.7 )
				self.clipFinished( msLockOn, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

