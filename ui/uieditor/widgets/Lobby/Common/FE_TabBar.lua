-- 3ef003621780d1cee368705d81e42c73
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_TabIdle" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )

CoD.FE_TabBar = InheritFrom( LUI.UIElement )
CoD.FE_TabBar.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TabBar )
	self.id = "FE_TabBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 5000 )
	self:setTopBottom( true, false, 0, 41 )
	self.anyChildUsesUpdateState = true
	
	local FETabIdle00 = CoD.FE_TabIdle.new( menu, controller )
	FETabIdle00:setLeftRight( true, false, 0, 64 )
	FETabIdle00:setTopBottom( true, false, -1, 41 )
	self:addElement( FETabIdle00 )
	self.FETabIdle00 = FETabIdle00
	
	local Tabs = CoD.basicTabList.new( menu, controller )
	Tabs:setLeftRight( true, false, 64, 1216 )
	Tabs:setTopBottom( true, false, 1, 41 )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local FETabIdle0 = CoD.FE_TabIdle.new( menu, controller )
	FETabIdle0:setLeftRight( true, false, 1216, 5000 )
	FETabIdle0:setTopBottom( true, false, -1, 41 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FETabIdle00:close()
		element.Tabs:close()
		element.FETabIdle0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

