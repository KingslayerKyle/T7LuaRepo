-- 262e5b0921b049f2a88fdee5cf5782a4
-- This hash is used for caching, delete to decompile the file again

CoD.WaypointCenter = InheritFrom( LUI.UIElement )
CoD.WaypointCenter.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.WaypointCenter )
	self.id = "WaypointCenter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	
	local waypointCenterImage = LUI.UIImage.new()
	waypointCenterImage:setLeftRight( true, true, 0, 0 )
	waypointCenterImage:setTopBottom( true, true, 0, 0 )
	waypointCenterImage:setImage( RegisterImage( "uie_t7_hud_waypoints_neutral_new" ) )
	self:addElement( waypointCenterImage )
	self.waypointCenterImage = waypointCenterImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				waypointCenterImage:completeAnimation()
				self.waypointCenterImage:setLeftRight( true, true, 0, 0 )
				self.waypointCenterImage:setTopBottom( true, true, 0, 0 )
				self.waypointCenterImage:setAlpha( 1 )
				self.clipFinished( waypointCenterImage, {} )
			end
		},
		Pulsing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local waypointCenterImageFrame2 = function ( waypointCenterImage, event )
					local waypointCenterImageFrame3 = function ( waypointCenterImage, event )
						if not event.interrupted then
							waypointCenterImage:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						end
						waypointCenterImage:setLeftRight( true, true, 0, 0 )
						waypointCenterImage:setTopBottom( true, true, 0, 0 )
						waypointCenterImage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( waypointCenterImage, event )
						else
							waypointCenterImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						waypointCenterImageFrame3( waypointCenterImage, event )
						return 
					else
						waypointCenterImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						waypointCenterImage:setLeftRight( true, true, 6, -6 )
						waypointCenterImage:setTopBottom( true, true, 6, -6 )
						waypointCenterImage:setAlpha( 0.51 )
						waypointCenterImage:registerEventHandler( "transition_complete_keyframe", waypointCenterImageFrame3 )
					end
				end
				
				waypointCenterImage:completeAnimation()
				self.waypointCenterImage:setLeftRight( true, true, 0, 0 )
				self.waypointCenterImage:setTopBottom( true, true, 0, 0 )
				self.waypointCenterImage:setAlpha( 1 )
				waypointCenterImageFrame2( waypointCenterImage, {} )

				self.nextClip = "DefaultClip"
			end
		},
		PulsingDeposit = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local waypointCenterImageFrame2 = function ( waypointCenterImage, event )
					local waypointCenterImageFrame3 = function ( waypointCenterImage, event )
						if not event.interrupted then
							waypointCenterImage:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						waypointCenterImage:setLeftRight( true, true, 0, 0 )
						waypointCenterImage:setTopBottom( true, true, 0, 0 )
						waypointCenterImage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( waypointCenterImage, event )
						else
							waypointCenterImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						waypointCenterImageFrame3( waypointCenterImage, event )
						return 
					else
						waypointCenterImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						waypointCenterImage:setLeftRight( true, true, 6, -6 )
						waypointCenterImage:setTopBottom( true, true, 6, -6 )
						waypointCenterImage:setAlpha( 0.51 )
						waypointCenterImage:registerEventHandler( "transition_complete_keyframe", waypointCenterImageFrame3 )
					end
				end
				
				waypointCenterImage:completeAnimation()
				self.waypointCenterImage:setLeftRight( true, true, 0, 0 )
				self.waypointCenterImage:setTopBottom( true, true, 0, 0 )
				self.waypointCenterImage:setAlpha( 1 )
				waypointCenterImageFrame2( waypointCenterImage, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

