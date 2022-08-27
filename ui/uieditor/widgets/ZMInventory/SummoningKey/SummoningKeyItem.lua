-- 3404eed6a55daf5396a0a69b0e73fbf6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )

CoD.SummoningKeyItem = InheritFrom( LUI.UIElement )
CoD.SummoningKeyItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SummoningKeyItem )
	self.id = "SummoningKeyItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( menu, controller )
	ZmFxSpark20:setLeftRight( false, false, -43, 46 )
	ZmFxSpark20:setTopBottom( false, false, -81.5, 52.5 )
	ZmFxSpark20:setRGB( 0, 1, 0.21 )
	ZmFxSpark20:setAlpha( 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local SummoningKeyNew = LUI.UIImage.new()
	SummoningKeyNew:setLeftRight( true, false, -8.5, 120.5 )
	SummoningKeyNew:setTopBottom( true, false, 0, 129 )
	SummoningKeyNew:setAlpha( 0 )
	SummoningKeyNew:setImage( RegisterImage( "uie_t7_icon_inventory_key_new" ) )
	self:addElement( SummoningKeyNew )
	self.SummoningKeyNew = SummoningKeyNew
	
	local SummoningKey = LUI.UIImage.new()
	SummoningKey:setLeftRight( true, false, -8.5, 120.5 )
	SummoningKey:setTopBottom( true, false, 0, 129 )
	SummoningKey:setImage( RegisterImage( "uie_t7_icon_inventory_key" ) )
	self:addElement( SummoningKey )
	self.SummoningKey = SummoningKey
	
	local SummoningKeyMissingImage = LUI.UIImage.new()
	SummoningKeyMissingImage:setLeftRight( true, false, -8.5, 120.5 )
	SummoningKeyMissingImage:setTopBottom( true, false, 0, 129 )
	SummoningKeyMissingImage:setAlpha( 0 )
	SummoningKeyMissingImage:setImage( RegisterImage( "uie_t7_icon_inventory_key_disabled" ) )
	self:addElement( SummoningKeyMissingImage )
	self.SummoningKeyMissingImage = SummoningKeyMissingImage
	
	local SummoningKeyOtherPlayer = LUI.UIImage.new()
	SummoningKeyOtherPlayer:setLeftRight( true, false, -8.5, 120.5 )
	SummoningKeyOtherPlayer:setTopBottom( true, false, 0, 129 )
	SummoningKeyOtherPlayer:setAlpha( 0 )
	SummoningKeyOtherPlayer:setImage( RegisterImage( "uie_t7_icon_inventory_key_inuse" ) )
	self:addElement( SummoningKeyOtherPlayer )
	self.SummoningKeyOtherPlayer = SummoningKeyOtherPlayer
	
	local OtherPlayerImage = LUI.UIImage.new()
	OtherPlayerImage:setLeftRight( true, false, 66, 112 )
	OtherPlayerImage:setTopBottom( true, false, 83, 129 )
	self:addElement( OtherPlayerImage )
	self.OtherPlayerImage = OtherPlayerImage
	
	self.clipsPerState = {
		ScoreboardFound = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				SummoningKey:completeAnimation()
				self.SummoningKey:setAlpha( 1 )
				self.clipFinished( SummoningKey, {} )
				SummoningKeyMissingImage:completeAnimation()
				self.SummoningKeyMissingImage:setAlpha( 0 )
				self.clipFinished( SummoningKeyMissingImage, {} )
				SummoningKeyOtherPlayer:completeAnimation()
				self.SummoningKeyOtherPlayer:setAlpha( 0 )
				self.clipFinished( SummoningKeyOtherPlayer, {} )
				OtherPlayerImage:completeAnimation()
				self.OtherPlayerImage:setAlpha( 0 )
				self.clipFinished( OtherPlayerImage, {} )
			end
		},
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				SummoningKey:completeAnimation()
				self.SummoningKey:setAlpha( 0 )
				self.clipFinished( SummoningKey, {} )
				SummoningKeyMissingImage:completeAnimation()
				self.SummoningKeyMissingImage:setAlpha( 0 )
				self.clipFinished( SummoningKeyMissingImage, {} )
				SummoningKeyOtherPlayer:completeAnimation()
				self.SummoningKeyOtherPlayer:setAlpha( 0 )
				self.clipFinished( SummoningKeyOtherPlayer, {} )
				OtherPlayerImage:completeAnimation()
				self.OtherPlayerImage:setAlpha( 0 )
				self.clipFinished( OtherPlayerImage, {} )
			end,
			Found = function ()
				self:setupElementClipCounter( 6 )
				local ZmFxSpark20Frame2 = function ( ZmFxSpark20, event )
					local ZmFxSpark20Frame3 = function ( ZmFxSpark20, event )
						local ZmFxSpark20Frame4 = function ( ZmFxSpark20, event )
							if not event.interrupted then
								ZmFxSpark20:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark20:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmFxSpark20, event )
							else
								ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmFxSpark20Frame4( ZmFxSpark20, event )
							return 
						else
							ZmFxSpark20:beginAnimation( "keyframe", 2609, false, false, CoD.TweenType.Linear )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 400, true, false, CoD.TweenType.Linear )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )
				local f4_local1 = function ( f8_arg0, f8_arg1 )
					local f8_local0 = function ( f9_arg0, f9_arg1 )
						local f9_local0 = function ( f10_arg0, f10_arg1 )
							local f10_local0 = function ( f11_arg0, f11_arg1 )
								local f11_local0 = function ( f12_arg0, f12_arg1 )
									local f12_local0 = function ( f13_arg0, f13_arg1 )
										if not f13_arg1.interrupted then
											f13_arg0:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
										end
										f13_arg0:setAlpha( 0 )
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
										f12_arg0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
										f12_arg0:setAlpha( 1 )
										f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
									end
								end
								
								if f11_arg1.interrupted then
									f11_local0( f11_arg0, f11_arg1 )
									return 
								else
									f11_arg0:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
									f11_arg0:setAlpha( 0 )
									f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
								end
							end
							
							if f10_arg1.interrupted then
								f10_local0( f10_arg0, f10_arg1 )
								return 
							else
								f10_arg0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
								f10_arg0:setAlpha( 1 )
								f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
							end
						end
						
						if f9_arg1.interrupted then
							f9_local0( f9_arg0, f9_arg1 )
							return 
						else
							f9_arg0:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
							f9_arg0:setAlpha( 0 )
							f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
						end
					end
					
					if f8_arg1.interrupted then
						f8_local0( f8_arg0, f8_arg1 )
						return 
					else
						f8_arg0:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						f8_arg0:setAlpha( 1 )
						f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
					end
				end
				
				SummoningKeyNew:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
				SummoningKeyNew:setAlpha( 0 )
				SummoningKeyNew:registerEventHandler( "transition_complete_keyframe", f4_local1 )
				local SummoningKeyFrame2 = function ( SummoningKey, event )
					local SummoningKeyFrame3 = function ( SummoningKey, event )
						local SummoningKeyFrame4 = function ( SummoningKey, event )
							local SummoningKeyFrame5 = function ( SummoningKey, event )
								local SummoningKeyFrame6 = function ( SummoningKey, event )
									local SummoningKeyFrame7 = function ( SummoningKey, event )
										local SummoningKeyFrame8 = function ( SummoningKey, event )
											local SummoningKeyFrame9 = function ( SummoningKey, event )
												local SummoningKeyFrame10 = function ( SummoningKey, event )
													local SummoningKeyFrame11 = function ( SummoningKey, event )
														local SummoningKeyFrame12 = function ( SummoningKey, event )
															if not event.interrupted then
																SummoningKey:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
															end
															SummoningKey:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( SummoningKey, event )
															else
																SummoningKey:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															SummoningKeyFrame12( SummoningKey, event )
															return 
														else
															SummoningKey:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															SummoningKey:setAlpha( 1 )
															SummoningKey:registerEventHandler( "transition_complete_keyframe", SummoningKeyFrame12 )
														end
													end
													
													if event.interrupted then
														SummoningKeyFrame11( SummoningKey, event )
														return 
													else
														SummoningKey:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
														SummoningKey:setAlpha( 0.5 )
														SummoningKey:registerEventHandler( "transition_complete_keyframe", SummoningKeyFrame11 )
													end
												end
												
												if event.interrupted then
													SummoningKeyFrame10( SummoningKey, event )
													return 
												else
													SummoningKey:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
													SummoningKey:setAlpha( 1 )
													SummoningKey:registerEventHandler( "transition_complete_keyframe", SummoningKeyFrame10 )
												end
											end
											
											if event.interrupted then
												SummoningKeyFrame9( SummoningKey, event )
												return 
											else
												SummoningKey:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												SummoningKey:setAlpha( 0.5 )
												SummoningKey:registerEventHandler( "transition_complete_keyframe", SummoningKeyFrame9 )
											end
										end
										
										if event.interrupted then
											SummoningKeyFrame8( SummoningKey, event )
											return 
										else
											SummoningKey:beginAnimation( "keyframe", 2639, false, false, CoD.TweenType.Linear )
											SummoningKey:registerEventHandler( "transition_complete_keyframe", SummoningKeyFrame8 )
										end
									end
									
									if event.interrupted then
										SummoningKeyFrame7( SummoningKey, event )
										return 
									else
										SummoningKey:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										SummoningKey:setAlpha( 1 )
										SummoningKey:registerEventHandler( "transition_complete_keyframe", SummoningKeyFrame7 )
									end
								end
								
								if event.interrupted then
									SummoningKeyFrame6( SummoningKey, event )
									return 
								else
									SummoningKey:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									SummoningKey:setAlpha( 0.5 )
									SummoningKey:registerEventHandler( "transition_complete_keyframe", SummoningKeyFrame6 )
								end
							end
							
							if event.interrupted then
								SummoningKeyFrame5( SummoningKey, event )
								return 
							else
								SummoningKey:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								SummoningKey:setAlpha( 1 )
								SummoningKey:registerEventHandler( "transition_complete_keyframe", SummoningKeyFrame5 )
							end
						end
						
						if event.interrupted then
							SummoningKeyFrame4( SummoningKey, event )
							return 
						else
							SummoningKey:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							SummoningKey:setAlpha( 0.5 )
							SummoningKey:registerEventHandler( "transition_complete_keyframe", SummoningKeyFrame4 )
						end
					end
					
					if event.interrupted then
						SummoningKeyFrame3( SummoningKey, event )
						return 
					else
						SummoningKey:beginAnimation( "keyframe", 209, true, false, CoD.TweenType.Linear )
						SummoningKey:setAlpha( 1 )
						SummoningKey:registerEventHandler( "transition_complete_keyframe", SummoningKeyFrame3 )
					end
				end
				
				SummoningKey:completeAnimation()
				self.SummoningKey:setAlpha( 0 )
				SummoningKeyFrame2( SummoningKey, {} )
				SummoningKeyMissingImage:completeAnimation()
				self.SummoningKeyMissingImage:setAlpha( 0 )
				self.clipFinished( SummoningKeyMissingImage, {} )
				SummoningKeyOtherPlayer:completeAnimation()
				self.SummoningKeyOtherPlayer:setAlpha( 0 )
				self.clipFinished( SummoningKeyOtherPlayer, {} )
				OtherPlayerImage:completeAnimation()
				self.OtherPlayerImage:setAlpha( 0 )
				self.clipFinished( OtherPlayerImage, {} )
			end
		},
		Activated = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local SummoningKeyFrame2 = function ( SummoningKey, event )
					local SummoningKeyFrame3 = function ( SummoningKey, event )
						local SummoningKeyFrame4 = function ( SummoningKey, event )
							local SummoningKeyFrame5 = function ( SummoningKey, event )
								if not event.interrupted then
									SummoningKey:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								end
								SummoningKey:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( SummoningKey, event )
								else
									SummoningKey:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								SummoningKeyFrame5( SummoningKey, event )
								return 
							else
								SummoningKey:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								SummoningKey:setAlpha( 0 )
								SummoningKey:registerEventHandler( "transition_complete_keyframe", SummoningKeyFrame5 )
							end
						end
						
						if event.interrupted then
							SummoningKeyFrame4( SummoningKey, event )
							return 
						else
							SummoningKey:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							SummoningKey:setAlpha( 1 )
							SummoningKey:registerEventHandler( "transition_complete_keyframe", SummoningKeyFrame4 )
						end
					end
					
					if event.interrupted then
						SummoningKeyFrame3( SummoningKey, event )
						return 
					else
						SummoningKey:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						SummoningKey:setAlpha( 0 )
						SummoningKey:registerEventHandler( "transition_complete_keyframe", SummoningKeyFrame3 )
					end
				end
				
				SummoningKey:completeAnimation()
				self.SummoningKey:setAlpha( 1 )
				SummoningKeyFrame2( SummoningKey, {} )
				SummoningKeyMissingImage:completeAnimation()
				self.SummoningKeyMissingImage:setAlpha( 0 )
				self.clipFinished( SummoningKeyMissingImage, {} )
				SummoningKeyOtherPlayer:completeAnimation()
				self.SummoningKeyOtherPlayer:setAlpha( 0 )
				self.clipFinished( SummoningKeyOtherPlayer, {} )
				OtherPlayerImage:completeAnimation()
				self.OtherPlayerImage:setAlpha( 0 )
				self.clipFinished( OtherPlayerImage, {} )
			end
		},
		Found = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				SummoningKey:completeAnimation()
				self.SummoningKey:setAlpha( 1 )
				self.clipFinished( SummoningKey, {} )
				SummoningKeyMissingImage:completeAnimation()
				self.SummoningKeyMissingImage:setAlpha( 0 )
				self.clipFinished( SummoningKeyMissingImage, {} )
				SummoningKeyOtherPlayer:completeAnimation()
				self.SummoningKeyOtherPlayer:setAlpha( 0 )
				self.clipFinished( SummoningKeyOtherPlayer, {} )
				OtherPlayerImage:completeAnimation()
				self.OtherPlayerImage:setAlpha( 0 )
				self.clipFinished( OtherPlayerImage, {} )
			end
		},
		Missing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				SummoningKey:completeAnimation()
				self.SummoningKey:setAlpha( 0 )
				self.clipFinished( SummoningKey, {} )
				local SummoningKeyMissingImageFrame2 = function ( SummoningKeyMissingImage, event )
					local SummoningKeyMissingImageFrame3 = function ( SummoningKeyMissingImage, event )
						local SummoningKeyMissingImageFrame4 = function ( SummoningKeyMissingImage, event )
							local SummoningKeyMissingImageFrame5 = function ( SummoningKeyMissingImage, event )
								if not event.interrupted then
									SummoningKeyMissingImage:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
								end
								SummoningKeyMissingImage:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( SummoningKeyMissingImage, event )
								else
									SummoningKeyMissingImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								SummoningKeyMissingImageFrame5( SummoningKeyMissingImage, event )
								return 
							else
								SummoningKeyMissingImage:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
								SummoningKeyMissingImage:setAlpha( 0 )
								SummoningKeyMissingImage:registerEventHandler( "transition_complete_keyframe", SummoningKeyMissingImageFrame5 )
							end
						end
						
						if event.interrupted then
							SummoningKeyMissingImageFrame4( SummoningKeyMissingImage, event )
							return 
						else
							SummoningKeyMissingImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							SummoningKeyMissingImage:setAlpha( 1 )
							SummoningKeyMissingImage:registerEventHandler( "transition_complete_keyframe", SummoningKeyMissingImageFrame4 )
						end
					end
					
					if event.interrupted then
						SummoningKeyMissingImageFrame3( SummoningKeyMissingImage, event )
						return 
					else
						SummoningKeyMissingImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						SummoningKeyMissingImage:setAlpha( 0 )
						SummoningKeyMissingImage:registerEventHandler( "transition_complete_keyframe", SummoningKeyMissingImageFrame3 )
					end
				end
				
				SummoningKeyMissingImage:completeAnimation()
				self.SummoningKeyMissingImage:setAlpha( 1 )
				SummoningKeyMissingImageFrame2( SummoningKeyMissingImage, {} )
			end
		},
		ScoreboardMissing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				SummoningKey:completeAnimation()
				self.SummoningKey:setAlpha( 0 )
				self.clipFinished( SummoningKey, {} )
				SummoningKeyMissingImage:completeAnimation()
				self.SummoningKeyMissingImage:setAlpha( 0 )
				self.clipFinished( SummoningKeyMissingImage, {} )
				SummoningKeyOtherPlayer:completeAnimation()
				self.SummoningKeyOtherPlayer:setAlpha( 0 )
				self.clipFinished( SummoningKeyOtherPlayer, {} )
				OtherPlayerImage:completeAnimation()
				self.OtherPlayerImage:setAlpha( 0 )
				self.clipFinished( OtherPlayerImage, {} )
			end
		},
		InUseByOtherPlayer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				SummoningKey:completeAnimation()
				self.SummoningKey:setAlpha( 0 )
				self.clipFinished( SummoningKey, {} )
				SummoningKeyMissingImage:completeAnimation()
				self.SummoningKeyMissingImage:setAlpha( 0 )
				self.clipFinished( SummoningKeyMissingImage, {} )
				local SummoningKeyOtherPlayerFrame2 = function ( SummoningKeyOtherPlayer, event )
					local SummoningKeyOtherPlayerFrame3 = function ( SummoningKeyOtherPlayer, event )
						local SummoningKeyOtherPlayerFrame4 = function ( SummoningKeyOtherPlayer, event )
							local SummoningKeyOtherPlayerFrame5 = function ( SummoningKeyOtherPlayer, event )
								if not event.interrupted then
									SummoningKeyOtherPlayer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								end
								SummoningKeyOtherPlayer:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( SummoningKeyOtherPlayer, event )
								else
									SummoningKeyOtherPlayer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								SummoningKeyOtherPlayerFrame5( SummoningKeyOtherPlayer, event )
								return 
							else
								SummoningKeyOtherPlayer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								SummoningKeyOtherPlayer:setAlpha( 0 )
								SummoningKeyOtherPlayer:registerEventHandler( "transition_complete_keyframe", SummoningKeyOtherPlayerFrame5 )
							end
						end
						
						if event.interrupted then
							SummoningKeyOtherPlayerFrame4( SummoningKeyOtherPlayer, event )
							return 
						else
							SummoningKeyOtherPlayer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							SummoningKeyOtherPlayer:setAlpha( 1 )
							SummoningKeyOtherPlayer:registerEventHandler( "transition_complete_keyframe", SummoningKeyOtherPlayerFrame4 )
						end
					end
					
					if event.interrupted then
						SummoningKeyOtherPlayerFrame3( SummoningKeyOtherPlayer, event )
						return 
					else
						SummoningKeyOtherPlayer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						SummoningKeyOtherPlayer:setAlpha( 0 )
						SummoningKeyOtherPlayer:registerEventHandler( "transition_complete_keyframe", SummoningKeyOtherPlayerFrame3 )
					end
				end
				
				SummoningKeyOtherPlayer:completeAnimation()
				self.SummoningKeyOtherPlayer:setAlpha( 1 )
				SummoningKeyOtherPlayerFrame2( SummoningKeyOtherPlayer, {} )
				local OtherPlayerImageFrame2 = function ( OtherPlayerImage, event )
					local OtherPlayerImageFrame3 = function ( OtherPlayerImage, event )
						local OtherPlayerImageFrame4 = function ( OtherPlayerImage, event )
							local OtherPlayerImageFrame5 = function ( OtherPlayerImage, event )
								if not event.interrupted then
									OtherPlayerImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								end
								OtherPlayerImage:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( OtherPlayerImage, event )
								else
									OtherPlayerImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								OtherPlayerImageFrame5( OtherPlayerImage, event )
								return 
							else
								OtherPlayerImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								OtherPlayerImage:setAlpha( 0 )
								OtherPlayerImage:registerEventHandler( "transition_complete_keyframe", OtherPlayerImageFrame5 )
							end
						end
						
						if event.interrupted then
							OtherPlayerImageFrame4( OtherPlayerImage, event )
							return 
						else
							OtherPlayerImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							OtherPlayerImage:setAlpha( 1 )
							OtherPlayerImage:registerEventHandler( "transition_complete_keyframe", OtherPlayerImageFrame4 )
						end
					end
					
					if event.interrupted then
						OtherPlayerImageFrame3( OtherPlayerImage, event )
						return 
					else
						OtherPlayerImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						OtherPlayerImage:setAlpha( 0 )
						OtherPlayerImage:registerEventHandler( "transition_complete_keyframe", OtherPlayerImageFrame3 )
					end
				end
				
				OtherPlayerImage:completeAnimation()
				self.OtherPlayerImage:setAlpha( 1 )
				OtherPlayerImageFrame2( OtherPlayerImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "InUseByOtherPlayer",
			condition = function ( menu, element, event )
				return SummoningKeyBeingUsedByOtherPlayer( controller )
			end
		},
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return SummonningKeyVisible( controller ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		},
		{
			stateName = "Activated",
			condition = function ( menu, element, event )
				return SummoningKeyBeingUsed( controller )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return SummonningKeyVisible( controller )
			end
		},
		{
			stateName = "Missing",
			condition = function ( menu, element, event )
				return SummoningKeyMissing( controller )
			end
		},
		{
			stateName = "ScoreboardMissing",
			condition = function ( menu, element, event )
				local f51_local0
				if not SummonningKeyVisible( controller ) then
					f51_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
				else
					f51_local0 = false
				end
				return f51_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.used_quest_key" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.used_quest_key"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.quest_key" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.quest_key"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_boxer_memento" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_boxer_memento"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_detective_memento" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_detective_memento"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_magician_memento" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_magician_memento"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.check_femme_memento" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.check_femme_memento"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark20:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

