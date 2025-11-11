CoD.AtviCopy = InheritFrom( LUI.UIElement )
CoD.AtviCopy.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.AtviCopy )
	self.id = "AtviCopy"
	self.soundSet = "FrontendMain"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local ActivisionIncDurango = LUI.UIImage.new()
	ActivisionIncDurango:setLeftRight( 1, 1, -262, 14 )
	ActivisionIncDurango:setTopBottom( 0, 0, 45, 87 )
	ActivisionIncDurango:setRGB( 0.68, 0.68, 0.68 )
	ActivisionIncDurango:setAlpha( 0.9 )
	ActivisionIncDurango:setImage( RegisterImage( "uie_t7_activisionpublishinginc" ) )
	self:addElement( ActivisionIncDurango )
	self.ActivisionIncDurango = ActivisionIncDurango
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

