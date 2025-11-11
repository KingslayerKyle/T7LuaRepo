require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeader" )

CoD.FE_ListHeaderFull = InheritFrom( LUI.UIElement )
CoD.FE_ListHeaderFull.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ListHeaderFull )
	self.id = "FE_ListHeaderFull"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 735 )
	self:setTopBottom( 0, 0, 0, 43 )
	
	local FEListHeader0 = CoD.FE_ListHeader.new( menu, controller )
	FEListHeader0:setLeftRight( 0, 0, 90, 612 )
	FEListHeader0:setTopBottom( 0, 0, 3, 45 )
	FEListHeader0:setZoom( 5 )
	FEListHeader0.btnDisplayTextStroke:setText( Engine.Localize( "QUICK JOIN" ) )
	FEListHeader0.btnDisplayTextStroke:setShaderVector( 0, 0.06, 0, 0, 0 )
	FEListHeader0.btnDisplayTextStroke:setShaderVector( 1, 0.02, 0, 0, 0 )
	FEListHeader0.btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( FEListHeader0 )
	self.FEListHeader0 = FEListHeader0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEListHeader0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

