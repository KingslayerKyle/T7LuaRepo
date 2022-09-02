-- d92c45f9101cfce09ce64e1975e642ec
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_loot_EpicSpaceBattle2 = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_EpicSpaceBattle2.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_loot_EpicSpaceBattle2 )
	self.id = "CallingCards_loot_EpicSpaceBattle2"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 480 )
	Image0:setTopBottom( true, false, 0, 120 )
	Image0:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_bg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 480 )
	Image1:setTopBottom( true, false, 0, 120 )
	Image1:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_bg2" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 0, 480 )
	Image10:setTopBottom( true, false, 0, 120 )
	Image10:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_bg3" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local ship = LUI.UIImage.new()
	ship:setLeftRight( true, false, 295, 415 )
	ship:setTopBottom( true, false, 33, 117 )
	ship:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_ship2" ) )
	self:addElement( ship )
	self.ship = ship
	
	local explode = LUI.UIImage.new()
	explode:setLeftRight( true, false, 376, 496 )
	explode:setTopBottom( true, false, 36, 120 )
	explode:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_explode" ) )
	self:addElement( explode )
	self.explode = explode
	
	local explode1 = LUI.UIImage.new()
	explode1:setLeftRight( true, false, 379, 499 )
	explode1:setTopBottom( true, false, 26, 110 )
	explode1:setScale( 1.7 )
	explode1:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_explode" ) )
	self:addElement( explode1 )
	self.explode1 = explode1
	
	local explode0 = LUI.UIImage.new()
	explode0:setLeftRight( true, false, 0, 120 )
	explode0:setTopBottom( true, false, 0, 84 )
	explode0:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_ship1" ) )
	self:addElement( explode0 )
	self.explode0 = explode0
	
	local bullets = LUI.UIImage.new()
	bullets:setLeftRight( true, false, 0, 480 )
	bullets:setTopBottom( true, false, -15, 165 )
	bullets:setZRot( 13 )
	bullets:setScale( 1.1 )
	bullets:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_bullets" ) )
	bullets:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	bullets:setShaderVector( 0, 1, 1, 0, 0 )
	bullets:setShaderVector( 1, 0.6, 0, 0, 0 )
	self:addElement( bullets )
	self.bullets = bullets
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( true, false, 0, 480 )
	Image100:setTopBottom( true, false, 0, 120 )
	Image100:setImage( RegisterImage( "uie_t7_loot_callingcard_epicspacebattle_master_rockets" ) )
	self:addElement( Image100 )
	self.Image100 = Image100
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
						ship:setLeftRight( true, false, 295, 415 )
						ship:setTopBottom( true, false, 33, 117 )
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
						ship:setLeftRight( true, false, 286, 406 )
						ship:setTopBottom( true, false, 36, 120 )
						ship:registerEventHandler( "transition_complete_keyframe", shipFrame3 )
					end
				end
				
				ship:completeAnimation()
				self.ship:setLeftRight( true, false, 295, 415 )
				self.ship:setTopBottom( true, false, 33, 117 )
				shipFrame2( ship, {} )

				explode:completeAnimation()
				self.explode:setLeftRight( true, false, 376, 496 )
				self.explode:setTopBottom( true, false, 39, 123 )
				self.clipFinished( explode, {} )
				local explode1Frame2 = function ( explode1, event )
					if not event.interrupted then
						explode1:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
					end
					explode1:setLeftRight( true, false, 376, 496 )
					explode1:setTopBottom( true, false, 39, 123 )
					explode1:setAlpha( 0 )
					explode1:setScale( 1.7 )
					if event.interrupted then
						self.clipFinished( explode1, event )
					else
						explode1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				explode1:completeAnimation()
				self.explode1:setLeftRight( true, false, 376, 496 )
				self.explode1:setTopBottom( true, false, 39, 123 )
				self.explode1:setAlpha( 1 )
				self.explode1:setScale( 1 )
				explode1Frame2( explode1, {} )
				local explode0Frame2 = function ( explode0, event )
					local explode0Frame3 = function ( explode0, event )
						if not event.interrupted then
							explode0:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						end
						explode0:setLeftRight( true, false, 0, 120 )
						explode0:setTopBottom( true, false, 0, 84 )
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
						explode0:setLeftRight( true, false, -5, 115 )
						explode0:registerEventHandler( "transition_complete_keyframe", explode0Frame3 )
					end
				end
				
				explode0:completeAnimation()
				self.explode0:setLeftRight( true, false, 0, 120 )
				self.explode0:setTopBottom( true, false, 0, 84 )
				explode0Frame2( explode0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

