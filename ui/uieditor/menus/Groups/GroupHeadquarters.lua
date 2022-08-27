-- 9eef0d0ae8d6d10e6fc21e7d87d5bcb3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopLine" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Groups.GroupsBetaSafeAreaContainer" )
require( "ui.uieditor.widgets.Groups.Headquarters.OverviewTab" )
require( "ui.uieditor.widgets.Groups.Headquarters.RosterTab" )
require( "ui.uieditor.widgets.Groups.Headquarters.BadgesTab" )
require( "ui.uieditor.widgets.Groups.Headquarters.LeaderboardTab" )
require( "ui.uieditor.widgets.Groups.Headquarters.ShareTab" )
require( "ui.uieditor.widgets.Groups.Headquarters.AdminTab" )
require( "ui.uieditor.menus.Groups.LeaderboardMaker" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "Social.selectedFriendXUID" )
	CoD.FileshareUtility.InitModels()
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0:setModel( CoD.perController[f2_arg1].selectedGroup )
	SetSelectingGroupEmblem( f2_arg1, true, false )
	LUI.OverrideFunction_CallOriginalFirst( f2_arg0, "close", function ( element )
		SetSelectingGroupEmblem( f2_arg1, false, false )
	end )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f2_arg1 ), "leaderboards.leaderboardPlayerFilter" ), Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
	CoD.perController[f2_arg1].leaderboardPlayerFilter = Enum.LbFilter.LB_FILTER_GROUP_MEMBERS
end

LUI.createMenu.GroupHeadquarters = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GroupHeadquarters" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupHeadquarters.buttonPrompts" )
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 101.5, 465.5 )
	Title:setTopBottom( true, false, 51.5, 99.5 )
	Title:setAlpha( 0 )
	Title:setText( Engine.Localize( "GROUPS_HEADQUARTERS" ) )
	Title:setTTF( "fonts/default.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local PaintshopLine0 = CoD.PaintshopLine.new( f4_local1, controller )
	PaintshopLine0:setLeftRight( true, false, 65.52, 1213.52 )
	PaintshopLine0:setTopBottom( true, false, 173.36, 177.36 )
	PaintshopLine0:setAlpha( 0 )
	self:addElement( PaintshopLine0 )
	self.PaintshopLine0 = PaintshopLine0
	
	local panel = LUI.UIImage.new()
	panel:setLeftRight( true, false, 64, 1216 )
	panel:setTopBottom( true, false, 152, 642 )
	panel:setRGB( 0.15, 0.15, 0.15 )
	panel:setAlpha( 0 )
	self:addElement( panel )
	self.panel = panel
	
	local Frame = LUI.UIFrame.new( f4_local1, controller, 0, 0, false )
	Frame:setLeftRight( true, true, 64, -64 )
	Frame:setTopBottom( true, false, 152, 642 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( true, true, 0, 0 )
	CategoryListPanel:setTopBottom( false, false, -275, -236 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local MenuFrame = CoD.GenericMenuFrame.new( f4_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	MenuFrame:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			MenuFrame.titleLabel:setText( name )
		end
	end )
	MenuFrame:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( name )
		end
	end )
	MenuFrame:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FETabBar0 = CoD.FE_TabBar.new( f4_local1, controller )
	FETabBar0:setLeftRight( true, false, -1, 4999 )
	FETabBar0:setTopBottom( true, false, 84, 125 )
	FETabBar0.Tabs.grid:setHorizontalCount( 7 )
	FETabBar0.Tabs.grid:setDataSource( "GroupsHeadquartersTabList" )
	self:addElement( FETabBar0 )
	self.FETabBar0 = FETabBar0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f4_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f4_local1, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 24, 84 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local GroupsBetaSafeAreaContainer = CoD.GroupsBetaSafeAreaContainer.new( f4_local1, controller )
	GroupsBetaSafeAreaContainer:setLeftRight( false, false, -640, 640 )
	GroupsBetaSafeAreaContainer:setTopBottom( false, false, -360, 360 )
	GroupsBetaSafeAreaContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f10_local0 = nil
		SizeToSafeArea( element, controller )
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	GroupsBetaSafeAreaContainer:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsGroupsBeta()
			end
		}
	} )
	self:addElement( GroupsBetaSafeAreaContainer )
	self.GroupsBetaSafeAreaContainer = GroupsBetaSafeAreaContainer
	
	Frame:linkToElementModel( FETabBar0.Tabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			Frame:changeFrameWidget( tabWidget )
		end
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.grouphqtabname" ), function ( model )
		local f13_local0 = self
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.grouphqtabname"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, f4_local1, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f14_local0 = nil
		HandleGroupHeadquartersKeyboardComplete( self, element, controller, event )
		if not f14_local0 then
			f14_local0 = element:dispatchEventToChildren( event )
		end
		return f14_local0
	end )
	self:registerEventHandler( "list_active_changed", function ( element, event )
		local f15_local0 = nil
		SetGroupHeadquarterTabName( self, element, controller )
		return f15_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f16_local0 = nil
		SendClientScriptMenuChangeNotify( controller, f4_local1, true )
		MediaManagerClearDisplay( self, element, controller )
		ShowHeaderGroupHQ( f4_local1 )
		SetHeadingKickerText( "GROUPS_GROUP_HEADQUARTERS_CAPS" )
		PreserveThumbnails( controller, true )
		if not f16_local0 then
			f16_local0 = element:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		UpdateSelectedGroupInfo( self, f17_arg0, f17_arg2 )
		ClearSelectedGroup( self, f17_arg0, f17_arg2 )
		SetControllerModelValue( f17_arg2, "groups.highlightGroupsTabInSocial", true )
		ClearCurrentlyOpenedGroup( f17_arg2 )
		GoBack( self, f17_arg2 )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if AlwaysFalse() then
			return true
		else
			return false
		end
	end, true )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if ShouldOpenGroupOptionsPopup( f21_arg0, f21_arg2 ) then
			OpenGroupOptionsPopup( self, f21_arg0, f21_arg2 )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		if ShouldOpenGroupOptionsPopup( f22_arg0, f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendClientScriptMenuChangeNotify( controller, f4_local1, false )
		SetControllerModelValue( controller, "groups.grouphqtabname", "" )
		PreserveThumbnails( controller, false )
		ResetThumbnailViewer( controller )
	end )
	Frame.id = "Frame"
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
		self.Frame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PaintshopLine0:close()
		element.MenuFrame:close()
		element.FETabBar0:close()
		element.FEMenuLeftGraphics:close()
		element.SelfIdentityBadge:close()
		element.GroupsBetaSafeAreaContainer:close()
		element.Frame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupHeadquarters.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

