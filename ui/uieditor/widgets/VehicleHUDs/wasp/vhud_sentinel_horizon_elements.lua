-- f886b3c358cd7f9a231e1a5d93a92b0a
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_sentinel_horizon_elements = InheritFrom( LUI.UIElement )
CoD.vhud_sentinel_horizon_elements.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.vhud_sentinel_horizon_elements )
	self.id = "vhud_sentinel_horizon_elements"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 840 )
	self:setTopBottom( true, false, 0, 24 )
	
	local CenterReticleLine = LUI.UIImage.new()
	CenterReticleLine:setLeftRight( false, false, -21.5, 20.5 )
	CenterReticleLine:setTopBottom( false, false, -12, 12 )
	CenterReticleLine:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_centerreticleline" ) )
	CenterReticleLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleLine )
	self.CenterReticleLine = CenterReticleLine
	
	local RightArrow = LUI.UIImage.new()
	RightArrow:setLeftRight( false, false, 289.63, 318.63 )
	RightArrow:setTopBottom( false, false, -9.17, 10.17 )
	RightArrow:setAlpha( 0.4 )
	RightArrow:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidearrow" ) )
	RightArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RightArrow )
	self.RightArrow = RightArrow
	
	local LeftArrow = LUI.UIImage.new()
	LeftArrow:setLeftRight( false, false, -317.37, -288.37 )
	LeftArrow:setTopBottom( false, false, -8.17, 11.17 )
	LeftArrow:setAlpha( 0.4 )
	LeftArrow:setZRot( 180 )
	LeftArrow:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidearrow" ) )
	LeftArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LeftArrow )
	self.LeftArrow = LeftArrow
	
	local OutsideHashLineR5 = LUI.UIImage.new()
	OutsideHashLineR5:setLeftRight( false, false, 314.38, 419.88 )
	OutsideHashLineR5:setTopBottom( false, false, -6.25, 9.99 )
	OutsideHashLineR5:setRGB( 0.6, 0.82, 0.91 )
	OutsideHashLineR5:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidehashlinesr4" ) )
	OutsideHashLineR5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideHashLineR5 )
	self.OutsideHashLineR5 = OutsideHashLineR5
	
	local OutsideHashLineR50 = LUI.UIImage.new()
	OutsideHashLineR50:setLeftRight( false, false, -419.88, -314.38 )
	OutsideHashLineR50:setTopBottom( false, false, -7.62, 8.62 )
	OutsideHashLineR50:setRGB( 0.6, 0.82, 0.91 )
	OutsideHashLineR50:setAlpha( 0.7 )
	OutsideHashLineR50:setZRot( 180 )
	OutsideHashLineR50:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidehashlinesr4" ) )
	OutsideHashLineR50:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideHashLineR50 )
	self.OutsideHashLineR50 = OutsideHashLineR50
	
	local OutsideLineHorizonR = LUI.UIImage.new()
	OutsideLineHorizonR:setLeftRight( false, false, 143.94, 249.44 )
	OutsideLineHorizonR:setTopBottom( false, false, -6.25, 9.99 )
	OutsideLineHorizonR:setRGB( 0.6, 0.82, 0.91 )
	OutsideLineHorizonR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidehashlinesr4" ) )
	OutsideLineHorizonR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideLineHorizonR )
	self.OutsideLineHorizonR = OutsideLineHorizonR
	
	local OutsideLineHorizonL = LUI.UIImage.new()
	OutsideLineHorizonL:setLeftRight( false, false, -252.06, -146.56 )
	OutsideLineHorizonL:setTopBottom( false, false, -6.25, 9.99 )
	OutsideLineHorizonL:setRGB( 0.6, 0.82, 0.91 )
	OutsideLineHorizonL:setZRot( 180 )
	OutsideLineHorizonL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidehashlinesr4" ) )
	OutsideLineHorizonL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideLineHorizonL )
	self.OutsideLineHorizonL = OutsideLineHorizonL
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 7 )
				local f3_local0 = function ( f4_arg0, f4_arg1 )
					if not f4_arg1.interrupted then
						f4_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
					end
					f4_arg0:setAlpha( 1 )
					if f4_arg1.interrupted then
						self.clipFinished( f4_arg0, f4_arg1 )
					else
						f4_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLine:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				CenterReticleLine:setAlpha( 0 )
				CenterReticleLine:registerEventHandler( "transition_complete_keyframe", f3_local0 )
				local f3_local1 = function ( f5_arg0, f5_arg1 )
					local f5_local0 = function ( f6_arg0, f6_arg1 )
						local f6_local0 = function ( f7_arg0, f7_arg1 )
							if not f7_arg1.interrupted then
								f7_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							f7_arg0:setAlpha( 0.4 )
							if f7_arg1.interrupted then
								self.clipFinished( f7_arg0, f7_arg1 )
							else
								f7_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f6_arg1.interrupted then
							f6_local0( f6_arg0, f6_arg1 )
							return 
						else
							f6_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f6_arg0:setAlpha( 0 )
							f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
						end
					end
					
					if f5_arg1.interrupted then
						f5_local0( f5_arg0, f5_arg1 )
						return 
					else
						f5_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f5_arg0:setAlpha( 0.4 )
						f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
					end
				end
				
				RightArrow:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
				RightArrow:setAlpha( 0 )
				RightArrow:registerEventHandler( "transition_complete_keyframe", f3_local1 )
				local f3_local2 = function ( f8_arg0, f8_arg1 )
					local f8_local0 = function ( f9_arg0, f9_arg1 )
						local f9_local0 = function ( f10_arg0, f10_arg1 )
							if not f10_arg1.interrupted then
								f10_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							f10_arg0:setAlpha( 0.4 )
							if f10_arg1.interrupted then
								self.clipFinished( f10_arg0, f10_arg1 )
							else
								f10_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f9_arg1.interrupted then
							f9_local0( f9_arg0, f9_arg1 )
							return 
						else
							f9_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f9_arg0:setAlpha( 0 )
							f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
						end
					end
					
					if f8_arg1.interrupted then
						f8_local0( f8_arg0, f8_arg1 )
						return 
					else
						f8_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f8_arg0:setAlpha( 0.4 )
						f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
					end
				end
				
				LeftArrow:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
				LeftArrow:setAlpha( 0 )
				LeftArrow:registerEventHandler( "transition_complete_keyframe", f3_local2 )
				local f3_local3 = function ( f11_arg0, f11_arg1 )
					local f11_local0 = function ( f12_arg0, f12_arg1 )
						local f12_local0 = function ( f13_arg0, f13_arg1 )
							if not f13_arg1.interrupted then
								f13_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							end
							f13_arg0:setLeftRight( false, false, 315.75, 421.25 )
							f13_arg0:setTopBottom( false, false, -6.25, 9.99 )
							f13_arg0:setAlpha( 1 )
							if f13_arg1.interrupted then
								self.clipFinished( f13_arg0, f13_arg1 )
							else
								f13_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f12_arg1.interrupted then
							f12_local0( f12_arg0, f12_arg1 )
							return 
						else
							f12_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f12_arg0:setAlpha( 0 )
							f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
						end
					end
					
					if f11_arg1.interrupted then
						f11_local0( f11_arg0, f11_arg1 )
						return 
					else
						f11_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f11_arg0:setAlpha( 1 )
						f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
					end
				end
				
				OutsideHashLineR5:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
				OutsideHashLineR5:setLeftRight( false, false, 315.75, 421.25 )
				OutsideHashLineR5:setTopBottom( false, false, -6.25, 9.99 )
				OutsideHashLineR5:setAlpha( 0 )
				OutsideHashLineR5:registerEventHandler( "transition_complete_keyframe", f3_local3 )
				local f3_local4 = function ( f14_arg0, f14_arg1 )
					local f14_local0 = function ( f15_arg0, f15_arg1 )
						local f15_local0 = function ( f16_arg0, f16_arg1 )
							if not f16_arg1.interrupted then
								f16_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							end
							f16_arg0:setLeftRight( false, false, -418.51, -313.01 )
							f16_arg0:setTopBottom( false, false, -7.62, 8.62 )
							f16_arg0:setAlpha( 0.7 )
							if f16_arg1.interrupted then
								self.clipFinished( f16_arg0, f16_arg1 )
							else
								f16_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f15_arg1.interrupted then
							f15_local0( f15_arg0, f15_arg1 )
							return 
						else
							f15_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f15_arg0:setAlpha( 0 )
							f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
						end
					end
					
					if f14_arg1.interrupted then
						f14_local0( f14_arg0, f14_arg1 )
						return 
					else
						f14_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f14_arg0:setAlpha( 1 )
						f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
					end
				end
				
				OutsideHashLineR50:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
				OutsideHashLineR50:setLeftRight( false, false, -418.51, -313.01 )
				OutsideHashLineR50:setTopBottom( false, false, -7.62, 8.62 )
				OutsideHashLineR50:setAlpha( 0 )
				OutsideHashLineR50:registerEventHandler( "transition_complete_keyframe", f3_local4 )
				local f3_local5 = function ( f17_arg0, f17_arg1 )
					if not f17_arg1.interrupted then
						f17_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
					end
					f17_arg0:setAlpha( 1 )
					if f17_arg1.interrupted then
						self.clipFinished( f17_arg0, f17_arg1 )
					else
						f17_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineHorizonR:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
				OutsideLineHorizonR:setAlpha( 0 )
				OutsideLineHorizonR:registerEventHandler( "transition_complete_keyframe", f3_local5 )
				local f3_local6 = function ( f18_arg0, f18_arg1 )
					if not f18_arg1.interrupted then
						f18_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
					end
					f18_arg0:setAlpha( 1 )
					if f18_arg1.interrupted then
						self.clipFinished( f18_arg0, f18_arg1 )
					else
						f18_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineHorizonL:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
				OutsideLineHorizonL:setAlpha( 0 )
				OutsideLineHorizonL:registerEventHandler( "transition_complete_keyframe", f3_local6 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 7 )
				local CenterReticleLineFrame2 = function ( CenterReticleLine, event )
					if not event.interrupted then
						CenterReticleLine:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterReticleLine:setLeftRight( false, false, -21.5, 20.5 )
					CenterReticleLine:setTopBottom( false, false, -12, 12 )
					CenterReticleLine:setZRot( 180 )
					CenterReticleLine:setZoom( -200 )
					if event.interrupted then
						self.clipFinished( CenterReticleLine, event )
					else
						CenterReticleLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLine:completeAnimation()
				self.CenterReticleLine:setLeftRight( false, false, -21.5, 20.5 )
				self.CenterReticleLine:setTopBottom( false, false, -12, 12 )
				self.CenterReticleLine:setZRot( 0 )
				self.CenterReticleLine:setZoom( 0 )
				CenterReticleLineFrame2( CenterReticleLine, {} )
				local RightArrowFrame2 = function ( RightArrow, event )
					local RightArrowFrame3 = function ( RightArrow, event )
						if not event.interrupted then
							RightArrow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						end
						RightArrow:setLeftRight( false, false, 370.25, 399.25 )
						RightArrow:setTopBottom( false, false, -9.17, 10.17 )
						if event.interrupted then
							self.clipFinished( RightArrow, event )
						else
							RightArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RightArrowFrame3( RightArrow, event )
						return 
					else
						RightArrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						RightArrow:registerEventHandler( "transition_complete_keyframe", RightArrowFrame3 )
					end
				end
				
				RightArrow:completeAnimation()
				self.RightArrow:setLeftRight( false, false, 291, 320 )
				self.RightArrow:setTopBottom( false, false, -9.17, 10.17 )
				RightArrowFrame2( RightArrow, {} )
				local LeftArrowFrame2 = function ( LeftArrow, event )
					local LeftArrowFrame3 = function ( LeftArrow, event )
						if not event.interrupted then
							LeftArrow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						end
						LeftArrow:setLeftRight( false, false, -391.75, -362.75 )
						LeftArrow:setTopBottom( false, false, -8.17, 11.17 )
						if event.interrupted then
							self.clipFinished( LeftArrow, event )
						else
							LeftArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LeftArrowFrame3( LeftArrow, event )
						return 
					else
						LeftArrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						LeftArrow:registerEventHandler( "transition_complete_keyframe", LeftArrowFrame3 )
					end
				end
				
				LeftArrow:completeAnimation()
				self.LeftArrow:setLeftRight( false, false, -316, -287 )
				self.LeftArrow:setTopBottom( false, false, -8.17, 11.17 )
				LeftArrowFrame2( LeftArrow, {} )
				local OutsideHashLineR5Frame2 = function ( OutsideHashLineR5, event )
					if not event.interrupted then
						OutsideHashLineR5:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideHashLineR5:setLeftRight( false, false, 234.75, 340.25 )
					OutsideHashLineR5:setTopBottom( false, false, -6.25, 9.99 )
					OutsideHashLineR5:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( OutsideHashLineR5, event )
					else
						OutsideHashLineR5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR5:completeAnimation()
				self.OutsideHashLineR5:setLeftRight( false, false, 315.75, 421.25 )
				self.OutsideHashLineR5:setTopBottom( false, false, -6.25, 9.99 )
				self.OutsideHashLineR5:setAlpha( 1 )
				OutsideHashLineR5Frame2( OutsideHashLineR5, {} )
				local OutsideHashLineR50Frame2 = function ( OutsideHashLineR50, event )
					if not event.interrupted then
						OutsideHashLineR50:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideHashLineR50:setLeftRight( false, false, -333.51, -228.01 )
					OutsideHashLineR50:setTopBottom( false, false, -7.62, 8.62 )
					if event.interrupted then
						self.clipFinished( OutsideHashLineR50, event )
					else
						OutsideHashLineR50:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR50:completeAnimation()
				self.OutsideHashLineR50:setLeftRight( false, false, -418.51, -313.01 )
				self.OutsideHashLineR50:setTopBottom( false, false, -7.62, 8.62 )
				OutsideHashLineR50Frame2( OutsideHashLineR50, {} )
				local OutsideLineHorizonRFrame2 = function ( OutsideLineHorizonR, event )
					if not event.interrupted then
						OutsideLineHorizonR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideLineHorizonR:setLeftRight( false, false, 111.9, 217.4 )
					OutsideLineHorizonR:setTopBottom( false, false, -6.25, 9.99 )
					if event.interrupted then
						self.clipFinished( OutsideLineHorizonR, event )
					else
						OutsideLineHorizonR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineHorizonR:completeAnimation()
				self.OutsideLineHorizonR:setLeftRight( false, false, 145.31, 250.81 )
				self.OutsideLineHorizonR:setTopBottom( false, false, -6.25, 9.99 )
				OutsideLineHorizonRFrame2( OutsideLineHorizonR, {} )
				local OutsideLineHorizonLFrame2 = function ( OutsideLineHorizonL, event )
					if not event.interrupted then
						OutsideLineHorizonL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideLineHorizonL:setLeftRight( false, false, -219.69, -114.19 )
					OutsideLineHorizonL:setTopBottom( false, false, -6.25, 9.99 )
					if event.interrupted then
						self.clipFinished( OutsideLineHorizonL, event )
					else
						OutsideLineHorizonL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineHorizonL:completeAnimation()
				self.OutsideLineHorizonL:setLeftRight( false, false, -250.69, -145.19 )
				self.OutsideLineHorizonL:setTopBottom( false, false, -6.25, 9.99 )
				OutsideLineHorizonLFrame2( OutsideLineHorizonL, {} )
			end
		},
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				CenterReticleLine:completeAnimation()
				self.CenterReticleLine:setLeftRight( false, false, -18, 17 )
				self.CenterReticleLine:setTopBottom( false, false, -11.5, 12.5 )
				self.CenterReticleLine:setZRot( 180 )
				self.CenterReticleLine:setZoom( -200 )
				self.clipFinished( CenterReticleLine, {} )
				RightArrow:completeAnimation()
				self.RightArrow:setLeftRight( false, false, 370.25, 399.25 )
				self.RightArrow:setTopBottom( false, false, -9.17, 10.17 )
				self.clipFinished( RightArrow, {} )
				LeftArrow:completeAnimation()
				self.LeftArrow:setLeftRight( false, false, -391.75, -362.75 )
				self.LeftArrow:setTopBottom( false, false, -8.17, 11.17 )
				self.clipFinished( LeftArrow, {} )
				OutsideHashLineR5:completeAnimation()
				self.OutsideHashLineR5:setLeftRight( false, false, 234.75, 340.25 )
				self.OutsideHashLineR5:setTopBottom( false, false, -6.25, 9.99 )
				self.OutsideHashLineR5:setAlpha( 1 )
				self.clipFinished( OutsideHashLineR5, {} )
				OutsideHashLineR50:completeAnimation()
				self.OutsideHashLineR50:setLeftRight( false, false, -333.51, -228.01 )
				self.OutsideHashLineR50:setTopBottom( false, false, -7.62, 8.62 )
				self.clipFinished( OutsideHashLineR50, {} )
				OutsideLineHorizonR:completeAnimation()
				self.OutsideLineHorizonR:setLeftRight( false, false, 111.9, 217.4 )
				self.OutsideLineHorizonR:setTopBottom( false, false, -6.25, 9.99 )
				self.clipFinished( OutsideLineHorizonR, {} )
				OutsideLineHorizonL:completeAnimation()
				self.OutsideLineHorizonL:setLeftRight( false, false, -219.69, -114.19 )
				self.OutsideLineHorizonL:setTopBottom( false, false, -6.25, 9.99 )
				self.clipFinished( OutsideLineHorizonL, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 7 )
				local CenterReticleLineFrame2 = function ( CenterReticleLine, event )
					if not event.interrupted then
						CenterReticleLine:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterReticleLine:setLeftRight( false, false, -21.5, 20.5 )
					CenterReticleLine:setTopBottom( false, false, -12, 12 )
					CenterReticleLine:setZRot( 0 )
					CenterReticleLine:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( CenterReticleLine, event )
					else
						CenterReticleLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLine:completeAnimation()
				self.CenterReticleLine:setLeftRight( false, false, -21.5, 20.5 )
				self.CenterReticleLine:setTopBottom( false, false, -12, 12 )
				self.CenterReticleLine:setZRot( 180 )
				self.CenterReticleLine:setZoom( -200 )
				CenterReticleLineFrame2( CenterReticleLine, {} )
				local RightArrowFrame2 = function ( RightArrow, event )
					local RightArrowFrame3 = function ( RightArrow, event )
						if not event.interrupted then
							RightArrow:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						end
						RightArrow:setLeftRight( false, false, 291, 320 )
						RightArrow:setTopBottom( false, false, -9.17, 10.17 )
						if event.interrupted then
							self.clipFinished( RightArrow, event )
						else
							RightArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RightArrowFrame3( RightArrow, event )
						return 
					else
						RightArrow:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						RightArrow:setLeftRight( false, false, 291, 320 )
						RightArrow:registerEventHandler( "transition_complete_keyframe", RightArrowFrame3 )
					end
				end
				
				RightArrow:completeAnimation()
				self.RightArrow:setLeftRight( false, false, 370.25, 399.25 )
				self.RightArrow:setTopBottom( false, false, -9.17, 10.17 )
				RightArrowFrame2( RightArrow, {} )
				local LeftArrowFrame2 = function ( LeftArrow, event )
					local LeftArrowFrame3 = function ( LeftArrow, event )
						if not event.interrupted then
							LeftArrow:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						end
						LeftArrow:setLeftRight( false, false, -316, -287 )
						LeftArrow:setTopBottom( false, false, -8.17, 11.17 )
						if event.interrupted then
							self.clipFinished( LeftArrow, event )
						else
							LeftArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LeftArrowFrame3( LeftArrow, event )
						return 
					else
						LeftArrow:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						LeftArrow:setLeftRight( false, false, -316, -287 )
						LeftArrow:registerEventHandler( "transition_complete_keyframe", LeftArrowFrame3 )
					end
				end
				
				LeftArrow:completeAnimation()
				self.LeftArrow:setLeftRight( false, false, -391.75, -362.75 )
				self.LeftArrow:setTopBottom( false, false, -8.17, 11.17 )
				LeftArrowFrame2( LeftArrow, {} )
				local OutsideHashLineR5Frame2 = function ( OutsideHashLineR5, event )
					if not event.interrupted then
						OutsideHashLineR5:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideHashLineR5:setLeftRight( false, false, 315.75, 421.25 )
					OutsideHashLineR5:setTopBottom( false, false, -6.25, 9.99 )
					OutsideHashLineR5:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( OutsideHashLineR5, event )
					else
						OutsideHashLineR5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR5:completeAnimation()
				self.OutsideHashLineR5:setLeftRight( false, false, 234.75, 340.25 )
				self.OutsideHashLineR5:setTopBottom( false, false, -6.25, 9.99 )
				self.OutsideHashLineR5:setAlpha( 1 )
				OutsideHashLineR5Frame2( OutsideHashLineR5, {} )
				local OutsideHashLineR50Frame2 = function ( OutsideHashLineR50, event )
					if not event.interrupted then
						OutsideHashLineR50:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideHashLineR50:setLeftRight( false, false, -418.51, -313.01 )
					OutsideHashLineR50:setTopBottom( false, false, -7.62, 8.62 )
					if event.interrupted then
						self.clipFinished( OutsideHashLineR50, event )
					else
						OutsideHashLineR50:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR50:completeAnimation()
				self.OutsideHashLineR50:setLeftRight( false, false, -333.51, -228.01 )
				self.OutsideHashLineR50:setTopBottom( false, false, -7.62, 8.62 )
				OutsideHashLineR50Frame2( OutsideHashLineR50, {} )
				local OutsideLineHorizonRFrame2 = function ( OutsideLineHorizonR, event )
					if not event.interrupted then
						OutsideLineHorizonR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideLineHorizonR:setLeftRight( false, false, 145.31, 250.81 )
					OutsideLineHorizonR:setTopBottom( false, false, -6.25, 9.99 )
					if event.interrupted then
						self.clipFinished( OutsideLineHorizonR, event )
					else
						OutsideLineHorizonR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineHorizonR:completeAnimation()
				self.OutsideLineHorizonR:setLeftRight( false, false, 111.9, 217.4 )
				self.OutsideLineHorizonR:setTopBottom( false, false, -6.25, 9.99 )
				OutsideLineHorizonRFrame2( OutsideLineHorizonR, {} )
				local OutsideLineHorizonLFrame2 = function ( OutsideLineHorizonL, event )
					if not event.interrupted then
						OutsideLineHorizonL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideLineHorizonL:setLeftRight( false, false, -250.69, -145.19 )
					OutsideLineHorizonL:setTopBottom( false, false, -6.25, 9.99 )
					if event.interrupted then
						self.clipFinished( OutsideLineHorizonL, event )
					else
						OutsideLineHorizonL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineHorizonL:completeAnimation()
				self.OutsideLineHorizonL:setLeftRight( false, false, -219.69, -114.19 )
				self.OutsideLineHorizonL:setTopBottom( false, false, -6.25, 9.99 )
				OutsideLineHorizonLFrame2( OutsideLineHorizonL, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

