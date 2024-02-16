CoD.MyShowcase_Showcase = InheritFrom( LUI.UIElement )
CoD.MyShowcase_Showcase.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MyShowcase_Showcase )
	self.id = "MyShowcase_Showcase"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

