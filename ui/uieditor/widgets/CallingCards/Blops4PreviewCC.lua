-- e3097746dd27f71e945da08800c573e4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark1Img" )

CoD.Blops4PreviewCC = InheritFrom( LUI.UIElement )
CoD.Blops4PreviewCC.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.Blops4PreviewCC )
	self.id = "Blops4PreviewCC"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local CallingCardBlops4Bg = LUI.UIImage.new()
	CallingCardBlops4Bg:setLeftRight( true, false, 0, 480 )
	CallingCardBlops4Bg:setTopBottom( true, false, 0, 124 )
	CallingCardBlops4Bg:setImage( RegisterImage( "uie_t7_blops4_metal_backplate" ) )
	self:addElement( CallingCardBlops4Bg )
	self.CallingCardBlops4Bg = CallingCardBlops4Bg
	
	local BgBackplateSocket = LUI.UIImage.new()
	BgBackplateSocket:setLeftRight( false, false, 49, 177 )
	BgBackplateSocket:setTopBottom( false, false, -60, 68 )
	BgBackplateSocket:setImage( RegisterImage( "uie_t7_blops4_metal_socket" ) )
	BgBackplateSocket:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	BgBackplateSocket:setShaderVector( 0, 1, 0, 0, 0 )
	BgBackplateSocket:setShaderVector( 1, 0, 0, 0, 0 )
	BgBackplateSocket:setShaderVector( 2, 1, 0, 0, 0 )
	BgBackplateSocket:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( BgBackplateSocket )
	self.BgBackplateSocket = BgBackplateSocket
	
	local blops4BurnIn = LUI.UIImage.new()
	blops4BurnIn:setLeftRight( true, false, 289, 417 )
	blops4BurnIn:setTopBottom( true, false, 0, 128 )
	blops4BurnIn:setImage( RegisterImage( "uie_t7_blops4_burning" ) )
	blops4BurnIn:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	blops4BurnIn:setShaderVector( 0, 1, 0, 0, 0 )
	blops4BurnIn:setShaderVector( 1, 0, 0, 0, 0 )
	blops4BurnIn:setShaderVector( 2, 0.05, 0, 0, 0 )
	blops4BurnIn:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( blops4BurnIn )
	self.blops4BurnIn = blops4BurnIn
	
	local flare0 = LUI.UIImage.new()
	flare0:setLeftRight( true, false, 98, 610 )
	flare0:setTopBottom( true, false, -70.5, 207.5 )
	flare0:setScale( 0.56 )
	flare0:setImage( RegisterImage( "uie_t7_blops4_metal_lightflare" ) )
	flare0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( flare0 )
	self.flare0 = flare0
	
	local blops4LogoHot = LUI.UIImage.new()
	blops4LogoHot:setLeftRight( true, false, 290, 418 )
	blops4LogoHot:setTopBottom( true, false, 0, 128 )
	blops4LogoHot:setAlpha( 0 )
	blops4LogoHot:setImage( RegisterImage( "uie_t7_blops4_logo" ) )
	self:addElement( blops4LogoHot )
	self.blops4LogoHot = blops4LogoHot
	
	local blops4LogoHot0 = LUI.UIImage.new()
	blops4LogoHot0:setLeftRight( true, false, 290, 418 )
	blops4LogoHot0:setTopBottom( true, false, 0, 128 )
	blops4LogoHot0:setAlpha( 0.97 )
	blops4LogoHot0:setImage( RegisterImage( "uie_t7_blops4_glowbar" ) )
	blops4LogoHot0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( blops4LogoHot0 )
	self.blops4LogoHot0 = blops4LogoHot0
	
	local ZmFxSpark1Img0 = CoD.ZmFx_Spark1Img.new( menu, controller )
	ZmFxSpark1Img0:setLeftRight( true, false, 282, 394 )
	ZmFxSpark1Img0:setTopBottom( true, false, -45, 123 )
	ZmFxSpark1Img0:setAlpha( 0 )
	ZmFxSpark1Img0:setZRot( 200 )
	ZmFxSpark1Img0:setScale( 0.3 )
	ZmFxSpark1Img0.Image00:setShaderVector( 0, 10, 2, 0, 0 )
	ZmFxSpark1Img0.Image00:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( ZmFxSpark1Img0 )
	self.ZmFxSpark1Img0 = ZmFxSpark1Img0
	
	local ZmFxSpark1Img = CoD.ZmFx_Spark1Img.new( menu, controller )
	ZmFxSpark1Img:setLeftRight( true, false, 302, 414 )
	ZmFxSpark1Img:setTopBottom( true, false, -45, 123 )
	ZmFxSpark1Img:setAlpha( 0 )
	ZmFxSpark1Img:setYRot( 156 )
	ZmFxSpark1Img:setZRot( 185 )
	ZmFxSpark1Img:setScale( 0.3 )
	ZmFxSpark1Img.Image00:setShaderVector( 0, 10, 2, 0, 0 )
	ZmFxSpark1Img.Image00:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( ZmFxSpark1Img )
	self.ZmFxSpark1Img = ZmFxSpark1Img
	
	local ZmFxSpark1Img1 = CoD.ZmFx_Spark1Img.new( menu, controller )
	ZmFxSpark1Img1:setLeftRight( true, true, 321, -47 )
	ZmFxSpark1Img1:setTopBottom( true, true, -46, 2 )
	ZmFxSpark1Img1:setYRot( 156 )
	ZmFxSpark1Img1:setZRot( 185 )
	ZmFxSpark1Img1:setScale( 0.3 )
	ZmFxSpark1Img1.Image00:setShaderVector( 0, 10, 2, 0, 0 )
	ZmFxSpark1Img1.Image00:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( ZmFxSpark1Img1 )
	self.ZmFxSpark1Img1 = ZmFxSpark1Img1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 480 )
	Image0:setTopBottom( true, false, -128, 0 )
	Image0:setRGB( 0.35, 0.35, 0.35 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 480 )
	Image1:setTopBottom( true, false, 124, 252 )
	Image1:setRGB( 0.35, 0.35, 0.35 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				local CallingCardBlops4BgFrame2 = function ( CallingCardBlops4Bg, event )
					if not event.interrupted then
						CallingCardBlops4Bg:beginAnimation( "keyframe", 8000, false, false, CoD.TweenType.Linear )
					end
					CallingCardBlops4Bg:setImage( RegisterImage( "uie_t7_blops4_metal_backplate" ) )
					if event.interrupted then
						self.clipFinished( CallingCardBlops4Bg, event )
					else
						CallingCardBlops4Bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CallingCardBlops4Bg:completeAnimation()
				self.CallingCardBlops4Bg:setImage( RegisterImage( "uie_t7_blops4_metal_backplate" ) )
				CallingCardBlops4BgFrame2( CallingCardBlops4Bg, {} )
				local BgBackplateSocketFrame2 = function ( BgBackplateSocket, event )
					local BgBackplateSocketFrame3 = function ( BgBackplateSocket, event )
						if not event.interrupted then
							BgBackplateSocket:beginAnimation( "keyframe", 4019, false, false, CoD.TweenType.Linear )
						end
						BgBackplateSocket:setLeftRight( false, false, 49, 177 )
						BgBackplateSocket:setTopBottom( false, false, -60, 68 )
						BgBackplateSocket:setAlpha( 1 )
						BgBackplateSocket:setScale( 1 )
						BgBackplateSocket:setImage( RegisterImage( "uie_t7_blops4_metal_socket" ) )
						BgBackplateSocket:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
						BgBackplateSocket:setShaderVector( 0, 1, 0, 0, 0 )
						BgBackplateSocket:setShaderVector( 1, 0, 0, 0, 0 )
						BgBackplateSocket:setShaderVector( 2, 1, 0, 0, 0 )
						BgBackplateSocket:setShaderVector( 3, 0, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( BgBackplateSocket, event )
						else
							BgBackplateSocket:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BgBackplateSocketFrame3( BgBackplateSocket, event )
						return 
					else
						BgBackplateSocket:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						BgBackplateSocket:setShaderVector( 2, 0.11, 0, 0, 0 )
						BgBackplateSocket:registerEventHandler( "transition_complete_keyframe", BgBackplateSocketFrame3 )
					end
				end
				
				BgBackplateSocket:completeAnimation()
				self.BgBackplateSocket:setLeftRight( false, false, 49, 177 )
				self.BgBackplateSocket:setTopBottom( false, false, -60, 68 )
				self.BgBackplateSocket:setAlpha( 1 )
				self.BgBackplateSocket:setScale( 1 )
				self.BgBackplateSocket:setImage( RegisterImage( "uie_t7_blops4_metal_socket" ) )
				self.BgBackplateSocket:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
				self.BgBackplateSocket:setShaderVector( 0, 1, 0, 0, 0 )
				self.BgBackplateSocket:setShaderVector( 1, 0, 0, 0, 0 )
				self.BgBackplateSocket:setShaderVector( 2, 0, 0, 0, 0 )
				self.BgBackplateSocket:setShaderVector( 3, 0, 0, 0, 0 )
				BgBackplateSocketFrame2( BgBackplateSocket, {} )
				local blops4BurnInFrame2 = function ( blops4BurnIn, event )
					local blops4BurnInFrame3 = function ( blops4BurnIn, event )
						local blops4BurnInFrame4 = function ( blops4BurnIn, event )
							local blops4BurnInFrame5 = function ( blops4BurnIn, event )
								if not event.interrupted then
									blops4BurnIn:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
								end
								blops4BurnIn:setLeftRight( true, false, 289, 417 )
								blops4BurnIn:setTopBottom( true, false, 0, 128 )
								blops4BurnIn:setAlpha( 0 )
								blops4BurnIn:setImage( RegisterImage( "uie_t7_blops4_burning" ) )
								blops4BurnIn:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
								blops4BurnIn:setShaderVector( 0, 1, 0, 0, 0 )
								blops4BurnIn:setShaderVector( 1, 0, 0, 0, 0 )
								blops4BurnIn:setShaderVector( 2, 1, 0, 0, 0 )
								blops4BurnIn:setShaderVector( 3, 0, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( blops4BurnIn, event )
								else
									blops4BurnIn:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								blops4BurnInFrame5( blops4BurnIn, event )
								return 
							else
								blops4BurnIn:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
								blops4BurnIn:setAlpha( 0.55 )
								blops4BurnIn:registerEventHandler( "transition_complete_keyframe", blops4BurnInFrame5 )
							end
						end
						
						if event.interrupted then
							blops4BurnInFrame4( blops4BurnIn, event )
							return 
						else
							blops4BurnIn:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
							blops4BurnIn:setShaderVector( 2, 1, 0, 0, 0 )
							blops4BurnIn:registerEventHandler( "transition_complete_keyframe", blops4BurnInFrame4 )
						end
					end
					
					if event.interrupted then
						blops4BurnInFrame3( blops4BurnIn, event )
						return 
					else
						blops4BurnIn:beginAnimation( "keyframe", 3200, false, false, CoD.TweenType.Linear )
						blops4BurnIn:setShaderVector( 2, 0.87, 0, 0, 0 )
						blops4BurnIn:registerEventHandler( "transition_complete_keyframe", blops4BurnInFrame3 )
					end
				end
				
				blops4BurnIn:completeAnimation()
				self.blops4BurnIn:setLeftRight( true, false, 289, 417 )
				self.blops4BurnIn:setTopBottom( true, false, 0, 128 )
				self.blops4BurnIn:setAlpha( 1 )
				self.blops4BurnIn:setImage( RegisterImage( "uie_t7_blops4_burning" ) )
				self.blops4BurnIn:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
				self.blops4BurnIn:setShaderVector( 0, 1, 0, 0, 0 )
				self.blops4BurnIn:setShaderVector( 1, 0, 0, 0, 0 )
				self.blops4BurnIn:setShaderVector( 2, 0.05, 0, 0, 0 )
				self.blops4BurnIn:setShaderVector( 3, 0, 0, 0, 0 )
				blops4BurnInFrame2( blops4BurnIn, {} )
				local f2_local3 = function ( f10_arg0, f10_arg1 )
					local f10_local0 = function ( f11_arg0, f11_arg1 )
						local f11_local0 = function ( f12_arg0, f12_arg1 )
							if not f12_arg1.interrupted then
								f12_arg0:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
							end
							f12_arg0:setLeftRight( true, false, 101, 613 )
							f12_arg0:setTopBottom( true, false, -70, 208 )
							f12_arg0:setAlpha( 0 )
							f12_arg0:setScale( 0.5 )
							f12_arg0:setImage( RegisterImage( "uie_t7_blops4_metal_lightflare" ) )
							if f12_arg1.interrupted then
								self.clipFinished( f12_arg0, f12_arg1 )
							else
								f12_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f11_arg1.interrupted then
							f11_local0( f11_arg0, f11_arg1 )
							return 
						else
							f11_arg0:beginAnimation( "keyframe", 539, true, false, CoD.TweenType.Linear )
							f11_arg0:setLeftRight( true, false, 101, 613 )
							f11_arg0:setTopBottom( true, false, -70, 208 )
							f11_arg0:setScale( 0.5 )
							f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
						end
					end
					
					if f10_arg1.interrupted then
						f10_local0( f10_arg0, f10_arg1 )
						return 
					else
						f10_arg0:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
						f10_arg0:setLeftRight( true, false, 100.63, 612.63 )
						f10_arg0:setTopBottom( true, false, -70.74, 207.26 )
						f10_arg0:setAlpha( 1 )
						f10_arg0:setScale( 0.6 )
						f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
					end
				end
				
				flare0:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
				flare0:setLeftRight( true, false, 100, 612 )
				flare0:setTopBottom( true, false, -72, 206 )
				flare0:setAlpha( 0 )
				flare0:setScale( 0 )
				flare0:setImage( RegisterImage( "uie_t7_blops4_metal_lightflare" ) )
				flare0:registerEventHandler( "transition_complete_keyframe", f2_local3 )
				local f2_local4 = function ( f13_arg0, f13_arg1 )
					local f13_local0 = function ( f14_arg0, f14_arg1 )
						local f14_local0 = function ( f15_arg0, f15_arg1 )
							if not f15_arg1.interrupted then
								f15_arg0:beginAnimation( "keyframe", 1080, false, false, CoD.TweenType.Linear )
							end
							f15_arg0:setLeftRight( true, false, 290, 418 )
							f15_arg0:setTopBottom( true, false, -2, 126 )
							f15_arg0:setAlpha( 1 )
							f15_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
							if f15_arg1.interrupted then
								self.clipFinished( f15_arg0, f15_arg1 )
							else
								f15_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f14_arg1.interrupted then
							f14_local0( f14_arg0, f14_arg1 )
							return 
						else
							f14_arg0:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Linear )
							f14_arg0:setAlpha( 1 )
							f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
						end
					end
					
					if f13_arg1.interrupted then
						f13_local0( f13_arg0, f13_arg1 )
						return 
					else
						f13_arg0:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
						f13_arg0:setAlpha( 0.55 )
						f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
					end
				end
				
				blops4LogoHot:beginAnimation( "keyframe", 2900, false, false, CoD.TweenType.Linear )
				blops4LogoHot:setLeftRight( true, false, 290, 418 )
				blops4LogoHot:setTopBottom( true, false, -2, 126 )
				blops4LogoHot:setAlpha( 0 )
				blops4LogoHot:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				blops4LogoHot:registerEventHandler( "transition_complete_keyframe", f2_local4 )
				local f2_local5 = function ( f16_arg0, f16_arg1 )
					local f16_local0 = function ( f17_arg0, f17_arg1 )
						local f17_local0 = function ( f18_arg0, f18_arg1 )
							if not f18_arg1.interrupted then
								f18_arg0:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
							end
							f18_arg0:setRGB( 1, 0.66, 0 )
							f18_arg0:setAlpha( 0 )
							f18_arg0:setImage( RegisterImage( "uie_t7_blops4_glowbar" ) )
							f18_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
							if f18_arg1.interrupted then
								self.clipFinished( f18_arg0, f18_arg1 )
							else
								f18_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f17_arg1.interrupted then
							f17_local0( f17_arg0, f17_arg1 )
							return 
						else
							f17_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
						end
					end
					
					if f16_arg1.interrupted then
						f16_local0( f16_arg0, f16_arg1 )
						return 
					else
						f16_arg0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						f16_arg0:setAlpha( 1 )
						f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
					end
				end
				
				blops4LogoHot0:beginAnimation( "keyframe", 3039, false, false, CoD.TweenType.Linear )
				blops4LogoHot0:setRGB( 1, 0.66, 0 )
				blops4LogoHot0:setAlpha( 0 )
				blops4LogoHot0:setImage( RegisterImage( "uie_t7_blops4_glowbar" ) )
				blops4LogoHot0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				blops4LogoHot0:registerEventHandler( "transition_complete_keyframe", f2_local5 )
				local f2_local6 = function ( f19_arg0, f19_arg1 )
					local f19_local0 = function ( f20_arg0, f20_arg1 )
						local f20_local0 = function ( f21_arg0, f21_arg1 )
							local f21_local0 = function ( f22_arg0, f22_arg1 )
								local f22_local0 = function ( f23_arg0, f23_arg1 )
									local f23_local0 = function ( f24_arg0, f24_arg1 )
										if not f24_arg1.interrupted then
											f24_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										f24_arg0:setLeftRight( true, false, 282, 394 )
										f24_arg0:setTopBottom( true, false, 27, 195 )
										f24_arg0:setAlpha( 0 )
										f24_arg0:setZRot( 200 )
										f24_arg0:setScale( 0.3 )
										if f24_arg1.interrupted then
											self.clipFinished( f24_arg0, f24_arg1 )
										else
											f24_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f23_arg1.interrupted then
										f23_local0( f23_arg0, f23_arg1 )
										return 
									else
										f23_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										f23_arg0:setTopBottom( true, false, 31.5, 199.5 )
										f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
									end
								end
								
								if f22_arg1.interrupted then
									f22_local0( f22_arg0, f22_arg1 )
									return 
								else
									f22_arg0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
									f22_arg0:setLeftRight( true, false, 281, 393 )
									f22_arg0:setTopBottom( true, false, 35.5, 193.5 )
									f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
								end
							end
							
							if f21_arg1.interrupted then
								f21_local0( f21_arg0, f21_arg1 )
								return 
							else
								f21_arg0:beginAnimation( "keyframe", 1040, false, false, CoD.TweenType.Linear )
								f21_arg0:setLeftRight( true, false, 281.84, 393.84 )
								f21_arg0:setTopBottom( true, false, 31.21, 190 )
								f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
							end
						end
						
						if f20_arg1.interrupted then
							f20_local0( f20_arg0, f20_arg1 )
							return 
						else
							f20_arg0:beginAnimation( "keyframe", 1299, false, false, CoD.TweenType.Linear )
							f20_arg0:setLeftRight( true, false, 281, 393 )
							f20_arg0:setTopBottom( true, false, -4.51, 158.37 )
							f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
						end
					end
					
					if f19_arg1.interrupted then
						f19_local0( f19_arg0, f19_arg1 )
						return 
					else
						f19_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f19_arg0:setTopBottom( true, false, -48, 120 )
						f19_arg0:setAlpha( 1 )
						f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
					end
				end
				
				ZmFxSpark1Img0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				ZmFxSpark1Img0:setLeftRight( true, false, 282, 394 )
				ZmFxSpark1Img0:setTopBottom( true, false, -45, 123 )
				ZmFxSpark1Img0:setAlpha( 0 )
				ZmFxSpark1Img0:setZRot( 200 )
				ZmFxSpark1Img0:setScale( 0.3 )
				ZmFxSpark1Img0:registerEventHandler( "transition_complete_keyframe", f2_local6 )
				local f2_local7 = function ( f25_arg0, f25_arg1 )
					local f25_local0 = function ( f26_arg0, f26_arg1 )
						local f26_local0 = function ( f27_arg0, f27_arg1 )
							local f27_local0 = function ( f28_arg0, f28_arg1 )
								local f28_local0 = function ( f29_arg0, f29_arg1 )
									local f29_local0 = function ( f30_arg0, f30_arg1 )
										if not f30_arg1.interrupted then
											f30_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										end
										f30_arg0:setLeftRight( true, false, 304, 416 )
										f30_arg0:setTopBottom( true, false, 36, 204 )
										f30_arg0:setAlpha( 0 )
										f30_arg0:setYRot( 156 )
										f30_arg0:setZRot( 185 )
										f30_arg0:setScale( 0.3 )
										if f30_arg1.interrupted then
											self.clipFinished( f30_arg0, f30_arg1 )
										else
											f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f29_arg1.interrupted then
										f29_local0( f29_arg0, f29_arg1 )
										return 
									else
										f29_arg0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
										f29_arg0:setLeftRight( true, false, 301.93, 413.93 )
										f29_arg0:setTopBottom( true, false, 42, 210 )
										f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
									end
								end
								
								if f28_arg1.interrupted then
									f28_local0( f28_arg0, f28_arg1 )
									return 
								else
									f28_arg0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
									f28_arg0:setTopBottom( true, false, 37.5, 193.5 )
									f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
								end
							end
							
							if f27_arg1.interrupted then
								f27_local0( f27_arg0, f27_arg1 )
								return 
							else
								f27_arg0:beginAnimation( "keyframe", 1040, false, false, CoD.TweenType.Linear )
								f27_arg0:setTopBottom( true, false, 31.05, 188 )
								f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
							end
						end
						
						if f26_arg1.interrupted then
							f26_local0( f26_arg0, f26_arg1 )
							return 
						else
							f26_arg0:beginAnimation( "keyframe", 1299, false, false, CoD.TweenType.Linear )
							f26_arg0:setLeftRight( true, false, 303, 415 )
							f26_arg0:setTopBottom( true, false, -4, 157.86 )
							f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
						end
					end
					
					if f25_arg1.interrupted then
						f25_local0( f25_arg0, f25_arg1 )
						return 
					else
						f25_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f25_arg0:setLeftRight( true, false, 305, 417 )
						f25_arg0:setTopBottom( true, false, -48, 120 )
						f25_arg0:setAlpha( 1 )
						f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
					end
				end
				
				ZmFxSpark1Img:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				ZmFxSpark1Img:setLeftRight( true, false, 302, 414 )
				ZmFxSpark1Img:setTopBottom( true, false, -45, 123 )
				ZmFxSpark1Img:setAlpha( 0 )
				ZmFxSpark1Img:setYRot( 156 )
				ZmFxSpark1Img:setZRot( 185 )
				ZmFxSpark1Img:setScale( 0.3 )
				ZmFxSpark1Img:registerEventHandler( "transition_complete_keyframe", f2_local7 )
				local f2_local8 = function ( f31_arg0, f31_arg1 )
					local f31_local0 = function ( f32_arg0, f32_arg1 )
						local f32_local0 = function ( f33_arg0, f33_arg1 )
							local f33_local0 = function ( f34_arg0, f34_arg1 )
								local f34_local0 = function ( f35_arg0, f35_arg1 )
									local f35_local0 = function ( f36_arg0, f36_arg1 )
										if not f36_arg1.interrupted then
											f36_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										f36_arg0:setLeftRight( true, true, 322, -46 )
										f36_arg0:setTopBottom( true, true, 27, 75 )
										f36_arg0:setAlpha( 0 )
										if f36_arg1.interrupted then
											self.clipFinished( f36_arg0, f36_arg1 )
										else
											f36_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f35_arg1.interrupted then
										f35_local0( f35_arg0, f35_arg1 )
										return 
									else
										f35_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										f35_arg0:setLeftRight( true, true, 320.4, -47.6 )
										f35_arg0:setTopBottom( true, true, 33, 76 )
										f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
									end
								end
								
								if f34_arg1.interrupted then
									f34_local0( f34_arg0, f34_arg1 )
									return 
								else
									f34_arg0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
									f34_arg0:setLeftRight( true, true, 321.23, -46.77 )
									f34_arg0:setTopBottom( true, true, 34.5, 71.5 )
									f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
								end
							end
							
							if f33_arg1.interrupted then
								f33_local0( f33_arg0, f33_arg1 )
								return 
							else
								f33_arg0:beginAnimation( "keyframe", 1040, false, false, CoD.TweenType.Linear )
								f33_arg0:setLeftRight( true, true, 320.2, -47.8 )
								f33_arg0:setTopBottom( true, true, 31.13, 69 )
								f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
							end
						end
						
						if f32_arg1.interrupted then
							f32_local0( f32_arg0, f32_arg1 )
							return 
						else
							f32_arg0:beginAnimation( "keyframe", 1299, false, false, CoD.TweenType.Linear )
							f32_arg0:setLeftRight( true, true, 320.07, -47.93 )
							f32_arg0:setTopBottom( true, true, -4, 38.37 )
							f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
						end
					end
					
					if f31_arg1.interrupted then
						f31_local0( f31_arg0, f31_arg1 )
						return 
					else
						f31_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f31_arg0:setLeftRight( true, true, 324, -44 )
						f31_arg0:setTopBottom( true, true, -50.15, -2.15 )
						f31_arg0:setAlpha( 1 )
						f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
					end
				end
				
				ZmFxSpark1Img1:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				ZmFxSpark1Img1:setLeftRight( true, true, 323, -45 )
				ZmFxSpark1Img1:setTopBottom( true, true, -46.15, 1.85 )
				ZmFxSpark1Img1:setAlpha( 0 )
				ZmFxSpark1Img1:registerEventHandler( "transition_complete_keyframe", f2_local8 )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark1Img0:close()
		element.ZmFxSpark1Img:close()
		element.ZmFxSpark1Img1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

