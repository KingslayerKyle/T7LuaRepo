-- 11f578e421a9c3ee951db8fbee18c84f
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_ModB3Pixel = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ModB3Pixel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.VehicleGround_ModB3Pixel )
	self.id = "VehicleGround_ModB3Pixel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 8 )
	
	local Image11 = LUI.UIImage.new()
	Image11:setLeftRight( true, false, 0, 48 )
	Image11:setTopBottom( true, false, 0, 8 )
	Image11:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulesb3b" ) )
	Image11:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image11 )
	self.Image11 = Image11
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local Image11Frame2 = function ( Image11, event )
					local Image11Frame3 = function ( Image11, event )
						local Image11Frame4 = function ( Image11, event )
							if not event.interrupted then
								Image11:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							end
							Image11:setAlpha( 0.5 )
							if event.interrupted then
								self.clipFinished( Image11, event )
							else
								Image11:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image11Frame4( Image11, event )
							return 
						else
							Image11:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Image11:setAlpha( 0.5 )
							Image11:registerEventHandler( "transition_complete_keyframe", Image11Frame4 )
						end
					end
					
					if event.interrupted then
						Image11Frame3( Image11, event )
						return 
					else
						Image11:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Image11:registerEventHandler( "transition_complete_keyframe", Image11Frame3 )
					end
				end
				
				Image11:completeAnimation()
				self.Image11:setAlpha( 1 )
				Image11Frame2( Image11, {} )
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

