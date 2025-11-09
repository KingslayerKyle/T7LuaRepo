require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.Friends.FriendsTabWidget" )
require( "ui.uieditor.widgets.Friends.Friends_FriendsTab" )
require( "ui.uieditor.widgets.Friends.Friends_RecentPlayersTab" )
require( "ui.uieditor.widgets.Friends.Friends_GroupsTab" )
require( "ui.uieditor.widgets.Friends.Friends_InboxTab" )

LUI.createMenu.Friends = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Friends" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "FriendsMenu"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.8 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 100, 275 )
	Title:setTopBottom( true, false, 50.75, 100.25 )
	Title:setRGB( 1, 1, 1 )
	Title:setTTF( "fonts/default.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local FriendsTab = CoD.basicTabList.new( self, controller )
	FriendsTab:setLeftRight( true, false, 64, 1144 )
	FriendsTab:setTopBottom( true, false, 119, 159 )
	FriendsTab:setRGB( 1, 1, 1 )
	FriendsTab.grid:setDataSource( "FriendsMainTabList" )
	FriendsTab.grid:setWidgetType( CoD.FriendsTabWidget )
	FriendsTab:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		SetFriendsTabName( self, element, controller )
		UpdateFriendsData( self, element, controller )
		PlaySoundSetSound( self, "tab_changed" )
		return retVal
	end )
	self:addElement( FriendsTab )
	self.FriendsTab = FriendsTab
	
	local Frame = LUI.UIFrame.new( self, controller, 0, 0 )
	Frame:setLeftRight( true, false, 100, 1180 )
	Frame:setTopBottom( true, false, 160, 620 )
	Frame:setRGB( 1, 1, 1 )
	self:addElement( Frame )
	self.Frame = Frame
	
	Title:linkToElementModel( FriendsTab.grid, "tabName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	Frame:linkToElementModel( FriendsTab.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Frame:changeFrameWidget( modelValue )
		end
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "invite_accepted", function ( element, event )
		local retVal = nil
		GoBack( self, controller )
		LobbyAcceptInvite( self, controller, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Frame.id = "Frame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Frame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.FriendsTab:close()
		self.Title:close()
		self.Frame:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

