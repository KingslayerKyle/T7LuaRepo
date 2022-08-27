-- b9cc2822620e2cc7778eaeabf033e08c
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_loot_FoodFight = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_FoodFight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_loot_FoodFight )
	self.id = "CallingCards_loot_FoodFight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -128, 712 )
	Image0:setTopBottom( true, false, 0, 120 )
	Image0:setImage( RegisterImage( "uie_t7_loot_callingcard_food_master_bg" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Image0:setShaderVector( 0, 1, 1, 0, 0 )
	Image0:setShaderVector( 1, 0.5, 0, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 480 )
	Image1:setTopBottom( true, false, 0, 120 )
	Image1:setImage( RegisterImage( "uie_t7_loot_callingcard_food_master_pizza1" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 0, 480 )
	Image2:setTopBottom( true, false, 0, 120 )
	Image2:setImage( RegisterImage( "uie_t7_loot_callingcard_food_master_pizza2" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( true, false, 397, 429 )
	Image20:setTopBottom( true, false, 88, 120 )
	Image20:setImage( RegisterImage( "uie_t7_loot_callingcard_food_master_pizza3" ) )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						local Image2Frame4 = function ( Image2, event )
							local Image2Frame5 = function ( Image2, event )
								local Image2Frame6 = function ( Image2, event )
									local Image2Frame7 = function ( Image2, event )
										local Image2Frame8 = function ( Image2, event )
											local Image2Frame9 = function ( Image2, event )
												local Image2Frame10 = function ( Image2, event )
													if not event.interrupted then
														Image2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
													end
													Image2:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( Image2, event )
													else
														Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													Image2Frame10( Image2, event )
													return 
												else
													Image2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
													Image2:setAlpha( 1 )
													Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame10 )
												end
											end
											
											if event.interrupted then
												Image2Frame9( Image2, event )
												return 
											else
												Image2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												Image2:setAlpha( 0 )
												Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame9 )
											end
										end
										
										if event.interrupted then
											Image2Frame8( Image2, event )
											return 
										else
											Image2:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											Image2:setAlpha( 1 )
											Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame8 )
										end
									end
									
									if event.interrupted then
										Image2Frame7( Image2, event )
										return 
									else
										Image2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
										Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame7 )
									end
								end
								
								if event.interrupted then
									Image2Frame6( Image2, event )
									return 
								else
									Image2:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									Image2:setAlpha( 0 )
									Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame6 )
								end
							end
							
							if event.interrupted then
								Image2Frame5( Image2, event )
								return 
							else
								Image2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								Image2:setAlpha( 1 )
								Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame5 )
							end
						end
						
						if event.interrupted then
							Image2Frame4( Image2, event )
							return 
						else
							Image2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Image2:setAlpha( 0 )
							Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame4 )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Image2:setAlpha( 1 )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				Image2Frame2( Image2, {} )
				local Image20Frame2 = function ( Image20, event )
					if not event.interrupted then
						Image20:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
					end
					Image20:setLeftRight( true, false, 375, 407 )
					Image20:setTopBottom( true, false, 112, 144 )
					Image20:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image20, event )
					else
						Image20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image20:completeAnimation()
				self.Image20:setLeftRight( true, false, 409, 441 )
				self.Image20:setTopBottom( true, false, 72, 104 )
				self.Image20:setAlpha( 1 )
				Image20Frame2( Image20, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

