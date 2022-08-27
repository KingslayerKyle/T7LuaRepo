-- 340572e4da21398dbf064523def17a46
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ExtRingArrow" )

CoD.VehicleGround_ExtRing = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ExtRing.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_ExtRing )
	self.id = "VehicleGround_ExtRing"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 191 )
	self:setTopBottom( true, false, 0, 392 )
	self.anyChildUsesUpdateState = true
	
	local ring = LUI.UIImage.new()
	ring:setLeftRight( true, false, 67, 147 )
	ring:setTopBottom( true, false, 0, 392 )
	ring:setAlpha( 0.4 )
	ring:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_extoutterring" ) )
	ring:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ring )
	self.ring = ring
	
	local VehicleGroundExtRingArrow0 = CoD.VehicleGround_ExtRingArrow.new( menu, controller )
	VehicleGroundExtRingArrow0:setLeftRight( true, false, 103, 191 )
	VehicleGroundExtRingArrow0:setTopBottom( true, false, 144, 248 )
	VehicleGroundExtRingArrow0:setAlpha( 0.4 )
	self:addElement( VehicleGroundExtRingArrow0 )
	self.VehicleGroundExtRingArrow0 = VehicleGroundExtRingArrow0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local ringFrame2 = function ( ring, event )
					local ringFrame3 = function ( ring, event )
						local ringFrame4 = function ( ring, event )
							local ringFrame5 = function ( ring, event )
								local ringFrame6 = function ( ring, event )
									local ringFrame7 = function ( ring, event )
										local ringFrame8 = function ( ring, event )
											local ringFrame9 = function ( ring, event )
												local ringFrame10 = function ( ring, event )
													if not event.interrupted then
														ring:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
													end
													ring:setLeftRight( true, false, 67, 147 )
													ring:setTopBottom( true, false, 0, 392 )
													ring:setZoom( 0 )
													if event.interrupted then
														self.clipFinished( ring, event )
													else
														ring:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													ringFrame10( ring, event )
													return 
												else
													ring:beginAnimation( "keyframe", 1759, true, true, CoD.TweenType.Back )
													ring:setZoom( 0 )
													ring:registerEventHandler( "transition_complete_keyframe", ringFrame10 )
												end
											end
											
											if event.interrupted then
												ringFrame9( ring, event )
												return 
											else
												ring:beginAnimation( "keyframe", 4170, false, false, CoD.TweenType.Linear )
												ring:registerEventHandler( "transition_complete_keyframe", ringFrame9 )
											end
										end
										
										if event.interrupted then
											ringFrame8( ring, event )
											return 
										else
											ring:beginAnimation( "keyframe", 940, true, true, CoD.TweenType.Back )
											ring:setLeftRight( true, false, 67, 147 )
											ring:registerEventHandler( "transition_complete_keyframe", ringFrame8 )
										end
									end
									
									if event.interrupted then
										ringFrame7( ring, event )
										return 
									else
										ring:beginAnimation( "keyframe", 1919, false, false, CoD.TweenType.Linear )
										ring:registerEventHandler( "transition_complete_keyframe", ringFrame7 )
									end
								end
								
								if event.interrupted then
									ringFrame6( ring, event )
									return 
								else
									ring:beginAnimation( "keyframe", 1080, true, true, CoD.TweenType.Back )
									ring:setZoom( -49 )
									ring:registerEventHandler( "transition_complete_keyframe", ringFrame6 )
								end
							end
							
							if event.interrupted then
								ringFrame5( ring, event )
								return 
							else
								ring:beginAnimation( "keyframe", 890, false, false, CoD.TweenType.Linear )
								ring:registerEventHandler( "transition_complete_keyframe", ringFrame5 )
							end
						end
						
						if event.interrupted then
							ringFrame4( ring, event )
							return 
						else
							ring:beginAnimation( "keyframe", 1199, true, true, CoD.TweenType.Back )
							ring:setLeftRight( true, false, 76, 156 )
							ring:registerEventHandler( "transition_complete_keyframe", ringFrame4 )
						end
					end
					
					if event.interrupted then
						ringFrame3( ring, event )
						return 
					else
						ring:beginAnimation( "keyframe", 1360, false, false, CoD.TweenType.Linear )
						ring:registerEventHandler( "transition_complete_keyframe", ringFrame3 )
					end
				end
				
				ring:completeAnimation()
				self.ring:setLeftRight( true, false, 67, 147 )
				self.ring:setTopBottom( true, false, 0, 392 )
				self.ring:setZoom( 0 )
				ringFrame2( ring, {} )
				local VehicleGroundExtRingArrow0Frame2 = function ( VehicleGroundExtRingArrow0, event )
					local VehicleGroundExtRingArrow0Frame3 = function ( VehicleGroundExtRingArrow0, event )
						local VehicleGroundExtRingArrow0Frame4 = function ( VehicleGroundExtRingArrow0, event )
							local VehicleGroundExtRingArrow0Frame5 = function ( VehicleGroundExtRingArrow0, event )
								local VehicleGroundExtRingArrow0Frame6 = function ( VehicleGroundExtRingArrow0, event )
									local VehicleGroundExtRingArrow0Frame7 = function ( VehicleGroundExtRingArrow0, event )
										local VehicleGroundExtRingArrow0Frame8 = function ( VehicleGroundExtRingArrow0, event )
											local VehicleGroundExtRingArrow0Frame9 = function ( VehicleGroundExtRingArrow0, event )
												if not event.interrupted then
													VehicleGroundExtRingArrow0:beginAnimation( "keyframe", 2729, true, true, CoD.TweenType.Back )
												end
												VehicleGroundExtRingArrow0:setLeftRight( true, false, 103, 191 )
												VehicleGroundExtRingArrow0:setTopBottom( true, false, 144, 248 )
												VehicleGroundExtRingArrow0:setAlpha( 1 )
												VehicleGroundExtRingArrow0:setZoom( 0 )
												if event.interrupted then
													self.clipFinished( VehicleGroundExtRingArrow0, event )
												else
													VehicleGroundExtRingArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												VehicleGroundExtRingArrow0Frame9( VehicleGroundExtRingArrow0, event )
												return 
											else
												VehicleGroundExtRingArrow0:beginAnimation( "keyframe", 1850, true, true, CoD.TweenType.Back )
												VehicleGroundExtRingArrow0:setLeftRight( true, false, 72, 160 )
												VehicleGroundExtRingArrow0:registerEventHandler( "transition_complete_keyframe", VehicleGroundExtRingArrow0Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundExtRingArrow0Frame8( VehicleGroundExtRingArrow0, event )
											return 
										else
											VehicleGroundExtRingArrow0:beginAnimation( "keyframe", 2260, true, true, CoD.TweenType.Back )
											VehicleGroundExtRingArrow0:setLeftRight( true, false, 69.16, 157.16 )
											VehicleGroundExtRingArrow0:setZoom( -50 )
											VehicleGroundExtRingArrow0:registerEventHandler( "transition_complete_keyframe", VehicleGroundExtRingArrow0Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundExtRingArrow0Frame7( VehicleGroundExtRingArrow0, event )
										return 
									else
										VehicleGroundExtRingArrow0:beginAnimation( "keyframe", 2499, false, false, CoD.TweenType.Linear )
										VehicleGroundExtRingArrow0:setLeftRight( true, false, 64.31, 152.31 )
										VehicleGroundExtRingArrow0:registerEventHandler( "transition_complete_keyframe", VehicleGroundExtRingArrow0Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundExtRingArrow0Frame6( VehicleGroundExtRingArrow0, event )
									return 
								else
									VehicleGroundExtRingArrow0:beginAnimation( "keyframe", 1910, true, true, CoD.TweenType.Back )
									VehicleGroundExtRingArrow0:setLeftRight( true, false, 103, 191 )
									VehicleGroundExtRingArrow0:registerEventHandler( "transition_complete_keyframe", VehicleGroundExtRingArrow0Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundExtRingArrow0Frame5( VehicleGroundExtRingArrow0, event )
								return 
							else
								VehicleGroundExtRingArrow0:beginAnimation( "keyframe", 1509, false, false, CoD.TweenType.Linear )
								VehicleGroundExtRingArrow0:registerEventHandler( "transition_complete_keyframe", VehicleGroundExtRingArrow0Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundExtRingArrow0Frame4( VehicleGroundExtRingArrow0, event )
							return 
						else
							VehicleGroundExtRingArrow0:beginAnimation( "keyframe", 719, true, true, CoD.TweenType.Back )
							VehicleGroundExtRingArrow0:setLeftRight( true, false, 83, 171 )
							VehicleGroundExtRingArrow0:registerEventHandler( "transition_complete_keyframe", VehicleGroundExtRingArrow0Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundExtRingArrow0Frame3( VehicleGroundExtRingArrow0, event )
						return 
					else
						VehicleGroundExtRingArrow0:beginAnimation( "keyframe", 1590, false, false, CoD.TweenType.Linear )
						VehicleGroundExtRingArrow0:registerEventHandler( "transition_complete_keyframe", VehicleGroundExtRingArrow0Frame3 )
					end
				end
				
				VehicleGroundExtRingArrow0:completeAnimation()
				self.VehicleGroundExtRingArrow0:setLeftRight( true, false, 103, 191 )
				self.VehicleGroundExtRingArrow0:setTopBottom( true, false, 144, 248 )
				self.VehicleGroundExtRingArrow0:setAlpha( 1 )
				self.VehicleGroundExtRingArrow0:setZoom( 0 )
				VehicleGroundExtRingArrow0Frame2( VehicleGroundExtRingArrow0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VehicleGroundExtRingArrow0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

