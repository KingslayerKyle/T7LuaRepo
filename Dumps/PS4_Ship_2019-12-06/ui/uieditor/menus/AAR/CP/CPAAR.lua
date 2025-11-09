require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local PreLoadFunc = function ( self, controller )
	CoD.AARUtilityCP.SetupUIModels( controller )
	self:setModel( Engine.CreateModel( Engine.GetModelForController( controller ), "CPAAR" ) )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f2_arg1 ), "aarAccoladeMapName" ), CoD.AARUtilityCP.GetLastMapName( f2_arg1 ) )
	f2_arg0:subscribeToGlobalModel( f2_arg1, "PerController", "scriptNotify", function ( model )
		if Engine.GetModelValue( model ) == "close_cpaar" then
			f2_arg0:close()
		end
	end )
end

LUI.createMenu.CPAAR = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPAAR" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPAAR.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( true, true, 0, 0 )
	Bg:setTopBottom( true, true, 0, 0 )
	Bg:setRGB( 0, 0, 0 )
	Bg:setAlpha( 0.85 )
	self:addElement( Bg )
	self.Bg = Bg
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local TabFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	TabFrame:setLeftRight( false, false, -576, 576 )
	TabFrame:setTopBottom( true, false, 137, 647 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( true, true, -9, 5 )
	TitleBacking:setTopBottom( false, false, -361, -238 )
	TitleBacking:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local tabBar = CoD.FE_TabBar.new( self, controller )
	tabBar:setLeftRight( true, true, 0, 1216 )
	tabBar:setTopBottom( true, false, 84, 125 )
	tabBar.Tabs.grid:setDataSource( "AARTabs" )
	self:addElement( tabBar )
	self.tabBar = tabBar
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_AAR_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_AAR_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 95, 712.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	TabFrame:linkToElementModel( tabBar.Tabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			TabFrame:changeFrameWidget( tabWidget )
		end
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "aarRewards.aarRewardsCount" ), function ( model )
		local f6_local0 = self
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "aarRewards.aarRewardsCount"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f6_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsPerControllerTablePropertyValue( controller, "fromMaxLevelMessage", true ) and IsModelValueEqualTo( controller, "aarRewards.aarRewardsCount", 0 ) then
			SendOwnMenuResponse( menu, controller, "closed" )
			SetStableStatsBuffer( controller )
			LockInput( self, controller, false )
			GoBack( self, controller )
			CloseCPAAR( menu, controller )
			Close( self, controller )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "fromMaxLevelMessage", true ) then
			SendOwnMenuResponse( menu, controller, "closed" )
			SetStableStatsBuffer( controller )
			LockInput( self, controller, false )
			GoBackMultiple( self, controller, "2" )
			CloseCPAAR( menu, controller )
			Close( self, controller )
			return true
		else
			SendOwnMenuResponse( menu, controller, "closed" )
			SetStableStatsBuffer( controller )
			LockInput( self, controller, false )
			CloseCPAAR( menu, controller )
			Close( self, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if not IsModelValueEqualTo( controller, "aarRewards.aarRewardsCount", 0 ) then
			GoBack( self, controller )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "fromMaxLevelMessage", true ) then
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsModelValueEqualTo( controller, "aarRewards.aarRewardsCount", 0 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "fromMaxLevelMessage", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		else
			return false
		end
	end, false )
	TabFrame.id = "TabFrame"
	MenuFrame:setModel( self.buttonModel, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.tabBar:close()
		element.MenuFrame:close()
		element.FEMenuLeftGraphics:close()
		element.TabFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPAAR.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

