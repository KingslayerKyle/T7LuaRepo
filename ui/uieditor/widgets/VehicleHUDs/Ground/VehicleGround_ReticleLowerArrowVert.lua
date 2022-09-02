-- 94d4c40ab88b52bbd0b053d53e0a37f3
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_ReticleLowerArrowVert = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ReticleLowerArrowVert.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_ReticleLowerArrowVert )
	self.id = "VehicleGround_ReticleLowerArrowVert"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 24 )
	
	local ReticleLowerArrowVert = LUI.UIImage.new()
	ReticleLowerArrowVert:setLeftRight( false, false, -9, 7 )
	ReticleLowerArrowVert:setTopBottom( false, false, -12, 12 )
	ReticleLowerArrowVert:setAlpha( 0.5 )
	ReticleLowerArrowVert:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticlelowerarrowvert" ) )
	ReticleLowerArrowVert:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleLowerArrowVert )
	self.ReticleLowerArrowVert = ReticleLowerArrowVert
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local ReticleLowerArrowVertFrame2 = function ( ReticleLowerArrowVert, event )
					local ReticleLowerArrowVertFrame3 = function ( ReticleLowerArrowVert, event )
						local ReticleLowerArrowVertFrame4 = function ( ReticleLowerArrowVert, event )
							if not event.interrupted then
								ReticleLowerArrowVert:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							end
							ReticleLowerArrowVert:setAlpha( 0.5 )
							if event.interrupted then
								self.clipFinished( ReticleLowerArrowVert, event )
							else
								ReticleLowerArrowVert:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ReticleLowerArrowVertFrame4( ReticleLowerArrowVert, event )
							return 
						else
							ReticleLowerArrowVert:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							ReticleLowerArrowVert:setAlpha( 0.5 )
							ReticleLowerArrowVert:registerEventHandler( "transition_complete_keyframe", ReticleLowerArrowVertFrame4 )
						end
					end
					
					if event.interrupted then
						ReticleLowerArrowVertFrame3( ReticleLowerArrowVert, event )
						return 
					else
						ReticleLowerArrowVert:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						ReticleLowerArrowVert:registerEventHandler( "transition_complete_keyframe", ReticleLowerArrowVertFrame3 )
					end
				end
				
				ReticleLowerArrowVert:completeAnimation()
				self.ReticleLowerArrowVert:setAlpha( 1 )
				ReticleLowerArrowVertFrame2( ReticleLowerArrowVert, {} )

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

