-- 6c5fdeb3810e83e5a4e14b3bdb617373
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )

LUI.createMenu.DOA_INGAME_PAUSE = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "DOA_INGAME_PAUSE" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "DOA_INGAME_PAUSE.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local bevel = LUI.UIImage.new()
	bevel:setLeftRight( true, true, 0, 0 )
	bevel:setTopBottom( true, true, 0, 0 )
	bevel:setImage( RegisterImage( "uie_menu_zom_bezel_overlay" ) )
	self:addElement( bevel )
	self.bevel = bevel
	
	local Tabs = CoD.basicTabList.new( f1_local1, controller )
	Tabs:setLeftRight( true, false, 242, 1394 )
	Tabs:setTopBottom( true, false, 71, 111 )
	Tabs.grid:setDataSource( "StartMenuTabs" )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	Tabs.grid:setHorizontalCount( 5 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local TabFrame = LUI.UIFrame.new( f1_local1, controller, 0, 0, false )
	TabFrame:setLeftRight( false, false, -442, 463 )
	TabFrame:setTopBottom( false, false, -249, 271 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	TabFrame:linkToElementModel( Tabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			TabFrame:changeFrameWidget( tabWidget )
		end
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		StartMenuGoBack( f3_arg1, f3_arg2 )
		return true
	end, function ( f4_arg0, f4_arg1, f4_arg2 )
		CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		StartMenuGoBack( f5_arg1, f5_arg2 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_START, "" )
		return false
	end, false )
	TabFrame.id = "TabFrame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.TabFrame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Tabs:close()
		element.TabFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "DOA_INGAME_PAUSE.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

