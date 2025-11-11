require( "ui.uieditor.menus.Social.Social_PlayerDetailsPopup" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Social.Social_PlayersListButton" )

local PreLoadFunc = function ( self, controller )
	self.socialRootModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
	self.cacheRootModel = Engine.CreateModel( self.socialRootModel, "cache" )
	self.cacheXuid = Engine.CreateModel( self.cacheRootModel, "xuid" )
	self.cacheGametype = Engine.CreateModel( self.cacheRootModel, "gametype" )
	self.cacheMapid = Engine.CreateModel( self.cacheRootModel, "mapid" )
	self.cacheDifficulty = Engine.CreateModel( self.cacheRootModel, "difficulty" )
	self.cachePlaylist = Engine.CreateModel( self.cacheRootModel, "playlist" )
	self.cacheParty = Engine.CreateModel( self.socialRootModel, "party" )
	self.cachePartyUpdate = Engine.CreateModel( self.cacheParty, "update" )
	self.cachePartyTotal = Engine.CreateModel( self.cacheParty, "total" )
	self.cachePartyAvailable = Engine.CreateModel( self.cacheParty, "available" )
	self.cachePartyLeader = Engine.CreateModel( self.cacheParty, "leader" )
	self.cachePartyGamertags = {}
	for i = 1, 18, 1 do
		local pm = Engine.CreateModel( self.cacheParty, "pm_" .. i )
		self.cachePartyGamertags[i] = Engine.CreateModel( pm, "gamertag" )
		Engine.SetModelValue( self.cachePartyGamertags[i], "" )
	end
	Engine.SetModelValue( self.cacheXuid, Engine.StringToXUIDDecimal( "0" ) )
	Engine.SetModelValue( self.cachePartyUpdate, 0 )
	Engine.SetModelValue( self.cachePartyTotal, 0 )
	Engine.SetModelValue( self.cachePartyAvailable, 0 )
	Engine.SetModelValue( self.cachePartyLeader, "" )
end

CoD.Social_PlayersList = InheritFrom( LUI.UIElement )
CoD.Social_PlayersList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_PlayersList )
	self.id = "Social_PlayersList"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 574 )
	self:setTopBottom( 0, 0, 0, 753 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local onlineList = LUI.UIList.new( menu, controller, 8, 0, nil, false, false, 0, 0, false, false )
	onlineList:makeFocusable()
	onlineList:setLeftRight( 0, 0, 3, 564 )
	onlineList:setTopBottom( 0, 0, -1.5, 676.5 )
	onlineList:setWidgetType( CoD.Social_PlayersListButton )
	onlineList:setVerticalCount( 7 )
	onlineList:setSpacing( 8 )
	onlineList:setVerticalCounter( CoD.verticalCounter )
	onlineList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		local element = onlineList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyLockedIn"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	onlineList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		CacheSocialOnlinePlayersListModels( self, element, controller )
		CopyModelFindElement( menu, element, "playerInfo" )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return retVal
	end )
	onlineList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	onlineList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( onlineList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "J", function ( element, menu, controller, model )
		if not IsLobbyLocked() then
			LobbyQuickJoin( self, element, controller, Enum.JoinType.JOIN_TYPE_FRIEND, true )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsLobbyLocked() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "", nil )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( onlineList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsSocialPlayersListEmpty( controller ) then
			SetSelectedFriendXUID( self, element, controller )
			OpenOverlay( self, "Social_PlayerDetailsPopup", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSocialPlayersListEmpty( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( onlineList )
	self.onlineList = onlineList
	
	onlineList.id = "onlineList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.onlineList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.onlineList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

