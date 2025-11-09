require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )

CoD.StartMenu_tabs = InheritFrom( LUI.UIElement )
CoD.StartMenu_tabs.new = function ( menu, controller )
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
	self:setClass( CoD.StartMenu_tabs )
	self.id = "StartMenu_tabs"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
	local IMGLeft = LUI.UIImage.new()
	IMGLeft:setLeftRight( true, false, 0, 64 )
	IMGLeft:setTopBottom( true, false, 0, 40 )
	IMGLeft:setRGB( 1, 1, 1 )
	IMGLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( IMGLeft )
	self.IMGLeft = IMGLeft
	
	local Tabs = CoD.basicTabList.new( menu, controller )
	Tabs:setLeftRight( true, false, 64, 1216 )
	Tabs:setTopBottom( true, false, 0, 40 )
	Tabs:setRGB( 1, 1, 1 )
	Tabs.grid:setDataSource( "StartMenuTabs" )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	Tabs.grid:setHorizontalCount( 7 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local IMGRight = LUI.UIImage.new()
	IMGRight:setLeftRight( true, true, 1464, 64 )
	IMGRight:setTopBottom( true, false, 0, 40 )
	IMGRight:setRGB( 1, 1, 1 )
	IMGRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( IMGRight )
	self.IMGRight = IMGRight
	
	self.close = function ( self )
		self.Tabs:close()
		CoD.StartMenu_tabs.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

