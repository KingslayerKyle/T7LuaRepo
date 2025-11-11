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
	self:setLeftRight( 0, 0, 0, 144 )
	self:setTopBottom( 0, 0, 0, 60 )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

