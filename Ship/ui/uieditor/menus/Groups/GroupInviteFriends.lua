-- 8ceca4d11e9666d95f83f98dd8221e08
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.GroupsFriendsList" )
require( "ui.uieditor.widgets.Groups.GroupsPlayerCard" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Groups.List1ButtonLarge_Groups" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot.tab" ), "friends" )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	LUI.OverrideFunction_CallOriginalFirst( f2_arg0, "close", function ( element )
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupInviteFriends.buttonPrompts" )
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, false, 64, 479.82 )
	BlackTint:setTopBottom( true, false, 87.11, 678.11 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local BlackBg = LUI.UIImage.new()
	BlackBg:setLeftRight( true, true, 0, 0 )
	BlackBg:setTopBottom( true, true, 0, 0 )
	BlackBg:setRGB( 0, 0, 0 )
	BlackBg:setAlpha( 0 )
	self:addElement( BlackBg )
	self.BlackBg = BlackBg
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 78, 160 )
	Label0:setTopBottom( true, false, 92.11, 117.11 )
	Label0:setText( Engine.Localize( "GROUPS_INVITE_FRIENDS" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local FriendsList = CoD.GroupsFriendsList.new( f4_local1, controller )
	FriendsList:setLeftRight( true, false, 78, 479.82 )
	FriendsList:setTopBottom( true, false, 124.99, 674.99 )
	FriendsList.onlineList:setDataSource( "SocialPlayersList" )
	self:addElement( FriendsList )
	self.FriendsList = FriendsList
	
	local GroupsPlayerCard = CoD.GroupsPlayerCard.new( f4_local1, controller )
	GroupsPlayerCard:setLeftRight( true, false, 893, 1216 )
	GroupsPlayerCard:setTopBottom( true, false, 124.99, 591.99 )
	GroupsPlayerCard:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		GroupsPlayerCard:setModel( model, controller )
	end )
	self:addElement( GroupsPlayerCard )
	self.GroupsPlayerCard = GroupsPlayerCard
	
	local MenuFrame = CoD.GenericMenuFrame.new( f4_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "GROUPS_FINISH_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_FINISH_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelectedIcon = LUI.UIImage.new()
	SelectedIcon:setLeftRight( false, true, -730.18, -711.18 )
	SelectedIcon:setTopBottom( false, false, 181.99, 200.99 )
	SelectedIcon:setRGB( 0.55, 0.77, 0.25 )
	SelectedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( SelectedIcon )
	self.SelectedIcon = SelectedIcon
	
	local currentItem = LUI.UIText.new()
	currentItem:setLeftRight( false, false, -58, -23 )
	currentItem:setTopBottom( false, false, 178.99, 203.99 )
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
	dividor:setLeftRight( false, false, -18, -12 )
	dividor:setTopBottom( false, false, 178.99, 203.99 )
	dividor:setText( Engine.Localize( "/" ) )
	dividor:setTTF( "fonts/default.ttf" )
	self:addElement( dividor )
	self.dividor = dividor
	
	local count = LUI.UIText.new()
	count:setLeftRight( false, false, -7, 34 )
	count:setTopBottom( false, false, 178.99, 203.99 )
	count:setTTF( "fonts/default.ttf" )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( count )
	self.count = count
	
	local List1ButtonLargeGroups = CoD.List1ButtonLarge_Groups.new( f4_local1, controller )
	List1ButtonLargeGroups:setLeftRight( true, false, 550, 710 )
	List1ButtonLargeGroups:setTopBottom( true, false, 566.79, 601.4 )
	List1ButtonLargeGroups.LabelButton.itemName:setText( Engine.Localize( "GROUPS_ADD_FRIENDS_CAPS" ) )
	List1ButtonLargeGroups:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	List1ButtonLargeGroups:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	f4_local1:AddButtonCallbackFunction( List1ButtonLargeGroups, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		InviteSelectedFriendsToGroup( self, f9_arg0, f9_arg2, true )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( List1ButtonLargeGroups )
	self.List1ButtonLargeGroups = List1ButtonLargeGroups
	
	local List1ButtonLargeGroups0 = CoD.List1ButtonLarge_Groups.new( f4_local1, controller )
	List1ButtonLargeGroups0:setLeftRight( true, false, 550, 710 )
	List1ButtonLargeGroups0:setTopBottom( true, false, 606.29, 640.9 )
	List1ButtonLargeGroups0.LabelButton.itemName:setText( Engine.Localize( "GROUPS_SKIP_CAPS" ) )
	List1ButtonLargeGroups0:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	List1ButtonLargeGroups0:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	f4_local1:AddButtonCallbackFunction( List1ButtonLargeGroups0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		InviteSelectedFriendsToGroup( self, f13_arg0, f13_arg2, false )
		return true
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( List1ButtonLargeGroups0 )
	self.List1ButtonLargeGroups0 = List1ButtonLargeGroups0
	
	count:linkToElementModel( FriendsList.onlineList, "playerCount", true, function ( model )
		local playerCount = Engine.GetModelValue( model )
		if playerCount then
			count:setText( Engine.Localize( playerCount ) )
		end
	end )
	FriendsList.navigation = {
		right = {
			List1ButtonLargeGroups,
			List1ButtonLargeGroups0
		}
	}
	List1ButtonLargeGroups.navigation = {
		left = FriendsList,
		down = List1ButtonLargeGroups0
	}
	List1ButtonLargeGroups0.navigation = {
		left = FriendsList,
		up = List1ButtonLargeGroups
	}
	CoD.Menu.AddNavigationHandler( f4_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f16_local0 = nil
		ClearInitialGroupsInviteList( self, element, controller )
		if not f16_local0 then
			f16_local0 = element:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	FriendsList.id = "FriendsList"
	MenuFrame:setModel( self.buttonModel, controller )
	List1ButtonLargeGroups.id = "List1ButtonLargeGroups"
	List1ButtonLargeGroups0.id = "List1ButtonLargeGroups0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f4_local1
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
		element.List1ButtonLargeGroups:close()
		element.List1ButtonLargeGroups0:close()
		element.currentItem:close()
		element.count:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupInviteFriends.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

