-- 8854ef9d8c406c0ca3b6597df569a444
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )

local PreLoadFunc = function ( self, controller )
	CoD.CombatRecordPreventModeChange = true
	self.disablePopupOpenCloseAnim = true
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	CoD.CombatRecordPreventModeChange = nil
end

LUI.createMenu.CombatRecordMP = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordMP" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordMP.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( f3_local1, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 0, 0 )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f3_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 80, 697.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( f3_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_COMBAT_RECORD_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_COMBAT_RECORD_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FETabBar = CoD.FE_TabBar.new( f3_local1, controller )
	FETabBar:setLeftRight( true, false, 0, 2497 )
	FETabBar:setTopBottom( true, false, 84, 125 )
	FETabBar.Tabs.grid:setHorizontalCount( 8 )
	FETabBar.Tabs.grid:setDataSource( "CombatRecordMPTabs" )
	FETabBar:registerEventHandler( "list_active_changed", function ( element, event )
		local f5_local0 = nil
		CombatRecordTabChanged( self, element, controller )
		return f5_local0
	end )
	self:addElement( FETabBar )
	self.FETabBar = FETabBar
	
	local TabFrame = LUI.UIFrame.new( f3_local1, controller, 0, 0, false )
	TabFrame:setLeftRight( false, false, -576, 640 )
	TabFrame:setTopBottom( true, false, 127, 673 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	TabFrame:linkToElementModel( FETabBar.Tabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			TabFrame:changeFrameWidget( tabWidget )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		CombatRecordSetComparing( self, controller, false )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		CombatRecordProfileSnapshotDestroyScreenshot( f8_arg2 )
		GoBack( self, f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	TabFrame.id = "TabFrame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	if not self:restoreState() then
		self.TabFrame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.FETabBar:close()
		element.TabFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordMP.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

