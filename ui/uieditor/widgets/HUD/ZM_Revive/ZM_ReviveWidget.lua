-- 3c841ad072ca636f5e96e74a96ecc74f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_Revive.ZM_ReviveBleedoutRedEyeGlow" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityGlow" )

CoD.ZM_ReviveWidget = InheritFrom( LUI.UIElement )
CoD.ZM_ReviveWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZM_ReviveWidget )
	self.id = "ZM_ReviveWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 220 )
	self:setTopBottom( true, false, 0, 220 )
	self.anyChildUsesUpdateState = true
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( false, false, -80, 80 )
	GlowOrangeOver:setTopBottom( false, false, -126.5, 126.5 )
	GlowOrangeOver:setRGB( 1, 0.31, 0 )
	GlowOrangeOver:setAlpha( 0.4 )
	GlowOrangeOver:setZRot( 90 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local glow = LUI.UIImage.new()
	glow:setLeftRight( false, false, -70, 70 )
	glow:setTopBottom( false, false, -70, 70 )
	glow:setImage( RegisterImage( "uie_t7_zm_hud_revive_glow" ) )
	self:addElement( glow )
	self.glow = glow
	
	local RingGlow = LUI.UIImage.new()
	RingGlow:setLeftRight( false, false, -70, 70 )
	RingGlow:setTopBottom( false, false, -70, 70 )
	RingGlow:setRGB( 1, 0.72, 0 )
	RingGlow:setAlpha( 0 )
	RingGlow:setImage( RegisterImage( "uie_t7_zm_hud_revive_ringblur" ) )
	RingGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RingGlow )
	self.RingGlow = RingGlow
	
	local RingMiddle = LUI.UIImage.new()
	RingMiddle:setLeftRight( false, false, -70, 70 )
	RingMiddle:setTopBottom( false, false, -70, 70 )
	RingMiddle:setRGB( 1, 0.45, 0 )
	RingMiddle:setAlpha( 0.1 )
	RingMiddle:setImage( RegisterImage( "uie_t7_zm_hud_revive_ringmiddle" ) )
	RingMiddle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RingMiddle )
	self.RingMiddle = RingMiddle
	
	local RingTopBleedOut = LUI.UIImage.new()
	RingTopBleedOut:setLeftRight( false, false, -70, 70 )
	RingTopBleedOut:setTopBottom( false, false, -70, 70 )
	RingTopBleedOut:setRGB( 1, 0.92, 0 )
	RingTopBleedOut:setImage( RegisterImage( "uie_t7_zm_hud_revive_ringtop" ) )
	RingTopBleedOut:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_add" ) )
	RingTopBleedOut:setShaderVector( 1, 0.5, 0, 0, 0 )
	RingTopBleedOut:setShaderVector( 2, 0.5, 0, 0, 0 )
	RingTopBleedOut:setShaderVector( 3, 0.05, 0, 0, 0 )
	RingTopBleedOut:linkToElementModel( self, "bleedOutPercent", true, function ( model )
		local bleedOutPercent = Engine.GetModelValue( model )
		if bleedOutPercent then
			RingTopBleedOut:setShaderVector( 0, CoD.GetVectorComponentFromString( bleedOutPercent, 1 ), CoD.GetVectorComponentFromString( bleedOutPercent, 2 ), CoD.GetVectorComponentFromString( bleedOutPercent, 3 ), CoD.GetVectorComponentFromString( bleedOutPercent, 4 ) )
		end
	end )
	self:addElement( RingTopBleedOut )
	self.RingTopBleedOut = RingTopBleedOut
	
	local RingTopRevive = LUI.UIImage.new()
	RingTopRevive:setLeftRight( false, false, -70, 70 )
	RingTopRevive:setTopBottom( false, false, -70, 70 )
	RingTopRevive:setRGB( 0, 1, 0.01 )
	RingTopRevive:setAlpha( 0 )
	RingTopRevive:setImage( RegisterImage( "uie_t7_zm_hud_revive_ringtop" ) )
	RingTopRevive:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_add" ) )
	RingTopRevive:setShaderVector( 1, 0.5, 0, 0, 0 )
	RingTopRevive:setShaderVector( 2, 0.65, 0, 0, 0 )
	RingTopRevive:setShaderVector( 3, 0.34, 0, 0, 0 )
	RingTopRevive:linkToElementModel( self, "clockPercent", true, function ( model )
		local clockPercent = Engine.GetModelValue( model )
		if clockPercent then
			RingTopRevive:setShaderVector( 0, CoD.GetVectorComponentFromString( clockPercent, 1 ), CoD.GetVectorComponentFromString( clockPercent, 2 ), CoD.GetVectorComponentFromString( clockPercent, 3 ), CoD.GetVectorComponentFromString( clockPercent, 4 ) )
		end
	end )
	self:addElement( RingTopRevive )
	self.RingTopRevive = RingTopRevive
	
	local skull = LUI.UIImage.new()
	skull:setLeftRight( false, false, -70, 70 )
	skull:setTopBottom( false, false, -70, 70 )
	skull:setImage( RegisterImage( "uie_t7_zm_hud_revive_skull" ) )
	self:addElement( skull )
	self.skull = skull
	
	local AbilitySwirl = LUI.UIImage.new()
	AbilitySwirl:setLeftRight( false, false, -67.86, 69 )
	AbilitySwirl:setTopBottom( false, false, -69, 67.86 )
	AbilitySwirl:setRGB( 1, 0.64, 0 )
	AbilitySwirl:setAlpha( 0 )
	AbilitySwirl:setScale( 1.3 )
	AbilitySwirl:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityswirl" ) )
	AbilitySwirl:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilitySwirl )
	self.AbilitySwirl = AbilitySwirl
	
	local ZMReviveBleedoutRedEyeGlow = CoD.ZM_ReviveBleedoutRedEyeGlow.new( menu, controller )
	ZMReviveBleedoutRedEyeGlow:setLeftRight( false, false, -23.91, -6.75 )
	ZMReviveBleedoutRedEyeGlow:setTopBottom( false, false, 3.48, 21.64 )
	self:addElement( ZMReviveBleedoutRedEyeGlow )
	self.ZMReviveBleedoutRedEyeGlow = ZMReviveBleedoutRedEyeGlow
	
	local ZMReviveBleedoutRedEyeGlow0 = CoD.ZM_ReviveBleedoutRedEyeGlow.new( menu, controller )
	ZMReviveBleedoutRedEyeGlow0:setLeftRight( false, false, 6.09, 23.25 )
	ZMReviveBleedoutRedEyeGlow0:setTopBottom( false, false, 3.48, 21.64 )
	self:addElement( ZMReviveBleedoutRedEyeGlow0 )
	self.ZMReviveBleedoutRedEyeGlow0 = ZMReviveBleedoutRedEyeGlow0
	
	local Glow0 = CoD.AmmoWidget_AbilityGlow.new( menu, controller )
	Glow0:setLeftRight( true, true, 4, -4 )
	Glow0:setTopBottom( true, true, 4, -4 )
	Glow0:setRGB( 1, 0.49, 0 )
	Glow0:setAlpha( 0 )
	Glow0:setZoom( 13.47 )
	Glow0:setScale( 0.7 )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )

				glow:completeAnimation()
				self.glow:setAlpha( 0 )
				self.clipFinished( glow, {} )

				RingGlow:completeAnimation()
				self.RingGlow:setAlpha( 0 )
				self.clipFinished( RingGlow, {} )

				RingMiddle:completeAnimation()
				self.RingMiddle:setAlpha( 0 )
				self.clipFinished( RingMiddle, {} )

				RingTopBleedOut:completeAnimation()
				self.RingTopBleedOut:setAlpha( 0 )
				self.clipFinished( RingTopBleedOut, {} )

				skull:completeAnimation()
				self.skull:setAlpha( 0 )
				self.clipFinished( skull, {} )

				ZMReviveBleedoutRedEyeGlow:completeAnimation()
				self.ZMReviveBleedoutRedEyeGlow:setAlpha( 0 )
				self.clipFinished( ZMReviveBleedoutRedEyeGlow, {} )

				ZMReviveBleedoutRedEyeGlow0:completeAnimation()
				self.ZMReviveBleedoutRedEyeGlow0:setAlpha( 0 )
				self.clipFinished( ZMReviveBleedoutRedEyeGlow0, {} )

				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
			end,
			BleedingOut = function ()
				self:setupElementClipCounter( 10 )

				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								if not event.interrupted then
									GlowOrangeOver:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								end
								GlowOrangeOver:setAlpha( 0.4 )
								if event.interrupted then
									self.clipFinished( GlowOrangeOver, event )
								else
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:setAlpha( 0 )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 1 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local glowFrame2 = function ( glow, event )
					local glowFrame3 = function ( glow, event )
						if not event.interrupted then
							glow:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						end
						glow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( glow, event )
						else
							glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glowFrame3( glow, event )
						return 
					else
						glow:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						glow:registerEventHandler( "transition_complete_keyframe", glowFrame3 )
					end
				end
				
				glow:completeAnimation()
				self.glow:setAlpha( 0 )
				glowFrame2( glow, {} )
				local RingGlowFrame2 = function ( RingGlow, event )
					if not event.interrupted then
						RingGlow:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
					end
					RingGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RingGlow, event )
					else
						RingGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingGlow:completeAnimation()
				self.RingGlow:setAlpha( 0 )
				RingGlowFrame2( RingGlow, {} )
				local RingMiddleFrame2 = function ( RingMiddle, event )
					if not event.interrupted then
						RingMiddle:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
					end
					RingMiddle:setAlpha( 0.1 )
					if event.interrupted then
						self.clipFinished( RingMiddle, event )
					else
						RingMiddle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingMiddle:completeAnimation()
				self.RingMiddle:setAlpha( 0 )
				RingMiddleFrame2( RingMiddle, {} )
				local f5_local4 = function ( f14_arg0, f14_arg1 )
					local f14_local0 = function ( f15_arg0, f15_arg1 )
						if not f15_arg1.interrupted then
							f15_arg0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						f15_arg0:setAlpha( 1 )
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
						f14_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
						f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
					end
				end
				
				RingTopBleedOut:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				RingTopBleedOut:setAlpha( 0 )
				RingTopBleedOut:registerEventHandler( "transition_complete_keyframe", f5_local4 )
				local skullFrame2 = function ( skull, event )
					local skullFrame3 = function ( skull, event )
						local skullFrame4 = function ( skull, event )
							if not event.interrupted then
								skull:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							end
							skull:setAlpha( 1 )
							skull:setScale( 1 )
							if event.interrupted then
								self.clipFinished( skull, event )
							else
								skull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							skullFrame4( skull, event )
							return 
						else
							skull:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							skull:setAlpha( 0.63 )
							skull:setScale( 1.2 )
							skull:registerEventHandler( "transition_complete_keyframe", skullFrame4 )
						end
					end
					
					if event.interrupted then
						skullFrame3( skull, event )
						return 
					else
						skull:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						skull:registerEventHandler( "transition_complete_keyframe", skullFrame3 )
					end
				end
				
				skull:completeAnimation()
				self.skull:setAlpha( 0 )
				self.skull:setScale( 1 )
				skullFrame2( skull, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					local AbilitySwirlFrame3 = function ( AbilitySwirl, event )
						local AbilitySwirlFrame4 = function ( AbilitySwirl, event )
							local AbilitySwirlFrame5 = function ( AbilitySwirl, event )
								if not event.interrupted then
									AbilitySwirl:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								AbilitySwirl:setAlpha( 0 )
								AbilitySwirl:setZRot( 360 )
								AbilitySwirl:setScale( 1.4 )
								if event.interrupted then
									self.clipFinished( AbilitySwirl, event )
								else
									AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								AbilitySwirlFrame5( AbilitySwirl, event )
								return 
							else
								AbilitySwirl:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								AbilitySwirl:setAlpha( 0 )
								AbilitySwirl:setZRot( 360 )
								AbilitySwirl:setScale( 1.33 )
								AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame5 )
							end
						end
						
						if event.interrupted then
							AbilitySwirlFrame4( AbilitySwirl, event )
							return 
						else
							AbilitySwirl:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							AbilitySwirl:setAlpha( 0.78 )
							AbilitySwirl:setZRot( 300 )
							AbilitySwirl:setScale( 1.28 )
							AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame4 )
						end
					end
					
					if event.interrupted then
						AbilitySwirlFrame3( AbilitySwirl, event )
						return 
					else
						AbilitySwirl:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame3 )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( 0 )
				self.AbilitySwirl:setScale( 1 )
				AbilitySwirlFrame2( AbilitySwirl, {} )

				ZMReviveBleedoutRedEyeGlow:completeAnimation()
				self.ZMReviveBleedoutRedEyeGlow:setAlpha( 0 )
				self.clipFinished( ZMReviveBleedoutRedEyeGlow, {} )

				ZMReviveBleedoutRedEyeGlow0:completeAnimation()
				self.ZMReviveBleedoutRedEyeGlow0:setAlpha( 0 )
				self.clipFinished( ZMReviveBleedoutRedEyeGlow0, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						local Glow0Frame4 = function ( Glow0, event )
							if not event.interrupted then
								Glow0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
							end
							Glow0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Glow0, event )
							else
								Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Glow0Frame4( Glow0, event )
							return 
						else
							Glow0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Glow0:setAlpha( 0.2 )
							Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame4 )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )
			end
		},
		Reviving = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								local GlowOrangeOverFrame6 = function ( GlowOrangeOver, event )
									if not event.interrupted then
										GlowOrangeOver:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
									end
									GlowOrangeOver:setRGB( 0, 1, 0.01 )
									GlowOrangeOver:setAlpha( 0.4 )
									if event.interrupted then
										self.clipFinished( GlowOrangeOver, event )
									else
										GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowOrangeOverFrame6( GlowOrangeOver, event )
									return 
								else
									GlowOrangeOver:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
									GlowOrangeOver:setAlpha( 0.7 )
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0.4 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.71 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setRGB( 0, 1, 0.01 )
				self.GlowOrangeOver:setAlpha( 0.4 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )

				glow:completeAnimation()
				self.glow:setAlpha( 1 )
				self.clipFinished( glow, {} )

				RingGlow:completeAnimation()
				self.RingGlow:setRGB( 0, 1, 0.01 )
				self.RingGlow:setAlpha( 0 )
				self.clipFinished( RingGlow, {} )

				RingMiddle:completeAnimation()
				self.RingMiddle:setRGB( 0, 1, 0.01 )
				self.RingMiddle:setAlpha( 0.06 )
				self.clipFinished( RingMiddle, {} )

				RingTopBleedOut:completeAnimation()
				self.RingTopBleedOut:setRGB( 0, 1, 0.01 )
				self.RingTopBleedOut:setAlpha( 0 )
				self.clipFinished( RingTopBleedOut, {} )

				RingTopRevive:completeAnimation()
				self.RingTopRevive:setAlpha( 1 )
				self.RingTopRevive:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_add" ) )
				self.RingTopRevive:setShaderVector( 1, 0.5, 0, 0, 0 )
				self.RingTopRevive:setShaderVector( 2, 0.5, 0, 0, 0 )
				self.RingTopRevive:setShaderVector( 3, 0.05, 0, 0, 0 )
				self.clipFinished( RingTopRevive, {} )
				local skullFrame2 = function ( skull, event )
					local skullFrame3 = function ( skull, event )
						if not event.interrupted then
							skull:beginAnimation( "keyframe", 909, false, false, CoD.TweenType.Linear )
						end
						skull:setAlpha( 1 )
						skull:setScale( 1 )
						if event.interrupted then
							self.clipFinished( skull, event )
						else
							skull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						skullFrame3( skull, event )
						return 
					else
						skull:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						skull:setScale( 1.2 )
						skull:registerEventHandler( "transition_complete_keyframe", skullFrame3 )
					end
				end
				
				skull:completeAnimation()
				self.skull:setAlpha( 1 )
				self.skull:setScale( 1 )
				skullFrame2( skull, {} )

				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )

				ZMReviveBleedoutRedEyeGlow:completeAnimation()
				self.ZMReviveBleedoutRedEyeGlow:setRGB( 1, 1, 1 )
				self.ZMReviveBleedoutRedEyeGlow:setAlpha( 0 )
				self.clipFinished( ZMReviveBleedoutRedEyeGlow, {} )

				ZMReviveBleedoutRedEyeGlow0:completeAnimation()
				self.ZMReviveBleedoutRedEyeGlow0:setRGB( 1, 1, 1 )
				self.ZMReviveBleedoutRedEyeGlow0:setAlpha( 0 )
				self.clipFinished( ZMReviveBleedoutRedEyeGlow0, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 909, false, false, CoD.TweenType.Linear )
						end
						Glow0:setRGB( 0, 1, 0.01 )
						Glow0:setAlpha( 0.1 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 0.1 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setRGB( 0, 1, 0.01 )
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )

				self.nextClip = "DefaultClip"
			end
		},
		BleedingOut_Low = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								if not event.interrupted then
									GlowOrangeOver:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
								end
								GlowOrangeOver:setRGB( 0.61, 0.01, 0 )
								GlowOrangeOver:setAlpha( 0.4 )
								if event.interrupted then
									self.clipFinished( GlowOrangeOver, event )
								else
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:setAlpha( 0.8 )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0.4 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.8 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setRGB( 0.61, 0.01, 0 )
				self.GlowOrangeOver:setAlpha( 0.4 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )

				glow:completeAnimation()
				self.glow:setRGB( 1, 0.38, 0.38 )
				self.glow:setAlpha( 1 )
				self.clipFinished( glow, {} )

				RingGlow:completeAnimation()
				self.RingGlow:setRGB( 1, 0, 0.12 )
				self.RingGlow:setAlpha( 0 )
				self.clipFinished( RingGlow, {} )

				RingMiddle:completeAnimation()
				self.RingMiddle:setRGB( 1, 0, 0 )
				self.RingMiddle:setAlpha( 0.06 )
				self.clipFinished( RingMiddle, {} )

				RingTopBleedOut:completeAnimation()
				self.RingTopBleedOut:setRGB( 1, 0, 0.06 )
				self.RingTopBleedOut:setAlpha( 1 )
				self.clipFinished( RingTopBleedOut, {} )

				RingTopRevive:completeAnimation()
				self.RingTopRevive:setAlpha( 0 )
				self.clipFinished( RingTopRevive, {} )
				local skullFrame2 = function ( skull, event )
					local skullFrame3 = function ( skull, event )
						if not event.interrupted then
							skull:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						end
						skull:setAlpha( 1 )
						skull:setScale( 1 )
						if event.interrupted then
							self.clipFinished( skull, event )
						else
							skull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						skullFrame3( skull, event )
						return 
					else
						skull:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						skull:setScale( 1.1 )
						skull:registerEventHandler( "transition_complete_keyframe", skullFrame3 )
					end
				end
				
				skull:completeAnimation()
				self.skull:setAlpha( 1 )
				self.skull:setScale( 1 )
				skullFrame2( skull, {} )

				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				local ZMReviveBleedoutRedEyeGlowFrame2 = function ( ZMReviveBleedoutRedEyeGlow, event )
					local ZMReviveBleedoutRedEyeGlowFrame3 = function ( ZMReviveBleedoutRedEyeGlow, event )
						if not event.interrupted then
							ZMReviveBleedoutRedEyeGlow:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						end
						ZMReviveBleedoutRedEyeGlow:setLeftRight( false, false, -23.91, -6.75 )
						ZMReviveBleedoutRedEyeGlow:setTopBottom( false, false, 3.48, 21.64 )
						ZMReviveBleedoutRedEyeGlow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ZMReviveBleedoutRedEyeGlow, event )
						else
							ZMReviveBleedoutRedEyeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZMReviveBleedoutRedEyeGlowFrame3( ZMReviveBleedoutRedEyeGlow, event )
						return 
					else
						ZMReviveBleedoutRedEyeGlow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						ZMReviveBleedoutRedEyeGlow:setLeftRight( false, false, -25.91, -8.75 )
						ZMReviveBleedoutRedEyeGlow:setTopBottom( false, false, 4.48, 22.64 )
						ZMReviveBleedoutRedEyeGlow:registerEventHandler( "transition_complete_keyframe", ZMReviveBleedoutRedEyeGlowFrame3 )
					end
				end
				
				ZMReviveBleedoutRedEyeGlow:completeAnimation()
				self.ZMReviveBleedoutRedEyeGlow:setLeftRight( false, false, -23.91, -6.75 )
				self.ZMReviveBleedoutRedEyeGlow:setTopBottom( false, false, 3.48, 21.64 )
				self.ZMReviveBleedoutRedEyeGlow:setAlpha( 1 )
				ZMReviveBleedoutRedEyeGlowFrame2( ZMReviveBleedoutRedEyeGlow, {} )
				local ZMReviveBleedoutRedEyeGlow0Frame2 = function ( ZMReviveBleedoutRedEyeGlow0, event )
					local ZMReviveBleedoutRedEyeGlow0Frame3 = function ( ZMReviveBleedoutRedEyeGlow0, event )
						if not event.interrupted then
							ZMReviveBleedoutRedEyeGlow0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						end
						ZMReviveBleedoutRedEyeGlow0:setLeftRight( false, false, 6.09, 23.25 )
						ZMReviveBleedoutRedEyeGlow0:setTopBottom( false, false, 3.48, 21.64 )
						ZMReviveBleedoutRedEyeGlow0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ZMReviveBleedoutRedEyeGlow0, event )
						else
							ZMReviveBleedoutRedEyeGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZMReviveBleedoutRedEyeGlow0Frame3( ZMReviveBleedoutRedEyeGlow0, event )
						return 
					else
						ZMReviveBleedoutRedEyeGlow0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						ZMReviveBleedoutRedEyeGlow0:setLeftRight( false, false, 8.09, 25.25 )
						ZMReviveBleedoutRedEyeGlow0:setTopBottom( false, false, 4.48, 22.64 )
						ZMReviveBleedoutRedEyeGlow0:registerEventHandler( "transition_complete_keyframe", ZMReviveBleedoutRedEyeGlow0Frame3 )
					end
				end
				
				ZMReviveBleedoutRedEyeGlow0:completeAnimation()
				self.ZMReviveBleedoutRedEyeGlow0:setLeftRight( false, false, 6.09, 23.25 )
				self.ZMReviveBleedoutRedEyeGlow0:setTopBottom( false, false, 3.48, 21.64 )
				self.ZMReviveBleedoutRedEyeGlow0:setAlpha( 1 )
				ZMReviveBleedoutRedEyeGlow0Frame2( ZMReviveBleedoutRedEyeGlow0, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						end
						Glow0:setRGB( 1, 0, 0 )
						Glow0:setAlpha( 0.1 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 0.2 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setRGB( 1, 0, 0 )
				self.Glow0:setAlpha( 0.1 )
				Glow0Frame2( Glow0, {} )

				self.nextClip = "DefaultClip"
			end,
			Reviving = function ()
				self:setupElementClipCounter( 11 )

				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					if not event.interrupted then
						GlowOrangeOver:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					GlowOrangeOver:setRGB( 0, 1, 0.01 )
					GlowOrangeOver:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( GlowOrangeOver, event )
					else
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setRGB( 0.61, 0.01, 0 )
				self.GlowOrangeOver:setAlpha( 0.4 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local glowFrame2 = function ( glow, event )
					if not event.interrupted then
						glow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					glow:setRGB( 1, 0.38, 0.38 )
					glow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( glow, event )
					else
						glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				glow:completeAnimation()
				self.glow:setRGB( 1, 0.38, 0.38 )
				self.glow:setAlpha( 1 )
				glowFrame2( glow, {} )
				local RingGlowFrame2 = function ( RingGlow, event )
					if not event.interrupted then
						RingGlow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RingGlow:setRGB( 0, 1, 0.01 )
					RingGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RingGlow, event )
					else
						RingGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingGlow:completeAnimation()
				self.RingGlow:setRGB( 1, 0, 0.12 )
				self.RingGlow:setAlpha( 0 )
				RingGlowFrame2( RingGlow, {} )
				local RingMiddleFrame2 = function ( RingMiddle, event )
					if not event.interrupted then
						RingMiddle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RingMiddle:setRGB( 0, 1, 0.01 )
					RingMiddle:setAlpha( 0.06 )
					if event.interrupted then
						self.clipFinished( RingMiddle, event )
					else
						RingMiddle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingMiddle:completeAnimation()
				self.RingMiddle:setRGB( 1, 0, 0 )
				self.RingMiddle:setAlpha( 0.06 )
				RingMiddleFrame2( RingMiddle, {} )
				local RingTopBleedOutFrame2 = function ( RingTopBleedOut, event )
					if not event.interrupted then
						RingTopBleedOut:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RingTopBleedOut:setRGB( 0, 1, 0.01 )
					RingTopBleedOut:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RingTopBleedOut, event )
					else
						RingTopBleedOut:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingTopBleedOut:completeAnimation()
				self.RingTopBleedOut:setRGB( 1, 0, 0.06 )
				self.RingTopBleedOut:setAlpha( 1 )
				RingTopBleedOutFrame2( RingTopBleedOut, {} )
				local RingTopReviveFrame2 = function ( RingTopRevive, event )
					if not event.interrupted then
						RingTopRevive:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RingTopRevive:setAlpha( 1 )
					RingTopRevive:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_add" ) )
					RingTopRevive:setShaderVector( 1, 0.5, 0, 0, 0 )
					RingTopRevive:setShaderVector( 2, 0.5, 0, 0, 0 )
					RingTopRevive:setShaderVector( 3, 0.05, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( RingTopRevive, event )
					else
						RingTopRevive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingTopRevive:completeAnimation()
				self.RingTopRevive:setAlpha( 0 )
				self.RingTopRevive:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_add" ) )
				self.RingTopRevive:setShaderVector( 1, 0.5, 0, 0, 0 )
				self.RingTopRevive:setShaderVector( 2, 0.5, 0, 0, 0 )
				self.RingTopRevive:setShaderVector( 3, 0.05, 0, 0, 0 )
				RingTopReviveFrame2( RingTopRevive, {} )
				local skullFrame2 = function ( skull, event )
					local skullFrame3 = function ( skull, event )
						if not event.interrupted then
							skull:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						skull:setAlpha( 1 )
						skull:setScale( 1 )
						if event.interrupted then
							self.clipFinished( skull, event )
						else
							skull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						skullFrame3( skull, event )
						return 
					else
						skull:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						skull:setScale( 1.1 )
						skull:registerEventHandler( "transition_complete_keyframe", skullFrame3 )
					end
				end
				
				skull:completeAnimation()
				self.skull:setAlpha( 1 )
				self.skull:setScale( 1 )
				skullFrame2( skull, {} )

				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				local ZMReviveBleedoutRedEyeGlowFrame2 = function ( ZMReviveBleedoutRedEyeGlow, event )
					if not event.interrupted then
						ZMReviveBleedoutRedEyeGlow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					ZMReviveBleedoutRedEyeGlow:setLeftRight( false, false, -23.91, -6.75 )
					ZMReviveBleedoutRedEyeGlow:setTopBottom( false, false, 3.48, 21.64 )
					ZMReviveBleedoutRedEyeGlow:setRGB( 1, 1, 1 )
					ZMReviveBleedoutRedEyeGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ZMReviveBleedoutRedEyeGlow, event )
					else
						ZMReviveBleedoutRedEyeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZMReviveBleedoutRedEyeGlow:completeAnimation()
				self.ZMReviveBleedoutRedEyeGlow:setLeftRight( false, false, -23.91, -6.75 )
				self.ZMReviveBleedoutRedEyeGlow:setTopBottom( false, false, 3.48, 21.64 )
				self.ZMReviveBleedoutRedEyeGlow:setRGB( 1, 1, 1 )
				self.ZMReviveBleedoutRedEyeGlow:setAlpha( 1 )
				ZMReviveBleedoutRedEyeGlowFrame2( ZMReviveBleedoutRedEyeGlow, {} )
				local ZMReviveBleedoutRedEyeGlow0Frame2 = function ( ZMReviveBleedoutRedEyeGlow0, event )
					if not event.interrupted then
						ZMReviveBleedoutRedEyeGlow0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					ZMReviveBleedoutRedEyeGlow0:setLeftRight( false, false, 6.09, 23.25 )
					ZMReviveBleedoutRedEyeGlow0:setTopBottom( false, false, 3.48, 21.64 )
					ZMReviveBleedoutRedEyeGlow0:setRGB( 1, 1, 1 )
					ZMReviveBleedoutRedEyeGlow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ZMReviveBleedoutRedEyeGlow0, event )
					else
						ZMReviveBleedoutRedEyeGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZMReviveBleedoutRedEyeGlow0:completeAnimation()
				self.ZMReviveBleedoutRedEyeGlow0:setLeftRight( false, false, 6.09, 23.25 )
				self.ZMReviveBleedoutRedEyeGlow0:setTopBottom( false, false, 3.48, 21.64 )
				self.ZMReviveBleedoutRedEyeGlow0:setRGB( 1, 1, 1 )
				self.ZMReviveBleedoutRedEyeGlow0:setAlpha( 1 )
				ZMReviveBleedoutRedEyeGlow0Frame2( ZMReviveBleedoutRedEyeGlow0, {} )
				local Glow0Frame2 = function ( Glow0, event )
					if not event.interrupted then
						Glow0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Glow0:setRGB( 1, 0.04, 0 )
					Glow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow0, event )
					else
						Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setRGB( 1, 0.04, 0 )
				self.Glow0:setAlpha( 0.1 )
				Glow0Frame2( Glow0, {} )
			end
		},
		BleedingOut = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						if not event.interrupted then
							GlowOrangeOver:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						end
						GlowOrangeOver:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( GlowOrangeOver, event )
						else
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.6 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0.4 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )

				glow:completeAnimation()
				self.glow:setAlpha( 1 )
				self.clipFinished( glow, {} )

				RingGlow:completeAnimation()
				self.RingGlow:setAlpha( 0 )
				self.clipFinished( RingGlow, {} )

				RingMiddle:completeAnimation()
				self.RingMiddle:setAlpha( 0.1 )
				self.clipFinished( RingMiddle, {} )

				RingTopBleedOut:completeAnimation()
				self.RingTopBleedOut:setAlpha( 1 )
				self.clipFinished( RingTopBleedOut, {} )

				RingTopRevive:completeAnimation()
				self.RingTopRevive:setAlpha( 0 )
				self.clipFinished( RingTopRevive, {} )
				local skullFrame2 = function ( skull, event )
					local skullFrame3 = function ( skull, event )
						if not event.interrupted then
							skull:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						end
						skull:setLeftRight( false, false, -70, 70 )
						skull:setTopBottom( false, false, -70, 70 )
						skull:setAlpha( 1 )
						skull:setScale( 1 )
						if event.interrupted then
							self.clipFinished( skull, event )
						else
							skull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						skullFrame3( skull, event )
						return 
					else
						skull:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						skull:setScale( 1.1 )
						skull:registerEventHandler( "transition_complete_keyframe", skullFrame3 )
					end
				end
				
				skull:completeAnimation()
				self.skull:setLeftRight( false, false, -70, 70 )
				self.skull:setTopBottom( false, false, -70, 70 )
				self.skull:setAlpha( 1 )
				self.skull:setScale( 1 )
				skullFrame2( skull, {} )

				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setLeftRight( false, false, -67.86, 69 )
				self.AbilitySwirl:setTopBottom( false, false, -69, 67.86 )
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )

				ZMReviveBleedoutRedEyeGlow:completeAnimation()
				self.ZMReviveBleedoutRedEyeGlow:setLeftRight( false, false, -23.91, -6.75 )
				self.ZMReviveBleedoutRedEyeGlow:setTopBottom( false, false, 3.48, 21.64 )
				self.ZMReviveBleedoutRedEyeGlow:setAlpha( 0 )
				self.clipFinished( ZMReviveBleedoutRedEyeGlow, {} )

				ZMReviveBleedoutRedEyeGlow0:completeAnimation()
				self.ZMReviveBleedoutRedEyeGlow0:setLeftRight( false, false, 6.09, 23.25 )
				self.ZMReviveBleedoutRedEyeGlow0:setTopBottom( false, false, 3.48, 21.64 )
				self.ZMReviveBleedoutRedEyeGlow0:setAlpha( 0 )
				self.clipFinished( ZMReviveBleedoutRedEyeGlow0, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						end
						Glow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 0.3 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Reviving",
			condition = function ( menu, element, event )
				return IsSelfModelValueEnumBitSet( element, controller, "stateFlags", Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BEING_REVIVED )
			end
		},
		{
			stateName = "BleedingOut_Low",
			condition = function ( menu, element, event )
				return IsSelfModelValueEnumBitSet( element, controller, "stateFlags", Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BLEEDING_OUT ) and IsSelfModelValueLessThanOrEqualTo( element, controller, "bleedOutPercent", 0.3 )
			end
		},
		{
			stateName = "BleedingOut",
			condition = function ( menu, element, event )
				return IsSelfModelValueEnumBitSet( element, controller, "stateFlags", Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BLEEDING_OUT )
			end
		}
	} )
	self:linkToElementModel( self, "stateFlags", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "stateFlags"
		} )
	end )
	self:linkToElementModel( self, "bleedOutPercent", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bleedOutPercent"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZMReviveBleedoutRedEyeGlow:close()
		element.ZMReviveBleedoutRedEyeGlow0:close()
		element.Glow0:close()
		element.RingTopBleedOut:close()
		element.RingTopRevive:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

