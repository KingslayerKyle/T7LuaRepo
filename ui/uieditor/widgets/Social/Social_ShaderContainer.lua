-- 5ce549cd7beb19486685940918922659
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 28 )
	
	local white = LUI.UIImage.new()
	white:setLeftRight( true, true, 0, 0 )
	white:setTopBottom( true, true, 0, 0 )
	self:addElement( white )
	self.white = white
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

