-- 470ae95521d81fb99e92557e8272f024
-- This hash is used for caching, delete to decompile the file again

CoD.StartMenu_WhiteGlow = InheritFrom( LUI.UIElement )
CoD.StartMenu_WhiteGlow.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_WhiteGlow )
	self.id = "StartMenu_WhiteGlow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 40 )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
