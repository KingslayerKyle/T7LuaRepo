require( "ui.uieditor.widgets.CallingCards.CallingCards_GoldFrame" )

CoD.CallingCards_loot_CuteAnimals = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_CuteAnimals.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_loot_CuteAnimals )
	self.id = "CallingCards_loot_CuteAnimals"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 480 )
	Image0:setTopBottom( true, false, 0, 120 )
	Image0:setImage( RegisterImage( "uie_t7_loot_callingcard_cutie_animals_master_bg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 480 )
	Image1:setTopBottom( true, false, 0, 120 )
	Image1:setImage( RegisterImage( "uie_t7_loot_callingcard_cutie_animals_master_rays" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 0, 480 )
	Image2:setTopBottom( true, false, 0, 120 )
	Image2:setImage( RegisterImage( "uie_t7_loot_callingcard_cutie_animals_master_chicks" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( true, false, 0, 480 )
	Image20:setTopBottom( true, false, 0, 120 )
	Image20:setAlpha( 0 )
	Image20:setImage( RegisterImage( "uie_t7_loot_callingcard_cutie_animals_master_chicks2" ) )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	local CallingCardsGoldFrame = CoD.CallingCards_GoldFrame.new( menu, controller )
	CallingCardsGoldFrame:setLeftRight( true, true, 0, 0 )
	CallingCardsGoldFrame:setTopBottom( true, true, 0, 0 )
	self:addElement( CallingCardsGoldFrame )
	self.CallingCardsGoldFrame = CallingCardsGoldFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							if not event.interrupted then
								Image0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
							end
							Image0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( Image0, event )
							else
								Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
							Image0:setRGB( 1, 0.61, 0.79 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						Image0:setRGB( 0, 1, 0.59 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setRGB( 1, 1, 1 )
				Image0Frame2( Image0, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						if not event.interrupted then
							Image2:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
						end
						Image2:setScale( 1 )
						if event.interrupted then
							self.clipFinished( Image2, event )
						else
							Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						Image2:setScale( 1.1 )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setScale( 1 )
				Image2Frame2( Image2, {} )
				local Image20Frame2 = function ( Image20, event )
					local Image20Frame3 = function ( Image20, event )
						local Image20Frame4 = function ( Image20, event )
							local Image20Frame5 = function ( Image20, event )
								local Image20Frame6 = function ( Image20, event )
									local Image20Frame7 = function ( Image20, event )
										local Image20Frame8 = function ( Image20, event )
											local Image20Frame9 = function ( Image20, event )
												local Image20Frame10 = function ( Image20, event )
													if not event.interrupted then
														Image20:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													end
													Image20:setAlpha( 0 )
													Image20:setScale( 1 )
													if event.interrupted then
														self.clipFinished( Image20, event )
													else
														Image20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													Image20Frame10( Image20, event )
													return 
												else
													Image20:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
													Image20:setAlpha( 0 )
													Image20:setScale( 1.01 )
													Image20:registerEventHandler( "transition_complete_keyframe", Image20Frame10 )
												end
											end
											
											if event.interrupted then
												Image20Frame9( Image20, event )
												return 
											else
												Image20:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												Image20:setAlpha( 1 )
												Image20:registerEventHandler( "transition_complete_keyframe", Image20Frame9 )
											end
										end
										
										if event.interrupted then
											Image20Frame8( Image20, event )
											return 
										else
											Image20:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
											Image20:setScale( 1.03 )
											Image20:registerEventHandler( "transition_complete_keyframe", Image20Frame8 )
										end
									end
									
									if event.interrupted then
										Image20Frame7( Image20, event )
										return 
									else
										Image20:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
										Image20:setAlpha( 0 )
										Image20:setScale( 1.07 )
										Image20:registerEventHandler( "transition_complete_keyframe", Image20Frame7 )
									end
								end
								
								if event.interrupted then
									Image20Frame6( Image20, event )
									return 
								else
									Image20:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									Image20:setAlpha( 1 )
									Image20:registerEventHandler( "transition_complete_keyframe", Image20Frame6 )
								end
							end
							
							if event.interrupted then
								Image20Frame5( Image20, event )
								return 
							else
								Image20:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								Image20:setAlpha( 0 )
								Image20:setScale( 1.09 )
								Image20:registerEventHandler( "transition_complete_keyframe", Image20Frame5 )
							end
						end
						
						if event.interrupted then
							Image20Frame4( Image20, event )
							return 
						else
							Image20:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Image20:setAlpha( 1 )
							Image20:setScale( 1.1 )
							Image20:registerEventHandler( "transition_complete_keyframe", Image20Frame4 )
						end
					end
					
					if event.interrupted then
						Image20Frame3( Image20, event )
						return 
					else
						Image20:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						Image20:setScale( 1.08 )
						Image20:registerEventHandler( "transition_complete_keyframe", Image20Frame3 )
					end
				end
				
				Image20:completeAnimation()
				self.Image20:setAlpha( 0 )
				self.Image20:setScale( 1 )
				Image20Frame2( Image20, {} )
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

