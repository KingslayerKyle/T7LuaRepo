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
	self:setLeftRight( 0, 0, 0, 168 )
	self:setTopBottom( 0, 0, 0, 168 )
	
	local rightBG = LUI.UIImage.new()
	rightBG:setLeftRight( 0, 1, 0, 0 )
	rightBG:setTopBottom( 0, 1, 0, 0 )
	rightBG:setAlpha( 0.05 )
	self:addElement( rightBG )
	self.rightBG = rightBG
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

