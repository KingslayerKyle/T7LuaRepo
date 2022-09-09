-- c773a45b607cdd4589f87178b6112507
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.Loot7.CallingCard_loot_bling_bg" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_GoldFrame" )

CoD.CallingCard_loot_bling = InheritFrom( LUI.UIElement )
CoD.CallingCard_loot_bling.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCard_loot_bling )
	self.id = "CallingCard_loot_bling"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local bg2 = LUI.UIImage.new()
	bg2:setLeftRight( true, false, 0, 480 )
	bg2:setTopBottom( true, false, 0, 120 )
	bg2:setRGB( 0, 0, 0 )
	self:addElement( bg2 )
	self.bg2 = bg2
	
	local CallingCardlootblingbg = CoD.CallingCard_loot_bling_bg.new( menu, controller )
	CallingCardlootblingbg:setLeftRight( true, false, 0, 480 )
	CallingCardlootblingbg:setTopBottom( true, false, 0, 120 )
	self:addElement( CallingCardlootblingbg )
	self.CallingCardlootblingbg = CallingCardlootblingbg
	
	local GlowWhiteOver0 = LUI.UIImage.new()
	GlowWhiteOver0:setLeftRight( true, false, -371, 73 )
	GlowWhiteOver0:setTopBottom( true, false, -238.98, 358.98 )
	GlowWhiteOver0:setAlpha( 0 )
	GlowWhiteOver0:setZRot( -90 )
	GlowWhiteOver0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowWhiteOver0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowWhiteOver0 )
	self.GlowWhiteOver0 = GlowWhiteOver0
	
	local GlowWhiteOver00 = LUI.UIImage.new()
	GlowWhiteOver00:setLeftRight( true, false, -371, 73 )
	GlowWhiteOver00:setTopBottom( true, false, -238.98, 358.98 )
	GlowWhiteOver00:setRGB( 1, 0.84, 0 )
	GlowWhiteOver00:setAlpha( 0 )
	GlowWhiteOver00:setZRot( -90 )
	GlowWhiteOver00:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowWhiteOver00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowWhiteOver00 )
	self.GlowWhiteOver00 = GlowWhiteOver00
	
	local GlowWhiteOver01 = LUI.UIImage.new()
	GlowWhiteOver01:setLeftRight( true, false, 388, 832 )
	GlowWhiteOver01:setTopBottom( true, false, -175, 422.96 )
	GlowWhiteOver01:setAlpha( 0 )
	GlowWhiteOver01:setZRot( -90 )
	GlowWhiteOver01:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowWhiteOver01:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowWhiteOver01 )
	self.GlowWhiteOver01 = GlowWhiteOver01
	
	local GlowWhiteOver000 = LUI.UIImage.new()
	GlowWhiteOver000:setLeftRight( true, false, 388, 832 )
	GlowWhiteOver000:setTopBottom( true, false, -175, 422.96 )
	GlowWhiteOver000:setRGB( 1, 0.84, 0 )
	GlowWhiteOver000:setAlpha( 0 )
	GlowWhiteOver000:setZRot( -90 )
	GlowWhiteOver000:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowWhiteOver000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowWhiteOver000 )
	self.GlowWhiteOver000 = GlowWhiteOver000
	
	local gun = LUI.UIImage.new()
	gun:setLeftRight( true, false, 0, 480 )
	gun:setTopBottom( true, false, 0, 120 )
	gun:setImage( RegisterImage( "uie_lt_callingcard_bling_gun1" ) )
	self:addElement( gun )
	self.gun = gun
	
	local gunglow = LUI.UIImage.new()
	gunglow:setLeftRight( true, false, 0, 480 )
	gunglow:setTopBottom( true, false, 0, 120 )
	gunglow:setAlpha( 0.27 )
	gunglow:setImage( RegisterImage( "uie_lt_callingcard_bling_gun1" ) )
	gunglow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( gunglow )
	self.gunglow = gunglow
	
	local gunBlur = LUI.UIImage.new()
	gunBlur:setLeftRight( true, false, 0, 480 )
	gunBlur:setTopBottom( true, false, 0, 120 )
	gunBlur:setAlpha( 0 )
	gunBlur:setImage( RegisterImage( "uie_lt_callingcard_bling_gun2" ) )
	gunBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	gunBlur:setShaderVector( 0, 0, 1, 0, 0 )
	gunBlur:setShaderVector( 1, 0.06, 1.53, 0, 0 )
	gunBlur:setShaderVector( 2, 0, 1, 0, 0 )
	gunBlur:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( gunBlur )
	self.gunBlur = gunBlur
	
	local stars1 = LUI.UIImage.new()
	stars1:setLeftRight( true, false, 0, 480 )
	stars1:setTopBottom( true, false, 0, 120 )
	stars1:setImage( RegisterImage( "uie_lt_callingcard_bling_stars1" ) )
	self:addElement( stars1 )
	self.stars1 = stars1
	
	local stars10 = LUI.UIImage.new()
	stars10:setLeftRight( true, false, 0, 480 )
	stars10:setTopBottom( true, false, 0, 120 )
	stars10:setAlpha( 0 )
	stars10:setImage( RegisterImage( "uie_lt_callingcard_bling_stars1" ) )
	stars10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( stars10 )
	self.stars10 = stars10
	
	local stars2 = LUI.UIImage.new()
	stars2:setLeftRight( true, false, 0, 480 )
	stars2:setTopBottom( true, false, 0, 120 )
	stars2:setAlpha( 0 )
	stars2:setImage( RegisterImage( "uie_lt_callingcard_bling_stars2" ) )
	self:addElement( stars2 )
	self.stars2 = stars2
	
	local stars20 = LUI.UIImage.new()
	stars20:setLeftRight( true, false, 0, 480 )
	stars20:setTopBottom( true, false, 0, 120 )
	stars20:setAlpha( 0 )
	stars20:setImage( RegisterImage( "uie_lt_callingcard_bling_stars2" ) )
	stars20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( stars20 )
	self.stars20 = stars20
	
	local GlowWhiteOver = LUI.UIImage.new()
	GlowWhiteOver:setLeftRight( true, false, -158.55, -72.58 )
	GlowWhiteOver:setTopBottom( true, false, -238.98, 368.98 )
	GlowWhiteOver:setAlpha( 0 )
	GlowWhiteOver:setZRot( -90 )
	GlowWhiteOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowWhiteOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowWhiteOver )
	self.GlowWhiteOver = GlowWhiteOver
	
	local GlowWhiteOver1 = LUI.UIImage.new()
	GlowWhiteOver1:setLeftRight( true, false, -158.55, -72.58 )
	GlowWhiteOver1:setTopBottom( true, false, -238.98, 368.98 )
	GlowWhiteOver1:setRGB( 1, 0.84, 0 )
	GlowWhiteOver1:setAlpha( 0 )
	GlowWhiteOver1:setZRot( -90 )
	GlowWhiteOver1:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowWhiteOver1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowWhiteOver1 )
	self.GlowWhiteOver1 = GlowWhiteOver1
	
	local GlowWhiteOver10 = LUI.UIImage.new()
	GlowWhiteOver10:setLeftRight( true, false, 578, 663.97 )
	GlowWhiteOver10:setTopBottom( true, false, -216.98, 390.98 )
	GlowWhiteOver10:setRGB( 1, 0.84, 0 )
	GlowWhiteOver10:setAlpha( 0 )
	GlowWhiteOver10:setZRot( -90 )
	GlowWhiteOver10:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowWhiteOver10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowWhiteOver10 )
	self.GlowWhiteOver10 = GlowWhiteOver10
	
	local GlowWhiteOver2 = LUI.UIImage.new()
	GlowWhiteOver2:setLeftRight( true, false, 578, 663.97 )
	GlowWhiteOver2:setTopBottom( true, false, -216.98, 390.98 )
	GlowWhiteOver2:setAlpha( 0 )
	GlowWhiteOver2:setZRot( -90 )
	GlowWhiteOver2:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowWhiteOver2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowWhiteOver2 )
	self.GlowWhiteOver2 = GlowWhiteOver2
	
	local CallingCardsGoldFrame = CoD.CallingCards_GoldFrame.new( menu, controller )
	CallingCardsGoldFrame:setLeftRight( true, true, 0, 0 )
	CallingCardsGoldFrame:setTopBottom( true, true, 0, 0 )
	self:addElement( CallingCardsGoldFrame )
	self.CallingCardsGoldFrame = CallingCardsGoldFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				CallingCardlootblingbg:completeAnimation()
				self.CallingCardlootblingbg:setAlpha( 1 )
				self.clipFinished( CallingCardlootblingbg, {} )
				local GlowWhiteOver0Frame2 = function ( GlowWhiteOver0, event )
					local GlowWhiteOver0Frame3 = function ( GlowWhiteOver0, event )
						local GlowWhiteOver0Frame4 = function ( GlowWhiteOver0, event )
							local GlowWhiteOver0Frame5 = function ( GlowWhiteOver0, event )
								if not event.interrupted then
									GlowWhiteOver0:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
								end
								GlowWhiteOver0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowWhiteOver0, event )
								else
									GlowWhiteOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowWhiteOver0Frame5( GlowWhiteOver0, event )
								return 
							else
								GlowWhiteOver0:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
								GlowWhiteOver0:setAlpha( 0.15 )
								GlowWhiteOver0:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver0Frame5 )
							end
						end
						
						if event.interrupted then
							GlowWhiteOver0Frame4( GlowWhiteOver0, event )
							return 
						else
							GlowWhiteOver0:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
							GlowWhiteOver0:setAlpha( 0 )
							GlowWhiteOver0:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver0Frame4 )
						end
					end
					
					if event.interrupted then
						GlowWhiteOver0Frame3( GlowWhiteOver0, event )
						return 
					else
						GlowWhiteOver0:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						GlowWhiteOver0:setAlpha( 0.15 )
						GlowWhiteOver0:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver0Frame3 )
					end
				end
				
				GlowWhiteOver0:completeAnimation()
				self.GlowWhiteOver0:setAlpha( 0 )
				GlowWhiteOver0Frame2( GlowWhiteOver0, {} )
				local GlowWhiteOver00Frame2 = function ( GlowWhiteOver00, event )
					local GlowWhiteOver00Frame3 = function ( GlowWhiteOver00, event )
						local GlowWhiteOver00Frame4 = function ( GlowWhiteOver00, event )
							local GlowWhiteOver00Frame5 = function ( GlowWhiteOver00, event )
								if not event.interrupted then
									GlowWhiteOver00:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
								end
								GlowWhiteOver00:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowWhiteOver00, event )
								else
									GlowWhiteOver00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowWhiteOver00Frame5( GlowWhiteOver00, event )
								return 
							else
								GlowWhiteOver00:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
								GlowWhiteOver00:setAlpha( 0.25 )
								GlowWhiteOver00:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver00Frame5 )
							end
						end
						
						if event.interrupted then
							GlowWhiteOver00Frame4( GlowWhiteOver00, event )
							return 
						else
							GlowWhiteOver00:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
							GlowWhiteOver00:setAlpha( 0 )
							GlowWhiteOver00:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver00Frame4 )
						end
					end
					
					if event.interrupted then
						GlowWhiteOver00Frame3( GlowWhiteOver00, event )
						return 
					else
						GlowWhiteOver00:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						GlowWhiteOver00:setAlpha( 0.25 )
						GlowWhiteOver00:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver00Frame3 )
					end
				end
				
				GlowWhiteOver00:completeAnimation()
				self.GlowWhiteOver00:setAlpha( 0.1 )
				GlowWhiteOver00Frame2( GlowWhiteOver00, {} )
				local GlowWhiteOver01Frame2 = function ( GlowWhiteOver01, event )
					local GlowWhiteOver01Frame3 = function ( GlowWhiteOver01, event )
						local GlowWhiteOver01Frame4 = function ( GlowWhiteOver01, event )
							local GlowWhiteOver01Frame5 = function ( GlowWhiteOver01, event )
								if not event.interrupted then
									GlowWhiteOver01:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
								end
								GlowWhiteOver01:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowWhiteOver01, event )
								else
									GlowWhiteOver01:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowWhiteOver01Frame5( GlowWhiteOver01, event )
								return 
							else
								GlowWhiteOver01:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
								GlowWhiteOver01:setAlpha( 0.1 )
								GlowWhiteOver01:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver01Frame5 )
							end
						end
						
						if event.interrupted then
							GlowWhiteOver01Frame4( GlowWhiteOver01, event )
							return 
						else
							GlowWhiteOver01:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
							GlowWhiteOver01:setAlpha( 0 )
							GlowWhiteOver01:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver01Frame4 )
						end
					end
					
					if event.interrupted then
						GlowWhiteOver01Frame3( GlowWhiteOver01, event )
						return 
					else
						GlowWhiteOver01:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						GlowWhiteOver01:setAlpha( 0.1 )
						GlowWhiteOver01:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver01Frame3 )
					end
				end
				
				GlowWhiteOver01:completeAnimation()
				self.GlowWhiteOver01:setAlpha( 0 )
				GlowWhiteOver01Frame2( GlowWhiteOver01, {} )
				local GlowWhiteOver000Frame2 = function ( GlowWhiteOver000, event )
					local GlowWhiteOver000Frame3 = function ( GlowWhiteOver000, event )
						local GlowWhiteOver000Frame4 = function ( GlowWhiteOver000, event )
							local GlowWhiteOver000Frame5 = function ( GlowWhiteOver000, event )
								if not event.interrupted then
									GlowWhiteOver000:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
								end
								GlowWhiteOver000:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowWhiteOver000, event )
								else
									GlowWhiteOver000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowWhiteOver000Frame5( GlowWhiteOver000, event )
								return 
							else
								GlowWhiteOver000:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
								GlowWhiteOver000:setAlpha( 0.25 )
								GlowWhiteOver000:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver000Frame5 )
							end
						end
						
						if event.interrupted then
							GlowWhiteOver000Frame4( GlowWhiteOver000, event )
							return 
						else
							GlowWhiteOver000:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
							GlowWhiteOver000:setAlpha( 0 )
							GlowWhiteOver000:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver000Frame4 )
						end
					end
					
					if event.interrupted then
						GlowWhiteOver000Frame3( GlowWhiteOver000, event )
						return 
					else
						GlowWhiteOver000:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						GlowWhiteOver000:setAlpha( 0.25 )
						GlowWhiteOver000:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver000Frame3 )
					end
				end
				
				GlowWhiteOver000:completeAnimation()
				self.GlowWhiteOver000:setAlpha( 0 )
				GlowWhiteOver000Frame2( GlowWhiteOver000, {} )
				local gunglowFrame2 = function ( gunglow, event )
					local gunglowFrame3 = function ( gunglow, event )
						local gunglowFrame4 = function ( gunglow, event )
							local gunglowFrame5 = function ( gunglow, event )
								local gunglowFrame6 = function ( gunglow, event )
									local gunglowFrame7 = function ( gunglow, event )
										local gunglowFrame8 = function ( gunglow, event )
											local gunglowFrame9 = function ( gunglow, event )
												local gunglowFrame10 = function ( gunglow, event )
													if not event.interrupted then
														gunglow:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
													end
													gunglow:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( gunglow, event )
													else
														gunglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													gunglowFrame10( gunglow, event )
													return 
												else
													gunglow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
													gunglow:setAlpha( 0.26 )
													gunglow:registerEventHandler( "transition_complete_keyframe", gunglowFrame10 )
												end
											end
											
											if event.interrupted then
												gunglowFrame9( gunglow, event )
												return 
											else
												gunglow:beginAnimation( "keyframe", 619, false, false, CoD.TweenType.Linear )
												gunglow:setAlpha( 0 )
												gunglow:registerEventHandler( "transition_complete_keyframe", gunglowFrame9 )
											end
										end
										
										if event.interrupted then
											gunglowFrame8( gunglow, event )
											return 
										else
											gunglow:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
											gunglow:setAlpha( 0.32 )
											gunglow:registerEventHandler( "transition_complete_keyframe", gunglowFrame8 )
										end
									end
									
									if event.interrupted then
										gunglowFrame7( gunglow, event )
										return 
									else
										gunglow:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
										gunglow:setAlpha( 0 )
										gunglow:registerEventHandler( "transition_complete_keyframe", gunglowFrame7 )
									end
								end
								
								if event.interrupted then
									gunglowFrame6( gunglow, event )
									return 
								else
									gunglow:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
									gunglow:setAlpha( 0.14 )
									gunglow:registerEventHandler( "transition_complete_keyframe", gunglowFrame6 )
								end
							end
							
							if event.interrupted then
								gunglowFrame5( gunglow, event )
								return 
							else
								gunglow:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
								gunglow:registerEventHandler( "transition_complete_keyframe", gunglowFrame5 )
							end
						end
						
						if event.interrupted then
							gunglowFrame4( gunglow, event )
							return 
						else
							gunglow:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							gunglow:setAlpha( 0 )
							gunglow:registerEventHandler( "transition_complete_keyframe", gunglowFrame4 )
						end
					end
					
					if event.interrupted then
						gunglowFrame3( gunglow, event )
						return 
					else
						gunglow:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						gunglow:setAlpha( 0.35 )
						gunglow:registerEventHandler( "transition_complete_keyframe", gunglowFrame3 )
					end
				end
				
				gunglow:completeAnimation()
				self.gunglow:setAlpha( 0 )
				gunglowFrame2( gunglow, {} )
				local gunBlurFrame2 = function ( gunBlur, event )
					local gunBlurFrame3 = function ( gunBlur, event )
						local gunBlurFrame4 = function ( gunBlur, event )
							local gunBlurFrame5 = function ( gunBlur, event )
								local gunBlurFrame6 = function ( gunBlur, event )
									local gunBlurFrame7 = function ( gunBlur, event )
										local gunBlurFrame8 = function ( gunBlur, event )
											if not event.interrupted then
												gunBlur:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
											end
											gunBlur:setAlpha( 0 )
											gunBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
											gunBlur:setShaderVector( 0, 0, 1, 0, 0 )
											gunBlur:setShaderVector( 1, 1.62, -0.2, 0, 0 )
											gunBlur:setShaderVector( 2, 0, 1, 0, 0 )
											gunBlur:setShaderVector( 3, 0, 0, 0, 0 )
											if event.interrupted then
												self.clipFinished( gunBlur, event )
											else
												gunBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											gunBlurFrame8( gunBlur, event )
											return 
										else
											gunBlur:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											gunBlur:registerEventHandler( "transition_complete_keyframe", gunBlurFrame8 )
										end
									end
									
									if event.interrupted then
										gunBlurFrame7( gunBlur, event )
										return 
									else
										gunBlur:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
										gunBlur:setShaderVector( 1, 1.62, -0.2, 0, 0 )
										gunBlur:registerEventHandler( "transition_complete_keyframe", gunBlurFrame7 )
									end
								end
								
								if event.interrupted then
									gunBlurFrame6( gunBlur, event )
									return 
								else
									gunBlur:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
									gunBlur:setShaderVector( 1, 0.78, 0.59, 0, 0 )
									gunBlur:registerEventHandler( "transition_complete_keyframe", gunBlurFrame6 )
								end
							end
							
							if event.interrupted then
								gunBlurFrame5( gunBlur, event )
								return 
							else
								gunBlur:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								gunBlur:setShaderVector( 1, 1.17, 1.53, 0, 0 )
								gunBlur:registerEventHandler( "transition_complete_keyframe", gunBlurFrame5 )
							end
						end
						
						if event.interrupted then
							gunBlurFrame4( gunBlur, event )
							return 
						else
							gunBlur:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							gunBlur:setAlpha( 1 )
							gunBlur:setShaderVector( 1, 1.15, 1.53, 0, 0 )
							gunBlur:registerEventHandler( "transition_complete_keyframe", gunBlurFrame4 )
						end
					end
					
					if event.interrupted then
						gunBlurFrame3( gunBlur, event )
						return 
					else
						gunBlur:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
						gunBlur:setShaderVector( 1, 1.06, 1.53, 0, 0 )
						gunBlur:registerEventHandler( "transition_complete_keyframe", gunBlurFrame3 )
					end
				end
				
				gunBlur:completeAnimation()
				self.gunBlur:setAlpha( 0 )
				self.gunBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.gunBlur:setShaderVector( 0, 0, 1, 0, 0 )
				self.gunBlur:setShaderVector( 1, 0.06, 1.53, 0, 0 )
				self.gunBlur:setShaderVector( 2, 0, 1, 0, 0 )
				self.gunBlur:setShaderVector( 3, 0, 0, 0, 0 )
				gunBlurFrame2( gunBlur, {} )
				local stars1Frame2 = function ( stars1, event )
					local stars1Frame3 = function ( stars1, event )
						local stars1Frame4 = function ( stars1, event )
							local stars1Frame5 = function ( stars1, event )
								local stars1Frame6 = function ( stars1, event )
									local stars1Frame7 = function ( stars1, event )
										local stars1Frame8 = function ( stars1, event )
											if not event.interrupted then
												stars1:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
											end
											stars1:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( stars1, event )
											else
												stars1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											stars1Frame8( stars1, event )
											return 
										else
											stars1:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
											stars1:setAlpha( 1 )
											stars1:registerEventHandler( "transition_complete_keyframe", stars1Frame8 )
										end
									end
									
									if event.interrupted then
										stars1Frame7( stars1, event )
										return 
									else
										stars1:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
										stars1:registerEventHandler( "transition_complete_keyframe", stars1Frame7 )
									end
								end
								
								if event.interrupted then
									stars1Frame6( stars1, event )
									return 
								else
									stars1:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
									stars1:setAlpha( 0 )
									stars1:registerEventHandler( "transition_complete_keyframe", stars1Frame6 )
								end
							end
							
							if event.interrupted then
								stars1Frame5( stars1, event )
								return 
							else
								stars1:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								stars1:setAlpha( 0.4 )
								stars1:registerEventHandler( "transition_complete_keyframe", stars1Frame5 )
							end
						end
						
						if event.interrupted then
							stars1Frame4( stars1, event )
							return 
						else
							stars1:beginAnimation( "keyframe", 840, false, false, CoD.TweenType.Linear )
							stars1:setAlpha( 0.1 )
							stars1:registerEventHandler( "transition_complete_keyframe", stars1Frame4 )
						end
					end
					
					if event.interrupted then
						stars1Frame3( stars1, event )
						return 
					else
						stars1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						stars1:setAlpha( 1 )
						stars1:registerEventHandler( "transition_complete_keyframe", stars1Frame3 )
					end
				end
				
				stars1:completeAnimation()
				self.stars1:setAlpha( 0 )
				stars1Frame2( stars1, {} )
				local stars10Frame2 = function ( stars10, event )
					local stars10Frame3 = function ( stars10, event )
						local stars10Frame4 = function ( stars10, event )
							local stars10Frame5 = function ( stars10, event )
								local stars10Frame6 = function ( stars10, event )
									local stars10Frame7 = function ( stars10, event )
										local stars10Frame8 = function ( stars10, event )
											if not event.interrupted then
												stars10:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
											end
											stars10:setAlpha( 0 )
											stars10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
											if event.interrupted then
												self.clipFinished( stars10, event )
											else
												stars10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											stars10Frame8( stars10, event )
											return 
										else
											stars10:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
											stars10:setAlpha( 1 )
											stars10:registerEventHandler( "transition_complete_keyframe", stars10Frame8 )
										end
									end
									
									if event.interrupted then
										stars10Frame7( stars10, event )
										return 
									else
										stars10:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
										stars10:registerEventHandler( "transition_complete_keyframe", stars10Frame7 )
									end
								end
								
								if event.interrupted then
									stars10Frame6( stars10, event )
									return 
								else
									stars10:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
									stars10:setAlpha( 0 )
									stars10:registerEventHandler( "transition_complete_keyframe", stars10Frame6 )
								end
							end
							
							if event.interrupted then
								stars10Frame5( stars10, event )
								return 
							else
								stars10:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								stars10:setAlpha( 1 )
								stars10:registerEventHandler( "transition_complete_keyframe", stars10Frame5 )
							end
						end
						
						if event.interrupted then
							stars10Frame4( stars10, event )
							return 
						else
							stars10:beginAnimation( "keyframe", 840, false, false, CoD.TweenType.Linear )
							stars10:setAlpha( 0.1 )
							stars10:registerEventHandler( "transition_complete_keyframe", stars10Frame4 )
						end
					end
					
					if event.interrupted then
						stars10Frame3( stars10, event )
						return 
					else
						stars10:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						stars10:setAlpha( 1 )
						stars10:registerEventHandler( "transition_complete_keyframe", stars10Frame3 )
					end
				end
				
				stars10:completeAnimation()
				self.stars10:setAlpha( 0 )
				self.stars10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				stars10Frame2( stars10, {} )
				local stars2Frame2 = function ( stars2, event )
					local stars2Frame3 = function ( stars2, event )
						local stars2Frame4 = function ( stars2, event )
							local stars2Frame5 = function ( stars2, event )
								local stars2Frame6 = function ( stars2, event )
									if not event.interrupted then
										stars2:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
									end
									stars2:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( stars2, event )
									else
										stars2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									stars2Frame6( stars2, event )
									return 
								else
									stars2:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
									stars2:setAlpha( 1 )
									stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame6 )
								end
							end
							
							if event.interrupted then
								stars2Frame5( stars2, event )
								return 
							else
								stars2:beginAnimation( "keyframe", 700, false, false, CoD.TweenType.Linear )
								stars2:setAlpha( 0 )
								stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame5 )
							end
						end
						
						if event.interrupted then
							stars2Frame4( stars2, event )
							return 
						else
							stars2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							stars2:setAlpha( 1 )
							stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame4 )
						end
					end
					
					if event.interrupted then
						stars2Frame3( stars2, event )
						return 
					else
						stars2:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame3 )
					end
				end
				
				stars2:completeAnimation()
				self.stars2:setAlpha( 0 )
				stars2Frame2( stars2, {} )
				local stars20Frame2 = function ( stars20, event )
					local stars20Frame3 = function ( stars20, event )
						local stars20Frame4 = function ( stars20, event )
							local stars20Frame5 = function ( stars20, event )
								local stars20Frame6 = function ( stars20, event )
									if not event.interrupted then
										stars20:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
									end
									stars20:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( stars20, event )
									else
										stars20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									stars20Frame6( stars20, event )
									return 
								else
									stars20:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
									stars20:setAlpha( 1 )
									stars20:registerEventHandler( "transition_complete_keyframe", stars20Frame6 )
								end
							end
							
							if event.interrupted then
								stars20Frame5( stars20, event )
								return 
							else
								stars20:beginAnimation( "keyframe", 700, false, false, CoD.TweenType.Linear )
								stars20:setAlpha( 0 )
								stars20:registerEventHandler( "transition_complete_keyframe", stars20Frame5 )
							end
						end
						
						if event.interrupted then
							stars20Frame4( stars20, event )
							return 
						else
							stars20:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							stars20:setAlpha( 1 )
							stars20:registerEventHandler( "transition_complete_keyframe", stars20Frame4 )
						end
					end
					
					if event.interrupted then
						stars20Frame3( stars20, event )
						return 
					else
						stars20:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						stars20:registerEventHandler( "transition_complete_keyframe", stars20Frame3 )
					end
				end
				
				stars20:completeAnimation()
				self.stars20:setAlpha( 0 )
				stars20Frame2( stars20, {} )
				local GlowWhiteOverFrame2 = function ( GlowWhiteOver, event )
					local GlowWhiteOverFrame3 = function ( GlowWhiteOver, event )
						local GlowWhiteOverFrame4 = function ( GlowWhiteOver, event )
							local GlowWhiteOverFrame5 = function ( GlowWhiteOver, event )
								if not event.interrupted then
									GlowWhiteOver:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
								end
								GlowWhiteOver:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowWhiteOver, event )
								else
									GlowWhiteOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowWhiteOverFrame5( GlowWhiteOver, event )
								return 
							else
								GlowWhiteOver:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
								GlowWhiteOver:setAlpha( 0.1 )
								GlowWhiteOver:registerEventHandler( "transition_complete_keyframe", GlowWhiteOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowWhiteOverFrame4( GlowWhiteOver, event )
							return 
						else
							GlowWhiteOver:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
							GlowWhiteOver:setAlpha( 0 )
							GlowWhiteOver:registerEventHandler( "transition_complete_keyframe", GlowWhiteOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowWhiteOverFrame3( GlowWhiteOver, event )
						return 
					else
						GlowWhiteOver:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						GlowWhiteOver:setAlpha( 0.05 )
						GlowWhiteOver:registerEventHandler( "transition_complete_keyframe", GlowWhiteOverFrame3 )
					end
				end
				
				GlowWhiteOver:completeAnimation()
				self.GlowWhiteOver:setAlpha( 0 )
				GlowWhiteOverFrame2( GlowWhiteOver, {} )
				local GlowWhiteOver1Frame2 = function ( GlowWhiteOver1, event )
					local GlowWhiteOver1Frame3 = function ( GlowWhiteOver1, event )
						local GlowWhiteOver1Frame4 = function ( GlowWhiteOver1, event )
							local GlowWhiteOver1Frame5 = function ( GlowWhiteOver1, event )
								if not event.interrupted then
									GlowWhiteOver1:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
								end
								GlowWhiteOver1:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowWhiteOver1, event )
								else
									GlowWhiteOver1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowWhiteOver1Frame5( GlowWhiteOver1, event )
								return 
							else
								GlowWhiteOver1:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
								GlowWhiteOver1:setAlpha( 0.1 )
								GlowWhiteOver1:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver1Frame5 )
							end
						end
						
						if event.interrupted then
							GlowWhiteOver1Frame4( GlowWhiteOver1, event )
							return 
						else
							GlowWhiteOver1:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
							GlowWhiteOver1:setAlpha( 0 )
							GlowWhiteOver1:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver1Frame4 )
						end
					end
					
					if event.interrupted then
						GlowWhiteOver1Frame3( GlowWhiteOver1, event )
						return 
					else
						GlowWhiteOver1:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						GlowWhiteOver1:setAlpha( 0.1 )
						GlowWhiteOver1:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver1Frame3 )
					end
				end
				
				GlowWhiteOver1:completeAnimation()
				self.GlowWhiteOver1:setAlpha( 0 )
				GlowWhiteOver1Frame2( GlowWhiteOver1, {} )
				local GlowWhiteOver10Frame2 = function ( GlowWhiteOver10, event )
					local GlowWhiteOver10Frame3 = function ( GlowWhiteOver10, event )
						local GlowWhiteOver10Frame4 = function ( GlowWhiteOver10, event )
							local GlowWhiteOver10Frame5 = function ( GlowWhiteOver10, event )
								if not event.interrupted then
									GlowWhiteOver10:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
								end
								GlowWhiteOver10:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowWhiteOver10, event )
								else
									GlowWhiteOver10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowWhiteOver10Frame5( GlowWhiteOver10, event )
								return 
							else
								GlowWhiteOver10:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
								GlowWhiteOver10:setAlpha( 0.1 )
								GlowWhiteOver10:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver10Frame5 )
							end
						end
						
						if event.interrupted then
							GlowWhiteOver10Frame4( GlowWhiteOver10, event )
							return 
						else
							GlowWhiteOver10:beginAnimation( "keyframe", 809, false, false, CoD.TweenType.Linear )
							GlowWhiteOver10:setAlpha( 0 )
							GlowWhiteOver10:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver10Frame4 )
						end
					end
					
					if event.interrupted then
						GlowWhiteOver10Frame3( GlowWhiteOver10, event )
						return 
					else
						GlowWhiteOver10:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						GlowWhiteOver10:setAlpha( 0.1 )
						GlowWhiteOver10:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver10Frame3 )
					end
				end
				
				GlowWhiteOver10:completeAnimation()
				self.GlowWhiteOver10:setAlpha( 0 )
				GlowWhiteOver10Frame2( GlowWhiteOver10, {} )
				local GlowWhiteOver2Frame2 = function ( GlowWhiteOver2, event )
					local GlowWhiteOver2Frame3 = function ( GlowWhiteOver2, event )
						local GlowWhiteOver2Frame4 = function ( GlowWhiteOver2, event )
							local GlowWhiteOver2Frame5 = function ( GlowWhiteOver2, event )
								if not event.interrupted then
									GlowWhiteOver2:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
								end
								GlowWhiteOver2:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowWhiteOver2, event )
								else
									GlowWhiteOver2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowWhiteOver2Frame5( GlowWhiteOver2, event )
								return 
							else
								GlowWhiteOver2:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
								GlowWhiteOver2:setAlpha( 0.1 )
								GlowWhiteOver2:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver2Frame5 )
							end
						end
						
						if event.interrupted then
							GlowWhiteOver2Frame4( GlowWhiteOver2, event )
							return 
						else
							GlowWhiteOver2:beginAnimation( "keyframe", 809, false, false, CoD.TweenType.Linear )
							GlowWhiteOver2:setAlpha( 0 )
							GlowWhiteOver2:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver2Frame4 )
						end
					end
					
					if event.interrupted then
						GlowWhiteOver2Frame3( GlowWhiteOver2, event )
						return 
					else
						GlowWhiteOver2:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						GlowWhiteOver2:setAlpha( 0.1 )
						GlowWhiteOver2:registerEventHandler( "transition_complete_keyframe", GlowWhiteOver2Frame3 )
					end
				end
				
				GlowWhiteOver2:completeAnimation()
				self.GlowWhiteOver2:setAlpha( 0 )
				GlowWhiteOver2Frame2( GlowWhiteOver2, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardlootblingbg:close()
		element.CallingCardsGoldFrame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
