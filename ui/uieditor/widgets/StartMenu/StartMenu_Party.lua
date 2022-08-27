-- 70db222054f227b980d1fa82e6ba019c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Party_Button" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Party_Button_LG" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Party_LeaderNotification" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Party_Search" )

CoD.StartMenu_Party = InheritFrom( LUI.UIElement )
CoD.StartMenu_Party.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Party )
	self.id = "StartMenu_Party"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local LeaveParty = CoD.StartMenu_Party_Button.new( menu, controller )
	LeaveParty:setLeftRight( true, false, 0, 349 )
	LeaveParty:setTopBottom( true, false, 65.35, 120.35 )
	self:addElement( LeaveParty )
	self.LeaveParty = LeaveParty
	
	local PromotePlayer = CoD.StartMenu_Party_Button.new( menu, controller )
	PromotePlayer:setLeftRight( true, false, 0, 349 )
	PromotePlayer:setTopBottom( true, false, 125.35, 180.35 )
	self:addElement( PromotePlayer )
	self.PromotePlayer = PromotePlayer
	
	local BootPlayers = CoD.StartMenu_Party_Button.new( menu, controller )
	BootPlayers:setLeftRight( true, false, 0, 349 )
	BootPlayers:setTopBottom( true, false, 185.35, 240.35 )
	self:addElement( BootPlayers )
	self.BootPlayers = BootPlayers
	
	local PartyPrivacy = CoD.StartMenu_Party_Button_LG.new( menu, controller )
	PartyPrivacy:setLeftRight( true, false, 0, 349 )
	PartyPrivacy:setTopBottom( true, false, 245.35, 375.35 )
	PartyPrivacy.Option:setText( Engine.Localize( "MPUI_LOBBY_PRIVACY" ) )
	PartyPrivacy.SelectedOption:setText( Engine.Localize( "MENU_PARTY_PRIVACY_FRIENDS_ONLY" ) )
	self:addElement( PartyPrivacy )
	self.PartyPrivacy = PartyPrivacy
	
	local MaxPartySize = CoD.StartMenu_Party_Button_LG.new( menu, controller )
	MaxPartySize:setLeftRight( true, false, 0, 349 )
	MaxPartySize:setTopBottom( true, false, 380.35, 520 )
	MaxPartySize.Option:setText( Engine.Localize( "Max Party Size" ) )
	MaxPartySize.SelectedOption:setText( Engine.Localize( "18 " ) )
	self:addElement( MaxPartySize )
	self.MaxPartySize = MaxPartySize
	
	local StartMenuPartyLeaderNotification = CoD.StartMenu_Party_LeaderNotification.new( menu, controller )
	StartMenuPartyLeaderNotification:setLeftRight( true, false, 0, 349 )
	StartMenuPartyLeaderNotification:setTopBottom( true, false, 0, 60.35 )
	self:addElement( StartMenuPartyLeaderNotification )
	self.StartMenuPartyLeaderNotification = StartMenuPartyLeaderNotification
	
	local LookForParty = CoD.StartMenu_Party_Search.new( menu, controller )
	LookForParty:setLeftRight( true, false, 364.66, 747.66 )
	LookForParty:setTopBottom( true, false, 0.26, 370.43 )
	LookForParty.Title:setText( Engine.Localize( "Look for Party" ) )
	LookForParty.Subtitle:setText( Engine.Localize( "Find a Party, Join them, and play together." ) )
	LookForParty.Count:setText( Engine.Localize( "1,250 Parties" ) )
	self:addElement( LookForParty )
	self.LookForParty = LookForParty
	
	local StartMenuPartySearch0 = CoD.StartMenu_Party_Search.new( menu, controller )
	StartMenuPartySearch0:setLeftRight( true, false, 767, 1150 )
	StartMenuPartySearch0:setTopBottom( true, false, 0.26, 370.43 )
	StartMenuPartySearch0.Title:setText( Engine.Localize( "Need Players" ) )
	StartMenuPartySearch0.Subtitle:setText( Engine.Localize( "Find players to join your party." ) )
	StartMenuPartySearch0.Count:setText( Engine.Localize( "4,278 Players" ) )
	self:addElement( StartMenuPartySearch0 )
	self.StartMenuPartySearch0 = StartMenuPartySearch0
	
	self.LeaveParty:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			LeaveParty.Title:setText( Engine.Localize( name ) )
		end
	end )
	self.PromotePlayer:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			PromotePlayer.Title:setText( Engine.Localize( name ) )
		end
	end )
	self.BootPlayers:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			BootPlayers.Title:setText( Engine.Localize( name ) )
		end
	end )
	LeaveParty.navigation = {
		right = LookForParty,
		down = PromotePlayer
	}
	PromotePlayer.navigation = {
		up = LeaveParty,
		right = LookForParty,
		down = BootPlayers
	}
	BootPlayers.navigation = {
		up = PromotePlayer,
		right = LookForParty,
		down = PartyPrivacy
	}
	PartyPrivacy.navigation = {
		up = BootPlayers,
		right = LookForParty,
		down = MaxPartySize
	}
	MaxPartySize.navigation = {
		up = PartyPrivacy
	}
	LookForParty.navigation = {
		left = {
			LeaveParty,
			PromotePlayer,
			BootPlayers,
			PartyPrivacy
		},
		right = StartMenuPartySearch0
	}
	StartMenuPartySearch0.navigation = {
		left = LookForParty
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LeaveParty.id = "LeaveParty"
	PromotePlayer.id = "PromotePlayer"
	BootPlayers.id = "BootPlayers"
	PartyPrivacy.id = "PartyPrivacy"
	MaxPartySize.id = "MaxPartySize"
	LookForParty.id = "LookForParty"
	StartMenuPartySearch0.id = "StartMenuPartySearch0"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.LeaveParty:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeaveParty:close()
		element.PromotePlayer:close()
		element.BootPlayers:close()
		element.PartyPrivacy:close()
		element.MaxPartySize:close()
		element.StartMenuPartyLeaderNotification:close()
		element.LookForParty:close()
		element.StartMenuPartySearch0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

