-- 3a3fa565896a584488ed53011dd9dd21
-- This hash is used for caching, delete to decompile the file again

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
	FEListHeader0:setLeftRight( true, false, 60, 408 )
	FEListHeader0:setTopBottom( true, false, 2, 30 )
	FEListHeader0:setZoom( 5 )
	FEListHeader0.btnDisplayTextStroke:setText( Engine.Localize( "QUICK JOIN" ) )
	self:addElement( FEListHeader0 )
	self.FEListHeader0 = FEListHeader0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEListHeader0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

