LUI.createMenu.codfu_hostsplash = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "codfu_hostsplash" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Splash = LUI.UIImage.new()
	Splash:setLeftRight( true, false, 64, 582 )
	Splash:setTopBottom( true, false, 36, 659 )
	Splash:setRGB( 1, 1, 1 )
	Splash:setImage( RegisterImage( "uie_codfu_splash" ) )
	Splash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Splash )
	self.Splash = Splash
	
	local Team1 = LUI.UIText.new()
	Team1:setLeftRight( true, false, 344, 544 )
	Team1:setTopBottom( true, false, 392, 417 )
	Team1:setRGB( 1, 1, 1 )
	Team1:setText( Engine.Localize( "MENU_TEAM1" ) )
	Team1:setTTF( "fonts/default.ttf" )
	Team1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Team1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Team1 )
	self.Team1 = Team1
	
	local Team2 = LUI.UIText.new()
	Team2:setLeftRight( true, false, 768, 968 )
	Team2:setTopBottom( true, false, 392, 417 )
	Team2:setRGB( 1, 1, 1 )
	Team2:setText( Engine.Localize( "MENU_TEAM2" ) )
	Team2:setTTF( "fonts/default.ttf" )
	Team2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Team2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Team2 )
	self.Team2 = Team2
	
	local Players = LUI.UIText.new()
	Players:setLeftRight( true, false, 540, 740 )
	Players:setTopBottom( true, false, 235, 260 )
	Players:setRGB( 1, 1, 1 )
	Players:setText( Engine.Localize( "MENU_PLAYERS" ) )
	Players:setTTF( "fonts/default.ttf" )
	Players:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Players:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Players )
	self.Players = Players
	
	local Fight = LUI.UIText.new()
	Fight:setLeftRight( true, false, 540, 740 )
	Fight:setTopBottom( true, false, 659, 684 )
	Fight:setRGB( 1, 1, 1 )
	Fight:setText( Engine.Localize( "MENU_FIGHT" ) )
	Fight:setTTF( "fonts/default.ttf" )
	Fight:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Fight:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Fight )
	self.Fight = Fight
	
	local Emblem0 = LUI.UIImage.new()
	Emblem0:setLeftRight( true, false, 608, 672 )
	Emblem0:setTopBottom( true, false, 264, 328 )
	Emblem0:setRGB( 1, 1, 1 )
	Emblem0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Emblem0 )
	self.Emblem0 = Emblem0
	
	local Emblem1 = LUI.UIImage.new()
	Emblem1:setLeftRight( true, false, 608, 672 )
	Emblem1:setTopBottom( true, false, 360, 424 )
	Emblem1:setRGB( 1, 1, 1 )
	Emblem1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Emblem1 )
	self.Emblem1 = Emblem1
	
	local Emblem2 = LUI.UIImage.new()
	Emblem2:setLeftRight( true, false, 608, 672 )
	Emblem2:setTopBottom( true, false, 456.5, 520 )
	Emblem2:setRGB( 1, 1, 1 )
	Emblem2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Emblem2 )
	self.Emblem2 = Emblem2
	
	local Emblem3 = LUI.UIImage.new()
	Emblem3:setLeftRight( true, false, 608, 672 )
	Emblem3:setTopBottom( true, false, 551.5, 616 )
	Emblem3:setRGB( 1, 1, 1 )
	Emblem3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Emblem3 )
	self.Emblem3 = Emblem3
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLAY" ), "SPACE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( menu, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "SPACE") then
			SendMenuResponse( self, "codfu_splash", "closed", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		LockInput( self, controller, true )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

