-- 8b0c80400f9b4795f2a3be3b64a01b20
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.Social.Social_PlayerDetailsPopup" )
require( "ui.uieditor.widgets.Social.Social_PlayersListButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

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
	for f1_local0 = 1, 18, 1 do
		self.cachePartyGamertags[f1_local0] = Engine.CreateModel( Engine.CreateModel( self.cacheParty, "pm_" .. f1_local0 ), "gamertag" )
		Engine.SetModelValue( self.cachePartyGamertags[f1_local0], "" )
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
	self:setLeftRight( true, false, 0, 383 )
	self:setTopBottom( true, false, 0, 502 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local onlineList = LUI.UIList.new( menu, controller, 5, 0, nil, false, false, 0, 0, false, false )
	onlineList:makeFocusable()
	onlineList:setLeftRight( true, false, 2, 376 )
	onlineList:setTopBottom( true, false, 0, 450 )
	onlineList:setWidgetType( CoD.Social_PlayersListButton )
	onlineList:setVerticalCount( 7 )
	onlineList:setSpacing( 5 )
	onlineList:setVerticalCounter( CoD.verticalCounter )
	onlineList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		local f3_local0 = onlineList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyLockedIn"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	onlineList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f4_local0 = nil
		CacheSocialOnlinePlayersListModels( self, element, controller )
		CopyModelFindElement( menu, element, "playerInfo" )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return f4_local0
	end )
	onlineList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	onlineList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( onlineList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "J", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if not IsLobbyLocked() then
			LobbyQuickJoin( self, f7_arg0, f7_arg2, Enum.JoinType.JOIN_TYPE_FRIEND, true )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if not IsLobbyLocked() then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( onlineList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if IsSocialPlayersListEmpty( f9_arg2 ) then
			SetSelectedFriendXUID( self, f9_arg0, f9_arg2 )
			OpenOverlay( self, "Social_PlayerDetailsPopup", f9_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		if IsSocialPlayersListEmpty( f10_arg2 ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( onlineList )
	self.onlineList = onlineList
	
	onlineList.id = "onlineList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.onlineList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.onlineList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

