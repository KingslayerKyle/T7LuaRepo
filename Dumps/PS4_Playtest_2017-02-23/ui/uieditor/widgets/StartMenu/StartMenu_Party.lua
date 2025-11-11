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
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local LeaveParty = CoD.StartMenu_Party_Button.new( menu, controller )
	LeaveParty:setLeftRight( 0, 0, 0, 524 )
	LeaveParty:setTopBottom( 0, 0, 98, 180 )
	self:addElement( LeaveParty )
	self.LeaveParty = LeaveParty
	
	local PromotePlayer = CoD.StartMenu_Party_Button.new( menu, controller )
	PromotePlayer:setLeftRight( 0, 0, 0, 524 )
	PromotePlayer:setTopBottom( 0, 0, 188, 270 )
	self:addElement( PromotePlayer )
	self.PromotePlayer = PromotePlayer
	
	local BootPlayers = CoD.StartMenu_Party_Button.new( menu, controller )
	BootPlayers:setLeftRight( 0, 0, 0, 524 )
	BootPlayers:setTopBottom( 0, 0, 278, 360 )
	self:addElement( BootPlayers )
	self.BootPlayers = BootPlayers
	
	local PartyPrivacy = CoD.StartMenu_Party_Button_LG.new( menu, controller )
	PartyPrivacy:setLeftRight( 0, 0, 0, 524 )
	PartyPrivacy:setTopBottom( 0, 0, 368.5, 563.5 )
	PartyPrivacy.Option:setText( Engine.Localize( "MPUI_LOBBY_PRIVACY" ) )
	PartyPrivacy.SelectedOption:setText( Engine.Localize( "MENU_PARTY_PRIVACY_FRIENDS_ONLY" ) )
	self:addElement( PartyPrivacy )
	self.PartyPrivacy = PartyPrivacy
	
	local MaxPartySize = CoD.StartMenu_Party_Button_LG.new( menu, controller )
	MaxPartySize:setLeftRight( 0, 0, 0, 524 )
	MaxPartySize:setTopBottom( 0, 0, 571, 780 )
	MaxPartySize.Option:setText( Engine.Localize( "Max Party Size" ) )
	MaxPartySize.SelectedOption:setText( Engine.Localize( "18 " ) )
	self:addElement( MaxPartySize )
	self.MaxPartySize = MaxPartySize
	
	local StartMenuPartyLeaderNotification = CoD.StartMenu_Party_LeaderNotification.new( menu, controller )
	StartMenuPartyLeaderNotification:setLeftRight( 0, 0, 0, 524 )
	StartMenuPartyLeaderNotification:setTopBottom( 0, 0, 0, 91 )
	self:addElement( StartMenuPartyLeaderNotification )
	self.StartMenuPartyLeaderNotification = StartMenuPartyLeaderNotification
	
	local LookForParty = CoD.StartMenu_Party_Search.new( menu, controller )
	LookForParty:setLeftRight( 0, 0, 547, 1121 )
	LookForParty:setTopBottom( 0, 0, 1, 556 )
	LookForParty.Title:setText( Engine.Localize( "Look for Party" ) )
	LookForParty.Subtitle:setText( Engine.Localize( "Find a Party, Join them, and play together." ) )
	LookForParty.Count:setText( Engine.Localize( "1,250 Parties" ) )
	self:addElement( LookForParty )
	self.LookForParty = LookForParty
	
	local StartMenuPartySearch0 = CoD.StartMenu_Party_Search.new( menu, controller )
	StartMenuPartySearch0:setLeftRight( 0, 0, 1151, 1725 )
	StartMenuPartySearch0:setTopBottom( 0, 0, 1, 556 )
	StartMenuPartySearch0.Title:setText( Engine.Localize( "Need Players" ) )
	StartMenuPartySearch0.Subtitle:setText( Engine.Localize( "Find players to join your party." ) )
	StartMenuPartySearch0.Count:setText( Engine.Localize( "4,278 Players" ) )
	self:addElement( StartMenuPartySearch0 )
	self.StartMenuPartySearch0 = StartMenuPartySearch0
	
	self.LeaveParty:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeaveParty.Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.PromotePlayer:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PromotePlayer.Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.BootPlayers:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BootPlayers.Title:setText( Engine.Localize( modelValue ) )
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.LeaveParty:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeaveParty:close()
		self.PromotePlayer:close()
		self.BootPlayers:close()
		self.PartyPrivacy:close()
		self.MaxPartySize:close()
		self.StartMenuPartyLeaderNotification:close()
		self.LookForParty:close()
		self.StartMenuPartySearch0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

