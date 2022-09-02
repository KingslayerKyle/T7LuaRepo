-- ed2d01d93bb2ce2186a11660be415bb4
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_Loot_GrandPrixWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_Loot_GrandPrixWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_Loot_GrandPrixWidget )
	self.id = "CallingCards_Loot_GrandPrixWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 480 )
	BG:setTopBottom( true, false, 0, 120 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_grandprix_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 100.67, 432 )
	Glow:setTopBottom( true, false, -195, 524.63 )
	Glow:setZRot( 90 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Med = LUI.UIImage.new()
	Med:setLeftRight( true, false, 384, 480 )
	Med:setTopBottom( true, false, 0, 96 )
	Med:setImage( RegisterImage( "uie_t7_callingcard_grandprix_cars2" ) )
	self:addElement( Med )
	self.Med = Med
	
	local Sm = LUI.UIImage.new()
	Sm:setLeftRight( true, false, 384, 480 )
	Sm:setTopBottom( true, false, 0, 96 )
	Sm:setImage( RegisterImage( "uie_t7_callingcard_grandprix_cars3" ) )
	self:addElement( Sm )
	self.Sm = Sm
	
	local Lrg = LUI.UIImage.new()
	Lrg:setLeftRight( true, false, 0, 480 )
	Lrg:setTopBottom( true, false, 0, 120 )
	Lrg:setImage( RegisterImage( "uie_t7_callingcard_grandprix_cars1" ) )
	self:addElement( Lrg )
	self.Lrg = Lrg
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										if not event.interrupted then
											Glow:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
										end
										Glow:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Glow, event )
										else
											Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
										Glow:setAlpha( 0.81 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
									Glow:setAlpha( 0.67 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 1 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local MedFrame2 = function ( Med, event )
					local MedFrame3 = function ( Med, event )
						local MedFrame4 = function ( Med, event )
							local MedFrame5 = function ( Med, event )
								local MedFrame6 = function ( Med, event )
									local MedFrame7 = function ( Med, event )
										if not event.interrupted then
											Med:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
										end
										Med:setLeftRight( true, false, 384, 480 )
										Med:setTopBottom( true, false, 0, 96 )
										if event.interrupted then
											self.clipFinished( Med, event )
										else
											Med:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										MedFrame7( Med, event )
										return 
									else
										Med:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
										Med:setLeftRight( true, false, 398, 494 )
										Med:setTopBottom( true, false, -4, 92 )
										Med:registerEventHandler( "transition_complete_keyframe", MedFrame7 )
									end
								end
								
								if event.interrupted then
									MedFrame6( Med, event )
									return 
								else
									Med:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
									Med:setLeftRight( true, false, 384, 480 )
									Med:setTopBottom( true, false, 0, 96 )
									Med:registerEventHandler( "transition_complete_keyframe", MedFrame6 )
								end
							end
							
							if event.interrupted then
								MedFrame5( Med, event )
								return 
							else
								Med:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
								Med:setLeftRight( true, false, 396, 492 )
								Med:setTopBottom( true, false, 3, 99 )
								Med:registerEventHandler( "transition_complete_keyframe", MedFrame5 )
							end
						end
						
						if event.interrupted then
							MedFrame4( Med, event )
							return 
						else
							Med:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							Med:setTopBottom( true, false, 0, 96 )
							Med:registerEventHandler( "transition_complete_keyframe", MedFrame4 )
						end
					end
					
					if event.interrupted then
						MedFrame3( Med, event )
						return 
					else
						Med:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						Med:setTopBottom( true, false, -7, 89 )
						Med:registerEventHandler( "transition_complete_keyframe", MedFrame3 )
					end
				end
				
				Med:completeAnimation()
				self.Med:setLeftRight( true, false, 384, 480 )
				self.Med:setTopBottom( true, false, 0, 96 )
				MedFrame2( Med, {} )
				local SmFrame2 = function ( Sm, event )
					local SmFrame3 = function ( Sm, event )
						local SmFrame4 = function ( Sm, event )
							local SmFrame5 = function ( Sm, event )
								local SmFrame6 = function ( Sm, event )
									local SmFrame7 = function ( Sm, event )
										if not event.interrupted then
											Sm:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
										end
										Sm:setLeftRight( true, false, 384, 480 )
										Sm:setTopBottom( true, false, 0, 96 )
										if event.interrupted then
											self.clipFinished( Sm, event )
										else
											Sm:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										SmFrame7( Sm, event )
										return 
									else
										Sm:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
										Sm:setLeftRight( true, false, 360, 456 )
										Sm:registerEventHandler( "transition_complete_keyframe", SmFrame7 )
									end
								end
								
								if event.interrupted then
									SmFrame6( Sm, event )
									return 
								else
									Sm:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
									Sm:setLeftRight( true, false, 370, 466 )
									Sm:registerEventHandler( "transition_complete_keyframe", SmFrame6 )
								end
							end
							
							if event.interrupted then
								SmFrame5( Sm, event )
								return 
							else
								Sm:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
								Sm:setLeftRight( true, false, 359, 455 )
								Sm:registerEventHandler( "transition_complete_keyframe", SmFrame5 )
							end
						end
						
						if event.interrupted then
							SmFrame4( Sm, event )
							return 
						else
							Sm:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
							Sm:setLeftRight( true, false, 377, 473 )
							Sm:registerEventHandler( "transition_complete_keyframe", SmFrame4 )
						end
					end
					
					if event.interrupted then
						SmFrame3( Sm, event )
						return 
					else
						Sm:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						Sm:setLeftRight( true, false, 368, 464 )
						Sm:registerEventHandler( "transition_complete_keyframe", SmFrame3 )
					end
				end
				
				Sm:completeAnimation()
				self.Sm:setLeftRight( true, false, 384, 480 )
				self.Sm:setTopBottom( true, false, 0, 96 )
				SmFrame2( Sm, {} )
				local LrgFrame2 = function ( Lrg, event )
					local LrgFrame3 = function ( Lrg, event )
						local LrgFrame4 = function ( Lrg, event )
							local LrgFrame5 = function ( Lrg, event )
								local LrgFrame6 = function ( Lrg, event )
									local LrgFrame7 = function ( Lrg, event )
										if not event.interrupted then
											Lrg:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
										end
										Lrg:setLeftRight( true, false, 0, 480 )
										Lrg:setTopBottom( true, false, 0, 120 )
										if event.interrupted then
											self.clipFinished( Lrg, event )
										else
											Lrg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										LrgFrame7( Lrg, event )
										return 
									else
										Lrg:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
										Lrg:setLeftRight( true, false, -8, 472 )
										Lrg:registerEventHandler( "transition_complete_keyframe", LrgFrame7 )
									end
								end
								
								if event.interrupted then
									LrgFrame6( Lrg, event )
									return 
								else
									Lrg:beginAnimation( "keyframe", 510, false, false, CoD.TweenType.Linear )
									Lrg:setLeftRight( true, false, 0, 480 )
									Lrg:registerEventHandler( "transition_complete_keyframe", LrgFrame6 )
								end
							end
							
							if event.interrupted then
								LrgFrame5( Lrg, event )
								return 
							else
								Lrg:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
								Lrg:setLeftRight( true, false, -7, 473 )
								Lrg:registerEventHandler( "transition_complete_keyframe", LrgFrame5 )
							end
						end
						
						if event.interrupted then
							LrgFrame4( Lrg, event )
							return 
						else
							Lrg:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
							Lrg:setLeftRight( true, false, 0, 480 )
							Lrg:registerEventHandler( "transition_complete_keyframe", LrgFrame4 )
						end
					end
					
					if event.interrupted then
						LrgFrame3( Lrg, event )
						return 
					else
						Lrg:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						Lrg:setLeftRight( true, false, -14, 466 )
						Lrg:registerEventHandler( "transition_complete_keyframe", LrgFrame3 )
					end
				end
				
				Lrg:completeAnimation()
				self.Lrg:setLeftRight( true, false, 0, 480 )
				self.Lrg:setTopBottom( true, false, 0, 120 )
				LrgFrame2( Lrg, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

