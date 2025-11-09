require( "ui.uieditor.widgets.CallingCards.CallingCards_GoldFrame" )

CoD.CallingCards_loot_GirlPower = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_GirlPower.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_loot_GirlPower )
	self.id = "CallingCards_loot_GirlPower"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 480 )
	Image0:setTopBottom( true, false, 0, 120 )
	Image0:setImage( RegisterImage( "uie_t7_loot_callingcard_girlpower_master_bg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local fire1 = LUI.UIImage.new()
	fire1:setLeftRight( true, false, 0, 480 )
	fire1:setTopBottom( true, false, 0, 120 )
	fire1:setImage( RegisterImage( "uie_t7_loot_callingcard_girlpower_master_fire1" ) )
	self:addElement( fire1 )
	self.fire1 = fire1
	
	local fire2 = LUI.UIImage.new()
	fire2:setLeftRight( true, false, 0, 480 )
	fire2:setTopBottom( true, false, 0, 120 )
	fire2:setImage( RegisterImage( "uie_t7_loot_callingcard_girlpower_master_fire2" ) )
	self:addElement( fire2 )
	self.fire2 = fire2
	
	local fire3 = LUI.UIImage.new()
	fire3:setLeftRight( true, false, 0, 480 )
	fire3:setTopBottom( true, false, 0, 120 )
	fire3:setImage( RegisterImage( "uie_t7_loot_callingcard_girlpower_master_fire3" ) )
	self:addElement( fire3 )
	self.fire3 = fire3
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( true, false, 0, 480 )
	Image40:setTopBottom( true, false, 0, 120 )
	Image40:setImage( RegisterImage( "uie_t7_loot_callingcard_girlpower_master_girl2" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image300 = LUI.UIImage.new()
	Image300:setLeftRight( true, false, 0, 480 )
	Image300:setTopBottom( true, false, 0, 120 )
	Image300:setImage( RegisterImage( "uie_t7_loot_callingcard_girlpower_master_girl" ) )
	self:addElement( Image300 )
	self.Image300 = Image300
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 0, 480 )
	Image4:setTopBottom( true, false, 0, 120 )
	Image4:setImage( RegisterImage( "uie_t7_loot_callingcard_girlpower_master_wiz2" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image3000 = LUI.UIImage.new()
	Image3000:setLeftRight( true, false, 0, 480 )
	Image3000:setTopBottom( true, false, 0, 120 )
	Image3000:setImage( RegisterImage( "uie_t7_loot_callingcard_girlpower_master_wiz" ) )
	self:addElement( Image3000 )
	self.Image3000 = Image3000
	
	local CallingCardsGoldFrame = CoD.CallingCards_GoldFrame.new( menu, controller )
	CallingCardsGoldFrame:setLeftRight( true, true, 0, 0 )
	CallingCardsGoldFrame:setTopBottom( true, true, 0, 0 )
	self:addElement( CallingCardsGoldFrame )
	self.CallingCardsGoldFrame = CallingCardsGoldFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
				local fire1Frame2 = function ( fire1, event )
					local fire1Frame3 = function ( fire1, event )
						local fire1Frame4 = function ( fire1, event )
							if not event.interrupted then
								fire1:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
							end
							fire1:setAlpha( 1 )
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
							fire1:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
							fire1:setAlpha( 1 )
							fire1:registerEventHandler( "transition_complete_keyframe", fire1Frame4 )
						end
					end
					
					if event.interrupted then
						fire1Frame3( fire1, event )
						return 
					else
						fire1:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						fire1:setAlpha( 0.25 )
						fire1:registerEventHandler( "transition_complete_keyframe", fire1Frame3 )
					end
				end
				
				fire1:completeAnimation()
				self.fire1:setAlpha( 1 )
				fire1Frame2( fire1, {} )
				local fire2Frame2 = function ( fire2, event )
					local fire2Frame3 = function ( fire2, event )
						local fire2Frame4 = function ( fire2, event )
							local fire2Frame5 = function ( fire2, event )
								local fire2Frame6 = function ( fire2, event )
									if not event.interrupted then
										fire2:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
									end
									fire2:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( fire2, event )
									else
										fire2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									fire2Frame6( fire2, event )
									return 
								else
									fire2:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
									fire2:setAlpha( 0 )
									fire2:registerEventHandler( "transition_complete_keyframe", fire2Frame6 )
								end
							end
							
							if event.interrupted then
								fire2Frame5( fire2, event )
								return 
							else
								fire2:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								fire2:registerEventHandler( "transition_complete_keyframe", fire2Frame5 )
							end
						end
						
						if event.interrupted then
							fire2Frame4( fire2, event )
							return 
						else
							fire2:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							fire2:setAlpha( 1 )
							fire2:registerEventHandler( "transition_complete_keyframe", fire2Frame4 )
						end
					end
					
					if event.interrupted then
						fire2Frame3( fire2, event )
						return 
					else
						fire2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						fire2:registerEventHandler( "transition_complete_keyframe", fire2Frame3 )
					end
				end
				
				fire2:completeAnimation()
				self.fire2:setAlpha( 0 )
				fire2Frame2( fire2, {} )
				local fire3Frame2 = function ( fire3, event )
					local fire3Frame3 = function ( fire3, event )
						local fire3Frame4 = function ( fire3, event )
							local fire3Frame5 = function ( fire3, event )
								local fire3Frame6 = function ( fire3, event )
									if not event.interrupted then
										fire3:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
									end
									fire3:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( fire3, event )
									else
										fire3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									fire3Frame6( fire3, event )
									return 
								else
									fire3:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
									fire3:setAlpha( 1 )
									fire3:registerEventHandler( "transition_complete_keyframe", fire3Frame6 )
								end
							end
							
							if event.interrupted then
								fire3Frame5( fire3, event )
								return 
							else
								fire3:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
								fire3:setAlpha( 0.54 )
								fire3:registerEventHandler( "transition_complete_keyframe", fire3Frame5 )
							end
						end
						
						if event.interrupted then
							fire3Frame4( fire3, event )
							return 
						else
							fire3:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							fire3:setAlpha( 1 )
							fire3:registerEventHandler( "transition_complete_keyframe", fire3Frame4 )
						end
					end
					
					if event.interrupted then
						fire3Frame3( fire3, event )
						return 
					else
						fire3:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						fire3:registerEventHandler( "transition_complete_keyframe", fire3Frame3 )
					end
				end
				
				fire3:completeAnimation()
				self.fire3:setAlpha( 0 )
				fire3Frame2( fire3, {} )
				local Image300Frame2 = function ( Image300, event )
					local Image300Frame3 = function ( Image300, event )
						local Image300Frame4 = function ( Image300, event )
							local Image300Frame5 = function ( Image300, event )
								if not event.interrupted then
									Image300:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
								end
								Image300:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Image300, event )
								else
									Image300:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image300Frame5( Image300, event )
								return 
							else
								Image300:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								Image300:setAlpha( 1 )
								Image300:registerEventHandler( "transition_complete_keyframe", Image300Frame5 )
							end
						end
						
						if event.interrupted then
							Image300Frame4( Image300, event )
							return 
						else
							Image300:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							Image300:setAlpha( 0.29 )
							Image300:registerEventHandler( "transition_complete_keyframe", Image300Frame4 )
						end
					end
					
					if event.interrupted then
						Image300Frame3( Image300, event )
						return 
					else
						Image300:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						Image300:setAlpha( 1 )
						Image300:registerEventHandler( "transition_complete_keyframe", Image300Frame3 )
					end
				end
				
				Image300:completeAnimation()
				self.Image300:setAlpha( 0 )
				Image300Frame2( Image300, {} )
				local Image3000Frame2 = function ( Image3000, event )
					local Image3000Frame3 = function ( Image3000, event )
						local Image3000Frame4 = function ( Image3000, event )
							local Image3000Frame5 = function ( Image3000, event )
								if not event.interrupted then
									Image3000:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
								end
								Image3000:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Image3000, event )
								else
									Image3000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image3000Frame5( Image3000, event )
								return 
							else
								Image3000:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
								Image3000:setAlpha( 1 )
								Image3000:registerEventHandler( "transition_complete_keyframe", Image3000Frame5 )
							end
						end
						
						if event.interrupted then
							Image3000Frame4( Image3000, event )
							return 
						else
							Image3000:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
							Image3000:setAlpha( 0 )
							Image3000:registerEventHandler( "transition_complete_keyframe", Image3000Frame4 )
						end
					end
					
					if event.interrupted then
						Image3000Frame3( Image3000, event )
						return 
					else
						Image3000:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						Image3000:setAlpha( 1 )
						Image3000:registerEventHandler( "transition_complete_keyframe", Image3000Frame3 )
					end
				end
				
				Image3000:completeAnimation()
				self.Image3000:setAlpha( 0 )
				Image3000Frame2( Image3000, {} )
				CallingCardsGoldFrame:completeAnimation()
				self.CallingCardsGoldFrame:setAlpha( 1 )
				self.clipFinished( CallingCardsGoldFrame, {} )
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

