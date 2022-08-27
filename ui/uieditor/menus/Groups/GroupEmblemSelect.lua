-- 7e73b50cf2a64725d7065cd4879ffeed
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.Common.GroupsBackground" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopLine" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

LUI.createMenu.GroupEmblemSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GroupEmblemSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupEmblemSelect.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local GroupsBackground0 = CoD.GroupsBackground.new( f1_local1, controller )
	GroupsBackground0:setLeftRight( true, false, 0, 1280 )
	GroupsBackground0:setTopBottom( true, false, 0, 720 )
	GroupsBackground0.titleLabel:setText( Engine.Localize( "GROUPS_EMBLEM_TITLE_CAPS" ) )
	self:addElement( GroupsBackground0 )
	self.GroupsBackground0 = GroupsBackground0
	
	local Tab = CoD.basicTabList.new( f1_local1, controller )
	Tab:setLeftRight( true, false, 65, 1155 )
	Tab:setTopBottom( true, false, 125, 165 )
	Tab.grid:setDataSource( "GroupsEmblemTabList" )
	Tab.grid:setWidgetType( CoD.paintshopTabWidget )
	Tab.grid:setHorizontalCount( 4 )
	self:addElement( Tab )
	self.Tab = Tab
	
	local PaintshopLine0 = CoD.PaintshopLine.new( f1_local1, controller )
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
	
	local Frame = LUI.UIFrame.new( f1_local1, controller, 0, 0, false )
	Frame:setLeftRight( true, true, 64, -64 )
	Frame:setTopBottom( true, false, 181, 642 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local MenuFrame = CoD.GenericMenuFrame.new( f1_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "GROUPS_EMBLEM_TITLE_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_EMBLEM_TITLE_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	Frame:linkToElementModel( Tab.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			Frame:changeFrameWidget( tabWidget )
		end
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		GoBack( self, f3_arg2 )
		return true
	end, function ( f4_arg0, f4_arg1, f4_arg2 )
		CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	Frame.id = "Frame"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.Frame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsBackground0:close()
		element.Tab:close()
		element.PaintshopLine0:close()
		element.MenuFrame:close()
		element.Frame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupEmblemSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

