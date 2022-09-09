-- a871a1b6bb81aa5c5850b1529aa36498
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_KillerCloudFront = InheritFrom( LUI.UIElement )
CoD.CallingCards_KillerCloudFront.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_KillerCloudFront )
	self.id = "CallingCards_KillerCloudFront"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 388 )
	self:setTopBottom( true, false, 0, 169 )
	
	local cloud1 = LUI.UIImage.new()
	cloud1:setLeftRight( true, false, 0, 387.55 )
	cloud1:setTopBottom( true, false, 0, 168.5 )
	cloud1:setImage( RegisterImage( "uie_t7_callingcard_killer_cloud2" ) )
	self:addElement( cloud1 )
	self.cloud1 = cloud1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 158, 545.55 )
	Image0:setTopBottom( true, false, 124, 292.5 )
	Image0:setImage( RegisterImage( "uie_t7_callingcard_killer_cloud2" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local cloud1Frame2 = function ( cloud1, event )
					local cloud1Frame3 = function ( cloud1, event )
						local cloud1Frame4 = function ( cloud1, event )
							local cloud1Frame5 = function ( cloud1, event )
								if not event.interrupted then
									cloud1:beginAnimation( "keyframe", 4950, false, false, CoD.TweenType.Linear )
								end
								cloud1:setLeftRight( true, false, 0, 387.55 )
								cloud1:setTopBottom( true, false, 0, 168.5 )
								cloud1:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( cloud1, event )
								else
									cloud1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								cloud1Frame5( cloud1, event )
								return 
							else
								cloud1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								cloud1:setLeftRight( true, false, 159, 546.55 )
								cloud1:setTopBottom( true, false, 125.5, 294 )
								cloud1:setAlpha( 1 )
								cloud1:registerEventHandler( "transition_complete_keyframe", cloud1Frame5 )
							end
						end
						
						if event.interrupted then
							cloud1Frame4( cloud1, event )
							return 
						else
							cloud1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							cloud1:setLeftRight( true, false, 166, 553.55 )
							cloud1:setTopBottom( true, false, 131.5, 300 )
							cloud1:setAlpha( 0 )
							cloud1:registerEventHandler( "transition_complete_keyframe", cloud1Frame4 )
						end
					end
					
					if event.interrupted then
						cloud1Frame3( cloud1, event )
						return 
					else
						cloud1:beginAnimation( "keyframe", 5039, false, false, CoD.TweenType.Linear )
						cloud1:setLeftRight( true, false, -158, 229.55 )
						cloud1:setTopBottom( true, false, -123.5, 45 )
						cloud1:registerEventHandler( "transition_complete_keyframe", cloud1Frame3 )
					end
				end
				
				cloud1:completeAnimation()
				self.cloud1:setLeftRight( true, false, 0, 387.55 )
				self.cloud1:setTopBottom( true, false, 0, 168.5 )
				self.cloud1:setAlpha( 1 )
				cloud1Frame2( cloud1, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						if not event.interrupted then
							Image0:beginAnimation( "keyframe", 5020, false, false, CoD.TweenType.Linear )
						end
						Image0:setLeftRight( true, false, -159, 228.55 )
						Image0:setTopBottom( true, false, -125, 43.5 )
						Image0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image0, event )
						else
							Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 5039, false, false, CoD.TweenType.Linear )
						Image0:setLeftRight( true, false, 0, 387.55 )
						Image0:setTopBottom( true, false, 0, 168.5 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 158, 545.55 )
				self.Image0:setTopBottom( true, false, 124, 292.5 )
				self.Image0:setAlpha( 1 )
				Image0Frame2( Image0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
