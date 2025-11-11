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
	self:setLeftRight( 0, 0, 0, 582 )
	self:setTopBottom( 0, 0, 0, 253 )
	
	local cloud1 = LUI.UIImage.new()
	cloud1:setLeftRight( 0, 0, 0, 581 )
	cloud1:setTopBottom( 0, 0, 0, 253 )
	cloud1:setImage( RegisterImage( "uie_t7_callingcard_killer_cloud2" ) )
	self:addElement( cloud1 )
	self.cloud1 = cloud1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 237, 818 )
	Image0:setTopBottom( 0, 0, 186, 439 )
	Image0:setImage( RegisterImage( "uie_t7_callingcard_killer_cloud2" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.resetProperties = function ()
		cloud1:completeAnimation()
		Image0:completeAnimation()
		cloud1:setLeftRight( 0, 0, 0, 581 )
		cloud1:setTopBottom( 0, 0, 0, 253 )
		cloud1:setAlpha( 1 )
		Image0:setLeftRight( 0, 0, 237, 818 )
		Image0:setTopBottom( 0, 0, 186, 439 )
		Image0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local cloud1Frame2 = function ( cloud1, event )
					local cloud1Frame3 = function ( cloud1, event )
						local cloud1Frame4 = function ( cloud1, event )
							local cloud1Frame5 = function ( cloud1, event )
								if not event.interrupted then
									cloud1:beginAnimation( "keyframe", 4950, false, false, CoD.TweenType.Linear )
								end
								cloud1:setLeftRight( 0, 0, 0, 581 )
								cloud1:setTopBottom( 0, 0, 0, 253 )
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
								cloud1:setLeftRight( 0, 0, 239, 820 )
								cloud1:setTopBottom( 0, 0, 188, 441 )
								cloud1:setAlpha( 1 )
								cloud1:registerEventHandler( "transition_complete_keyframe", cloud1Frame5 )
							end
						end
						
						if event.interrupted then
							cloud1Frame4( cloud1, event )
							return 
						else
							cloud1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							cloud1:setLeftRight( 0, 0, 249, 830 )
							cloud1:setTopBottom( 0, 0, 197, 450 )
							cloud1:setAlpha( 0 )
							cloud1:registerEventHandler( "transition_complete_keyframe", cloud1Frame4 )
						end
					end
					
					if event.interrupted then
						cloud1Frame3( cloud1, event )
						return 
					else
						cloud1:beginAnimation( "keyframe", 5039, false, false, CoD.TweenType.Linear )
						cloud1:setLeftRight( 0, 0, -237, 344 )
						cloud1:setTopBottom( 0, 0, -185, 68 )
						cloud1:registerEventHandler( "transition_complete_keyframe", cloud1Frame3 )
					end
				end
				
				cloud1:completeAnimation()
				self.cloud1:setLeftRight( 0, 0, 0, 581 )
				self.cloud1:setTopBottom( 0, 0, 0, 253 )
				self.cloud1:setAlpha( 1 )
				cloud1Frame2( cloud1, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						if not event.interrupted then
							Image0:beginAnimation( "keyframe", 5020, false, false, CoD.TweenType.Linear )
						end
						Image0:setLeftRight( 0, 0, -238, 343 )
						Image0:setTopBottom( 0, 0, -188, 65 )
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
						Image0:setLeftRight( 0, 0, 0, 581 )
						Image0:setTopBottom( 0, 0, 0, 253 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( 0, 0, 237, 818 )
				self.Image0:setTopBottom( 0, 0, 186, 439 )
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

