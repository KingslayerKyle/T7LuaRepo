require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.BM_FocusFrame = InheritFrom( LUI.UIElement )
CoD.BM_FocusFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_FocusFrame )
	self.id = "BM_FocusFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 243 )
	self:setTopBottom( 0, 0, 0, 303 )
	self.anyChildUsesUpdateState = true
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, 0 )
	FocusBarT:setTopBottom( 0, 0, 297, 303 )
	FocusBarT:setXRot( 180 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FocusBarT:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

