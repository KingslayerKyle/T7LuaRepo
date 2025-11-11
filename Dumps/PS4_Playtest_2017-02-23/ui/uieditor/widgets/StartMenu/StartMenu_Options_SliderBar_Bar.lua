CoD.StartMenu_Options_SliderBar_Bar = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_SliderBar_Bar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_SliderBar_Bar )
	self.id = "StartMenu_Options_SliderBar_Bar"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 9 )
	self:setTopBottom( 0, 0, 0, 31 )
	
	local Bar = LUI.UIImage.new()
	Bar:setLeftRight( 0, 0, 0, 9 )
	Bar:setTopBottom( 0.5, 0.5, -6.5, 6.5 )
	self:addElement( Bar )
	self.Bar = Bar
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

