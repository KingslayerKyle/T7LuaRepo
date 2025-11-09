require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModB2Pixel" )

CoD.VehicleGround_ModB2 = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ModB2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.VehicleGround_ModB2 )
	self.id = "VehicleGround_ModB2"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 144 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( true, false, 0, 144 )
	Image9:setTopBottom( true, false, 0, 40 )
	Image9:setRGB( 1, 1, 1 )
	Image9:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulesb2" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local Replace = CoD.VehicleGround_ModB2Pixel.new( menu, controller )
	Replace:setLeftRight( true, false, 24, 40 )
	Replace:setTopBottom( true, false, -12, 28 )
	Replace:setRGB( 1, 1, 1 )
	self:addElement( Replace )
	self.Replace = Replace
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local ReplaceFrame2 = function ( Replace, event )
					local ReplaceFrame3 = function ( Replace, event )
						local ReplaceFrame4 = function ( Replace, event )
							local ReplaceFrame5 = function ( Replace, event )
								local ReplaceFrame6 = function ( Replace, event )
									local ReplaceFrame7 = function ( Replace, event )
										if not event.interrupted then
											Replace:beginAnimation( "keyframe", 1400, true, true, CoD.TweenType.Linear )
										end
										Replace:setLeftRight( true, false, 24, 40 )
										Replace:setTopBottom( true, false, -12, 28 )
										Replace:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( Replace, event )
										else
											Replace:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ReplaceFrame7( Replace, event )
										return 
									else
										Replace:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
										Replace:registerEventHandler( "transition_complete_keyframe", ReplaceFrame7 )
									end
								end
								
								if event.interrupted then
									ReplaceFrame6( Replace, event )
									return 
								else
									Replace:beginAnimation( "keyframe", 899, true, true, CoD.TweenType.Linear )
									Replace:setLeftRight( true, false, 93, 109 )
									Replace:registerEventHandler( "transition_complete_keyframe", ReplaceFrame6 )
								end
							end
							
							if event.interrupted then
								ReplaceFrame5( Replace, event )
								return 
							else
								Replace:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
								Replace:registerEventHandler( "transition_complete_keyframe", ReplaceFrame5 )
							end
						end
						
						if event.interrupted then
							ReplaceFrame4( Replace, event )
							return 
						else
							Replace:beginAnimation( "keyframe", 2819, true, true, CoD.TweenType.Linear )
							Replace:setLeftRight( true, false, 120, 136 )
							Replace:registerEventHandler( "transition_complete_keyframe", ReplaceFrame4 )
						end
					end
					
					if event.interrupted then
						ReplaceFrame3( Replace, event )
						return 
					else
						Replace:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
						Replace:registerEventHandler( "transition_complete_keyframe", ReplaceFrame3 )
					end
				end
				
				Replace:completeAnimation()
				self.Replace:setLeftRight( true, false, 24, 40 )
				self.Replace:setTopBottom( true, false, -12, 28 )
				self.Replace:setAlpha( 1 )
				ReplaceFrame2( Replace, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self.close = function ( self )
		self.Replace:close()
		CoD.VehicleGround_ModB2.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

