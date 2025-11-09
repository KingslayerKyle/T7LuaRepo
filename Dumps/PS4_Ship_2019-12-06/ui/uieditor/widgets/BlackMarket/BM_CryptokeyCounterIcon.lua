CoD.BM_CryptokeyCounterIcon = InheritFrom( LUI.UIElement )
CoD.BM_CryptokeyCounterIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_CryptokeyCounterIcon )
	self.id = "BM_CryptokeyCounterIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 28 )
	self:setTopBottom( true, false, 0, 28 )
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( false, false, -30, 31 )
	Glow:setTopBottom( false, false, -31, 32 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_blackmarket_keyglow" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local ring = LUI.UIImage.new()
	ring:setLeftRight( false, false, -26, 27 )
	ring:setTopBottom( false, false, -26, 27 )
	ring:setAlpha( 0 )
	ring:setImage( RegisterImage( "uie_t7_blackmarket_keyringglow" ) )
	self:addElement( ring )
	self.ring = ring
	
	local cryptokey = LUI.UIImage.new()
	cryptokey:setLeftRight( false, false, -12, 13 )
	cryptokey:setTopBottom( false, false, -12, 13 )
	cryptokey:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( cryptokey )
	self.cryptokey = cryptokey
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				ring:completeAnimation()
				self.ring:setAlpha( 0 )
				self.clipFinished( ring, {} )
				cryptokey:completeAnimation()
				self.cryptokey:setAlpha( 1 )
				self.clipFinished( cryptokey, {} )
			end,
			Keybonus = function ()
				self:setupElementClipCounter( 3 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								if not event.interrupted then
									Glow:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
								end
								Glow:setAlpha( 0 )
								Glow:setXRot( 0 )
								if event.interrupted then
									self.clipFinished( Glow, event )
								else
									Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 1 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.Glow:setXRot( 0 )
				GlowFrame2( Glow, {} )
				local ringFrame2 = function ( ring, event )
					local ringFrame3 = function ( ring, event )
						local ringFrame4 = function ( ring, event )
							local ringFrame5 = function ( ring, event )
								local ringFrame6 = function ( ring, event )
									local ringFrame7 = function ( ring, event )
										if not event.interrupted then
											ring:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										end
										ring:setAlpha( 0 )
										ring:setScale( 1.8 )
										if event.interrupted then
											self.clipFinished( ring, event )
										else
											ring:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ringFrame7( ring, event )
										return 
									else
										ring:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
										ring:setAlpha( 0 )
										ring:setScale( 1.72 )
										ring:registerEventHandler( "transition_complete_keyframe", ringFrame7 )
									end
								end
								
								if event.interrupted then
									ringFrame6( ring, event )
									return 
								else
									ring:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
									ring:setScale( 1.57 )
									ring:registerEventHandler( "transition_complete_keyframe", ringFrame6 )
								end
							end
							
							if event.interrupted then
								ringFrame5( ring, event )
								return 
							else
								ring:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ring:setAlpha( 1 )
								ring:setScale( 1.02 )
								ring:registerEventHandler( "transition_complete_keyframe", ringFrame5 )
							end
						end
						
						if event.interrupted then
							ringFrame4( ring, event )
							return 
						else
							ring:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							ring:setAlpha( 0.96 )
							ring:registerEventHandler( "transition_complete_keyframe", ringFrame4 )
						end
					end
					
					if event.interrupted then
						ringFrame3( ring, event )
						return 
					else
						ring:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						ring:registerEventHandler( "transition_complete_keyframe", ringFrame3 )
					end
				end
				
				ring:completeAnimation()
				self.ring:setAlpha( 0 )
				self.ring:setScale( 1 )
				ringFrame2( ring, {} )
				cryptokey:completeAnimation()
				self.cryptokey:setAlpha( 1 )
				self.clipFinished( cryptokey, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

