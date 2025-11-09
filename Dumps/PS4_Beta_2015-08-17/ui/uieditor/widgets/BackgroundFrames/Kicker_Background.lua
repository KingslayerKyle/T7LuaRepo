CoD.Kicker_Background = InheritFrom( LUI.UIElement )
CoD.Kicker_Background.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Kicker_Background )
	self.id = "Kicker_Background"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 16 )
	
	local KickerBackground = LUI.UIImage.new()
	KickerBackground:setLeftRight( true, true, 0, 0 )
	KickerBackground:setTopBottom( true, true, 0, 1 )
	KickerBackground:setRGB( 0.34, 0.34, 0.34 )
	self:addElement( KickerBackground )
	self.KickerBackground = KickerBackground
	
	self.clipsPerState = {
		DefaultState = {
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

