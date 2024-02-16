-- 89daa252b71cc1c69d11239a4b182c70
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )
require( "ui.uieditor.widgets.ZMInventory.Ritual.RitualItemInUseByOtherPlayer" )

CoD.RitualItem = InheritFrom( LUI.UIElement )
CoD.RitualItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.RitualItem )
	self.id = "RitualItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 63 )
	self:setTopBottom( true, false, 0, 61 )
	self.anyChildUsesUpdateState = true
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( menu, controller )
	ZmFxSpark20:setLeftRight( false, false, -26.5, 26.5 )
	ZmFxSpark20:setTopBottom( false, false, -62.5, 30.5 )
	ZmFxSpark20:setRGB( 0, 1, 0.21 )
	ZmFxSpark20:setAlpha( 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local CompletedImage = LUI.UIImage.new()
	CompletedImage:setLeftRight( true, false, 0, 63 )
	CompletedImage:setTopBottom( true, false, 0, 61 )
	CompletedImage:setImage( RegisterImage( "uie_x" ) )
	self:addElement( CompletedImage )
	self.CompletedImage = CompletedImage
	
	local WormImage = LUI.UIImage.new()
	WormImage:setLeftRight( true, false, 0, 63 )
	WormImage:setTopBottom( true, false, 0, 61 )
	WormImage:setImage( RegisterImage( "uie_t7_icon_inventory_worm" ) )
	self:addElement( WormImage )
	self.WormImage = WormImage
	
	local RitualItemImage = LUI.UIImage.new()
	RitualItemImage:setLeftRight( true, false, 0, 63 )
	RitualItemImage:setTopBottom( true, false, 0, 61 )
	self:addElement( RitualItemImage )
	self.RitualItemImage = RitualItemImage
	
	local MissingImage = LUI.UIImage.new()
	MissingImage:setLeftRight( true, false, 0, 63 )
	MissingImage:setTopBottom( true, false, 0, 61 )
	MissingImage:setRGB( 0.45, 0.45, 0.45 )
	MissingImage:setAlpha( 0 )
	self:addElement( MissingImage )
	self.MissingImage = MissingImage
	
	local RitualItemNewImage = LUI.UIImage.new()
	RitualItemNewImage:setLeftRight( true, false, 0, 63 )
	RitualItemNewImage:setTopBottom( true, false, 0, 61 )
	self:addElement( RitualItemNewImage )
	self.RitualItemNewImage = RitualItemNewImage
	
	local RitualItemInUseByOtherPlayer = CoD.RitualItemInUseByOtherPlayer.new( menu, controller )
	RitualItemInUseByOtherPlayer:setLeftRight( true, false, 0, 63 )
	RitualItemInUseByOtherPlayer:setTopBottom( true, false, 0, 61 )
	self:addElement( RitualItemInUseByOtherPlayer )
	self.RitualItemInUseByOtherPlayer = RitualItemInUseByOtherPlayer
	
	self.clipsPerState = {
		ScoreboardFound = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				CompletedImage:completeAnimation()
				self.CompletedImage:setAlpha( 0 )
				self.clipFinished( CompletedImage, {} )

				WormImage:completeAnimation()
				self.WormImage:setAlpha( 0 )
				self.clipFinished( WormImage, {} )

				RitualItemImage:completeAnimation()
				self.RitualItemImage:setAlpha( 1 )
				self.clipFinished( RitualItemImage, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 0 )
				self.clipFinished( MissingImage, {} )

				RitualItemNewImage:completeAnimation()
				self.RitualItemNewImage:setAlpha( 0 )
				self.clipFinished( RitualItemNewImage, {} )

				RitualItemInUseByOtherPlayer:completeAnimation()

				RitualItemInUseByOtherPlayer.InUseByOtherPlayerImage:completeAnimation()

				RitualItemInUseByOtherPlayer.PlayerImage:completeAnimation()
				self.RitualItemInUseByOtherPlayer:setAlpha( 1 )
				self.RitualItemInUseByOtherPlayer.InUseByOtherPlayerImage:setAlpha( 0 )
				self.RitualItemInUseByOtherPlayer.PlayerImage:setAlpha( 1 )
				self.clipFinished( RitualItemInUseByOtherPlayer, {} )
			end
		},
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				CompletedImage:completeAnimation()
				self.CompletedImage:setAlpha( 0 )
				self.clipFinished( CompletedImage, {} )

				WormImage:completeAnimation()
				self.WormImage:setAlpha( 0 )
				self.clipFinished( WormImage, {} )

				RitualItemImage:completeAnimation()
				self.RitualItemImage:setAlpha( 0 )
				self.clipFinished( RitualItemImage, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 0 )
				self.clipFinished( MissingImage, {} )

				RitualItemNewImage:completeAnimation()
				self.RitualItemNewImage:setAlpha( 0 )
				self.clipFinished( RitualItemNewImage, {} )

				RitualItemInUseByOtherPlayer:completeAnimation()
				self.RitualItemInUseByOtherPlayer:setAlpha( 0 )
				self.clipFinished( RitualItemInUseByOtherPlayer, {} )
			end,
			Found = function ()
				self:setupElementClipCounter( 7 )

				local ZmFxSpark20Frame2 = function ( ZmFxSpark20, event )
					local ZmFxSpark20Frame3 = function ( ZmFxSpark20, event )
						local ZmFxSpark20Frame4 = function ( ZmFxSpark20, event )
							if not event.interrupted then
								ZmFxSpark20:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
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
							ZmFxSpark20:beginAnimation( "keyframe", 2619, false, false, CoD.TweenType.Linear )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 389, true, false, CoD.TweenType.Linear )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )

				CompletedImage:completeAnimation()
				self.CompletedImage:setAlpha( 0 )
				self.clipFinished( CompletedImage, {} )

				WormImage:completeAnimation()
				self.WormImage:setAlpha( 0 )
				self.clipFinished( WormImage, {} )

				RitualItemImage:completeAnimation()
				self.RitualItemImage:setAlpha( 0 )
				self.clipFinished( RitualItemImage, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 0 )
				self.clipFinished( MissingImage, {} )
				local RitualItemNewImageFrame2 = function ( RitualItemNewImage, event )
					local RitualItemNewImageFrame3 = function ( RitualItemNewImage, event )
						local RitualItemNewImageFrame4 = function ( RitualItemNewImage, event )
							local RitualItemNewImageFrame5 = function ( RitualItemNewImage, event )
								local RitualItemNewImageFrame6 = function ( RitualItemNewImage, event )
									local RitualItemNewImageFrame7 = function ( RitualItemNewImage, event )
										local RitualItemNewImageFrame8 = function ( RitualItemNewImage, event )
											local RitualItemNewImageFrame9 = function ( RitualItemNewImage, event )
												local RitualItemNewImageFrame10 = function ( RitualItemNewImage, event )
													local RitualItemNewImageFrame11 = function ( RitualItemNewImage, event )
														local RitualItemNewImageFrame12 = function ( RitualItemNewImage, event )
															if not event.interrupted then
																RitualItemNewImage:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
															end
															RitualItemNewImage:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( RitualItemNewImage, event )
															else
																RitualItemNewImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															RitualItemNewImageFrame12( RitualItemNewImage, event )
															return 
														else
															RitualItemNewImage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
															RitualItemNewImage:setAlpha( 1 )
															RitualItemNewImage:registerEventHandler( "transition_complete_keyframe", RitualItemNewImageFrame12 )
														end
													end
													
													if event.interrupted then
														RitualItemNewImageFrame11( RitualItemNewImage, event )
														return 
													else
														RitualItemNewImage:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
														RitualItemNewImage:setAlpha( 0.5 )
														RitualItemNewImage:registerEventHandler( "transition_complete_keyframe", RitualItemNewImageFrame11 )
													end
												end
												
												if event.interrupted then
													RitualItemNewImageFrame10( RitualItemNewImage, event )
													return 
												else
													RitualItemNewImage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													RitualItemNewImage:setAlpha( 1 )
													RitualItemNewImage:registerEventHandler( "transition_complete_keyframe", RitualItemNewImageFrame10 )
												end
											end
											
											if event.interrupted then
												RitualItemNewImageFrame9( RitualItemNewImage, event )
												return 
											else
												RitualItemNewImage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												RitualItemNewImage:setAlpha( 0.5 )
												RitualItemNewImage:registerEventHandler( "transition_complete_keyframe", RitualItemNewImageFrame9 )
											end
										end
										
										if event.interrupted then
											RitualItemNewImageFrame8( RitualItemNewImage, event )
											return 
										else
											RitualItemNewImage:beginAnimation( "keyframe", 2609, false, false, CoD.TweenType.Linear )
											RitualItemNewImage:registerEventHandler( "transition_complete_keyframe", RitualItemNewImageFrame8 )
										end
									end
									
									if event.interrupted then
										RitualItemNewImageFrame7( RitualItemNewImage, event )
										return 
									else
										RitualItemNewImage:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										RitualItemNewImage:setAlpha( 1 )
										RitualItemNewImage:registerEventHandler( "transition_complete_keyframe", RitualItemNewImageFrame7 )
									end
								end
								
								if event.interrupted then
									RitualItemNewImageFrame6( RitualItemNewImage, event )
									return 
								else
									RitualItemNewImage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									RitualItemNewImage:setAlpha( 0.5 )
									RitualItemNewImage:registerEventHandler( "transition_complete_keyframe", RitualItemNewImageFrame6 )
								end
							end
							
							if event.interrupted then
								RitualItemNewImageFrame5( RitualItemNewImage, event )
								return 
							else
								RitualItemNewImage:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								RitualItemNewImage:setAlpha( 1 )
								RitualItemNewImage:registerEventHandler( "transition_complete_keyframe", RitualItemNewImageFrame5 )
							end
						end
						
						if event.interrupted then
							RitualItemNewImageFrame4( RitualItemNewImage, event )
							return 
						else
							RitualItemNewImage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							RitualItemNewImage:setAlpha( 0.5 )
							RitualItemNewImage:registerEventHandler( "transition_complete_keyframe", RitualItemNewImageFrame4 )
						end
					end
					
					if event.interrupted then
						RitualItemNewImageFrame3( RitualItemNewImage, event )
						return 
					else
						RitualItemNewImage:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Linear )
						RitualItemNewImage:setAlpha( 1 )
						RitualItemNewImage:registerEventHandler( "transition_complete_keyframe", RitualItemNewImageFrame3 )
					end
				end
				
				RitualItemNewImage:completeAnimation()
				self.RitualItemNewImage:setAlpha( 0 )
				RitualItemNewImageFrame2( RitualItemNewImage, {} )

				RitualItemInUseByOtherPlayer:completeAnimation()
				self.RitualItemInUseByOtherPlayer:setAlpha( 0 )
				self.clipFinished( RitualItemInUseByOtherPlayer, {} )
			end
		},
		Found = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				CompletedImage:completeAnimation()
				self.CompletedImage:setAlpha( 0 )
				self.clipFinished( CompletedImage, {} )

				WormImage:completeAnimation()
				self.WormImage:setAlpha( 0 )
				self.clipFinished( WormImage, {} )
				local RitualItemImageFrame2 = function ( RitualItemImage, event )
					if not event.interrupted then
						RitualItemImage:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )
					end
					RitualItemImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RitualItemImage, event )
					else
						RitualItemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RitualItemImage:completeAnimation()
				self.RitualItemImage:setAlpha( 1 )
				RitualItemImageFrame2( RitualItemImage, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 0 )
				self.clipFinished( MissingImage, {} )
				RitualItemNewImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				RitualItemNewImage:setAlpha( 0 )
				RitualItemNewImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				RitualItemInUseByOtherPlayer:completeAnimation()
				self.RitualItemInUseByOtherPlayer:setAlpha( 0 )
				self.clipFinished( RitualItemInUseByOtherPlayer, {} )
			end
		},
		Completed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				CompletedImage:completeAnimation()
				self.CompletedImage:setAlpha( 1 )
				self.clipFinished( CompletedImage, {} )

				WormImage:completeAnimation()
				self.WormImage:setAlpha( 0 )
				self.clipFinished( WormImage, {} )

				RitualItemImage:completeAnimation()
				self.RitualItemImage:setAlpha( 0 )
				self.clipFinished( RitualItemImage, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 0 )
				self.clipFinished( MissingImage, {} )

				RitualItemNewImage:completeAnimation()
				self.RitualItemNewImage:setAlpha( 0 )
				self.clipFinished( RitualItemNewImage, {} )

				RitualItemInUseByOtherPlayer:completeAnimation()
				self.RitualItemInUseByOtherPlayer:setAlpha( 0 )
				self.clipFinished( RitualItemInUseByOtherPlayer, {} )
			end
		},
		Worm = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setLeftRight( false, false, -22.5, 22.5 )
				self.ZmFxSpark20:setTopBottom( false, false, -36.5, 26.5 )
				self.ZmFxSpark20:setRGB( 0.98, 1, 0 )
				self.ZmFxSpark20:setAlpha( 1 )
				self.clipFinished( ZmFxSpark20, {} )

				CompletedImage:completeAnimation()
				self.CompletedImage:setAlpha( 0 )
				self.clipFinished( CompletedImage, {} )

				WormImage:completeAnimation()
				self.WormImage:setAlpha( 1 )
				self.clipFinished( WormImage, {} )

				RitualItemImage:completeAnimation()
				self.RitualItemImage:setAlpha( 0 )
				self.clipFinished( RitualItemImage, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 0 )
				self.clipFinished( MissingImage, {} )

				RitualItemNewImage:completeAnimation()
				self.RitualItemNewImage:setAlpha( 0 )
				self.clipFinished( RitualItemNewImage, {} )

				RitualItemInUseByOtherPlayer:completeAnimation()

				RitualItemInUseByOtherPlayer.InUseByOtherPlayerImage:completeAnimation()

				RitualItemInUseByOtherPlayer.PlayerImage:completeAnimation()
				self.RitualItemInUseByOtherPlayer:setAlpha( 1 )
				self.RitualItemInUseByOtherPlayer.InUseByOtherPlayerImage:setAlpha( 0 )
				self.RitualItemInUseByOtherPlayer.PlayerImage:setAlpha( 1 )
				self.clipFinished( RitualItemInUseByOtherPlayer, {} )
			end
		},
		Activated = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

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
							ZmFxSpark20:beginAnimation( "keyframe", 1410, false, false, CoD.TweenType.Linear )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )

				CompletedImage:completeAnimation()
				self.CompletedImage:setAlpha( 0 )
				self.clipFinished( CompletedImage, {} )

				WormImage:completeAnimation()
				self.WormImage:setAlpha( 0 )
				self.clipFinished( WormImage, {} )
				local RitualItemImageFrame2 = function ( RitualItemImage, event )
					local RitualItemImageFrame3 = function ( RitualItemImage, event )
						local RitualItemImageFrame4 = function ( RitualItemImage, event )
							local RitualItemImageFrame5 = function ( RitualItemImage, event )
								if not event.interrupted then
									RitualItemImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								end
								RitualItemImage:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( RitualItemImage, event )
								else
									RitualItemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								RitualItemImageFrame5( RitualItemImage, event )
								return 
							else
								RitualItemImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								RitualItemImage:setAlpha( 1 )
								RitualItemImage:registerEventHandler( "transition_complete_keyframe", RitualItemImageFrame5 )
							end
						end
						
						if event.interrupted then
							RitualItemImageFrame4( RitualItemImage, event )
							return 
						else
							RitualItemImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							RitualItemImage:setAlpha( 0 )
							RitualItemImage:registerEventHandler( "transition_complete_keyframe", RitualItemImageFrame4 )
						end
					end
					
					if event.interrupted then
						RitualItemImageFrame3( RitualItemImage, event )
						return 
					else
						RitualItemImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						RitualItemImage:setAlpha( 1 )
						RitualItemImage:registerEventHandler( "transition_complete_keyframe", RitualItemImageFrame3 )
					end
				end
				
				RitualItemImage:completeAnimation()
				self.RitualItemImage:setAlpha( 0 )
				RitualItemImageFrame2( RitualItemImage, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 0 )
				self.clipFinished( MissingImage, {} )

				RitualItemNewImage:completeAnimation()
				self.RitualItemNewImage:setAlpha( 0 )
				self.clipFinished( RitualItemNewImage, {} )

				RitualItemInUseByOtherPlayer:completeAnimation()
				self.RitualItemInUseByOtherPlayer:setAlpha( 0 )
				self.clipFinished( RitualItemInUseByOtherPlayer, {} )
			end
		},
		InUseByOtherPlayer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				CompletedImage:completeAnimation()
				self.CompletedImage:setAlpha( 0 )
				self.clipFinished( CompletedImage, {} )

				WormImage:completeAnimation()
				self.WormImage:setAlpha( 0 )
				self.clipFinished( WormImage, {} )

				RitualItemImage:completeAnimation()
				self.RitualItemImage:setAlpha( 0 )
				self.clipFinished( RitualItemImage, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 0 )
				self.clipFinished( MissingImage, {} )

				RitualItemNewImage:completeAnimation()
				self.RitualItemNewImage:setAlpha( 0 )
				self.clipFinished( RitualItemNewImage, {} )
				local RitualItemInUseByOtherPlayerFrame2 = function ( RitualItemInUseByOtherPlayer, event )
					local RitualItemInUseByOtherPlayerFrame3 = function ( RitualItemInUseByOtherPlayer, event )
						local RitualItemInUseByOtherPlayerFrame4 = function ( RitualItemInUseByOtherPlayer, event )
							local RitualItemInUseByOtherPlayerFrame5 = function ( RitualItemInUseByOtherPlayer, event )
								if not event.interrupted then
									RitualItemInUseByOtherPlayer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								end
								RitualItemInUseByOtherPlayer:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( RitualItemInUseByOtherPlayer, event )
								else
									RitualItemInUseByOtherPlayer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								RitualItemInUseByOtherPlayerFrame5( RitualItemInUseByOtherPlayer, event )
								return 
							else
								RitualItemInUseByOtherPlayer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								RitualItemInUseByOtherPlayer:setAlpha( 0 )
								RitualItemInUseByOtherPlayer:registerEventHandler( "transition_complete_keyframe", RitualItemInUseByOtherPlayerFrame5 )
							end
						end
						
						if event.interrupted then
							RitualItemInUseByOtherPlayerFrame4( RitualItemInUseByOtherPlayer, event )
							return 
						else
							RitualItemInUseByOtherPlayer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							RitualItemInUseByOtherPlayer:setAlpha( 1 )
							RitualItemInUseByOtherPlayer:registerEventHandler( "transition_complete_keyframe", RitualItemInUseByOtherPlayerFrame4 )
						end
					end
					
					if event.interrupted then
						RitualItemInUseByOtherPlayerFrame3( RitualItemInUseByOtherPlayer, event )
						return 
					else
						RitualItemInUseByOtherPlayer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						RitualItemInUseByOtherPlayer:setAlpha( 0 )
						RitualItemInUseByOtherPlayer:registerEventHandler( "transition_complete_keyframe", RitualItemInUseByOtherPlayerFrame3 )
					end
				end
				
				RitualItemInUseByOtherPlayer:completeAnimation()
				self.RitualItemInUseByOtherPlayer:setAlpha( 1 )
				RitualItemInUseByOtherPlayerFrame2( RitualItemInUseByOtherPlayer, {} )
			end
		},
		Missing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				CompletedImage:completeAnimation()
				self.CompletedImage:setAlpha( 0 )
				self.clipFinished( CompletedImage, {} )

				WormImage:completeAnimation()
				self.WormImage:setAlpha( 0 )
				self.clipFinished( WormImage, {} )

				RitualItemImage:completeAnimation()
				self.RitualItemImage:setAlpha( 0 )
				self.clipFinished( RitualItemImage, {} )
				local MissingImageFrame2 = function ( MissingImage, event )
					local MissingImageFrame3 = function ( MissingImage, event )
						local MissingImageFrame4 = function ( MissingImage, event )
							local MissingImageFrame5 = function ( MissingImage, event )
								if not event.interrupted then
									MissingImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								end
								MissingImage:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( MissingImage, event )
								else
									MissingImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MissingImageFrame5( MissingImage, event )
								return 
							else
								MissingImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								MissingImage:setAlpha( 0 )
								MissingImage:registerEventHandler( "transition_complete_keyframe", MissingImageFrame5 )
							end
						end
						
						if event.interrupted then
							MissingImageFrame4( MissingImage, event )
							return 
						else
							MissingImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							MissingImage:setAlpha( 1 )
							MissingImage:registerEventHandler( "transition_complete_keyframe", MissingImageFrame4 )
						end
					end
					
					if event.interrupted then
						MissingImageFrame3( MissingImage, event )
						return 
					else
						MissingImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						MissingImage:setAlpha( 0 )
						MissingImage:registerEventHandler( "transition_complete_keyframe", MissingImageFrame3 )
					end
				end
				
				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 1 )
				MissingImageFrame2( MissingImage, {} )

				RitualItemNewImage:completeAnimation()
				self.RitualItemNewImage:setAlpha( 0 )
				self.clipFinished( RitualItemNewImage, {} )

				RitualItemInUseByOtherPlayer:completeAnimation()
				self.RitualItemInUseByOtherPlayer:setAlpha( 0 )
				self.clipFinished( RitualItemInUseByOtherPlayer, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not ShowQuestItemsWidget( controller )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f42_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f42_local0 = ShowQuestItemsWidget( controller )
				else
					f42_local0 = false
				end
				return f42_local0
			end
		},
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "Worm",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "Activated",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "InUseByOtherPlayer",
			condition = function ( menu, element, event )
				return not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		},
		{
			stateName = "Missing",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_quest_items" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_quest_items"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark20:close()
		element.RitualItemInUseByOtherPlayer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
