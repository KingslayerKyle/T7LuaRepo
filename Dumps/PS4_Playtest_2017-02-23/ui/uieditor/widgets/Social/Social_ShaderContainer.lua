CoD.Social_ShaderContainer = InheritFrom( LUI.UIElement )
CoD.Social_ShaderContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_ShaderContainer )
	self.id = "Social_ShaderContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 42 )
	
	local white = LUI.UIImage.new()
	white:setLeftRight( 0, 1, 0, 0 )
	white:setTopBottom( 0, 1, 0, 0 )
	self:addElement( white )
	self.white = white
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

