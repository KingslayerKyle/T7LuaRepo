-- fb15064531f190191fc12817ea89fe68
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModB3Pixel" )

CoD.VehicleGround_ModB3 = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ModB3.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.VehicleGround_ModB3 )
	self.id = "VehicleGround_ModB3"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 136 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 0, 136 )
	Image10:setTopBottom( true, false, 0, 40 )
	Image10:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulesb3" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local VehicleGroundModB3Pixel0 = CoD.VehicleGround_ModB3Pixel.new( menu, controller )
	VehicleGroundModB3Pixel0:setLeftRight( true, false, 3, 51 )
	VehicleGroundModB3Pixel0:setTopBottom( true, false, 7, 15 )
	self:addElement( VehicleGroundModB3Pixel0 )
	self.VehicleGroundModB3Pixel0 = VehicleGroundModB3Pixel0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local VehicleGroundModB3Pixel0Frame2 = function ( VehicleGroundModB3Pixel0, event )
					local VehicleGroundModB3Pixel0Frame3 = function ( VehicleGroundModB3Pixel0, event )
						local VehicleGroundModB3Pixel0Frame4 = function ( VehicleGroundModB3Pixel0, event )
							local VehicleGroundModB3Pixel0Frame5 = function ( VehicleGroundModB3Pixel0, event )
								local VehicleGroundModB3Pixel0Frame6 = function ( VehicleGroundModB3Pixel0, event )
									local VehicleGroundModB3Pixel0Frame7 = function ( VehicleGroundModB3Pixel0, event )
										if not event.interrupted then
											VehicleGroundModB3Pixel0:beginAnimation( "keyframe", 3529, true, true, CoD.TweenType.Linear )
										end
										VehicleGroundModB3Pixel0:setLeftRight( true, false, 3, 51 )
										VehicleGroundModB3Pixel0:setTopBottom( true, false, 7, 15 )
										if event.interrupted then
											self.clipFinished( VehicleGroundModB3Pixel0, event )
										else
											VehicleGroundModB3Pixel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										VehicleGroundModB3Pixel0Frame7( VehicleGroundModB3Pixel0, event )
										return 
									else
										VehicleGroundModB3Pixel0:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
										VehicleGroundModB3Pixel0:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB3Pixel0Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundModB3Pixel0Frame6( VehicleGroundModB3Pixel0, event )
									return 
								else
									VehicleGroundModB3Pixel0:beginAnimation( "keyframe", 40, true, true, CoD.TweenType.Linear )
									VehicleGroundModB3Pixel0:setTopBottom( true, false, 7, 15 )
									VehicleGroundModB3Pixel0:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB3Pixel0Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundModB3Pixel0Frame5( VehicleGroundModB3Pixel0, event )
								return 
							else
								VehicleGroundModB3Pixel0:beginAnimation( "keyframe", 709, true, true, CoD.TweenType.Back )
								VehicleGroundModB3Pixel0:setLeftRight( true, false, 66, 114 )
								VehicleGroundModB3Pixel0:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB3Pixel0Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundModB3Pixel0Frame4( VehicleGroundModB3Pixel0, event )
							return 
						else
							VehicleGroundModB3Pixel0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Back )
							VehicleGroundModB3Pixel0:setTopBottom( true, false, 2, 10 )
							VehicleGroundModB3Pixel0:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB3Pixel0Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundModB3Pixel0Frame3( VehicleGroundModB3Pixel0, event )
						return 
					else
						VehicleGroundModB3Pixel0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						VehicleGroundModB3Pixel0:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB3Pixel0Frame3 )
					end
				end
				
				VehicleGroundModB3Pixel0:completeAnimation()
				self.VehicleGroundModB3Pixel0:setLeftRight( true, false, 3, 51 )
				self.VehicleGroundModB3Pixel0:setTopBottom( true, false, 7, 15 )
				VehicleGroundModB3Pixel0Frame2( VehicleGroundModB3Pixel0, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return HideVehicleReticle( self, controller, event )
			end
		}
	} )
	self:linkToElementModel( self, "vehicleType", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "vehicleType"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VehicleGroundModB3Pixel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
