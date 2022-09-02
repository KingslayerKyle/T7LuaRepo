-- 8c466846d0ce50a5cb4d39be15fbfae3
-- This hash is used for caching, delete to decompile the file again

CoD.ZmAmmo_DpadLeftAmmoDigitsFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_DpadLeftAmmoDigitsFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_DpadLeftAmmoDigitsFactory )
	self.id = "ZmAmmo_DpadLeftAmmoDigitsFactory"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 12 )
	self:setTopBottom( true, false, 0, 18 )
	
	local Number9 = LUI.UIImage.new()
	Number9:setLeftRight( true, false, -15, 26 )
	Number9:setTopBottom( true, false, -10, 29 )
	Number9:setAlpha( 0 )
	Number9:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_noglow_number9" ) )
	Number9:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Number9 )
	self.Number9 = Number9
	
	local Number8 = LUI.UIImage.new()
	Number8:setLeftRight( true, false, -15, 26 )
	Number8:setTopBottom( true, false, -10, 29 )
	Number8:setAlpha( 0 )
	Number8:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_noglow_number8" ) )
	Number8:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Number8 )
	self.Number8 = Number8
	
	local Number7 = LUI.UIImage.new()
	Number7:setLeftRight( true, false, -15, 26 )
	Number7:setTopBottom( true, false, -10, 29 )
	Number7:setAlpha( 0 )
	Number7:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_noglow_number7" ) )
	Number7:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Number7 )
	self.Number7 = Number7
	
	local Number6 = LUI.UIImage.new()
	Number6:setLeftRight( true, false, -15, 26 )
	Number6:setTopBottom( true, false, -10, 29 )
	Number6:setAlpha( 0 )
	Number6:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_noglow_number6" ) )
	Number6:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Number6 )
	self.Number6 = Number6
	
	local Number5 = LUI.UIImage.new()
	Number5:setLeftRight( true, false, -15, 26 )
	Number5:setTopBottom( true, false, -10, 29 )
	Number5:setAlpha( 0 )
	Number5:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_noglow_number5" ) )
	Number5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Number5 )
	self.Number5 = Number5
	
	local Number4 = LUI.UIImage.new()
	Number4:setLeftRight( true, false, -15, 26 )
	Number4:setTopBottom( true, false, -10, 29 )
	Number4:setAlpha( 0 )
	Number4:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_noglow_number4" ) )
	Number4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Number4 )
	self.Number4 = Number4
	
	local Number3 = LUI.UIImage.new()
	Number3:setLeftRight( true, false, -15, 26 )
	Number3:setTopBottom( true, false, -10, 29 )
	Number3:setAlpha( 0 )
	Number3:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_noglow_number3" ) )
	Number3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Number3 )
	self.Number3 = Number3
	
	local Number2 = LUI.UIImage.new()
	Number2:setLeftRight( true, false, -15, 26 )
	Number2:setTopBottom( true, false, -10, 29 )
	Number2:setAlpha( 0 )
	Number2:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_noglow_number2" ) )
	Number2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Number2 )
	self.Number2 = Number2
	
	local Number1 = LUI.UIImage.new()
	Number1:setLeftRight( true, false, -15, 26 )
	Number1:setTopBottom( true, false, -10, 29 )
	Number1:setAlpha( 0 )
	Number1:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_noglow_number1" ) )
	Number1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Number1 )
	self.Number1 = Number1
	
	local Number0 = LUI.UIImage.new()
	Number0:setLeftRight( true, false, -15, 26 )
	Number0:setTopBottom( true, false, -10, 29 )
	Number0:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_noglow_number0" ) )
	self:addElement( Number0 )
	self.Number0 = Number0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Number9:completeAnimation()
				self.Number9:setAlpha( 0 )
				self.clipFinished( Number9, {} )

				Number8:completeAnimation()
				self.Number8:setAlpha( 0 )
				self.clipFinished( Number8, {} )

				Number7:completeAnimation()
				self.Number7:setAlpha( 0 )
				self.clipFinished( Number7, {} )

				Number6:completeAnimation()
				self.Number6:setAlpha( 0 )
				self.clipFinished( Number6, {} )

				Number5:completeAnimation()
				self.Number5:setAlpha( 0 )
				self.clipFinished( Number5, {} )

				Number4:completeAnimation()
				self.Number4:setAlpha( 0 )
				self.clipFinished( Number4, {} )

				Number3:completeAnimation()
				self.Number3:setAlpha( 0 )
				self.clipFinished( Number3, {} )

				Number2:completeAnimation()
				self.Number2:setAlpha( 0 )
				self.clipFinished( Number2, {} )

				Number1:completeAnimation()
				self.Number1:setAlpha( 0 )
				self.clipFinished( Number1, {} )

				Number0:completeAnimation()
				self.Number0:setAlpha( 0 )
				self.clipFinished( Number0, {} )
			end
		},
		Show9 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Number9:completeAnimation()
				self.Number9:setAlpha( 1 )
				self.clipFinished( Number9, {} )

				Number8:completeAnimation()
				self.Number8:setAlpha( 0 )
				self.clipFinished( Number8, {} )

				Number7:completeAnimation()
				self.Number7:setAlpha( 0 )
				self.clipFinished( Number7, {} )

				Number6:completeAnimation()
				self.Number6:setAlpha( 0 )
				self.clipFinished( Number6, {} )

				Number5:completeAnimation()
				self.Number5:setAlpha( 0 )
				self.clipFinished( Number5, {} )

				Number4:completeAnimation()
				self.Number4:setAlpha( 0 )
				self.clipFinished( Number4, {} )

				Number3:completeAnimation()
				self.Number3:setAlpha( 0 )
				self.clipFinished( Number3, {} )

				Number2:completeAnimation()
				self.Number2:setAlpha( 0 )
				self.clipFinished( Number2, {} )

				Number1:completeAnimation()
				self.Number1:setAlpha( 0 )
				self.clipFinished( Number1, {} )

				Number0:completeAnimation()
				self.Number0:setAlpha( 0 )
				self.clipFinished( Number0, {} )
			end
		},
		Show8 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Number9:completeAnimation()
				self.Number9:setAlpha( 0 )
				self.clipFinished( Number9, {} )

				Number8:completeAnimation()
				self.Number8:setAlpha( 1 )
				self.clipFinished( Number8, {} )

				Number7:completeAnimation()
				self.Number7:setAlpha( 0 )
				self.clipFinished( Number7, {} )

				Number6:completeAnimation()
				self.Number6:setAlpha( 0 )
				self.clipFinished( Number6, {} )

				Number5:completeAnimation()
				self.Number5:setAlpha( 0 )
				self.clipFinished( Number5, {} )

				Number4:completeAnimation()
				self.Number4:setAlpha( 0 )
				self.clipFinished( Number4, {} )

				Number3:completeAnimation()
				self.Number3:setAlpha( 0 )
				self.clipFinished( Number3, {} )

				Number2:completeAnimation()
				self.Number2:setAlpha( 0 )
				self.clipFinished( Number2, {} )

				Number1:completeAnimation()
				self.Number1:setAlpha( 0 )
				self.clipFinished( Number1, {} )

				Number0:completeAnimation()
				self.Number0:setAlpha( 0 )
				self.clipFinished( Number0, {} )
			end
		},
		Show7 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Number9:completeAnimation()
				self.Number9:setAlpha( 0 )
				self.clipFinished( Number9, {} )

				Number8:completeAnimation()
				self.Number8:setAlpha( 0 )
				self.clipFinished( Number8, {} )

				Number7:completeAnimation()
				self.Number7:setAlpha( 1 )
				self.clipFinished( Number7, {} )

				Number6:completeAnimation()
				self.Number6:setAlpha( 0 )
				self.clipFinished( Number6, {} )

				Number5:completeAnimation()
				self.Number5:setAlpha( 0 )
				self.clipFinished( Number5, {} )

				Number4:completeAnimation()
				self.Number4:setAlpha( 0 )
				self.clipFinished( Number4, {} )

				Number3:completeAnimation()
				self.Number3:setAlpha( 0 )
				self.clipFinished( Number3, {} )

				Number2:completeAnimation()
				self.Number2:setAlpha( 0 )
				self.clipFinished( Number2, {} )

				Number1:completeAnimation()
				self.Number1:setAlpha( 0 )
				self.clipFinished( Number1, {} )

				Number0:completeAnimation()
				self.Number0:setAlpha( 0 )
				self.clipFinished( Number0, {} )
			end
		},
		Show6 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Number9:completeAnimation()
				self.Number9:setAlpha( 0 )
				self.clipFinished( Number9, {} )

				Number8:completeAnimation()
				self.Number8:setAlpha( 0 )
				self.clipFinished( Number8, {} )

				Number7:completeAnimation()
				self.Number7:setAlpha( 0 )
				self.clipFinished( Number7, {} )

				Number6:completeAnimation()
				self.Number6:setAlpha( 1 )
				self.clipFinished( Number6, {} )

				Number5:completeAnimation()
				self.Number5:setAlpha( 0 )
				self.clipFinished( Number5, {} )

				Number4:completeAnimation()
				self.Number4:setAlpha( 0 )
				self.clipFinished( Number4, {} )

				Number3:completeAnimation()
				self.Number3:setAlpha( 0 )
				self.clipFinished( Number3, {} )

				Number2:completeAnimation()
				self.Number2:setAlpha( 0 )
				self.clipFinished( Number2, {} )

				Number1:completeAnimation()
				self.Number1:setAlpha( 0 )
				self.clipFinished( Number1, {} )

				Number0:completeAnimation()
				self.Number0:setAlpha( 0 )
				self.clipFinished( Number0, {} )
			end
		},
		Show5 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Number9:completeAnimation()
				self.Number9:setAlpha( 0 )
				self.clipFinished( Number9, {} )

				Number8:completeAnimation()
				self.Number8:setAlpha( 0 )
				self.clipFinished( Number8, {} )

				Number7:completeAnimation()
				self.Number7:setAlpha( 0 )
				self.clipFinished( Number7, {} )

				Number6:completeAnimation()
				self.Number6:setAlpha( 0 )
				self.clipFinished( Number6, {} )

				Number5:completeAnimation()
				self.Number5:setAlpha( 1 )
				self.clipFinished( Number5, {} )

				Number4:completeAnimation()
				self.Number4:setAlpha( 0 )
				self.clipFinished( Number4, {} )

				Number3:completeAnimation()
				self.Number3:setAlpha( 0 )
				self.clipFinished( Number3, {} )

				Number2:completeAnimation()
				self.Number2:setAlpha( 0 )
				self.clipFinished( Number2, {} )

				Number1:completeAnimation()
				self.Number1:setAlpha( 0 )
				self.clipFinished( Number1, {} )

				Number0:completeAnimation()
				self.Number0:setAlpha( 0 )
				self.clipFinished( Number0, {} )
			end
		},
		Show4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Number9:completeAnimation()
				self.Number9:setAlpha( 0 )
				self.clipFinished( Number9, {} )

				Number8:completeAnimation()
				self.Number8:setAlpha( 0 )
				self.clipFinished( Number8, {} )

				Number7:completeAnimation()
				self.Number7:setAlpha( 0 )
				self.clipFinished( Number7, {} )

				Number6:completeAnimation()
				self.Number6:setAlpha( 0 )
				self.clipFinished( Number6, {} )

				Number5:completeAnimation()
				self.Number5:setAlpha( 0 )
				self.clipFinished( Number5, {} )

				Number4:completeAnimation()
				self.Number4:setAlpha( 1 )
				self.clipFinished( Number4, {} )

				Number3:completeAnimation()
				self.Number3:setAlpha( 0 )
				self.clipFinished( Number3, {} )

				Number2:completeAnimation()
				self.Number2:setAlpha( 0 )
				self.clipFinished( Number2, {} )

				Number1:completeAnimation()
				self.Number1:setAlpha( 0 )
				self.clipFinished( Number1, {} )

				Number0:completeAnimation()
				self.Number0:setAlpha( 0 )
				self.clipFinished( Number0, {} )
			end
		},
		Show3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Number9:completeAnimation()
				self.Number9:setAlpha( 0 )
				self.clipFinished( Number9, {} )

				Number8:completeAnimation()
				self.Number8:setAlpha( 0 )
				self.clipFinished( Number8, {} )

				Number7:completeAnimation()
				self.Number7:setAlpha( 0 )
				self.clipFinished( Number7, {} )

				Number6:completeAnimation()
				self.Number6:setAlpha( 0 )
				self.clipFinished( Number6, {} )

				Number5:completeAnimation()
				self.Number5:setAlpha( 0 )
				self.clipFinished( Number5, {} )

				Number4:completeAnimation()
				self.Number4:setAlpha( 0 )
				self.clipFinished( Number4, {} )

				Number3:completeAnimation()
				self.Number3:setAlpha( 1 )
				self.clipFinished( Number3, {} )

				Number2:completeAnimation()
				self.Number2:setAlpha( 0 )
				self.clipFinished( Number2, {} )

				Number1:completeAnimation()
				self.Number1:setAlpha( 0 )
				self.clipFinished( Number1, {} )

				Number0:completeAnimation()
				self.Number0:setAlpha( 0 )
				self.clipFinished( Number0, {} )
			end
		},
		Show2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				Number5:completeAnimation()
				self.Number5:setAlpha( 0 )
				self.clipFinished( Number5, {} )

				Number4:completeAnimation()
				self.Number4:setAlpha( 0 )
				self.clipFinished( Number4, {} )

				Number3:completeAnimation()
				self.Number3:setAlpha( 0 )
				self.clipFinished( Number3, {} )

				Number2:completeAnimation()
				self.Number2:setAlpha( 1 )
				self.clipFinished( Number2, {} )

				Number1:completeAnimation()
				self.Number1:setAlpha( 0 )
				self.clipFinished( Number1, {} )

				Number0:completeAnimation()
				self.Number0:setAlpha( 0 )
				self.clipFinished( Number0, {} )
			end
		},
		Show1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Number9:completeAnimation()
				self.Number9:setAlpha( 0 )
				self.clipFinished( Number9, {} )

				Number8:completeAnimation()
				self.Number8:setAlpha( 0 )
				self.clipFinished( Number8, {} )

				Number7:completeAnimation()
				self.Number7:setAlpha( 0 )
				self.clipFinished( Number7, {} )

				Number6:completeAnimation()
				self.Number6:setAlpha( 0 )
				self.clipFinished( Number6, {} )

				Number5:completeAnimation()
				self.Number5:setAlpha( 0 )
				self.clipFinished( Number5, {} )

				Number4:completeAnimation()
				self.Number4:setAlpha( 0 )
				self.clipFinished( Number4, {} )

				Number3:completeAnimation()
				self.Number3:setAlpha( 0 )
				self.clipFinished( Number3, {} )

				Number2:completeAnimation()
				self.Number2:setAlpha( 0 )
				self.clipFinished( Number2, {} )

				Number1:completeAnimation()
				self.Number1:setAlpha( 1 )
				self.clipFinished( Number1, {} )

				Number0:completeAnimation()
				self.Number0:setAlpha( 0 )
				self.clipFinished( Number0, {} )
			end
		},
		Show0 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				Number5:completeAnimation()
				self.Number5:setAlpha( 0 )
				self.clipFinished( Number5, {} )

				Number4:completeAnimation()
				self.Number4:setAlpha( 0 )
				self.clipFinished( Number4, {} )

				Number3:completeAnimation()
				self.Number3:setAlpha( 0 )
				self.clipFinished( Number3, {} )

				Number2:completeAnimation()
				self.Number2:setAlpha( 0 )
				self.clipFinished( Number2, {} )

				Number1:completeAnimation()
				self.Number1:setAlpha( 0 )
				self.clipFinished( Number1, {} )

				Number0:completeAnimation()
				self.Number0:setAlpha( 1 )
				self.clipFinished( Number0, {} )
			end
		},
		Faded = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Number9:completeAnimation()
				self.Number9:setAlpha( 0 )
				self.clipFinished( Number9, {} )

				Number8:completeAnimation()
				self.Number8:setAlpha( 0 )
				self.clipFinished( Number8, {} )

				Number7:completeAnimation()
				self.Number7:setAlpha( 0 )
				self.clipFinished( Number7, {} )

				Number6:completeAnimation()
				self.Number6:setAlpha( 0 )
				self.clipFinished( Number6, {} )

				Number5:completeAnimation()
				self.Number5:setAlpha( 0 )
				self.clipFinished( Number5, {} )

				Number4:completeAnimation()
				self.Number4:setAlpha( 0 )
				self.clipFinished( Number4, {} )

				Number3:completeAnimation()
				self.Number3:setAlpha( 0 )
				self.clipFinished( Number3, {} )

				Number2:completeAnimation()
				self.Number2:setAlpha( 0 )
				self.clipFinished( Number2, {} )

				Number1:completeAnimation()
				self.Number1:setAlpha( 0 )
				self.clipFinished( Number1, {} )

				Number0:completeAnimation()
				self.Number0:setAlpha( 0.2 )
				self.clipFinished( Number0, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				Number9:completeAnimation()
				self.Number9:setAlpha( 0 )
				self.clipFinished( Number9, {} )

				Number8:completeAnimation()
				self.Number8:setAlpha( 0 )
				self.clipFinished( Number8, {} )

				Number7:completeAnimation()
				self.Number7:setAlpha( 0 )
				self.clipFinished( Number7, {} )

				Number6:completeAnimation()
				self.Number6:setAlpha( 0 )
				self.clipFinished( Number6, {} )

				Number5:completeAnimation()
				self.Number5:setAlpha( 0 )
				self.clipFinished( Number5, {} )

				Number4:completeAnimation()
				self.Number4:setAlpha( 0 )
				self.clipFinished( Number4, {} )

				Number3:completeAnimation()
				self.Number3:setAlpha( 0 )
				self.clipFinished( Number3, {} )

				Number2:completeAnimation()
				self.Number2:setAlpha( 0 )
				self.clipFinished( Number2, {} )

				Number1:completeAnimation()
				self.Number1:setAlpha( 0 )
				self.clipFinished( Number1, {} )

				Number0:completeAnimation()
				self.Number0:setAlpha( 0 )
				self.clipFinished( Number0, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

