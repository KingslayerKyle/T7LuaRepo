require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.StartMenu.CP.StartMenu_CampaignBG" )

local PreLoadFunc = function ( self, controller )
	local menuModel = Engine.CreateModel( Engine.GetGlobalModel(), "SocialMainMenu" )
	Engine.SetModelValue( Engine.CreateModel( menuModel, "anyChildSelected" ), false )
	Engine.SetModelValue( Engine.CreateModel( menuModel, "managePartySubListFocus" ), false )
	Engine.SetModelValue( Engine.CreateModel( menuModel, "managePartySubListSelected" ), false )
	Engine.SetModelValue( Engine.CreateModel( menuModel, "managePartyButtonText" ), "" )
	self:setModel( menuModel )
	self.disableLeaderChangePopupShutdown = true
end

LUI.createMenu.Social_Main = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Social_Main" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Social_Main.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 1, -16, 0 )
	LeftPanel:setTopBottom( 0, 1, 0, 0 )
	LeftPanel:setRGB( 0.23, 0.23, 0.23 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local StartMenuCampaignBG = CoD.StartMenu_CampaignBG.new( self, controller )
	StartMenuCampaignBG:setLeftRight( 0, 0, 0, 1920 )
	StartMenuCampaignBG:setTopBottom( 0, 0, 0, 1080 )
	StartMenuCampaignBG:setAlpha( 0 )
	self:addElement( StartMenuCampaignBG )
	self.StartMenuCampaignBG = StartMenuCampaignBG
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0, 1, -16, 0 )
	black:setTopBottom( 0, 1, 0, 0 )
	black:setRGB( 0, 0, 0 )
	self:addElement( black )
	self.black = black
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
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
	FadeForStreamer:setLeftRight( 0, 0, 0, 1920 )
	FadeForStreamer:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 27, 105 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 136, 1062 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CategoryListPanel0 = LUI.UIImage.new()
	CategoryListPanel0:setLeftRight( 0.5, 0.5, -960, 960 )
	CategoryListPanel0:setTopBottom( 0.5, 0.5, -414, -356 )
	CategoryListPanel0:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel0 )
	self.CategoryListPanel0 = CategoryListPanel0
	
	local TabFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	TabFrame:setLeftRight( 0.5, 0.5, -861, 864 )
	TabFrame:setTopBottom( 0.5, 0.5, -312, 468 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( 0.5, 0.5, -960, 960 )
	CategoryListPanel:setTopBottom( 0.5, 0.5, -412, -354 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local SocialFrame = CoD.GenericMenuFrame.new( self, controller )
	SocialFrame:setLeftRight( 0, 1, 0, 0 )
	SocialFrame:setTopBottom( 0, 1, 0, 0 )
	SocialFrame.titleLabel:setText( Engine.Localize( "MENU_SOCIAL_CAPS" ) )
	SocialFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SOCIAL_CAPS" ) )
	self:addElement( SocialFrame )
	self.SocialFrame = SocialFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( 1, 1, -652, -138 )
	SelfIdentityBadge:setTopBottom( 0, 0, 36, 126 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local tabs = CoD.FE_TabBar.new( self, controller )
	tabs:setLeftRight( 0, 0, 0, 3744 )
	tabs:setTopBottom( 0, 0, 127, 189 )
	tabs.Tabs.grid:setDataSource( "SocialTabs" )
	tabs:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		SetSocialTab( self, element, controller )
		FetchOnlineFriendsData( self, element, controller )
		PlaySoundSetSound( self, "tab_changed" )
		return retVal
	end )
	self:addElement( tabs )
	self.tabs = tabs
	
	TabFrame:linkToElementModel( tabs.Tabs.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TabFrame:changeFrameWidget( modelValue )
		end
	end )
	TabFrame.navigation = {
		up = SelfIdentityBadge
	}
	SelfIdentityBadge.navigation = {
		down = TabFrame
	}
	self.resetProperties = function ()
		black:completeAnimation()
		StartMenuCampaignBG:completeAnimation()
		black:setAlpha( 1 )
		StartMenuCampaignBG:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				StartMenuCampaignBG:completeAnimation()
				self.StartMenuCampaignBG:setAlpha( 1 )
				self.clipFinished( StartMenuCampaignBG, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
			end
		},
		InSafehouse = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				StartMenuCampaignBG:completeAnimation()
				self.StartMenuCampaignBG:setAlpha( 1 )
				self.clipFinished( StartMenuCampaignBG, {} )
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
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:registerEventHandler( "on_session_end", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartySubListFocus" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "SocialMainMenu.managePartySubListFocus"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartySubListSelected" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "SocialMainMenu.managePartySubListSelected"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.tab" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "socialRoot.tab"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_BACK )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.sort" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "socialRoot.sort"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_BACK )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		SocialEnablePresenceCacheAutoupdate( controller, true )
		FetchGroupsInfo( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif IsLobbyHost() and IsGlobalModelValueTrue( element, controller, "SocialMainMenu.managePartySubListSelected" ) and IsGlobalModelValueEqualTo( element, controller, "socialRoot.tab", "party" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_ACCEPT", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "S", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_BACK, "MENU_ONLINE_SORT_ALLPHABETICAL", nil )
			return true
		elseif IsGlobalModelValueEqualTo( element, controller, "socialRoot.tab", "friends" ) and IsGlobalModelValueEqualTo( element, controller, "socialRoot.sort", Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_BACK, "MENU_ONLINE_SORT_MOST_RECENT", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		HandleSocialMenuBack( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SocialEnablePresenceCacheAutoupdate( controller, false )
	end )
	TabFrame.id = "TabFrame"
	SocialFrame:setModel( self.buttonModel, controller )
	SelfIdentityBadge.id = "SelfIdentityBadge"
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
		self.LeftPanel:close()
		self.StartMenuCampaignBG:close()
		self.FadeForStreamer:close()
		self.FEMenuLeftGraphics:close()
		self.SocialFrame:close()
		self.SelfIdentityBadge:close()
		self.tabs:close()
		self.TabFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Social_Main.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

