require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Groups.GroupsFriendsList" )
require( "ui.uieditor.widgets.Groups.GroupsPlayerCard" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_wHeader" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot.tab" ), "friends" )
end

local PostLoadFunc = function ( self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( self )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot.tab" ), "" )
	end )
end

LUI.createMenu.GroupInviteFriends = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GroupInviteFriends" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupInviteFriends.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 0, 96, 720 )
	BlackTint:setTopBottom( 0, 0, 130, 1017 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local BlackBg = LUI.UIImage.new()
	BlackBg:setLeftRight( 0, 1, 0, 0 )
	BlackBg:setTopBottom( 0, 1, 0, 0 )
	BlackBg:setRGB( 0, 0, 0 )
	BlackBg:setAlpha( 0 )
	self:addElement( BlackBg )
	self.BlackBg = BlackBg
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( 0, 0, 136, 259 )
	Label0:setTopBottom( 0, 0, 138, 175 )
	Label0:setText( Engine.Localize( "GROUPS_INVITE_FRIENDS" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local FriendsList = CoD.GroupsFriendsList.new( self, controller )
	FriendsList:setLeftRight( 0, 0, 137, 921 )
	FriendsList:setTopBottom( 0, 0, 187, 1012 )
	FriendsList.onlineList:setDataSource( "SocialPlayersList" )
	self:addElement( FriendsList )
	self.FriendsList = FriendsList
	
	local GroupsPlayerCard = CoD.GroupsPlayerCard.new( self, controller )
	GroupsPlayerCard:setLeftRight( 0, 0, 1340, 1824 )
	GroupsPlayerCard:setTopBottom( 0, 0, 187, 888 )
	GroupsPlayerCard:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		GroupsPlayerCard:setModel( model, controller )
	end )
	self:addElement( GroupsPlayerCard )
	self.GroupsPlayerCard = GroupsPlayerCard
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "GROUPS_FINISH_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_FINISH_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelectedIcon = LUI.UIImage.new()
	SelectedIcon:setLeftRight( 1, 1, -1175, -1147 )
	SelectedIcon:setTopBottom( 0.5, 0.5, 275, 303 )
	SelectedIcon:setRGB( 0.55, 0.77, 0.25 )
	SelectedIcon:setImage( RegisterImage( "t7_hud_cac_equipped_16" ) )
	self:addElement( SelectedIcon )
	self.SelectedIcon = SelectedIcon
	
	local currentItem = LUI.UIText.new()
	currentItem:setLeftRight( 0.5, 0.5, -166, -114 )
	currentItem:setTopBottom( 0.5, 0.5, 270, 308 )
	currentItem:setTTF( "fonts/default.ttf" )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	currentItem:subscribeToGlobalModel( controller, "CreateGroup", "friends_invited_count", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentItem:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( currentItem )
	self.currentItem = currentItem
	
	local dividor = LUI.UITightText.new()
	dividor:setLeftRight( 0.5, 0.5, -107, -98 )
	dividor:setTopBottom( 0.5, 0.5, 270, 308 )
	dividor:setText( Engine.Localize( "/" ) )
	dividor:setTTF( "fonts/default.ttf" )
	self:addElement( dividor )
	self.dividor = dividor
	
	local count = LUI.UIText.new()
	count:setLeftRight( 0.5, 0.5, -90, -28 )
	count:setTopBottom( 0.5, 0.5, 270, 308 )
	count:setTTF( "fonts/default.ttf" )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( count )
	self.count = count
	
	local Skip = CoD.List1ButtonLarge_Left_wHeader.new( self, controller )
	Skip:setLeftRight( 0, 0, 745, 946 )
	Skip:setTopBottom( 0, 0, 914, 966 )
	Skip.Text:setText( Engine.Localize( "GROUPS_SKIP_CAPS" ) )
	Skip:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Skip:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( Skip, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		InviteSelectedFriendsToGroup( self, element, controller, false )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( Skip )
	self.Skip = Skip
	
	local AddFriends = CoD.List1ButtonLarge_Left_wHeader.new( self, controller )
	AddFriends:setLeftRight( 0, 0, 745, 946 )
	AddFriends:setTopBottom( 0, 0, 862, 914 )
	AddFriends.Text:setText( Engine.Localize( "GROUPS_ADD_FRIENDS_CAPS" ) )
	AddFriends:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	AddFriends:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( AddFriends, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		InviteSelectedFriendsToGroup( self, element, controller, true )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( AddFriends )
	self.AddFriends = AddFriends
	
	count:linkToElementModel( FriendsList.onlineList, "playerCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			count:setText( Engine.Localize( modelValue ) )
		end
	end )
	FriendsList.navigation = {
		right = {
			AddFriends,
			Skip
		},
		down = AddFriends
	}
	GroupsPlayerCard.navigation = {
		left = AddFriends
	}
	Skip.navigation = {
		left = FriendsList,
		up = FriendsList
	}
	AddFriends.navigation = {
		left = FriendsList,
		up = FriendsList,
		right = GroupsPlayerCard,
		down = Skip
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ClearInitialGroupsInviteList( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	FriendsList.id = "FriendsList"
	GroupsPlayerCard.id = "GroupsPlayerCard"
	MenuFrame:setModel( self.buttonModel, controller )
	Skip.id = "Skip"
	AddFriends.id = "AddFriends"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.FriendsList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FriendsList:close()
		self.GroupsPlayerCard:close()
		self.MenuFrame:close()
		self.Skip:close()
		self.AddFriends:close()
		self.currentItem:close()
		self.count:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupInviteFriends.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

