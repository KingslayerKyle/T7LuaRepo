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
	self:setLeftRight( 0, 0, 0, 7500 )
	self:setTopBottom( 0, 0, 0, 61 )
	self.anyChildUsesUpdateState = true
	
	local FETabIdle00 = CoD.FE_TabIdle.new( menu, controller )
	FETabIdle00:setLeftRight( 0, 0, 0, 96 )
	FETabIdle00:setTopBottom( 0, 0, -2, 61 )
	self:addElement( FETabIdle00 )
	self.FETabIdle00 = FETabIdle00
	
	local Tabs = CoD.basicTabList.new( menu, controller )
	Tabs:setLeftRight( 0, 0, 96, 1824 )
	Tabs:setTopBottom( 0, 0, 2, 62 )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local FETabIdle0 = CoD.FE_TabIdle.new( menu, controller )
	FETabIdle0:setLeftRight( 0, 0, 1824, 7500 )
	FETabIdle0:setTopBottom( 0, 0, -2, 61 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETabIdle00:close()
		self.Tabs:close()
		self.FETabIdle0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

