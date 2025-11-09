local VCSGames = {
	"vcs/pitfall2.bin",
	"vcs/hero.bin",
	"vcs/kaboom.bin",
	"vcs/riverraid.bin"
}
local VCSAnimateIn = function ( self )
	self.buttonPromptHolder:setAlpha( 0 )
	self.buttonPromptHolder:beginAnimation( "animate_popup_in", 1000, false, true )
	self.buttonPromptHolder:setAlpha( 1 )
end

local VCSStartGame = function ( self )
	Engine.Exec( self:getOwner(), "vcs_stop" )
	Engine.Exec( self:getOwner(), "vcs_start " .. VCSGames[self.currentGame] .. " 1" )
end

local VCSClose = function ( self )
	Engine.Exec( self:getOwner(), "vcs_stop" )
	Engine.SendMenuResponse( self:getOwner(), "vcs", "vcs_stop" )
	CoD.Menu.close( self )
end

local VCSShutdown = function ( self, event )
	self.updateBlur = CoD.Menu.updateBlur
	self.updateIngamePopupBg = CoD.Menu.updateIngamePopupBg
	self:goBack( self:getOwner() )
end

local VCSPrevGame = function ( self, event )
	self.currentGame = self.currentGame - 1
	if self.currentGame < 1 then
		self.currentGame = #VCSGames
	end
	VCSStartGame( self )
end

local VCSNextGame = function ( self, event )
	self.currentGame = self.currentGame + 1
	if #VCSGames < self.currentGame then
		self.currentGame = 1
	end
	VCSStartGame( self )
end

local VCSGamepadButton = function ( self, event )
	if self.m_inputDisabled then
		return 
	elseif Engine.IsControllerBeingUsed( event.controller ) and self.m_ownerController == event.controller then
		if event.down then
			if event.button == "up" or event.button == "left" or event.button == "right" or event.button == "down" then
				self.joystickDirection = event.button
				self.joystickImage:setImage( RegisterMaterial( "vcs_joystick_" .. event.button ) )
			elseif event.button == "primary" or event.button == "start" or event.button == "select" then
				self.joystickButtonPressed = event.button
				self.joystickButtonImage:setImage( RegisterMaterial( "vcs_joystick_button_down" ) )
			end
		elseif event.button == self.joystickDirection then
			self.joystickDirection = nil
			self.joystickImage:setImage( RegisterMaterial( "vcs_joystick_center" ) )
		elseif event.button == self.joystickButtonPressed then
			self.joystickButtonPressed = nil
			self.joystickButtonImage:setImage( RegisterMaterial( "vcs_joystick_button_up" ) )
		end
		return self:dispatchEventToChildren( event )
	else
		
	end
end

LUI.createMenu.vcs = function ( controller )
	local self = CoD.Menu.NewFromState( "vcs" )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:setOwner( controller )
	self.animateIn = VCSAnimateIn
	self.close = VCSClose
	self.updateBlur = CoD.NullFunction
	self.updateIngamePopupBg = CoD.NullFunction
	self.currentGame = 1
	Engine.SetUIActive( controller, true )
	Engine.LockInput( controller, true )
	VCSStartGame( self )
	local safeArea = LUI.UIElement.new()
	safeArea:sizeToSafeArea( controller )
	self:addElement( safeArea )
	local viewmodelWidth = 768
	local viewmodelHeight = 384
	local viewmodel = LUI.UIElement.new()
	viewmodel:setLeftRight( false, false, -viewmodelWidth / 2, viewmodelWidth / 2 )
	viewmodel:setTopBottom( false, true, 0, viewmodelHeight )
	if Engine.DvarBool( nil, "disable_vcs_viewmodel" ) then
		viewmodel:setAlpha( 0 )
	end
	self:addElement( viewmodel )
	self.viewmodel = viewmodel
	
	viewmodel:beginAnimation( "viewmodel_raise", 500, true, true )
	viewmodel:setTopBottom( false, true, -viewmodelHeight, 0 )
	self:registerEventHandler( "vcs_stop_playing", function ( self, event )
		self.viewmodel:beginAnimation( "viewmodel_lower", 500, true, false )
		self.viewmodel:setTopBottom( false, true, 0, viewmodelHeight )
	end )
	self.viewmodel:registerEventHandler( "transition_complete_viewmodel_lower", function ( self, event )
		self:dispatchEventToParent( {
			name = "vcs_shutdown"
		} )
	end )
	
	local joystickButtonImage = LUI.UIImage.new()
	joystickButtonImage:setLeftRight( true, true, 0, 0 )
	joystickButtonImage:setTopBottom( true, true, 0, 0 )
	joystickButtonImage:setImage( RegisterMaterial( "vcs_joystick_button_up" ) )
	viewmodel:addElement( joystickButtonImage )
	self.joystickButtonImage = joystickButtonImage
	
	local joystickImage = LUI.UIImage.new()
	joystickImage:setLeftRight( true, true, 0, 0 )
	joystickImage:setTopBottom( true, true, 0, 0 )
	joystickImage:setImage( RegisterMaterial( "vcs_joystick_center" ) )
	viewmodel:addElement( joystickImage )
	self.joystickImage = joystickImage
	
	local buttonPromptHolder = LUI.UIVerticalList.new()
	buttonPromptHolder:setLeftRight( true, true, 0, 0 )
	buttonPromptHolder:setTopBottom( false, true, -CoD.ButtonPrompt.Height - 7200, -10 )
	buttonPromptHolder:setAlignment( LUI.Alignment.Bottom )
	safeArea:addElement( buttonPromptHolder )
	self.buttonPromptHolder = buttonPromptHolder
	
	local buttonPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MPUI_VCS_STOP_PLAYING" ), self, "vcs_stop_playing" )
	buttonPromptHolder:addElement( buttonPrompt )
	buttonPromptHolder:addElement( CoD.ButtonPrompt.new( "shoulderr", Engine.Localize( "MPUI_VCS_NEXT_GAME" ), self, "vcs_next_game" ) )
	buttonPromptHolder:addElement( CoD.ButtonPrompt.new( "shoulderl", Engine.Localize( "MPUI_VCS_PREV_GAME" ), self, "vcs_prev_game" ) )
	buttonPromptHolder:addElement( CoD.ButtonPrompt.new( "primary", Engine.Localize( "MPUI_VCS_FIRE" ), self ) )
	buttonPromptHolder:addElement( CoD.ButtonPrompt.new( "select", Engine.Localize( "MPUI_VCS_SELECT" ), self ) )
	buttonPromptHolder:addElement( CoD.ButtonPrompt.new( "start", Engine.Localize( "MPUI_VCS_START_GAME" ), self ) )
	self:registerEventHandler( "gamepad_button", VCSGamepadButton )
	self:registerEventHandler( "vcs_prev_game", VCSPrevGame )
	self:registerEventHandler( "vcs_next_game", VCSNextGame )
	self:registerEventHandler( "vcs_shutdown", VCSShutdown )
	self:registerEventHandler( "close_all_ingame_menus", VCSShutdown )
	self:registerEventHandler( "first_snapshot", VCSShutdown )
	return self
end

