require( "ui.uieditor.menus.AccountLink.Success" )
require( "ui.uieditor.menus.AccountLink.Failure" )
require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.widgets.RegisterField" )
require( "ui.uieditor.widgets.AccountLink.GenderList" )
require( "ui.uieditor.widgets.AccountLink.MonthList" )
require( "ui.uieditor.widgets.AccountLink.RegionList" )
require( "ui.uieditor.widgets.AccountLink.YearList" )
require( "ui.uieditor.widgets.AccountLink.DayList" )

LUI.createMenu.UmbrellaRegister = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "UmbrellaRegister" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "UmbrellaRegister.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local bg = CoD.DialogBackground.new( menu, controller )
	bg:setLeftRight( true, false, 164, 1116 )
	bg:setTopBottom( true, false, 50, 670 )
	self:addElement( bg )
	self.bg = bg
	
	local CreateAccountLabel = LUI.UITightText.new()
	CreateAccountLabel:setLeftRight( true, false, 524, 756 )
	CreateAccountLabel:setTopBottom( true, false, 101, 149 )
	CreateAccountLabel:setText( Engine.Localize( "ACCOUNT_LINK_REGISTER" ) )
	CreateAccountLabel:setTTF( "fonts/default.ttf" )
	self:addElement( CreateAccountLabel )
	self.CreateAccountLabel = CreateAccountLabel
	
	local confirm = CoD.button.new( menu, controller )
	confirm:setLeftRight( true, false, 992, 1086 )
	confirm:setTopBottom( true, false, 612.5, 642.5 )
	confirm.buttoninternal0.Text0:setText( Engine.Localize( "MENU_CONFIRM_CAPS" ) )
	confirm:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		AccountLink_Register( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( confirm )
	self.confirm = confirm
	
	local DOBLabel = LUI.UITightText.new()
	DOBLabel:setLeftRight( true, false, 194, 394 )
	DOBLabel:setTopBottom( true, false, 474.5, 510.5 )
	DOBLabel:setText( Engine.Localize( "ACCOUNT_LINK_DOB" ) )
	DOBLabel:setTTF( "fonts/default.ttf" )
	self:addElement( DOBLabel )
	self.DOBLabel = DOBLabel
	
	local firstName = CoD.RegisterField.new( menu, controller )
	firstName:setLeftRight( true, false, 194, 1086 )
	firstName:setTopBottom( true, false, 168.5, 202.5 )
	firstName.Label:setText( Engine.Localize( "ACCOUNT_LINK_FNAME" ) )
	firstName:subscribeToGlobalModel( controller, "AccountLinkRegister", "firstName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			firstName.Value:setText( modelValue )
		end
	end )
	firstName:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_FIRST_NAME" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( firstName )
	self.firstName = firstName
	
	local lastName = CoD.RegisterField.new( menu, controller )
	lastName:setLeftRight( true, false, 194, 1086 )
	lastName:setTopBottom( true, false, 202.5, 236.5 )
	lastName.Label:setText( Engine.Localize( "ACCOUNT_LINK_LNAME" ) )
	lastName:subscribeToGlobalModel( controller, "AccountLinkRegister", "lastName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lastName.Value:setText( modelValue )
		end
	end )
	lastName:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_LAST_NAME" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( lastName )
	self.lastName = lastName
	
	local zip = CoD.RegisterField.new( menu, controller )
	zip:setLeftRight( true, false, 194, 1086 )
	zip:setTopBottom( true, false, 270.5, 304.5 )
	zip.Label:setText( Engine.Localize( "ACCOUNT_LINK_ZIPCODE" ) )
	zip:subscribeToGlobalModel( controller, "AccountLinkRegister", "zipCode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			zip.Value:setText( modelValue )
		end
	end )
	zip:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_ZIP_CODE" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( zip )
	self.zip = zip
	
	local confirmPassword = CoD.RegisterField.new( menu, controller )
	confirmPassword:setLeftRight( true, false, 194, 1086 )
	confirmPassword:setTopBottom( true, false, 406.5, 440.5 )
	confirmPassword.Label:setText( Engine.Localize( "ACCOUNT_LINK_CONFIRMPASS" ) )
	confirmPassword:subscribeToGlobalModel( controller, "AccountLinkRegister", "confirmStars", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			confirmPassword.Value:setText( modelValue )
		end
	end )
	confirmPassword:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_CONFIRM_PASSWORD" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( confirmPassword )
	self.confirmPassword = confirmPassword
	
	local password = CoD.RegisterField.new( menu, controller )
	password:setLeftRight( true, false, 194, 1086 )
	password:setTopBottom( true, false, 372.5, 406.5 )
	password.Label:setText( Engine.Localize( "ACCOUNT_LINK_PASSWORD" ) )
	password:subscribeToGlobalModel( controller, "AccountLinkRegister", "stars", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			password.Value:setText( modelValue )
		end
	end )
	password:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_PASSWORD" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( password )
	self.password = password
	
	local email = CoD.RegisterField.new( menu, controller )
	email:setLeftRight( true, false, 194, 1086 )
	email:setTopBottom( true, false, 338.5, 372.5 )
	email.Label:setText( Engine.Localize( "ACCOUNT_LINK_EMAIL" ) )
	email:subscribeToGlobalModel( controller, "AccountLinkRegister", "email", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			email.Value:setText( modelValue )
		end
	end )
	email:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_EMAIL" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( email )
	self.email = email
	
	local username = CoD.RegisterField.new( menu, controller )
	username:setLeftRight( true, false, 194, 1086 )
	username:setTopBottom( true, false, 304.5, 338.5 )
	username.Label:setText( Engine.Localize( "ACCOUNT_LINK_USERNAME" ) )
	username:subscribeToGlobalModel( controller, "AccountLinkRegister", "username", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			username.Value:setText( modelValue )
		end
	end )
	username:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_USERNAME" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( username )
	self.username = username
	
	local gender = CoD.GenderList.new( menu, controller )
	gender:setLeftRight( true, false, 192.94, 1086 )
	gender:setTopBottom( true, false, 440.5, 474.5 )
	gender.DropdownRoot.Text:setText( Engine.Localize( "ACCOUNT_LINK_GENDER" ) )
	gender:subscribeToGlobalModel( controller, "AccountLinkRegister", "gender", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gender.SelectedValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( gender )
	self.gender = gender
	
	local month = CoD.MonthList.new( menu, controller )
	month:setLeftRight( true, false, 192.94, 1086 )
	month:setTopBottom( true, false, 507.76, 541.76 )
	month.DropdownRoot.Text:setText( Engine.Localize( "ACCOUNT_LINK_MONTH" ) )
	month:subscribeToGlobalModel( controller, "AccountLinkRegister", "month", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			month.SelectedValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( month )
	self.month = month
	
	local region = CoD.RegionList.new( menu, controller )
	region:setLeftRight( true, false, 194, 1086 )
	region:setTopBottom( true, false, 236.5, 270.5 )
	region.DropdownRoot.Text:setText( Engine.Localize( "ACCOUNT_LINK_REGION" ) )
	region:subscribeToGlobalModel( controller, "AccountLinkRegister", "region", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			region.SelectedValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( region )
	self.region = region
	
	local year = CoD.YearList.new( menu, controller )
	year:setLeftRight( true, false, 194, 1086 )
	year:setTopBottom( true, false, 578.5, 612.5 )
	year.DropdownRoot.Text:setText( Engine.Localize( "ACCOUNT_LINK_YEAR" ) )
	year:subscribeToGlobalModel( controller, "AccountLinkRegister", "year", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			year.SelectedValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( year )
	self.year = year
	
	local day = CoD.DayList.new( menu, controller )
	day:setLeftRight( true, false, 194, 1086 )
	day:setTopBottom( true, false, 541.76, 575.76 )
	day.DropdownRoot.Text:setText( Engine.Localize( "ACCOUNT_LINK_DAY" ) )
	day:subscribeToGlobalModel( controller, "AccountLinkRegister", "day", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			day.SelectedValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( day )
	self.day = day
	
	confirm.navigation = {
		up = year
	}
	firstName.navigation = {
		down = lastName
	}
	lastName.navigation = {
		up = firstName,
		down = region
	}
	zip.navigation = {
		up = region,
		down = username
	}
	confirmPassword.navigation = {
		up = password,
		down = gender
	}
	password.navigation = {
		up = email,
		down = confirmPassword
	}
	email.navigation = {
		up = username,
		down = password
	}
	username.navigation = {
		up = zip,
		down = email
	}
	gender.navigation = {
		up = confirmPassword,
		down = month
	}
	month.navigation = {
		up = gender,
		down = day
	}
	region.navigation = {
		up = lastName,
		down = zip
	}
	year.navigation = {
		up = day,
		down = confirm
	}
	day.navigation = {
		up = month,
		down = year
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		menu:addButtonPrompt( "alt2", Engine.Localize( "skip" ), "", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( menu, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.alt2( menu, self, {
		controller = controller
	} )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		AccountLink_HandleRegisterKeyboardComplete( self, element, controller, event )
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
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not self.occludedBy and event.button == "alt2" then
			AccountLink_SetAccountLinkViewed( self, element, controller )
			GoBack( self, controller )
			LobbyBeginPlay( self, event )
			PlaySoundSetSound( self, "action" )
			LoadSaveGameData( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "account_link_success", function ( element, event )
		local retVal = nil
		GoBackAndOpenOverlayOnParent( self, "Success", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "account_link_failure", function ( element, event )
		local retVal = nil
		GoBackAndOpenOverlayOnParent( self, "Failure", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	confirm.id = "confirm"
	firstName.id = "firstName"
	lastName.id = "lastName"
	zip.id = "zip"
	confirmPassword.id = "confirmPassword"
	password.id = "password"
	email.id = "email"
	username.id = "username"
	gender.id = "gender"
	month.id = "month"
	region.id = "region"
	year.id = "year"
	day.id = "day"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.firstName:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.bg:close()
		self.confirm:close()
		self.firstName:close()
		self.lastName:close()
		self.zip:close()
		self.confirmPassword:close()
		self.password:close()
		self.email:close()
		self.username:close()
		self.gender:close()
		self.month:close()
		self.region:close()
		self.year:close()
		self.day:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "UmbrellaRegister.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

