require( "ui.uieditor.widgets.Groups.GroupsFriendsList" )
require( "ui.uieditor.widgets.Groups.GroupsPlayerCard" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_wHeader" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	
end

LUI.createMenu.GroupInviteFriends = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GroupInviteFriends" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupInviteFriends.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FriendsList = CoD.GroupsFriendsList.new( self, controller )
	FriendsList:setLeftRight( true, false, 64, 474 )
	FriendsList:setTopBottom( true, false, 124.99, 674.99 )
	FriendsList.onlineList:setDataSource( "GroupsInviteFriendsList" )
	self:addElement( FriendsList )
	self.FriendsList = FriendsList
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 64, 146 )
	Label0:setTopBottom( true, false, 92.11, 117.11 )
	Label0:setText( Engine.Localize( "GROUPS_INVITE_FRIENDS" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local GroupsPlayerCard = CoD.GroupsPlayerCard.new( self, controller )
	GroupsPlayerCard:setLeftRight( true, false, 893, 1216 )
	GroupsPlayerCard:setTopBottom( true, false, 124.99, 574.99 )
	GroupsPlayerCard:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		GroupsPlayerCard:setModel( model, controller )
	end )
	self:addElement( GroupsPlayerCard )
	self.GroupsPlayerCard = GroupsPlayerCard
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "GROUPS_FINISH_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_FINISH_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelectedIcon = LUI.UIImage.new()
	SelectedIcon:setLeftRight( false, true, -764.18, -745.18 )
	SelectedIcon:setTopBottom( false, false, 160.99, 179.99 )
	SelectedIcon:setRGB( 0.55, 0.77, 0.25 )
	SelectedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( SelectedIcon )
	self.SelectedIcon = SelectedIcon
	
	local currentItem = LUI.UIText.new()
	currentItem:setLeftRight( false, false, -92, -57 )
	currentItem:setTopBottom( false, false, 157.99, 182.99 )
	currentItem:setTTF( "fonts/default.ttf" )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	currentItem:subscribeToGlobalModel( controller, "CreateGroup", "friends_invited_count", function ( model )
		local friendsInvitedCount = Engine.GetModelValue( model )
		if friendsInvitedCount then
			currentItem:setText( Engine.Localize( friendsInvitedCount ) )
		end
	end )
	self:addElement( currentItem )
	self.currentItem = currentItem
	
	local dividor = LUI.UITightText.new()
	dividor:setLeftRight( false, false, -52, -46 )
	dividor:setTopBottom( false, false, 157.99, 182.99 )
	dividor:setText( Engine.Localize( "/" ) )
	dividor:setTTF( "fonts/default.ttf" )
	self:addElement( dividor )
	self.dividor = dividor
	
	local count = LUI.UIText.new()
	count:setLeftRight( false, false, -41, 0 )
	count:setTopBottom( false, false, 157.99, 182.99 )
	count:setTTF( "fonts/default.ttf" )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	count:subscribeToGlobalModel( controller, "CreateGroup", "friends_count", function ( model )
		local friendsCount = Engine.GetModelValue( model )
		if friendsCount then
			count:setText( Engine.Localize( friendsCount ) )
		end
	end )
	self:addElement( count )
	self.count = count
	
	local Skip = CoD.List1ButtonLarge_Left_wHeader.new( self, controller )
	Skip:setLeftRight( true, false, 515.82, 649.82 )
	Skip:setTopBottom( true, false, 587.29, 621.9 )
	Skip.Text:setText( Engine.Localize( "GROUPS_SKIP_CAPS" ) )
	Skip:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	Skip:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( Skip, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		CreateGroup( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( Skip )
	self.Skip = Skip
	
	local AddFriends = CoD.List1ButtonLarge_Left_wHeader.new( self, controller )
	AddFriends:setLeftRight( true, false, 515.82, 649.82 )
	AddFriends:setTopBottom( true, false, 552.68, 587.29 )
	AddFriends.Text:setText( Engine.Localize( "GROUPS_ADD_FRIENDS_CAPS" ) )
	AddFriends:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	AddFriends:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	self:AddButtonCallbackFunction( AddFriends, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		CreateGroup( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( AddFriends )
	self.AddFriends = AddFriends
	
	FriendsList.navigation = {
		right = {
			AddFriends,
			Skip
		}
	}
	Skip.navigation = {
		left = FriendsList,
		up = AddFriends
	}
	AddFriends.navigation = {
		left = FriendsList,
		down = Skip
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	FriendsList.id = "FriendsList"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FriendsList:close()
		element.GroupsPlayerCard:close()
		element.MenuFrame:close()
		element.Skip:close()
		element.AddFriends:close()
		element.currentItem:close()
		element.count:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupInviteFriends.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

