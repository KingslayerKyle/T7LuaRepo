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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

