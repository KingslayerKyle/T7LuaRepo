CoD.Social_background = InheritFrom( LUI.UIElement )
CoD.Social_background.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_background )
	self.id = "Social_background"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 112 )
	
	local rightBG = LUI.UIImage.new()
	rightBG:setLeftRight( true, true, 0, 0 )
	rightBG:setTopBottom( true, true, 0, 0 )
	rightBG:setAlpha( 0.05 )
	self:addElement( rightBG )
	self.rightBG = rightBG
	
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

