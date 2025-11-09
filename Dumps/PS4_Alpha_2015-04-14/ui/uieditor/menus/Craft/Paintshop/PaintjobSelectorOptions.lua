require( "ui.uieditor.widgets.BackgroundFrames.CACPopupBackground" )
require( "ui.uieditor.widgets.button" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].selectedpaintjobModel )
end

LUI.createMenu.PaintjobSelectorOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PaintjobSelectorOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACPopupBackground.new( self, controller )
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 1, 1, 1 )
	self:addElement( background )
	self.background = background
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( true, false, 76.73, 452.73 )
	titleLabel:setTopBottom( true, false, 202, 262 )
	titleLabel:setRGB( 0.5, 0.51, 0.52 )
	titleLabel:setText( Engine.Localize( LocalizeToUpperString( "MENU_PAINTJOB_OPTIONS_CAPS" ) ) )
	titleLabel:setTTF( "fonts/default.ttf" )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	local clearPaintjob = CoD.button.new( self, controller )
	clearPaintjob:setLeftRight( true, false, 80.73, 690.73 )
	clearPaintjob:setTopBottom( true, false, 372, 402 )
	clearPaintjob:setRGB( 1, 1, 1 )
	clearPaintjob.buttoninternal0.Text0:setText( Engine.Localize( "MENU_PAINTJOB_CLEAR" ) )
	clearPaintjob:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		PaintjobSelector_ClearPaintjob( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( clearPaintjob )
	self.clearPaintjob = clearPaintjob
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK_CAPS" ), "ESCAPE", element )
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
			ClearSavedState( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	clearPaintjob.id = "clearPaintjob"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.clearPaintjob:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.background:close()
		self.clearPaintjob:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

