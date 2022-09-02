-- b974aea7a2cbbff55e3243230765f85d
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_CenterInnerRingElement = InheritFrom( LUI.UIElement )
CoD.VehicleGround_CenterInnerRingElement.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_CenterInnerRingElement )
	self.id = "VehicleGround_CenterInnerRingElement"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 57 )
	self:setTopBottom( true, false, 0, 69 )
	
	local InnerRingElement = LUI.UIImage.new()
	InnerRingElement:setLeftRight( false, true, -32, 0 )
	InnerRingElement:setTopBottom( true, false, 0, 32 )
	InnerRingElement:setAlpha( 0.5 )
	InnerRingElement:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_centerinnerringelement" ) )
	InnerRingElement:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( InnerRingElement )
	self.InnerRingElement = InnerRingElement
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 8 )
	Image0:setTopBottom( false, true, -8, 0 )
	Image0:setAlpha( 0.5 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_centerinnerringelementpix" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								local Image0Frame6 = function ( Image0, event )
									local Image0Frame7 = function ( Image0, event )
										local Image0Frame8 = function ( Image0, event )
											local Image0Frame9 = function ( Image0, event )
												if not event.interrupted then
													Image0:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
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
												Image0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Image0:setAlpha( 1 )
												Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame9 )
											end
										end
										
										if event.interrupted then
											Image0Frame8( Image0, event )
											return 
										else
											Image0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame8 )
										end
									end
									
									if event.interrupted then
										Image0Frame7( Image0, event )
										return 
									else
										Image0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Image0:setAlpha( 0 )
										Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame7 )
									end
								end
								
								if event.interrupted then
									Image0Frame6( Image0, event )
									return 
								else
									Image0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
									Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame6 )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
								Image0:setAlpha( 0.5 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						Image0:setAlpha( 0 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				Image0Frame2( Image0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

