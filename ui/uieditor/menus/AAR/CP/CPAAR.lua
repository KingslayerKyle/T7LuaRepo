-- 0131c901636232b6d7e6d5ae0dfab4b5
-- This hash is used for caching, delete to decompile the file again

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
	local f4_local1 = self
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
	
	local TabFrame = LUI.UIFrame.new( f4_local1, controller, 0, 0, false )
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
	
	local tabBar = CoD.FE_TabBar.new( f4_local1, controller )
	tabBar:setLeftRight( true, true, 0, 1216 )
	tabBar:setTopBottom( true, false, 84, 125 )
	tabBar.Tabs.grid:setDataSource( "AARTabs" )
	self:addElement( tabBar )
	self.tabBar = tabBar
	
	local MenuFrame = CoD.GenericMenuFrame.new( f4_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_AAR_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_AAR_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f4_local1, controller )
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
		CoD.Menu.UpdateButtonShownState( f6_local0, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f6_local0, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if IsPerControllerTablePropertyValue( f7_arg2, "fromMaxLevelMessage", true ) and IsModelValueEqualTo( f7_arg2, "aarRewards.aarRewardsCount", 0 ) then
			SendOwnMenuResponse( f7_arg1, f7_arg2, "closed" )
			SetStableStatsBuffer( f7_arg2 )
			LockInput( self, f7_arg2, false )
			GoBack( self, f7_arg2 )
			CloseCPAAR( f7_arg1, f7_arg2 )
			Close( self, f7_arg2 )
			return true
		elseif IsPerControllerTablePropertyValue( f7_arg2, "fromMaxLevelMessage", true ) then
			SendOwnMenuResponse( f7_arg1, f7_arg2, "closed" )
			SetStableStatsBuffer( f7_arg2 )
			LockInput( self, f7_arg2, false )
			GoBackMultiple( self, f7_arg2, "2" )
			CloseCPAAR( f7_arg1, f7_arg2 )
			Close( self, f7_arg2 )
			return true
		else
			SendOwnMenuResponse( f7_arg1, f7_arg2, "closed" )
			SetStableStatsBuffer( f7_arg2 )
			LockInput( self, f7_arg2, false )
			CloseCPAAR( f7_arg1, f7_arg2 )
			Close( self, f7_arg2 )
			return true
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
		return true
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if not IsModelValueEqualTo( f9_arg2, "aarRewards.aarRewardsCount", 0 ) then
			GoBack( self, f9_arg2 )
			return true
		elseif IsPerControllerTablePropertyValue( f9_arg2, "fromMaxLevelMessage", true ) then
			GoBack( self, f9_arg2 )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		if not IsModelValueEqualTo( f10_arg2, "aarRewards.aarRewardsCount", 0 ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		elseif IsPerControllerTablePropertyValue( f10_arg2, "fromMaxLevelMessage", true ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f4_local1
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

