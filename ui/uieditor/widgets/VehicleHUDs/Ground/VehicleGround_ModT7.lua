-- 051a2353c13d1a1f58186c0a811a158b
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_ModT7 = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ModT7.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.VehicleGround_ModT7 )
	self.id = "VehicleGround_ModT7"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 36 )
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, false, 0, 36 )
	Image7:setTopBottom( true, false, 0, 36 )
	Image7:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulest7" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local Image7Frame2 = function ( Image7, event )
					local Image7Frame3 = function ( Image7, event )
						local Image7Frame4 = function ( Image7, event )
							local Image7Frame5 = function ( Image7, event )
								if not event.interrupted then
									Image7:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
								end
								Image7:setRGB( 1, 1, 1 )
								if event.interrupted then
									self.clipFinished( Image7, event )
								else
									Image7:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image7Frame5( Image7, event )
								return 
							else
								Image7:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								Image7:registerEventHandler( "transition_complete_keyframe", Image7Frame5 )
							end
						end
						
						if event.interrupted then
							Image7Frame4( Image7, event )
							return 
						else
							Image7:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							Image7:setRGB( 1, 0, 0 )
							Image7:registerEventHandler( "transition_complete_keyframe", Image7Frame4 )
						end
					end
					
					if event.interrupted then
						Image7Frame3( Image7, event )
						return 
					else
						Image7:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Image7:registerEventHandler( "transition_complete_keyframe", Image7Frame3 )
					end
				end
				
				Image7:completeAnimation()
				self.Image7:setRGB( 1, 1, 1 )
				Image7Frame2( Image7, {} )
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

