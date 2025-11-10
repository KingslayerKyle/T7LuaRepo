CoD.BM_FlyEmberFX = InheritFrom( LUI.UIElement )
CoD.BM_FlyEmberFX.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_FlyEmberFX )
	self.id = "BM_FlyEmberFX"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 60 )
	self:setTopBottom( true, false, 0, 60 )
	
	local FlyingEmber1 = LUI.UIImage.new()
	FlyingEmber1:setLeftRight( true, false, 0, 60 )
	FlyingEmber1:setTopBottom( true, false, 0, 60 )
	FlyingEmber1:setImage( RegisterImage( "uie_t7_blackmarket_fyingember1" ) )
	self:addElement( FlyingEmber1 )
	self.FlyingEmber1 = FlyingEmber1
	
	local FlyingEmber2 = LUI.UIImage.new()
	FlyingEmber2:setLeftRight( true, false, 0, 60 )
	FlyingEmber2:setTopBottom( true, false, -2, 58 )
	FlyingEmber2:setImage( RegisterImage( "uie_t7_blackmarket_fyingember2" ) )
	self:addElement( FlyingEmber2 )
	self.FlyingEmber2 = FlyingEmber2
	
	local FlyingEmber3 = LUI.UIImage.new()
	FlyingEmber3:setLeftRight( true, false, -1, 71 )
	FlyingEmber3:setTopBottom( true, false, -13, 59 )
	FlyingEmber3:setImage( RegisterImage( "uie_t7_blackmarket_fyingember3" ) )
	self:addElement( FlyingEmber3 )
	self.FlyingEmber3 = FlyingEmber3
	
	local FlyingEmber4 = LUI.UIImage.new()
	FlyingEmber4:setLeftRight( true, false, 15, 111 )
	FlyingEmber4:setTopBottom( true, false, -56, 52 )
	FlyingEmber4:setImage( RegisterImage( "uie_t7_blackmarket_fyingember4" ) )
	self:addElement( FlyingEmber4 )
	self.FlyingEmber4 = FlyingEmber4
	
	local FlyingEmber5 = LUI.UIImage.new()
	FlyingEmber5:setLeftRight( true, false, 33, 189 )
	FlyingEmber5:setTopBottom( true, false, -152, 40 )
	FlyingEmber5:setImage( RegisterImage( "uie_t7_blackmarket_fyingember5" ) )
	self:addElement( FlyingEmber5 )
	self.FlyingEmber5 = FlyingEmber5
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local FlyingEmber1Frame2 = function ( FlyingEmber1, event )
					local FlyingEmber1Frame3 = function ( FlyingEmber1, event )
						if not event.interrupted then
							FlyingEmber1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						FlyingEmber1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FlyingEmber1, event )
						else
							FlyingEmber1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FlyingEmber1Frame3( FlyingEmber1, event )
						return 
					else
						FlyingEmber1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						FlyingEmber1:registerEventHandler( "transition_complete_keyframe", FlyingEmber1Frame3 )
					end
				end
				
				FlyingEmber1:completeAnimation()
				self.FlyingEmber1:setAlpha( 1 )
				FlyingEmber1Frame2( FlyingEmber1, {} )
				local FlyingEmber2Frame2 = function ( FlyingEmber2, event )
					local FlyingEmber2Frame3 = function ( FlyingEmber2, event )
						local FlyingEmber2Frame4 = function ( FlyingEmber2, event )
							local FlyingEmber2Frame5 = function ( FlyingEmber2, event )
								if not event.interrupted then
									FlyingEmber2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								FlyingEmber2:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FlyingEmber2, event )
								else
									FlyingEmber2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FlyingEmber2Frame5( FlyingEmber2, event )
								return 
							else
								FlyingEmber2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								FlyingEmber2:registerEventHandler( "transition_complete_keyframe", FlyingEmber2Frame5 )
							end
						end
						
						if event.interrupted then
							FlyingEmber2Frame4( FlyingEmber2, event )
							return 
						else
							FlyingEmber2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FlyingEmber2:setAlpha( 1 )
							FlyingEmber2:registerEventHandler( "transition_complete_keyframe", FlyingEmber2Frame4 )
						end
					end
					
					if event.interrupted then
						FlyingEmber2Frame3( FlyingEmber2, event )
						return 
					else
						FlyingEmber2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						FlyingEmber2:registerEventHandler( "transition_complete_keyframe", FlyingEmber2Frame3 )
					end
				end
				
				FlyingEmber2:completeAnimation()
				self.FlyingEmber2:setAlpha( 0 )
				FlyingEmber2Frame2( FlyingEmber2, {} )
				local FlyingEmber3Frame2 = function ( FlyingEmber3, event )
					local FlyingEmber3Frame3 = function ( FlyingEmber3, event )
						local FlyingEmber3Frame4 = function ( FlyingEmber3, event )
							local FlyingEmber3Frame5 = function ( FlyingEmber3, event )
								if not event.interrupted then
									FlyingEmber3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								FlyingEmber3:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FlyingEmber3, event )
								else
									FlyingEmber3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FlyingEmber3Frame5( FlyingEmber3, event )
								return 
							else
								FlyingEmber3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								FlyingEmber3:registerEventHandler( "transition_complete_keyframe", FlyingEmber3Frame5 )
							end
						end
						
						if event.interrupted then
							FlyingEmber3Frame4( FlyingEmber3, event )
							return 
						else
							FlyingEmber3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FlyingEmber3:setAlpha( 1 )
							FlyingEmber3:registerEventHandler( "transition_complete_keyframe", FlyingEmber3Frame4 )
						end
					end
					
					if event.interrupted then
						FlyingEmber3Frame3( FlyingEmber3, event )
						return 
					else
						FlyingEmber3:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						FlyingEmber3:registerEventHandler( "transition_complete_keyframe", FlyingEmber3Frame3 )
					end
				end
				
				FlyingEmber3:completeAnimation()
				self.FlyingEmber3:setAlpha( 0 )
				FlyingEmber3Frame2( FlyingEmber3, {} )
				local f2_local3 = function ( f13_arg0, f13_arg1 )
					local f13_local0 = function ( f14_arg0, f14_arg1 )
						local f14_local0 = function ( f15_arg0, f15_arg1 )
							if not f15_arg1.interrupted then
								f15_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							f15_arg0:setLeftRight( true, false, 14, 110 )
							f15_arg0:setTopBottom( true, false, -65, 43 )
							f15_arg0:setAlpha( 0 )
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
							f14_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
						end
					end
					
					if f13_arg1.interrupted then
						f13_local0( f13_arg0, f13_arg1 )
						return 
					else
						f13_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f13_arg0:setAlpha( 1 )
						f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
					end
				end
				
				FlyingEmber4:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				FlyingEmber4:setLeftRight( true, false, 14, 110 )
				FlyingEmber4:setTopBottom( true, false, -65, 43 )
				FlyingEmber4:setAlpha( 0 )
				FlyingEmber4:registerEventHandler( "transition_complete_keyframe", f2_local3 )
				local f2_local4 = function ( f16_arg0, f16_arg1 )
					local f16_local0 = function ( f17_arg0, f17_arg1 )
						local f17_local0 = function ( f18_arg0, f18_arg1 )
							if not f18_arg1.interrupted then
								f18_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							f18_arg0:setLeftRight( true, false, 62, 218 )
							f18_arg0:setTopBottom( true, false, -203, -11 )
							f18_arg0:setAlpha( 0 )
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
							f17_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
						end
					end
					
					if f16_arg1.interrupted then
						f16_local0( f16_arg0, f16_arg1 )
						return 
					else
						f16_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f16_arg0:setAlpha( 1 )
						f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
					end
				end
				
				FlyingEmber5:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				FlyingEmber5:setLeftRight( true, false, 62, 218 )
				FlyingEmber5:setTopBottom( true, false, -203, -11 )
				FlyingEmber5:setAlpha( 0 )
				FlyingEmber5:registerEventHandler( "transition_complete_keyframe", f2_local4 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

