-- 58de8747adc78bc1c8a9526efc8d85ff
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_ExtRingArrow = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ExtRingArrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_ExtRingArrow )
	self.id = "VehicleGround_ExtRingArrow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 88 )
	self:setTopBottom( true, false, 0, 104 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 88 )
	Image1:setTopBottom( true, false, 0, 104 )
	Image1:setAlpha( 0.8 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_extoutterringarrow" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						local Image1Frame4 = function ( Image1, event )
							if not event.interrupted then
								Image1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							end
							Image1:setAlpha( 0.8 )
							if event.interrupted then
								self.clipFinished( Image1, event )
							else
								Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image1Frame4( Image1, event )
							return 
						else
							Image1:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							Image1:setAlpha( 0.8 )
							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame4 )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				Image1Frame2( Image1, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

