-- 26e5aaf9d09f9648a410a26cccf3b9cf
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_ModT3 = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ModT3.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.VehicleGround_ModT3 )
	self.id = "VehicleGround_ModT3"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 36 )
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 0, 48 )
	Image2:setTopBottom( true, false, 0, 36 )
	Image2:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulest3" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 3, 11 )
	Image0:setTopBottom( true, false, 21, 29 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulespixel" ) )
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
								if not event.interrupted then
									Image0:beginAnimation( "keyframe", 1049, false, false, CoD.TweenType.Linear )
								end
								Image0:setLeftRight( true, false, 3, 11 )
								Image0:setTopBottom( true, false, 21, 29 )
								if event.interrupted then
									self.clipFinished( Image0, event )
								else
									Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
								Image0:setLeftRight( true, false, 3, 11 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
						Image0:setLeftRight( true, false, 22, 30 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 3, 11 )
				self.Image0:setTopBottom( true, false, 21, 29 )
				Image0Frame2( Image0, {} )

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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
