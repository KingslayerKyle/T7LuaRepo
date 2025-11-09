require( "ui.uieditor.widgets.button" )

LUI.createMenu.codfu_pause = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "codfu_pause" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local control = LUI.UIImage.new()
	control:setLeftRight( true, false, 303.5, 1079.5 )
	control:setTopBottom( true, false, 68, 652 )
	control:setRGB( 1, 1, 1 )
	control:setImage( RegisterImage( "uie_codfu_controller_layout" ) )
	control:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( control )
	self.control = control
	
	local buttonQuit = CoD.button.new( self, controller )
	buttonQuit:setLeftRight( true, false, 177, 430 )
	buttonQuit:setTopBottom( true, false, 563.11, 593.11 )
	buttonQuit:setRGB( 1, 1, 1 )
	buttonQuit.buttoninternal0.Text0:setText( Engine.Localize( "MENU_QUIT_CAPS" ) )
	buttonQuit:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		QuitGame( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( buttonQuit )
	self.buttonQuit = buttonQuit
	
	local buttonOptions = CoD.button.new( self, controller )
	buttonOptions:setLeftRight( true, false, 177, 787 )
	buttonOptions:setTopBottom( true, false, 523.11, 553.11 )
	buttonOptions:setRGB( 1, 1, 1 )
	buttonOptions.buttoninternal0.Text0:setText( Engine.Localize( "MENU_OPTIONS_CAPS" ) )
	buttonOptions:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenOptionsMenu( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( buttonOptions )
	self.buttonOptions = buttonOptions
	
	local buttonRestart = CoD.button.new( self, controller )
	buttonRestart:setLeftRight( true, false, 177, 430 )
	buttonRestart:setTopBottom( true, false, 485.37, 515.37 )
	buttonRestart:setRGB( 1, 1, 1 )
	buttonRestart.buttoninternal0.Text0:setText( Engine.Localize( "MENU_RESTART_LEVEL_CAPS" ) )
	buttonRestart:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		RestartMission( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( buttonRestart )
	self.buttonRestart = buttonRestart
	
	local buttonResume = CoD.button.new( self, controller )
	buttonResume:setLeftRight( true, false, 177, 430 )
	buttonResume:setTopBottom( true, false, 447.19, 477.19 )
	buttonResume:setRGB( 1, 1, 1 )
	buttonResume.buttoninternal0.Text0:setText( Engine.Localize( "MENU_RESUMEGAME_CAPS" ) )
	buttonResume:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		ResumeGame( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( buttonResume )
	self.buttonResume = buttonResume
	
	buttonQuit.navigation = {
		up = buttonOptions
	}
	buttonOptions.navigation = {
		up = buttonRestart,
		down = buttonQuit
	}
	buttonRestart.navigation = {
		up = buttonResume,
		down = buttonOptions
	}
	buttonResume.navigation = {
		down = buttonRestart
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		bold = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			bold = function ()
				self:setupElementClipCounter( 1 )
				buttonResume:completeAnimation()
				self.buttonResume:setRGB( 1, 1, 1 )
				self.buttonResume:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_glow" ) )
				self.clipFinished( buttonResume, {} )
			end
		}
	}
	buttonQuit.id = "buttonQuit"
	buttonOptions.id = "buttonOptions"
	buttonRestart.id = "buttonRestart"
	buttonResume.id = "buttonResume"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.buttonResume:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.buttonQuit:close()
		self.buttonOptions:close()
		self.buttonRestart:close()
		self.buttonResume:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

