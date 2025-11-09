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
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 29 )
	
	local FEListHeader0 = CoD.FE_ListHeader.new( menu, controller )
	FEListHeader0:setLeftRight( true, false, 60, 199 )
	FEListHeader0:setTopBottom( true, false, 2, 30 )
	FEListHeader0:setRGB( 1, 1, 1 )
	FEListHeader0:setZoom( 5 )
	FEListHeader0.btnDisplayTextStroke:setText( Engine.Localize( "QUICK JOIN" ) )
	self:addElement( FEListHeader0 )
	self.FEListHeader0 = FEListHeader0
	
	self.close = function ( self )
		self.FEListHeader0:close()
		CoD.FE_ListHeaderFull.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

