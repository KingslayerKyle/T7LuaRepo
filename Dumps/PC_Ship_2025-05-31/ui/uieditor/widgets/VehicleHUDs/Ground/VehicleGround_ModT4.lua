CoD.VehicleGround_ModT4 = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ModT4.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.VehicleGround_ModT4 )
	self.id = "VehicleGround_ModT4"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 144 )
	self:setTopBottom( true, false, 0, 36 )
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 0, 144 )
	Image3:setTopBottom( true, false, 0, 36 )
	Image3:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulest4" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 113.73, 121.73 )
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
									Image0:beginAnimation( "keyframe", 1990, true, true, CoD.TweenType.Linear )
								end
								Image0:setLeftRight( true, false, 131, 139 )
								Image0:setTopBottom( true, false, 21, 29 )
								Image0:setAlpha( 1 )
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
								Image0:beginAnimation( "keyframe", 1219, false, false, CoD.TweenType.Linear )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 2490, true, true, CoD.TweenType.Linear )
							Image0:setLeftRight( true, false, 30, 38 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 131, 139 )
				self.Image0:setTopBottom( true, false, 21, 29 )
				self.Image0:setAlpha( 1 )
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

