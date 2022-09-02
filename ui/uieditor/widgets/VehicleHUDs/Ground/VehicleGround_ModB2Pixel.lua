-- 3873b233e86f17a2692cd75b3f220cc7
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_ModB2Pixel = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ModB2Pixel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.VehicleGround_ModB2Pixel )
	self.id = "VehicleGround_ModB2Pixel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 40 )
	
	local Image80 = LUI.UIImage.new()
	Image80:setLeftRight( true, false, 0, 16 )
	Image80:setTopBottom( true, false, 0, 40 )
	Image80:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulesb1" ) )
	Image80:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image80 )
	self.Image80 = Image80
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local Image80Frame2 = function ( Image80, event )
					local Image80Frame3 = function ( Image80, event )
						local Image80Frame4 = function ( Image80, event )
							if not event.interrupted then
								Image80:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							Image80:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image80, event )
							else
								Image80:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image80Frame4( Image80, event )
							return 
						else
							Image80:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Image80:setAlpha( 0 )
							Image80:registerEventHandler( "transition_complete_keyframe", Image80Frame4 )
						end
					end
					
					if event.interrupted then
						Image80Frame3( Image80, event )
						return 
					else
						Image80:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Image80:registerEventHandler( "transition_complete_keyframe", Image80Frame3 )
					end
				end
				
				Image80:completeAnimation()
				self.Image80:setAlpha( 1 )
				Image80Frame2( Image80, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

