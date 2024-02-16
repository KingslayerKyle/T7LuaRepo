-- 4b60eb2f216bb30c40c60ed93a13b83c
-- This hash is used for caching, delete to decompile the file again

CoD.ZmAmmo_EquipTac = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_EquipTac.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_EquipTac )
	self.id = "ZmAmmo_EquipTac"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 37 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Tactical0 = LUI.UIImage.new()
	Tactical0:setLeftRight( true, false, 13.75, 39.25 )
	Tactical0:setTopBottom( true, false, 1, 26.5 )
	Tactical0:setRGB( 1, 0.62, 0.11 )
	Tactical0:setImage( RegisterImage( "uie_t7_zm_hud_inv_icntact" ) )
	self:addElement( Tactical0 )
	self.Tactical0 = Tactical0
	
	local Tactical1b = LUI.UIImage.new()
	Tactical1b:setLeftRight( true, false, 9, 34.5 )
	Tactical1b:setTopBottom( true, false, 2, 27.5 )
	Tactical1b:setRGB( 0, 0, 0 )
	Tactical1b:setImage( RegisterImage( "uie_t7_zm_hud_inv_icntact" ) )
	self:addElement( Tactical1b )
	self.Tactical1b = Tactical1b
	
	local Tactical1 = LUI.UIImage.new()
	Tactical1:setLeftRight( true, false, 8, 33.5 )
	Tactical1:setTopBottom( true, false, 3, 28.5 )
	Tactical1:setRGB( 1, 0.62, 0.11 )
	Tactical1:setImage( RegisterImage( "uie_t7_zm_hud_inv_icntact" ) )
	self:addElement( Tactical1 )
	self.Tactical1 = Tactical1
	
	local Tactical2b = LUI.UIImage.new()
	Tactical2b:setLeftRight( true, false, 3, 28.5 )
	Tactical2b:setTopBottom( true, false, 4, 29.5 )
	Tactical2b:setRGB( 0, 0, 0 )
	Tactical2b:setImage( RegisterImage( "uie_t7_zm_hud_inv_icntact" ) )
	self:addElement( Tactical2b )
	self.Tactical2b = Tactical2b
	
	local Tactical2 = LUI.UIImage.new()
	Tactical2:setLeftRight( true, false, 2, 27.5 )
	Tactical2:setTopBottom( true, false, 5, 30.5 )
	Tactical2:setRGB( 1, 0.62, 0.11 )
	Tactical2:setImage( RegisterImage( "uie_t7_zm_hud_inv_icntact" ) )
	self:addElement( Tactical2 )
	self.Tactical2 = Tactical2
	
	local Tactical3b = LUI.UIImage.new()
	Tactical3b:setLeftRight( true, false, -3, 22.5 )
	Tactical3b:setTopBottom( true, false, 6, 31.5 )
	Tactical3b:setRGB( 0, 0, 0 )
	Tactical3b:setImage( RegisterImage( "uie_t7_zm_hud_inv_icntact" ) )
	self:addElement( Tactical3b )
	self.Tactical3b = Tactical3b
	
	local Tactical3 = LUI.UIImage.new()
	Tactical3:setLeftRight( true, false, -4, 21.5 )
	Tactical3:setTopBottom( true, false, 7, 32.5 )
	Tactical3:setImage( RegisterImage( "uie_t7_zm_hud_inv_icntact" ) )
	self:addElement( Tactical3 )
	self.Tactical3 = Tactical3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				Tactical0:completeAnimation()
				self.Tactical0:setLeftRight( true, false, 13.75, 39.25 )
				self.Tactical0:setTopBottom( true, false, 1, 26.5 )
				self.Tactical0:setRGB( 1, 0.62, 0.11 )
				self.Tactical0:setAlpha( 0 )
				self.clipFinished( Tactical0, {} )

				Tactical1b:completeAnimation()
				self.Tactical1b:setLeftRight( true, false, 9, 34.5 )
				self.Tactical1b:setTopBottom( true, false, 2, 27.5 )
				self.Tactical1b:setAlpha( 0 )
				self.clipFinished( Tactical1b, {} )

				Tactical1:completeAnimation()
				self.Tactical1:setLeftRight( true, false, 8, 33.5 )
				self.Tactical1:setTopBottom( true, false, 3, 28.5 )
				self.Tactical1:setRGB( 1, 0.62, 0.11 )
				self.Tactical1:setAlpha( 0 )
				self.clipFinished( Tactical1, {} )

				Tactical2b:completeAnimation()
				self.Tactical2b:setLeftRight( true, false, 3, 28.5 )
				self.Tactical2b:setTopBottom( true, false, 4, 29.5 )
				self.Tactical2b:setAlpha( 0 )
				self.clipFinished( Tactical2b, {} )

				Tactical2:completeAnimation()
				self.Tactical2:setLeftRight( true, false, 2, 27.5 )
				self.Tactical2:setTopBottom( true, false, 5, 30.5 )
				self.Tactical2:setRGB( 1, 0.62, 0.11 )
				self.Tactical2:setAlpha( 0 )
				self.clipFinished( Tactical2, {} )

				Tactical3b:completeAnimation()
				self.Tactical3b:setLeftRight( true, false, -3, 22.5 )
				self.Tactical3b:setTopBottom( true, false, 6, 31.5 )
				self.Tactical3b:setAlpha( 0 )
				self.clipFinished( Tactical3b, {} )

				Tactical3:completeAnimation()
				self.Tactical3:setLeftRight( true, false, -4, 21.5 )
				self.Tactical3:setTopBottom( true, false, 7, 32.5 )
				self.Tactical3:setRGB( 1, 1, 1 )
				self.Tactical3:setAlpha( 0 )
				self.clipFinished( Tactical3, {} )
			end
		},
		Single = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				Tactical0:completeAnimation()
				self.Tactical0:setLeftRight( true, false, -4, 21.5 )
				self.Tactical0:setTopBottom( true, false, 7, 32.5 )
				self.Tactical0:setRGB( 1, 1, 1 )
				self.Tactical0:setAlpha( 1 )
				self.clipFinished( Tactical0, {} )

				Tactical1b:completeAnimation()
				self.Tactical1b:setLeftRight( true, false, -9, 16.5 )
				self.Tactical1b:setTopBottom( true, false, 8, 33.5 )
				self.Tactical1b:setAlpha( 0 )
				self.clipFinished( Tactical1b, {} )

				Tactical1:completeAnimation()
				self.Tactical1:setLeftRight( true, false, -10, 15.5 )
				self.Tactical1:setTopBottom( true, false, 9, 34.5 )
				self.Tactical1:setRGB( 1, 0.62, 0.11 )
				self.Tactical1:setAlpha( 0 )
				self.clipFinished( Tactical1, {} )

				Tactical2b:completeAnimation()
				self.Tactical2b:setLeftRight( true, false, -15, 10.5 )
				self.Tactical2b:setTopBottom( true, false, 10, 35.5 )
				self.Tactical2b:setAlpha( 0 )
				self.clipFinished( Tactical2b, {} )

				Tactical2:completeAnimation()
				self.Tactical2:setLeftRight( true, false, -16, 9.5 )
				self.Tactical2:setTopBottom( true, false, 11, 36.5 )
				self.Tactical2:setRGB( 1, 0.62, 0.11 )
				self.Tactical2:setAlpha( 0 )
				self.clipFinished( Tactical2, {} )

				Tactical3b:completeAnimation()
				self.Tactical3b:setLeftRight( true, false, -21, 4.5 )
				self.Tactical3b:setTopBottom( true, false, 12, 37.5 )
				self.Tactical3b:setAlpha( 0 )
				self.clipFinished( Tactical3b, {} )

				Tactical3:completeAnimation()
				self.Tactical3:setLeftRight( true, false, -22, 3.5 )
				self.Tactical3:setTopBottom( true, false, 13, 38.5 )
				self.Tactical3:setRGB( 1, 1, 1 )
				self.Tactical3:setAlpha( 0 )
				self.clipFinished( Tactical3, {} )
			end
		},
		Double = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				Tactical0:completeAnimation()
				self.Tactical0:setLeftRight( true, false, 1.75, 27.25 )
				self.Tactical0:setTopBottom( true, false, 5, 30.5 )
				self.Tactical0:setRGB( 1, 0.62, 0.11 )
				self.Tactical0:setAlpha( 1 )
				self.clipFinished( Tactical0, {} )

				Tactical1b:completeAnimation()
				self.Tactical1b:setLeftRight( true, false, -3, 22.5 )
				self.Tactical1b:setTopBottom( true, false, 6, 31.5 )
				self.Tactical1b:setAlpha( 1 )
				self.clipFinished( Tactical1b, {} )

				Tactical1:completeAnimation()
				self.Tactical1:setLeftRight( true, false, -4, 21.5 )
				self.Tactical1:setTopBottom( true, false, 7, 32.5 )
				self.Tactical1:setRGB( 1, 1, 1 )
				self.Tactical1:setAlpha( 1 )
				self.clipFinished( Tactical1, {} )

				Tactical2b:completeAnimation()
				self.Tactical2b:setLeftRight( true, false, -9, 16.5 )
				self.Tactical2b:setTopBottom( true, false, 8, 33.5 )
				self.Tactical2b:setAlpha( 0 )
				self.clipFinished( Tactical2b, {} )

				Tactical2:completeAnimation()
				self.Tactical2:setLeftRight( true, false, -10, 15.5 )
				self.Tactical2:setTopBottom( true, false, 9, 34.5 )
				self.Tactical2:setRGB( 1, 0.62, 0.11 )
				self.Tactical2:setAlpha( 0 )
				self.clipFinished( Tactical2, {} )

				Tactical3b:completeAnimation()
				self.Tactical3b:setLeftRight( true, false, -15, 10.5 )
				self.Tactical3b:setTopBottom( true, false, 10, 35.5 )
				self.Tactical3b:setAlpha( 0 )
				self.clipFinished( Tactical3b, {} )

				Tactical3:completeAnimation()
				self.Tactical3:setLeftRight( true, false, -16, 9.5 )
				self.Tactical3:setTopBottom( true, false, 11, 36.5 )
				self.Tactical3:setRGB( 1, 1, 1 )
				self.Tactical3:setAlpha( 0 )
				self.clipFinished( Tactical3, {} )
			end
		},
		Triple = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				Tactical0:completeAnimation()
				self.Tactical0:setLeftRight( true, false, 7.75, 33.25 )
				self.Tactical0:setTopBottom( true, false, 3, 28.5 )
				self.Tactical0:setRGB( 1, 0.62, 0.11 )
				self.Tactical0:setAlpha( 1 )
				self.clipFinished( Tactical0, {} )

				Tactical1b:completeAnimation()
				self.Tactical1b:setLeftRight( true, false, 3, 28.5 )
				self.Tactical1b:setTopBottom( true, false, 4, 29.5 )
				self.Tactical1b:setAlpha( 1 )
				self.clipFinished( Tactical1b, {} )

				Tactical1:completeAnimation()
				self.Tactical1:setLeftRight( true, false, 2, 27.5 )
				self.Tactical1:setTopBottom( true, false, 5, 30.5 )
				self.Tactical1:setRGB( 1, 0.62, 0.11 )
				self.Tactical1:setAlpha( 1 )
				self.clipFinished( Tactical1, {} )

				Tactical2b:completeAnimation()
				self.Tactical2b:setLeftRight( true, false, -3, 22.5 )
				self.Tactical2b:setTopBottom( true, false, 6, 31.5 )
				self.Tactical2b:setAlpha( 1 )
				self.clipFinished( Tactical2b, {} )

				Tactical2:completeAnimation()
				self.Tactical2:setLeftRight( true, false, -4, 21.5 )
				self.Tactical2:setTopBottom( true, false, 7, 32.5 )
				self.Tactical2:setRGB( 1, 1, 1 )
				self.Tactical2:setAlpha( 1 )
				self.clipFinished( Tactical2, {} )

				Tactical3b:completeAnimation()
				self.Tactical3b:setLeftRight( true, false, -9, 16.5 )
				self.Tactical3b:setTopBottom( true, false, 8, 33.5 )
				self.Tactical3b:setAlpha( 0 )
				self.clipFinished( Tactical3b, {} )

				Tactical3:completeAnimation()
				self.Tactical3:setLeftRight( true, false, -10, 15.5 )
				self.Tactical3:setTopBottom( true, false, 9, 34.5 )
				self.Tactical3:setRGB( 1, 1, 1 )
				self.Tactical3:setAlpha( 0 )
				self.clipFinished( Tactical3, {} )
			end
		},
		Quad = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				Tactical0:completeAnimation()
				self.Tactical0:setLeftRight( true, false, 13.75, 39.25 )
				self.Tactical0:setTopBottom( true, false, 1, 26.5 )
				self.Tactical0:setRGB( 1, 0.62, 0.11 )
				self.Tactical0:setAlpha( 1 )
				self.clipFinished( Tactical0, {} )

				Tactical1b:completeAnimation()
				self.Tactical1b:setLeftRight( true, false, 9, 34.5 )
				self.Tactical1b:setTopBottom( true, false, 2, 27.5 )
				self.Tactical1b:setAlpha( 1 )
				self.clipFinished( Tactical1b, {} )

				Tactical1:completeAnimation()
				self.Tactical1:setLeftRight( true, false, 8, 33.5 )
				self.Tactical1:setTopBottom( true, false, 3, 28.5 )
				self.Tactical1:setRGB( 1, 0.62, 0.11 )
				self.Tactical1:setAlpha( 1 )
				self.clipFinished( Tactical1, {} )

				Tactical2b:completeAnimation()
				self.Tactical2b:setLeftRight( true, false, 3, 28.5 )
				self.Tactical2b:setTopBottom( true, false, 4, 29.5 )
				self.Tactical2b:setAlpha( 1 )
				self.clipFinished( Tactical2b, {} )

				Tactical2:completeAnimation()
				self.Tactical2:setLeftRight( true, false, 2, 27.5 )
				self.Tactical2:setTopBottom( true, false, 5, 30.5 )
				self.Tactical2:setRGB( 1, 0.62, 0.11 )
				self.Tactical2:setAlpha( 1 )
				self.clipFinished( Tactical2, {} )

				Tactical3b:completeAnimation()
				self.Tactical3b:setLeftRight( true, false, -3, 22.5 )
				self.Tactical3b:setTopBottom( true, false, 6, 31.5 )
				self.Tactical3b:setAlpha( 1 )
				self.clipFinished( Tactical3b, {} )

				Tactical3:completeAnimation()
				self.Tactical3:setLeftRight( true, false, -4, 21.5 )
				self.Tactical3:setTopBottom( true, false, 7, 32.5 )
				self.Tactical3:setRGB( 1, 1, 1 )
				self.Tactical3:setAlpha( 1 )
				self.clipFinished( Tactical3, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
