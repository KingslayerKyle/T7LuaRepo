CoD.YellowLine = InheritFrom( LUI.UIElement )
CoD.YellowLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.YellowLine )
	self.id = "YellowLine"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 2 )
	self:setTopBottom( true, false, 0, 124 )
	
	local YellowLine = LUI.UIImage.new()
	YellowLine:setLeftRight( true, false, 0, 2 )
	YellowLine:setTopBottom( true, false, 0, 124 )
	YellowLine:setRGB( ColorSet.PlayerYellow.r, ColorSet.PlayerYellow.g, ColorSet.PlayerYellow.b )
	YellowLine:setAlpha( 0.75 )
	self:addElement( YellowLine )
	self.YellowLine = YellowLine
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local YellowLineFrame2 = function ( YellowLine, event )
					local YellowLineFrame3 = function ( YellowLine, event )
						if not event.interrupted then
							YellowLine:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
						end
						YellowLine:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( YellowLine, event )
						else
							YellowLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						YellowLineFrame3( YellowLine, event )
						return 
					else
						YellowLine:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						YellowLine:registerEventHandler( "transition_complete_keyframe", YellowLineFrame3 )
					end
				end
				
				YellowLine:completeAnimation()
				self.YellowLine:setAlpha( 0 )
				YellowLineFrame2( YellowLine, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

