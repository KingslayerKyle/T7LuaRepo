require( "ui.uieditor.menus.AccountLink.Failure" )
require( "ui.uieditor.menus.AccountLink.Success" )
require( "ui.uieditor.widgets.AccountLink.DayList" )
require( "ui.uieditor.widgets.AccountLink.GenderList" )
require( "ui.uieditor.widgets.AccountLink.MonthList" )
require( "ui.uieditor.widgets.AccountLink.RegionList" )
require( "ui.uieditor.widgets.AccountLink.YearList" )
require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.RegisterField" )

LUI.createMenu.UmbrellaRegister = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "UmbrellaRegister" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "UmbrellaRegister.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local bg = CoD.DialogBackground.new( self, controller )
	bg:setLeftRight( 0, 0, 246, 1674 )
	bg:setTopBottom( 0, 0, 75, 1005 )
	self:addElement( bg )
	self.bg = bg
	
	local CreateAccountLabel = LUI.UITightText.new()
	CreateAccountLabel:setLeftRight( 0, 0, 786, 1134 )
	CreateAccountLabel:setTopBottom( 0, 0, 152, 224 )
	CreateAccountLabel:setText( Engine.Localize( "ACCOUNT_LINK_REGISTER" ) )
	CreateAccountLabel:setTTF( "fonts/default.ttf" )
	self:addElement( CreateAccountLabel )
	self.CreateAccountLabel = CreateAccountLabel
	
	local confirm = CoD.button.new( self, controller )
	confirm:setLeftRight( 0, 0, 1488, 1629 )
	confirm:setTopBottom( 0, 0, 918.5, 963.5 )
	confirm.buttoninternal0.Text0:setText( Engine.Localize( "MENU_CONFIRM_CAPS" ) )
	confirm:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	confirm:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( confirm, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		AccountLink_Register( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( confirm )
	self.confirm = confirm
	
	local DOBLabel = LUI.UITightText.new()
	DOBLabel:setLeftRight( 0, 0, 291, 591 )
	DOBLabel:setTopBottom( 0, 0, 712, 766 )
	DOBLabel:setText( Engine.Localize( "ACCOUNT_LINK_DOB" ) )
	DOBLabel:setTTF( "fonts/default.ttf" )
	self:addElement( DOBLabel )
	self.DOBLabel = DOBLabel
	
	local firstName = CoD.RegisterField.new( self, controller )
	firstName:setLeftRight( 0, 0, 291, 1629 )
	firstName:setTopBottom( 0, 0, 252.5, 303.5 )
	firstName.Label:setText( Engine.Localize( "ACCOUNT_LINK_FNAME" ) )
	firstName:subscribeToGlobalModel( controller, "AccountLinkRegister", "firstName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			firstName.Value:setText( modelValue )
		end
	end )
	firstName:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	firstName:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( firstName, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_FIRST_NAME" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( firstName )
	self.firstName = firstName
	
	local lastName = CoD.RegisterField.new( self, controller )
	lastName:setLeftRight( 0, 0, 291, 1629 )
	lastName:setTopBottom( 0, 0, 303.5, 354.5 )
	lastName.Label:setText( Engine.Localize( "ACCOUNT_LINK_LNAME" ) )
	lastName:subscribeToGlobalModel( controller, "AccountLinkRegister", "lastName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lastName.Value:setText( modelValue )
		end
	end )
	lastName:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	lastName:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( lastName, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_LAST_NAME" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( lastName )
	self.lastName = lastName
	
	local zip = CoD.RegisterField.new( self, controller )
	zip:setLeftRight( 0, 0, 291, 1629 )
	zip:setTopBottom( 0, 0, 405.5, 456.5 )
	zip.Label:setText( Engine.Localize( "ACCOUNT_LINK_ZIPCODE" ) )
	zip:subscribeToGlobalModel( controller, "AccountLinkRegister", "zipCode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			zip.Value:setText( modelValue )
		end
	end )
	zip:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	zip:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( zip, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_ZIP_CODE" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( zip )
	self.zip = zip
	
	local confirmPassword = CoD.RegisterField.new( self, controller )
	confirmPassword:setLeftRight( 0, 0, 291, 1629 )
	confirmPassword:setTopBottom( 0, 0, 609.5, 660.5 )
	confirmPassword.Label:setText( Engine.Localize( "ACCOUNT_LINK_CONFIRMPASS" ) )
	confirmPassword:subscribeToGlobalModel( controller, "AccountLinkRegister", "confirmStars", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			confirmPassword.Value:setText( modelValue )
		end
	end )
	confirmPassword:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	confirmPassword:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( confirmPassword, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_CONFIRM_PASSWORD" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( confirmPassword )
	self.confirmPassword = confirmPassword
	
	local password = CoD.RegisterField.new( self, controller )
	password:setLeftRight( 0, 0, 291, 1629 )
	password:setTopBottom( 0, 0, 558.5, 609.5 )
	password.Label:setText( Engine.Localize( "ACCOUNT_LINK_PASSWORD" ) )
	password:subscribeToGlobalModel( controller, "AccountLinkRegister", "stars", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			password.Value:setText( modelValue )
		end
	end )
	password:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	password:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( password, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_PASSWORD" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( password )
	self.password = password
	
	local email = CoD.RegisterField.new( self, controller )
	email:setLeftRight( 0, 0, 291, 1629 )
	email:setTopBottom( 0, 0, 507.5, 558.5 )
	email.Label:setText( Engine.Localize( "ACCOUNT_LINK_EMAIL" ) )
	email:subscribeToGlobalModel( controller, "AccountLinkRegister", "email", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			email.Value:setText( modelValue )
		end
	end )
	email:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	email:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( email, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_EMAIL" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( email )
	self.email = email
	
	local username = CoD.RegisterField.new( self, controller )
	username:setLeftRight( 0, 0, 291, 1629 )
	username:setTopBottom( 0, 0, 456.5, 507.5 )
	username.Label:setText( Engine.Localize( "ACCOUNT_LINK_USERNAME" ) )
	username:subscribeToGlobalModel( controller, "AccountLinkRegister", "username", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			username.Value:setText( modelValue )
		end
	end )
	username:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	username:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( username, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_REGISTER_USERNAME" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( username )
	self.username = username
	
	local gender = CoD.GenderList.new( self, controller )
	gender:setLeftRight( 0, 0, 289, 1629 )
	gender:setTopBottom( 0, 0, 660.5, 711.5 )
	gender.DropdownRoot.Text:setText( Engine.Localize( "ACCOUNT_LINK_GENDER" ) )
	gender:subscribeToGlobalModel( controller, "AccountLinkRegister", "gender", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gender.SelectedValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( gender )
	self.gender = gender
	
	local month = CoD.MonthList.new( self, controller )
	month:setLeftRight( 0, 0, 289, 1629 )
	month:setTopBottom( 0, 0, 762, 813 )
	month.DropdownRoot.Text:setText( Engine.Localize( "ACCOUNT_LINK_MONTH" ) )
	month:subscribeToGlobalModel( controller, "AccountLinkRegister", "month", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			month.SelectedValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( month )
	self.month = month
	
	local region = CoD.RegionList.new( self, controller )
	region:setLeftRight( 0, 0, 291, 1629 )
	region:setTopBottom( 0, 0, 354.5, 405.5 )
	region.DropdownRoot.Text:setText( Engine.Localize( "ACCOUNT_LINK_REGION" ) )
	region:subscribeToGlobalModel( controller, "AccountLinkRegister", "region", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			region.SelectedValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( region )
	self.region = region
	
	local year = CoD.YearList.new( self, controller )
	year:setLeftRight( 0, 0, 291, 1629 )
	year:setTopBottom( 0, 0, 867.5, 918.5 )
	year.DropdownRoot.Text:setText( Engine.Localize( "ACCOUNT_LINK_YEAR" ) )
	year:subscribeToGlobalModel( controller, "AccountLinkRegister", "year", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			year.SelectedValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( year )
	self.year = year
	
	local day = CoD.DayList.new( self, controller )
	day:setLeftRight( 0, 0, 291, 1629 )
	day:setTopBottom( 0, 0, 812.5, 863.5 )
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
		right = day,
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
		left = month,
		up = month,
		down = year
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		AccountLink_HandleRegisterKeyboardComplete( self, element, controller, event )
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		AccountLink_SetAccountLinkViewed( self, element, controller )
		GoBack( self, controller )
		LobbyBeginPlay( self, controller )
		PlaySoundSetSound( self, "action" )
		LoadSaveGameData( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "skip", nil )
		return true
	end, false )
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

