-- d9b4593d86c86bbb27e24b89becc14ed
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.PersonalDataVault.CollectiblePlacementWidgets.smallCollectibles" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )

LUI.createMenu.InspectingCollectibles = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "InspectingCollectibles" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "InspectingCollectibles.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local CategoryListPanel0 = LUI.UIImage.new()
	CategoryListPanel0:setLeftRight( true, true, 0, 0 )
	CategoryListPanel0:setTopBottom( true, false, 86, 126 )
	CategoryListPanel0:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel0 )
	self.CategoryListPanel0 = CategoryListPanel0
	
	local frame = LUI.UIFrame.new( f1_local1, controller, 0, 0, false )
	frame:setLeftRight( false, false, -574.5, 574.5 )
	frame:setTopBottom( true, false, 167.5, 624.5 )
	frame:setAlpha( 0 )
	self:addElement( frame )
	self.frame = frame
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( f1_local1, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "CPUI_COLLECTIBLES_CAPS" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "CPUI_COLLECTIBLES_CAPS" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f1_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, true, 97, -6 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local FETabBar = CoD.FE_TabBar.new( f1_local1, controller )
	FETabBar:setLeftRight( true, true, 0, 1216 )
	FETabBar:setTopBottom( true, false, 85, 126 )
	FETabBar.Tabs.grid:setDataSource( "PlaceCollectiblesTabs" )
	FETabBar:registerEventHandler( "list_active_changed", function ( element, event )
		local f2_local0 = nil
		PDV_ChangeCollectibleArea( self, element, controller )
		return f2_local0
	end )
	self:addElement( FETabBar )
	self.FETabBar = FETabBar
	
	frame:linkToElementModel( FETabBar.Tabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			frame:changeFrameWidget( tabWidget )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		LockInput( self, controller, true )
		SendClientScriptMenuChangeNotify( controller, f1_local1, true )
		SetPerControllerTableProperty( controller, "isOpeningInspecting", false )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		LockInput( self, f5_arg2, false )
		PlaySoundSetSound( self, "menu_go_back" )
		SendClientScriptMenuChangeNotify( f5_arg2, f5_arg1, false )
		SendOwnMenuResponse( f5_arg1, f5_arg2, "closed" )
		ClearSavedState( self, f5_arg2 )
		Close( self, f5_arg2 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		if not IsPerControllerTablePropertyValue( controller, "isOpeningInspecting", true ) then
			LockInput( self, controller, false )
			SendClientScriptMenuChangeNotify( controller, f1_local1, false )
			SendOwnMenuResponse( f1_local1, controller, "closed" )
			ClearSavedState( self, controller )
		end
	end )
	frame.id = "frame"
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.frame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GenericMenuFrame0:close()
		element.FEMenuLeftGraphics:close()
		element.FETabBar:close()
		element.frame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "InspectingCollectibles.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

