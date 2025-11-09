require( "ui.uieditor.widgets.button" )

LUI.createMenu.EmblemEditorLayerOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmblemEditorLayerOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 400.76, 900.76 )
	title:setTopBottom( true, false, 198.26, 246.26 )
	title:setRGB( 1, 1, 1 )
	title:setText( Engine.Localize( "MENU_TAB_OPTIONS" ) )
	title:setTTF( "fonts/default.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title )
	self.title = title
	
	local yesButton = CoD.button.new( self, controller )
	yesButton:setLeftRight( true, false, 400.76, 1010.76 )
	yesButton:setTopBottom( true, false, 321.14, 351.14 )
	yesButton:setRGB( 1, 1, 1 )
	yesButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_EMBLEM_RESET_LAYER" ) )
	yesButton:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		SetResponseYes( self, controller )
		EmblemEditor_BeginEdit( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( yesButton )
	self.yesButton = yesButton
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.primary( self, self, {
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
			EmblemEditor_BeginEdit( self, element, controller )
		end
		if not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	yesButton.id = "yesButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.yesButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.yesButton:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

