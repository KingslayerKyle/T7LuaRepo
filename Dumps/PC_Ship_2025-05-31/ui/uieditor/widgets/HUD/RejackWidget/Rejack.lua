require( "ui.uieditor.widgets.HUD.RejackWidget.RejackInternal" )

CoD.Rejack = InheritFrom( LUI.UIElement )
CoD.Rejack.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Rejack )
	self.id = "Rejack"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 300 )
	self.anyChildUsesUpdateState = true
	
	local RejackInternal = CoD.RejackInternal.new( menu, controller )
	RejackInternal:setLeftRight( true, true, 0, 0 )
	RejackInternal:setTopBottom( true, true, 0, 0 )
	Engine.SetupUI3DWindow( controller, 4, 600, 300 )
	RejackInternal:setUI3DWindow( 4 )
	self:addElement( RejackInternal )
	self.RejackInternal = RejackInternal
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RejackInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

