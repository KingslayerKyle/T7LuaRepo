require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )

local PreLoadFunc = function ( self, controller )
	CoD.CombatRecordPreventModeChange = true
end

local PostLoadFunc = function ( self, controller )
	CoD.CombatRecordPreventModeChange = nil
end

LUI.createMenu.CombatRecordMP = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordMP" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordMP.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	StartMenuBackground0:setLeftRight( 0, 1, 0, 0 )
	StartMenuBackground0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 27, 105 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 120, 1046 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_COMBAT_RECORD_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_COMBAT_RECORD_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FETabBar = CoD.FE_TabBar.new( self, controller )
	FETabBar:setLeftRight( 0, 0, 0, 3746 )
	FETabBar:setTopBottom( 0, 0, 126, 188 )
	FETabBar.Tabs.grid:setHorizontalCount( 8 )
	FETabBar.Tabs.grid:setDataSource( "CombatRecordMPTabs" )
	FETabBar:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		CombatRecordTabChanged( self, element, controller )
		return retVal
	end )
	self:addElement( FETabBar )
	self.FETabBar = FETabBar
	
	local TabFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	TabFrame:setLeftRight( 0.5, 0.5, -864, 960 )
	TabFrame:setTopBottom( 0, 0, 190, 1009 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	TabFrame:linkToElementModel( FETabBar.Tabs.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TabFrame:changeFrameWidget( modelValue )
		end
	end )
	MenuFrame.navigation = {
		right = TabFrame,
		down = TabFrame
	}
	TabFrame.navigation = {
		left = MenuFrame,
		up = MenuFrame
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		CombatRecordSetComparing( self, controller, false )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	MenuFrame.id = "MenuFrame"
	TabFrame.id = "TabFrame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.TabFrame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.FEMenuLeftGraphics:close()
		self.MenuFrame:close()
		self.FETabBar:close()
		self.TabFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordMP.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

