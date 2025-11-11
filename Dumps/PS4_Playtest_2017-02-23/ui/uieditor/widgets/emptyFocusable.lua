CoD.emptyFocusable = InheritFrom( LUI.UIElement )
CoD.emptyFocusable.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.emptyFocusable )
	self.id = "emptyFocusable"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( 0, 1, 0, 0 )
	spacer:setTopBottom( 0, 1, 0, 0 )
	spacer:setAlpha( 0 )
	self:addElement( spacer )
	self.spacer = spacer
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

