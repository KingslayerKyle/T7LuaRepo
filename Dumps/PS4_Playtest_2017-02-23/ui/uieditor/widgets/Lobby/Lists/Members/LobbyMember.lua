require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_MemberBlurPanelContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.AnonymousPlayer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.IconControllerContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.IconJoinable" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyLeaderIcon" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBubbleGumBuffs" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberGamertag" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberPartyMemberIconNew" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberReady" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberScore" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberTeamColor" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberTeamSwitcher" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyRank" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.SearchingForPlayer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.SearchingForPlayer_Flipped" )

local PostLoadFunc = function ( self, controller, menu )
	self:registerEventHandler( "team_switch", function ( self, event )
		local controller = event.controller
		local switchTeam = event.switchTeam
		local controllerXuid = event.xuid
		if not controllerXuid then
			controllerXuid = Engine.GetXUID64( controller )
		end
		local index = self.gridInfoTable.zeroBasedIndex + 1
		local list = self.gridInfoTable.parentGrid
		local rowModel = DataSources.LobbyList.getItem( controller, list, index )
		local xuidModel = Engine.GetModel( rowModel, "xuid" )
		local xuid = Engine.GetModelValue( xuidModel )
		if controllerXuid ~= xuid then
			return 
		else
			Engine.SetModelValue( Engine.CreateModel( rowModel, "teamSwitch" ), switchTeam )
			self.LobbyMemberTeamColor:SetupTeamSwitch( switchTeam )
			self.TeamSwitcher:SetupTeamSwitch( switchTeam )
		end
	end )
	self:linkToElementModel( self, "team", true, function ( model )
		if model then
			Engine.SetModelValue( Engine.CreateModel( self:getModel(), "teamSwitch" ), Engine.GetModelValue( model ) )
			self.LobbyMemberTeamColor:SetupTeamColorBackground( Engine.GetModelValue( model ) )
		end
	end )
end

