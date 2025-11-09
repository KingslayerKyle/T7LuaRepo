LUI.createMenu.codfu_teamselect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "codfu_teamselect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Player1 = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	Player1:makeFocusable()
	Player1:setLeftRight( true, false, 331.5, 431.5 )
	Player1:setTopBottom( true, false, 204.5, 304.5 )
	Player1:setRGB( 1, 1, 1 )
	Player1:setDataSource( "PlayerList" )
	self:addElement( Player1 )
	self.Player1 = Player1
	
	local Player2 = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	Player2:makeFocusable()
	Player2:setLeftRight( true, false, 755.5, 855.5 )
	Player2:setTopBottom( true, false, 204.5, 304.5 )
	Player2:setRGB( 1, 1, 1 )
	Player2:setDataSource( "PlayerList" )
	self:addElement( Player2 )
	self.Player2 = Player2
	
	local Player3 = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	Player3:makeFocusable()
	Player3:setLeftRight( true, false, 331.5, 431.5 )
	Player3:setTopBottom( true, false, 376, 476 )
	Player3:setRGB( 1, 1, 1 )
	Player3:setDataSource( "PlayerList" )
	self:addElement( Player3 )
	self.Player3 = Player3
	
	local Player4 = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	Player4:makeFocusable()
	Player4:setLeftRight( true, false, 755.5, 855.5 )
	Player4:setTopBottom( true, false, 376, 476 )
	Player4:setRGB( 1, 1, 1 )
	Player4:setDataSource( "PlayerList" )
	self:addElement( Player4 )
	self.Player4 = Player4
	
	local Team1 = LUI.UITightText.new()
	Team1:setLeftRight( true, false, 331.5, 532.5 )
	Team1:setTopBottom( true, false, 137.5, 162.5 )
	Team1:setRGB( 1, 1, 1 )
	Team1:setText( Engine.Localize( "MENU_CODFU_TEAM1" ) )
	Team1:setTTF( "fonts/default.ttf" )
	self:addElement( Team1 )
	self.Team1 = Team1
	
	local Team2 = LUI.UITightText.new()
	Team2:setLeftRight( true, false, 742.5, 943.5 )
	Team2:setTopBottom( true, false, 137.5, 162.5 )
	Team2:setRGB( 1, 1, 1 )
	Team2:setText( Engine.Localize( "MENU_CODFU_TEAM2" ) )
	Team2:setTTF( "fonts/default.ttf" )
	self:addElement( Team2 )
	self.Team2 = Team2
	
	local LabelPlayer1 = LUI.UITightText.new()
	LabelPlayer1:setLeftRight( true, false, 394.5, 469.5 )
	LabelPlayer1:setTopBottom( true, false, 179.5, 204.5 )
	LabelPlayer1:setRGB( 1, 1, 1 )
	LabelPlayer1:setText( Engine.Localize( "MENU_PLAYER1" ) )
	LabelPlayer1:setTTF( "fonts/default.ttf" )
	self:addElement( LabelPlayer1 )
	self.LabelPlayer1 = LabelPlayer1
	
	local LabelPlayer3 = LUI.UITightText.new()
	LabelPlayer3:setLeftRight( true, false, 390, 465 )
	LabelPlayer3:setTopBottom( true, false, 347.5, 372.5 )
	LabelPlayer3:setRGB( 1, 1, 1 )
	LabelPlayer3:setText( Engine.Localize( "MENU_PLAYER3" ) )
	LabelPlayer3:setTTF( "fonts/default.ttf" )
	self:addElement( LabelPlayer3 )
	self.LabelPlayer3 = LabelPlayer3
	
	local LabelPlayer2 = LUI.UITightText.new()
	LabelPlayer2:setLeftRight( true, false, 805.5, 880.5 )
	LabelPlayer2:setTopBottom( true, false, 351, 376 )
	LabelPlayer2:setRGB( 1, 1, 1 )
	LabelPlayer2:setText( Engine.Localize( "MENU_PLAYER2" ) )
	LabelPlayer2:setTTF( "fonts/default.ttf" )
	self:addElement( LabelPlayer2 )
	self.LabelPlayer2 = LabelPlayer2
	
	local LabelPlayer4 = LUI.UITightText.new()
	LabelPlayer4:setLeftRight( true, false, 818, 893 )
	LabelPlayer4:setTopBottom( true, false, 179.5, 204.5 )
	LabelPlayer4:setRGB( 1, 1, 1 )
	LabelPlayer4:setText( Engine.Localize( "MENU_PLAYER4" ) )
	LabelPlayer4:setTTF( "fonts/default.ttf" )
	self:addElement( LabelPlayer4 )
	self.LabelPlayer4 = LabelPlayer4
	
	Player1.navigation = {
		right = Player2,
		down = Player3
	}
	Player2.navigation = {
		left = Player1,
		down = Player4
	}
	Player3.navigation = {
		up = Player1,
		right = Player4
	}
	Player4.navigation = {
		left = Player3,
		up = Player2
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_CODFU_FIGHT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		LockInput( self, controller, true )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "ENTER") then
			SendMenuResponse( self, "codfu_teamselect", "closed", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Player1.id = "Player1"
	Player2.id = "Player2"
	Player3.id = "Player3"
	Player4.id = "Player4"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	self.close = function ( self )
		self.Player1:close()
		self.Player2:close()
		self.Player3:close()
		self.Player4:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

