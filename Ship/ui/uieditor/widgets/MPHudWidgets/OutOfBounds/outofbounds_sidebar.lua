-- 57754529a3ef2f5a4205b5ee80a11431
-- This hash is used for caching, delete to decompile the file again

CoD.outofbounds_sidebar = InheritFrom( LUI.UIElement )
CoD.outofbounds_sidebar.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.outofbounds_sidebar )
	self.id = "outofbounds_sidebar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 263 )
	self:setTopBottom( true, false, 0, 31 )
	
	local RightBar = LUI.UIImage.new()
	RightBar:setLeftRight( true, false, 0, 263.25 )
	RightBar:setTopBottom( true, false, 0, 30.81 )
	RightBar:setRGB( 0.73, 0, 0 )
	RightBar:setImage( RegisterImage( "uie_t7_hud_outofbounds_sidebar" ) )
	RightBar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RightBar )
	self.RightBar = RightBar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local RightBarFrame2 = function ( RightBar, event )
					local RightBarFrame3 = function ( RightBar, event )
						local RightBarFrame4 = function ( RightBar, event )
							local RightBarFrame5 = function ( RightBar, event )
								local RightBarFrame6 = function ( RightBar, event )
									local RightBarFrame7 = function ( RightBar, event )
										local RightBarFrame8 = function ( RightBar, event )
											if not event.interrupted then
												RightBar:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
											end
											RightBar:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( RightBar, event )
											else
												RightBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											RightBarFrame8( RightBar, event )
											return 
										else
											RightBar:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											RightBar:setAlpha( 1 )
											RightBar:registerEventHandler( "transition_complete_keyframe", RightBarFrame8 )
										end
									end
									
									if event.interrupted then
										RightBarFrame7( RightBar, event )
										return 
									else
										RightBar:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
										RightBar:setAlpha( 0 )
										RightBar:registerEventHandler( "transition_complete_keyframe", RightBarFrame7 )
									end
								end
								
								if event.interrupted then
									RightBarFrame6( RightBar, event )
									return 
								else
									RightBar:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									RightBar:setAlpha( 1 )
									RightBar:registerEventHandler( "transition_complete_keyframe", RightBarFrame6 )
								end
							end
							
							if event.interrupted then
								RightBarFrame5( RightBar, event )
								return 
							else
								RightBar:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
								RightBar:setAlpha( 0 )
								RightBar:registerEventHandler( "transition_complete_keyframe", RightBarFrame5 )
							end
						end
						
						if event.interrupted then
							RightBarFrame4( RightBar, event )
							return 
						else
							RightBar:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							RightBar:setAlpha( 1 )
							RightBar:registerEventHandler( "transition_complete_keyframe", RightBarFrame4 )
						end
					end
					
					if event.interrupted then
						RightBarFrame3( RightBar, event )
						return 
					else
						RightBar:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						RightBar:setAlpha( 0 )
						RightBar:registerEventHandler( "transition_complete_keyframe", RightBarFrame3 )
					end
				end
				
				RightBar:completeAnimation()
				self.RightBar:setAlpha( 1 )
				RightBarFrame2( RightBar, {} )

				self.nextClip = "DefaultClip"
			end
		},
		IsOutOfBounds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
