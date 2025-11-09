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
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, true, -10, 0 )
	LeftPanel:setTopBottom( true, true, 0, 0 )
	LeftPanel:setRGB( 0.23, 0.23, 0.23 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local StartMenuCampaignBG = CoD.StartMenu_CampaignBG.new( self, controller )
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
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
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
		self:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
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
	
	local TabFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
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
	
	local SocialFrame = CoD.GenericMenuFrame.new( self, controller )
	SocialFrame:setLeftRight( true, true, 0, 0 )
	SocialFrame:setTopBottom( true, true, 0, 0 )
	SocialFrame.titleLabel:setText( Engine.Localize( "MENU_SOCIAL_CAPS" ) )
	SocialFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SOCIAL_CAPS" ) )
	self:addElement( SocialFrame )
	self.SocialFrame = SocialFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
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
	
	local tabs = CoD.FE_TabBar.new( self, controller )
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
	
	local GroupsBetaSafeAreaContainer = CoD.GroupsBetaSafeAreaContainer.new( self, controller )
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
		self:updateElementState( GroupsBetaSafeAreaContainer, {
			name = "model_validation",
			menu = self,
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
	self:registerEventHandler( "on_session_start", function ( self, event )
		CoD.Menu.UpdateButtonShownState( self, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:registerEventHandler( "on_session_end", function ( self, event )
		CoD.Menu.UpdateButtonShownState( self, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartySubListFocus" ), function ( model )
		local f17_local0 = self
		local f17_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "SocialMainMenu.managePartySubListFocus"
		}
		CoD.Menu.UpdateButtonShownState( f17_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartySubListSelected" ), function ( model )
		local f18_local0 = self
		local f18_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "SocialMainMenu.managePartySubListSelected"
		}
		CoD.Menu.UpdateButtonShownState( f18_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.tab" ), function ( model )
		local f19_local0 = self
		local f19_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "socialRoot.tab"
		}
		CoD.Menu.UpdateButtonShownState( f19_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f19_local0, self, controller, Enum.LUIButton.LUI_KEY_BACK )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.sort" ), function ( model )
		local f20_local0 = self
		local f20_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "socialRoot.sort"
		}
		CoD.Menu.UpdateButtonShownState( f20_local0, self, controller, Enum.LUIButton.LUI_KEY_BACK )
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f21_local0 = nil
		SocialEnablePresenceCacheAutoupdate( controller, true )
		InitializeGroups( self, self, controller )
		PreserveThumbnails( controller, true )
		if not f21_local0 then
			f21_local0 = self:dispatchEventToChildren( event )
		end
		return f21_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsLobbyHost() and IsGlobalModelValueTrue( element, controller, "SocialMainMenu.managePartySubListFocus" ) and not IsGlobalModelValueTrue( element, controller, "SocialMainMenu.managePartySubListSelected" ) and IsGlobalModelValueEqualTo( element, controller, "socialRoot.tab", "party" ) then
			return true
		elseif IsLobbyHost() and IsGlobalModelValueTrue( element, controller, "SocialMainMenu.managePartySubListSelected" ) and IsGlobalModelValueEqualTo( element, controller, "socialRoot.tab", "party" ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsLobbyHost() and IsGlobalModelValueTrue( element, controller, "SocialMainMenu.managePartySubListFocus" ) and not IsGlobalModelValueTrue( element, controller, "SocialMainMenu.managePartySubListSelected" ) and IsGlobalModelValueEqualTo( element, controller, "socialRoot.tab", "party" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif IsLobbyHost() and IsGlobalModelValueTrue( element, controller, "SocialMainMenu.managePartySubListSelected" ) and IsGlobalModelValueEqualTo( element, controller, "socialRoot.tab", "party" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_ACCEPT" )
			return true
		else
			return false
		end
	end, true )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "S", function ( element, menu, controller, model )
		HandleSocialMenuBack( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, "O", function ( element, menu, controller, model )
		if IsGlobalModelValueEqualTo( element, controller, "socialRoot.tab", "friends" ) and IsGlobalModelValueEqualTo( element, controller, "socialRoot.sort", Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT ) then
			SocialToggleSorting( self, element, controller )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_BACK )
			return true
		elseif IsGlobalModelValueEqualTo( element, controller, "socialRoot.tab", "friends" ) and IsGlobalModelValueEqualTo( element, controller, "socialRoot.sort", Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL ) then
			SocialToggleSorting( self, element, controller )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_BACK )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsGlobalModelValueEqualTo( element, controller, "socialRoot.tab", "friends" ) and IsGlobalModelValueEqualTo( element, controller, "socialRoot.sort", Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_BACK, "MENU_ONLINE_SORT_ALLPHABETICAL" )
			return true
		elseif IsGlobalModelValueEqualTo( element, controller, "socialRoot.tab", "friends" ) and IsGlobalModelValueEqualTo( element, controller, "socialRoot.sort", Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_BACK, "MENU_ONLINE_SORT_MOST_RECENT" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		HandleSocialMenuBack( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
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
		menu = self
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

