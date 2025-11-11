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
	self:setLeftRight( 0, 0, 0, 90 )
	self:setTopBottom( 0, 0, 0, 90 )
	
	local FlyingEmber1 = LUI.UIImage.new()
	FlyingEmber1:setLeftRight( 0, 0, 0, 90 )
	FlyingEmber1:setTopBottom( 0, 0, 0, 90 )
	FlyingEmber1:setImage( RegisterImage( "uie_t7_blackmarket_fyingember1" ) )
	self:addElement( FlyingEmber1 )
	self.FlyingEmber1 = FlyingEmber1
	
	local FlyingEmber2 = LUI.UIImage.new()
	FlyingEmber2:setLeftRight( 0, 0, 0, 90 )
	FlyingEmber2:setTopBottom( 0, 0, -3, 87 )
	FlyingEmber2:setImage( RegisterImage( "uie_t7_blackmarket_fyingember2" ) )
	self:addElement( FlyingEmber2 )
	self.FlyingEmber2 = FlyingEmber2
	
	local FlyingEmber3 = LUI.UIImage.new()
	FlyingEmber3:setLeftRight( 0, 0, -2, 106 )
	FlyingEmber3:setTopBottom( 0, 0, -20, 88 )
	FlyingEmber3:setImage( RegisterImage( "uie_t7_blackmarket_fyingember3" ) )
	self:addElement( FlyingEmber3 )
	self.FlyingEmber3 = FlyingEmber3
	
	local FlyingEmber4 = LUI.UIImage.new()
	FlyingEmber4:setLeftRight( 0, 0, 22, 166 )
	FlyingEmber4:setTopBottom( 0, 0, -84, 78 )
	FlyingEmber4:setImage( RegisterImage( "uie_t7_blackmarket_fyingember4" ) )
	self:addElement( FlyingEmber4 )
	self.FlyingEmber4 = FlyingEmber4
	
	local FlyingEmber5 = LUI.UIImage.new()
	FlyingEmber5:setLeftRight( 0, 0, 49, 283 )
	FlyingEmber5:setTopBottom( 0, 0, -228, 60 )
	FlyingEmber5:setImage( RegisterImage( "uie_t7_blackmarket_fyingember5" ) )
	self:addElement( FlyingEmber5 )
	self.FlyingEmber5 = FlyingEmber5
	
	self.resetProperties = function ()
		FlyingEmber1:completeAnimation()
		FlyingEmber2:completeAnimation()
		FlyingEmber3:completeAnimation()
		FlyingEmber4:completeAnimation()
		FlyingEmber5:completeAnimation()
		FlyingEmber1:setAlpha( 1 )
		FlyingEmber2:setAlpha( 1 )
		FlyingEmber3:setAlpha( 1 )
		FlyingEmber4:setLeftRight( 0, 0, 22, 166 )
		FlyingEmber4:setTopBottom( 0, 0, -84, 78 )
		FlyingEmber4:setAlpha( 1 )
		FlyingEmber5:setLeftRight( 0, 0, 49, 283 )
		FlyingEmber5:setTopBottom( 0, 0, -228, 60 )
		FlyingEmber5:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				local FlyingEmber4Frame2 = function ( FlyingEmber4, event )
					local FlyingEmber4Frame3 = function ( FlyingEmber4, event )
						local FlyingEmber4Frame4 = function ( FlyingEmber4, event )
							if not event.interrupted then
								FlyingEmber4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							FlyingEmber4:setLeftRight( 0, 0, 21, 165 )
							FlyingEmber4:setTopBottom( 0, 0, -97, 65 )
							FlyingEmber4:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FlyingEmber4, event )
							else
								FlyingEmber4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FlyingEmber4Frame4( FlyingEmber4, event )
							return 
						else
							FlyingEmber4:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FlyingEmber4:registerEventHandler( "transition_complete_keyframe", FlyingEmber4Frame4 )
						end
					end
					
					if event.interrupted then
						FlyingEmber4Frame3( FlyingEmber4, event )
						return 
					else
						FlyingEmber4:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						FlyingEmber4:setAlpha( 1 )
						FlyingEmber4:registerEventHandler( "transition_complete_keyframe", FlyingEmber4Frame3 )
					end
				end
				
				FlyingEmber4:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				FlyingEmber4:setLeftRight( 0, 0, 21, 165 )
				FlyingEmber4:setTopBottom( 0, 0, -97, 65 )
				FlyingEmber4:setAlpha( 0 )
				FlyingEmber4:registerEventHandler( "transition_complete_keyframe", FlyingEmber4Frame2 )
				local FlyingEmber5Frame2 = function ( FlyingEmber5, event )
					local FlyingEmber5Frame3 = function ( FlyingEmber5, event )
						local FlyingEmber5Frame4 = function ( FlyingEmber5, event )
							if not event.interrupted then
								FlyingEmber5:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							FlyingEmber5:setLeftRight( 0, 0, 93, 327 )
							FlyingEmber5:setTopBottom( 0, 0, -304, -16 )
							FlyingEmber5:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FlyingEmber5, event )
							else
								FlyingEmber5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FlyingEmber5Frame4( FlyingEmber5, event )
							return 
						else
							FlyingEmber5:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							FlyingEmber5:registerEventHandler( "transition_complete_keyframe", FlyingEmber5Frame4 )
						end
					end
					
					if event.interrupted then
						FlyingEmber5Frame3( FlyingEmber5, event )
						return 
					else
						FlyingEmber5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FlyingEmber5:setAlpha( 1 )
						FlyingEmber5:registerEventHandler( "transition_complete_keyframe", FlyingEmber5Frame3 )
					end
				end
				
				FlyingEmber5:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				FlyingEmber5:setLeftRight( 0, 0, 93, 327 )
				FlyingEmber5:setTopBottom( 0, 0, -304, -16 )
				FlyingEmber5:setAlpha( 0 )
				FlyingEmber5:registerEventHandler( "transition_complete_keyframe", FlyingEmber5Frame2 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

