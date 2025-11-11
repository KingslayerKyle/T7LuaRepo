require( "ui.uieditor.widgets.CallingCards.CallingCards_GoldFrame" )

CoD.CallingCards_Loot_EpicSpaceBattle = InheritFrom( LUI.UIElement )
CoD.CallingCards_Loot_EpicSpaceBattle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_Loot_EpicSpaceBattle )
	self.id = "CallingCards_Loot_EpicSpaceBattle"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 0, 720 )
	Image0:setTopBottom( 0, 0, 0, 180 )
	Image0:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_bg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 0, 720 )
	Image1:setTopBottom( 0, 0, 0, 180 )
	Image1:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_bg2" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( 0, 0, 0, 720 )
	Image10:setTopBottom( 0, 0, 0, 180 )
	Image10:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_bg3" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local ship = LUI.UIImage.new()
	ship:setLeftRight( 0, 0, 442, 622 )
	ship:setTopBottom( 0, 0, 49, 175 )
	ship:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_ship2" ) )
	self:addElement( ship )
	self.ship = ship
	
	local explode = LUI.UIImage.new()
	explode:setLeftRight( 0, 0, 564, 744 )
	explode:setTopBottom( 0, 0, 54, 180 )
	explode:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_explode" ) )
	self:addElement( explode )
	self.explode = explode
	
	local explode1 = LUI.UIImage.new()
	explode1:setLeftRight( 0, 0, 568, 748 )
	explode1:setTopBottom( 0, 0, 39, 165 )
	explode1:setScale( 1.7 )
	explode1:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_explode" ) )
	self:addElement( explode1 )
	self.explode1 = explode1
	
	local explode0 = LUI.UIImage.new()
	explode0:setLeftRight( 0, 0, 0, 180 )
	explode0:setTopBottom( 0, 0, 0, 126 )
	explode0:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_ship1" ) )
	self:addElement( explode0 )
	self.explode0 = explode0
	
	local bullets = LUI.UIImage.new()
	bullets:setLeftRight( 0, 0, 0, 720 )
	bullets:setTopBottom( 0, 0, -23, 247 )
	bullets:setZRot( 13 )
	bullets:setScale( 1.1 )
	bullets:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_bullets" ) )
	bullets:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	bullets:setShaderVector( 0, 1, 1, 0, 0 )
	bullets:setShaderVector( 1, 0.6, 0, 0, 0 )
	self:addElement( bullets )
	self.bullets = bullets
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( 0, 0, 0, 720 )
	Image100:setTopBottom( 0, 0, 0, 180 )
	Image100:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_rockets" ) )
	self:addElement( Image100 )
	self.Image100 = Image100
	
	local CallingCardsGoldFrame = CoD.CallingCards_GoldFrame.new( menu, controller )
	CallingCardsGoldFrame:setLeftRight( 0, 1, 0, 0 )
	CallingCardsGoldFrame:setTopBottom( 0, 1, 0, 0 )
	self:addElement( CallingCardsGoldFrame )
	self.CallingCardsGoldFrame = CallingCardsGoldFrame
	
	self.resetProperties = function ()
		Image10:completeAnimation()
		explode1:completeAnimation()
		explode:completeAnimation()
		ship:completeAnimation()
		explode0:completeAnimation()
		Image10:setAlpha( 1 )
		explode1:setLeftRight( 0, 0, 568, 748 )
		explode1:setTopBottom( 0, 0, 39, 165 )
		explode1:setAlpha( 1 )
		explode1:setScale( 1.7 )
		explode:setLeftRight( 0, 0, 564, 744 )
		explode:setTopBottom( 0, 0, 54, 180 )
		ship:setLeftRight( 0, 0, 442, 622 )
		ship:setTopBottom( 0, 0, 49, 175 )
		explode0:setLeftRight( 0, 0, 0, 180 )
		explode0:setTopBottom( 0, 0, 0, 126 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local Image10Frame2 = function ( Image10, event )
					local Image10Frame3 = function ( Image10, event )
						local Image10Frame4 = function ( Image10, event )
							local Image10Frame5 = function ( Image10, event )
								local Image10Frame6 = function ( Image10, event )
									local Image10Frame7 = function ( Image10, event )
										local Image10Frame8 = function ( Image10, event )
											local Image10Frame9 = function ( Image10, event )
												local Image10Frame10 = function ( Image10, event )
													local Image10Frame11 = function ( Image10, event )
														if not event.interrupted then
															Image10:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														end
														Image10:setAlpha( 1 )
														if event.interrupted then
															self.clipFinished( Image10, event )
														else
															Image10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														Image10Frame11( Image10, event )
														return 
													else
														Image10:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
														Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame11 )
													end
												end
												
												if event.interrupted then
													Image10Frame10( Image10, event )
													return 
												else
													Image10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
													Image10:setAlpha( 0 )
													Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame10 )
												end
											end
											
											if event.interrupted then
												Image10Frame9( Image10, event )
												return 
											else
												Image10:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
												Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame9 )
											end
										end
										
										if event.interrupted then
											Image10Frame8( Image10, event )
											return 
										else
											Image10:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
											Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame8 )
										end
									end
									
									if event.interrupted then
										Image10Frame7( Image10, event )
										return 
									else
										Image10:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
										Image10:setAlpha( 1 )
										Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame7 )
									end
								end
								
								if event.interrupted then
									Image10Frame6( Image10, event )
									return 
								else
									Image10:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									Image10:setAlpha( 0 )
									Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame6 )
								end
							end
							
							if event.interrupted then
								Image10Frame5( Image10, event )
								return 
							else
								Image10:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
								Image10:setAlpha( 1 )
								Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame5 )
							end
						end
						
						if event.interrupted then
							Image10Frame4( Image10, event )
							return 
						else
							Image10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							Image10:setAlpha( 0 )
							Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame4 )
						end
					end
					
					if event.interrupted then
						Image10Frame3( Image10, event )
						return 
					else
						Image10:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame3 )
					end
				end
				
				Image10:completeAnimation()
				self.Image10:setAlpha( 1 )
				Image10Frame2( Image10, {} )
				local shipFrame2 = function ( ship, event )
					local shipFrame3 = function ( ship, event )
						if not event.interrupted then
							ship:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
						end
						ship:setLeftRight( 0, 0, 442, 622 )
						ship:setTopBottom( 0, 0, 49, 175 )
						if event.interrupted then
							self.clipFinished( ship, event )
						else
							ship:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						shipFrame3( ship, event )
						return 
					else
						ship:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						ship:setLeftRight( 0, 0, 429, 609 )
						ship:setTopBottom( 0, 0, 54, 180 )
						ship:registerEventHandler( "transition_complete_keyframe", shipFrame3 )
					end
				end
				
				ship:completeAnimation()
				self.ship:setLeftRight( 0, 0, 442, 622 )
				self.ship:setTopBottom( 0, 0, 49, 175 )
				shipFrame2( ship, {} )
				explode:completeAnimation()
				self.explode:setLeftRight( 0, 0, 564, 744 )
				self.explode:setTopBottom( 0, 0, 59, 185 )
				self.clipFinished( explode, {} )
				local explode1Frame2 = function ( explode1, event )
					if not event.interrupted then
						explode1:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
					end
					explode1:setLeftRight( 0, 0, 564, 744 )
					explode1:setTopBottom( 0, 0, 59, 185 )
					explode1:setAlpha( 0 )
					explode1:setScale( 1.7 )
					if event.interrupted then
						self.clipFinished( explode1, event )
					else
						explode1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				explode1:completeAnimation()
				self.explode1:setLeftRight( 0, 0, 564, 744 )
				self.explode1:setTopBottom( 0, 0, 59, 185 )
				self.explode1:setAlpha( 1 )
				self.explode1:setScale( 1 )
				explode1Frame2( explode1, {} )
				local explode0Frame2 = function ( explode0, event )
					local explode0Frame3 = function ( explode0, event )
						if not event.interrupted then
							explode0:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						end
						explode0:setLeftRight( 0, 0, 0, 180 )
						explode0:setTopBottom( 0, 0, 0, 126 )
						if event.interrupted then
							self.clipFinished( explode0, event )
						else
							explode0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						explode0Frame3( explode0, event )
						return 
					else
						explode0:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						explode0:setLeftRight( 0, 0, -8, 172 )
						explode0:registerEventHandler( "transition_complete_keyframe", explode0Frame3 )
					end
				end
				
				explode0:completeAnimation()
				self.explode0:setLeftRight( 0, 0, 0, 180 )
				self.explode0:setTopBottom( 0, 0, 0, 126 )
				explode0Frame2( explode0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardsGoldFrame:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

