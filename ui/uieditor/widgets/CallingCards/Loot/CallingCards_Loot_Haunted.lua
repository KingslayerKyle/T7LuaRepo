-- f28d4b6b582eb4243b80602c24fb35ea
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_GoldFrame" )

CoD.CallingCards_Loot_Haunted = InheritFrom( LUI.UIElement )
CoD.CallingCards_Loot_Haunted.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_Loot_Haunted )
	self.id = "CallingCards_Loot_Haunted"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 480 )
	BG:setTopBottom( true, false, 0, 120 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_haunted_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 326, 427 )
	Image0:setTopBottom( true, false, -2, 82 )
	Image0:setImage( RegisterImage( "uie_t7_callingcard_haunted_eyesglow" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local fire1 = LUI.UIImage.new()
	fire1:setLeftRight( true, false, 286, 480 )
	fire1:setTopBottom( true, false, -29, 55 )
	fire1:setImage( RegisterImage( "uie_t7_callingcard_haunted_fire1" ) )
	fire1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fire1 )
	self.fire1 = fire1
	
	local fire2 = LUI.UIImage.new()
	fire2:setLeftRight( true, false, 286, 480 )
	fire2:setTopBottom( true, false, -29, 55 )
	fire2:setImage( RegisterImage( "uie_t7_callingcard_haunted_fire2" ) )
	fire2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fire2 )
	self.fire2 = fire2
	
	local fire3 = LUI.UIImage.new()
	fire3:setLeftRight( true, false, 286, 480 )
	fire3:setTopBottom( true, false, -29, 55 )
	fire3:setImage( RegisterImage( "uie_t7_callingcard_haunted_fire3" ) )
	fire3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fire3 )
	self.fire3 = fire3
	
	local fire4 = LUI.UIImage.new()
	fire4:setLeftRight( true, false, 286, 480 )
	fire4:setTopBottom( true, false, -29, 55 )
	fire4:setImage( RegisterImage( "uie_t7_callingcard_haunted_fire4" ) )
	fire4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fire4 )
	self.fire4 = fire4
	
	local fire5 = LUI.UIImage.new()
	fire5:setLeftRight( true, false, 286, 480 )
	fire5:setTopBottom( true, false, -29, 55 )
	fire5:setImage( RegisterImage( "uie_t7_callingcard_haunted_fire5" ) )
	fire5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fire5 )
	self.fire5 = fire5
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 170.67, 502 )
	Glow:setTopBottom( true, false, -170, 549.63 )
	Glow:setRGB( 0.27, 0.8, 1 )
	Glow:setAlpha( 0 )
	Glow:setZRot( 90 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local CallingCardsGoldFrame = CoD.CallingCards_GoldFrame.new( menu, controller )
	CallingCardsGoldFrame:setLeftRight( true, true, 0, 0 )
	CallingCardsGoldFrame:setTopBottom( true, true, 0, 0 )
	self:addElement( CallingCardsGoldFrame )
	self.CallingCardsGoldFrame = CallingCardsGoldFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								local Image0Frame6 = function ( Image0, event )
									local Image0Frame7 = function ( Image0, event )
										local Image0Frame8 = function ( Image0, event )
											local Image0Frame9 = function ( Image0, event )
												if not event.interrupted then
													Image0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
												end
												Image0:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( Image0, event )
												else
													Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Image0Frame9( Image0, event )
												return 
											else
												Image0:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
												Image0:setAlpha( 0 )
												Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame9 )
											end
										end
										
										if event.interrupted then
											Image0Frame8( Image0, event )
											return 
										else
											Image0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
											Image0:setAlpha( 1 )
											Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame8 )
										end
									end
									
									if event.interrupted then
										Image0Frame7( Image0, event )
										return 
									else
										Image0:beginAnimation( "keyframe", 930, false, false, CoD.TweenType.Linear )
										Image0:setAlpha( 0 )
										Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame7 )
									end
								end
								
								if event.interrupted then
									Image0Frame6( Image0, event )
									return 
								else
									Image0:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
									Image0:setAlpha( 1 )
									Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame6 )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								Image0:setAlpha( 0 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							Image0:setAlpha( 1 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						Image0:setAlpha( 0 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				Image0Frame2( Image0, {} )
				local fire1Frame2 = function ( fire1, event )
					local fire1Frame3 = function ( fire1, event )
						local fire1Frame4 = function ( fire1, event )
							if not event.interrupted then
								fire1:beginAnimation( "keyframe", 760, false, false, CoD.TweenType.Linear )
							end
							fire1:setAlpha( 0 )
							fire1:setScale( 1.4 )
							if event.interrupted then
								self.clipFinished( fire1, event )
							else
								fire1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							fire1Frame4( fire1, event )
							return 
						else
							fire1:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
							fire1:setAlpha( 1 )
							fire1:registerEventHandler( "transition_complete_keyframe", fire1Frame4 )
						end
					end
					
					if event.interrupted then
						fire1Frame3( fire1, event )
						return 
					else
						fire1:beginAnimation( "keyframe", 1409, false, false, CoD.TweenType.Linear )
						fire1:registerEventHandler( "transition_complete_keyframe", fire1Frame3 )
					end
				end
				
				fire1:completeAnimation()
				self.fire1:setAlpha( 0 )
				self.fire1:setScale( 1.4 )
				fire1Frame2( fire1, {} )
				local fire2Frame2 = function ( fire2, event )
					local fire2Frame3 = function ( fire2, event )
						local fire2Frame4 = function ( fire2, event )
							if not event.interrupted then
								fire2:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
							end
							fire2:setAlpha( 0 )
							fire2:setScale( 1.1 )
							if event.interrupted then
								self.clipFinished( fire2, event )
							else
								fire2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							fire2Frame4( fire2, event )
							return 
						else
							fire2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							fire2:setAlpha( 1 )
							fire2:registerEventHandler( "transition_complete_keyframe", fire2Frame4 )
						end
					end
					
					if event.interrupted then
						fire2Frame3( fire2, event )
						return 
					else
						fire2:beginAnimation( "keyframe", 1179, false, false, CoD.TweenType.Linear )
						fire2:registerEventHandler( "transition_complete_keyframe", fire2Frame3 )
					end
				end
				
				fire2:completeAnimation()
				self.fire2:setAlpha( 0 )
				self.fire2:setScale( 1.1 )
				fire2Frame2( fire2, {} )
				local f2_local3 = function ( f17_arg0, f17_arg1 )
					local f17_local0 = function ( f18_arg0, f18_arg1 )
						if not f18_arg1.interrupted then
							f18_arg0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
						end
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
						f17_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						f17_arg0:setAlpha( 1 )
						f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
					end
				end
				
				fire3:beginAnimation( "keyframe", 1049, false, false, CoD.TweenType.Linear )
				fire3:setAlpha( 0 )
				fire3:registerEventHandler( "transition_complete_keyframe", f2_local3 )
				local f2_local4 = function ( f19_arg0, f19_arg1 )
					local f19_local0 = function ( f20_arg0, f20_arg1 )
						if not f20_arg1.interrupted then
							f20_arg0:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
						end
						f20_arg0:setAlpha( 0 )
						if f20_arg1.interrupted then
							self.clipFinished( f20_arg0, f20_arg1 )
						else
							f20_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f19_arg1.interrupted then
						f19_local0( f19_arg0, f19_arg1 )
						return 
					else
						f19_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						f19_arg0:setAlpha( 1 )
						f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
					end
				end
				
				fire4:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				fire4:setAlpha( 0 )
				fire4:registerEventHandler( "transition_complete_keyframe", f2_local4 )
				local fire5Frame2 = function ( fire5, event )
					local fire5Frame3 = function ( fire5, event )
						local fire5Frame4 = function ( fire5, event )
							if not event.interrupted then
								fire5:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							fire5:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( fire5, event )
							else
								fire5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							fire5Frame4( fire5, event )
							return 
						else
							fire5:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							fire5:registerEventHandler( "transition_complete_keyframe", fire5Frame4 )
						end
					end
					
					if event.interrupted then
						fire5Frame3( fire5, event )
						return 
					else
						fire5:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						fire5:setAlpha( 1 )
						fire5:registerEventHandler( "transition_complete_keyframe", fire5Frame3 )
					end
				end
				
				fire5:completeAnimation()
				self.fire5:setAlpha( 0 )
				fire5Frame2( fire5, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										if not event.interrupted then
											Glow:beginAnimation( "keyframe", 630, false, false, CoD.TweenType.Linear )
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
										Glow:beginAnimation( "keyframe", 369, false, false, CoD.TweenType.Linear )
										Glow:setAlpha( 0.66 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsGoldFrame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

