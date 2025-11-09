require( "ui.uieditor.widgets.button" )

function PostLoadFunc( self, controller )
	self.disableBlur = true
end

LUI.createMenu.EmblemEditorSaveChanges = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmblemEditorSaveChanges" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, -12, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 400.76, 936.76 )
	title:setTopBottom( true, false, 198.26, 246.26 )
	title:setRGB( 1, 1, 1 )
	title:setText( Engine.Localize( "MENU_SAVE_EMBLEM_CHANGES" ) )
	title:setTTF( "fonts/default.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title )
	self.title = title
	
	local yesButton = CoD.button.new( self, controller )
	yesButton:setLeftRight( true, false, 400.76, 1010.76 )
	yesButton:setTopBottom( true, false, 321.14, 351.14 )
	yesButton:setRGB( 1, 1, 1 )
	yesButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_SAVE" ) )
	yesButton:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		SetResponseYes( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( yesButton )
	self.yesButton = yesButton
	
	local noButton = CoD.button.new( self, controller )
	noButton:setLeftRight( true, false, 400.76, 1010.76 )
	noButton:setTopBottom( true, false, 351.14, 381.14 )
	noButton:setRGB( 1, 1, 1 )
	noButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_EMBLEMS_DISCARD" ) )
	noButton:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		SetResponseNo( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( noButton )
	self.noButton = noButton
	
	yesButton.navigation = {
		down = noButton
	}
	noButton.navigation = {
		up = yesButton
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		EmblemEditor = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				title:completeAnimation()
				self.title:setText( Engine.Localize( "MENU_SAVE_EMBLEM_CHANGES" ) )
				self.clipFinished( title, {} )
			end
		},
		Paintshop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				title:completeAnimation()
				self.title:setLeftRight( true, false, 400.76, 936.76 )
				self.title:setTopBottom( true, false, 198.26, 246.26 )
				self.title:setText( Engine.Localize( "MENU_SAVE_PAINTJOB_CHANGES" ) )
				self.clipFinished( title, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "EmblemEditor",
			condition = function ( menu, element, event )
				return IsEmblemEditor( controller )
			end
		},
		{
			stateName = "Paintshop",
			condition = function ( menu, element, event )
				return IsPaintshop( controller )
			end
		}
	} )
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
	noButton.id = "noButton"
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
		self.noButton:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

