-- 8b1a74aa53c96b35e92c062002caa656
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HashRingLargeInternal" )

CoD.VehicleGround_HashRingLarge = InheritFrom( LUI.UIElement )
CoD.VehicleGround_HashRingLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_HashRingLarge )
	self.id = "VehicleGround_HashRingLarge"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 288 )
	
	local VehicleGroundHashRingLargeInternal0 = CoD.VehicleGround_HashRingLargeInternal.new( menu, controller )
	VehicleGroundHashRingLargeInternal0:setLeftRight( true, false, -379, 96 )
	VehicleGroundHashRingLargeInternal0:setTopBottom( false, false, -144, 144 )
	VehicleGroundHashRingLargeInternal0:setAlpha( 0.85 )
	self:addElement( VehicleGroundHashRingLargeInternal0 )
	self.VehicleGroundHashRingLargeInternal0 = VehicleGroundHashRingLargeInternal0
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 32, 104 )
	Image5:setTopBottom( false, false, -37, 3 )
	Image5:setRGB( 0, 0, 0 )
	Image5:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_hashringlargemaskmid" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, false, 32, 104 )
	Image6:setTopBottom( false, false, -2, 38 )
	Image6:setRGB( 0, 0, 0 )
	Image6:setXRot( -180 )
	Image6:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_hashringlargemaskmid" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, false, 0, 80 )
	Image7:setTopBottom( false, false, 78, 166 )
	Image7:setRGB( 0, 0, 0 )
	Image7:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_hashringlargemaskbase" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 80 )
	Image0:setTopBottom( false, false, -166, -78 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setXRot( -180 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_hashringlargemaskbase" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, -10, 120 )
	Image1:setTopBottom( false, false, -243, -115 )
	Image1:setRGB( 0, 0, 0 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, -5, 120 )
	Image10:setTopBottom( false, false, 122, 250 )
	Image10:setRGB( 0, 0, 0 )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( true, false, -5, 9 )
	Image100:setTopBottom( false, false, 65, 193 )
	Image100:setRGB( 0, 0, 0 )
	self:addElement( Image100 )
	self.Image100 = Image100
	
	local Image1000 = LUI.UIImage.new()
	Image1000:setLeftRight( true, false, -5, 9 )
	Image1000:setTopBottom( false, false, -165, -37 )
	Image1000:setRGB( 0, 0, 0 )
	self:addElement( Image1000 )
	self.Image1000 = Image1000
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, -15.44, 104 )
	Image2:setTopBottom( false, false, 54, 178 )
	Image2:setAlpha( 0.6 )
	Image2:setZRot( 86 )
	Image2:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_sidemask" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, -15.44, 104 )
	Image3:setTopBottom( false, false, -188, -64 )
	Image3:setAlpha( 0.6 )
	Image3:setXRot( -180 )
	Image3:setZRot( 86 )
	Image3:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_sidemask" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local VehicleGroundHashRingLargeInternal0Frame2 = function ( VehicleGroundHashRingLargeInternal0, event )
					local VehicleGroundHashRingLargeInternal0Frame3 = function ( VehicleGroundHashRingLargeInternal0, event )
						local VehicleGroundHashRingLargeInternal0Frame4 = function ( VehicleGroundHashRingLargeInternal0, event )
							local VehicleGroundHashRingLargeInternal0Frame5 = function ( VehicleGroundHashRingLargeInternal0, event )
								local VehicleGroundHashRingLargeInternal0Frame6 = function ( VehicleGroundHashRingLargeInternal0, event )
									local VehicleGroundHashRingLargeInternal0Frame7 = function ( VehicleGroundHashRingLargeInternal0, event )
										local VehicleGroundHashRingLargeInternal0Frame8 = function ( VehicleGroundHashRingLargeInternal0, event )
											local VehicleGroundHashRingLargeInternal0Frame9 = function ( VehicleGroundHashRingLargeInternal0, event )
												local VehicleGroundHashRingLargeInternal0Frame10 = function ( VehicleGroundHashRingLargeInternal0, event )
													local VehicleGroundHashRingLargeInternal0Frame11 = function ( VehicleGroundHashRingLargeInternal0, event )
														local VehicleGroundHashRingLargeInternal0Frame12 = function ( VehicleGroundHashRingLargeInternal0, event )
															local VehicleGroundHashRingLargeInternal0Frame13 = function ( VehicleGroundHashRingLargeInternal0, event )
																local VehicleGroundHashRingLargeInternal0Frame14 = function ( VehicleGroundHashRingLargeInternal0, event )
																	local VehicleGroundHashRingLargeInternal0Frame15 = function ( VehicleGroundHashRingLargeInternal0, event )
																		local VehicleGroundHashRingLargeInternal0Frame16 = function ( VehicleGroundHashRingLargeInternal0, event )
																			local VehicleGroundHashRingLargeInternal0Frame17 = function ( VehicleGroundHashRingLargeInternal0, event )
																				if not event.interrupted then
																					VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
																				end
																				VehicleGroundHashRingLargeInternal0:setZRot( 0 )
																				if event.interrupted then
																					self.clipFinished( VehicleGroundHashRingLargeInternal0, event )
																				else
																					VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				VehicleGroundHashRingLargeInternal0Frame17( VehicleGroundHashRingLargeInternal0, event )
																				return 
																			else
																				VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
																				VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashRingLargeInternal0Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			VehicleGroundHashRingLargeInternal0Frame16( VehicleGroundHashRingLargeInternal0, event )
																			return 
																		else
																			VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
																			VehicleGroundHashRingLargeInternal0:setZRot( 4 )
																			VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashRingLargeInternal0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		VehicleGroundHashRingLargeInternal0Frame15( VehicleGroundHashRingLargeInternal0, event )
																		return 
																	else
																		VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
																		VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashRingLargeInternal0Frame15 )
																	end
																end
																
																if event.interrupted then
																	VehicleGroundHashRingLargeInternal0Frame14( VehicleGroundHashRingLargeInternal0, event )
																	return 
																else
																	VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
																	VehicleGroundHashRingLargeInternal0:setZRot( 9 )
																	VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashRingLargeInternal0Frame14 )
																end
															end
															
															if event.interrupted then
																VehicleGroundHashRingLargeInternal0Frame13( VehicleGroundHashRingLargeInternal0, event )
																return 
															else
																VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
																VehicleGroundHashRingLargeInternal0:setZRot( -10 )
																VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashRingLargeInternal0Frame13 )
															end
														end
														
														if event.interrupted then
															VehicleGroundHashRingLargeInternal0Frame12( VehicleGroundHashRingLargeInternal0, event )
															return 
														else
															VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 2000, true, true, CoD.TweenType.Linear )
															VehicleGroundHashRingLargeInternal0:setZRot( -7 )
															VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashRingLargeInternal0Frame12 )
														end
													end
													
													if event.interrupted then
														VehicleGroundHashRingLargeInternal0Frame11( VehicleGroundHashRingLargeInternal0, event )
														return 
													else
														VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashRingLargeInternal0Frame11 )
													end
												end
												
												if event.interrupted then
													VehicleGroundHashRingLargeInternal0Frame10( VehicleGroundHashRingLargeInternal0, event )
													return 
												else
													VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 2000, true, true, CoD.TweenType.Linear )
													VehicleGroundHashRingLargeInternal0:setZRot( -10 )
													VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashRingLargeInternal0Frame10 )
												end
											end
											
											if event.interrupted then
												VehicleGroundHashRingLargeInternal0Frame9( VehicleGroundHashRingLargeInternal0, event )
												return 
											else
												VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
												VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashRingLargeInternal0Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundHashRingLargeInternal0Frame8( VehicleGroundHashRingLargeInternal0, event )
											return 
										else
											VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
											VehicleGroundHashRingLargeInternal0:setZRot( 6 )
											VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashRingLargeInternal0Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundHashRingLargeInternal0Frame7( VehicleGroundHashRingLargeInternal0, event )
										return 
									else
										VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
										VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashRingLargeInternal0Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundHashRingLargeInternal0Frame6( VehicleGroundHashRingLargeInternal0, event )
									return 
								else
									VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
									VehicleGroundHashRingLargeInternal0:setZRot( -3 )
									VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashRingLargeInternal0Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundHashRingLargeInternal0Frame5( VehicleGroundHashRingLargeInternal0, event )
								return 
							else
								VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashRingLargeInternal0Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundHashRingLargeInternal0Frame4( VehicleGroundHashRingLargeInternal0, event )
							return 
						else
							VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
							VehicleGroundHashRingLargeInternal0:setZRot( -10 )
							VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashRingLargeInternal0Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundHashRingLargeInternal0Frame3( VehicleGroundHashRingLargeInternal0, event )
						return 
					else
						VehicleGroundHashRingLargeInternal0:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
						VehicleGroundHashRingLargeInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashRingLargeInternal0Frame3 )
					end
				end
				
				VehicleGroundHashRingLargeInternal0:completeAnimation()
				self.VehicleGroundHashRingLargeInternal0:setZRot( 0 )
				VehicleGroundHashRingLargeInternal0Frame2( VehicleGroundHashRingLargeInternal0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VehicleGroundHashRingLargeInternal0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

