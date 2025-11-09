require( "ui.uieditor.widgets.Barracks.CombatRecordFriend" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Footer.fe_footerRighSlideIn" )

local PreLoadFunc = function ( self, controller )
	self.animateInFromOffset = 340
	CoD.perController[controller].isCombatRecordCompare = true
	CoD.perController[controller].previousSocialRootTab = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.tab" ) )
	SetGlobalModelValue( "socialRoot.tab", "friends" )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	LUI.OverrideFunction_CallOriginalFirst( f2_arg0, "close", function ( element )
		CoD.perController[f2_arg1].isCombatRecordCompare = nil
		SetGlobalModelValueArg( "socialRoot.tab", CoD.perController[f2_arg1].previousSocialRootTab )
	end )
end

LUI.createMenu.CombatRecordFriendSidebar = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordFriendSidebar" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordFriendSidebar.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Blackfade = LUI.UIImage.new()
	Blackfade:setLeftRight( true, true, -262, 11 )
	Blackfade:setTopBottom( true, true, 0, 0 )
	Blackfade:setRGB( 0, 0, 0 )
	Blackfade:setAlpha( 0.35 )
	self:addElement( Blackfade )
	self.Blackfade = Blackfade
	
	local leftBackground = LUI.UIImage.new()
	leftBackground:setLeftRight( false, true, -355, 0 )
	leftBackground:setTopBottom( true, true, 0, 0 )
	leftBackground:setRGB( 0.04, 0.04, 0.04 )
	leftBackground:setAlpha( 0.98 )
	self:addElement( leftBackground )
	self.leftBackground = leftBackground
	
	local tileTexture = LUI.UIImage.new()
	tileTexture:setLeftRight( false, true, -355, 3 )
	tileTexture:setTopBottom( true, true, 0, 0 )
	tileTexture:setAlpha( 0.5 )
	tileTexture:setImage( RegisterImage( "uie_t7_tile_texture" ) )
	tileTexture:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	tileTexture:setShaderVector( 0, 30, 55, 0, 0 )
	tileTexture:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( tileTexture )
	self.tileTexture = tileTexture
	
	local NoFriendsText = LUI.UIText.new()
	NoFriendsText:setLeftRight( false, true, -322.5, -64 )
	NoFriendsText:setTopBottom( true, false, 330, 360 )
	NoFriendsText:setRGB( 1, 0.47, 0 )
	NoFriendsText:setAlpha( 0 )
	NoFriendsText:setText( Engine.Localize( "MENU_NO_PLAYERS_TO_COMPARE" ) )
	NoFriendsText:setTTF( "fonts/escom.ttf" )
	NoFriendsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	NoFriendsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NoFriendsText )
	self.NoFriendsText = NoFriendsText
	
	local FriendsList = LUI.UIList.new( self, controller, 3, 0, nil, false, false, 0, 0, false, false )
	FriendsList:makeFocusable()
	FriendsList:setLeftRight( false, true, -322.5, -22.5 )
	FriendsList:setTopBottom( true, false, 133, 599 )
	FriendsList:setWidgetType( CoD.CombatRecordFriend )
	FriendsList:setVerticalCount( 7 )
	FriendsList:setSpacing( 3 )
	FriendsList:setVerticalCounter( CoD.verticalCounter )
	FriendsList:setDataSource( "SocialOnlinePlayersList" )
	FriendsList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	FriendsList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	self:AddButtonCallbackFunction( FriendsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		CombatRecordSetComparing( self, controller, true )
		CombatRecordSelectFriend( self, element, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( FriendsList )
	self.FriendsList = FriendsList
	
	local customClassNameTitile = LUI.UIText.new()
	customClassNameTitile:setLeftRight( false, true, -322.5, -100 )
	customClassNameTitile:setTopBottom( true, false, 96, 122 )
	customClassNameTitile:setRGB( 1, 0.47, 0 )
	customClassNameTitile:setText( Engine.Localize( "MENU_COMPARE" ) )
	customClassNameTitile:setTTF( "fonts/escom.ttf" )
	customClassNameTitile:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	customClassNameTitile:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( customClassNameTitile )
	self.customClassNameTitile = customClassNameTitile
	
	local fefooterRighSlideIn = CoD.fe_footerRighSlideIn.new( self, controller )
	fefooterRighSlideIn:setLeftRight( false, true, -464, -32 )
	fefooterRighSlideIn:setTopBottom( false, true, -75, -43 )
	self:addElement( fefooterRighSlideIn )
	self.fefooterRighSlideIn = fefooterRighSlideIn
	
	local Border0 = LUI.UIImage.new()
	Border0:setLeftRight( false, true, -356, -355 )
	Border0:setTopBottom( true, true, 0, 0 )
	Border0:setAlpha( 0.42 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local Border00 = LUI.UIImage.new()
	Border00:setLeftRight( false, true, -356, -355 )
	Border00:setTopBottom( true, true, 0, 0 )
	Border00:setAlpha( 0.42 )
	self:addElement( Border00 )
	self.Border00 = Border00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				NoFriendsText:completeAnimation()
				self.NoFriendsText:setAlpha( 0 )
				self.clipFinished( NoFriendsText, {} )
				FriendsList:completeAnimation()
				self.FriendsList:setAlpha( 1 )
				self.clipFinished( FriendsList, {} )
			end
		},
		EmptyFriendsList = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				NoFriendsText:completeAnimation()
				self.NoFriendsText:setAlpha( 1 )
				self.clipFinished( NoFriendsText, {} )
				FriendsList:completeAnimation()
				self.FriendsList:setAlpha( 0 )
				self.clipFinished( FriendsList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "EmptyFriendsList",
			condition = function ( menu, element, event )
				return not IsSocialPlayersListEmpty( controller )
			end
		}
	} )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f12_local0 = nil
		UpdateFriends( self, self, controller )
		if not f12_local0 then
			f12_local0 = self:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	FriendsList.id = "FriendsList"
	fefooterRighSlideIn.buttons:setModel( self.buttonModel, controller )
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
		element.fefooterRighSlideIn:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordFriendSidebar.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

