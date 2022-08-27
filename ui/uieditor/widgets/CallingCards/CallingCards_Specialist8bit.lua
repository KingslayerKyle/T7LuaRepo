-- 6bd7a01571054c515ab8b951f86c18c7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_Specialist8bit_Reaper" )

CoD.CallingCards_Specialist8bit = InheritFrom( LUI.UIElement )
CoD.CallingCards_Specialist8bit.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_Specialist8bit )
	self.id = "CallingCards_Specialist8bit"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local bg1 = LUI.UIImage.new()
	bg1:setLeftRight( true, false, 0, 480 )
	bg1:setTopBottom( true, false, 0, 120 )
	bg1:setImage( RegisterImage( "uie_t7_callingcard_mp_specialist8bit_bg" ) )
	self:addElement( bg1 )
	self.bg1 = bg1
	
	local bg2 = LUI.UIImage.new()
	bg2:setLeftRight( true, false, 0, 480 )
	bg2:setTopBottom( true, false, 0, 120 )
	bg2:setAlpha( 0 )
	bg2:setImage( RegisterImage( "uie_t7_callingcard_mp_specialist8bit_bg2" ) )
	self:addElement( bg2 )
	self.bg2 = bg2
	
	local mask = LUI.UIImage.new()
	mask:setLeftRight( true, false, -128, 0 )
	mask:setTopBottom( true, false, -112, 231 )
	mask:setRGB( 0.27, 0.27, 0.27 )
	self:addElement( mask )
	self.mask = mask
	
	local white = LUI.UIImage.new()
	white:setLeftRight( true, false, 266, 277 )
	white:setTopBottom( true, false, 59.22, 63.78 )
	white:setRGB( 0.41, 0.41, 0.41 )
	self:addElement( white )
	self.white = white
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 266, 277 )
	Image4:setTopBottom( true, false, 88.22, 92.78 )
	Image4:setRGB( 0.41, 0.41, 0.41 )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local CallingCardsSpecialist8bitReaper = CoD.CallingCards_Specialist8bit_Reaper.new( menu, controller )
	CallingCardsSpecialist8bitReaper:setLeftRight( true, false, 10, 480 )
	CallingCardsSpecialist8bitReaper:setTopBottom( true, false, 0, 120 )
	self:addElement( CallingCardsSpecialist8bitReaper )
	self.CallingCardsSpecialist8bitReaper = CallingCardsSpecialist8bitReaper
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local bg2Frame2 = function ( bg2, event )
					local bg2Frame3 = function ( bg2, event )
						if not event.interrupted then
							bg2:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						end
						bg2:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( bg2, event )
						else
							bg2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						bg2Frame3( bg2, event )
						return 
					else
						bg2:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						bg2:setAlpha( 0.66 )
						bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame3 )
					end
				end
				
				bg2:completeAnimation()
				self.bg2:setAlpha( 0 )
				bg2Frame2( bg2, {} )
				mask:completeAnimation()
				self.mask:setRGB( 0.24, 0.24, 0.24 )
				self.clipFinished( mask, {} )
				local whiteFrame2 = function ( white, event )
					local whiteFrame3 = function ( white, event )
						local whiteFrame4 = function ( white, event )
							local whiteFrame5 = function ( white, event )
								local whiteFrame6 = function ( white, event )
									local whiteFrame7 = function ( white, event )
										local whiteFrame8 = function ( white, event )
											local whiteFrame9 = function ( white, event )
												local whiteFrame10 = function ( white, event )
													local whiteFrame11 = function ( white, event )
														if not event.interrupted then
															white:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
														end
														white:setLeftRight( true, false, 266, 277 )
														white:setTopBottom( true, false, 57.72, 62.28 )
														white:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( white, event )
														else
															white:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														whiteFrame11( white, event )
														return 
													else
														white:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														white:setAlpha( 1 )
														white:registerEventHandler( "transition_complete_keyframe", whiteFrame11 )
													end
												end
												
												if event.interrupted then
													whiteFrame10( white, event )
													return 
												else
													white:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
													white:registerEventHandler( "transition_complete_keyframe", whiteFrame10 )
												end
											end
											
											if event.interrupted then
												whiteFrame9( white, event )
												return 
											else
												white:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
												white:setAlpha( 0 )
												white:registerEventHandler( "transition_complete_keyframe", whiteFrame9 )
											end
										end
										
										if event.interrupted then
											whiteFrame8( white, event )
											return 
										else
											white:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											white:setAlpha( 1 )
											white:registerEventHandler( "transition_complete_keyframe", whiteFrame8 )
										end
									end
									
									if event.interrupted then
										whiteFrame7( white, event )
										return 
									else
										white:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
										white:registerEventHandler( "transition_complete_keyframe", whiteFrame7 )
									end
								end
								
								if event.interrupted then
									whiteFrame6( white, event )
									return 
								else
									white:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									white:setAlpha( 0 )
									white:registerEventHandler( "transition_complete_keyframe", whiteFrame6 )
								end
							end
							
							if event.interrupted then
								whiteFrame5( white, event )
								return 
							else
								white:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								white:setAlpha( 1 )
								white:registerEventHandler( "transition_complete_keyframe", whiteFrame5 )
							end
						end
						
						if event.interrupted then
							whiteFrame4( white, event )
							return 
						else
							white:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
							white:registerEventHandler( "transition_complete_keyframe", whiteFrame4 )
						end
					end
					
					if event.interrupted then
						whiteFrame3( white, event )
						return 
					else
						white:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						white:setAlpha( 0 )
						white:registerEventHandler( "transition_complete_keyframe", whiteFrame3 )
					end
				end
				
				white:completeAnimation()
				self.white:setLeftRight( true, false, 266, 277 )
				self.white:setTopBottom( true, false, 57.72, 62.28 )
				self.white:setAlpha( 1 )
				whiteFrame2( white, {} )
				local Image4Frame2 = function ( Image4, event )
					local Image4Frame3 = function ( Image4, event )
						local Image4Frame4 = function ( Image4, event )
							local Image4Frame5 = function ( Image4, event )
								local Image4Frame6 = function ( Image4, event )
									local Image4Frame7 = function ( Image4, event )
										local Image4Frame8 = function ( Image4, event )
											local Image4Frame9 = function ( Image4, event )
												local Image4Frame10 = function ( Image4, event )
													local Image4Frame11 = function ( Image4, event )
														if not event.interrupted then
															Image4:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
														end
														Image4:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( Image4, event )
														else
															Image4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														Image4Frame11( Image4, event )
														return 
													else
														Image4:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														Image4:setAlpha( 1 )
														Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame11 )
													end
												end
												
												if event.interrupted then
													Image4Frame10( Image4, event )
													return 
												else
													Image4:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
													Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame10 )
												end
											end
											
											if event.interrupted then
												Image4Frame9( Image4, event )
												return 
											else
												Image4:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
												Image4:setAlpha( 0 )
												Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame9 )
											end
										end
										
										if event.interrupted then
											Image4Frame8( Image4, event )
											return 
										else
											Image4:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											Image4:setAlpha( 1 )
											Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame8 )
										end
									end
									
									if event.interrupted then
										Image4Frame7( Image4, event )
										return 
									else
										Image4:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
										Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame7 )
									end
								end
								
								if event.interrupted then
									Image4Frame6( Image4, event )
									return 
								else
									Image4:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									Image4:setAlpha( 0 )
									Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame6 )
								end
							end
							
							if event.interrupted then
								Image4Frame5( Image4, event )
								return 
							else
								Image4:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								Image4:setAlpha( 1 )
								Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame5 )
							end
						end
						
						if event.interrupted then
							Image4Frame4( Image4, event )
							return 
						else
							Image4:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
							Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame4 )
						end
					end
					
					if event.interrupted then
						Image4Frame3( Image4, event )
						return 
					else
						Image4:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Image4:setAlpha( 0 )
						Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame3 )
					end
				end
				
				Image4:completeAnimation()
				self.Image4:setAlpha( 1 )
				Image4Frame2( Image4, {} )
				local CallingCardsSpecialist8bitReaperFrame2 = function ( CallingCardsSpecialist8bitReaper, event )
					local CallingCardsSpecialist8bitReaperFrame3 = function ( CallingCardsSpecialist8bitReaper, event )
						if not event.interrupted then
							CallingCardsSpecialist8bitReaper:beginAnimation( "keyframe", 789, false, false, CoD.TweenType.Linear )
						end
						CallingCardsSpecialist8bitReaper:setLeftRight( true, false, 10, 480 )
						CallingCardsSpecialist8bitReaper:setTopBottom( true, false, 0, 120 )
						CallingCardsSpecialist8bitReaper:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CallingCardsSpecialist8bitReaper, event )
						else
							CallingCardsSpecialist8bitReaper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CallingCardsSpecialist8bitReaperFrame3( CallingCardsSpecialist8bitReaper, event )
						return 
					else
						CallingCardsSpecialist8bitReaper:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
						CallingCardsSpecialist8bitReaper:setLeftRight( true, false, -6, 464 )
						CallingCardsSpecialist8bitReaper:registerEventHandler( "transition_complete_keyframe", CallingCardsSpecialist8bitReaperFrame3 )
					end
				end
				
				CallingCardsSpecialist8bitReaper:completeAnimation()
				self.CallingCardsSpecialist8bitReaper:setLeftRight( true, false, 10, 480 )
				self.CallingCardsSpecialist8bitReaper:setTopBottom( true, false, 0, 120 )
				self.CallingCardsSpecialist8bitReaper:setAlpha( 1 )
				CallingCardsSpecialist8bitReaperFrame2( CallingCardsSpecialist8bitReaper, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsSpecialist8bitReaper:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

