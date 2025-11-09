require( "ui.uieditor.widgets.Groups.Common.GroupsBackground" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopLine" )
require( "ui.uieditor.widgets.Groups.MyGroupsTab" )
require( "ui.uieditor.widgets.Groups.FindGroupsTab" )

LUI.createMenu.Groups = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Groups" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Groups.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GroupsBackground0 = CoD.GroupsBackground.new( self, controller )
	GroupsBackground0:setLeftRight( true, false, 0, 1280 )
	GroupsBackground0:setTopBottom( true, false, 0, 720 )
	GroupsBackground0.titleLabel:setText( Engine.Localize( "GROUPS_CAPS" ) )
	self:addElement( GroupsBackground0 )
	self.GroupsBackground0 = GroupsBackground0
	
	local Tab = CoD.basicTabList.new( self, controller )
	Tab:setLeftRight( true, false, 65, 1155 )
	Tab:setTopBottom( true, false, 125, 165 )
	Tab.grid:setDataSource( "GroupsMainTabList" )
	Tab.grid:setWidgetType( CoD.paintshopTabWidget )
	Tab.grid:setHorizontalCount( 4 )
	self:addElement( Tab )
	self.Tab = Tab
	
	local PaintshopLine0 = CoD.PaintshopLine.new( self, controller )
	PaintshopLine0:setLeftRight( true, false, 65.52, 1213.52 )
	PaintshopLine0:setTopBottom( true, false, 173.36, 177.36 )
	PaintshopLine0:setAlpha( 0 )
	self:addElement( PaintshopLine0 )
	self.PaintshopLine0 = PaintshopLine0
	
	local Panel = LUI.UIImage.new()
	Panel:setLeftRight( true, false, 64, 1216 )
	Panel:setTopBottom( true, false, 181, 642 )
	Panel:setRGB( 0.15, 0.15, 0.15 )
	Panel:setAlpha( 0.8 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local Frame = LUI.UIFrame.new( self, controller, 0, 0, false )
	Frame:setLeftRight( true, true, 64, -64 )
	Frame:setTopBottom( true, false, 181, 642 )
	self:addElement( Frame )
	self.Frame = Frame
	
	Frame:linkToElementModel( Tab.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Frame:changeFrameWidget( modelValue )
		end
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	Frame.id = "Frame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Frame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupsBackground0:close()
		self.Tab:close()
		self.PaintshopLine0:close()
		self.Frame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Groups.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

