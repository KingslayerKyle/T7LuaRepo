require( "ui.uieditor.widgets.ImageButton" )

local PostLoadFunc = function ( self )
	self.BackButton.nextFocus = {}
	self.BackButton.nextFocus.left = self.BookmarkButton
	self.BackButton.nextFocus.right = self.HomeButton
	self.BackButton.nextFocus.up = nil
	self.BackButton.nextFocus.down = self.BinaryHTML0
	self.HomeButton.nextFocus = {}
	self.HomeButton.nextFocus.left = self.BackButton
	self.HomeButton.nextFocus.right = self.NextButton
	self.HomeButton.nextFocus.up = nil
	self.HomeButton.nextFocus.down = self.BinaryHTML0
	self.NextButton.nextFocus = {}
	self.NextButton.nextFocus.left = self.HomeButton
	self.NextButton.nextFocus.right = self.BookmarkButton
	self.NextButton.nextFocus.up = nil
	self.NextButton.nextFocus.down = self.BinaryHTML0
	self.BookmarkButton.nextFocus = {}
	self.BookmarkButton.nextFocus.left = self.Nextbutton
	self.BookmarkButton.nextFocus.right = self.BackButton
	self.BookmarkButton.nextFocus.up = nil
	self.BookmarkButton.nextFocus.down = self.BinaryHTML0
	self.BinaryHTML0.nextFocus = {}
	self.BinaryHTML0.nextFocus.left = nil
	self.BinaryHTML0.nextFocus.right = nil
	self.BinaryHTML0.nextFocus.up = self.BackButton
	self.BinaryHTML0.nextFocus.down = nil
	self.BinaryHTML0.m_focusable = true
	self.BinaryHTML0.id = "HTML Element"
	self.currentFocus = self.BackButton
	self.BinaryHTML0.handleGamepadButton = function ()
		
	end
	
	self.DoNavigationForGamePadButton = function ( self, event )
		local controller = event.controller
		if (event.button == "left" or event.button == "right" or event.button == "up" or event.button == "down") and self.currentFocus.nextFocus[event.button] ~= nil then
			self.currentFocus:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
			self.currentFocus.nextFocus[event.button]:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
			self.currentFocus = self.currentFocus.nextFocus[event.button]
			return true
		elseif self.currentFocus == self.BinaryHTML0 and event.button == "shoulderr" then
			self.BinaryHTML0:scrollNextLink()
			return true
		elseif self.currentFocus == self.BinaryHTML0 and event.button == "shoulderl" then
			self.BinaryHTML0:scrollPreviousLink()
			return true
		elseif self.currentFocus == self.BinaryHTML0 and event.button == "primary" then
			self.BinaryHTML0:followActiveLink()
			return true
		elseif self.currentFocus == self.BackButton and event.button == "primary" then
			self.BinaryHTML0:previousLink()
			return true
		elseif self.currentFocus == self.NextButton and event.button == "primary" then
			self.BinaryHTML0:nextLink()
			return true
		elseif self.currentFocus == self.HomeButton and event.button == "primary" then
			self.BinaryHTML0:homeLink()
			return true
		else
			return false
		end
	end
	
end

LUI.createMenu.Omnipedia = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Omnipedia" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local BinaryHTML0 = LUI.UIElement.new()
	BinaryHTML0:setLeftRight( true, false, 364, 916 )
	BinaryHTML0:setTopBottom( true, false, 64, 632 )
	BinaryHTML0:setRGB( 1, 1, 1 )
	BinaryHTML0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	BinaryHTML0:setupBinaryHTML( "html/wiki/test.htm" )
	BinaryHTML0:setUseStencil( true )
	self:addElement( BinaryHTML0 )
	self.BinaryHTML0 = BinaryHTML0
	
	local BackButton = CoD.ImageButton.new( self, controller )
	BackButton:setLeftRight( true, false, 364, 388 )
	BackButton:setTopBottom( true, false, 40, 64 )
	BackButton.focus:setImage( RegisterImage( "uie_back_sel" ) )
	BackButton.unfocused:setImage( RegisterImage( "uie_back" ) )
	self:addElement( BackButton )
	self.BackButton = BackButton
	
	local BookmarkButton = CoD.ImageButton.new( self, controller )
	BookmarkButton:setLeftRight( true, false, 892, 916 )
	BookmarkButton:setTopBottom( true, false, 40, 64 )
	BookmarkButton.focus:setImage( RegisterImage( "uie_bookmark_sel" ) )
	BookmarkButton.unfocused:setImage( RegisterImage( "uie_bookmark" ) )
	self:addElement( BookmarkButton )
	self.BookmarkButton = BookmarkButton
	
	local HomeButton = CoD.ImageButton.new( self, controller )
	HomeButton:setLeftRight( true, false, 388, 412 )
	HomeButton:setTopBottom( true, false, 40, 64 )
	HomeButton.focus:setImage( RegisterImage( "uie_home_sel" ) )
	HomeButton.unfocused:setImage( RegisterImage( "uie_home" ) )
	self:addElement( HomeButton )
	self.HomeButton = HomeButton
	
	local NextButton = CoD.ImageButton.new( self, controller )
	NextButton:setLeftRight( true, false, 412, 436 )
	NextButton:setTopBottom( true, false, 40, 64 )
	NextButton.focus:setImage( RegisterImage( "uie_next_sel" ) )
	NextButton.unfocused:setImage( RegisterImage( "uie_next" ) )
	self:addElement( NextButton )
	self.NextButton = NextButton
	
	local TitleBarImage = LUI.UIImage.new()
	TitleBarImage:setLeftRight( true, false, 436, 892 )
	TitleBarImage:setTopBottom( true, false, 40, 64 )
	TitleBarImage:setImage( RegisterImage( "uie_titlebar" ) )
	TitleBarImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBarImage )
	self.TitleBarImage = TitleBarImage
	
	BackButton.navigation = {
		right = HomeButton
	}
	BookmarkButton.navigation = {
		left = NextButton
	}
	HomeButton.navigation = {
		left = BackButton,
		right = NextButton
	}
	NextButton.navigation = {
		left = HomeButton,
		right = BookmarkButton
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	BackButton.id = "BackButton"
	BookmarkButton.id = "BookmarkButton"
	HomeButton.id = "HomeButton"
	NextButton.id = "NextButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.BackButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.BackButton:close()
		self.BookmarkButton:close()
		self.HomeButton:close()
		self.NextButton:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

