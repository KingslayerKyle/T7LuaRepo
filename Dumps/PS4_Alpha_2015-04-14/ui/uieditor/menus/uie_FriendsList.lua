require( "ui.uieditor.widgets.MenuSpecificWidgets.FriendsList.tabsBar" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.FriendsList.friendInfo" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.FriendsList.friendsListWidget" )

LUI.createMenu.uie_FriendsList = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "uie_FriendsList" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 96, 210 )
	Label0:setTopBottom( true, false, 54, 102 )
	Label0:setRGB( 1, 1, 1 )
	Label0:setText( Engine.Localize( "MENU_FRIENDS_CAPS" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local tabsBar0 = CoD.tabsBar.new( self, controller )
	tabsBar0:setLeftRight( true, false, 117, 1163 )
	tabsBar0:setTopBottom( true, false, 102, 132 )
	tabsBar0:setRGB( 1, 1, 1 )
	self:addElement( tabsBar0 )
	self.tabsBar0 = tabsBar0
	
	local friendInfo0 = CoD.friendInfo.new( self, controller )
	friendInfo0:setLeftRight( true, false, 687.62, 1133.62 )
	friendInfo0:setTopBottom( true, false, 194, 594 )
	friendInfo0:setRGB( 1, 1, 1 )
	self:addElement( friendInfo0 )
	self.friendInfo0 = friendInfo0
	
	local List0 = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	List0:makeFocusable()
	List0:setLeftRight( true, false, 156.5, 556.5 )
	List0:setTopBottom( true, false, 194, 594 )
	List0:setRGB( 1, 1, 1 )
	List0:setDataSource( "Friends" )
	List0:setWidgetType( CoD.friendsListWidget )
	List0:setVerticalCount( 6 )
	self:addElement( List0 )
	self.List0 = List0
	
	friendInfo0:linkToElementModel( List0, "emblem", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			friendInfo0.emblem:setImage( RegisterImage( modelValue ) )
		end
	end )
	friendInfo0:linkToElementModel( List0, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			friendInfo0.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
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
	List0.id = "List0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.List0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.tabsBar0:close()
		self.friendInfo0:close()
		self.List0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