CoD.LobbyMember = InheritFrom( LUI.UIElement )
CoD.LobbyMember.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMember )
	self.id = "LobbyMember"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 735 )
	self:setTopBottom( 0, 0, 0, 40 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local sizeElement = LUI.UIImage.new()
	sizeElement:setLeftRight( 0, 0, 0, 735 )
	sizeElement:setTopBottom( 0, 0, 0, 40 )
	sizeElement:setAlpha( 0 )
	self:addElement( sizeElement )
	self.sizeElement = sizeElement
	
	local LobbyMemberBubbleGumBuffs = CoD.LobbyMemberBubbleGumBuffs.new( menu, controller )
	LobbyMemberBubbleGumBuffs:setLeftRight( 0, 0, 90, 612 )
	LobbyMemberBubbleGumBuffs:setTopBottom( 0, 0, 40, 136 )
	LobbyMemberBubbleGumBuffs:setAlpha( 0 )
	LobbyMemberBubbleGumBuffs:linkToElementModel( self, nil, false, function ( model )
		LobbyMemberBubbleGumBuffs:setModel( model, controller )
	end )
	self:addElement( LobbyMemberBubbleGumBuffs )
	self.LobbyMemberBubbleGumBuffs = LobbyMemberBubbleGumBuffs
	
	local PartyMemberIconNew = CoD.LobbyMemberPartyMemberIconNew.new( menu, controller )
	PartyMemberIconNew:mergeStateConditions( {
		{
			stateName = "PartyMemberTopOrMiddle",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isPartyMemberTopOrMiddle" )
			end
		},
		{
			stateName = "PartyMember",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isPartyMember" )
			end
		},
		{
			stateName = "OtherPartyMemberTopOrMiddle",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isOtherMemberTopOrMiddle" )
			end
		},
		{
			stateName = "OtherPartyMember",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isOtherMember" )
			end
		}
	} )
	PartyMemberIconNew:linkToElementModel( PartyMemberIconNew, "isPartyMemberTopOrMiddle", true, function ( model )
		menu:updateElementState( PartyMemberIconNew, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPartyMemberTopOrMiddle"
		} )
	end )
	PartyMemberIconNew:linkToElementModel( PartyMemberIconNew, "isPartyMember", true, function ( model )
		menu:updateElementState( PartyMemberIconNew, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPartyMember"
		} )
	end )
	PartyMemberIconNew:linkToElementModel( PartyMemberIconNew, "isOtherMemberTopOrMiddle", true, function ( model )
		menu:updateElementState( PartyMemberIconNew, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isOtherMemberTopOrMiddle"
		} )
	end )
	PartyMemberIconNew:linkToElementModel( PartyMemberIconNew, "isOtherMember", true, function ( model )
		menu:updateElementState( PartyMemberIconNew, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isOtherMember"
		} )
	end )
	PartyMemberIconNew:setLeftRight( 0, 0, 618.5, 633.5 )
	PartyMemberIconNew:setTopBottom( 0, 0, 0, 38 )
	PartyMemberIconNew:linkToElementModel( self, nil, false, function ( model )
		PartyMemberIconNew:setModel( model, controller )
	end )
	self:addElement( PartyMemberIconNew )
	self.PartyMemberIconNew = PartyMemberIconNew
	
	local LobbyLeaderIcon = CoD.LobbyLeaderIcon.new( menu, controller )
	LobbyLeaderIcon:setLeftRight( 0, 0, 616, 652 )
	LobbyLeaderIcon:setTopBottom( 0, 0, 1, 39 )
	LobbyLeaderIcon:linkToElementModel( self, "isMemberLeader", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LobbyLeaderIcon.Leader:setAlpha( modelValue )
		end
	end )
	self:addElement( LobbyLeaderIcon )
	self.LobbyLeaderIcon = LobbyLeaderIcon
	
	local FEMemberBlurPanelContainer0 = CoD.FE_MemberBlurPanelContainer.new( menu, controller )
	FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
	FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -21, 20 )
	FEMemberBlurPanelContainer0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FEMemberBlurPanelContainer0 )
	self.FEMemberBlurPanelContainer0 = FEMemberBlurPanelContainer0
	
	local VSpanel = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel:setLeftRight( 0, 1, 90, -122 )
	VSpanel:setTopBottom( 0.5, 0.5, -21, 20 )
	VSpanel:setRGB( 0.19, 0.19, 0.19 )
	VSpanel:setAlpha( 0 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local LobbyMemberBacking = CoD.FE_ButtonPanel.new( menu, controller )
	LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
	LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
	LobbyMemberBacking:setRGB( 0.15, 0.15, 0.15 )
	LobbyMemberBacking:setAlpha( 0 )
	self:addElement( LobbyMemberBacking )
	self.LobbyMemberBacking = LobbyMemberBacking
	
	local LobbyMemberTeamColor = CoD.LobbyMemberTeamColor.new( menu, controller )
	LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
	LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
	LobbyMemberTeamColor:linkToElementModel( self, nil, false, function ( model )
		LobbyMemberTeamColor:setModel( model, controller )
	end )
	self:addElement( LobbyMemberTeamColor )
	self.LobbyMemberTeamColor = LobbyMemberTeamColor
	
	local rank = CoD.LobbyRank.new( menu, controller )
	rank:setLeftRight( 1, 1, -641.5, -566.5 )
	rank:setTopBottom( 0, 0, 1, 39 )
	rank:linkToElementModel( self, nil, false, function ( model )
		rank:setModel( model, controller )
	end )
	self:addElement( rank )
	self.rank = rank
	
	local clanTag = LUI.UITightText.new()
	clanTag:setLeftRight( 0, 0, 162, 264 )
	clanTag:setTopBottom( 0, 0, 4, 36 )
	clanTag:setRGB( 0.96, 1, 0.33 )
	clanTag:setAlpha( 0 )
	clanTag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( clanTag )
	self.clanTag = clanTag
	
	local PrimaryGroup = LUI.UIText.new()
	PrimaryGroup:setLeftRight( 0, 0, 174, 482 )
	PrimaryGroup:setTopBottom( 0, 0, 22, 46 )
	PrimaryGroup:setRGB( 0.87, 0.9, 0.9 )
	PrimaryGroup:setAlpha( 0 )
	PrimaryGroup:setText( Engine.Localize( "Group Here" ) )
	PrimaryGroup:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PrimaryGroup:setLetterSpacing( 1 )
	PrimaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PrimaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PrimaryGroup )
	self.PrimaryGroup = PrimaryGroup
	
	local addControllerText = LUI.UIText.new()
	addControllerText:setLeftRight( 0, 0, 92, 692 )
	addControllerText:setTopBottom( 0, 0, 3, 29 )
	addControllerText:setRGB( 0.42, 0.52, 0.62 )
	addControllerText:setAlpha( 0 )
	addControllerText:setZoom( 10 )
	addControllerText:setText( Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLUGIN" ) )
	addControllerText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	addControllerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	addControllerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( addControllerText )
	self.addControllerText = addControllerText
	
	local MorePlaying = LUI.UIText.new()
	MorePlaying:setLeftRight( 0, 0, 28, 763 )
	MorePlaying:setTopBottom( 0, 0, 3, 29 )
	MorePlaying:setRGB( 0.42, 0.52, 0.62 )
	MorePlaying:setAlpha( 0 )
	MorePlaying:setZoom( 10 )
	MorePlaying:setText( Engine.Localize( "MENU_LOBBY_MORECOUNT" ) )
	MorePlaying:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	MorePlaying:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MorePlaying:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MorePlaying )
	self.MorePlaying = MorePlaying
	
	local playerCountText = LUI.UITightText.new()
	playerCountText:setLeftRight( 0, 0, 92, 500 )
	playerCountText:setTopBottom( 0, 0, 10, 36 )
	playerCountText:setRGB( 0.42, 0.52, 0.62 )
	playerCountText:setAlpha( 0 )
	playerCountText:setText( Engine.Localize( "MENU_LOBBY_PLAYERCOUNT" ) )
	playerCountText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( playerCountText )
	self.playerCountText = playerCountText
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 0, 87, 615 )
	FocusBarB:setTopBottom( 0, 0, 39, 43 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 0, 87, 615 )
	FocusBarT:setTopBottom( 0, 0, -6, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local IconControllerContainer = CoD.IconControllerContainer.new( menu, controller )
	IconControllerContainer:setLeftRight( 0, 0, 3, 89 )
	IconControllerContainer:setTopBottom( 0, 0, -4, 44 )
	IconControllerContainer:setRGB( 0.74, 0.78, 0.79 )
	IconControllerContainer:linkToElementModel( self, nil, false, function ( model )
		IconControllerContainer:setModel( model, controller )
	end )
	self:addElement( IconControllerContainer )
	self.IconControllerContainer = IconControllerContainer
	
	local IconJoinable = CoD.IconJoinable.new( menu, controller )
	IconJoinable:setLeftRight( 0, 0, 584, 620 )
	IconJoinable:setTopBottom( 0, 0, 2, 40 )
	IconJoinable:setAlpha( 0 )
	self:addElement( IconJoinable )
	self.IconJoinable = IconJoinable
	
	local gamertag = CoD.LobbyMemberGamertag.new( menu, controller )
	gamertag:setLeftRight( 0, 0, 173, 579 )
	gamertag:setTopBottom( 0, 0, 1, 39 )
	gamertag:setRGB( 0.96, 1, 0.33 )
	gamertag:linkToElementModel( self, nil, false, function ( model )
		gamertag:setModel( model, controller )
	end )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	local TeamSwitcher = CoD.LobbyMemberTeamSwitcher.new( menu, controller )
	TeamSwitcher:setLeftRight( 0, 0, 368, 612 )
	TeamSwitcher:setTopBottom( 0, 0, 0, 39 )
	self:addElement( TeamSwitcher )
	self.TeamSwitcher = TeamSwitcher
	
	local LobbyLeaderIcon0 = CoD.LobbyLeaderIcon.new( menu, controller )
	LobbyLeaderIcon0:mergeStateConditions( {
		{
			stateName = "TopOrMiddleZM",
			condition = function ( menu, element, event )
				local f20_local0 = IsSelfModelValueTrue( element, controller, "isPartyMemberTopOrMiddle" )
				if f20_local0 then
					f20_local0 = IsZM()
					if f20_local0 then
						f20_local0 = LobbyHas4PlayersOrLess()
					end
				end
				return f20_local0
			end
		},
		{
			stateName = "TopOrMiddle",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isPartyMemberTopOrMiddle" )
			end
		},
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LobbyLeaderIcon0:linkToElementModel( LobbyLeaderIcon0, "isPartyMemberTopOrMiddle", true, function ( model )
		menu:updateElementState( LobbyLeaderIcon0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPartyMemberTopOrMiddle"
		} )
	end )
	LobbyLeaderIcon0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		menu:updateElementState( LobbyLeaderIcon0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyMainMode"
		} )
	end )
	LobbyLeaderIcon0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( LobbyLeaderIcon0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	if LobbyLeaderIcon0.m_eventHandlers.on_client_added then
		local currentEv = LobbyLeaderIcon0.m_eventHandlers.on_client_added
		LobbyLeaderIcon0:registerEventHandler( "on_client_added", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		LobbyLeaderIcon0:registerEventHandler( "on_client_added", LUI.UIElement.updateState )
	end
	if LobbyLeaderIcon0.m_eventHandlers.on_client_removed then
		local currentEv = LobbyLeaderIcon0.m_eventHandlers.on_client_removed
		LobbyLeaderIcon0:registerEventHandler( "on_client_removed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		LobbyLeaderIcon0:registerEventHandler( "on_client_removed", LUI.UIElement.updateState )
	end
	LobbyLeaderIcon0:setLeftRight( 0, 0, 616, 652 )
	LobbyLeaderIcon0:setTopBottom( 0, 0, 1, 39 )
	LobbyLeaderIcon0:setAlpha( 0 )
	LobbyLeaderIcon0:linkToElementModel( self, "isMemberLeader", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LobbyLeaderIcon0.Leader:setAlpha( modelValue )
		end
	end )
	self:addElement( LobbyLeaderIcon0 )
	self.LobbyLeaderIcon0 = LobbyLeaderIcon0
	
	local currentEv = CoD.LobbyMemberScore.new( menu, controller )
	currentEv:mergeStateConditions( {
		{
			stateName = "Hidden2",
			condition = function ( menu, element, event )
				return IsCustomLobby()
			end
		}
	} )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	currentEv:setLeftRight( 0, 0, 532, 614 )
	currentEv:setTopBottom( 0, 0, 1, 39 )
	currentEv:linkToElementModel( self, nil, false, function ( model )
		currentEv:setModel( model, controller )
	end )
	self:addElement( currentEv )
	self.LobbyMemberScore = currentEv
	
	local SearchingForPlayer = CoD.SearchingForPlayer.new( menu, controller )
	SearchingForPlayer:setLeftRight( 0, 0, 173, 579 )
	SearchingForPlayer:setTopBottom( 0, 0, 1, 39 )
	SearchingForPlayer:setAlpha( 0 )
	self:addElement( SearchingForPlayer )
	self.SearchingForPlayer = SearchingForPlayer
	
	local SearchingForPlayerFlipped = CoD.SearchingForPlayer_Flipped.new( menu, controller )
	SearchingForPlayerFlipped:setLeftRight( 0, 0, 173, 579 )
	SearchingForPlayerFlipped:setTopBottom( 0, 0, 1, 39 )
	SearchingForPlayerFlipped:setAlpha( 0 )
	self:addElement( SearchingForPlayerFlipped )
	self.SearchingForPlayerFlipped = SearchingForPlayerFlipped
	
	local AnonymousPlayer = CoD.AnonymousPlayer.new( menu, controller )
	AnonymousPlayer:setLeftRight( 0, 0, 173, 579 )
	AnonymousPlayer:setTopBottom( 0, 0, 1, 39 )
	AnonymousPlayer:setAlpha( 0 )
	self:addElement( AnonymousPlayer )
	self.AnonymousPlayer = AnonymousPlayer
	
	local LobbyMemberReady = CoD.LobbyMemberReady.new( menu, controller )
	LobbyMemberReady:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsReadyUpVisible( element, controller )
			end
		}
	} )
	LobbyMemberReady:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( LobbyMemberReady, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	LobbyMemberReady:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( LobbyMemberReady, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	LobbyMemberReady:linkToElementModel( LobbyMemberReady, "isReady", true, function ( model )
		menu:updateElementState( LobbyMemberReady, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isReady"
		} )
	end )
	LobbyMemberReady:setLeftRight( 0, 0, 19, 57 )
	LobbyMemberReady:setTopBottom( 0, 0, 1, 39 )
	LobbyMemberReady:linkToElementModel( self, nil, false, function ( model )
		LobbyMemberReady:setModel( model, controller )
	end )
	self:addElement( LobbyMemberReady )
	self.LobbyMemberReady = LobbyMemberReady
	
	self.clanTag:linkToElementModel( self, "clanTag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			clanTag:setText( modelValue )
		end
	end )
	self.resetProperties = function ()
		clanTag:completeAnimation()
		gamertag:completeAnimation()
		VSpanel:completeAnimation()
		LobbyMemberReady:completeAnimation()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		LobbyMemberTeamColor:completeAnimation()
		LobbyMemberBacking:completeAnimation()
		FEMemberBlurPanelContainer0:completeAnimation()
		rank:completeAnimation()
		LobbyLeaderIcon0:completeAnimation()
		IconControllerContainer:completeAnimation()
		PartyMemberIconNew:completeAnimation()
		sizeElement:completeAnimation()
		LobbyMemberBubbleGumBuffs:completeAnimation()
		PrimaryGroup:completeAnimation()
		LobbyLeaderIcon:completeAnimation()
		TeamSwitcher:completeAnimation()
		currentEv:completeAnimation()
		SearchingForPlayer:completeAnimation()
		SearchingForPlayerFlipped:completeAnimation()
		AnonymousPlayer:completeAnimation()
		clanTag:setRGB( 0.96, 1, 0.33 )
		gamertag:setLeftRight( 0, 0, 173, 579 )
		gamertag:setTopBottom( 0, 0, 1, 39 )
		gamertag:setRGB( 0.96, 1, 0.33 )
		gamertag:setAlpha( 1 )
		VSpanel:setLeftRight( 0, 1, 90, -122 )
		VSpanel:setTopBottom( 0.5, 0.5, -21, 20 )
		VSpanel:setAlpha( 0 )
		LobbyMemberReady:setAlpha( 1 )
		FocusBarT:setLeftRight( 0, 0, 87, 615 )
		FocusBarT:setTopBottom( 0, 0, -6, 0 )
		FocusBarT:setAlpha( 0 )
		FocusBarB:setLeftRight( 0, 0, 87, 615 )
		FocusBarB:setTopBottom( 0, 0, 39, 43 )
		FocusBarB:setAlpha( 0 )
		LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
		LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
		LobbyMemberTeamColor:setZoom( 0 )
		LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
		LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
		LobbyMemberBacking:setAlpha( 0 )
		LobbyMemberBacking:setZoom( 0 )
		FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
		FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -21, 20 )
		FEMemberBlurPanelContainer0:setAlpha( 1 )
		rank:setRGB( 1, 1, 1 )
		rank:setAlpha( 1 )
		rank:setZoom( 0 )
		rank:setScale( 1 )
		LobbyLeaderIcon0:setAlpha( 0 )
		IconControllerContainer:setAlpha( 1 )
		PartyMemberIconNew:setLeftRight( 0, 0, 618.5, 633.5 )
		PartyMemberIconNew:setTopBottom( 0, 0, 0, 38 )
		PartyMemberIconNew:setAlpha( 1 )
		sizeElement:setLeftRight( 0, 0, 0, 735 )
		sizeElement:setTopBottom( 0, 0, 0, 40 )
		LobbyMemberBubbleGumBuffs:setLeftRight( 0, 0, 90, 612 )
		LobbyMemberBubbleGumBuffs:setTopBottom( 0, 0, 40, 136 )
		LobbyMemberBubbleGumBuffs:setAlpha( 0 )
		PrimaryGroup:setAlpha( 0 )
		LobbyLeaderIcon:setAlpha( 1 )
		TeamSwitcher:setAlpha( 1 )
		currentEv:setAlpha( 1 )
		SearchingForPlayer:setAlpha( 0 )
		SearchingForPlayerFlipped:setAlpha( 0 )
		AnonymousPlayer:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				PartyMemberIconNew:completeAnimation()
				self.clipFinished( PartyMemberIconNew, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.clipFinished( rank, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.87, 0.9, 0.9 )
				self.clipFinished( clanTag, {} )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.clipFinished( gamertag, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 0 )
				self.clipFinished( LobbyMemberReady, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -6.5, 47.5 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
				self.VSpanel:setAlpha( 1 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -7.5, 48.5 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -11.5, 49.5 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -28.5, 27.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -21, 20 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -7.5, 48.5 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -8, 48 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 43, 49 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 18, 22 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 87, 615 )
					FocusBarT:setTopBottom( 0, 0, -9, -3 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 89, 615 )
				self.FocusBarT:setTopBottom( 0, 0, 18, 24 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -21, 20 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -28.5, 27.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
					LobbyMemberBacking:setAlpha( 0 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -7.5, 48.5 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -8, 48 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local rankFrame2 = function ( rank, event )
					if not event.interrupted then
						rank:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					rank:setScale( 1 )
					if event.interrupted then
						self.clipFinished( rank, event )
					else
						rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				rank:completeAnimation()
				self.rank:setScale( 1 )
				rankFrame2( rank, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 18, 22 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 89, 615 )
					FocusBarT:setTopBottom( 0, 0, 18, 24 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -21, 20 )
					FEMemberBlurPanelContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -21, 20 )
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0 )
				VSpanelFrame2( VSpanel, {} )
				local rankFrame2 = function ( rank, event )
					local rankFrame3 = function ( rank, event )
						if not event.interrupted then
							rank:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
						end
						rank:setRGB( 1, 1, 1 )
						rank:setAlpha( 1 )
						rank:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( rank, event )
						else
							rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						rankFrame3( rank, event )
						return 
					else
						rank:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						rank:registerEventHandler( "transition_complete_keyframe", rankFrame3 )
					end
				end
				
				rank:completeAnimation()
				self.rank:setRGB( 1, 1, 1 )
				self.rank:setAlpha( 0 )
				self.rank:setZoom( 0 )
				rankFrame2( rank, {} )
				local IconControllerContainerFrame2 = function ( IconControllerContainer, event )
					local IconControllerContainerFrame3 = function ( IconControllerContainer, event )
						if not event.interrupted then
							IconControllerContainer:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Bounce )
						end
						IconControllerContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( IconControllerContainer, event )
						else
							IconControllerContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						IconControllerContainerFrame3( IconControllerContainer, event )
						return 
					else
						IconControllerContainer:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						IconControllerContainer:registerEventHandler( "transition_complete_keyframe", IconControllerContainerFrame3 )
					end
				end
				
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 0 )
				IconControllerContainerFrame2( IconControllerContainer, {} )
				local gamertagFrame2 = function ( gamertag, event )
					local gamertagFrame3 = function ( gamertag, event )
						if not event.interrupted then
							gamertag:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Bounce )
						end
						gamertag:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( gamertag, event )
						else
							gamertag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						gamertagFrame3( gamertag, event )
						return 
					else
						gamertag:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						gamertag:registerEventHandler( "transition_complete_keyframe", gamertagFrame3 )
					end
				end
				
				gamertag:completeAnimation()
				self.gamertag:setAlpha( 0 )
				gamertagFrame2( gamertag, {} )
				local LobbyLeaderIcon0Frame2 = function ( LobbyLeaderIcon0, event )
					if not event.interrupted then
						LobbyLeaderIcon0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Bounce )
					end
					LobbyLeaderIcon0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyLeaderIcon0, event )
					else
						LobbyLeaderIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				LobbyLeaderIcon0Frame2( LobbyLeaderIcon0, {} )
			end
		},
		IsSelfZombies = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, 0, 735 )
				self.sizeElement:setTopBottom( 0, 0, 0, 136 )
				self.clipFinished( sizeElement, {} )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( 0, 0, 618.5, 633.5 )
				self.PartyMemberIconNew:setTopBottom( 0, 0, 0, 136 )
				self.clipFinished( PartyMemberIconNew, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -1, 40 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				rank:completeAnimation()
				self.clipFinished( rank, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 133, 139 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local LobbyMemberBubbleGumBuffsFrame2 = function ( LobbyMemberBubbleGumBuffs, event )
					if not event.interrupted then
						LobbyMemberBubbleGumBuffs:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBubbleGumBuffs:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBubbleGumBuffs:setTopBottom( 0, 0, 40, 136 )
					LobbyMemberBubbleGumBuffs:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBubbleGumBuffs, event )
					else
						LobbyMemberBubbleGumBuffs:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( 0, 0, 40, 136 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				LobbyMemberBubbleGumBuffsFrame2( LobbyMemberBubbleGumBuffs, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 133, 139 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 72, 76 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 87, 615 )
					FocusBarT:setTopBottom( 0, 0, -6, 0 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 89, 615 )
				self.FocusBarT:setTopBottom( 0, 0, 72, 78 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local LobbyMemberBubbleGumBuffsFrame2 = function ( LobbyMemberBubbleGumBuffs, event )
					if not event.interrupted then
						LobbyMemberBubbleGumBuffs:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBubbleGumBuffs:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBubbleGumBuffs:setTopBottom( 0, 0, 40, 136 )
					LobbyMemberBubbleGumBuffs:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBubbleGumBuffs, event )
					else
						LobbyMemberBubbleGumBuffs:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( 0, 0, 40, 136 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				LobbyMemberBubbleGumBuffsFrame2( LobbyMemberBubbleGumBuffs, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 72, 76 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 133, 139 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 89, 615 )
					FocusBarT:setTopBottom( 0, 0, 72, 78 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -6, 0 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local LobbyLeaderIconFrame2 = function ( LobbyLeaderIcon, event )
					if not event.interrupted then
						LobbyLeaderIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					LobbyLeaderIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyLeaderIcon, event )
					else
						LobbyLeaderIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				LobbyLeaderIconFrame2( LobbyLeaderIcon, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0 )
				VSpanelFrame2( VSpanel, {} )
				local rankFrame2 = function ( rank, event )
					local rankFrame3 = function ( rank, event )
						if not event.interrupted then
							rank:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						rank:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( rank, event )
						else
							rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						rankFrame3( rank, event )
						return 
					else
						rank:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						rank:registerEventHandler( "transition_complete_keyframe", rankFrame3 )
					end
				end
				
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				rankFrame2( rank, {} )
				local IconControllerContainerFrame2 = function ( IconControllerContainer, event )
					if not event.interrupted then
						IconControllerContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					IconControllerContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( IconControllerContainer, event )
					else
						IconControllerContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 0 )
				IconControllerContainerFrame2( IconControllerContainer, {} )
				local gamertagFrame2 = function ( gamertag, event )
					local gamertagFrame3 = function ( gamertag, event )
						if not event.interrupted then
							gamertag:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						gamertag:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( gamertag, event )
						else
							gamertag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						gamertagFrame3( gamertag, event )
						return 
					else
						gamertag:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						gamertag:registerEventHandler( "transition_complete_keyframe", gamertagFrame3 )
					end
				end
				
				gamertag:completeAnimation()
				self.gamertag:setAlpha( 0 )
				gamertagFrame2( gamertag, {} )
				local LobbyLeaderIcon0Frame2 = function ( LobbyLeaderIcon0, event )
					local LobbyLeaderIcon0Frame3 = function ( LobbyLeaderIcon0, event )
						if not event.interrupted then
							LobbyLeaderIcon0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						LobbyLeaderIcon0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LobbyLeaderIcon0, event )
						else
							LobbyLeaderIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LobbyLeaderIcon0Frame3( LobbyLeaderIcon0, event )
						return 
					else
						LobbyLeaderIcon0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						LobbyLeaderIcon0:registerEventHandler( "transition_complete_keyframe", LobbyLeaderIcon0Frame3 )
					end
				end
				
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				LobbyLeaderIcon0Frame2( LobbyLeaderIcon0, {} )
			end
		},
		IsPartyMemberZombies = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, 0, 735 )
				self.sizeElement:setTopBottom( 0, 0, 0, 136 )
				self.clipFinished( sizeElement, {} )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( 0, 0, 618.5, 633.5 )
				self.PartyMemberIconNew:setTopBottom( 0, 0, 0, 136 )
				self.clipFinished( PartyMemberIconNew, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -1, 40 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				rank:completeAnimation()
				self.clipFinished( rank, {} )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.clipFinished( gamertag, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -0.5, 43.5 )
				self.clipFinished( LobbyMemberBacking, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 129, 135 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -1, 60 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 129, 135 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 18, 22 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 87, 615 )
					FocusBarT:setTopBottom( 0, 0, -6, 0 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 89, 615 )
				self.FocusBarT:setTopBottom( 0, 0, 18, 24 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -1, 60 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 18, 22 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 129, 135 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 89, 615 )
					FocusBarT:setTopBottom( 0, 0, 18, 24 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -6, 0 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local LobbyLeaderIconFrame2 = function ( LobbyLeaderIcon, event )
					local LobbyLeaderIconFrame3 = function ( LobbyLeaderIcon, event )
						if not event.interrupted then
							LobbyLeaderIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						LobbyLeaderIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LobbyLeaderIcon, event )
						else
							LobbyLeaderIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LobbyLeaderIconFrame3( LobbyLeaderIcon, event )
						return 
					else
						LobbyLeaderIcon:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						LobbyLeaderIcon:registerEventHandler( "transition_complete_keyframe", LobbyLeaderIconFrame3 )
					end
				end
				
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				LobbyLeaderIconFrame2( LobbyLeaderIcon, {} )
				local rankFrame2 = function ( rank, event )
					local rankFrame3 = function ( rank, event )
						if not event.interrupted then
							rank:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						rank:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( rank, event )
						else
							rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						rankFrame3( rank, event )
						return 
					else
						rank:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						rank:registerEventHandler( "transition_complete_keyframe", rankFrame3 )
					end
				end
				
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				rankFrame2( rank, {} )
				local IconControllerContainerFrame2 = function ( IconControllerContainer, event )
					if not event.interrupted then
						IconControllerContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					IconControllerContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( IconControllerContainer, event )
					else
						IconControllerContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 0 )
				IconControllerContainerFrame2( IconControllerContainer, {} )
				local gamertagFrame2 = function ( gamertag, event )
					local gamertagFrame3 = function ( gamertag, event )
						if not event.interrupted then
							gamertag:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						gamertag:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( gamertag, event )
						else
							gamertag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						gamertagFrame3( gamertag, event )
						return 
					else
						gamertag:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						gamertag:registerEventHandler( "transition_complete_keyframe", gamertagFrame3 )
					end
				end
				
				gamertag:completeAnimation()
				self.gamertag:setAlpha( 0 )
				gamertagFrame2( gamertag, {} )
				local LobbyLeaderIcon0Frame2 = function ( LobbyLeaderIcon0, event )
					if not event.interrupted then
						LobbyLeaderIcon0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					LobbyLeaderIcon0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyLeaderIcon0, event )
					else
						LobbyLeaderIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				LobbyLeaderIcon0Frame2( LobbyLeaderIcon0, {} )
			end
		},
		IsDOA = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				PartyMemberIconNew:completeAnimation()
				self.clipFinished( PartyMemberIconNew, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -1, 40 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.clipFinished( rank, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -7.5, 48.5 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -10, 50 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
					FEMemberBlurPanelContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
					VSpanel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
				self.VSpanel:setAlpha( 0.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -6.5, 47.5 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -8, 48 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 43, 49 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 18, 22 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 87, 615 )
					FocusBarT:setTopBottom( 0, 0, -9, -3 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 89, 615 )
				self.FocusBarT:setTopBottom( 0, 0, 18, 24 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
					FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -0.5, 41.5 )
					FEMemberBlurPanelContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -6.5, 47.5 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
					VSpanel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
				self.VSpanel:setAlpha( 0.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -6.5, 47.5 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -8, 48 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local rankFrame2 = function ( rank, event )
					if not event.interrupted then
						rank:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					rank:setScale( 1 )
					if event.interrupted then
						self.clipFinished( rank, event )
					else
						rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				rank:completeAnimation()
				self.rank:setScale( 1 )
				rankFrame2( rank, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 18, 22 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 89, 615 )
					FocusBarT:setTopBottom( 0, 0, 18, 24 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local LobbyLeaderIconFrame2 = function ( LobbyLeaderIcon, event )
					if not event.interrupted then
						LobbyLeaderIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					LobbyLeaderIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyLeaderIcon, event )
					else
						LobbyLeaderIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				LobbyLeaderIconFrame2( LobbyLeaderIcon, {} )
				local rankFrame2 = function ( rank, event )
					local rankFrame3 = function ( rank, event )
						if not event.interrupted then
							rank:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						rank:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( rank, event )
						else
							rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						rankFrame3( rank, event )
						return 
					else
						rank:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						rank:registerEventHandler( "transition_complete_keyframe", rankFrame3 )
					end
				end
				
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				rankFrame2( rank, {} )
				local IconControllerContainerFrame2 = function ( IconControllerContainer, event )
					if not event.interrupted then
						IconControllerContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					IconControllerContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( IconControllerContainer, event )
					else
						IconControllerContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 0 )
				IconControllerContainerFrame2( IconControllerContainer, {} )
				local gamertagFrame2 = function ( gamertag, event )
					local gamertagFrame3 = function ( gamertag, event )
						if not event.interrupted then
							gamertag:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						gamertag:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( gamertag, event )
						else
							gamertag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						gamertagFrame3( gamertag, event )
						return 
					else
						gamertag:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						gamertag:registerEventHandler( "transition_complete_keyframe", gamertagFrame3 )
					end
				end
				
				gamertag:completeAnimation()
				self.gamertag:setAlpha( 0 )
				gamertagFrame2( gamertag, {} )
				local LobbyLeaderIcon0Frame2 = function ( LobbyLeaderIcon0, event )
					local LobbyLeaderIcon0Frame3 = function ( LobbyLeaderIcon0, event )
						if not event.interrupted then
							LobbyLeaderIcon0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						LobbyLeaderIcon0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LobbyLeaderIcon0, event )
						else
							LobbyLeaderIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LobbyLeaderIcon0Frame3( LobbyLeaderIcon0, event )
						return 
					else
						LobbyLeaderIcon0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						LobbyLeaderIcon0:registerEventHandler( "transition_complete_keyframe", LobbyLeaderIcon0Frame3 )
					end
				end
				
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				LobbyLeaderIcon0Frame2( LobbyLeaderIcon0, {} )
			end
		},
		IsPartyMemberDOA = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				PartyMemberIconNew:completeAnimation()
				self.clipFinished( PartyMemberIconNew, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.clipFinished( rank, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -7.5, 48.5 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -10, 50 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
					FEMemberBlurPanelContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
					VSpanel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
				self.VSpanel:setAlpha( 0.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -6.5, 47.5 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -8, 48 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 43, 49 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 18, 22 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 87, 615 )
					FocusBarT:setTopBottom( 0, 0, -9, -3 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 89, 615 )
				self.FocusBarT:setTopBottom( 0, 0, 18, 24 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
					FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -0.5, 41.5 )
					FEMemberBlurPanelContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -6.5, 47.5 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
					VSpanel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
				self.VSpanel:setAlpha( 0.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -6.5, 47.5 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -8, 48 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local rankFrame2 = function ( rank, event )
					if not event.interrupted then
						rank:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					rank:setScale( 1 )
					if event.interrupted then
						self.clipFinished( rank, event )
					else
						rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				rank:completeAnimation()
				self.rank:setScale( 1 )
				rankFrame2( rank, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 18, 22 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 89, 615 )
					FocusBarT:setTopBottom( 0, 0, 18, 24 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local LobbyLeaderIconFrame2 = function ( LobbyLeaderIcon, event )
					if not event.interrupted then
						LobbyLeaderIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					LobbyLeaderIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyLeaderIcon, event )
					else
						LobbyLeaderIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				LobbyLeaderIconFrame2( LobbyLeaderIcon, {} )
				local rankFrame2 = function ( rank, event )
					local rankFrame3 = function ( rank, event )
						if not event.interrupted then
							rank:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						rank:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( rank, event )
						else
							rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						rankFrame3( rank, event )
						return 
					else
						rank:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						rank:registerEventHandler( "transition_complete_keyframe", rankFrame3 )
					end
				end
				
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				rankFrame2( rank, {} )
				local IconControllerContainerFrame2 = function ( IconControllerContainer, event )
					if not event.interrupted then
						IconControllerContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					IconControllerContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( IconControllerContainer, event )
					else
						IconControllerContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 0 )
				IconControllerContainerFrame2( IconControllerContainer, {} )
				local gamertagFrame2 = function ( gamertag, event )
					local gamertagFrame3 = function ( gamertag, event )
						if not event.interrupted then
							gamertag:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						gamertag:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( gamertag, event )
						else
							gamertag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						gamertagFrame3( gamertag, event )
						return 
					else
						gamertag:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						gamertag:registerEventHandler( "transition_complete_keyframe", gamertagFrame3 )
					end
				end
				
				gamertag:completeAnimation()
				self.gamertag:setAlpha( 0 )
				gamertagFrame2( gamertag, {} )
				local LobbyLeaderIcon0Frame2 = function ( LobbyLeaderIcon0, event )
					local LobbyLeaderIcon0Frame3 = function ( LobbyLeaderIcon0, event )
						if not event.interrupted then
							LobbyLeaderIcon0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						LobbyLeaderIcon0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LobbyLeaderIcon0, event )
						else
							LobbyLeaderIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LobbyLeaderIcon0Frame3( LobbyLeaderIcon0, event )
						return 
					else
						LobbyLeaderIcon0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						LobbyLeaderIcon0:registerEventHandler( "transition_complete_keyframe", LobbyLeaderIcon0Frame3 )
					end
				end
				
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				LobbyLeaderIcon0Frame2( LobbyLeaderIcon0, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				PartyMemberIconNew:completeAnimation()
				self.clipFinished( PartyMemberIconNew, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -1, 40 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.clipFinished( rank, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 0 )
				self.clipFinished( LobbyMemberReady, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -7.5, 48.5 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -10, 50 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
					FEMemberBlurPanelContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
					VSpanel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
				self.VSpanel:setAlpha( 0.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -6.5, 47.5 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -8, 48 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 43, 49 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 18, 22 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 87, 615 )
					FocusBarT:setTopBottom( 0, 0, -9, -3 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 89, 615 )
				self.FocusBarT:setTopBottom( 0, 0, 18, 24 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
					FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -0.5, 41.5 )
					FEMemberBlurPanelContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -6.5, 47.5 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
					VSpanel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
				self.VSpanel:setAlpha( 0.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -6.5, 47.5 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -8, 48 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local rankFrame2 = function ( rank, event )
					if not event.interrupted then
						rank:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					rank:setScale( 1 )
					if event.interrupted then
						self.clipFinished( rank, event )
					else
						rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				rank:completeAnimation()
				self.rank:setScale( 1 )
				rankFrame2( rank, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 18, 22 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 89, 615 )
					FocusBarT:setTopBottom( 0, 0, 18, 24 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local LobbyLeaderIconFrame2 = function ( LobbyLeaderIcon, event )
					if not event.interrupted then
						LobbyLeaderIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					LobbyLeaderIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyLeaderIcon, event )
					else
						LobbyLeaderIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				LobbyLeaderIconFrame2( LobbyLeaderIcon, {} )
				local rankFrame2 = function ( rank, event )
					local rankFrame3 = function ( rank, event )
						if not event.interrupted then
							rank:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						rank:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( rank, event )
						else
							rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						rankFrame3( rank, event )
						return 
					else
						rank:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						rank:registerEventHandler( "transition_complete_keyframe", rankFrame3 )
					end
				end
				
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				rankFrame2( rank, {} )
				local IconControllerContainerFrame2 = function ( IconControllerContainer, event )
					if not event.interrupted then
						IconControllerContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					IconControllerContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( IconControllerContainer, event )
					else
						IconControllerContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 0 )
				IconControllerContainerFrame2( IconControllerContainer, {} )
				local gamertagFrame2 = function ( gamertag, event )
					local gamertagFrame3 = function ( gamertag, event )
						if not event.interrupted then
							gamertag:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						gamertag:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( gamertag, event )
						else
							gamertag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						gamertagFrame3( gamertag, event )
						return 
					else
						gamertag:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						gamertag:registerEventHandler( "transition_complete_keyframe", gamertagFrame3 )
					end
				end
				
				gamertag:completeAnimation()
				self.gamertag:setAlpha( 0 )
				gamertagFrame2( gamertag, {} )
				local LobbyLeaderIcon0Frame2 = function ( LobbyLeaderIcon0, event )
					local LobbyLeaderIcon0Frame3 = function ( LobbyLeaderIcon0, event )
						if not event.interrupted then
							LobbyLeaderIcon0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						LobbyLeaderIcon0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LobbyLeaderIcon0, event )
						else
							LobbyLeaderIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LobbyLeaderIcon0Frame3( LobbyLeaderIcon0, event )
						return 
					else
						LobbyLeaderIcon0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						LobbyLeaderIcon0:registerEventHandler( "transition_complete_keyframe", LobbyLeaderIcon0Frame3 )
					end
				end
				
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				LobbyLeaderIcon0Frame2( LobbyLeaderIcon0, {} )
			end
		},
		IsPartyMember = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				PartyMemberIconNew:completeAnimation()
				self.clipFinished( PartyMemberIconNew, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -1, 40 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.clipFinished( rank, {} )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.clipFinished( gamertag, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 0 )
				self.clipFinished( LobbyMemberReady, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -5.5, 46.5 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -31.5, 28.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -11, 50 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -11.5, 49.5 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
					FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -6.5, 47.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, 0, 41 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -7.5, 48.5 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -6, 46 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 43, 49 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 18, 22 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 87, 615 )
					FocusBarT:setTopBottom( 0, 0, -9, -3 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 89, 615 )
				self.FocusBarT:setTopBottom( 0, 0, 18, 24 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
					FEMemberBlurPanelContainer0:setTopBottom( 0, 0, 0, 41 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -6.5, 47.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -27.5, 26.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -7.5, 48.5 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -6, 46 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local rankFrame2 = function ( rank, event )
					if not event.interrupted then
						rank:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					rank:setScale( 1 )
					if event.interrupted then
						self.clipFinished( rank, event )
					else
						rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				rank:completeAnimation()
				self.rank:setScale( 1 )
				rankFrame2( rank, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 18, 22 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 43, 49 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 89, 615 )
					FocusBarT:setTopBottom( 0, 0, 18, 24 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -9, -3 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local LobbyLeaderIconFrame2 = function ( LobbyLeaderIcon, event )
					local LobbyLeaderIconFrame3 = function ( LobbyLeaderIcon, event )
						if not event.interrupted then
							LobbyLeaderIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						LobbyLeaderIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LobbyLeaderIcon, event )
						else
							LobbyLeaderIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LobbyLeaderIconFrame3( LobbyLeaderIcon, event )
						return 
					else
						LobbyLeaderIcon:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						LobbyLeaderIcon:registerEventHandler( "transition_complete_keyframe", LobbyLeaderIconFrame3 )
					end
				end
				
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				LobbyLeaderIconFrame2( LobbyLeaderIcon, {} )
				local rankFrame2 = function ( rank, event )
					local rankFrame3 = function ( rank, event )
						if not event.interrupted then
							rank:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						rank:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( rank, event )
						else
							rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						rankFrame3( rank, event )
						return 
					else
						rank:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						rank:registerEventHandler( "transition_complete_keyframe", rankFrame3 )
					end
				end
				
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				rankFrame2( rank, {} )
				local IconControllerContainerFrame2 = function ( IconControllerContainer, event )
					if not event.interrupted then
						IconControllerContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					IconControllerContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( IconControllerContainer, event )
					else
						IconControllerContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 0 )
				IconControllerContainerFrame2( IconControllerContainer, {} )
				local gamertagFrame2 = function ( gamertag, event )
					local gamertagFrame3 = function ( gamertag, event )
						if not event.interrupted then
							gamertag:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						gamertag:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( gamertag, event )
						else
							gamertag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						gamertagFrame3( gamertag, event )
						return 
					else
						gamertag:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						gamertag:registerEventHandler( "transition_complete_keyframe", gamertagFrame3 )
					end
				end
				
				gamertag:completeAnimation()
				self.gamertag:setAlpha( 0 )
				gamertagFrame2( gamertag, {} )
				local LobbyLeaderIcon0Frame2 = function ( LobbyLeaderIcon0, event )
					if not event.interrupted then
						LobbyLeaderIcon0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					LobbyLeaderIcon0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyLeaderIcon0, event )
					else
						LobbyLeaderIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				LobbyLeaderIcon0Frame2( LobbyLeaderIcon0, {} )
			end
		},
		IsInGroup = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				PartyMemberIconNew:completeAnimation()
				self.clipFinished( PartyMemberIconNew, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -1, 40 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.clipFinished( rank, {} )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.clipFinished( gamertag, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 0 )
				self.clipFinished( LobbyMemberReady, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -32.5, 31.5 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -32, 31 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -11.5, 52.5 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -12, 52 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 1 )
				self.clipFinished( PrimaryGroup, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 50, 54 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -13, -7 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( 0, 0, 173, 579 )
				self.gamertag:setTopBottom( 0, 0, -8, 30 )
				self.clipFinished( gamertag, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -32.5, 31.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -20, 21 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -32, 31 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -11.5, 52.5 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, -12, 52 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -1, 41 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 50, 54 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 18, 22 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 87, 615 )
					FocusBarT:setTopBottom( 0, 0, -13, -7 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 89, 615 )
				self.FocusBarT:setTopBottom( 0, 0, 18, 24 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local gamertagFrame2 = function ( gamertag, event )
					if not event.interrupted then
						gamertag:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					gamertag:setLeftRight( 0, 0, 173, 579 )
					gamertag:setTopBottom( 0, 0, -9, 29 )
					if event.interrupted then
						self.clipFinished( gamertag, event )
					else
						gamertag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( 0, 0, 173, 579 )
				self.gamertag:setTopBottom( 0, 0, 1, 39 )
				gamertagFrame2( gamertag, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
					FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -20, 21 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 90, -122 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0.5, 0.5, -32.5, 31.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( 0, 1, 90, -122 )
					VSpanel:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -32, 31 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberBacking:setTopBottom( 0, 0, -1, 40 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberBacking:setTopBottom( 0, 0, -11.5, 52.5 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
					LobbyMemberTeamColor:setTopBottom( 0, 0, 0, 40 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( 0, 0, 90, 612 )
				self.LobbyMemberTeamColor:setTopBottom( 0, 0, -12, 52 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				local rankFrame2 = function ( rank, event )
					if not event.interrupted then
						rank:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					rank:setScale( 1 )
					if event.interrupted then
						self.clipFinished( rank, event )
					else
						rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				rank:completeAnimation()
				self.rank:setScale( 1 )
				rankFrame2( rank, {} )
				local PrimaryGroupFrame2 = function ( PrimaryGroup, event )
					if not event.interrupted then
						PrimaryGroup:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					PrimaryGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PrimaryGroup, event )
					else
						PrimaryGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 1 )
				PrimaryGroupFrame2( PrimaryGroup, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( 0, 0, 87, 615 )
					FocusBarB:setTopBottom( 0, 0, 18, 22 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarB:setTopBottom( 0, 0, 50, 54 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 0, 89, 615 )
					FocusBarT:setTopBottom( 0, 0, 18, 24 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 0, 87, 615 )
				self.FocusBarT:setTopBottom( 0, 0, -13, -7 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local gamertagFrame2 = function ( gamertag, event )
					if not event.interrupted then
						gamertag:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					gamertag:setLeftRight( 0, 0, 173, 579 )
					gamertag:setTopBottom( 0, 0, 1, 39 )
					if event.interrupted then
						self.clipFinished( gamertag, event )
					else
						gamertag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( 0, 0, 173, 579 )
				self.gamertag:setTopBottom( 0, 0, -9, 29 )
				gamertagFrame2( gamertag, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local LobbyLeaderIconFrame2 = function ( LobbyLeaderIcon, event )
					local LobbyLeaderIconFrame3 = function ( LobbyLeaderIcon, event )
						if not event.interrupted then
							LobbyLeaderIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						LobbyLeaderIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LobbyLeaderIcon, event )
						else
							LobbyLeaderIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LobbyLeaderIconFrame3( LobbyLeaderIcon, event )
						return 
					else
						LobbyLeaderIcon:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						LobbyLeaderIcon:registerEventHandler( "transition_complete_keyframe", LobbyLeaderIconFrame3 )
					end
				end
				
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				LobbyLeaderIconFrame2( LobbyLeaderIcon, {} )
				local rankFrame2 = function ( rank, event )
					local rankFrame3 = function ( rank, event )
						if not event.interrupted then
							rank:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						rank:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( rank, event )
						else
							rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						rankFrame3( rank, event )
						return 
					else
						rank:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						rank:registerEventHandler( "transition_complete_keyframe", rankFrame3 )
					end
				end
				
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				rankFrame2( rank, {} )
				local IconControllerContainerFrame2 = function ( IconControllerContainer, event )
					if not event.interrupted then
						IconControllerContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					IconControllerContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( IconControllerContainer, event )
					else
						IconControllerContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 0 )
				IconControllerContainerFrame2( IconControllerContainer, {} )
				local gamertagFrame2 = function ( gamertag, event )
					local gamertagFrame3 = function ( gamertag, event )
						if not event.interrupted then
							gamertag:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						gamertag:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( gamertag, event )
						else
							gamertag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						gamertagFrame3( gamertag, event )
						return 
					else
						gamertag:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						gamertag:registerEventHandler( "transition_complete_keyframe", gamertagFrame3 )
					end
				end
				
				gamertag:completeAnimation()
				self.gamertag:setAlpha( 0 )
				gamertagFrame2( gamertag, {} )
				local LobbyLeaderIcon0Frame2 = function ( LobbyLeaderIcon0, event )
					if not event.interrupted then
						LobbyLeaderIcon0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					LobbyLeaderIcon0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyLeaderIcon0, event )
					else
						LobbyLeaderIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				LobbyLeaderIcon0Frame2( LobbyLeaderIcon0, {} )
			end
		},
		SearchingForPlayer = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setAlpha( 0 )
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
				self.clipFinished( VSpanel, {} )
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.87, 0.9, 0.9 )
				self.clipFinished( clanTag, {} )
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 0 )
				self.clipFinished( IconControllerContainer, {} )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 0 )
				self.clipFinished( gamertag, {} )
				TeamSwitcher:completeAnimation()
				self.TeamSwitcher:setAlpha( 0 )
				self.clipFinished( TeamSwitcher, {} )
				currentEv:completeAnimation()
				self.LobbyMemberScore:setAlpha( 0 )
				self.clipFinished( currentEv, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 1 )
				self.clipFinished( SearchingForPlayer, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 0 )
				self.clipFinished( LobbyMemberReady, {} )
			end
		},
		SearchingForPlayer_Flipped = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setAlpha( 0 )
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 351, 351 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, -1, 40 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
				self.clipFinished( VSpanel, {} )
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.87, 0.9, 0.9 )
				self.clipFinished( clanTag, {} )
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 0 )
				self.clipFinished( IconControllerContainer, {} )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 0 )
				self.clipFinished( gamertag, {} )
				TeamSwitcher:completeAnimation()
				self.TeamSwitcher:setAlpha( 0 )
				self.clipFinished( TeamSwitcher, {} )
				currentEv:completeAnimation()
				self.LobbyMemberScore:setAlpha( 0 )
				self.clipFinished( currentEv, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 1 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 0 )
				self.clipFinished( LobbyMemberReady, {} )
			end
		},
		AnonymousPlayer = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setAlpha( 0 )
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( 0, 1, 90, -122 )
				self.VSpanel:setTopBottom( 0.5, 0.5, -21.5, 20.5 )
				self.clipFinished( VSpanel, {} )
				rank:completeAnimation()
				self.rank:setAlpha( 0 )
				self.clipFinished( rank, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.87, 0.9, 0.9 )
				self.clipFinished( clanTag, {} )
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 0 )
				self.clipFinished( IconControllerContainer, {} )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 0 )
				self.clipFinished( gamertag, {} )
				TeamSwitcher:completeAnimation()
				self.TeamSwitcher:setAlpha( 0 )
				self.clipFinished( TeamSwitcher, {} )
				currentEv:completeAnimation()
				self.LobbyMemberScore:setAlpha( 0 )
				self.clipFinished( currentEv, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 1 )
				self.clipFinished( AnonymousPlayer, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 0 )
				self.clipFinished( LobbyMemberReady, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "IsSelfZombies",
			condition = function ( menu, element, event )
				local f248_local0 = IsSelfItem( element, controller )
				if f248_local0 then
					f248_local0 = IsZM()
					if f248_local0 then
						f248_local0 = LobbyHas4PlayersOrLess()
					end
				end
				return f248_local0
			end
		},
		{
			stateName = "IsPartyMemberZombies",
			condition = function ( menu, element, event )
				return IsZM() and LobbyHas4PlayersOrLess()
			end
		},
		{
			stateName = "IsDOA",
			condition = function ( menu, element, event )
				local f250_local0 = IsSelfModelValueTrue( element, controller, "validClient" )
				if f250_local0 then
					f250_local0 = IsGlobalModelValueEqualTo
					local f250_local1 = element
					local f250_local2 = controller
					local f250_local3 = "lobbyRoot.lobbyNav"
					local f250_local4 = LobbyData.GetLobbyMenuByName( "online_doa_public" )
					f250_local0 = f250_local0( f250_local1, f250_local2, f250_local3, f250_local4.id )
					if f250_local0 then
						f250_local0 = IsSelfItem( element, controller )
						if f250_local0 then
							f250_local0 = IsGameTypeDOA()
						end
					end
				end
				return f250_local0
			end
		},
		{
			stateName = "IsPartyMemberDOA",
			condition = function ( menu, element, event )
				local f251_local0 = IsGlobalModelValueEqualTo
				local f251_local1 = element
				local f251_local2 = controller
				local f251_local3 = "lobbyRoot.lobbyNav"
				local f251_local4 = LobbyData.GetLobbyMenuByName( "online_doa_public" )
				f251_local0 = f251_local0( f251_local1, f251_local2, f251_local3, f251_local4.id )
				if f251_local0 then
					f251_local0 = IsGameTypeDOA()
					if f251_local0 then
						f251_local0 = IsSelfModelValueTrue( element, controller, "validClient" )
					end
				end
				return f251_local0
			end
		},
		{
			stateName = "IsSelf",
			condition = function ( menu, element, event )
				return IsSelfItem( element, controller ) and IsSelfModelValueTrue( element, controller, "validClient" )
			end
		},
		{
			stateName = "IsPartyMember",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "IsInGroup",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "SearchingForPlayer",
			condition = function ( menu, element, event )
				local f255_local0
				if not IsSelfModelValueTrue( element, controller, "validClient" ) then
					f255_local0 = not IsCurrentLanguageReversed()
				else
					f255_local0 = false
				end
				return f255_local0
			end
		},
		{
			stateName = "SearchingForPlayer_Flipped",
			condition = function ( menu, element, event )
				local f256_local0
				if not IsSelfModelValueTrue( element, controller, "validClient" ) then
					f256_local0 = IsCurrentLanguageReversed()
				else
					f256_local0 = false
				end
				return f256_local0
			end
		},
		{
			stateName = "AnonymousPlayer",
			condition = function ( menu, element, event )
				local f257_local0 = IsArenaMode()
				if f257_local0 then
					f257_local0 = IsSelfModelValueNilOrZero( element, controller, "isMember" )
					if f257_local0 then
						if not IsGlobalModelValueTrue( element, controller, "lobbyRoot.lobbyLockedIn" ) then
							f257_local0 = not MapVoteInState( "3" )
						else
							f257_local0 = false
						end
					end
				end
				return f257_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyMainMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	if self.m_eventHandlers.on_client_added then
		local currentEv = self.m_eventHandlers.on_client_added
		self:registerEventHandler( "on_client_added", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "on_client_added", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.on_client_removed then
		local currentEv = self.m_eventHandlers.on_client_removed
		self:registerEventHandler( "on_client_removed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "on_client_removed", LUI.UIElement.updateState )
	end
	self:linkToElementModel( self, "validClient", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "validClient"
		} )
	end )
	self:linkToElementModel( self, "isMember", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isMember"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyLockedIn"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.mapVote"
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsSelfInState( self, "AnonymousPlayer" ) then
			RestrictVoiceChatForClient( self, element, controller )
		elseif not IsSelfInState( self, "AnonymousPlayer" ) then
			AllowVoiceChatForClient( self, element, controller )
		end
	end )
	LobbyMemberReady.id = "LobbyMemberReady"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.LobbyMemberReady:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbyMemberBubbleGumBuffs:close()
		self.PartyMemberIconNew:close()
		self.LobbyLeaderIcon:close()
		self.FEMemberBlurPanelContainer0:close()
		self.VSpanel:close()
		self.LobbyMemberBacking:close()
		self.LobbyMemberTeamColor:close()
		self.rank:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.IconControllerContainer:close()
		self.IconJoinable:close()
		self.gamertag:close()
		self.TeamSwitcher:close()
		self.LobbyLeaderIcon0:close()
		self.LobbyMemberScore:close()
		self.SearchingForPlayer:close()
		self.SearchingForPlayerFlipped:close()
		self.AnonymousPlayer:close()
		self.LobbyMemberReady:close()
		self.clanTag:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

