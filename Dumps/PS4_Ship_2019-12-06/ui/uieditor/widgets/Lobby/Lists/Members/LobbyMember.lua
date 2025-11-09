require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBubbleGumBuffs" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberPartyMemberIconNew" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyLeaderIcon" )
require( "ui.uieditor.widgets.Lobby.Common.FE_MemberBlurPanelContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberTeamColor" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyRank" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.IconControllerContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.IconJoinable" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberGamertag" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberTeamSwitcher" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberScore" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.SearchingForPlayer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.SearchingForPlayer_Flipped" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.AnonymousPlayer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberReady" )

local PostLoadFunc = function ( self, controller, menu )
	self:registerEventHandler( "team_switch", function ( element, event )
		local f2_local0 = event.controller
		local f2_local1 = event.switchTeam
		local f2_local2 = event.xuid
		if not f2_local2 then
			f2_local2 = Engine.GetXUID64( f2_local0 )
		end
		local f2_local3 = DataSources.LobbyList.getItem( f2_local0, element.gridInfoTable.parentGrid, element.gridInfoTable.zeroBasedIndex + 1 )
		if f2_local2 ~= Engine.GetModelValue( Engine.GetModel( f2_local3, "xuid" ) ) then
			return 
		else
			Engine.SetModelValue( Engine.CreateModel( f2_local3, "teamSwitch" ), f2_local1 )
			element.LobbyMemberTeamColor:SetupTeamSwitch( f2_local1 )
			element.TeamSwitcher:SetupTeamSwitch( f2_local1 )
		end
	end )
	self:linkToElementModel( self, "team", true, function ( model )
		if model then
			Engine.SetModelValue( Engine.CreateModel( self:getModel(), "teamSwitch" ), Engine.GetModelValue( model ) )
			self.LobbyMemberTeamColor:SetupTeamColorBackground( Engine.GetModelValue( model ) )
		end
	end )
	self:linkToElementModel( self, "teamColor", true, function ( model )
		if model then
			local f4_local0 = Engine.GetModel( self:getModel(), "team" )
			if f4_local0 then
				Engine.ForceNotifyModelSubscriptions( f4_local0 )
			end
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
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 27 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local sizeElement = LUI.UIImage.new()
	sizeElement:setLeftRight( true, false, 0, 490 )
	sizeElement:setTopBottom( true, false, 0, 91 )
	sizeElement:setAlpha( 0 )
	self:addElement( sizeElement )
	self.sizeElement = sizeElement
	
	local LobbyMemberBubbleGumBuffs = CoD.LobbyMemberBubbleGumBuffs.new( menu, controller )
	LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
	LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
	LobbyMemberBubbleGumBuffs:linkToElementModel( self, nil, false, function ( model )
		LobbyMemberBubbleGumBuffs:setModel( model, controller )
	end )
	self:addElement( LobbyMemberBubbleGumBuffs )
	self.LobbyMemberBubbleGumBuffs = LobbyMemberBubbleGumBuffs
	
	local PartyMemberIconNew = CoD.LobbyMemberPartyMemberIconNew.new( menu, controller )
	PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
	PartyMemberIconNew:setTopBottom( true, false, 0, 25 )
	PartyMemberIconNew:linkToElementModel( self, nil, false, function ( model )
		PartyMemberIconNew:setModel( model, controller )
	end )
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
	self:addElement( PartyMemberIconNew )
	self.PartyMemberIconNew = PartyMemberIconNew
	
	local LobbyLeaderIcon = CoD.LobbyLeaderIcon.new( menu, controller )
	LobbyLeaderIcon:setLeftRight( true, false, 411, 435 )
	LobbyLeaderIcon:setTopBottom( true, false, 1, 26 )
	LobbyLeaderIcon:linkToElementModel( self, "isMemberLeader", true, function ( model )
		local isMemberLeader = Engine.GetModelValue( model )
		if isMemberLeader then
			LobbyLeaderIcon.Leader:setAlpha( isMemberLeader )
		end
	end )
	self:addElement( LobbyLeaderIcon )
	self.LobbyLeaderIcon = LobbyLeaderIcon
	
	local FEMemberBlurPanelContainer0 = CoD.FE_MemberBlurPanelContainer.new( menu, controller )
	FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
	FEMemberBlurPanelContainer0:setTopBottom( false, false, -14, 13.5 )
	FEMemberBlurPanelContainer0:setRGB( 0.5, 0.5, 0.5 )
	FEMemberBlurPanelContainer0.FEMemberBlurPanel0:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( FEMemberBlurPanelContainer0 )
	self.FEMemberBlurPanelContainer0 = FEMemberBlurPanelContainer0
	
	local VSpanel = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel:setLeftRight( true, true, 60, -82 )
	VSpanel:setTopBottom( false, false, -14, 13.5 )
	VSpanel:setRGB( 0.19, 0.19, 0.19 )
	VSpanel:setAlpha( 0 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local LobbyMemberBacking = CoD.FE_ButtonPanel.new( menu, controller )
	LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
	LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
	LobbyMemberBacking:setRGB( 0.15, 0.15, 0.15 )
	LobbyMemberBacking:setAlpha( 0 )
	self:addElement( LobbyMemberBacking )
	self.LobbyMemberBacking = LobbyMemberBacking
	
	local LobbyMemberTeamColor = CoD.LobbyMemberTeamColor.new( menu, controller )
	LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
	LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
	LobbyMemberTeamColor:linkToElementModel( self, nil, false, function ( model )
		LobbyMemberTeamColor:setModel( model, controller )
	end )
	self:addElement( LobbyMemberTeamColor )
	self.LobbyMemberTeamColor = LobbyMemberTeamColor
	
	local rank = CoD.LobbyRank.new( menu, controller )
	rank:setLeftRight( false, true, -428, -378 )
	rank:setTopBottom( true, false, 1, 26 )
	rank:linkToElementModel( self, nil, false, function ( model )
		rank:setModel( model, controller )
	end )
	self:addElement( rank )
	self.rank = rank
	
	local clanTag = LUI.UITightText.new()
	clanTag:setLeftRight( true, false, 108, 176 )
	clanTag:setTopBottom( true, false, 3, 24 )
	clanTag:setRGB( 0.96, 1, 0.33 )
	clanTag:setAlpha( 0 )
	clanTag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( clanTag )
	self.clanTag = clanTag
	
	local PrimaryGroup = LUI.UIText.new()
	PrimaryGroup:setLeftRight( true, false, 116, 321 )
	PrimaryGroup:setTopBottom( true, false, 15, 31 )
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
	addControllerText:setLeftRight( true, false, 61, 461 )
	addControllerText:setTopBottom( true, false, 2.5, 19.5 )
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
	MorePlaying:setLeftRight( true, false, 19, 509 )
	MorePlaying:setTopBottom( true, false, 2.5, 19.5 )
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
	playerCountText:setLeftRight( true, false, 61, 333 )
	playerCountText:setTopBottom( true, false, 7, 24 )
	playerCountText:setRGB( 0.42, 0.52, 0.62 )
	playerCountText:setAlpha( 0 )
	playerCountText:setText( Engine.Localize( "MENU_LOBBY_PLAYERCOUNT" ) )
	playerCountText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( playerCountText )
	self.playerCountText = playerCountText
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, false, 58, 410 )
	FocusBarB:setTopBottom( true, false, 26, 29 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, false, 58, 410 )
	FocusBarT:setTopBottom( true, false, -4, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local IconControllerContainer = CoD.IconControllerContainer.new( menu, controller )
	IconControllerContainer:setLeftRight( true, false, 2, 59 )
	IconControllerContainer:setTopBottom( true, false, -3, 29 )
	IconControllerContainer:setRGB( 0.74, 0.78, 0.79 )
	IconControllerContainer:linkToElementModel( self, nil, false, function ( model )
		IconControllerContainer:setModel( model, controller )
	end )
	self:addElement( IconControllerContainer )
	self.IconControllerContainer = IconControllerContainer
	
	local IconJoinable = CoD.IconJoinable.new( menu, controller )
	IconJoinable:setLeftRight( true, false, 389, 413 )
	IconJoinable:setTopBottom( true, false, 1.5, 26.5 )
	IconJoinable:setAlpha( 0 )
	self:addElement( IconJoinable )
	self.IconJoinable = IconJoinable
	
	local gamertag = CoD.LobbyMemberGamertag.new( menu, controller )
	gamertag:setLeftRight( true, false, 115, 386 )
	gamertag:setTopBottom( true, false, 1, 26 )
	gamertag:setRGB( 0.96, 1, 0.33 )
	gamertag:linkToElementModel( self, nil, false, function ( model )
		gamertag:setModel( model, controller )
	end )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	local TeamSwitcher = CoD.LobbyMemberTeamSwitcher.new( menu, controller )
	TeamSwitcher:setLeftRight( true, false, 245, 408 )
	TeamSwitcher:setTopBottom( true, false, 0, 26 )
	self:addElement( TeamSwitcher )
	self.TeamSwitcher = TeamSwitcher
	
	local LobbyLeaderIcon0 = CoD.LobbyLeaderIcon.new( menu, controller )
	LobbyLeaderIcon0:setLeftRight( true, false, 411, 435 )
	LobbyLeaderIcon0:setTopBottom( true, false, 1, 26 )
	LobbyLeaderIcon0:setAlpha( 0 )
	LobbyLeaderIcon0:linkToElementModel( self, "isMemberLeader", true, function ( model )
		local isMemberLeader = Engine.GetModelValue( model )
		if isMemberLeader then
			LobbyLeaderIcon0.Leader:setAlpha( isMemberLeader )
		end
	end )
	LobbyLeaderIcon0:mergeStateConditions( {
		{
			stateName = "TopOrMiddleZM",
			condition = function ( menu, element, event )
				local f22_local0 = IsSelfModelValueTrue( element, controller, "isPartyMemberTopOrMiddle" )
				if f22_local0 then
					f22_local0 = IsZM()
					if f22_local0 then
						f22_local0 = LobbyHas4PlayersOrLess()
					end
				end
				return f22_local0
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
		local LobbyMemberScore = LobbyLeaderIcon0.m_eventHandlers.on_client_added
		LobbyLeaderIcon0:registerEventHandler( "on_client_added", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return LobbyMemberScore( element, event )
		end )
	else
		LobbyLeaderIcon0:registerEventHandler( "on_client_added", LUI.UIElement.updateState )
	end
	if LobbyLeaderIcon0.m_eventHandlers.on_client_removed then
		local LobbyMemberScore = LobbyLeaderIcon0.m_eventHandlers.on_client_removed
		LobbyLeaderIcon0:registerEventHandler( "on_client_removed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return LobbyMemberScore( element, event )
		end )
	else
		LobbyLeaderIcon0:registerEventHandler( "on_client_removed", LUI.UIElement.updateState )
	end
	self:addElement( LobbyLeaderIcon0 )
	self.LobbyLeaderIcon0 = LobbyLeaderIcon0
	
	local LobbyMemberScore = CoD.LobbyMemberScore.new( menu, controller )
	LobbyMemberScore:setLeftRight( true, false, 354.5, 409.5 )
	LobbyMemberScore:setTopBottom( true, false, 1, 26 )
	LobbyMemberScore:linkToElementModel( self, nil, false, function ( model )
		LobbyMemberScore:setModel( model, controller )
	end )
	LobbyMemberScore:mergeStateConditions( {
		{
			stateName = "Hidden2",
			condition = function ( menu, element, event )
				return IsCustomLobby()
			end
		}
	} )
	LobbyMemberScore:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( LobbyMemberScore, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( LobbyMemberScore )
	self.LobbyMemberScore = LobbyMemberScore
	
	local SearchingForPlayer = CoD.SearchingForPlayer.new( menu, controller )
	SearchingForPlayer:setLeftRight( true, false, 115, 386 )
	SearchingForPlayer:setTopBottom( true, false, 1, 26 )
	SearchingForPlayer:setAlpha( 0 )
	self:addElement( SearchingForPlayer )
	self.SearchingForPlayer = SearchingForPlayer
	
	local SearchingForPlayerFlipped = CoD.SearchingForPlayer_Flipped.new( menu, controller )
	SearchingForPlayerFlipped:setLeftRight( true, false, 115, 386 )
	SearchingForPlayerFlipped:setTopBottom( true, false, 1, 26 )
	SearchingForPlayerFlipped:setAlpha( 0 )
	self:addElement( SearchingForPlayerFlipped )
	self.SearchingForPlayerFlipped = SearchingForPlayerFlipped
	
	local AnonymousPlayer = CoD.AnonymousPlayer.new( menu, controller )
	AnonymousPlayer:setLeftRight( true, false, 115, 386 )
	AnonymousPlayer:setTopBottom( true, false, 1, 26 )
	AnonymousPlayer:setAlpha( 0 )
	self:addElement( AnonymousPlayer )
	self.AnonymousPlayer = AnonymousPlayer
	
	local LobbyMemberReady = CoD.LobbyMemberReady.new( menu, controller )
	LobbyMemberReady:setLeftRight( true, false, 13, 38 )
	LobbyMemberReady:setTopBottom( true, false, 1, 26 )
	LobbyMemberReady:linkToElementModel( self, nil, false, function ( model )
		LobbyMemberReady:setModel( model, controller )
	end )
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
	self:addElement( LobbyMemberReady )
	self.LobbyMemberReady = LobbyMemberReady
	
	self.clanTag:linkToElementModel( self, "clanTag", true, function ( model )
		local _clanTag = Engine.GetModelValue( model )
		if _clanTag then
			clanTag:setText( _clanTag )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 490 )
				self.sizeElement:setTopBottom( true, false, 0, 27 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 0 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 25 )
				self.PartyMemberIconNew:setAlpha( 1 )
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 1 )
				self.clipFinished( LobbyLeaderIcon, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -14, 13.5 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.FEMemberBlurPanelContainer0:setZoom( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.5 )
				self.VSpanel:setAlpha( 0.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setRGB( 1, 1, 1 )
				self.rank:setAlpha( 1 )
				self.rank:setZoom( 0 )
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.87, 0.9, 0.9 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 1 )
				self.clipFinished( IconControllerContainer, {} )
				IconJoinable:completeAnimation()
				self.IconJoinable:setAlpha( 0 )
				self.clipFinished( IconJoinable, {} )
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( true, false, 115, 386 )
				self.gamertag:setTopBottom( true, false, 1, 26 )
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				TeamSwitcher:completeAnimation()
				self.TeamSwitcher:setAlpha( 1 )
				self.clipFinished( TeamSwitcher, {} )
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon0, {} )
				LobbyMemberScore:completeAnimation()
				self.LobbyMemberScore:setAlpha( 1 )
				self.clipFinished( LobbyMemberScore, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 0 )
				self.clipFinished( LobbyMemberReady, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 11 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, -4.5, 31.5 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -18, 18 )
				self.VSpanel:setAlpha( 1 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -5, 32 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -7.75, 32.75 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setAlpha( 1 )
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 29, 33 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -6, -2 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 11 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
					FEMemberBlurPanelContainer0:setTopBottom( false, false, -18.5, 18.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -14, 13.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( true, true, 60, -82 )
					VSpanel:setTopBottom( false, false, -18, 18 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.8 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -5, 32 )
					LobbyMemberBacking:setAlpha( 0 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -5, 32 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 29, 33 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 12, 15 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -6, -2 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 59, 410 )
				self.FocusBarT:setTopBottom( true, false, 12, 16 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				gamertag:completeAnimation()
				self.gamertag:setAlpha( 1 )
				self.clipFinished( gamertag, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 11 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
					FEMemberBlurPanelContainer0:setTopBottom( false, false, -14, 13.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -18.5, 18.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( true, true, 60, -82 )
					VSpanel:setTopBottom( false, false, -14, 13.8 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -18, 18 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
					LobbyMemberBacking:setAlpha( 0 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -5, 32 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -5, 32 )
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
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 12, 15 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 29, 33 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 59, 410 )
					FocusBarT:setTopBottom( true, false, 12, 16 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -6, -2 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				gamertag:completeAnimation()
				self.gamertag:setAlpha( 1 )
				self.clipFinished( gamertag, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 9 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
					FEMemberBlurPanelContainer0:setTopBottom( false, false, -14, 13.5 )
					FEMemberBlurPanelContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -14, 13.5 )
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
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end
		},
		IsSelfZombies = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 490 )
				self.sizeElement:setTopBottom( true, false, 0, 91 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 91 )
				self.PartyMemberIconNew:setAlpha( 1 )
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 1 )
				self.clipFinished( LobbyLeaderIcon, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, -0.5, 27 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.FEMemberBlurPanelContainer0:setZoom( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.5 )
				self.VSpanel:setAlpha( 0 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setRGB( 1, 1, 1 )
				self.rank:setAlpha( 1 )
				self.rank:setZoom( 0 )
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.96, 1, 0.33 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 1 )
				self.clipFinished( IconControllerContainer, {} )
				IconJoinable:completeAnimation()
				self.IconJoinable:setAlpha( 0 )
				self.clipFinished( IconJoinable, {} )
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( true, false, 115, 386 )
				self.gamertag:setTopBottom( true, false, 1, 26 )
				self.gamertag:setRGB( 0.96, 1, 0.33 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				TeamSwitcher:completeAnimation()
				self.TeamSwitcher:setAlpha( 1 )
				self.clipFinished( TeamSwitcher, {} )
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon0, {} )
				LobbyMemberScore:completeAnimation()
				self.LobbyMemberScore:setAlpha( 1 )
				self.clipFinished( LobbyMemberScore, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 1 )
				self.clipFinished( LobbyMemberReady, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 91 )
				self.clipFinished( PartyMemberIconNew, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0 )
				self.clipFinished( VSpanel, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 89, 93 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 10 )
				local LobbyMemberBubbleGumBuffsFrame2 = function ( LobbyMemberBubbleGumBuffs, event )
					if not event.interrupted then
						LobbyMemberBubbleGumBuffs:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
					LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
					LobbyMemberBubbleGumBuffs:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBubbleGumBuffs, event )
					else
						LobbyMemberBubbleGumBuffs:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				LobbyMemberBubbleGumBuffsFrame2( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 91 )
				self.clipFinished( PartyMemberIconNew, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0 )
				self.clipFinished( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setZoom( 0 )
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
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 89, 93 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 48, 51 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -4, 0 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 59, 410 )
				self.FocusBarT:setTopBottom( true, false, 48, 52 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 10 )
				local LobbyMemberBubbleGumBuffsFrame2 = function ( LobbyMemberBubbleGumBuffs, event )
					if not event.interrupted then
						LobbyMemberBubbleGumBuffs:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
					LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
					LobbyMemberBubbleGumBuffs:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBubbleGumBuffs, event )
					else
						LobbyMemberBubbleGumBuffs:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				LobbyMemberBubbleGumBuffsFrame2( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 91 )
				self.clipFinished( PartyMemberIconNew, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0 )
				self.clipFinished( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
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
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 48, 51 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 89, 93 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 59, 410 )
					FocusBarT:setTopBottom( true, false, 48, 52 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 10 )
				local PartyMemberIconNewFrame2 = function ( PartyMemberIconNew, event )
					if not event.interrupted then
						PartyMemberIconNew:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
					PartyMemberIconNew:setTopBottom( true, false, 0, 91 )
					PartyMemberIconNew:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PartyMemberIconNew, event )
					else
						PartyMemberIconNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 91 )
				self.PartyMemberIconNew:setAlpha( 0 )
				PartyMemberIconNewFrame2( PartyMemberIconNew, {} )
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
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end
		},
		IsPartyMemberZombies = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 490 )
				self.sizeElement:setTopBottom( true, false, 0, 91 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 91 )
				self.PartyMemberIconNew:setAlpha( 1 )
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 1 )
				self.clipFinished( LobbyLeaderIcon, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, -0.5, 27 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.FEMemberBlurPanelContainer0:setZoom( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.5 )
				self.VSpanel:setAlpha( 0 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setRGB( 1, 1, 1 )
				self.rank:setAlpha( 1 )
				self.rank:setZoom( 0 )
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.96, 1, 0.33 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 1 )
				self.clipFinished( IconControllerContainer, {} )
				IconJoinable:completeAnimation()
				self.IconJoinable:setAlpha( 0 )
				self.clipFinished( IconJoinable, {} )
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( true, false, 115, 386 )
				self.gamertag:setTopBottom( true, false, 1, 26 )
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				TeamSwitcher:completeAnimation()
				self.TeamSwitcher:setAlpha( 1 )
				self.clipFinished( TeamSwitcher, {} )
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon0, {} )
				LobbyMemberScore:completeAnimation()
				self.LobbyMemberScore:setAlpha( 1 )
				self.clipFinished( LobbyMemberScore, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 1 )
				self.clipFinished( LobbyMemberReady, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 91 )
				self.clipFinished( PartyMemberIconNew, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 29 )
				self.clipFinished( LobbyMemberBacking, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 86, 90 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 9 )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 91 )
				self.clipFinished( PartyMemberIconNew, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0 )
				self.clipFinished( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setZoom( 0 )
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
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 86, 90 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 12, 15 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -4, 0 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 59, 410 )
				self.FocusBarT:setTopBottom( true, false, 12, 16 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 9 )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setAlpha( 1 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 91 )
				self.clipFinished( PartyMemberIconNew, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0 )
				self.clipFinished( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 40 )
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
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 12, 15 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 86, 90 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 59, 410 )
					FocusBarT:setTopBottom( true, false, 12, 16 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 8 )
				local PartyMemberIconNewFrame2 = function ( PartyMemberIconNew, event )
					if not event.interrupted then
						PartyMemberIconNew:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
					PartyMemberIconNew:setTopBottom( true, false, 0, 91 )
					PartyMemberIconNew:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PartyMemberIconNew, event )
					else
						PartyMemberIconNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 91 )
				self.PartyMemberIconNew:setAlpha( 0 )
				PartyMemberIconNewFrame2( PartyMemberIconNew, {} )
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
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end
		},
		IsDOA = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 490 )
				self.sizeElement:setTopBottom( true, false, 0, 27 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 0 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 25 )
				self.PartyMemberIconNew:setAlpha( 1 )
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 1 )
				self.clipFinished( LobbyLeaderIcon, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, -0.5, 27 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.FEMemberBlurPanelContainer0:setZoom( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.5 )
				self.VSpanel:setAlpha( 0.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setRGB( 1, 1, 1 )
				self.rank:setAlpha( 1 )
				self.rank:setZoom( 0 )
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.96, 1, 0.33 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 1 )
				self.clipFinished( IconControllerContainer, {} )
				IconJoinable:completeAnimation()
				self.IconJoinable:setAlpha( 0 )
				self.clipFinished( IconJoinable, {} )
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( true, false, 115, 386 )
				self.gamertag:setTopBottom( true, false, 1, 26 )
				self.gamertag:setRGB( 0.96, 1, 0.33 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				TeamSwitcher:completeAnimation()
				self.TeamSwitcher:setAlpha( 1 )
				self.clipFinished( TeamSwitcher, {} )
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon0, {} )
				LobbyMemberScore:completeAnimation()
				self.LobbyMemberScore:setAlpha( 1 )
				self.clipFinished( LobbyMemberScore, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 1 )
				self.clipFinished( LobbyMemberReady, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -18, 18 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -18, 18 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -5, 32 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -7, 33 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 29, 33 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -6, -2 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 10 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
					FEMemberBlurPanelContainer0:setTopBottom( false, false, -18, 18 )
					FEMemberBlurPanelContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -14, 14 )
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( true, true, 60, -82 )
					VSpanel:setTopBottom( false, false, -18, 18 )
					VSpanel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.8 )
				self.VSpanel:setAlpha( 0.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -4.5, 31.5 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -5, 32 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 29, 33 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 12, 15 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -6, -2 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 59, 410 )
				self.FocusBarT:setTopBottom( true, false, 12, 16 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 10 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
					FEMemberBlurPanelContainer0:setTopBottom( true, false, -0.5, 27.5 )
					FEMemberBlurPanelContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, -4.5, 31.5 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( true, true, 60, -82 )
					VSpanel:setTopBottom( false, false, -14, 13.8 )
					VSpanel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -18, 18 )
				self.VSpanel:setAlpha( 0.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -4.5, 31.5 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -5, 32 )
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
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 12, 15 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 29, 33 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 59, 410 )
					FocusBarT:setTopBottom( true, false, 12, 16 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -6, -2 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 8 )
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
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end
		},
		IsPartyMemberDOA = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 490 )
				self.sizeElement:setTopBottom( true, false, 0, 27 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 0 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 25 )
				self.PartyMemberIconNew:setAlpha( 1 )
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 1 )
				self.clipFinished( LobbyLeaderIcon, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -14, 13.5 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.FEMemberBlurPanelContainer0:setZoom( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.5 )
				self.VSpanel:setAlpha( 0.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setRGB( 1, 1, 1 )
				self.rank:setAlpha( 1 )
				self.rank:setZoom( 0 )
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.96, 1, 0.33 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 1 )
				self.clipFinished( IconControllerContainer, {} )
				IconJoinable:completeAnimation()
				self.IconJoinable:setAlpha( 0 )
				self.clipFinished( IconJoinable, {} )
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( true, false, 115, 386 )
				self.gamertag:setTopBottom( true, false, 1, 26 )
				self.gamertag:setRGB( 0.96, 1, 0.33 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				TeamSwitcher:completeAnimation()
				self.TeamSwitcher:setAlpha( 1 )
				self.clipFinished( TeamSwitcher, {} )
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon0, {} )
				LobbyMemberScore:completeAnimation()
				self.LobbyMemberScore:setAlpha( 1 )
				self.clipFinished( LobbyMemberScore, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 1 )
				self.clipFinished( LobbyMemberReady, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -18, 18 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -18, 18 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -5, 32 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -7, 33 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 29, 33 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -6, -2 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 10 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
					FEMemberBlurPanelContainer0:setTopBottom( false, false, -18, 18 )
					FEMemberBlurPanelContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -14, 14 )
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( true, true, 60, -82 )
					VSpanel:setTopBottom( false, false, -18, 18 )
					VSpanel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.8 )
				self.VSpanel:setAlpha( 0.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -4.5, 31.5 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -5, 32 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 29, 33 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 12, 15 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -6, -2 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 59, 410 )
				self.FocusBarT:setTopBottom( true, false, 12, 16 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 10 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
					FEMemberBlurPanelContainer0:setTopBottom( true, false, -0.5, 27.5 )
					FEMemberBlurPanelContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, -4.5, 31.5 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( true, true, 60, -82 )
					VSpanel:setTopBottom( false, false, -14, 13.8 )
					VSpanel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -18, 18 )
				self.VSpanel:setAlpha( 0.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -4.5, 31.5 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -5, 32 )
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
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 12, 15 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 29, 33 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 59, 410 )
					FocusBarT:setTopBottom( true, false, 12, 16 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -6, -2 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 8 )
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
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 490 )
				self.sizeElement:setTopBottom( true, false, 0, 27 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 0 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 25 )
				self.PartyMemberIconNew:setAlpha( 1 )
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 1 )
				self.clipFinished( LobbyLeaderIcon, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, -0.5, 27 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.FEMemberBlurPanelContainer0:setZoom( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.5 )
				self.VSpanel:setAlpha( 0.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setRGB( 1, 1, 1 )
				self.rank:setAlpha( 1 )
				self.rank:setZoom( 0 )
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.96, 1, 0.33 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 1 )
				self.clipFinished( IconControllerContainer, {} )
				IconJoinable:completeAnimation()
				self.IconJoinable:setAlpha( 0 )
				self.clipFinished( IconJoinable, {} )
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( true, false, 115, 386 )
				self.gamertag:setTopBottom( true, false, 1, 26 )
				self.gamertag:setRGB( 0.96, 1, 0.33 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				TeamSwitcher:completeAnimation()
				self.TeamSwitcher:setAlpha( 1 )
				self.clipFinished( TeamSwitcher, {} )
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon0, {} )
				LobbyMemberScore:completeAnimation()
				self.LobbyMemberScore:setAlpha( 1 )
				self.clipFinished( LobbyMemberScore, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 0 )
				self.clipFinished( LobbyMemberReady, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -18, 18 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -18, 18 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -5, 32 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -7, 33 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 29, 33 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -6, -2 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 10 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
					FEMemberBlurPanelContainer0:setTopBottom( false, false, -18, 18 )
					FEMemberBlurPanelContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -14, 14 )
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( true, true, 60, -82 )
					VSpanel:setTopBottom( false, false, -18, 18 )
					VSpanel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.8 )
				self.VSpanel:setAlpha( 0.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -4.5, 31.5 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -5, 32 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 29, 33 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 12, 15 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -6, -2 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 59, 410 )
				self.FocusBarT:setTopBottom( true, false, 12, 16 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 10 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
					FEMemberBlurPanelContainer0:setTopBottom( true, false, -0.5, 27.5 )
					FEMemberBlurPanelContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, -4.5, 31.5 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( true, true, 60, -82 )
					VSpanel:setTopBottom( false, false, -14, 13.8 )
					VSpanel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -18, 18 )
				self.VSpanel:setAlpha( 0.5 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -4.5, 31.5 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -5, 32 )
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
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 12, 15 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 29, 33 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 59, 410 )
					FocusBarT:setTopBottom( true, false, 12, 16 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -6, -2 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 8 )
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
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end
		},
		IsPartyMember = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 490 )
				self.sizeElement:setTopBottom( true, false, 0, 27 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 0 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 25 )
				self.PartyMemberIconNew:setAlpha( 1 )
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 1 )
				self.clipFinished( LobbyLeaderIcon, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, -0.5, 27 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.FEMemberBlurPanelContainer0:setZoom( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.5 )
				self.VSpanel:setAlpha( 0.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setRGB( 1, 1, 1 )
				self.rank:setAlpha( 1 )
				self.rank:setZoom( 0 )
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.96, 1, 0.33 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 1 )
				self.clipFinished( IconControllerContainer, {} )
				IconJoinable:completeAnimation()
				self.IconJoinable:setAlpha( 0 )
				self.clipFinished( IconJoinable, {} )
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( true, false, 115, 386 )
				self.gamertag:setTopBottom( true, false, 1, 26 )
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				TeamSwitcher:completeAnimation()
				self.TeamSwitcher:setAlpha( 1 )
				self.clipFinished( TeamSwitcher, {} )
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon0, {} )
				LobbyMemberScore:completeAnimation()
				self.LobbyMemberScore:setAlpha( 1 )
				self.clipFinished( LobbyMemberScore, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 0 )
				self.clipFinished( LobbyMemberReady, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, -4, 31 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -21, 19 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -7.25, 33.25 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -7.5, 33 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 29, 33 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -6, -2 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 10 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
					FEMemberBlurPanelContainer0:setTopBottom( true, false, -4.5, 31.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, 0, 27.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( true, true, 60, -82 )
					VSpanel:setTopBottom( false, false, -18, 18 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.8 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -5, 32 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -4, 31 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 29, 33 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 12, 15 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -6, -2 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 59, 410 )
				self.FocusBarT:setTopBottom( true, false, 12, 16 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 10 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
					FEMemberBlurPanelContainer0:setTopBottom( true, false, 0, 27.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, -4.5, 31.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( true, true, 60, -82 )
					VSpanel:setTopBottom( false, false, -14, 13.8 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -18, 18 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -5, 32 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -4, 31 )
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
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 12, 15 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 29, 33 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 59, 410 )
					FocusBarT:setTopBottom( true, false, 12, 16 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -6, -2 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 8 )
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
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end
		},
		IsInGroup = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 490 )
				self.sizeElement:setTopBottom( true, false, 0, 27 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 0 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 25 )
				self.PartyMemberIconNew:setAlpha( 1 )
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 1 )
				self.clipFinished( LobbyLeaderIcon, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, -0.5, 27 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.FEMemberBlurPanelContainer0:setZoom( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.5 )
				self.VSpanel:setAlpha( 0.5 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setRGB( 1, 1, 1 )
				self.rank:setAlpha( 1 )
				self.rank:setZoom( 0 )
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.96, 1, 0.33 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 1 )
				self.clipFinished( IconControllerContainer, {} )
				IconJoinable:completeAnimation()
				self.IconJoinable:setAlpha( 0 )
				self.clipFinished( IconJoinable, {} )
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( true, false, 115, 386 )
				self.gamertag:setTopBottom( true, false, 1, 26 )
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				TeamSwitcher:completeAnimation()
				self.TeamSwitcher:setAlpha( 1 )
				self.clipFinished( TeamSwitcher, {} )
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon0, {} )
				LobbyMemberScore:completeAnimation()
				self.LobbyMemberScore:setAlpha( 1 )
				self.clipFinished( LobbyMemberScore, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 0 )
				self.clipFinished( LobbyMemberReady, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -21.5, 21.5 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -21, 21 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -8, 35 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -8, 35 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 1 )
				self.clipFinished( PrimaryGroup, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 33, 36 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -9, -5 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( true, false, 115, 386 )
				self.gamertag:setTopBottom( true, false, -5, 20 )
				self.clipFinished( gamertag, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 12 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
					FEMemberBlurPanelContainer0:setTopBottom( false, false, -21.5, 21.5 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -13.5, 14 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( true, true, 60, -82 )
					VSpanel:setTopBottom( false, false, -21, 21 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.8 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -8, 35 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -8, 35 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				LobbyMemberTeamColorFrame2( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
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
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 33, 36 )
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 12, 15 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, true, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 58, 410 )
					FocusBarT:setTopBottom( true, false, -9, -5 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 59, 410 )
				self.FocusBarT:setTopBottom( true, false, 12, 16 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local gamertagFrame2 = function ( gamertag, event )
					if not event.interrupted then
						gamertag:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					gamertag:setLeftRight( true, false, 115, 386 )
					gamertag:setTopBottom( true, false, -6, 19 )
					if event.interrupted then
						self.clipFinished( gamertag, event )
					else
						gamertag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( true, false, 115, 386 )
				self.gamertag:setTopBottom( true, false, 1, 26 )
				gamertagFrame2( gamertag, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 12 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
					FEMemberBlurPanelContainer0:setTopBottom( false, false, -13.5, 14 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -21.5, 21.5 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local VSpanelFrame2 = function ( VSpanel, event )
					if not event.interrupted then
						VSpanel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					VSpanel:setLeftRight( true, true, 60, -82 )
					VSpanel:setTopBottom( false, false, -14, 13.8 )
					if event.interrupted then
						self.clipFinished( VSpanel, event )
					else
						VSpanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -21, 21 )
				VSpanelFrame2( VSpanel, {} )
				local LobbyMemberBackingFrame2 = function ( LobbyMemberBacking, event )
					if not event.interrupted then
						LobbyMemberBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
					LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
					LobbyMemberBacking:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking, event )
					else
						LobbyMemberBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -8, 35 )
				self.LobbyMemberBacking:setZoom( 0 )
				LobbyMemberBackingFrame2( LobbyMemberBacking, {} )
				local LobbyMemberTeamColorFrame2 = function ( LobbyMemberTeamColor, event )
					if not event.interrupted then
						LobbyMemberTeamColor:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
					LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 26.5 )
					LobbyMemberTeamColor:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberTeamColor, event )
					else
						LobbyMemberTeamColor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -8, 35 )
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
					FocusBarB:setLeftRight( true, false, 58, 410 )
					FocusBarB:setTopBottom( true, false, 12, 15 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 33, 36 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, false, 59, 410 )
					FocusBarT:setTopBottom( true, false, 12, 16 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -9, -5 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local gamertagFrame2 = function ( gamertag, event )
					if not event.interrupted then
						gamertag:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					gamertag:setLeftRight( true, false, 115, 386 )
					gamertag:setTopBottom( true, false, 1, 26 )
					if event.interrupted then
						self.clipFinished( gamertag, event )
					else
						gamertag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( true, false, 115, 386 )
				self.gamertag:setTopBottom( true, false, -6, 19 )
				gamertagFrame2( gamertag, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 8 )
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
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
			end
		},
		SearchingForPlayer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 490 )
				self.sizeElement:setTopBottom( true, false, 0, 27 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 0 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 25 )
				self.PartyMemberIconNew:setAlpha( 0 )
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -14, 13.5 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.FEMemberBlurPanelContainer0:setZoom( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.8 )
				self.VSpanel:setAlpha( 0 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setRGB( 1, 1, 1 )
				self.rank:setAlpha( 0 )
				self.rank:setZoom( 0 )
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.87, 0.9, 0.9 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 0 )
				self.clipFinished( IconControllerContainer, {} )
				IconJoinable:completeAnimation()
				self.IconJoinable:setAlpha( 0 )
				self.clipFinished( IconJoinable, {} )
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( true, false, 115, 386 )
				self.gamertag:setTopBottom( true, false, 1, 26 )
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 0 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				TeamSwitcher:completeAnimation()
				self.TeamSwitcher:setAlpha( 0 )
				self.clipFinished( TeamSwitcher, {} )
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon0, {} )
				LobbyMemberScore:completeAnimation()
				self.LobbyMemberScore:setAlpha( 0 )
				self.clipFinished( LobbyMemberScore, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 1 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 0 )
				self.clipFinished( LobbyMemberReady, {} )
			end
		},
		SearchingForPlayer_Flipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 490 )
				self.sizeElement:setTopBottom( true, false, 0, 27 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 0 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 25 )
				self.PartyMemberIconNew:setAlpha( 0 )
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 60, 408 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, -0.5, 27 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.FEMemberBlurPanelContainer0:setZoom( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.8 )
				self.VSpanel:setAlpha( 0 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setRGB( 1, 1, 1 )
				self.rank:setAlpha( 0 )
				self.rank:setZoom( 0 )
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.87, 0.9, 0.9 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 0 )
				self.clipFinished( IconControllerContainer, {} )
				IconJoinable:completeAnimation()
				self.IconJoinable:setAlpha( 0 )
				self.clipFinished( IconJoinable, {} )
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( true, false, 115, 386 )
				self.gamertag:setTopBottom( true, false, 1, 26 )
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 0 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				TeamSwitcher:completeAnimation()
				self.TeamSwitcher:setAlpha( 0 )
				self.clipFinished( TeamSwitcher, {} )
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon0, {} )
				LobbyMemberScore:completeAnimation()
				self.LobbyMemberScore:setAlpha( 0 )
				self.clipFinished( LobbyMemberScore, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 1 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
				AnonymousPlayer:completeAnimation()
				self.AnonymousPlayer:setAlpha( 0 )
				self.clipFinished( AnonymousPlayer, {} )
				LobbyMemberReady:completeAnimation()
				self.LobbyMemberReady:setAlpha( 0 )
				self.clipFinished( LobbyMemberReady, {} )
			end
		},
		AnonymousPlayer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 490 )
				self.sizeElement:setTopBottom( true, false, 0, 27 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				LobbyMemberBubbleGumBuffs:completeAnimation()
				self.LobbyMemberBubbleGumBuffs:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBubbleGumBuffs:setTopBottom( true, false, 27, 91 )
				self.LobbyMemberBubbleGumBuffs:setAlpha( 0 )
				self.clipFinished( LobbyMemberBubbleGumBuffs, {} )
				PartyMemberIconNew:completeAnimation()
				self.PartyMemberIconNew:setLeftRight( true, false, 412, 422 )
				self.PartyMemberIconNew:setTopBottom( true, false, 0, 25 )
				self.PartyMemberIconNew:setAlpha( 0 )
				self.clipFinished( PartyMemberIconNew, {} )
				LobbyLeaderIcon:completeAnimation()
				self.LobbyLeaderIcon:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
				self.FEMemberBlurPanelContainer0:setTopBottom( false, false, -14, 13.5 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.FEMemberBlurPanelContainer0:setZoom( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setLeftRight( true, true, 60, -82 )
				self.VSpanel:setTopBottom( false, false, -14, 13.8 )
				self.VSpanel:setAlpha( 0 )
				self.clipFinished( VSpanel, {} )
				LobbyMemberBacking:completeAnimation()
				self.LobbyMemberBacking:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberBacking:setTopBottom( true, false, -0.5, 27 )
				self.LobbyMemberBacking:setAlpha( 0 )
				self.LobbyMemberBacking:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking, {} )
				LobbyMemberTeamColor:completeAnimation()
				self.LobbyMemberTeamColor:setLeftRight( true, false, 60, 408 )
				self.LobbyMemberTeamColor:setTopBottom( true, false, -0.5, 27.5 )
				self.LobbyMemberTeamColor:setAlpha( 1 )
				self.LobbyMemberTeamColor:setZoom( 0 )
				self.clipFinished( LobbyMemberTeamColor, {} )
				rank:completeAnimation()
				self.rank:setRGB( 1, 1, 1 )
				self.rank:setAlpha( 0 )
				self.rank:setZoom( 0 )
				self.rank:setScale( 1 )
				self.clipFinished( rank, {} )
				clanTag:completeAnimation()
				self.clanTag:setRGB( 0.87, 0.9, 0.9 )
				self.clanTag:setAlpha( 0 )
				self.clanTag:setZoom( 0 )
				self.clipFinished( clanTag, {} )
				PrimaryGroup:completeAnimation()
				self.PrimaryGroup:setAlpha( 0 )
				self.clipFinished( PrimaryGroup, {} )
				addControllerText:completeAnimation()
				self.addControllerText:setAlpha( 0 )
				self.clipFinished( addControllerText, {} )
				MorePlaying:completeAnimation()
				self.MorePlaying:setAlpha( 0 )
				self.clipFinished( MorePlaying, {} )
				playerCountText:completeAnimation()
				self.playerCountText:setAlpha( 0 )
				self.clipFinished( playerCountText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, false, 58, 410 )
				self.FocusBarB:setTopBottom( true, false, 26, 29 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, false, 58, 410 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				IconControllerContainer:completeAnimation()
				self.IconControllerContainer:setAlpha( 0 )
				self.clipFinished( IconControllerContainer, {} )
				IconJoinable:completeAnimation()
				self.IconJoinable:setAlpha( 0 )
				self.clipFinished( IconJoinable, {} )
				gamertag:completeAnimation()
				self.gamertag:setLeftRight( true, false, 115, 386 )
				self.gamertag:setTopBottom( true, false, 1, 26 )
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 0 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
				TeamSwitcher:completeAnimation()
				self.TeamSwitcher:setAlpha( 0 )
				self.clipFinished( TeamSwitcher, {} )
				LobbyLeaderIcon0:completeAnimation()
				self.LobbyLeaderIcon0:setAlpha( 0 )
				self.clipFinished( LobbyLeaderIcon0, {} )
				LobbyMemberScore:completeAnimation()
				self.LobbyMemberScore:setAlpha( 0 )
				self.clipFinished( LobbyMemberScore, {} )
				SearchingForPlayer:completeAnimation()
				self.SearchingForPlayer:setAlpha( 0 )
				self.clipFinished( SearchingForPlayer, {} )
				SearchingForPlayerFlipped:completeAnimation()
				self.SearchingForPlayerFlipped:setAlpha( 0 )
				self.clipFinished( SearchingForPlayerFlipped, {} )
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
				local f250_local0 = IsSelfItem( element, controller )
				if f250_local0 then
					f250_local0 = IsZM()
					if f250_local0 then
						f250_local0 = LobbyHas4PlayersOrLess()
					end
				end
				return f250_local0
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
				local f252_local0 = IsSelfModelValueTrue( element, controller, "validClient" )
				if f252_local0 then
					f252_local0 = IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.lobbyNav", LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id )
					if f252_local0 then
						f252_local0 = IsSelfItem( element, controller )
						if f252_local0 then
							f252_local0 = IsGameTypeDOA()
						end
					end
				end
				return f252_local0
			end
		},
		{
			stateName = "IsPartyMemberDOA",
			condition = function ( menu, element, event )
				local f253_local0 = IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.lobbyNav", LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id )
				if f253_local0 then
					f253_local0 = IsGameTypeDOA()
					if f253_local0 then
						f253_local0 = IsSelfModelValueTrue( element, controller, "validClient" )
					end
				end
				return f253_local0
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
				local f257_local0
				if not IsSelfModelValueTrue( element, controller, "validClient" ) then
					f257_local0 = not IsCurrentLanguageReversed()
				else
					f257_local0 = false
				end
				return f257_local0
			end
		},
		{
			stateName = "SearchingForPlayer_Flipped",
			condition = function ( menu, element, event )
				local f258_local0
				if not IsSelfModelValueTrue( element, controller, "validClient" ) then
					f258_local0 = IsCurrentLanguageReversed()
				else
					f258_local0 = false
				end
				return f258_local0
			end
		},
		{
			stateName = "AnonymousPlayer",
			condition = function ( menu, element, event )
				local f259_local0 = IsArenaMode()
				if f259_local0 then
					f259_local0 = IsSelfModelValueNilOrZero( element, controller, "isMember" )
					if f259_local0 then
						if not IsGlobalModelValueTrue( element, controller, "lobbyRoot.lobbyLockedIn" ) then
							f259_local0 = not MapVoteInState( "3" )
						else
							f259_local0 = false
						end
					end
				end
				return f259_local0
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
		local f5_local27 = self.m_eventHandlers.on_client_added
		self:registerEventHandler( "on_client_added", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f5_local27( self, event )
		end )
	else
		self:registerEventHandler( "on_client_added", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.on_client_removed then
		local f5_local27 = self.m_eventHandlers.on_client_removed
		self:registerEventHandler( "on_client_removed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f5_local27( self, event )
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
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LobbyMemberBubbleGumBuffs:close()
		element.PartyMemberIconNew:close()
		element.LobbyLeaderIcon:close()
		element.FEMemberBlurPanelContainer0:close()
		element.VSpanel:close()
		element.LobbyMemberBacking:close()
		element.LobbyMemberTeamColor:close()
		element.rank:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.IconControllerContainer:close()
		element.IconJoinable:close()
		element.gamertag:close()
		element.TeamSwitcher:close()
		element.LobbyLeaderIcon0:close()
		element.LobbyMemberScore:close()
		element.SearchingForPlayer:close()
		element.SearchingForPlayerFlipped:close()
		element.AnonymousPlayer:close()
		element.LobbyMemberReady:close()
		element.clanTag:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

