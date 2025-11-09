local PostLoadFunc = function ( self )
	Engine.DisableAllClients()
	self.anyControllerAllowed = true
	self:setHandleMouseButton( true )
	self:registerEventHandler( "mousedown", function ( button, event )
		self.m_eventHandlers.gamepad_button( button, {
			down = true,
			button = "primary"
		} )
	end )
	if CoD.useMouse then
		self.lblPressToPlay.inputGamepadText = self.lblPressToPlay:getText()
		self.lblPressToPlay.inputMouseKeyboardText = Engine.Localize( "PLATFORM_CLICK_TO_PLAY" )
		if not IsGamepad( 0 ) then
			self.lblPressToPlay:setText( self.lblPressToPlay.inputMouseKeyboardText )
		end
		self.lblPressToPlay:registerEventHandler( "input_source_changed", function ( self, event )
			if not IsGamepad( event.controller ) then
				self:setText( self.inputMouseKeyboardText )
			else
				self:setText( self.inputGamepadText )
			end
		end )
	end
end

LUI.createMenu.Main = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Main" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "FrontendMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local lblPressToPlay = LUI.UIText.new()
	lblPressToPlay:setLeftRight( true, false, 64, 1216 )
	lblPressToPlay:setTopBottom( false, true, -52.5, -32.5 )
	lblPressToPlay:setRGB( 0.85, 0.88, 0.91 )
	lblPressToPlay:setText( Engine.Localize( "PLATFORM_PRESS_START" ) )
	lblPressToPlay:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	lblPressToPlay:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	lblPressToPlay:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( lblPressToPlay )
	self.lblPressToPlay = lblPressToPlay
	
	local Fade = LUI.UIImage.new()
	Fade:setLeftRight( true, true, 0, 0 )
	Fade:setTopBottom( true, true, 0, 0 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setAlpha( 0 )
	Fade:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Fade )
	self.Fade = Fade
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local lblPressToPlayFrame2 = function ( lblPressToPlay, event )
					local lblPressToPlayFrame3 = function ( lblPressToPlay, event )
						if not event.interrupted then
							lblPressToPlay:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						end
						lblPressToPlay:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( lblPressToPlay, event )
						else
							lblPressToPlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						lblPressToPlayFrame3( lblPressToPlay, event )
						return 
					else
						lblPressToPlay:beginAnimation( "keyframe", 5000, false, false, CoD.TweenType.Linear )
						lblPressToPlay:registerEventHandler( "transition_complete_keyframe", lblPressToPlayFrame3 )
					end
				end
				
				lblPressToPlay:completeAnimation()
				self.lblPressToPlay:setAlpha( 0 )
				lblPressToPlayFrame2( lblPressToPlay, {} )
				local FadeFrame2 = function ( Fade, event )
					local FadeFrame3 = function ( Fade, event )
						if not event.interrupted then
							Fade:beginAnimation( "keyframe", 949, false, false, CoD.TweenType.Linear )
						end
						Fade:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Fade, event )
						else
							Fade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FadeFrame3( Fade, event )
						return 
					else
						Fade:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Fade:registerEventHandler( "transition_complete_keyframe", FadeFrame3 )
					end
				end
				
				Fade:completeAnimation()
				self.Fade:setAlpha( 1 )
				FadeFrame2( Fade, {} )
			end
		}
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		return true
	end
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetInitLobbyMenu( self, controller )
		SendLobbyMenuResponse( self, controller, "room1" )
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
			LobbyBeginPlay( self, event )
			PlaySoundSetSound( self, "action" )
		end
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

