-- 83e147cd36e155b04652a60732244afd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.CP.StartMenu_CampaignBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModel( self:getModel(), "highestMapReached" )
	if f1_local0 ~= nil then
		if nil == CoD.MissionRecordVaultMenu then
			CoD.MissionRecordVaultMenu = {}
		end
		CoD.MissionRecordVaultMenu.highestMapReached = Engine.GetModelValue( f1_local0 )
	end
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0.close
	f2_arg0.close = function ( f3_arg0 )
		f3_arg0:unsubscribeFromAllModels()
		f2_local0( f3_arg0 )
	end
	
end

LUI.createMenu.MissionRecordVaultMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MissionRecordVaultMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MissionRecordVaultMenu.buttonPrompts" )
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 0, 0 )
	black:setTopBottom( true, true, 0, 0 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.95 )
	self:addElement( black )
	self.black = black
	
	local StartMenuCampaignBG = CoD.StartMenu_CampaignBG.new( f4_local1, controller )
	StartMenuCampaignBG:setLeftRight( true, true, 0, 0 )
	StartMenuCampaignBG:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuCampaignBG )
	self.StartMenuCampaignBG = StartMenuCampaignBG
	
	local GridBG = LUI.UIImage.new()
	GridBG:setLeftRight( true, true, -16, 1 )
	GridBG:setTopBottom( true, true, -68, 0 )
	GridBG:setAlpha( 0 )
	GridBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_gridbg" ) )
	GridBG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	GridBG:setShaderVector( 0, 26, 17, 0, 0 )
	GridBG:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( GridBG )
	self.GridBG = GridBG
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f4_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, true, 95, -7.75 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( true, true, 0, 0 )
	CategoryListPanel:setTopBottom( true, false, 84, 123 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local frame = LUI.UIFrame.new( f4_local1, controller, 0, 0, false )
	frame:setLeftRight( false, false, -576, 576 )
	frame:setTopBottom( true, false, 136, 646 )
	frame:linkToElementModel( self, nil, false, function ( model )
		frame:setModel( model, controller )
	end )
	self:addElement( frame )
	self.frame = frame
	
	local CategoryListPanel0 = LUI.UIImage.new()
	CategoryListPanel0:setLeftRight( true, true, 0, 0 )
	CategoryListPanel0:setTopBottom( true, false, 85, 124 )
	CategoryListPanel0:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel0 )
	self.CategoryListPanel0 = CategoryListPanel0
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( f4_local1, controller )
	GenericMenuFrame:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "CPUI_MISSION_RECORD_VAULT" ) ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( "CPUI_MISSION_RECORD_VAULT" ) ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_medals" ) )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local FETabBar = CoD.FE_TabBar.new( f4_local1, controller )
	FETabBar:setLeftRight( true, true, -16, 1200 )
	FETabBar:setTopBottom( true, false, 84, 125 )
	FETabBar.Tabs.grid:setDataSource( "MissionRecordVaultTabs" )
	self:addElement( FETabBar )
	self.FETabBar = FETabBar
	
	frame:linkToElementModel( FETabBar.Tabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			frame:changeFrameWidget( tabWidget )
		end
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f7_local0 = nil
		if TestAndSetFirstTimeMenu( controller, "com_firsttime_mrv" ) then
			OpenGenericLargePopup( f4_local1, controller, "MENU_FIRSTTIME_MRV", "MENU_FIRSTTIME_MRV2", "com_firsttime_mrv_image", "MENU_FIRSTTIME_MRV_BUTTONTEXT", "", "" )
		end
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f8_local0 = nil
		PlayClipOnElement( self, {
			elementName = "selectMenuWidget",
			clipName = ""
		}, controller )
		PrepareOpenMenuInSafehouse( controller )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "GenericMenuFrame0",
			clipName = "Intro"
		}, controller )
		ShowHeaderIconOnly( f4_local1 )
		PlayClip( self, "Intro", controller )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		SendMenuResponse( self, "MissionRecordVaultMenu", "closed", f9_arg2 )
		PrepareCloseMenuInSafehouse( f9_arg2 )
		Close( self, f9_arg2 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	frame.id = "frame"
	GenericMenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f4_local1
	} )
	if not self:restoreState() then
		self.frame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuCampaignBG:close()
		element.FEMenuLeftGraphics:close()
		element.GenericMenuFrame:close()
		element.FETabBar:close()
		element.frame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MissionRecordVaultMenu.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

