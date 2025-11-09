require( "ui.uieditor.widgets.Tablet.TabletLocationSelector_Internal" )

CoD.TabletLocationSelector = InheritFrom( LUI.UIElement )
CoD.TabletLocationSelector.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TabletLocationSelector )
	self.id = "TabletLocationSelector"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 300 )
	
	local internal = CoD.TabletLocationSelector_Internal.new( menu, controller )
	internal:setLeftRight( true, true, 0, 0 )
	internal:setTopBottom( true, true, 0, 0 )
	Engine.SetupUI3DWindow( 1, 500, 300 )
	internal:setUI3DWindow( 1 )
	internal:setRGB( 1, 1, 1 )
	self:addElement( internal )
	self.internal = internal
	
	self.close = function ( self )
		self.internal:close()
		CoD.TabletLocationSelector.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

