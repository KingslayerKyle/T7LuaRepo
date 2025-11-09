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
	self.anyChildUsesUpdateState = true
	
	local bg = CoD.DialogBackground.new( self, controller )
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
	
	local confirm = CoD.button.new( self, controller )
	confirm:setLeftRight( true, false, 992, 1086 )
	confirm:setTopBottom( true, false, 612.5, 642.5 )
	confirm.buttoninternal0.Text0:setText( Engine.Localize( "MENU_CONFIRM_CAPS" ) )
	confirm:registerEventHandler( "button_action", function ( element, event )
		local f2_local0 = nil
		AccountLink_Register( self, element, controller )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
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
	
	local firstName = CoD.RegisterField.new( self, controller )
	firstName:setLeftRight( true, false, 194, 1086 )
	firstName:setTopBottom( true, false, 168.5, 202.5 )
	firstName.Label:setText( Engine.Localize( "ACCOUNT_LINK_FNAME" ) )
	firstName:subscribeToGlobalModel( controller, "AccountLinkRegister", "firstName", function ( model )
		local _firstName = Engine.GetModelValue( model )
		if _firstName then
			firstName.Value:setText( _firstName )
		end
	end )
	firstName:registerEventHandler( "button_action", function ( element, event )
		local f4_local0 = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_FIRST_NAME" )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:addElement( firstName )
	self.firstName = firstName
	
	local lastName = CoD.RegisterField.new( self, controller )
	lastName:setLeftRight( true, false, 194, 1086 )
	lastName:setTopBottom( true, false, 202.5, 236.5 )
	lastName.Label:setText( Engine.Localize( "ACCOUNT_LINK_LNAME" ) )
	lastName:subscribeToGlobalModel( controller, "AccountLinkRegister", "lastName", function ( model )
		local _lastName = Engine.GetModelValue( model )
		if _lastName then
			lastName.Value:setText( _lastName )
		end
	end )
	lastName:registerEventHandler( "button_action", function ( element, event )
		local f6_local0 = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_LAST_NAME" )
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	self:addElement( lastName )
	self.lastName = lastName
	
	local zip = CoD.RegisterField.new( self, controller )
	zip:setLeftRight( true, false, 194, 1086 )
	zip:setTopBottom( true, false, 270.5, 304.5 )
	zip.Label:setText( Engine.Localize( "ACCOUNT_LINK_ZIPCODE" ) )
	zip:subscribeToGlobalModel( controller, "AccountLinkRegister", "zipCode", function ( model )
		local zipCode = Engine.GetModelValue( model )
		if zipCode then
			zip.Value:setText( zipCode )
		end
	end )
	zip:registerEventHandler( "button_action", function ( element, event )
		local f8_local0 = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_ZIP_CODE" )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:addElement( zip )
	self.zip = zip
	
	local confirmPassword = CoD.RegisterField.new( self, controller )
	confirmPassword:setLeftRight( true, false, 194, 1086 )
	confirmPassword:setTopBottom( true, false, 406.5, 440.5 )
	confirmPassword.Label:setText( Engine.Localize( "ACCOUNT_LINK_CONFIRMPASS" ) )
	confirmPassword:subscribeToGlobalModel( controller, "AccountLinkRegister", "confirmStars", function ( model )
		local confirmStars = Engine.GetModelValue( model )
		if confirmStars then
			confirmPassword.Value:setText( confirmStars )
		end
	end )
	confirmPassword:registerEventHandler( "button_action", function ( element, event )
		local f10_local0 = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_CONFIRM_PASSWORD" )
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:addElement( confirmPassword )
	self.confirmPassword = confirmPassword
	
	local password = CoD.RegisterField.new( self, controller )
	password:setLeftRight( true, false, 194, 1086 )
	password:setTopBottom( true, false, 372.5, 406.5 )
	password.Label:setText( Engine.Localize( "ACCOUNT_LINK_PASSWORD" ) )
	password:subscribeToGlobalModel( controller, "AccountLinkRegister", "stars", function ( model )
		local stars = Engine.GetModelValue( model )
		if stars then
			password.Value:setText( stars )
		end
	end )
	password:registerEventHandler( "button_action", function ( element, event )
		local f12_local0 = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_PASSWORD" )
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	self:addElement( password )
	self.password = password
	
	local email = CoD.RegisterField.new( self, controller )
	email:setLeftRight( true, false, 194, 1086 )
	email:setTopBottom( true, false, 338.5, 372.5 )
	email.Label:setText( Engine.Localize( "ACCOUNT_LINK_EMAIL" ) )
	email:subscribeToGlobalModel( controller, "AccountLinkRegister", "email", function ( model )
		local _email = Engine.GetModelValue( model )
		if _email then
			email.Value:setText( _email )
		end
	end )
	email:registerEventHandler( "button_action", function ( element, event )
		local f14_local0 = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_EMAIL" )
		if not f14_local0 then
			f14_local0 = element:dispatchEventToChildren( event )
		end
		return f14_local0
	end )
	self:addElement( email )
	self.email = email
	
	local username = CoD.RegisterField.new( self, controller )
	username:setLeftRight( true, false, 194, 1086 )
	username:setTopBottom( true, false, 304.5, 338.5 )
	username.Label:setText( Engine.Localize( "ACCOUNT_LINK_USERNAME" ) )
	username:subscribeToGlobalModel( controller, "AccountLinkRegister", "username", function ( model )
		local _username = Engine.GetModelValue( model )
		if _username then
			username.Value:setText( _username )
		end
	end )
	username:registerEventHandler( "button_action", function ( element, event )
		local f16_local0 = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_USERNAME" )
		if not f16_local0 then
			f16_local0 = element:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	self:addElement( username )
	self.username = username
	
	local gender = CoD.GenderList.new( self, controller )
	gender:setLeftRight( true, false, 192.94, 1086 )
	gender:setTopBottom( true, false, 440.5, 474.5 )
	gender.DropdownRoot.Text:setText( Engine.Localize( "ACCOUNT_LINK_GENDER" ) )
	gender:subscribeToGlobalModel( controller, "AccountLinkRegister", "gender", function ( model )
		local _gender = Engine.GetModelValue( model )
		if _gender then
			gender.SelectedValue:setText( Engine.Localize( _gender ) )
		end
	end )
	self:addElement( gender )
	self.gender = gender
	
	local month = CoD.MonthList.new( self, controller )
	month:setLeftRight( true, false, 192.94, 1086 )
	month:setTopBottom( true, false, 507.76, 541.76 )
	month.DropdownRoot.Text:setText( Engine.Localize( "ACCOUNT_LINK_MONTH" ) )
	month:subscribeToGlobalModel( controller, "AccountLinkRegister", "month", function ( model )
		local _month = Engine.GetModelValue( model )
		if _month then
			month.SelectedValue:setText( Engine.Localize( _month ) )
		end
	end )
	self:addElement( month )
	self.month = month
	
	local region = CoD.RegionList.new( self, controller )
	region:setLeftRight( true, false, 194, 1086 )
	region:setTopBottom( true, false, 236.5, 270.5 )
	region.DropdownRoot.Text:setText( Engine.Localize( "ACCOUNT_LINK_REGION" ) )
	region:subscribeToGlobalModel( controller, "AccountLinkRegister", "region", function ( model )
		local _region = Engine.GetModelValue( model )
		if _region then
			region.SelectedValue:setText( Engine.Localize( _region ) )
		end
	end )
	self:addElement( region )
	self.region = region
	
	local year = CoD.YearList.new( self, controller )
	year:setLeftRight( true, false, 194, 1086 )
	year:setTopBottom( true, false, 578.5, 612.5 )
	year.DropdownRoot.Text:setText( Engine.Localize( "ACCOUNT_LINK_YEAR" ) )
	year:subscribeToGlobalModel( controller, "AccountLinkRegister", "year", function ( model )
		local _year = Engine.GetModelValue( model )
		if _year then
			year.SelectedValue:setText( Engine.Localize( _year ) )
		end
	end )
	self:addElement( year )
	self.year = year
	
	local day = CoD.DayList.new( self, controller )
	day:setLeftRight( true, false, 194, 1086 )
	day:setTopBottom( true, false, 541.76, 575.76 )
	day.DropdownRoot.Text:setText( Engine.Localize( "ACCOUNT_LINK_DAY" ) )
	day:subscribeToGlobalModel( controller, "AccountLinkRegister", "day", function ( model )
		local _day = Engine.GetModelValue( model )
		if _day then
			day.SelectedValue:setText( Engine.Localize( _day ) )
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
	self.buttonPromptAddFunctions.secondary = function ( f22_arg0, f22_arg1, f22_arg2 )
		f22_arg0:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", f22_arg1 )
		return true
	end
	
	self.buttonPromptAddFunctions.alt2 = function ( f23_arg0, f23_arg1, f23_arg2 )
		f23_arg0:addButtonPrompt( "alt2", Engine.Localize( "skip" ), "", f23_arg1 )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.alt2( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "ui_keyboard_input", function ( self, event )
		local f24_local0 = nil
		AccountLink_HandleRegisterKeyboardComplete( self, self, controller, event )
		if not f24_local0 then
			f24_local0 = self:dispatchEventToChildren( event )
		end
		return f24_local0
	end )
	self:registerEventHandler( "gamepad_button", function ( self, event )
		local f25_local0 = nil
		if not self:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif self:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not self.occludedBy and event.button == "alt2" then
			AccountLink_SetAccountLinkViewed( self, self, controller )
			GoBack( self, controller )
			LobbyBeginPlay( self, event )
			PlaySoundSetSound( self, "action" )
			LoadSaveGameData( self, controller )
		end
		if not f25_local0 then
			f25_local0 = self:dispatchEventToChildren( event )
		end
		return f25_local0
	end )
	self:registerEventHandler( "account_link_success", function ( self, event )
		local f26_local0 = nil
		GoBackAndOpenOverlayOnParent( self, "Success", controller )
		if not f26_local0 then
			f26_local0 = self:dispatchEventToChildren( event )
		end
		return f26_local0
	end )
	self:registerEventHandler( "account_link_failure", function ( self, event )
		local f27_local0 = nil
		GoBackAndOpenOverlayOnParent( self, "Failure", controller )
		if not f27_local0 then
			f27_local0 = self:dispatchEventToChildren( event )
		end
		return f27_local0
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
		menu = self
	} )
	if not self:restoreState() then
		self.firstName:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.bg:close()
		element.confirm:close()
		element.firstName:close()
		element.lastName:close()
		element.zip:close()
		element.confirmPassword:close()
		element.password:close()
		element.email:close()
		element.username:close()
		element.gender:close()
		element.month:close()
		element.region:close()
		element.year:close()
		element.day:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "UmbrellaRegister.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

