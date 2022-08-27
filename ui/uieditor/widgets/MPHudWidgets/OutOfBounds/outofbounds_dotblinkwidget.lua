-- 2469dece8c1042c50febf5f5af2995c9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Pixel" )

CoD.outofbounds_dotblinkwidget = InheritFrom( LUI.UIElement )
CoD.outofbounds_dotblinkwidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.outofbounds_dotblinkwidget )
	self.id = "outofbounds_dotblinkwidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 8 )
	self:setTopBottom( true, false, 0, 8 )
	
	local AbilityWheelPixel00 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel00:setLeftRight( false, false, -4, 4 )
	AbilityWheelPixel00:setTopBottom( false, false, -4, 4 )
	AbilityWheelPixel00:setScale( 1.6 )
	AbilityWheelPixel00.Image20:setAlpha( 0.7 )
	AbilityWheelPixel00.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel00 )
	self.AbilityWheelPixel00 = AbilityWheelPixel00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local AbilityWheelPixel00Frame2 = function ( AbilityWheelPixel00, event )
					local AbilityWheelPixel00Frame3 = function ( AbilityWheelPixel00, event )
						local AbilityWheelPixel00Frame4 = function ( AbilityWheelPixel00, event )
							local AbilityWheelPixel00Frame5 = function ( AbilityWheelPixel00, event )
								local AbilityWheelPixel00Frame6 = function ( AbilityWheelPixel00, event )
									local AbilityWheelPixel00Frame7 = function ( AbilityWheelPixel00, event )
										if not event.interrupted then
											AbilityWheelPixel00:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										end
										AbilityWheelPixel00:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( AbilityWheelPixel00, event )
										else
											AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										AbilityWheelPixel00Frame7( AbilityWheelPixel00, event )
										return 
									else
										AbilityWheelPixel00:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										AbilityWheelPixel00:setAlpha( 0 )
										AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame7 )
									end
								end
								
								if event.interrupted then
									AbilityWheelPixel00Frame6( AbilityWheelPixel00, event )
									return 
								else
									AbilityWheelPixel00:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									AbilityWheelPixel00:setAlpha( 1 )
									AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame6 )
								end
							end
							
							if event.interrupted then
								AbilityWheelPixel00Frame5( AbilityWheelPixel00, event )
								return 
							else
								AbilityWheelPixel00:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
								AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame5 )
							end
						end
						
						if event.interrupted then
							AbilityWheelPixel00Frame4( AbilityWheelPixel00, event )
							return 
						else
							AbilityWheelPixel00:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							AbilityWheelPixel00:setAlpha( 0 )
							AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame4 )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel00Frame3( AbilityWheelPixel00, event )
						return 
					else
						AbilityWheelPixel00:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame3 )
					end
				end
				
				AbilityWheelPixel00:completeAnimation()
				self.AbilityWheelPixel00:setAlpha( 1 )
				AbilityWheelPixel00Frame2( AbilityWheelPixel00, {} )
				self.nextClip = "DefaultClip"
			end
		},
		IsOutOfBounds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AbilityWheelPixel00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

