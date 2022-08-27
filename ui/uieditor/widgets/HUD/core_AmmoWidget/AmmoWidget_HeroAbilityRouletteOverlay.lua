-- 44e4fcc7a8da25cf2e0f56c482f70c8c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.onOffImage" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityGlow" )
require( "ui.uieditor.widgets.AmmoWidget_HeroAbilityRouletteOverlayWidget" )

local PostLoadFunc = function ( self, controller, menu )
	self:registerEventHandler( "clip_over", function ( element, event )
		LUI.UIElement.clipOver( element, event )
		local f2_local0 = Engine.GetModel( DataSources.HeroWeapon.getModel( controller ), "rouletteStatus" )
		local f2_local1 = Engine.GetModelValue( f2_local0 )
		if f2_local1 and f2_local1 == 1 then
			Engine.SetModelValue( f2_local0, 3 )
		end
	end )
end

CoD.AmmoWidget_HeroAbilityRouletteOverlay = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_HeroAbilityRouletteOverlay.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_HeroAbilityRouletteOverlay )
	self.id = "AmmoWidget_HeroAbilityRouletteOverlay"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local EdgeGlow = LUI.UIImage.new()
	EdgeGlow:setLeftRight( false, false, -43, 45 )
	EdgeGlow:setTopBottom( false, false, -44, 44 )
	EdgeGlow:setRGB( 1, 0.79, 0.15 )
	EdgeGlow:setAlpha( 0 )
	EdgeGlow:setZoom( -5 )
	EdgeGlow:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_heroringedgeglow" ) )
	EdgeGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( EdgeGlow )
	self.EdgeGlow = EdgeGlow
	
	local ImgIcon = CoD.onOffImage.new( menu, controller )
	ImgIcon:setLeftRight( true, true, 2, -2 )
	ImgIcon:setTopBottom( true, true, 2, -2 )
	ImgIcon:setAlpha( 0 )
	ImgIcon:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
	ImgIcon:setShaderVector( 0, 0.05, 0.5, 0, 0 )
	ImgIcon:setShaderVector( 1, 0, 0, 0, 0 )
	ImgIcon:setShaderVector( 2, 0, 0, 0, 0 )
	ImgIcon:setShaderVector( 3, 0, 0, 0, 0 )
	ImgIcon:setShaderVector( 4, 0, 0, 0, 0 )
	ImgIcon.image:setImage( RegisterImage( GetRandomHeroAbilityOrWeaponIcon( "uie_headicon_dead" ) ) )
	ImgIcon:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ImgIcon )
	self.ImgIcon = ImgIcon
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( false, false, -22.93, 22.93 )
	backing:setTopBottom( false, false, -28.17, 28.17 )
	backing:setAlpha( 0 )
	backing:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityfillcircle" ) )
	self:addElement( backing )
	self.backing = backing
	
	local Texture1 = LUI.UIImage.new()
	Texture1:setLeftRight( false, false, -60, 60 )
	Texture1:setTopBottom( false, false, -59.5, 60.5 )
	Texture1:setRGB( 1, 0.79, 0.15 )
	Texture1:setAlpha( 0.5 )
	Texture1:setXRot( 15 )
	Texture1:setYRot( -40 )
	Texture1:setZoom( -5 )
	Texture1:setImage( RegisterImage( "uie_t7_hud_mp_blackjack_gambler_texture1" ) )
	Texture1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Texture1 )
	self.Texture1 = Texture1
	
	local Texture2 = LUI.UIImage.new()
	Texture2:setLeftRight( false, false, -60, 60 )
	Texture2:setTopBottom( false, false, -59.5, 60.5 )
	Texture2:setRGB( 1, 0.79, 0.15 )
	Texture2:setAlpha( 0 )
	Texture2:setXRot( 15 )
	Texture2:setYRot( -40 )
	Texture2:setZoom( -5 )
	Texture2:setImage( RegisterImage( "uie_t7_hud_mp_blackjack_gambler_texture2" ) )
	Texture2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Texture2 )
	self.Texture2 = Texture2
	
	local Card1 = LUI.UIImage.new()
	Card1:setLeftRight( false, false, -34.5, 34.5 )
	Card1:setTopBottom( false, false, -34.5, 34.5 )
	Card1:setRGB( 1, 0.79, 0.15 )
	Card1:setXRot( 15 )
	Card1:setYRot( -40 )
	Card1:setImage( RegisterImage( "uie_t7_hud_mp_blackjack_card_01_full" ) )
	Card1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Card1 )
	self.Card1 = Card1
	
	local CardBack = LUI.UIImage.new()
	CardBack:setLeftRight( false, false, -34.5, 34.5 )
	CardBack:setTopBottom( false, false, -34.5, 34.5 )
	CardBack:setRGB( 1, 0.79, 0.15 )
	CardBack:setXRot( 15 )
	CardBack:setYRot( -40 )
	CardBack:setImage( RegisterImage( "uie_t7_hud_mp_blackjack_card_back" ) )
	self:addElement( CardBack )
	self.CardBack = CardBack
	
	local CardFront = LUI.UIImage.new()
	CardFront:setLeftRight( false, false, -34.5, 34.5 )
	CardFront:setTopBottom( false, false, -34.5, 34.5 )
	CardFront:setRGB( 1, 0.79, 0.15 )
	CardFront:setXRot( 15 )
	CardFront:setYRot( -40 )
	CardFront:subscribeToGlobalModel( controller, "HeroWeapon", "cardImage", function ( model )
		local cardImage = Engine.GetModelValue( model )
		if cardImage then
			CardFront:setImage( RegisterImage( cardImage ) )
		end
	end )
	self:addElement( CardFront )
	self.CardFront = CardFront
	
	local Card2b = LUI.UIImage.new()
	Card2b:setLeftRight( false, false, -9, 60 )
	Card2b:setTopBottom( false, false, -34.5, 34.5 )
	Card2b:setRGB( 1, 0.79, 0.15 )
	Card2b:setAlpha( 0 )
	Card2b:setXRot( 15 )
	Card2b:setYRot( -40 )
	Card2b:setScale( 2.4 )
	Card2b:setImage( RegisterImage( "uie_t7_hud_mp_blackjack_card_01_blur" ) )
	Card2b:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Card2b )
	self.Card2b = Card2b
	
	local HeroBackgroundGlowImage = LUI.UIImage.new()
	HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
	HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
	HeroBackgroundGlowImage:setRGB( 1, 0.79, 0.15 )
	HeroBackgroundGlowImage:setAlpha( 0.68 )
	HeroBackgroundGlowImage:setImage( RegisterImage( "uie_img_t7_hud_cm_herobackingglow" ) )
	HeroBackgroundGlowImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HeroBackgroundGlowImage )
	self.HeroBackgroundGlowImage = HeroBackgroundGlowImage
	
	local HeroBackgroundGlowImage0 = LUI.UIImage.new()
	HeroBackgroundGlowImage0:setLeftRight( false, false, -60, 60 )
	HeroBackgroundGlowImage0:setTopBottom( false, false, -53.5, 54.5 )
	HeroBackgroundGlowImage0:setRGB( 1, 0.79, 0.15 )
	HeroBackgroundGlowImage0:setAlpha( 0 )
	HeroBackgroundGlowImage0:setImage( RegisterImage( "uie_img_t7_hud_cm_herobackingglow" ) )
	HeroBackgroundGlowImage0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HeroBackgroundGlowImage0 )
	self.HeroBackgroundGlowImage0 = HeroBackgroundGlowImage0
	
	local Glow = CoD.AmmoWidget_AbilityGlow.new( menu, controller )
	Glow:setLeftRight( true, true, 4, -4 )
	Glow:setTopBottom( true, true, 4, -4 )
	Glow:setRGB( 1, 0.79, 0.15 )
	Glow:setAlpha( 0 )
	Glow:setScale( 0.4 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local AmmoWidgetHeroAbilityRouletteOverlayWidget0 = CoD.AmmoWidget_HeroAbilityRouletteOverlayWidget.new( menu, controller )
	AmmoWidgetHeroAbilityRouletteOverlayWidget0:setLeftRight( false, false, -43, 28 )
	AmmoWidgetHeroAbilityRouletteOverlayWidget0:setTopBottom( false, false, 28.17, 44.17 )
	AmmoWidgetHeroAbilityRouletteOverlayWidget0:setXRot( 15 )
	AmmoWidgetHeroAbilityRouletteOverlayWidget0:setYRot( -40 )
	AmmoWidgetHeroAbilityRouletteOverlayWidget0.FEButtonPanel0:setAlpha( 0.8 )
	AmmoWidgetHeroAbilityRouletteOverlayWidget0.rerollInstruction:setRGB( 1, 0.96, 0.45 )
	AmmoWidgetHeroAbilityRouletteOverlayWidget0.rerollInstruction:setText( LocalizeToUpperString( "MPUI_REDRAW" ) )
	AmmoWidgetHeroAbilityRouletteOverlayWidget0.Glow:setAlpha( 0.44 )
	self:addElement( AmmoWidgetHeroAbilityRouletteOverlayWidget0 )
	self.AmmoWidgetHeroAbilityRouletteOverlayWidget0 = AmmoWidgetHeroAbilityRouletteOverlayWidget0
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, -40.41, 162.41 )
	GlowOrangeOver:setTopBottom( true, false, -35.68, 156.68 )
	GlowOrangeOver:setRGB( 1, 0.54, 0 )
	GlowOrangeOver:setAlpha( 0.3 )
	GlowOrangeOver:setZRot( 90 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setAlpha( 0 )
				self.clipFinished( EdgeGlow, {} )
				ImgIcon:completeAnimation()
				self.ImgIcon:setAlpha( 0 )
				self.clipFinished( ImgIcon, {} )
				backing:completeAnimation()
				self.backing:setAlpha( 0 )
				self.clipFinished( backing, {} )
				Texture1:completeAnimation()
				self.Texture1:setAlpha( 0 )
				self.clipFinished( Texture1, {} )
				Texture2:completeAnimation()
				self.Texture2:setAlpha( 0 )
				self.clipFinished( Texture2, {} )
				Card1:completeAnimation()
				self.Card1:setRGB( 0.62, 0.96, 1 )
				self.Card1:setAlpha( 0 )
				self.clipFinished( Card1, {} )
				CardBack:completeAnimation()
				self.CardBack:setAlpha( 0 )
				self.clipFinished( CardBack, {} )
				CardFront:completeAnimation()
				self.CardFront:setAlpha( 0 )
				self.clipFinished( CardFront, {} )
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage, {} )
				HeroBackgroundGlowImage0:completeAnimation()
				self.HeroBackgroundGlowImage0:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage0, {} )
				AmmoWidgetHeroAbilityRouletteOverlayWidget0:completeAnimation()
				self.AmmoWidgetHeroAbilityRouletteOverlayWidget0:setAlpha( 0 )
				self.clipFinished( AmmoWidgetHeroAbilityRouletteOverlayWidget0, {} )
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )
			end,
			NewClipName = function ()
				self:setupElementClipCounter( 14 )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setLeftRight( false, false, -43, 45 )
				self.EdgeGlow:setTopBottom( false, false, -44, 44 )
				self.clipFinished( EdgeGlow, {} )
				ImgIcon:completeAnimation()
				self.ImgIcon:setLeftRight( true, true, 2, -2 )
				self.ImgIcon:setTopBottom( true, true, 2, -2 )
				self.clipFinished( ImgIcon, {} )
				backing:completeAnimation()
				self.backing:setLeftRight( false, false, -22.93, 22.93 )
				self.backing:setTopBottom( false, false, -28.17, 28.17 )
				self.clipFinished( backing, {} )
				local Texture1Frame2 = function ( Texture1, event )
					if not event.interrupted then
						Texture1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Texture1:setLeftRight( false, false, -60, 60 )
					Texture1:setTopBottom( false, false, -59.5, 60.5 )
					Texture1:setAlpha( 0 )
					Texture1:setScale( 1.5 )
					if event.interrupted then
						self.clipFinished( Texture1, event )
					else
						Texture1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Texture1:completeAnimation()
				self.Texture1:setLeftRight( false, false, -60, 60 )
				self.Texture1:setTopBottom( false, false, -59.5, 60.5 )
				self.Texture1:setAlpha( 0 )
				self.Texture1:setScale( 1.5 )
				Texture1Frame2( Texture1, {} )
				local Texture2Frame2 = function ( Texture2, event )
					local Texture2Frame3 = function ( Texture2, event )
						local Texture2Frame4 = function ( Texture2, event )
							if not event.interrupted then
								Texture2:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
							end
							Texture2:setLeftRight( false, false, -60, 60 )
							Texture2:setTopBottom( false, false, -59.5, 60.5 )
							Texture2:setAlpha( 0 )
							Texture2:setZRot( 0 )
							Texture2:setScale( 1 )
							if event.interrupted then
								self.clipFinished( Texture2, event )
							else
								Texture2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Texture2Frame4( Texture2, event )
							return 
						else
							Texture2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Texture2:setAlpha( 0.25 )
							Texture2:registerEventHandler( "transition_complete_keyframe", Texture2Frame4 )
						end
					end
					
					if event.interrupted then
						Texture2Frame3( Texture2, event )
						return 
					else
						Texture2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Texture2:registerEventHandler( "transition_complete_keyframe", Texture2Frame3 )
					end
				end
				
				Texture2:completeAnimation()
				self.Texture2:setLeftRight( false, false, -60, 60 )
				self.Texture2:setTopBottom( false, false, -59.5, 60.5 )
				self.Texture2:setAlpha( 0 )
				self.Texture2:setZRot( 0 )
				self.Texture2:setScale( 1 )
				Texture2Frame2( Texture2, {} )
				local Card1Frame2 = function ( Card1, event )
					local Card1Frame3 = function ( Card1, event )
						local Card1Frame4 = function ( Card1, event )
							local Card1Frame5 = function ( Card1, event )
								if not event.interrupted then
									Card1:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								Card1:setLeftRight( false, false, -34.5, 34.5 )
								Card1:setTopBottom( false, false, -34.5, 34.5 )
								Card1:setAlpha( 0 )
								Card1:setZoom( 0 )
								if event.interrupted then
									self.clipFinished( Card1, event )
								else
									Card1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Card1Frame5( Card1, event )
								return 
							else
								Card1:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
								Card1:registerEventHandler( "transition_complete_keyframe", Card1Frame5 )
							end
						end
						
						if event.interrupted then
							Card1Frame4( Card1, event )
							return 
						else
							Card1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							Card1:setAlpha( 1 )
							Card1:registerEventHandler( "transition_complete_keyframe", Card1Frame4 )
						end
					end
					
					if event.interrupted then
						Card1Frame3( Card1, event )
						return 
					else
						Card1:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						Card1:setAlpha( 0.1 )
						Card1:registerEventHandler( "transition_complete_keyframe", Card1Frame3 )
					end
				end
				
				Card1:completeAnimation()
				self.Card1:setLeftRight( false, false, -34.5, 34.5 )
				self.Card1:setTopBottom( false, false, -34.5, 34.5 )
				self.Card1:setAlpha( 1 )
				self.Card1:setZoom( 0 )
				Card1Frame2( Card1, {} )
				local CardBackFrame2 = function ( CardBack, event )
					local CardBackFrame3 = function ( CardBack, event )
						local CardBackFrame4 = function ( CardBack, event )
							local CardBackFrame5 = function ( CardBack, event )
								if not event.interrupted then
									CardBack:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
								end
								CardBack:setLeftRight( false, false, -34.5, 34.5 )
								CardBack:setTopBottom( false, false, -34.5, 34.5 )
								CardBack:setAlpha( 0 )
								CardBack:setXRot( -15 )
								CardBack:setYRot( 140 )
								CardBack:setZoom( 0 )
								CardBack:setScale( 1 )
								if event.interrupted then
									self.clipFinished( CardBack, event )
								else
									CardBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CardBackFrame5( CardBack, event )
								return 
							else
								CardBack:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								CardBack:setLeftRight( false, false, -34.5, 34.5 )
								CardBack:setAlpha( 0.89 )
								CardBack:setScale( 1 )
								CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame5 )
							end
						end
						
						if event.interrupted then
							CardBackFrame4( CardBack, event )
							return 
						else
							CardBack:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
							CardBack:setLeftRight( false, false, -34.8, 34.2 )
							CardBack:setScale( 1.09 )
							CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame4 )
						end
					end
					
					if event.interrupted then
						CardBackFrame3( CardBack, event )
						return 
					else
						CardBack:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						CardBack:setLeftRight( false, false, -36.4, 32.6 )
						CardBack:setAlpha( 1 )
						CardBack:setScale( 1.57 )
						CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame3 )
					end
				end
				
				CardBack:completeAnimation()
				self.CardBack:setLeftRight( false, false, -36.5, 32.5 )
				self.CardBack:setTopBottom( false, false, -34.5, 34.5 )
				self.CardBack:setAlpha( 0 )
				self.CardBack:setXRot( -15 )
				self.CardBack:setYRot( 140 )
				self.CardBack:setZoom( 0 )
				self.CardBack:setScale( 1.6 )
				CardBackFrame2( CardBack, {} )
				local CardFrontFrame2 = function ( CardFront, event )
					local CardFrontFrame3 = function ( CardFront, event )
						local CardFrontFrame4 = function ( CardFront, event )
							local CardFrontFrame5 = function ( CardFront, event )
								if not event.interrupted then
									CardFront:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								CardFront:setLeftRight( false, false, -34.5, 34.5 )
								CardFront:setTopBottom( false, false, -34.5, 34.5 )
								CardFront:setAlpha( 0 )
								CardFront:setXRot( -15 )
								CardFront:setYRot( 140 )
								CardFront:setZoom( 0 )
								CardFront:setScale( 1 )
								if event.interrupted then
									self.clipFinished( CardFront, event )
								else
									CardFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CardFrontFrame5( CardFront, event )
								return 
							else
								CardFront:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								CardFront:registerEventHandler( "transition_complete_keyframe", CardFrontFrame5 )
							end
						end
						
						if event.interrupted then
							CardFrontFrame4( CardFront, event )
							return 
						else
							CardFront:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							CardFront:registerEventHandler( "transition_complete_keyframe", CardFrontFrame4 )
						end
					end
					
					if event.interrupted then
						CardFrontFrame3( CardFront, event )
						return 
					else
						CardFront:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						CardFront:setLeftRight( false, false, -34.5, 34.5 )
						CardFront:setScale( 1 )
						CardFront:registerEventHandler( "transition_complete_keyframe", CardFrontFrame3 )
					end
				end
				
				CardFront:completeAnimation()
				self.CardFront:setLeftRight( false, false, -36.5, 32.5 )
				self.CardFront:setTopBottom( false, false, -34.5, 34.5 )
				self.CardFront:setAlpha( 1 )
				self.CardFront:setXRot( -15 )
				self.CardFront:setYRot( 140 )
				self.CardFront:setZoom( 0 )
				self.CardFront:setScale( 1.6 )
				CardFrontFrame2( CardFront, {} )
				Card2b:completeAnimation()
				self.Card2b:setLeftRight( false, false, -9, 60 )
				self.Card2b:setTopBottom( false, false, -34.5, 34.5 )
				self.clipFinished( Card2b, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					local HeroBackgroundGlowImageFrame3 = function ( HeroBackgroundGlowImage, event )
						local HeroBackgroundGlowImageFrame4 = function ( HeroBackgroundGlowImage, event )
							if not event.interrupted then
								HeroBackgroundGlowImage:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
							end
							HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
							HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
							HeroBackgroundGlowImage:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( HeroBackgroundGlowImage, event )
							else
								HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							HeroBackgroundGlowImageFrame4( HeroBackgroundGlowImage, event )
							return 
						else
							HeroBackgroundGlowImage:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							HeroBackgroundGlowImage:setAlpha( 1 )
							HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame4 )
						end
					end
					
					if event.interrupted then
						HeroBackgroundGlowImageFrame3( HeroBackgroundGlowImage, event )
						return 
					else
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame3 )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local HeroBackgroundGlowImage0Frame2 = function ( HeroBackgroundGlowImage0, event )
					local HeroBackgroundGlowImage0Frame3 = function ( HeroBackgroundGlowImage0, event )
						local HeroBackgroundGlowImage0Frame4 = function ( HeroBackgroundGlowImage0, event )
							if not event.interrupted then
								HeroBackgroundGlowImage0:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
							end
							HeroBackgroundGlowImage0:setLeftRight( false, false, -60, 60 )
							HeroBackgroundGlowImage0:setTopBottom( false, false, -53.5, 54.5 )
							HeroBackgroundGlowImage0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( HeroBackgroundGlowImage0, event )
							else
								HeroBackgroundGlowImage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							HeroBackgroundGlowImage0Frame4( HeroBackgroundGlowImage0, event )
							return 
						else
							HeroBackgroundGlowImage0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							HeroBackgroundGlowImage0:setAlpha( 0.5 )
							HeroBackgroundGlowImage0:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImage0Frame4 )
						end
					end
					
					if event.interrupted then
						HeroBackgroundGlowImage0Frame3( HeroBackgroundGlowImage0, event )
						return 
					else
						HeroBackgroundGlowImage0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						HeroBackgroundGlowImage0:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImage0Frame3 )
					end
				end
				
				HeroBackgroundGlowImage0:completeAnimation()
				self.HeroBackgroundGlowImage0:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage0:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage0:setAlpha( 0 )
				HeroBackgroundGlowImage0Frame2( HeroBackgroundGlowImage0, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							if not event.interrupted then
								Glow:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
							end
							Glow:setLeftRight( true, true, 4, -4 )
							Glow:setTopBottom( true, true, 4, -4 )
							Glow:setAlpha( 0 )
							Glow:setScale( 1.6 )
							if event.interrupted then
								self.clipFinished( Glow, event )
							else
								Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.2 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, true, 4, -4 )
				self.Glow:setTopBottom( true, true, 4, -4 )
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 0.7 )
				GlowFrame2( Glow, {} )
				local f7_local8 = function ( f33_arg0, f33_arg1 )
					if not f33_arg1.interrupted then
						f33_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					f33_arg0:setAlpha( 0 )
					if f33_arg1.interrupted then
						self.clipFinished( f33_arg0, f33_arg1 )
					else
						f33_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetHeroAbilityRouletteOverlayWidget0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				AmmoWidgetHeroAbilityRouletteOverlayWidget0:setAlpha( 0 )
				AmmoWidgetHeroAbilityRouletteOverlayWidget0:registerEventHandler( "transition_complete_keyframe", f7_local8 )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							if not event.interrupted then
								GlowOrangeOver:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
							end
							GlowOrangeOver:setLeftRight( true, false, -40.41, 162.41 )
							GlowOrangeOver:setTopBottom( true, false, -35.68, 156.68 )
							GlowOrangeOver:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( GlowOrangeOver, event )
							else
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0.3 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, -40.41, 162.41 )
				self.GlowOrangeOver:setTopBottom( true, false, -35.68, 156.68 )
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
			end
		},
		Preroll = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					local EdgeGlowFrame3 = function ( EdgeGlow, event )
						local EdgeGlowFrame4 = function ( EdgeGlow, event )
							local EdgeGlowFrame5 = function ( EdgeGlow, event )
								if not event.interrupted then
									EdgeGlow:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
								end
								EdgeGlow:setLeftRight( false, false, -43, 45 )
								EdgeGlow:setTopBottom( false, false, -44, 44 )
								EdgeGlow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( EdgeGlow, event )
								else
									EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								EdgeGlowFrame5( EdgeGlow, event )
								return 
							else
								EdgeGlow:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								EdgeGlow:setAlpha( 0 )
								EdgeGlow:registerEventHandler( "transition_complete_keyframe", EdgeGlowFrame5 )
							end
						end
						
						if event.interrupted then
							EdgeGlowFrame4( EdgeGlow, event )
							return 
						else
							EdgeGlow:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							EdgeGlow:setAlpha( 1 )
							EdgeGlow:registerEventHandler( "transition_complete_keyframe", EdgeGlowFrame4 )
						end
					end
					
					if event.interrupted then
						EdgeGlowFrame3( EdgeGlow, event )
						return 
					else
						EdgeGlow:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", EdgeGlowFrame3 )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setLeftRight( false, false, -43, 45 )
				self.EdgeGlow:setTopBottom( false, false, -44, 44 )
				self.EdgeGlow:setAlpha( 0 )
				EdgeGlowFrame2( EdgeGlow, {} )
				local ImgIconFrame2 = function ( ImgIcon, event )
					if not event.interrupted then
						ImgIcon:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					ImgIcon:setLeftRight( true, true, 2, -2 )
					ImgIcon:setTopBottom( true, true, 2, -2 )
					ImgIcon:setAlpha( 0 )
					ImgIcon:setScale( 1 )
					if event.interrupted then
						self.clipFinished( ImgIcon, event )
					else
						ImgIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgIcon:completeAnimation()
				self.ImgIcon:setLeftRight( true, true, 2, -2 )
				self.ImgIcon:setTopBottom( true, true, 2, -2 )
				self.ImgIcon:setAlpha( 0 )
				self.ImgIcon:setScale( 1 )
				ImgIconFrame2( ImgIcon, {} )
				local backingFrame2 = function ( backing, event )
					if not event.interrupted then
						backing:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					backing:setLeftRight( false, false, -22.93, 22.93 )
					backing:setTopBottom( false, false, -28.17, 28.17 )
					backing:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( backing, event )
					else
						backing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				backing:completeAnimation()
				self.backing:setLeftRight( false, false, -22.93, 22.93 )
				self.backing:setTopBottom( false, false, -28.17, 28.17 )
				self.backing:setAlpha( 0 )
				backingFrame2( backing, {} )
				local Texture1Frame2 = function ( Texture1, event )
					local Texture1Frame3 = function ( Texture1, event )
						local Texture1Frame4 = function ( Texture1, event )
							local Texture1Frame5 = function ( Texture1, event )
								local Texture1Frame6 = function ( Texture1, event )
									if not event.interrupted then
										Texture1:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
									end
									Texture1:setLeftRight( false, false, -60, 60 )
									Texture1:setTopBottom( false, false, -59.5, 60.5 )
									Texture1:setAlpha( 0 )
									Texture1:setZRot( 0 )
									Texture1:setScale( 1 )
									if event.interrupted then
										self.clipFinished( Texture1, event )
									else
										Texture1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Texture1Frame6( Texture1, event )
									return 
								else
									Texture1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Texture1:setScale( 1 )
									Texture1:registerEventHandler( "transition_complete_keyframe", Texture1Frame6 )
								end
							end
							
							if event.interrupted then
								Texture1Frame5( Texture1, event )
								return 
							else
								Texture1:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
								Texture1:setAlpha( 0 )
								Texture1:setScale( 1.5 )
								Texture1:registerEventHandler( "transition_complete_keyframe", Texture1Frame5 )
							end
						end
						
						if event.interrupted then
							Texture1Frame4( Texture1, event )
							return 
						else
							Texture1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							Texture1:setAlpha( 0.75 )
							Texture1:setScale( 1.09 )
							Texture1:registerEventHandler( "transition_complete_keyframe", Texture1Frame4 )
						end
					end
					
					if event.interrupted then
						Texture1Frame3( Texture1, event )
						return 
					else
						Texture1:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						Texture1:registerEventHandler( "transition_complete_keyframe", Texture1Frame3 )
					end
				end
				
				Texture1:completeAnimation()
				self.Texture1:setLeftRight( false, false, -60, 60 )
				self.Texture1:setTopBottom( false, false, -59.5, 60.5 )
				self.Texture1:setAlpha( 0 )
				self.Texture1:setZRot( 0 )
				self.Texture1:setScale( 1 )
				Texture1Frame2( Texture1, {} )
				local Texture2Frame2 = function ( Texture2, event )
					local Texture2Frame3 = function ( Texture2, event )
						local Texture2Frame4 = function ( Texture2, event )
							local Texture2Frame5 = function ( Texture2, event )
								if not event.interrupted then
									Texture2:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
								end
								Texture2:setLeftRight( false, false, -60, 60 )
								Texture2:setTopBottom( false, false, -59.5, 60.5 )
								Texture2:setAlpha( 0 )
								Texture2:setZRot( 90 )
								Texture2:setScale( 1.9 )
								if event.interrupted then
									self.clipFinished( Texture2, event )
								else
									Texture2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Texture2Frame5( Texture2, event )
								return 
							else
								Texture2:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								Texture2:setAlpha( 0 )
								Texture2:setZRot( 90 )
								Texture2:setScale( 1.9 )
								Texture2:registerEventHandler( "transition_complete_keyframe", Texture2Frame5 )
							end
						end
						
						if event.interrupted then
							Texture2Frame4( Texture2, event )
							return 
						else
							Texture2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							Texture2:setAlpha( 0.5 )
							Texture2:registerEventHandler( "transition_complete_keyframe", Texture2Frame4 )
						end
					end
					
					if event.interrupted then
						Texture2Frame3( Texture2, event )
						return 
					else
						Texture2:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						Texture2:registerEventHandler( "transition_complete_keyframe", Texture2Frame3 )
					end
				end
				
				Texture2:completeAnimation()
				self.Texture2:setLeftRight( false, false, -60, 60 )
				self.Texture2:setTopBottom( false, false, -59.5, 60.5 )
				self.Texture2:setAlpha( 0 )
				self.Texture2:setZRot( 0 )
				self.Texture2:setScale( 1 )
				Texture2Frame2( Texture2, {} )
				local Card1Frame2 = function ( Card1, event )
					local Card1Frame3 = function ( Card1, event )
						local Card1Frame4 = function ( Card1, event )
							local Card1Frame5 = function ( Card1, event )
								local Card1Frame6 = function ( Card1, event )
									local Card1Frame7 = function ( Card1, event )
										local Card1Frame8 = function ( Card1, event )
											if not event.interrupted then
												Card1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											end
											Card1:setLeftRight( false, false, -34.5, 34.5 )
											Card1:setTopBottom( false, false, -34.5, 34.5 )
											Card1:setAlpha( 0.5 )
											if event.interrupted then
												self.clipFinished( Card1, event )
											else
												Card1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											Card1Frame8( Card1, event )
											return 
										else
											Card1:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
											Card1:registerEventHandler( "transition_complete_keyframe", Card1Frame8 )
										end
									end
									
									if event.interrupted then
										Card1Frame7( Card1, event )
										return 
									else
										Card1:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
										Card1:setAlpha( 0.5 )
										Card1:registerEventHandler( "transition_complete_keyframe", Card1Frame7 )
									end
								end
								
								if event.interrupted then
									Card1Frame6( Card1, event )
									return 
								else
									Card1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									Card1:setAlpha( 0.19 )
									Card1:registerEventHandler( "transition_complete_keyframe", Card1Frame6 )
								end
							end
							
							if event.interrupted then
								Card1Frame5( Card1, event )
								return 
							else
								Card1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								Card1:setAlpha( 0.5 )
								Card1:registerEventHandler( "transition_complete_keyframe", Card1Frame5 )
							end
						end
						
						if event.interrupted then
							Card1Frame4( Card1, event )
							return 
						else
							Card1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							Card1:setAlpha( 0.19 )
							Card1:registerEventHandler( "transition_complete_keyframe", Card1Frame4 )
						end
					end
					
					if event.interrupted then
						Card1Frame3( Card1, event )
						return 
					else
						Card1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Card1:setAlpha( 0.5 )
						Card1:registerEventHandler( "transition_complete_keyframe", Card1Frame3 )
					end
				end
				
				Card1:completeAnimation()
				self.Card1:setLeftRight( false, false, -34.5, 34.5 )
				self.Card1:setTopBottom( false, false, -34.5, 34.5 )
				self.Card1:setAlpha( 1 )
				Card1Frame2( Card1, {} )
				local CardBackFrame2 = function ( CardBack, event )
					local CardBackFrame3 = function ( CardBack, event )
						local CardBackFrame4 = function ( CardBack, event )
							local CardBackFrame5 = function ( CardBack, event )
								local CardBackFrame6 = function ( CardBack, event )
									local CardBackFrame7 = function ( CardBack, event )
										local CardBackFrame8 = function ( CardBack, event )
											local CardBackFrame9 = function ( CardBack, event )
												local CardBackFrame10 = function ( CardBack, event )
													local CardBackFrame11 = function ( CardBack, event )
														if not event.interrupted then
															CardBack:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
														end
														CardBack:setLeftRight( false, false, -36.5, 32.5 )
														CardBack:setTopBottom( false, false, -34.5, 34.5 )
														CardBack:setAlpha( 0 )
														CardBack:setXRot( -15 )
														CardBack:setYRot( 140 )
														CardBack:setScale( 1.6 )
														if event.interrupted then
															self.clipFinished( CardBack, event )
														else
															CardBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														CardBackFrame11( CardBack, event )
														return 
													else
														CardBack:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
														CardBack:setLeftRight( false, false, -36.5, 32.5 )
														CardBack:setXRot( -15 )
														CardBack:setYRot( 140 )
														CardBack:setScale( 1.6 )
														CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame11 )
													end
												end
												
												if event.interrupted then
													CardBackFrame10( CardBack, event )
													return 
												else
													CardBack:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													CardBack:setLeftRight( false, false, -59.95, 9.05 )
													CardBack:setAlpha( 0 )
													CardBack:setXRot( -13 )
													CardBack:setYRot( 98.79 )
													CardBack:setScale( 1.38 )
													CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame10 )
												end
											end
											
											if event.interrupted then
												CardBackFrame9( CardBack, event )
												return 
											else
												CardBack:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
												CardBack:setLeftRight( false, false, -63.86, 5.14 )
												CardBack:setXRot( -12.66 )
												CardBack:setYRot( 91.92 )
												CardBack:setScale( 1.35 )
												CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame9 )
											end
										end
										
										if event.interrupted then
											CardBackFrame8( CardBack, event )
											return 
										else
											CardBack:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
											CardBack:setLeftRight( false, false, -79.5, -10.5 )
											CardBack:setXRot( -11.33 )
											CardBack:setYRot( 64.44 )
											CardBack:setScale( 1.2 )
											CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame8 )
										end
									end
									
									if event.interrupted then
										CardBackFrame7( CardBack, event )
										return 
									else
										CardBack:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
										CardBack:setAlpha( 1 )
										CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame7 )
									end
								end
								
								if event.interrupted then
									CardBackFrame6( CardBack, event )
									return 
								else
									CardBack:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									CardBack:setAlpha( 0 )
									CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame6 )
								end
							end
							
							if event.interrupted then
								CardBackFrame5( CardBack, event )
								return 
							else
								CardBack:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								CardBack:setAlpha( 1 )
								CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame5 )
							end
						end
						
						if event.interrupted then
							CardBackFrame4( CardBack, event )
							return 
						else
							CardBack:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							CardBack:setAlpha( 0.5 )
							CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame4 )
						end
					end
					
					if event.interrupted then
						CardBackFrame3( CardBack, event )
						return 
					else
						CardBack:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame3 )
					end
				end
				
				CardBack:completeAnimation()
				self.CardBack:setLeftRight( false, false, -34.5, 34.5 )
				self.CardBack:setTopBottom( false, false, -34.5, 34.5 )
				self.CardBack:setAlpha( 1 )
				self.CardBack:setXRot( 15 )
				self.CardBack:setYRot( -40 )
				self.CardBack:setScale( 1 )
				CardBackFrame2( CardBack, {} )
				local CardFrontFrame2 = function ( CardFront, event )
					local CardFrontFrame3 = function ( CardFront, event )
						local CardFrontFrame4 = function ( CardFront, event )
							local CardFrontFrame5 = function ( CardFront, event )
								local CardFrontFrame6 = function ( CardFront, event )
									local CardFrontFrame7 = function ( CardFront, event )
										local CardFrontFrame8 = function ( CardFront, event )
											if not event.interrupted then
												CardFront:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											end
											CardFront:setLeftRight( false, false, -36.5, 32.5 )
											CardFront:setTopBottom( false, false, -34.5, 34.5 )
											CardFront:setAlpha( 1 )
											CardFront:setXRot( -15 )
											CardFront:setYRot( 140 )
											CardFront:setZRot( 0 )
											CardFront:setZoom( 0 )
											CardFront:setScale( 1.6 )
											if event.interrupted then
												self.clipFinished( CardFront, event )
											else
												CardFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											CardFrontFrame8( CardFront, event )
											return 
										else
											CardFront:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											CardFront:setLeftRight( false, false, -36.5, 32.5 )
											CardFront:setXRot( -15 )
											CardFront:setYRot( 140 )
											CardFront:setScale( 1.6 )
											CardFront:registerEventHandler( "transition_complete_keyframe", CardFrontFrame8 )
										end
									end
									
									if event.interrupted then
										CardFrontFrame7( CardFront, event )
										return 
									else
										CardFront:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										CardFront:setLeftRight( false, false, -61.91, 7.09 )
										CardFront:setAlpha( 1 )
										CardFront:setXRot( -12.83 )
										CardFront:setYRot( 95.35 )
										CardFront:setScale( 1.36 )
										CardFront:registerEventHandler( "transition_complete_keyframe", CardFrontFrame7 )
									end
								end
								
								if event.interrupted then
									CardFrontFrame6( CardFront, event )
									return 
								else
									CardFront:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									CardFront:setLeftRight( false, false, -63.86, 5.14 )
									CardFront:setXRot( -12.66 )
									CardFront:setYRot( 91.92 )
									CardFront:setScale( 1.34 )
									CardFront:registerEventHandler( "transition_complete_keyframe", CardFrontFrame6 )
								end
							end
							
							if event.interrupted then
								CardFrontFrame5( CardFront, event )
								return 
							else
								CardFront:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								CardFront:setLeftRight( false, false, -79.5, -10.5 )
								CardFront:setXRot( -11.33 )
								CardFront:setYRot( 64.44 )
								CardFront:setScale( 1.19 )
								CardFront:registerEventHandler( "transition_complete_keyframe", CardFrontFrame5 )
							end
						end
						
						if event.interrupted then
							CardFrontFrame4( CardFront, event )
							return 
						else
							CardFront:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							CardFront:setLeftRight( false, false, -52.5, 16.5 )
							CardFront:setXRot( -13.53 )
							CardFront:setYRot( 109.78 )
							CardFront:setScale( 1.08 )
							CardFront:registerEventHandler( "transition_complete_keyframe", CardFrontFrame4 )
						end
					end
					
					if event.interrupted then
						CardFrontFrame3( CardFront, event )
						return 
					else
						CardFront:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						CardFront:registerEventHandler( "transition_complete_keyframe", CardFrontFrame3 )
					end
				end
				
				CardFront:completeAnimation()
				self.CardFront:setLeftRight( false, false, -34.5, 34.5 )
				self.CardFront:setTopBottom( false, false, -34.5, 34.5 )
				self.CardFront:setAlpha( 0 )
				self.CardFront:setXRot( -15 )
				self.CardFront:setYRot( 140 )
				self.CardFront:setZRot( 0 )
				self.CardFront:setZoom( 0 )
				self.CardFront:setScale( 1 )
				CardFrontFrame2( CardFront, {} )
				local f37_local8 = function ( f77_arg0, f77_arg1 )
					local f77_local0 = function ( f78_arg0, f78_arg1 )
						local f78_local0 = function ( f79_arg0, f79_arg1 )
							if not f79_arg1.interrupted then
								f79_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							end
							f79_arg0:setLeftRight( false, false, -35.32, 33.68 )
							f79_arg0:setTopBottom( false, false, -34.5, 34.5 )
							f79_arg0:setAlpha( 0 )
							f79_arg0:setScale( 1.8 )
							if f79_arg1.interrupted then
								self.clipFinished( f79_arg0, f79_arg1 )
							else
								f79_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f78_arg1.interrupted then
							f78_local0( f78_arg0, f78_arg1 )
							return 
						else
							f78_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f78_arg0:setLeftRight( false, false, -36.32, 32.68 )
							f78_arg0:setAlpha( 0.85 )
							f78_arg0:registerEventHandler( "transition_complete_keyframe", f78_local0 )
						end
					end
					
					if f77_arg1.interrupted then
						f77_local0( f77_arg0, f77_arg1 )
						return 
					else
						f77_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
						f77_arg0:setAlpha( 1 )
						f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
					end
				end
				
				Card2b:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
				Card2b:setLeftRight( false, false, -36.5, 32.5 )
				Card2b:setTopBottom( false, false, -34.5, 34.5 )
				Card2b:setAlpha( 0 )
				Card2b:setScale( 1.6 )
				Card2b:registerEventHandler( "transition_complete_keyframe", f37_local8 )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					local HeroBackgroundGlowImageFrame3 = function ( HeroBackgroundGlowImage, event )
						local HeroBackgroundGlowImageFrame4 = function ( HeroBackgroundGlowImage, event )
							local HeroBackgroundGlowImageFrame5 = function ( HeroBackgroundGlowImage, event )
								if not event.interrupted then
									HeroBackgroundGlowImage:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
								end
								HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
								HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
								HeroBackgroundGlowImage:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( HeroBackgroundGlowImage, event )
								else
									HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								HeroBackgroundGlowImageFrame5( HeroBackgroundGlowImage, event )
								return 
							else
								HeroBackgroundGlowImage:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								HeroBackgroundGlowImage:setAlpha( 0 )
								HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame5 )
							end
						end
						
						if event.interrupted then
							HeroBackgroundGlowImageFrame4( HeroBackgroundGlowImage, event )
							return 
						else
							HeroBackgroundGlowImage:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							HeroBackgroundGlowImage:setAlpha( 1 )
							HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame4 )
						end
					end
					
					if event.interrupted then
						HeroBackgroundGlowImageFrame3( HeroBackgroundGlowImage, event )
						return 
					else
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame3 )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local HeroBackgroundGlowImage0Frame2 = function ( HeroBackgroundGlowImage0, event )
					if not event.interrupted then
						HeroBackgroundGlowImage0:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					HeroBackgroundGlowImage0:setLeftRight( false, false, -60, 60 )
					HeroBackgroundGlowImage0:setTopBottom( false, false, -53.5, 54.5 )
					HeroBackgroundGlowImage0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroBackgroundGlowImage0, event )
					else
						HeroBackgroundGlowImage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroBackgroundGlowImage0:completeAnimation()
				self.HeroBackgroundGlowImage0:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage0:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage0:setAlpha( 0 )
				HeroBackgroundGlowImage0Frame2( HeroBackgroundGlowImage0, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					Glow:setLeftRight( true, true, 4, -4 )
					Glow:setTopBottom( true, true, 4, -4 )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, true, 4, -4 )
				self.Glow:setTopBottom( true, true, 4, -4 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				AmmoWidgetHeroAbilityRouletteOverlayWidget0:completeAnimation()
				self.AmmoWidgetHeroAbilityRouletteOverlayWidget0:setAlpha( 0 )
				self.clipFinished( AmmoWidgetHeroAbilityRouletteOverlayWidget0, {} )
				local f37_local12 = function ( f86_arg0, f86_arg1 )
					local f86_local0 = function ( f87_arg0, f87_arg1 )
						local f87_local0 = function ( f88_arg0, f88_arg1 )
							if not f88_arg1.interrupted then
								f88_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							end
							f88_arg0:setLeftRight( true, false, -40.41, 162.41 )
							f88_arg0:setTopBottom( true, false, -35.68, 156.68 )
							f88_arg0:setAlpha( 0 )
							if f88_arg1.interrupted then
								self.clipFinished( f88_arg0, f88_arg1 )
							else
								f88_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f87_arg1.interrupted then
							f87_local0( f87_arg0, f87_arg1 )
							return 
						else
							f87_arg0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
							f87_arg0:setAlpha( 0 )
							f87_arg0:registerEventHandler( "transition_complete_keyframe", f87_local0 )
						end
					end
					
					if f86_arg1.interrupted then
						f86_local0( f86_arg0, f86_arg1 )
						return 
					else
						f86_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
						f86_arg0:setAlpha( 0.3 )
						f86_arg0:registerEventHandler( "transition_complete_keyframe", f86_local0 )
					end
				end
				
				GlowOrangeOver:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
				GlowOrangeOver:setLeftRight( true, false, -40.41, 162.41 )
				GlowOrangeOver:setTopBottom( true, false, -35.68, 156.68 )
				GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f37_local12 )
			end,
			PrerollState = function ()
				self:setupElementClipCounter( 14 )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setLeftRight( false, false, -43, 45 )
				self.EdgeGlow:setTopBottom( false, false, -44, 44 )
				self.clipFinished( EdgeGlow, {} )
				ImgIcon:completeAnimation()
				self.ImgIcon:setLeftRight( true, true, 2, -2 )
				self.ImgIcon:setTopBottom( true, true, 2, -2 )
				self.clipFinished( ImgIcon, {} )
				backing:completeAnimation()
				self.backing:setLeftRight( false, false, -22.93, 22.93 )
				self.backing:setTopBottom( false, false, -28.17, 28.17 )
				self.clipFinished( backing, {} )
				local Texture1Frame2 = function ( Texture1, event )
					if not event.interrupted then
						Texture1:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					Texture1:setLeftRight( false, false, -60, 60 )
					Texture1:setTopBottom( false, false, -59.5, 60.5 )
					Texture1:setAlpha( 0 )
					Texture1:setScale( 1.5 )
					if event.interrupted then
						self.clipFinished( Texture1, event )
					else
						Texture1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Texture1:completeAnimation()
				self.Texture1:setLeftRight( false, false, -60, 60 )
				self.Texture1:setTopBottom( false, false, -59.5, 60.5 )
				self.Texture1:setAlpha( 0 )
				self.Texture1:setScale( 1.5 )
				Texture1Frame2( Texture1, {} )
				local Texture2Frame2 = function ( Texture2, event )
					local Texture2Frame3 = function ( Texture2, event )
						local Texture2Frame4 = function ( Texture2, event )
							if not event.interrupted then
								Texture2:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
							end
							Texture2:setLeftRight( false, false, -60, 60 )
							Texture2:setTopBottom( false, false, -59.5, 60.5 )
							Texture2:setAlpha( 0 )
							Texture2:setZRot( 0 )
							Texture2:setScale( 1 )
							if event.interrupted then
								self.clipFinished( Texture2, event )
							else
								Texture2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Texture2Frame4( Texture2, event )
							return 
						else
							Texture2:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							Texture2:registerEventHandler( "transition_complete_keyframe", Texture2Frame4 )
						end
					end
					
					if event.interrupted then
						Texture2Frame3( Texture2, event )
						return 
					else
						Texture2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Texture2:registerEventHandler( "transition_complete_keyframe", Texture2Frame3 )
					end
				end
				
				Texture2:completeAnimation()
				self.Texture2:setLeftRight( false, false, -60, 60 )
				self.Texture2:setTopBottom( false, false, -59.5, 60.5 )
				self.Texture2:setAlpha( 0.25 )
				self.Texture2:setZRot( 0 )
				self.Texture2:setScale( 1 )
				Texture2Frame2( Texture2, {} )
				local Card1Frame2 = function ( Card1, event )
					local Card1Frame3 = function ( Card1, event )
						if not event.interrupted then
							Card1:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						end
						Card1:setLeftRight( false, false, -34.5, 34.5 )
						Card1:setTopBottom( false, false, -34.5, 34.5 )
						Card1:setAlpha( 0 )
						Card1:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( Card1, event )
						else
							Card1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Card1Frame3( Card1, event )
						return 
					else
						Card1:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						Card1:registerEventHandler( "transition_complete_keyframe", Card1Frame3 )
					end
				end
				
				Card1:completeAnimation()
				self.Card1:setLeftRight( false, false, -34.5, 34.5 )
				self.Card1:setTopBottom( false, false, -34.5, 34.5 )
				self.Card1:setAlpha( 0.1 )
				self.Card1:setZoom( 0 )
				Card1Frame2( Card1, {} )
				local CardBackFrame2 = function ( CardBack, event )
					local CardBackFrame3 = function ( CardBack, event )
						local CardBackFrame4 = function ( CardBack, event )
							if not event.interrupted then
								CardBack:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							CardBack:setLeftRight( false, false, -34.5, 34.5 )
							CardBack:setTopBottom( false, false, -34.5, 34.5 )
							CardBack:setAlpha( 0 )
							CardBack:setXRot( -15 )
							CardBack:setYRot( 140 )
							CardBack:setZoom( 0 )
							CardBack:setScale( 1 )
							if event.interrupted then
								self.clipFinished( CardBack, event )
							else
								CardBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CardBackFrame4( CardBack, event )
							return 
						else
							CardBack:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
							CardBack:setLeftRight( false, false, -34.5, 34.5 )
							CardBack:setScale( 1 )
							CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame4 )
						end
					end
					
					if event.interrupted then
						CardBackFrame3( CardBack, event )
						return 
					else
						CardBack:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame3 )
					end
				end
				
				CardBack:completeAnimation()
				self.CardBack:setLeftRight( false, false, -36.5, 32.5 )
				self.CardBack:setTopBottom( false, false, -34.5, 34.5 )
				self.CardBack:setAlpha( 0 )
				self.CardBack:setXRot( -15 )
				self.CardBack:setYRot( 140 )
				self.CardBack:setZoom( 0 )
				self.CardBack:setScale( 1.6 )
				CardBackFrame2( CardBack, {} )
				local CardFrontFrame2 = function ( CardFront, event )
					local CardFrontFrame3 = function ( CardFront, event )
						local CardFrontFrame4 = function ( CardFront, event )
							local CardFrontFrame5 = function ( CardFront, event )
								if not event.interrupted then
									CardFront:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								end
								CardFront:setLeftRight( false, false, -34.5, 34.5 )
								CardFront:setTopBottom( false, false, -34.5, 34.5 )
								CardFront:setAlpha( 0 )
								CardFront:setZoom( 0 )
								CardFront:setScale( 1 )
								if event.interrupted then
									self.clipFinished( CardFront, event )
								else
									CardFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CardFrontFrame5( CardFront, event )
								return 
							else
								CardFront:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								CardFront:registerEventHandler( "transition_complete_keyframe", CardFrontFrame5 )
							end
						end
						
						if event.interrupted then
							CardFrontFrame4( CardFront, event )
							return 
						else
							CardFront:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
							CardFront:setLeftRight( false, false, -34.5, 34.5 )
							CardFront:setAlpha( 0 )
							CardFront:setScale( 1 )
							CardFront:registerEventHandler( "transition_complete_keyframe", CardFrontFrame4 )
						end
					end
					
					if event.interrupted then
						CardFrontFrame3( CardFront, event )
						return 
					else
						CardFront:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						CardFront:setAlpha( 0.74 )
						CardFront:registerEventHandler( "transition_complete_keyframe", CardFrontFrame3 )
					end
				end
				
				CardFront:completeAnimation()
				self.CardFront:setLeftRight( false, false, -36.5, 32.5 )
				self.CardFront:setTopBottom( false, false, -34.5, 34.5 )
				self.CardFront:setAlpha( 1 )
				self.CardFront:setZoom( 0 )
				self.CardFront:setScale( 1.6 )
				CardFrontFrame2( CardFront, {} )
				local Card2bFrame2 = function ( Card2b, event )
					local Card2bFrame3 = function ( Card2b, event )
						local Card2bFrame4 = function ( Card2b, event )
							local Card2bFrame5 = function ( Card2b, event )
								local Card2bFrame6 = function ( Card2b, event )
									if not event.interrupted then
										Card2b:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
									end
									Card2b:setLeftRight( false, false, -34.5, 34.5 )
									Card2b:setTopBottom( false, false, -34.5, 34.5 )
									Card2b:setAlpha( 0 )
									Card2b:setScale( 2 )
									if event.interrupted then
										self.clipFinished( Card2b, event )
									else
										Card2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Card2bFrame6( Card2b, event )
									return 
								else
									Card2b:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
									Card2b:setAlpha( 0 )
									Card2b:setScale( 1.57 )
									Card2b:registerEventHandler( "transition_complete_keyframe", Card2bFrame6 )
								end
							end
							
							if event.interrupted then
								Card2bFrame5( Card2b, event )
								return 
							else
								Card2b:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								Card2b:setAlpha( 1 )
								Card2b:registerEventHandler( "transition_complete_keyframe", Card2bFrame5 )
							end
						end
						
						if event.interrupted then
							Card2bFrame4( Card2b, event )
							return 
						else
							Card2b:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							Card2b:setLeftRight( false, false, -34.5, 34.5 )
							Card2b:setScale( 1 )
							Card2b:registerEventHandler( "transition_complete_keyframe", Card2bFrame4 )
						end
					end
					
					if event.interrupted then
						Card2bFrame3( Card2b, event )
						return 
					else
						Card2b:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Card2b:setLeftRight( false, false, -34.81, 34.19 )
						Card2b:registerEventHandler( "transition_complete_keyframe", Card2bFrame3 )
					end
				end
				
				Card2b:completeAnimation()
				self.Card2b:setLeftRight( false, false, -35.32, 33.68 )
				self.Card2b:setTopBottom( false, false, -34.5, 34.5 )
				self.Card2b:setAlpha( 0 )
				self.Card2b:setScale( 2.4 )
				Card2bFrame2( Card2b, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					local HeroBackgroundGlowImageFrame3 = function ( HeroBackgroundGlowImage, event )
						local HeroBackgroundGlowImageFrame4 = function ( HeroBackgroundGlowImage, event )
							if not event.interrupted then
								HeroBackgroundGlowImage:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
							end
							HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
							HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
							HeroBackgroundGlowImage:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( HeroBackgroundGlowImage, event )
							else
								HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							HeroBackgroundGlowImageFrame4( HeroBackgroundGlowImage, event )
							return 
						else
							HeroBackgroundGlowImage:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							HeroBackgroundGlowImage:setAlpha( 1 )
							HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame4 )
						end
					end
					
					if event.interrupted then
						HeroBackgroundGlowImageFrame3( HeroBackgroundGlowImage, event )
						return 
					else
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame3 )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local HeroBackgroundGlowImage0Frame2 = function ( HeroBackgroundGlowImage0, event )
					local HeroBackgroundGlowImage0Frame3 = function ( HeroBackgroundGlowImage0, event )
						local HeroBackgroundGlowImage0Frame4 = function ( HeroBackgroundGlowImage0, event )
							if not event.interrupted then
								HeroBackgroundGlowImage0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
							end
							HeroBackgroundGlowImage0:setLeftRight( false, false, -60, 60 )
							HeroBackgroundGlowImage0:setTopBottom( false, false, -53.5, 54.5 )
							HeroBackgroundGlowImage0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( HeroBackgroundGlowImage0, event )
							else
								HeroBackgroundGlowImage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							HeroBackgroundGlowImage0Frame4( HeroBackgroundGlowImage0, event )
							return 
						else
							HeroBackgroundGlowImage0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							HeroBackgroundGlowImage0:setAlpha( 0.5 )
							HeroBackgroundGlowImage0:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImage0Frame4 )
						end
					end
					
					if event.interrupted then
						HeroBackgroundGlowImage0Frame3( HeroBackgroundGlowImage0, event )
						return 
					else
						HeroBackgroundGlowImage0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						HeroBackgroundGlowImage0:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImage0Frame3 )
					end
				end
				
				HeroBackgroundGlowImage0:completeAnimation()
				self.HeroBackgroundGlowImage0:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage0:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage0:setAlpha( 0 )
				HeroBackgroundGlowImage0Frame2( HeroBackgroundGlowImage0, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							if not event.interrupted then
								Glow:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
							end
							Glow:setLeftRight( true, true, 4, -4 )
							Glow:setTopBottom( true, true, 4, -4 )
							Glow:setAlpha( 0 )
							Glow:setScale( 1.6 )
							if event.interrupted then
								self.clipFinished( Glow, event )
							else
								Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.2 )
							Glow:setScale( 0.7 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, true, 4, -4 )
				self.Glow:setTopBottom( true, true, 4, -4 )
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 0.4 )
				GlowFrame2( Glow, {} )
				local f89_local9 = function ( f117_arg0, f117_arg1 )
					if not f117_arg1.interrupted then
						f117_arg0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					f117_arg0:setAlpha( 1 )
					if f117_arg1.interrupted then
						self.clipFinished( f117_arg0, f117_arg1 )
					else
						f117_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetHeroAbilityRouletteOverlayWidget0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				AmmoWidgetHeroAbilityRouletteOverlayWidget0:setAlpha( 0 )
				AmmoWidgetHeroAbilityRouletteOverlayWidget0:registerEventHandler( "transition_complete_keyframe", f89_local9 )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							if not event.interrupted then
								GlowOrangeOver:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
							end
							GlowOrangeOver:setLeftRight( true, false, -40.41, 162.41 )
							GlowOrangeOver:setTopBottom( true, false, -35.68, 156.68 )
							GlowOrangeOver:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( GlowOrangeOver, event )
							else
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0.3 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, -40.41, 162.41 )
				self.GlowOrangeOver:setTopBottom( true, false, -35.68, 156.68 )
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
			end
		},
		PrerollState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setAlpha( 0 )
				self.clipFinished( EdgeGlow, {} )
				ImgIcon:completeAnimation()
				self.ImgIcon:setAlpha( 0 )
				self.clipFinished( ImgIcon, {} )
				backing:completeAnimation()
				self.backing:setAlpha( 0 )
				self.clipFinished( backing, {} )
				Texture1:completeAnimation()
				self.Texture1:setAlpha( 0 )
				self.Texture1:setScale( 1.5 )
				self.clipFinished( Texture1, {} )
				Texture2:completeAnimation()
				self.Texture2:setAlpha( 0 )
				self.clipFinished( Texture2, {} )
				Card1:completeAnimation()
				self.Card1:setRGB( 0.62, 0.96, 1 )
				self.Card1:setAlpha( 0 )
				self.clipFinished( Card1, {} )
				CardBack:completeAnimation()
				self.CardBack:setAlpha( 0 )
				self.clipFinished( CardBack, {} )
				CardFront:completeAnimation()
				self.CardFront:setAlpha( 0 )
				self.clipFinished( CardFront, {} )
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage, {} )
				HeroBackgroundGlowImage0:completeAnimation()
				self.HeroBackgroundGlowImage0:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage0, {} )
				AmmoWidgetHeroAbilityRouletteOverlayWidget0:completeAnimation()
				self.AmmoWidgetHeroAbilityRouletteOverlayWidget0:setAlpha( 1 )
				self.clipFinished( AmmoWidgetHeroAbilityRouletteOverlayWidget0, {} )
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )
			end
		},
		Rolling = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					local EdgeGlowFrame3 = function ( EdgeGlow, event )
						local EdgeGlowFrame4 = function ( EdgeGlow, event )
							local EdgeGlowFrame5 = function ( EdgeGlow, event )
								if not event.interrupted then
									EdgeGlow:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								EdgeGlow:setLeftRight( false, false, -43, 45 )
								EdgeGlow:setTopBottom( false, false, -44, 44 )
								EdgeGlow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( EdgeGlow, event )
								else
									EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								EdgeGlowFrame5( EdgeGlow, event )
								return 
							else
								EdgeGlow:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								EdgeGlow:setAlpha( 0 )
								EdgeGlow:registerEventHandler( "transition_complete_keyframe", EdgeGlowFrame5 )
							end
						end
						
						if event.interrupted then
							EdgeGlowFrame4( EdgeGlow, event )
							return 
						else
							EdgeGlow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							EdgeGlow:setAlpha( 1 )
							EdgeGlow:registerEventHandler( "transition_complete_keyframe", EdgeGlowFrame4 )
						end
					end
					
					if event.interrupted then
						EdgeGlowFrame3( EdgeGlow, event )
						return 
					else
						EdgeGlow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", EdgeGlowFrame3 )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setLeftRight( false, false, -43, 45 )
				self.EdgeGlow:setTopBottom( false, false, -44, 44 )
				self.EdgeGlow:setAlpha( 0 )
				EdgeGlowFrame2( EdgeGlow, {} )
				local ImgIconFrame2 = function ( ImgIcon, event )
					if not event.interrupted then
						ImgIcon:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
					end
					ImgIcon:setLeftRight( true, true, 2, -2 )
					ImgIcon:setTopBottom( true, true, 2, -2 )
					ImgIcon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImgIcon, event )
					else
						ImgIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgIcon:completeAnimation()
				self.ImgIcon:setLeftRight( true, true, 2, -2 )
				self.ImgIcon:setTopBottom( true, true, 2, -2 )
				self.ImgIcon:setAlpha( 0 )
				ImgIconFrame2( ImgIcon, {} )
				local backingFrame2 = function ( backing, event )
					if not event.interrupted then
						backing:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
					end
					backing:setLeftRight( false, false, -22.93, 22.93 )
					backing:setTopBottom( false, false, -28.17, 28.17 )
					backing:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( backing, event )
					else
						backing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				backing:completeAnimation()
				self.backing:setLeftRight( false, false, -22.93, 22.93 )
				self.backing:setTopBottom( false, false, -28.17, 28.17 )
				self.backing:setAlpha( 0 )
				backingFrame2( backing, {} )
				local Texture1Frame2 = function ( Texture1, event )
					local Texture1Frame3 = function ( Texture1, event )
						local Texture1Frame4 = function ( Texture1, event )
							local Texture1Frame5 = function ( Texture1, event )
								local Texture1Frame6 = function ( Texture1, event )
									if not event.interrupted then
										Texture1:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
									end
									Texture1:setLeftRight( false, false, -60, 60 )
									Texture1:setTopBottom( false, false, -59.5, 60.5 )
									Texture1:setAlpha( 0 )
									Texture1:setZRot( 0 )
									Texture1:setScale( 1 )
									if event.interrupted then
										self.clipFinished( Texture1, event )
									else
										Texture1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Texture1Frame6( Texture1, event )
									return 
								else
									Texture1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Texture1:setScale( 1 )
									Texture1:registerEventHandler( "transition_complete_keyframe", Texture1Frame6 )
								end
							end
							
							if event.interrupted then
								Texture1Frame5( Texture1, event )
								return 
							else
								Texture1:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
								Texture1:setAlpha( 0 )
								Texture1:setScale( 1.5 )
								Texture1:registerEventHandler( "transition_complete_keyframe", Texture1Frame5 )
							end
						end
						
						if event.interrupted then
							Texture1Frame4( Texture1, event )
							return 
						else
							Texture1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							Texture1:setAlpha( 0.75 )
							Texture1:setScale( 1.09 )
							Texture1:registerEventHandler( "transition_complete_keyframe", Texture1Frame4 )
						end
					end
					
					if event.interrupted then
						Texture1Frame3( Texture1, event )
						return 
					else
						Texture1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Texture1:registerEventHandler( "transition_complete_keyframe", Texture1Frame3 )
					end
				end
				
				Texture1:completeAnimation()
				self.Texture1:setLeftRight( false, false, -60, 60 )
				self.Texture1:setTopBottom( false, false, -59.5, 60.5 )
				self.Texture1:setAlpha( 0 )
				self.Texture1:setZRot( 0 )
				self.Texture1:setScale( 1 )
				Texture1Frame2( Texture1, {} )
				local Texture2Frame2 = function ( Texture2, event )
					local Texture2Frame3 = function ( Texture2, event )
						local Texture2Frame4 = function ( Texture2, event )
							local Texture2Frame5 = function ( Texture2, event )
								if not event.interrupted then
									Texture2:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
								end
								Texture2:setLeftRight( false, false, -60, 60 )
								Texture2:setTopBottom( false, false, -59.5, 60.5 )
								Texture2:setAlpha( 0 )
								Texture2:setZRot( 90 )
								Texture2:setScale( 1.9 )
								if event.interrupted then
									self.clipFinished( Texture2, event )
								else
									Texture2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Texture2Frame5( Texture2, event )
								return 
							else
								Texture2:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								Texture2:setAlpha( 0 )
								Texture2:setZRot( 90 )
								Texture2:setScale( 1.9 )
								Texture2:registerEventHandler( "transition_complete_keyframe", Texture2Frame5 )
							end
						end
						
						if event.interrupted then
							Texture2Frame4( Texture2, event )
							return 
						else
							Texture2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							Texture2:setAlpha( 0.5 )
							Texture2:registerEventHandler( "transition_complete_keyframe", Texture2Frame4 )
						end
					end
					
					if event.interrupted then
						Texture2Frame3( Texture2, event )
						return 
					else
						Texture2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Texture2:registerEventHandler( "transition_complete_keyframe", Texture2Frame3 )
					end
				end
				
				Texture2:completeAnimation()
				self.Texture2:setLeftRight( false, false, -60, 60 )
				self.Texture2:setTopBottom( false, false, -59.5, 60.5 )
				self.Texture2:setAlpha( 0 )
				self.Texture2:setZRot( 0 )
				self.Texture2:setScale( 1 )
				Texture2Frame2( Texture2, {} )
				local Card1Frame2 = function ( Card1, event )
					local Card1Frame3 = function ( Card1, event )
						local Card1Frame4 = function ( Card1, event )
							if not event.interrupted then
								Card1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							Card1:setLeftRight( false, false, -34.5, 34.5 )
							Card1:setTopBottom( false, false, -34.5, 34.5 )
							Card1:setAlpha( 0.5 )
							if event.interrupted then
								self.clipFinished( Card1, event )
							else
								Card1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Card1Frame4( Card1, event )
							return 
						else
							Card1:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
							Card1:registerEventHandler( "transition_complete_keyframe", Card1Frame4 )
						end
					end
					
					if event.interrupted then
						Card1Frame3( Card1, event )
						return 
					else
						Card1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Card1:setAlpha( 0.5 )
						Card1:registerEventHandler( "transition_complete_keyframe", Card1Frame3 )
					end
				end
				
				Card1:completeAnimation()
				self.Card1:setLeftRight( false, false, -34.5, 34.5 )
				self.Card1:setTopBottom( false, false, -34.5, 34.5 )
				self.Card1:setAlpha( 0 )
				Card1Frame2( Card1, {} )
				local CardBackFrame2 = function ( CardBack, event )
					local CardBackFrame3 = function ( CardBack, event )
						local CardBackFrame4 = function ( CardBack, event )
							local CardBackFrame5 = function ( CardBack, event )
								local CardBackFrame6 = function ( CardBack, event )
									local CardBackFrame7 = function ( CardBack, event )
										if not event.interrupted then
											CardBack:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										end
										CardBack:setLeftRight( false, false, -36.5, 32.5 )
										CardBack:setTopBottom( false, false, -34.5, 34.5 )
										CardBack:setAlpha( 0 )
										CardBack:setXRot( -15 )
										CardBack:setYRot( 140 )
										CardBack:setScale( 1.6 )
										if event.interrupted then
											self.clipFinished( CardBack, event )
										else
											CardBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										CardBackFrame7( CardBack, event )
										return 
									else
										CardBack:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										CardBack:setLeftRight( false, false, -36.5, 32.5 )
										CardBack:setXRot( -15 )
										CardBack:setYRot( 140 )
										CardBack:setScale( 1.6 )
										CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame7 )
									end
								end
								
								if event.interrupted then
									CardBackFrame6( CardBack, event )
									return 
								else
									CardBack:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									CardBack:setLeftRight( false, false, -59.95, 9.05 )
									CardBack:setAlpha( 0 )
									CardBack:setXRot( -13 )
									CardBack:setYRot( 98.79 )
									CardBack:setScale( 1.38 )
									CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame6 )
								end
							end
							
							if event.interrupted then
								CardBackFrame5( CardBack, event )
								return 
							else
								CardBack:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								CardBack:setLeftRight( false, false, -63.86, 5.14 )
								CardBack:setXRot( -12.66 )
								CardBack:setYRot( 91.92 )
								CardBack:setScale( 1.35 )
								CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame5 )
							end
						end
						
						if event.interrupted then
							CardBackFrame4( CardBack, event )
							return 
						else
							CardBack:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							CardBack:setLeftRight( false, false, -79.5, -10.5 )
							CardBack:setXRot( -11.33 )
							CardBack:setYRot( 64.44 )
							CardBack:setScale( 1.2 )
							CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame4 )
						end
					end
					
					if event.interrupted then
						CardBackFrame3( CardBack, event )
						return 
					else
						CardBack:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						CardBack:setAlpha( 1 )
						CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame3 )
					end
				end
				
				CardBack:completeAnimation()
				self.CardBack:setLeftRight( false, false, -34.5, 34.5 )
				self.CardBack:setTopBottom( false, false, -34.5, 34.5 )
				self.CardBack:setAlpha( 0 )
				self.CardBack:setXRot( 15 )
				self.CardBack:setYRot( -40 )
				self.CardBack:setScale( 1 )
				CardBackFrame2( CardBack, {} )
				local f122_local7 = function ( f147_arg0, f147_arg1 )
					local f147_local0 = function ( f148_arg0, f148_arg1 )
						local f148_local0 = function ( f149_arg0, f149_arg1 )
							local f149_local0 = function ( f150_arg0, f150_arg1 )
								local f150_local0 = function ( f151_arg0, f151_arg1 )
									local f151_local0 = function ( f152_arg0, f152_arg1 )
										if not f152_arg1.interrupted then
											f152_arg0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
										end
										f152_arg0:setLeftRight( false, false, -36.5, 32.5 )
										f152_arg0:setTopBottom( false, false, -34.5, 34.5 )
										f152_arg0:setAlpha( 1 )
										f152_arg0:setXRot( -15 )
										f152_arg0:setYRot( 140 )
										f152_arg0:setZRot( 0 )
										f152_arg0:setZoom( 0 )
										f152_arg0:setScale( 1.6 )
										if f152_arg1.interrupted then
											self.clipFinished( f152_arg0, f152_arg1 )
										else
											f152_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f151_arg1.interrupted then
										f151_local0( f151_arg0, f151_arg1 )
										return 
									else
										f151_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										f151_arg0:setLeftRight( false, false, -36.5, 32.5 )
										f151_arg0:registerEventHandler( "transition_complete_keyframe", f151_local0 )
									end
								end
								
								if f150_arg1.interrupted then
									f150_local0( f150_arg0, f150_arg1 )
									return 
								else
									f150_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
									f150_arg0:setLeftRight( false, false, -41.66, 27.34 )
									f150_arg0:setXRot( -15 )
									f150_arg0:setYRot( 140 )
									f150_arg0:setScale( 1.6 )
									f150_arg0:registerEventHandler( "transition_complete_keyframe", f150_local0 )
								end
							end
							
							if f149_arg1.interrupted then
								f149_local0( f149_arg0, f149_arg1 )
								return 
							else
								f149_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f149_arg0:setLeftRight( false, false, -64.02, 4.98 )
								f149_arg0:setAlpha( 1 )
								f149_arg0:setXRot( -12.83 )
								f149_arg0:setYRot( 95.35 )
								f149_arg0:setScale( 1.36 )
								f149_arg0:registerEventHandler( "transition_complete_keyframe", f149_local0 )
							end
						end
						
						if f148_arg1.interrupted then
							f148_local0( f148_arg0, f148_arg1 )
							return 
						else
							f148_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							f148_arg0:setLeftRight( false, false, -65.74, 3.26 )
							f148_arg0:setXRot( -12.66 )
							f148_arg0:setYRot( 91.92 )
							f148_arg0:setScale( 1.34 )
							f148_arg0:registerEventHandler( "transition_complete_keyframe", f148_local0 )
						end
					end
					
					if f147_arg1.interrupted then
						f147_local0( f147_arg0, f147_arg1 )
						return 
					else
						f147_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f147_arg0:setLeftRight( false, false, -79.5, -10.5 )
						f147_arg0:setXRot( -11.33 )
						f147_arg0:setYRot( 64.44 )
						f147_arg0:setScale( 1.19 )
						f147_arg0:registerEventHandler( "transition_complete_keyframe", f147_local0 )
					end
				end
				
				CardFront:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
				CardFront:setLeftRight( false, false, -34.5, 34.5 )
				CardFront:setTopBottom( false, false, -34.5, 34.5 )
				CardFront:setAlpha( 0 )
				CardFront:setXRot( 15 )
				CardFront:setYRot( -40 )
				CardFront:setZRot( 0 )
				CardFront:setZoom( 0 )
				CardFront:setScale( 1 )
				CardFront:registerEventHandler( "transition_complete_keyframe", f122_local7 )
				Card2b:completeAnimation()
				self.Card2b:setLeftRight( false, false, -9, 60 )
				self.Card2b:setTopBottom( false, false, -34.5, 34.5 )
				self.clipFinished( Card2b, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					local HeroBackgroundGlowImageFrame3 = function ( HeroBackgroundGlowImage, event )
						local HeroBackgroundGlowImageFrame4 = function ( HeroBackgroundGlowImage, event )
							local HeroBackgroundGlowImageFrame5 = function ( HeroBackgroundGlowImage, event )
								if not event.interrupted then
									HeroBackgroundGlowImage:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
								HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
								HeroBackgroundGlowImage:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( HeroBackgroundGlowImage, event )
								else
									HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								HeroBackgroundGlowImageFrame5( HeroBackgroundGlowImage, event )
								return 
							else
								HeroBackgroundGlowImage:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								HeroBackgroundGlowImage:setAlpha( 0 )
								HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame5 )
							end
						end
						
						if event.interrupted then
							HeroBackgroundGlowImageFrame4( HeroBackgroundGlowImage, event )
							return 
						else
							HeroBackgroundGlowImage:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							HeroBackgroundGlowImage:setAlpha( 1 )
							HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame4 )
						end
					end
					
					if event.interrupted then
						HeroBackgroundGlowImageFrame3( HeroBackgroundGlowImage, event )
						return 
					else
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame3 )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local HeroBackgroundGlowImage0Frame2 = function ( HeroBackgroundGlowImage0, event )
					if not event.interrupted then
						HeroBackgroundGlowImage0:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
					end
					HeroBackgroundGlowImage0:setLeftRight( false, false, -60, 60 )
					HeroBackgroundGlowImage0:setTopBottom( false, false, -53.5, 54.5 )
					HeroBackgroundGlowImage0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroBackgroundGlowImage0, event )
					else
						HeroBackgroundGlowImage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroBackgroundGlowImage0:completeAnimation()
				self.HeroBackgroundGlowImage0:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage0:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage0:setAlpha( 0 )
				HeroBackgroundGlowImage0Frame2( HeroBackgroundGlowImage0, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
					end
					Glow:setLeftRight( true, true, 4, -4 )
					Glow:setTopBottom( true, true, 4, -4 )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, true, 4, -4 )
				self.Glow:setTopBottom( true, true, 4, -4 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				AmmoWidgetHeroAbilityRouletteOverlayWidget0:completeAnimation()
				self.AmmoWidgetHeroAbilityRouletteOverlayWidget0:setAlpha( 0 )
				self.clipFinished( AmmoWidgetHeroAbilityRouletteOverlayWidget0, {} )
				local f122_local11 = function ( f159_arg0, f159_arg1 )
					local f159_local0 = function ( f160_arg0, f160_arg1 )
						local f160_local0 = function ( f161_arg0, f161_arg1 )
							if not f161_arg1.interrupted then
								f161_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							f161_arg0:setLeftRight( true, false, -40.41, 162.41 )
							f161_arg0:setTopBottom( true, false, -35.68, 156.68 )
							f161_arg0:setAlpha( 0 )
							if f161_arg1.interrupted then
								self.clipFinished( f161_arg0, f161_arg1 )
							else
								f161_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f160_arg1.interrupted then
							f160_local0( f160_arg0, f160_arg1 )
							return 
						else
							f160_arg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							f160_arg0:setAlpha( 0 )
							f160_arg0:registerEventHandler( "transition_complete_keyframe", f160_local0 )
						end
					end
					
					if f159_arg1.interrupted then
						f159_local0( f159_arg0, f159_arg1 )
						return 
					else
						f159_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f159_arg0:setAlpha( 0.3 )
						f159_arg0:registerEventHandler( "transition_complete_keyframe", f159_local0 )
					end
				end
				
				GlowOrangeOver:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				GlowOrangeOver:setLeftRight( true, false, -40.41, 162.41 )
				GlowOrangeOver:setTopBottom( true, false, -35.68, 156.68 )
				GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f122_local11 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 14 )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setLeftRight( false, false, -43, 45 )
				self.EdgeGlow:setTopBottom( false, false, -44, 44 )
				self.clipFinished( EdgeGlow, {} )
				ImgIcon:completeAnimation()
				self.ImgIcon:setLeftRight( true, true, 2, -2 )
				self.ImgIcon:setTopBottom( true, true, 2, -2 )
				self.clipFinished( ImgIcon, {} )
				backing:completeAnimation()
				self.backing:setLeftRight( false, false, -22.93, 22.93 )
				self.backing:setTopBottom( false, false, -28.17, 28.17 )
				self.clipFinished( backing, {} )
				local Texture1Frame2 = function ( Texture1, event )
					if not event.interrupted then
						Texture1:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					Texture1:setLeftRight( false, false, -60, 60 )
					Texture1:setTopBottom( false, false, -59.5, 60.5 )
					Texture1:setAlpha( 0 )
					Texture1:setScale( 1.5 )
					if event.interrupted then
						self.clipFinished( Texture1, event )
					else
						Texture1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Texture1:completeAnimation()
				self.Texture1:setLeftRight( false, false, -60, 60 )
				self.Texture1:setTopBottom( false, false, -59.5, 60.5 )
				self.Texture1:setAlpha( 0 )
				self.Texture1:setScale( 1.5 )
				Texture1Frame2( Texture1, {} )
				local Texture2Frame2 = function ( Texture2, event )
					local Texture2Frame3 = function ( Texture2, event )
						local Texture2Frame4 = function ( Texture2, event )
							if not event.interrupted then
								Texture2:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
							end
							Texture2:setLeftRight( false, false, -60, 60 )
							Texture2:setTopBottom( false, false, -59.5, 60.5 )
							Texture2:setAlpha( 0 )
							Texture2:setZRot( 0 )
							Texture2:setScale( 1 )
							if event.interrupted then
								self.clipFinished( Texture2, event )
							else
								Texture2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Texture2Frame4( Texture2, event )
							return 
						else
							Texture2:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							Texture2:registerEventHandler( "transition_complete_keyframe", Texture2Frame4 )
						end
					end
					
					if event.interrupted then
						Texture2Frame3( Texture2, event )
						return 
					else
						Texture2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Texture2:registerEventHandler( "transition_complete_keyframe", Texture2Frame3 )
					end
				end
				
				Texture2:completeAnimation()
				self.Texture2:setLeftRight( false, false, -60, 60 )
				self.Texture2:setTopBottom( false, false, -59.5, 60.5 )
				self.Texture2:setAlpha( 0.25 )
				self.Texture2:setZRot( 0 )
				self.Texture2:setScale( 1 )
				Texture2Frame2( Texture2, {} )
				local Card1Frame2 = function ( Card1, event )
					local Card1Frame3 = function ( Card1, event )
						if not event.interrupted then
							Card1:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						end
						Card1:setLeftRight( false, false, -34.5, 34.5 )
						Card1:setTopBottom( false, false, -34.5, 34.5 )
						Card1:setAlpha( 0 )
						Card1:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( Card1, event )
						else
							Card1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Card1Frame3( Card1, event )
						return 
					else
						Card1:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						Card1:registerEventHandler( "transition_complete_keyframe", Card1Frame3 )
					end
				end
				
				Card1:completeAnimation()
				self.Card1:setLeftRight( false, false, -34.5, 34.5 )
				self.Card1:setTopBottom( false, false, -34.5, 34.5 )
				self.Card1:setAlpha( 0.1 )
				self.Card1:setZoom( 0 )
				Card1Frame2( Card1, {} )
				local CardBackFrame2 = function ( CardBack, event )
					local CardBackFrame3 = function ( CardBack, event )
						local CardBackFrame4 = function ( CardBack, event )
							if not event.interrupted then
								CardBack:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							CardBack:setLeftRight( false, false, -34.5, 34.5 )
							CardBack:setTopBottom( false, false, -34.5, 34.5 )
							CardBack:setAlpha( 0 )
							CardBack:setXRot( -15 )
							CardBack:setYRot( 140 )
							CardBack:setZoom( 0 )
							CardBack:setScale( 1 )
							if event.interrupted then
								self.clipFinished( CardBack, event )
							else
								CardBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CardBackFrame4( CardBack, event )
							return 
						else
							CardBack:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
							CardBack:setLeftRight( false, false, -34.5, 34.5 )
							CardBack:setScale( 1 )
							CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame4 )
						end
					end
					
					if event.interrupted then
						CardBackFrame3( CardBack, event )
						return 
					else
						CardBack:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						CardBack:registerEventHandler( "transition_complete_keyframe", CardBackFrame3 )
					end
				end
				
				CardBack:completeAnimation()
				self.CardBack:setLeftRight( false, false, -36.5, 32.5 )
				self.CardBack:setTopBottom( false, false, -34.5, 34.5 )
				self.CardBack:setAlpha( 0 )
				self.CardBack:setXRot( -15 )
				self.CardBack:setYRot( 140 )
				self.CardBack:setZoom( 0 )
				self.CardBack:setScale( 1.6 )
				CardBackFrame2( CardBack, {} )
				local CardFrontFrame2 = function ( CardFront, event )
					local CardFrontFrame3 = function ( CardFront, event )
						local CardFrontFrame4 = function ( CardFront, event )
							local CardFrontFrame5 = function ( CardFront, event )
								if not event.interrupted then
									CardFront:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								end
								CardFront:setLeftRight( false, false, -34.5, 34.5 )
								CardFront:setTopBottom( false, false, -34.5, 34.5 )
								CardFront:setAlpha( 0 )
								CardFront:setZoom( 0 )
								CardFront:setScale( 1 )
								if event.interrupted then
									self.clipFinished( CardFront, event )
								else
									CardFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CardFrontFrame5( CardFront, event )
								return 
							else
								CardFront:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								CardFront:registerEventHandler( "transition_complete_keyframe", CardFrontFrame5 )
							end
						end
						
						if event.interrupted then
							CardFrontFrame4( CardFront, event )
							return 
						else
							CardFront:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
							CardFront:setLeftRight( false, false, -34.5, 34.5 )
							CardFront:setAlpha( 0 )
							CardFront:setScale( 1 )
							CardFront:registerEventHandler( "transition_complete_keyframe", CardFrontFrame4 )
						end
					end
					
					if event.interrupted then
						CardFrontFrame3( CardFront, event )
						return 
					else
						CardFront:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						CardFront:setAlpha( 0.74 )
						CardFront:registerEventHandler( "transition_complete_keyframe", CardFrontFrame3 )
					end
				end
				
				CardFront:completeAnimation()
				self.CardFront:setLeftRight( false, false, -36.5, 32.5 )
				self.CardFront:setTopBottom( false, false, -34.5, 34.5 )
				self.CardFront:setAlpha( 1 )
				self.CardFront:setZoom( 0 )
				self.CardFront:setScale( 1.6 )
				CardFrontFrame2( CardFront, {} )
				local Card2bFrame2 = function ( Card2b, event )
					local Card2bFrame3 = function ( Card2b, event )
						local Card2bFrame4 = function ( Card2b, event )
							local Card2bFrame5 = function ( Card2b, event )
								local Card2bFrame6 = function ( Card2b, event )
									if not event.interrupted then
										Card2b:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
									end
									Card2b:setLeftRight( false, false, -34.5, 34.5 )
									Card2b:setTopBottom( false, false, -34.5, 34.5 )
									Card2b:setAlpha( 0 )
									Card2b:setScale( 2 )
									if event.interrupted then
										self.clipFinished( Card2b, event )
									else
										Card2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Card2bFrame6( Card2b, event )
									return 
								else
									Card2b:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
									Card2b:setAlpha( 0 )
									Card2b:setScale( 1.57 )
									Card2b:registerEventHandler( "transition_complete_keyframe", Card2bFrame6 )
								end
							end
							
							if event.interrupted then
								Card2bFrame5( Card2b, event )
								return 
							else
								Card2b:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								Card2b:setAlpha( 1 )
								Card2b:registerEventHandler( "transition_complete_keyframe", Card2bFrame5 )
							end
						end
						
						if event.interrupted then
							Card2bFrame4( Card2b, event )
							return 
						else
							Card2b:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							Card2b:setLeftRight( false, false, -34.5, 34.5 )
							Card2b:setScale( 1 )
							Card2b:registerEventHandler( "transition_complete_keyframe", Card2bFrame4 )
						end
					end
					
					if event.interrupted then
						Card2bFrame3( Card2b, event )
						return 
					else
						Card2b:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Card2b:setLeftRight( false, false, -34.81, 34.19 )
						Card2b:registerEventHandler( "transition_complete_keyframe", Card2bFrame3 )
					end
				end
				
				Card2b:completeAnimation()
				self.Card2b:setLeftRight( false, false, -35.32, 33.68 )
				self.Card2b:setTopBottom( false, false, -34.5, 34.5 )
				self.Card2b:setAlpha( 0 )
				self.Card2b:setScale( 2.4 )
				Card2bFrame2( Card2b, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					local HeroBackgroundGlowImageFrame3 = function ( HeroBackgroundGlowImage, event )
						local HeroBackgroundGlowImageFrame4 = function ( HeroBackgroundGlowImage, event )
							if not event.interrupted then
								HeroBackgroundGlowImage:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
							end
							HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
							HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
							HeroBackgroundGlowImage:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( HeroBackgroundGlowImage, event )
							else
								HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							HeroBackgroundGlowImageFrame4( HeroBackgroundGlowImage, event )
							return 
						else
							HeroBackgroundGlowImage:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							HeroBackgroundGlowImage:setAlpha( 1 )
							HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame4 )
						end
					end
					
					if event.interrupted then
						HeroBackgroundGlowImageFrame3( HeroBackgroundGlowImage, event )
						return 
					else
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame3 )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local HeroBackgroundGlowImage0Frame2 = function ( HeroBackgroundGlowImage0, event )
					local HeroBackgroundGlowImage0Frame3 = function ( HeroBackgroundGlowImage0, event )
						local HeroBackgroundGlowImage0Frame4 = function ( HeroBackgroundGlowImage0, event )
							if not event.interrupted then
								HeroBackgroundGlowImage0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
							end
							HeroBackgroundGlowImage0:setLeftRight( false, false, -60, 60 )
							HeroBackgroundGlowImage0:setTopBottom( false, false, -53.5, 54.5 )
							HeroBackgroundGlowImage0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( HeroBackgroundGlowImage0, event )
							else
								HeroBackgroundGlowImage0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							HeroBackgroundGlowImage0Frame4( HeroBackgroundGlowImage0, event )
							return 
						else
							HeroBackgroundGlowImage0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							HeroBackgroundGlowImage0:setAlpha( 0.5 )
							HeroBackgroundGlowImage0:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImage0Frame4 )
						end
					end
					
					if event.interrupted then
						HeroBackgroundGlowImage0Frame3( HeroBackgroundGlowImage0, event )
						return 
					else
						HeroBackgroundGlowImage0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						HeroBackgroundGlowImage0:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImage0Frame3 )
					end
				end
				
				HeroBackgroundGlowImage0:completeAnimation()
				self.HeroBackgroundGlowImage0:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage0:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage0:setAlpha( 0 )
				HeroBackgroundGlowImage0Frame2( HeroBackgroundGlowImage0, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							if not event.interrupted then
								Glow:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
							end
							Glow:setLeftRight( true, true, 4, -4 )
							Glow:setTopBottom( true, true, 4, -4 )
							Glow:setAlpha( 0 )
							Glow:setScale( 1.6 )
							if event.interrupted then
								self.clipFinished( Glow, event )
							else
								Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.2 )
							Glow:setScale( 0.7 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, true, 4, -4 )
				self.Glow:setTopBottom( true, true, 4, -4 )
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 0.4 )
				GlowFrame2( Glow, {} )
				AmmoWidgetHeroAbilityRouletteOverlayWidget0:completeAnimation()
				self.AmmoWidgetHeroAbilityRouletteOverlayWidget0:setAlpha( 0 )
				self.clipFinished( AmmoWidgetHeroAbilityRouletteOverlayWidget0, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							if not event.interrupted then
								GlowOrangeOver:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
							end
							GlowOrangeOver:setLeftRight( true, false, -40.41, 162.41 )
							GlowOrangeOver:setTopBottom( true, false, -35.68, 156.68 )
							GlowOrangeOver:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( GlowOrangeOver, event )
							else
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0.3 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, -40.41, 162.41 )
				self.GlowOrangeOver:setTopBottom( true, false, -35.68, 156.68 )
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Preroll",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "playerAbilities.playerGadget3.rouletteStatus", 1 )
			end
		},
		{
			stateName = "PrerollState",
			condition = function ( menu, element, event )
				local f194_local0 = IsModelValueEqualTo( controller, "playerAbilities.playerGadget3.rouletteStatus", 3 )
				if f194_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
						f194_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
					else
						f194_local0 = false
					end
				end
				return f194_local0
			end
		},
		{
			stateName = "Rolling",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "playerAbilities.playerGadget3.rouletteStatus", 2 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.rouletteStatus" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.rouletteStatus"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ImgIcon:close()
		element.Glow:close()
		element.AmmoWidgetHeroAbilityRouletteOverlayWidget0:close()
		element.CardFront:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

