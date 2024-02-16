-- 820f0201db4d8383bdc40e1b5ad83519
-- This hash is used for caching, delete to decompile the file again

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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "UmbrellaRegister.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local bg = CoD.DialogBackground.new( f1_local1, controller )
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
	
	local confirm = CoD.button.new( f1_local1, controller )
	confirm:setLeftRight( true, false, 992, 1086 )
	confirm:setTopBottom( true, false, 612.5, 642.5 )
	confirm.buttoninternal0.Text0:setText( Engine.Localize( "MENU_CONFIRM_CAPS" ) )
	confirm:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	confirm:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	f1_local1:AddButtonCallbackFunction( confirm, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		AccountLink_Register( self, f4_arg0, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( confirm )
	self.confirm = confirm
	
	local DOBLabel = LUI.UITightText.new()
	DOBLabel:setLeftRight( true, false, 194, 394 )
	DOBLabel:setTopBottom( true, false, 474.5, 510.5 )
	DOBLabel:setText( Engine.Localize( "ACCOUNT_LINK_DOB" ) )
	DOBLabel:setTTF( "fonts/default.ttf" )
	self:addElement( DOBLabel )
	self.DOBLabel = DOBLabel
	
	local firstName = CoD.RegisterField.new( f1_local1, controller )
	firstName:setLeftRight( true, false, 194, 1086 )
	firstName:setTopBottom( true, false, 168.5, 202.5 )
	firstName.Label:setText( Engine.Localize( "ACCOUNT_LINK_FNAME" ) )
	firstName:subscribeToGlobalModel( controller, "AccountLinkRegister", "firstName", function ( model )
		local _firstName = Engine.GetModelValue( model )
		if _firstName then
			firstName.Value:setText( _firstName )
		end
	end )
	firstName:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	firstName:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	f1_local1:AddButtonCallbackFunction( firstName, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		ShowKeyboard( self, f9_arg0, f9_arg2, "KEYBOARD_TYPE_REGISTER_FIRST_NAME" )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( firstName )
	self.firstName = firstName
	
	local lastName = CoD.RegisterField.new( f1_local1, controller )
	lastName:setLeftRight( true, false, 194, 1086 )
	lastName:setTopBottom( true, false, 202.5, 236.5 )
	lastName.Label:setText( Engine.Localize( "ACCOUNT_LINK_LNAME" ) )
	lastName:subscribeToGlobalModel( controller, "AccountLinkRegister", "lastName", function ( model )
		local _lastName = Engine.GetModelValue( model )
		if _lastName then
			lastName.Value:setText( _lastName )
		end
	end )
	lastName:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f12_local0
	end )
	lastName:registerEventHandler( "lose_focus", function ( element, event )
		local f13_local0 = nil
		if element.loseFocus then
			f13_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f13_local0 = element.super:loseFocus( event )
		end
		return f13_local0
	end )
	f1_local1:AddButtonCallbackFunction( lastName, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		ShowKeyboard( self, f14_arg0, f14_arg2, "KEYBOARD_TYPE_REGISTER_LAST_NAME" )
		return true
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( lastName )
	self.lastName = lastName
	
	local zip = CoD.RegisterField.new( f1_local1, controller )
	zip:setLeftRight( true, false, 194, 1086 )
	zip:setTopBottom( true, false, 270.5, 304.5 )
	zip.Label:setText( Engine.Localize( "ACCOUNT_LINK_ZIPCODE" ) )
	zip:subscribeToGlobalModel( controller, "AccountLinkRegister", "zipCode", function ( model )
		local zipCode = Engine.GetModelValue( model )
		if zipCode then
			zip.Value:setText( zipCode )
		end
	end )
	zip:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f17_local0
	end )
	zip:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	f1_local1:AddButtonCallbackFunction( zip, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		ShowKeyboard( self, f19_arg0, f19_arg2, "KEYBOARD_TYPE_REGISTER_ZIP_CODE" )
		return true
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( zip )
	self.zip = zip
	
	local confirmPassword = CoD.RegisterField.new( f1_local1, controller )
	confirmPassword:setLeftRight( true, false, 194, 1086 )
	confirmPassword:setTopBottom( true, false, 406.5, 440.5 )
	confirmPassword.Label:setText( Engine.Localize( "ACCOUNT_LINK_CONFIRMPASS" ) )
	confirmPassword:subscribeToGlobalModel( controller, "AccountLinkRegister", "confirmStars", function ( model )
		local confirmStars = Engine.GetModelValue( model )
		if confirmStars then
			confirmPassword.Value:setText( confirmStars )
		end
	end )
	confirmPassword:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f22_local0
	end )
	confirmPassword:registerEventHandler( "lose_focus", function ( element, event )
		local f23_local0 = nil
		if element.loseFocus then
			f23_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f23_local0 = element.super:loseFocus( event )
		end
		return f23_local0
	end )
	f1_local1:AddButtonCallbackFunction( confirmPassword, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		ShowKeyboard( self, f24_arg0, f24_arg2, "KEYBOARD_TYPE_CONFIRM_PASSWORD" )
		return true
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( confirmPassword )
	self.confirmPassword = confirmPassword
	
	local password = CoD.RegisterField.new( f1_local1, controller )
	password:setLeftRight( true, false, 194, 1086 )
	password:setTopBottom( true, false, 372.5, 406.5 )
	password.Label:setText( Engine.Localize( "ACCOUNT_LINK_PASSWORD" ) )
	password:subscribeToGlobalModel( controller, "AccountLinkRegister", "stars", function ( model )
		local stars = Engine.GetModelValue( model )
		if stars then
			password.Value:setText( stars )
		end
	end )
	password:registerEventHandler( "gain_focus", function ( element, event )
		local f27_local0 = nil
		if element.gainFocus then
			f27_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f27_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f27_local0
	end )
	password:registerEventHandler( "lose_focus", function ( element, event )
		local f28_local0 = nil
		if element.loseFocus then
			f28_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f28_local0 = element.super:loseFocus( event )
		end
		return f28_local0
	end )
	f1_local1:AddButtonCallbackFunction( password, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
		ShowKeyboard( self, f29_arg0, f29_arg2, "KEYBOARD_TYPE_REGISTER_PASSWORD" )
		return true
	end, function ( f30_arg0, f30_arg1, f30_arg2 )
		CoD.Menu.SetButtonLabel( f30_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( password )
	self.password = password
	
	local email = CoD.RegisterField.new( f1_local1, controller )
	email:setLeftRight( true, false, 194, 1086 )
	email:setTopBottom( true, false, 338.5, 372.5 )
	email.Label:setText( Engine.Localize( "ACCOUNT_LINK_EMAIL" ) )
	email:subscribeToGlobalModel( controller, "AccountLinkRegister", "email", function ( model )
		local _email = Engine.GetModelValue( model )
		if _email then
			email.Value:setText( _email )
		end
	end )
	email:registerEventHandler( "gain_focus", function ( element, event )
		local f32_local0 = nil
		if element.gainFocus then
			f32_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f32_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f32_local0
	end )
	email:registerEventHandler( "lose_focus", function ( element, event )
		local f33_local0 = nil
		if element.loseFocus then
			f33_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f33_local0 = element.super:loseFocus( event )
		end
		return f33_local0
	end )
	f1_local1:AddButtonCallbackFunction( email, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
		ShowKeyboard( self, f34_arg0, f34_arg2, "KEYBOARD_TYPE_REGISTER_EMAIL" )
		return true
	end, function ( f35_arg0, f35_arg1, f35_arg2 )
		CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( email )
	self.email = email
	
	local username = CoD.RegisterField.new( f1_local1, controller )
	username:setLeftRight( true, false, 194, 1086 )
	username:setTopBottom( true, false, 304.5, 338.5 )
	username.Label:setText( Engine.Localize( "ACCOUNT_LINK_USERNAME" ) )
	username:subscribeToGlobalModel( controller, "AccountLinkRegister", "username", function ( model )
		local _username = Engine.GetModelValue( model )
		if _username then
			username.Value:setText( _username )
		end
	end )
	username:registerEventHandler( "gain_focus", function ( element, event )
		local f37_local0 = nil
		if element.gainFocus then
			f37_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f37_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f37_local0
	end )
	username:registerEventHandler( "lose_focus", function ( element, event )
		local f38_local0 = nil
		if element.loseFocus then
			f38_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f38_local0 = element.super:loseFocus( event )
		end
		return f38_local0
	end )
	f1_local1:AddButtonCallbackFunction( username, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
		ShowKeyboard( self, f39_arg0, f39_arg2, "KEYBOARD_TYPE_REGISTER_USERNAME" )
		return true
	end, function ( f40_arg0, f40_arg1, f40_arg2 )
		CoD.Menu.SetButtonLabel( f40_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( username )
	self.username = username
	
	local gender = CoD.GenderList.new( f1_local1, controller )
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
	
	local month = CoD.MonthList.new( f1_local1, controller )
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
	
	local region = CoD.RegionList.new( f1_local1, controller )
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
	
	local year = CoD.YearList.new( f1_local1, controller )
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
	
	local day = CoD.DayList.new( f1_local1, controller )
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
	CoD.Menu.AddNavigationHandler( f1_local1, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f46_local0 = nil
		AccountLink_HandleRegisterKeyboardComplete( self, element, controller, event )
		if not f46_local0 then
			f46_local0 = element:dispatchEventToChildren( event )
		end
		return f46_local0
	end )
	self:registerEventHandler( "account_link_success", function ( element, event )
		local f47_local0 = nil
		GoBackAndOpenOverlayOnParent( self, "Success", controller )
		if not f47_local0 then
			f47_local0 = element:dispatchEventToChildren( event )
		end
		return f47_local0
	end )
	self:registerEventHandler( "account_link_failure", function ( element, event )
		local f48_local0 = nil
		GoBackAndOpenOverlayOnParent( self, "Failure", controller )
		if not f48_local0 then
			f48_local0 = element:dispatchEventToChildren( event )
		end
		return f48_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f49_arg0, f49_arg1, f49_arg2, f49_arg3 )
		GoBack( self, f49_arg2 )
		return true
	end, function ( f50_arg0, f50_arg1, f50_arg2 )
		CoD.Menu.SetButtonLabel( f50_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
		AccountLink_SetAccountLinkViewed( self, f51_arg0, f51_arg2 )
		GoBack( self, f51_arg2 )
		LobbyBeginPlay( self, f51_arg2 )
		PlaySoundSetSound( self, "action" )
		LoadSaveGameData( self, f51_arg2 )
		return true
	end, function ( f52_arg0, f52_arg1, f52_arg2 )
		CoD.Menu.SetButtonLabel( f52_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "skip" )
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
		menu = f1_local1
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

