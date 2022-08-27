-- 21772e2b11495b42179fc5214b501dc7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.StartMenu.CP.StartMenu_CampaignBG" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Groups.GroupsBetaSafeAreaContainer" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "SocialMainMenu" )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "anyChildSelected" ), false )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "managePartySubListFocus" ), false )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "managePartySubListSelected" ), false )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "managePartyButtonText" ), "" )
	self:setModel( f1_local0 )
	self.disableLeaderChangePopupShutdown = true
end

LUI.createMenu.Social_Main = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Social_Main" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Social_Main.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f2_local1, controller )
	LeftPanel:setLeftRight( true, true, -10, 0 )
	LeftPanel:setTopBottom( true, true, 0, 0 )
	LeftPanel:setRGB( 0.23, 0.23, 0.23 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local StartMenuCampaignBG = CoD.StartMenu_CampaignBG.new( f2_local1, controller )
	StartMenuCampaignBG:setLeftRight( true, false, 0, 1280 )
	StartMenuCampaignBG:setTopBottom( true, false, 0, 720 )
	StartMenuCampaignBG:setAlpha( 0 )
	self:addElement( StartMenuCampaignBG )
	self.StartMenuCampaignBG = StartMenuCampaignBG
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, -10, 0 )
	black:setTopBottom( true, true, 0, 0 )
	black:setRGB( 0, 0, 0 )
	black:setImage( RegisterImage( "uie_default_white_255" ) )
	self:addElement( black )
	self.black = black
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( f2_local1, controller )
	FadeForStreamer:setLeftRight( true, false, 0, 1280 )
	FadeForStreamer:setTopBottom( true, false, 0, 720 )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 )
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		f2_local1:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f2_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CategoryListPanel0 = LUI.UIImage.new()
	CategoryListPanel0:setLeftRight( false, false, -640, 640 )
	CategoryListPanel0:setTopBottom( false, false, -276, -237 )
	CategoryListPanel0:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel0 )
	self.CategoryListPanel0 = CategoryListPanel0
	
	local TabFrame = LUI.UIFrame.new( f2_local1, controller, 0, 0, false )
	TabFrame:setLeftRight( false, false, -574, 576 )
	TabFrame:setTopBottom( false, false, -208, 312 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -275, -236 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local SocialFrame = CoD.GenericMenuFrame.new( f2_local1, controller )
	SocialFrame:setLeftRight( true, true, 0, 0 )
	SocialFrame:setTopBottom( true, true, 0, 0 )
	SocialFrame.titleLabel:setText( Engine.Localize( "MENU_SOCIAL_CAPS" ) )
	SocialFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SOCIAL_CAPS" ) )
	self:addElement( SocialFrame )
	self.SocialFrame = SocialFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f2_local1, controller )
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
	
	local tabs = CoD.FE_TabBar.new( f2_local1, controller )
	tabs:setLeftRight( true, false, 0, 2496 )
	tabs:setTopBottom( true, false, 85, 126 )
	tabs.Tabs.grid:setDataSource( "SocialTabs" )
	tabs:registerEventHandler( "list_active_changed", function ( element, event )
		local f7_local0 = nil
		SetSocialTab( self, element, controller )
		FetchOnlineFriendsData( self, element, controller )
		PlaySoundSetSound( self, "tab_changed" )
		return f7_local0
	end )
	self:addElement( tabs )
	self.tabs = tabs
	
	local GroupsBetaSafeAreaContainer = CoD.GroupsBetaSafeAreaContainer.new( f2_local1, controller )
	GroupsBetaSafeAreaContainer:setLeftRight( false, false, -640, 640 )
	GroupsBetaSafeAreaContainer:setTopBottom( false, false, -360, 360 )
	GroupsBetaSafeAreaContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f8_local0 = nil
		SizeToSafeArea( element, controller )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	GroupsBetaSafeAreaContainer:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsGroupsBeta() and IsSocialGroupsTabOpen( controller )
			end
		}
	} )
	GroupsBetaSafeAreaContainer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.tab" ), function ( model )
		f2_local1:updateElementState( GroupsBetaSafeAreaContainer, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "socialRoot.tab"
		} )
	end )
	self:addElement( GroupsBetaSafeAreaContainer )
	self.GroupsBetaSafeAreaContainer = GroupsBetaSafeAreaContainer
	
	TabFrame:linkToElementModel( tabs.Tabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			TabFrame:changeFrameWidget( tabWidget )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				StartMenuCampaignBG:completeAnimation()
				self.StartMenuCampaignBG:setAlpha( 1 )
				self.clipFinished( StartMenuCampaignBG, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				BlackBG:completeAnimation()
				self.BlackBG:setAlpha( 1 )
				self.clipFinished( BlackBG, {} )
			end
		},
		InSafehouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				StartMenuCampaignBG:completeAnimation()
				self.StartMenuCampaignBG:setAlpha( 1 )
				self.clipFinished( StartMenuCampaignBG, {} )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "InSafehouse",
			condition = function ( menu, element, event )
				return InSafehouse()
			end
		}
	} )
	self:registerEventHandler( "on_session_start", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:registerEventHandler( "on_session_end", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartySubListFocus" ), function ( model )
		local f17_local0 = self
		local f17_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "SocialMainMenu.managePartySubListFocus"
		}
		CoD.Menu.UpdateButtonShownState( f17_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartySubListSelected" ), function ( model )
		local f18_local0 = self
		local f18_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "SocialMainMenu.managePartySubListSelected"
		}
		CoD.Menu.UpdateButtonShownState( f18_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.tab" ), function ( model )
		local f19_local0 = self
		local f19_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "socialRoot.tab"
		}
		CoD.Menu.UpdateButtonShownState( f19_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f19_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_BACK )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.sort" ), function ( model )
		local f20_local0 = self
		local f20_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "socialRoot.sort"
		}
		CoD.Menu.UpdateButtonShownState( f20_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_BACK )
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f21_local0 = nil
		SocialEnablePresenceCacheAutoupdate( controller, true )
		InitializeGroups( self, element, controller )
		PreserveThumbnails( controller, true )
		if not f21_local0 then
			f21_local0 = element:dispatchEventToChildren( event )
		end
		return f21_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		if IsLobbyHost() and IsGlobalModelValueTrue( f22_arg0, f22_arg2, "SocialMainMenu.managePartySubListFocus" ) and not IsGlobalModelValueTrue( f22_arg0, f22_arg2, "SocialMainMenu.managePartySubListSelected" ) and IsGlobalModelValueEqualTo( f22_arg0, f22_arg2, "socialRoot.tab", "party" ) then
			return true
		elseif IsLobbyHost() and IsGlobalModelValueTrue( f22_arg0, f22_arg2, "SocialMainMenu.managePartySubListSelected" ) and IsGlobalModelValueEqualTo( f22_arg0, f22_arg2, "socialRoot.tab", "party" ) then
			return true
		else
			
		end
	end, function ( f23_arg0, f23_arg1, f23_arg2 )
		if IsLobbyHost() and IsGlobalModelValueTrue( f23_arg0, f23_arg2, "SocialMainMenu.managePartySubListFocus" ) and not IsGlobalModelValueTrue( f23_arg0, f23_arg2, "SocialMainMenu.managePartySubListSelected" ) and IsGlobalModelValueEqualTo( f23_arg0, f23_arg2, "socialRoot.tab", "party" ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif IsLobbyHost() and IsGlobalModelValueTrue( f23_arg0, f23_arg2, "SocialMainMenu.managePartySubListSelected" ) and IsGlobalModelValueEqualTo( f23_arg0, f23_arg2, "socialRoot.tab", "party" ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_ACCEPT" )
			return true
		else
			return false
		end
	end, true )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "S", function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		HandleSocialMenuBack( self, f24_arg0, f24_arg2 )
		return true
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		return false
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, "R", function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		if IsGlobalModelValueEqualTo( f26_arg0, f26_arg2, "socialRoot.tab", "friends" ) and IsGlobalModelValueEqualTo( f26_arg0, f26_arg2, "socialRoot.sort", Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT ) then
			SocialToggleSorting( self, f26_arg0, f26_arg2 )
			UpdateButtonPromptState( f26_arg1, f26_arg0, f26_arg2, Enum.LUIButton.LUI_KEY_BACK )
			return true
		elseif IsGlobalModelValueEqualTo( f26_arg0, f26_arg2, "socialRoot.tab", "friends" ) and IsGlobalModelValueEqualTo( f26_arg0, f26_arg2, "socialRoot.sort", Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL ) then
			SocialToggleSorting( self, f26_arg0, f26_arg2 )
			UpdateButtonPromptState( f26_arg1, f26_arg0, f26_arg2, Enum.LUIButton.LUI_KEY_BACK )
			return true
		else
			
		end
	end, function ( f27_arg0, f27_arg1, f27_arg2 )
		if IsGlobalModelValueEqualTo( f27_arg0, f27_arg2, "socialRoot.tab", "friends" ) and IsGlobalModelValueEqualTo( f27_arg0, f27_arg2, "socialRoot.sort", Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT ) then
			CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton.LUI_KEY_BACK, "MENU_ONLINE_SORT_ALLPHABETICAL" )
			return true
		elseif IsGlobalModelValueEqualTo( f27_arg0, f27_arg2, "socialRoot.tab", "friends" ) and IsGlobalModelValueEqualTo( f27_arg0, f27_arg2, "socialRoot.sort", Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL ) then
			CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton.LUI_KEY_BACK, "MENU_ONLINE_SORT_MOST_RECENT" )
			return true
		else
			return false
		end
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		HandleSocialMenuBack( self, f28_arg0, f28_arg2 )
		return true
	end, function ( f29_arg0, f29_arg1, f29_arg2 )
		CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3 )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( f31_arg0, f31_arg1, f31_arg2 )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( f31_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SocialEnablePresenceCacheAutoupdate( controller, false )
		PreserveThumbnails( controller, false )
		ResetThumbnailViewer( controller )
	end )
	TabFrame.id = "TabFrame"
	SocialFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.TabFrame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.StartMenuCampaignBG:close()
		element.FadeForStreamer:close()
		element.FEMenuLeftGraphics:close()
		element.SocialFrame:close()
		element.SelfIdentityBadge:close()
		element.tabs:close()
		element.GroupsBetaSafeAreaContainer:close()
		element.TabFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Social_Main.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

