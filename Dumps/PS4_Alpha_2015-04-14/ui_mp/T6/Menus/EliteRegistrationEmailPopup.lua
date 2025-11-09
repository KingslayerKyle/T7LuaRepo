require( "ui_mp.T6.Menus.EliteRegistrationSuccessPopups" )

CoD.EliteRegistrationEmailPopup = {}
CoD.EliteRegistrationEmailPopup.UCDAccountUpdate = false
CoD.EliteRegistrationEmailPopup.NO_DATA_REF = ""
CoD.EliteRegistrationEmailPopup.processing_type = 0
CoD.EliteRegistrationEmailPopup.CanCheckFields = false
CoD.EliteRegistrationEmailPopup.GlobalButtonWidth = CoD.ButtonList.DefaultWidth - 30
CoD.EliteRegistrationEmailPopup.first_name_text = ""
CoD.EliteRegistrationEmailPopup.last_name_text = ""
CoD.EliteRegistrationEmailPopup.zip_text = ""
CoD.EliteRegistrationEmailPopup.account_name_text = ""
CoD.EliteRegistrationEmailPopup.email_address_text = ""
CoD.EliteRegistrationEmailPopup.password_text = ""
CoD.EliteRegistrationEmailPopup.confirm_password_text = ""
CoD.EliteRegistrationEmailPopup.first_name_button = {}
CoD.EliteRegistrationEmailPopup.last_name_button = {}
CoD.EliteRegistrationEmailPopup.zip_button = nil
CoD.EliteRegistrationEmailPopup.zip_spacer = nil
CoD.EliteRegistrationEmailPopup.account_name_button = {}
CoD.EliteRegistrationEmailPopup.email_address_button = {}
CoD.EliteRegistrationEmailPopup.password_button = {}
CoD.EliteRegistrationEmailPopup.confirm_password_button = {}
CoD.EliteRegistrationEmailPopup.buttonSubmit = {}
CoD.EliteRegistrationEmailPopup.HorizontalGap = 100
CoD.EliteRegistrationEmailPopup.Country = {}
CoD.EliteRegistrationEmailPopup.DOB_MM = {}
CoD.EliteRegistrationEmailPopup.DOB_DD = {}
CoD.EliteRegistrationEmailPopup.DOB_YYYY = {}
CoD.EliteRegistrationEmailPopup.Subscribe = nil
CoD.EliteRegistrationEmailPopup.Subscribe_spacer = nil
CoD.EliteRegistrationEmailPopup.country_val = 0
CoD.EliteRegistrationEmailPopup.dob_mm_val = 0
CoD.EliteRegistrationEmailPopup.dob_dd_val = 0
CoD.EliteRegistrationEmailPopup.dob_yyyy_val = 0
CoD.EliteRegistrationEmailPopup.subscribe_val = 0
CoD.EliteRegistrationEmailPopup.keyboard = "ui_keyboard_new "
CoD.EliteRegistrationEmailPopup.SignedOut = function ( self, event )
	local root = self:getRoot()
	self:goBack( event.controller )
	root:processEvent( {
		name = "open_popup",
		popupName = "signed_out",
		controller = event.controller
	} )
end

CoD.EliteRegistrationEmailPopup.EliteRegistrationEmailPopupRequested = function ( self, event )
	if Engine.UCDSupportsAutoFill( event.controller ) then
		local EmailPopup = self:openPopup( "EliteRegistrationAutoFillPopup", event.controller, {
			hasUCDAccount = true
		} )
	elseif Engine.PlatformSupportsAutoFill( event.controller ) then
		local EmailPopup = self:openPopup( "EliteRegistrationAutoFillPopup", event.controller )
	else
		local EmailPopup = self:openPopup( "EliteRegistrationEmailPopup", event.controller )
	end
end

CoD.EliteRegistrationEmailPopup.AutoFillPopup_Closed = function ( self, event )
	if event.fail ~= nil then
		local finalPopup = self:openPopup( "EliteRegistrationSuccessPopup", event.controller, {
			fail = true
		} )
	elseif event.password ~= nil then
		local EmailPopup = self:openPopup( "EliteRegistrationEmailPopup", event.controller, event.password )
	else
		local EmailPopup = self:openPopup( "EliteRegistrationEmailPopup", event.controller )
	end
end

local CheckPasswordMatchError = function ( self, error )
	if CoD.EliteRegistrationEmailPopup.password_text == "" or CoD.EliteRegistrationEmailPopup.password_text == nil or CoD.EliteRegistrationEmailPopup.password_text ~= CoD.EliteRegistrationEmailPopup.confirm_password_text then
		CoD.EliteRegistrationEmailPopup.confirm_password_button:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.confirm_password_button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_PASS_MATCH_ERROR" )
		if not error then
			CoD.EliteRegistrationEmailPopup.confirm_password_button:processEvent( {
				name = "gain_focus"
			} )
		end
		error = true
	else
		CoD.EliteRegistrationEmailPopup.confirm_password_button:showRestrictedIcon( false )
		CoD.EliteRegistrationEmailPopup.confirm_password_button.hintText = Engine.Localize( "MPUI_HINTTEXT_CONFIRMPASSWORD" )
	end
	return error
end

local CheckButtonValueForError = function ( self, text, button, minStrSize, maxStrSize )
	local error = false
	if CoD.EliteRegistrationEmailPopup.CanCheckFields then
		if text == "" or text == 0 then
			error = true
		end
		if error then
			button:showRestrictedIcon( true )
		else
			button:showRestrictedIcon( false )
		end
	end
	return error
end

local CheckLengthForError = function ( self, text, minStrSize, maxStrSize )
	local error = false
	strLength = string.len( text )
	if minStrSize ~= nil and strLength < minStrSize then
		error = true
	end
	if not error and maxStrSize ~= nil and strLength < maxStrSize then
		error = true
	end
	if error then
		button:showRestrictedIcon( true )
	else
		button:showRestrictedIcon( false )
	end
	return error
end

function GetDisplayedText( inputString )
	local finalString = nil
	if inputString == "" or inputString == nil then
		finalString = Engine.Localize( CoD.EliteRegistrationEmailPopup.NO_DATA_REF )
	else
		finalString = inputString
		local strLen = string.len( finalString )
		if strLen > 15 then
			for i = strLen, 16, -1 do
				local f7_local2 = {}
				local textDim = GetTextDimensions( finalString, CoD.fonts.Default, CoD.textSize.Default )
				if textDim[3] >= CoD.EliteRegistrationEmailPopup.GlobalButtonWidth - CoD.textSize.Default then
					finalString = string.sub( inputString, 0, i - 1 )
				end
			end
		end
	end
	return finalString
end

function GetDisplayedPassword( inputString )
	local finalString = ""
	local length = string.len( inputString )
	if length == 0 then
		finalString = GetDisplayedText( inputString )
	else
		for index = 1, length, 1 do
			local f8_local2 = index
			finalString = "*" .. finalString
		end
		finalString = string.sub( finalString, 0, 29 )
	end
	return finalString
end

local CanWeResetDOBErrors = function ()
	if CoD.EliteRegistrationEmailPopup.dob_mm_val > 0 and CoD.EliteRegistrationEmailPopup.dob_dd_val > 0 and CoD.EliteRegistrationEmailPopup.dob_yyyy_val > 0 then
		CoD.EliteRegistrationEmailPopup.DOB_MM.hintText = Engine.Localize( "MPUI_HINTTEXT_MM" )
		CoD.EliteRegistrationEmailPopup.DOB_DD.hintText = Engine.Localize( "MPUI_HINTTEXT_DD" )
		CoD.EliteRegistrationEmailPopup.DOB_YYYY.hintText = Engine.Localize( "MPUI_HINTTEXT_YYYY" )
		CoD.EliteRegistrationEmailPopup.DOB_DD:showRestrictedIcon( false )
		CoD.EliteRegistrationEmailPopup.DOB_MM:showRestrictedIcon( false )
		CoD.EliteRegistrationEmailPopup.DOB_YYYY:showRestrictedIcon( false )
	end
end

local Subscribe_SelectionChanged = function ( params )
	CoD.EliteRegistrationEmailPopup.subscribe_val = params.value
end

local UpdateEnrollNotification = function ( params )
	if CoD.EliteRegistrationEmailPopup.country_val > 0 and CoD.EliteRegistrationEmailPopup.dob_mm_val > 0 and CoD.EliteRegistrationEmailPopup.dob_dd_val > 0 and CoD.EliteRegistrationEmailPopup.dob_yyyy_val > 0 and Engine.IsPlayerEliteEnrollNotificationAgeOK( CoD.EliteRegistrationEmailPopup.country_val, CoD.EliteRegistrationEmailPopup.dob_mm_val, CoD.EliteRegistrationEmailPopup.dob_dd_val, CoD.EliteRegistrationEmailPopup.dob_yyyy_val ) then
		if CoD.EliteRegistrationEmailPopup.Subscribe == nil then
			CoD.EliteRegistrationEmailPopup.Subscribe = CoD.EliteRegistrationEmailPopup.popup.buttonList:addLeftRightSelector( "", 0, -9, nil, 12, "Default" )
			CoD.EliteRegistrationEmailPopup.Subscribe.hintText = Engine.Localize( "MPUI_HINTTEXT_SUBSCRIBE" )
			CoD.EliteRegistrationEmailPopup.Subscribe:addChoice( Engine.Localize( "MPUI_ELITE_NO" ), Subscribe_SelectionChanged, {
				self = newPopup,
				value = 0,
				parentButton = CoD.EliteRegistrationEmailPopup.Subscribe
			} )
			CoD.EliteRegistrationEmailPopup.Subscribe:addChoice( Engine.Localize( "MPUI_ELITE_YES" ), Subscribe_SelectionChanged, {
				self = newPopup,
				value = 1,
				parentButton = CoD.EliteRegistrationEmailPopup.Subscribe
			} )
			CoD.EliteRegistrationEmailPopup.popup:addElement( CoD.EliteRegistrationEmailPopup.popup.li_subscribe )
		end
		if CoD.EliteRegistrationEmailPopup.Subscribe_spacer then
			CoD.EliteRegistrationEmailPopup.Subscribe_spacer:close()
			CoD.EliteRegistrationEmailPopup.Subscribe_spacer = nil
		end
		CoD.EliteRegistrationEmailPopup.Subscribe:setChoice( 1 )
	else
		if CoD.EliteRegistrationEmailPopup.Subscribe then
			CoD.EliteRegistrationEmailPopup.Subscribe:close()
			CoD.EliteRegistrationEmailPopup.Subscribe = nil
			CoD.EliteRegistrationEmailPopup.popup.li_subscribe:close()
		end
		if CoD.EliteRegistrationEmailPopup.Subscribe_spacer == nil then
			CoD.EliteRegistrationEmailPopup.Subscribe_spacer = CoD.EliteRegistrationEmailPopup.popup.buttonList:addSpacer( CoD.textSize.Default, 12 )
		end
		CoD.EliteRegistrationEmailPopup.subscribe_val = 0
	end
end

local CheckPasswordValidity = function ( error, button, email, password, success_string )
	local result = CheckButtonValueForError( nil, password, button )
	if result then
		button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "Password" )
		if not error then
			button:processEvent( {
				name = "gain_focus"
			} )
		end
		error = true
	else
		CoD.EliteRegistrationEmailPopup.password_button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_PASSWORD" )
	end
	if button.starIcon == nil then
		local errorStatus = Engine.CheckPasswordForEliteAccount( email, password )
		if errorStatus == 0 then
			button.hintText = Engine.Localize( success_string )
			button:showRestrictedIcon( false )
		else
			if errorStatus == 1 then
				button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_PASS_LENGTH_ERROR" )
			elseif errorStatus == 2 then
				button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_PASS_EMAIL_ERROR" )
			elseif errorStatus == 3 then
				button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_PASS_CHAR_ERROR" )
			elseif errorStatus == 4 then
				button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_PASS_LETTERNUMBER_ERROR" )
			elseif errorStatus == 5 then
				button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_PASS_REPEAT_ERROR" )
			elseif errorStatus == 6 then
				button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_PASS_SEQUENTIAL_ERROR" )
			end
			button:showRestrictedIcon( true )
			if not error then
				button:processEvent( {
					name = "gain_focus"
				} )
			end
			error = true
		end
	end
	return error
end

local CheckAccountNameField = function ( error, text, button, failure_hinttext, success_hinttext )
	local result = CheckButtonValueForError( nil, text, button )
	if result then
		button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "AccountName" )
		if not error then
			button:processEvent( {
				name = "gain_focus"
			} )
		end
		error = true
	elseif not Engine.CheckAccountNameForEliteAccount( text ) then
		button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( failure_hinttext )
		button:showRestrictedIcon( true )
		if not error then
			button:processEvent( {
				name = "gain_focus"
			} )
		end
		error = true
	else
		button:showRestrictedIcon( false )
		button.hintText = Engine.Localize( success_hinttext )
	end
	return error
end

local CheckNameField = function ( error, text, button, failure_hinttext, success_hinttext )
	local result = CheckButtonValueForError( nil, text, button )
	if result then
		button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "Name" )
		if not error then
			button:processEvent( {
				name = "gain_focus"
			} )
		end
		error = true
	elseif not Engine.CheckNameForEliteAccount( text ) then
		button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( failure_hinttext )
		button:showRestrictedIcon( true )
		if not error then
			button:processEvent( {
				name = "gain_focus"
			} )
		end
		error = true
	else
		button:showRestrictedIcon( false )
		button.hintText = Engine.Localize( success_hinttext )
	end
	return error
end

CoD.EliteRegistrationEmailPopup.CheckFields = function ( self, event )
	local error = false
	local result = false
	if CoD.EliteRegistrationEmailPopup.CanCheckFields then
		error = CheckNameField( CheckNameField( error, CoD.EliteRegistrationEmailPopup.first_name_text, CoD.EliteRegistrationEmailPopup.first_name_button, "MPUI_HINTTEXT_FIRSTNAME_ERROR", "MPUI_HINTTEXT_FIRSTNAME" ), CoD.EliteRegistrationEmailPopup.last_name_text, CoD.EliteRegistrationEmailPopup.last_name_button, "MPUI_HINTTEXT_LASTNAME_ERROR", "MPUI_HINTTEXT_LASTNAME" )
		if CheckButtonValueForError( self, CoD.EliteRegistrationEmailPopup.country_val, CoD.EliteRegistrationEmailPopup.Country ) then
			CoD.EliteRegistrationEmailPopup.Country.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "Country" )
			if not error then
				CoD.EliteRegistrationEmailPopup.Country:processEvent( {
					name = "gain_focus"
				} )
			end
			error = true
		else
			CoD.EliteRegistrationEmailPopup.Country.hintText = Engine.Localize( "MPUI_HINTTEXT_COUNTRY" )
		end
		if CoD.EliteRegistrationEmailPopup.country_val == 1 then
			if CheckButtonValueForError( self, CoD.EliteRegistrationEmailPopup.zip_text, CoD.EliteRegistrationEmailPopup.zip_button ) then
				CoD.EliteRegistrationEmailPopup.zip_button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "Email" )
				if not error then
					CoD.EliteRegistrationEmailPopup.zip_button:processEvent( {
						name = "gain_focus"
					} )
				end
				error = true
			else
				CoD.EliteRegistrationEmailPopup.zip_button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_ZIP" )
			end
		end
		if CheckButtonValueForError( self, CoD.EliteRegistrationEmailPopup.dob_mm_val, CoD.EliteRegistrationEmailPopup.DOB_MM ) then
			CoD.EliteRegistrationEmailPopup.DOB_MM.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "DOBM" )
			if not error then
				CoD.EliteRegistrationEmailPopup.DOB_MM:processEvent( {
					name = "gain_focus"
				} )
			end
			error = true
		else
			CoD.EliteRegistrationEmailPopup.DOB_MM.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_MM" )
		end
		if CheckButtonValueForError( self, CoD.EliteRegistrationEmailPopup.dob_dd_val, CoD.EliteRegistrationEmailPopup.DOB_DD ) then
			CoD.EliteRegistrationEmailPopup.DOB_DD.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "DOBD" )
			if not error then
				CoD.EliteRegistrationEmailPopup.DOB_DD:processEvent( {
					name = "gain_focus"
				} )
			end
			error = true
		else
			CoD.EliteRegistrationEmailPopup.DOB_DD.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_DD" )
		end
		if CheckButtonValueForError( self, CoD.EliteRegistrationEmailPopup.dob_yyyy_val, CoD.EliteRegistrationEmailPopup.DOB_YYYY ) then
			CoD.EliteRegistrationEmailPopup.DOB_YYYY.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "DOBY" )
			if not error then
				CoD.EliteRegistrationEmailPopup.DOB_YYYY:processEvent( {
					name = "gain_focus"
				} )
			end
			error = true
		else
			CoD.EliteRegistrationEmailPopup.DOB_YYYY.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_YYYY" )
		end
		if CoD.EliteRegistrationEmailPopup.DOB_DD.starIcon == nil and CoD.EliteRegistrationEmailPopup.DOB_MM.starIcon == nil and CoD.EliteRegistrationEmailPopup.DOB_YYYY.starIcon == nil then
			if not Engine.IsPlayerEliteRegistrationAgeOK( CoD.EliteRegistrationEmailPopup.country_val, CoD.EliteRegistrationEmailPopup.dob_mm_val, CoD.EliteRegistrationEmailPopup.dob_dd_val, CoD.EliteRegistrationEmailPopup.dob_yyyy_val ) then
				CoD.EliteRegistrationEmailPopup.DOB_DD:showRestrictedIcon( true )
				CoD.EliteRegistrationEmailPopup.DOB_MM:showRestrictedIcon( true )
				CoD.EliteRegistrationEmailPopup.DOB_YYYY:showRestrictedIcon( true )
				CoD.EliteRegistrationEmailPopup.DOB_DD.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_UNDERAGE_REGISTRATION" )
				CoD.EliteRegistrationEmailPopup.DOB_MM.hintText = Engine.Localize( "MPUI_UNDERAGE_REGISTRATION" )
				CoD.EliteRegistrationEmailPopup.DOB_YYYY.hintText = Engine.Localize( "MPUI_UNDERAGE_REGISTRATION" )
				if not error then
					CoD.EliteRegistrationEmailPopup.DOB_MM:processEvent( {
						name = "gain_focus"
					} )
				end
				error = true
			else
				CoD.EliteRegistrationEmailPopup.DOB_DD:showRestrictedIcon( false )
				CoD.EliteRegistrationEmailPopup.DOB_MM:showRestrictedIcon( false )
				CoD.EliteRegistrationEmailPopup.DOB_YYYY:showRestrictedIcon( false )
				CoD.EliteRegistrationEmailPopup.DOB_DD.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_DD" )
				CoD.EliteRegistrationEmailPopup.DOB_MM.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_MM" )
				CoD.EliteRegistrationEmailPopup.DOB_YYYY.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_YYYY" )
			end
		end
		error = CheckAccountNameField( error, CoD.EliteRegistrationEmailPopup.account_name_text, CoD.EliteRegistrationEmailPopup.account_name_button, "MPUI_HINTTEXT_UCD_ACCOUNT_NAME_ERROR", "MPUI_HINTTEXT_UCD_ACCOUNT_NAME" )
		if CheckButtonValueForError( self, CoD.EliteRegistrationEmailPopup.email_address_text, CoD.EliteRegistrationEmailPopup.email_address_button ) then
			CoD.EliteRegistrationEmailPopup.email_address_button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "Email" )
			if not error then
				CoD.EliteRegistrationEmailPopup.email_address_button:processEvent( {
					name = "gain_focus"
				} )
			end
			error = true
		else
			CoD.EliteRegistrationEmailPopup.email_address_button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_EMAIL" )
		end
		error = CheckPasswordValidity( CheckPasswordValidity( error, CoD.EliteRegistrationEmailPopup.password_button, CoD.EliteRegistrationEmailPopup.email_address_text, CoD.EliteRegistrationEmailPopup.password_text, "MPUI_HINTTEXT_PASSWORD" ), CoD.EliteRegistrationEmailPopup.confirm_password_button, CoD.EliteRegistrationEmailPopup.email_address_text, CoD.EliteRegistrationEmailPopup.confirm_password_text, "MPUI_HINTTEXT_CONFIRMPASSWORD" )
		if CoD.EliteRegistrationEmailPopup.password_button.starIcon == nil and CoD.EliteRegistrationEmailPopup.confirm_password_button.starIcon == nil then
			error = CheckPasswordMatchError( self, error )
		end
	end
	return error
end

local UpdateZipField = function ()
	if CoD.EliteRegistrationEmailPopup.country_val == 1 then
		if CoD.EliteRegistrationEmailPopup.zip_button == nil then
			CoD.EliteRegistrationEmailPopup.zip_button = CoD.EliteRegistrationEmailPopup.AddButton( CoD.EliteRegistrationEmailPopup.popup, GetDisplayedText( CoD.EliteRegistrationEmailPopup.zip_text ), "zip_button_pressed", 4 )
			CoD.EliteRegistrationEmailPopup.zip_button.hintText = Engine.Localize( "MPUI_HINTTEXT_ZIP" )
			CoD.EliteRegistrationEmailPopup.popup:addElement( CoD.EliteRegistrationEmailPopup.popup.pi_zip )
		end
		if CoD.EliteRegistrationEmailPopup.zip_spacer then
			CoD.EliteRegistrationEmailPopup.zip_spacer:close()
			CoD.EliteRegistrationEmailPopup.zip_spacer = nil
		end
		CoD.EliteRegistrationEmailPopup.zip_button:showRestrictedIcon( false )
		CoD.EliteRegistrationEmailPopup.zip_button.hintText = Engine.Localize( "MPUI_HINTTEXT_ZIP" )
		CoD.EliteRegistrationEmailPopup.zip_button:processEvent( {
			name = "enable"
		} )
	else
		CoD.EliteRegistrationEmailPopup.zip_text = ""
		if CoD.EliteRegistrationEmailPopup.zip_button then
			CoD.EliteRegistrationEmailPopup.zip_button:close()
			CoD.EliteRegistrationEmailPopup.zip_button = nil
			CoD.EliteRegistrationEmailPopup.popup.pi_zip:close()
		end
		if CoD.EliteRegistrationEmailPopup.zip_spacer == nil then
			CoD.EliteRegistrationEmailPopup.zip_spacer = CoD.EliteRegistrationEmailPopup.popup.buttonList:addSpacer( CoD.CoD9Button.Height, 4 )
		end
	end
end

local Country_SelectionChanged = function ( params )
	CoD.EliteRegistrationEmailPopup.country_val = params.value
	if CoD.EliteRegistrationEmailPopup.CanCheckFields then
		local result = CheckButtonValueForError( params.self, params.value, CoD.EliteRegistrationEmailPopup.Country )
		if result then
			CoD.EliteRegistrationEmailPopup.Country.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "Country" )
		else
			CoD.EliteRegistrationEmailPopup.Country.hintText = Engine.Localize( "MPUI_HINTTEXT_COUNTRY" )
		end
		CoD.EliteRegistrationEmailPopup.Country:processEvent( {
			name = "gain_focus"
		} )
		UpdateZipField()
		UpdateEnrollNotification( nil )
	end
end

local DOB_MM_SelectionChanged = function ( params )
	CoD.EliteRegistrationEmailPopup.dob_mm_val = params.value
	if CoD.EliteRegistrationEmailPopup.CanCheckFields then
		local result = CheckButtonValueForError( params.self, params.value, CoD.EliteRegistrationEmailPopup.DOB_MM )
		if result then
			CoD.EliteRegistrationEmailPopup.DOB_MM.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "DOBM" )
		else
			CoD.EliteRegistrationEmailPopup.DOB_MM.hintText = Engine.Localize( "MPUI_HINTTEXT_MM" )
			CanWeResetDOBErrors()
		end
		CoD.EliteRegistrationEmailPopup.DOB_MM:processEvent( {
			name = "gain_focus"
		} )
		UpdateEnrollNotification( nil )
	end
end

local DOB_DD_SelectionChanged = function ( params )
	CoD.EliteRegistrationEmailPopup.dob_dd_val = params.value
	if CoD.EliteRegistrationEmailPopup.CanCheckFields then
		local result = CheckButtonValueForError( params.self, params.value, CoD.EliteRegistrationEmailPopup.DOB_DD )
		if result then
			CoD.EliteRegistrationEmailPopup.DOB_DD.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "DOBD" )
		else
			CoD.EliteRegistrationEmailPopup.DOB_DD.hintText = Engine.Localize( "MPUI_HINTTEXT_DD" )
			CanWeResetDOBErrors()
		end
		CoD.EliteRegistrationEmailPopup.DOB_DD:processEvent( {
			name = "gain_focus"
		} )
		UpdateEnrollNotification( nil )
	end
end

local DOB_YYYY_SelectionChanged = function ( params )
	CoD.EliteRegistrationEmailPopup.dob_yyyy_val = params.value
	if CoD.EliteRegistrationEmailPopup.CanCheckFields then
		local result = CheckButtonValueForError( params.self, params.value, CoD.EliteRegistrationEmailPopup.DOB_YYYY )
		if result then
			CoD.EliteRegistrationEmailPopup.DOB_YYYY.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "DOBY" )
		else
			CoD.EliteRegistrationEmailPopup.DOB_YYYY.hintText = Engine.Localize( "MPUI_HINTTEXT_YYYY" )
			CanWeResetDOBErrors()
		end
		CoD.EliteRegistrationEmailPopup.DOB_YYYY:processEvent( {
			name = "gain_focus"
		} )
		UpdateEnrollNotification( nil )
	end
end

function KeyboardExec( controller, title, defaultString, size, keyboardType, isPassword )
	local defaultStringToUse = nil
	if defaultString ~= "" and defaultString ~= nil then
		defaultStringToUse = defaultString
	else
		defaultStringToUse = "n/a"
	end
	Engine.Exec( controller, "ui_keyboard_new " .. keyboardType .. " " .. title .. " " .. defaultStringToUse .. " " .. size .. " " .. isPassword )
end

CoD.EliteRegistrationEmailPopup.AddButton = function ( inputPopup, buttonText, actionEventName, priority )
	local button = inputPopup.buttonList:addButton( buttonText, "", priority )
	button:setActionEventName( actionEventName )
	return button
end

CoD.EliteRegistrationEmailPopup.AddNonRegistrationButton = function ( inputPopup, buttonText, actionEventName, priority )
	local button = CoD.ButtonList.AddButton( inputPopup.buttonList, buttonText, "", priority )
	button:setActionEventName( actionEventName )
	return button
end

CoD.EliteRegistrationEmailPopup.first_name_button_pressed = function ( inputPopup, event )
	CoD.EliteRegistrationEmailPopup.processing_type = 1
	KeyboardExec( event.controller, "MPUI_ENTER_FIRST_NAME", CoD.EliteRegistrationEmailPopup.first_name_text, 21, Enum.KeyboardType.KEYBOARD_TYPE_REGISTRATION_INPUT_ACCENTS, 0 )
end

CoD.EliteRegistrationEmailPopup.last_name_button_pressed = function ( inputPopup, event )
	CoD.EliteRegistrationEmailPopup.processing_type = 2
	KeyboardExec( event.controller, "MPUI_ENTER_LAST_NAME", CoD.EliteRegistrationEmailPopup.last_name_text, 21, Enum.KeyboardType.KEYBOARD_TYPE_REGISTRATION_INPUT_ACCENTS, 0 )
end

CoD.EliteRegistrationEmailPopup.zip_button_pressed = function ( inputPopup, event )
	CoD.EliteRegistrationEmailPopup.processing_type = 3
	KeyboardExec( event.controller, "MPUI_ENTER_ZIP_CODE", CoD.EliteRegistrationEmailPopup.zip_text, 6, Enum.KeyboardType.KEYBOARD_TYPE_REGISTRATION_INPUT_NUMERIC, 0 )
end

CoD.EliteRegistrationEmailPopup.account_name_button_pressed = function ( inputPopup, event )
	CoD.EliteRegistrationEmailPopup.processing_type = 0
	KeyboardExec( event.controller, "MPUI_ENTER_UCD_ACCOUNT_NAME", CoD.EliteRegistrationEmailPopup.account_name_text, 21, Enum.KeyboardType.KEYBOARD_TYPE_REGISTRATION_INPUT_ACCOUNTNAME, 0 )
end

CoD.EliteRegistrationEmailPopup.email_address_button_pressed = function ( inputPopup, event )
	CoD.EliteRegistrationEmailPopup.processing_type = 4
end

CoD.EliteRegistrationEmailPopup.password_button_pressed = function ( inputPopup, event )
	CoD.EliteRegistrationEmailPopup.processing_type = 5
	KeyboardExec( event.controller, "MPUI_ENTER_PASSWORD", CoD.EliteRegistrationEmailPopup.password_text, 21, Enum.KeyboardType.KEYBOARD_TYPE_REGISTRATION_INPUT_PASSWORD, 1 )
end

CoD.EliteRegistrationEmailPopup.confirm_password_button_pressed = function ( inputPopup, event )
	CoD.EliteRegistrationEmailPopup.processing_type = 6
	KeyboardExec( event.controller, "MPUI_CONFIRM_PASSWORD", CoD.EliteRegistrationEmailPopup.confirm_password_text, 21, Enum.KeyboardType.KEYBOARD_TYPE_REGISTRATION_INPUT_PASSWORD, 1 )
end

CoD.EliteRegistrationEmailPopup.ObtainedKeyboardInput = function ( self, event )
	local validController = self.m_ownerController
	local displayedText = ""
	if event.input ~= nil then
		if CoD.EliteRegistrationEmailPopup.processing_type == 0 then
			CoD.EliteRegistrationEmailPopup.account_name_text = event.input
			CoD.EliteRegistrationEmailPopup.account_name_button:setLabel( GetDisplayedText( event.input ) )
			local result = CheckButtonValueForError( self, event.input, CoD.EliteRegistrationEmailPopup.account_name_button )
			if result then
				CoD.EliteRegistrationEmailPopup.account_name_button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "AccountName" )
			else
				CoD.EliteRegistrationEmailPopup.account_name_button.hintText = Engine.Localize( "MPUI_HINTTEXT_UCD_ACCOUNT_NAME" )
			end
			CoD.EliteRegistrationEmailPopup.account_name_button:processEvent( {
				name = "gain_focus"
			} )
		elseif CoD.EliteRegistrationEmailPopup.processing_type == 1 then
			CoD.EliteRegistrationEmailPopup.first_name_text = event.input
			CoD.EliteRegistrationEmailPopup.first_name_button:setLabel( GetDisplayedText( event.input ) )
			local result = CheckButtonValueForError( self, event.input, CoD.EliteRegistrationEmailPopup.first_name_button )
			if result then
				CoD.EliteRegistrationEmailPopup.first_name_button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "FirstName" )
			else
				CoD.EliteRegistrationEmailPopup.first_name_button.hintText = Engine.Localize( "MPUI_HINTTEXT_FIRSTNAME" )
			end
			CoD.EliteRegistrationEmailPopup.first_name_button:processEvent( {
				name = "gain_focus"
			} )
		elseif CoD.EliteRegistrationEmailPopup.processing_type == 2 then
			CoD.EliteRegistrationEmailPopup.last_name_text = event.input
			CoD.EliteRegistrationEmailPopup.last_name_button:setLabel( GetDisplayedText( event.input ) )
			local result = CheckButtonValueForError( self, event.input, CoD.EliteRegistrationEmailPopup.last_name_button )
			if result then
				CoD.EliteRegistrationEmailPopup.last_name_button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "LastName" )
			else
				CoD.EliteRegistrationEmailPopup.last_name_button.hintText = Engine.Localize( "MPUI_HINTTEXT_LASTNAME" )
			end
			CoD.EliteRegistrationEmailPopup.last_name_button:processEvent( {
				name = "gain_focus"
			} )
		elseif CoD.EliteRegistrationEmailPopup.processing_type == 3 then
			CoD.EliteRegistrationEmailPopup.zip_text = event.input
			CoD.EliteRegistrationEmailPopup.zip_button:setLabel( GetDisplayedText( event.input ) )
			local result = CheckButtonValueForError( self, event.input, CoD.EliteRegistrationEmailPopup.zip_button )
			if result then
				CoD.EliteRegistrationEmailPopup.zip_button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "ZIP" )
			else
				CoD.EliteRegistrationEmailPopup.zip_button.hintText = Engine.Localize( "MPUI_HINTTEXT_ZIP" )
			end
			CoD.EliteRegistrationEmailPopup.zip_button:processEvent( {
				name = "gain_focus"
			} )
		elseif CoD.EliteRegistrationEmailPopup.processing_type == 4 then
			CoD.EliteRegistrationEmailPopup.email_address_text = event.input
			CoD.EliteRegistrationEmailPopup.email_address_button:setLabel( GetDisplayedText( event.input ) )
			local result = CheckButtonValueForError( self, event.input, CoD.EliteRegistrationEmailPopup.email_address_button )
			if result then
				CoD.EliteRegistrationEmailPopup.email_address_button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "Email" )
			else
				CoD.EliteRegistrationEmailPopup.email_address_button.hintText = Engine.Localize( "MPUI_HINTTEXT_EMAIL" )
			end
			CoD.EliteRegistrationEmailPopup.email_address_button:processEvent( {
				name = "gain_focus"
			} )
		elseif CoD.EliteRegistrationEmailPopup.processing_type == 5 then
			CoD.EliteRegistrationEmailPopup.password_text = event.input
			CoD.EliteRegistrationEmailPopup.password_button:setLabel( GetDisplayedPassword( CoD.EliteRegistrationEmailPopup.password_text ) )
			local result = CheckButtonValueForError( self, event.input, CoD.EliteRegistrationEmailPopup.password_button )
			if result then
				CoD.EliteRegistrationEmailPopup.password_button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "Password" )
			else
				CoD.EliteRegistrationEmailPopup.password_button.hintText = Engine.Localize( "MPUI_HINTTEXT_PASSWORD" )
			end
			CoD.EliteRegistrationEmailPopup.password_button:processEvent( {
				name = "gain_focus"
			} )
		elseif CoD.EliteRegistrationEmailPopup.processing_type == 6 then
			CoD.EliteRegistrationEmailPopup.confirm_password_text = event.input
			CoD.EliteRegistrationEmailPopup.confirm_password_button:setLabel( GetDisplayedPassword( CoD.EliteRegistrationEmailPopup.confirm_password_text ) )
			local result = CheckButtonValueForError( self, event.input, CoD.EliteRegistrationEmailPopup.confirm_password_button )
			if result then
				CoD.EliteRegistrationEmailPopup.confirm_password_button.hintText = CoD.EliteRegistrationEmailPopup.SetErrorMessage( "MPUI_HINTTEXT_NODATA_ERROR", "ConfirmPassword" )
			else
				CoD.EliteRegistrationEmailPopup.confirm_password_button.hintText = Engine.Localize( "MPUI_HINTTEXT_CONFIRMPASSWORD" )
			end
			CoD.EliteRegistrationEmailPopup.confirm_password_button:processEvent( {
				name = "gain_focus"
			} )
		end
	end
end

CoD.EliteRegistrationEmailPopup.OpenPopup_Error = function ( self, event )
	local EmailPopup = self:openPopup( "EliteRegistrationEmailErrorPopup", event.controller, {
		ageError = event.ageError
	} )
end

CoD.EliteRegistrationEmailPopup.submit_pressed = function ( self, event )
	local error = nil
	if not CoD.EliteRegistrationEmailPopup.CheckFields( self, event ) then
		playerData = {
			firstName = CoD.EliteRegistrationEmailPopup.first_name_text,
			lastName = CoD.EliteRegistrationEmailPopup.last_name_text,
			country = CoD.EliteRegistrationEmailPopup.country_val,
			zip = CoD.EliteRegistrationEmailPopup.zip_text,
			dob_mm = CoD.EliteRegistrationEmailPopup.dob_mm_val,
			dob_dd = CoD.EliteRegistrationEmailPopup.dob_dd_val,
			dob_yyyy = CoD.EliteRegistrationEmailPopup.dob_yyyy_val,
			accountName = CoD.EliteRegistrationEmailPopup.account_name_text,
			email = CoD.EliteRegistrationEmailPopup.email_address_text,
			password = CoD.EliteRegistrationEmailPopup.password_text,
			marketingOptIn = CoD.EliteRegistrationEmailPopup.subscribe_val
		}
		local confirmEmailPopup = self:openPopup( "EliteRegistrationSuccessEmailConfirmationPopup", event.controller, {
			playerData = playerData,
			UCDAccountUpdate = CoD.EliteRegistrationEmailPopup.UCDAccountUpdate,
			buttonSubmit = CoD.EliteRegistrationEmailPopup.buttonSubmit
		} )
	else
		CoD.EliteRegistrationEmailPopup.buttonSubmit:processEvent( {
			name = "lose_focus"
		} )
	end
end

CoD.EliteRegistrationEmailPopup.check_email_address_popup_closed = function ( self, event )
	local tosPopup = self:openPopup( "EliteRegistrationScrollingTOS", event.controller )
end

CoD.EliteRegistrationEmailPopup.obtained_UCD_create_or_update_account_results = function ( self, event )
	if event.success ~= nil then
		local successPopup = self:openPopup( "EliteRegistrationSuccessPopup", event.controller, {
			success = true
		} )
		return 
	elseif event.alreadyRegistered ~= nil then
		CoD.EliteRegistrationEmailPopup.account_name_button.hintText = Engine.Localize( "MPUI_UCD_ERROR_ALREADYREGISTERED" )
		CoD.EliteRegistrationEmailPopup.account_name_button:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.email_address_button.hintText = Engine.Localize( "MPUI_UCD_ERROR_ALREADYREGISTERED" )
		CoD.EliteRegistrationEmailPopup.email_address_button:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.account_name_button:processEvent( {
			name = "gain_focus"
		} )
		CoD.EliteRegistrationEmailPopup.buttonSubmit:processEvent( {
			name = "lose_focus"
		} )
	elseif event.invalid ~= nil then
		CoD.EliteRegistrationEmailPopup.first_name_button.hintText = Engine.Localize( "MPUI_UCD_ERROR_INVALID" )
		CoD.EliteRegistrationEmailPopup.first_name_button:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.last_name_button.hintText = Engine.Localize( "MPUI_UCD_ERROR_INVALID" )
		CoD.EliteRegistrationEmailPopup.last_name_button:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.Country.hintText = Engine.Localize( "MPUI_UCD_ERROR_INVALID" )
		CoD.EliteRegistrationEmailPopup.Country:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.zip_button.hintText = Engine.Localize( "MPUI_UCD_ERROR_INVALID" )
		CoD.EliteRegistrationEmailPopup.zip_button:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.DOB_MM.hintText = Engine.Localize( "MPUI_UCD_ERROR_INVALID" )
		CoD.EliteRegistrationEmailPopup.DOB_MM:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.DOB_DD.hintText = Engine.Localize( "MPUI_UCD_ERROR_INVALID" )
		CoD.EliteRegistrationEmailPopup.DOB_DD:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.DOB_YYYY.hintText = Engine.Localize( "MPUI_UCD_ERROR_INVALID" )
		CoD.EliteRegistrationEmailPopup.DOB_YYYY:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.account_name_button.hintText = Engine.Localize( "MPUI_UCD_ERROR_INVALID" )
		CoD.EliteRegistrationEmailPopup.account_name_button:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.email_address_button.hintText = Engine.Localize( "MPUI_UCD_ERROR_INVALID" )
		CoD.EliteRegistrationEmailPopup.email_address_button:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.password_button.hintText = Engine.Localize( "MPUI_UCD_ERROR_INVALID" )
		CoD.EliteRegistrationEmailPopup.password_button:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.confirm_password_button.hintText = Engine.Localize( "MPUI_UCD_ERROR_INVALID" )
		CoD.EliteRegistrationEmailPopup.confirm_password_button:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.first_name_button:processEvent( {
			name = "gain_focus"
		} )
		CoD.EliteRegistrationEmailPopup.buttonSubmit:processEvent( {
			name = "lose_focus"
		} )
	elseif event.firstName ~= nil then
		CoD.EliteRegistrationEmailPopup.first_name_button.hintText = Engine.Localize( "MPUI_UCD_ERROR_FIRSTNAME" )
		CoD.EliteRegistrationEmailPopup.first_name_button:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.first_name_button:processEvent( {
			name = "gain_focus"
		} )
		CoD.EliteRegistrationEmailPopup.buttonSubmit:processEvent( {
			name = "lose_focus"
		} )
	elseif event.lastName ~= nil then
		CoD.EliteRegistrationEmailPopup.last_name_button.hintText = Engine.Localize( "MPUI_UCD_ERROR_LASTNAME" )
		CoD.EliteRegistrationEmailPopup.last_name_button:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.last_name_button:processEvent( {
			name = "gain_focus"
		} )
		CoD.EliteRegistrationEmailPopup.buttonSubmit:processEvent( {
			name = "lose_focus"
		} )
	elseif event.dob ~= nil then
		CoD.EliteRegistrationEmailPopup.DOB_MM.hintText = Engine.Localize( "MPUI_UCD_ERROR_DOB" )
		CoD.EliteRegistrationEmailPopup.DOB_MM:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.DOB_DD.hintText = Engine.Localize( "MPUI_UCD_ERROR_DOB" )
		CoD.EliteRegistrationEmailPopup.DOB_DD:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.DOB_YYYY.hintText = Engine.Localize( "MPUI_UCD_ERROR_DOB" )
		CoD.EliteRegistrationEmailPopup.DOB_YYYY:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.DOB_MM:processEvent( {
			name = "gain_focus"
		} )
		CoD.EliteRegistrationEmailPopup.buttonSubmit:processEvent( {
			name = "lose_focus"
		} )
	elseif event.email ~= nil then
		CoD.EliteRegistrationEmailPopup.email_address_button.hintText = Engine.Localize( "MPUI_UCD_ERROR_EMAIL" )
		CoD.EliteRegistrationEmailPopup.email_address_button:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.email_address_button:processEvent( {
			name = "gain_focus"
		} )
		CoD.EliteRegistrationEmailPopup.buttonSubmit:processEvent( {
			name = "lose_focus"
		} )
	elseif event.country ~= nil then
		CoD.EliteRegistrationEmailPopup.Country.hintText = Engine.Localize( "MPUI_UCD_ERROR_COUNTRY" )
		CoD.EliteRegistrationEmailPopup.Country:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.Country:processEvent( {
			name = "gain_focus"
		} )
		CoD.EliteRegistrationEmailPopup.buttonSubmit:processEvent( {
			name = "lose_focus"
		} )
	elseif event.zip ~= nil then
		CoD.EliteRegistrationEmailPopup.zip_button.hintText = Engine.Localize( "MPUI_UCD_ERROR_ZIP" )
		CoD.EliteRegistrationEmailPopup.zip_button:showRestrictedIcon( true )
		CoD.EliteRegistrationEmailPopup.zip_button:processEvent( {
			name = "gain_focus"
		} )
		CoD.EliteRegistrationEmailPopup.buttonSubmit:processEvent( {
			name = "lose_focus"
		} )
	else
		local successPopup = self:openPopup( "EliteRegistrationSuccessPopup", event.controller, {
			fail = true
		} )
	end
end

CoD.EliteRegistrationEmailPopup.SetErrorMessage = function ( message, suffix )
	local locString = Engine.Localize( message )
	if suffix then
		message = message .. suffix
	end
	Engine.AddToErrorString( message .. "," )
	return locString
end

CoD.EliteRegistrationEmailPopup.SendRecordEvent = function ( self, event )
	local errorString = Engine.GetErrorString()
	if errorString and event.controller and Engine.DvarBool( nil, "enableERegErrorRecording" ) then
		Engine.SendRecordEvent( event.controller, CoD.RECORD_EVENT_DW_EREG_ENTRY_ERROR, errorString )
	end
	Engine.ClearErrorString()
end

CoD.EliteRegistrationEmailPopup.Back = function ( self, event )
	Engine.AddToErrorString( "Back," )
	CoD.EliteRegistrationEmailPopup.SendRecordEvent( self, event )
	self:goBack()
end

CoD.EliteRegistrationEmailPopup.registration_success_popup_closed = function ( self, event )
	Engine.AddToErrorString( "Success," )
	CoD.EliteRegistrationEmailPopup.Back( self, event )
	self.occludedMenu:processEvent( {
		name = "elite_registration_ended",
		controller = event.controller
	} )
end

LUI.createMenu.EliteRegistrationEmailPopup = function ( controller, UCDUpdateAccountPassword )
	CoD.EliteRegistrationEmailPopup.CanCheckFields = false
	Engine.ClearErrorString()
	local gamerProfile = Engine.GetPlayerCommonGamerProfile( controller )
	Engine.AddToErrorString( gamerProfile.eliteRegistrationPopupTimesShown:get() .. "," )
	local leftMargin = 0
	local topMargin = 20
	local personalInformation_PosX = -650
	local personalInformation_PosY = 10
	local personalInformation_Step = CoD.CoD9Button.Height + 10
	local newPopup = CoD.Menu.New( "EliteRegistrationEmailPopup" )
	newPopup:setOwner( controller )
	newPopup:addTitle( Engine.Localize( "MPUI_EMAIL_REGISTRATION_POPUP_TITLE" ) )
	CoD.EliteRegistrationEmailPopup.popup = newPopup
	newPopup:addLargePopupBackground()
	newPopup:addSelectButton()
	newPopup:addBackButton()
	CoD.EliteRegistrationEmailPopup.account_name_text = ""
	CoD.EliteRegistrationEmailPopup.first_name_text = ""
	CoD.EliteRegistrationEmailPopup.last_name_text = ""
	CoD.EliteRegistrationEmailPopup.zip_text = ""
	CoD.EliteRegistrationEmailPopup.email_address_text = ""
	CoD.EliteRegistrationEmailPopup.password_text = ""
	CoD.EliteRegistrationEmailPopup.confirm_password_text = ""
	CoD.EliteRegistrationEmailPopup.country_val = 0
	CoD.EliteRegistrationEmailPopup.dob_mm_val = 0
	CoD.EliteRegistrationEmailPopup.dob_dd_val = 0
	CoD.EliteRegistrationEmailPopup.dob_yyyy_val = 0
	CoD.EliteRegistrationEmailPopup.subscribe_val = 0
	if CoD.EliteRegistrationEmailPopup.zip_button then
		CoD.EliteRegistrationEmailPopup.zip_button:close()
		CoD.EliteRegistrationEmailPopup.zip_button = nil
	end
	if CoD.EliteRegistrationEmailPopup.zip_spacer then
		CoD.EliteRegistrationEmailPopup.zip_spacer:close()
		CoD.EliteRegistrationEmailPopup.zip_spacer = nil
	end
	if CoD.EliteRegistrationEmailPopup.Subscribe then
		CoD.EliteRegistrationEmailPopup.Subscribe:close()
		CoD.EliteRegistrationEmailPopup.Subscribe = nil
	end
	if CoD.EliteRegistrationEmailPopup.Subscribe_spacer then
		CoD.EliteRegistrationEmailPopup.Subscribe_spacer:close()
		CoD.EliteRegistrationEmailPopup.Subscribe_spacer = nil
	end
	local AutoFillResults = Engine.ProcessingAutoFill( controller )
	if AutoFillResults ~= nil then
		for i, v in pairs( AutoFillResults ) do
			if v.firstName ~= nil then
				CoD.EliteRegistrationEmailPopup.first_name_text = v.firstName
				CoD.EliteRegistrationEmailPopup.first_name_text = string.gsub( CoD.EliteRegistrationEmailPopup.first_name_text, " ", "_" )
			end
			if v.lastName ~= nil then
				CoD.EliteRegistrationEmailPopup.last_name_text = v.lastName
				CoD.EliteRegistrationEmailPopup.last_name_text = string.gsub( CoD.EliteRegistrationEmailPopup.last_name_text, " ", "_" )
			end
			if v.postalCode ~= nil then
				CoD.EliteRegistrationEmailPopup.zip_text = v.postalCode
			end
			if v.month ~= nil then
				CoD.EliteRegistrationEmailPopup.dob_mm_val = v.month
			end
			if v.day ~= nil then
				CoD.EliteRegistrationEmailPopup.dob_dd_val = v.day
			end
			if v.year ~= nil then
				CoD.EliteRegistrationEmailPopup.dob_yyyy_val = v.year
			end
			if v.emailAddress ~= nil then
				CoD.EliteRegistrationEmailPopup.email_address_text = v.emailAddress
			end
			if v.countryID ~= nil then
				CoD.EliteRegistrationEmailPopup.country_val = v.countryID
			end
			if v.accountName ~= nil then
				CoD.EliteRegistrationEmailPopup.account_name_text = v.accountName
			end
		end
	end
	CoD.EliteRegistrationEmailPopup.UCDAccountUpdate = false
	if UCDUpdateAccountPassword ~= nil then
		CoD.EliteRegistrationEmailPopup.password_text = UCDUpdateAccountPassword
		CoD.EliteRegistrationEmailPopup.confirm_password_text = UCDUpdateAccountPassword
		CoD.EliteRegistrationEmailPopup.UCDAccountUpdate = true
	end
	newPopup:registerEventHandler( "ui_keyboard_input", CoD.EliteRegistrationEmailPopup.ObtainedKeyboardInput )
	newPopup:registerEventHandler( "account_name_button_pressed", CoD.EliteRegistrationEmailPopup.account_name_button_pressed )
	newPopup:registerEventHandler( "first_name_button_pressed", CoD.EliteRegistrationEmailPopup.first_name_button_pressed )
	newPopup:registerEventHandler( "last_name_button_pressed", CoD.EliteRegistrationEmailPopup.last_name_button_pressed )
	newPopup:registerEventHandler( "zip_button_pressed", CoD.EliteRegistrationEmailPopup.zip_button_pressed )
	newPopup:registerEventHandler( "email_address_button_pressed", CoD.EliteRegistrationEmailPopup.email_address_button_pressed )
	newPopup:registerEventHandler( "password_button_pressed", CoD.EliteRegistrationEmailPopup.password_button_pressed )
	newPopup:registerEventHandler( "confirm_password_button_pressed", CoD.EliteRegistrationEmailPopup.confirm_password_button_pressed )
	newPopup:registerEventHandler( "submit_pressed", CoD.EliteRegistrationEmailPopup.submit_pressed )
	newPopup:registerEventHandler( "check_email_address_popup_closed", CoD.EliteRegistrationEmailPopup.check_email_address_popup_closed )
	newPopup:registerEventHandler( "obtained_UCD_create_or_update_account_results", CoD.EliteRegistrationEmailPopup.obtained_UCD_create_or_update_account_results )
	newPopup:registerEventHandler( "registration_success_popup_closed", CoD.EliteRegistrationEmailPopup.registration_success_popup_closed )
	newPopup:registerEventHandler( "button_prompt_back", CoD.EliteRegistrationEmailPopup.Back )
	newPopup:registerEventHandler( "signed_out", CoD.EliteRegistrationEmailPopup.SignedOut )
	local hintTextDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 530,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 73,
		bottom = CoD.HintText.Height
	}
	newPopup.hintText = CoD.HintText.new( hintTextDefaultAnimState )
	newPopup.hintText.hintArrow:setTopBottom( true, false, 0, CoD.HintText.Height )
	local left = CoD.HintText.Height - 13
	newPopup.hintText.hint:setLeftRight( true, true, left, 0 )
	newPopup:addElement( newPopup.hintText )
	local buttonListLeft = 200
	newPopup.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = buttonListLeft,
		right = buttonListLeft + CoD.EliteRegistrationEmailPopup.GlobalButtonWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = topMargin + personalInformation_PosY + personalInformation_Step,
		bottom = 0
	}, 10, nil, newPopup.hintText )
	newPopup.buttonList.addButton = CoD.ButtonList.AddRegistrationButton
	newPopup:addElement( newPopup.buttonList )
	CoD.EliteRegistrationEmailPopup.first_name_button = CoD.EliteRegistrationEmailPopup.AddButton( newPopup, GetDisplayedText( CoD.EliteRegistrationEmailPopup.first_name_text ), "first_name_button_pressed", 1 )
	CoD.EliteRegistrationEmailPopup.first_name_button.hintText = Engine.Localize( "MPUI_HINTTEXT_FIRSTNAME" )
	if CoD.EliteRegistrationEmailPopup.UCDAccountUpdate then
		CoD.EliteRegistrationEmailPopup.first_name_button:processEvent( {
			name = "disable"
		} )
	end
	CoD.EliteRegistrationEmailPopup.last_name_button = CoD.EliteRegistrationEmailPopup.AddButton( newPopup, GetDisplayedText( CoD.EliteRegistrationEmailPopup.last_name_text ), "last_name_button_pressed", 2 )
	CoD.EliteRegistrationEmailPopup.last_name_button.hintText = Engine.Localize( "MPUI_HINTTEXT_LASTNAME" )
	if CoD.EliteRegistrationEmailPopup.UCDAccountUpdate then
		CoD.EliteRegistrationEmailPopup.last_name_button:processEvent( {
			name = "disable"
		} )
	end
	CoD.EliteRegistrationEmailPopup.Country = newPopup.buttonList:addLeftRightSelector( "", CoD.EliteRegistrationEmailPopup.country_val, -9, nil, 3, "Default" )
	CoD.EliteRegistrationEmailPopup.Country.hintText = Engine.Localize( "MPUI_HINTTEXT_COUNTRY" )
	CoD.EliteRegistrationEmailPopup.Country.nameTable = Engine.GetCountryNames()
	CoD.EliteRegistrationEmailPopup.Country:addChoice( "---", Country_SelectionChanged, {
		self = newPopup,
		value = 0,
		controller = controller,
		parentButton = CoD.EliteRegistrationEmailPopup.Country
	} )
	for i, v in pairs( CoD.EliteRegistrationEmailPopup.Country.nameTable ) do
		if v.name ~= nil then
			CoD.EliteRegistrationEmailPopup.Country:addChoice( Engine.Localize( v.name ), Country_SelectionChanged, {
				self = newPopup,
				value = i,
				controller = controller,
				parentButton = CoD.EliteRegistrationEmailPopup.Country
			} )
		end
	end
	CoD.EliteRegistrationEmailPopup.zip_spacer = CoD.EliteRegistrationEmailPopup.popup.buttonList:addSpacer( CoD.CoD9Button.Height, 4 )
	CoD.EliteRegistrationEmailPopup.DOB_MM = newPopup.buttonList:addLeftRightSelector( "", CoD.EliteRegistrationEmailPopup.dob_mm_val, -9, nil, 5, "Default" )
	CoD.EliteRegistrationEmailPopup.DOB_MM.hintText = Engine.Localize( "MPUI_HINTTEXT_MM" )
	CoD.EliteRegistrationEmailPopup.DOB_MM:addChoice( Engine.Localize( "MPUI_ELITE_MONTH" ), DOB_MM_SelectionChanged, {
		self = newPopup,
		value = 0,
		controller = controller,
		parentButton = CoD.EliteRegistrationEmailPopup.DOB_MM
	} )
	for index = 1, 12, 1 do
		CoD.EliteRegistrationEmailPopup.DOB_MM:addChoice( index, DOB_MM_SelectionChanged, {
			self = newPopup,
			value = index,
			controller = controller,
			parentButton = CoD.EliteRegistrationEmailPopup.DOB_MM
		} )
	end
	CoD.EliteRegistrationEmailPopup.DOB_DD = newPopup.buttonList:addLeftRightSelector( "", CoD.EliteRegistrationEmailPopup.dob_dd_val, -9, nil, 6, "Default" )
	CoD.EliteRegistrationEmailPopup.DOB_DD.hintText = Engine.Localize( "MPUI_HINTTEXT_DD" )
	CoD.EliteRegistrationEmailPopup.DOB_DD:addChoice( Engine.Localize( "MPUI_ELITE_DAY" ), DOB_DD_SelectionChanged, {
		self = newPopup,
		value = 0,
		controller = controller,
		parentButton = CoD.EliteRegistrationEmailPopup.DOB_DD
	} )
	for index = 1, 31, 1 do
		CoD.EliteRegistrationEmailPopup.DOB_DD:addChoice( index, DOB_DD_SelectionChanged, {
			self = newPopup,
			value = index,
			controller = controller,
			parentButton = CoD.EliteRegistrationEmailPopup.DOB_DD
		} )
	end
	CoD.EliteRegistrationEmailPopup.DOB_YYYY = newPopup.buttonList:addLeftRightSelector( "", CoD.EliteRegistrationEmailPopup.dob_yyyy_val, -9, nil, 7, "Default" )
	CoD.EliteRegistrationEmailPopup.DOB_YYYY.hintText = Engine.Localize( "MPUI_HINTTEXT_YYYY" )
	CoD.EliteRegistrationEmailPopup.DOB_YYYY:addChoice( Engine.Localize( "MPUI_ELITE_YEAR" ), DOB_YYYY_SelectionChanged, {
		self = newPopup,
		value = 0,
		controller = controller,
		parentButton = CoD.EliteRegistrationEmailPopup.DOB_YYYY
	} )
	for index = 1900, Engine.GetCurrentYearForElite(), 1 do
		CoD.EliteRegistrationEmailPopup.DOB_YYYY:addChoice( index, DOB_YYYY_SelectionChanged, {
			self = newPopup,
			value = index,
			controller = controller,
			parentButton = CoD.EliteRegistrationEmailPopup.DOB_YYYY
		} )
	end
	CoD.EliteRegistrationEmailPopup.account_name_button = CoD.EliteRegistrationEmailPopup.AddButton( newPopup, GetDisplayedText( CoD.EliteRegistrationEmailPopup.account_name_text ), "account_name_button_pressed", 8 )
	CoD.EliteRegistrationEmailPopup.account_name_button.hintText = Engine.Localize( "MPUI_HINTTEXT_UCD_ACCOUNT_NAME" )
	if CoD.EliteRegistrationEmailPopup.UCDAccountUpdate then
		CoD.EliteRegistrationEmailPopup.account_name_button:processEvent( {
			name = "disable"
		} )
	end
	CoD.EliteRegistrationEmailPopup.email_address_button = CoD.EliteRegistrationEmailPopup.AddButton( newPopup, GetDisplayedText( CoD.EliteRegistrationEmailPopup.email_address_text ), "email_address_button_pressed", 9 )
	CoD.EliteRegistrationEmailPopup.email_address_button.hintText = Engine.Localize( "MPUI_HINTTEXT_EMAIL" )
	if CoD.EliteRegistrationEmailPopup.UCDAccountUpdate then
		CoD.EliteRegistrationEmailPopup.email_address_button:processEvent( {
			name = "disable"
		} )
	end
	CoD.EliteRegistrationEmailPopup.password_button = CoD.EliteRegistrationEmailPopup.AddButton( newPopup, GetDisplayedPassword( CoD.EliteRegistrationEmailPopup.password_text ), "password_button_pressed", 10 )
	CoD.EliteRegistrationEmailPopup.password_button.hintText = Engine.Localize( "MPUI_HINTTEXT_PASSWORD" )
	if CoD.EliteRegistrationEmailPopup.UCDAccountUpdate then
		CoD.EliteRegistrationEmailPopup.password_button:processEvent( {
			name = "disable"
		} )
	end
	CoD.EliteRegistrationEmailPopup.confirm_password_button = CoD.EliteRegistrationEmailPopup.AddButton( newPopup, GetDisplayedPassword( CoD.EliteRegistrationEmailPopup.confirm_password_text ), "confirm_password_button_pressed", 11 )
	CoD.EliteRegistrationEmailPopup.confirm_password_button.hintText = Engine.Localize( "MPUI_HINTTEXT_CONFIRMPASSWORD" )
	if CoD.EliteRegistrationEmailPopup.UCDAccountUpdate then
		CoD.EliteRegistrationEmailPopup.confirm_password_button:processEvent( {
			name = "disable"
		} )
	end
	CoD.EliteRegistrationEmailPopup.Subscribe_spacer = CoD.EliteRegistrationEmailPopup.popup.buttonList:addSpacer( CoD.textSize.Default, 12 )
	CoD.EliteRegistrationEmailPopup.buttonSubmit = CoD.EliteRegistrationEmailPopup.AddNonRegistrationButton( newPopup, Engine.Localize( "MPUI_CONFIRM_INFO" ), "submit_pressed", 13 )
	if CoD.EliteRegistrationEmailPopup.UCDAccountUpdate then
		CoD.EliteRegistrationEmailPopup.buttonSubmit:processEvent( {
			name = "gain_focus"
		} )
	else
		CoD.EliteRegistrationEmailPopup.first_name_button:processEvent( {
			name = "gain_focus"
		} )
	end
	local RightMargin = 0
	local textAlpha = 0.4
	local alignment = LUI.Alignment.Left
	local offsetForLeftRightButtons = CoD.CoD9Button.Height - CoD.textSize.Default
	personalInformation_PosY = personalInformation_PosY + personalInformation_Step
	newPopup.pi_firstname = LUI.UIText.new()
	newPopup.pi_firstname:setLeftRight( true, true, 0, RightMargin )
	newPopup.pi_firstname:setTopBottom( true, false, topMargin + personalInformation_PosY, topMargin + personalInformation_PosY + CoD.textSize.Default )
	newPopup.pi_firstname:setRGB( CoD.white.r, CoD.white.g, CoD.white.b )
	newPopup.pi_firstname:setAlignment( alignment )
	newPopup.pi_firstname:setFont( CoD.fonts.Default )
	newPopup.pi_firstname:setText( Engine.Localize( "MPUI_EMAIL_REGISTRATION_POPUP_FIRST_NAME" ) )
	newPopup.pi_firstname:setAlpha( textAlpha )
	newPopup:addElement( newPopup.pi_firstname )
	personalInformation_PosY = personalInformation_PosY + personalInformation_Step
	newPopup.pi_lastname = LUI.UIText.new()
	newPopup.pi_lastname:setLeftRight( true, true, 0, RightMargin )
	newPopup.pi_lastname:setTopBottom( true, false, topMargin + personalInformation_PosY, topMargin + personalInformation_PosY + CoD.textSize.Default )
	newPopup.pi_lastname:setRGB( CoD.white.r, CoD.white.g, CoD.white.b )
	newPopup.pi_lastname:setAlignment( alignment )
	newPopup.pi_lastname:setFont( CoD.fonts.Default )
	newPopup.pi_lastname:setText( Engine.Localize( "MPUI_EMAIL_REGISTRATION_POPUP_LAST_NAME" ) )
	newPopup.pi_lastname:setAlpha( textAlpha )
	newPopup:addElement( newPopup.pi_lastname )
	personalInformation_PosY = personalInformation_PosY + personalInformation_Step
	newPopup.pi_country = LUI.UIText.new()
	newPopup.pi_country:setLeftRight( true, true, 0, RightMargin )
	newPopup.pi_country:setTopBottom( true, false, topMargin + personalInformation_PosY, topMargin + personalInformation_PosY + CoD.textSize.Default )
	newPopup.pi_country:setRGB( CoD.white.r, CoD.white.g, CoD.white.b )
	newPopup.pi_country:setAlignment( alignment )
	newPopup.pi_country:setFont( CoD.fonts.Default )
	newPopup.pi_country:setText( Engine.Localize( "MPUI_EMAIL_REGISTRATION_POPUP_COUNTRY" ) )
	newPopup.pi_country:setAlpha( textAlpha )
	newPopup:addElement( newPopup.pi_country )
	personalInformation_PosY = personalInformation_PosY - offsetForLeftRightButtons + personalInformation_Step
	newPopup.pi_zip = LUI.UIText.new()
	newPopup.pi_zip:setLeftRight( true, true, 0, RightMargin )
	newPopup.pi_zip:setTopBottom( true, false, topMargin + personalInformation_PosY, topMargin + personalInformation_PosY + CoD.textSize.Default )
	newPopup.pi_zip:setRGB( CoD.white.r, CoD.white.g, CoD.white.b )
	newPopup.pi_zip:setAlignment( alignment )
	newPopup.pi_zip:setFont( CoD.fonts.Default )
	newPopup.pi_zip:setText( Engine.Localize( "MPUI_EMAIL_REGISTRATION_POPUP_ZIPCODE" ) )
	newPopup.pi_zip:setAlpha( textAlpha )
	UpdateZipField()
	personalInformation_PosY = personalInformation_PosY + personalInformation_Step
	newPopup.pi_dob = LUI.UIText.new()
	newPopup.pi_dob:setLeftRight( true, true, 0, RightMargin )
	newPopup.pi_dob:setTopBottom( true, false, topMargin + personalInformation_PosY, topMargin + personalInformation_PosY + CoD.textSize.Default )
	newPopup.pi_dob:setRGB( CoD.white.r, CoD.white.g, CoD.white.b )
	newPopup.pi_dob:setAlignment( alignment )
	newPopup.pi_dob:setFont( CoD.fonts.Default )
	newPopup.pi_dob:setText( Engine.Localize( "MPUI_EMAIL_REGISTRATION_POPUP_DOB" ) )
	newPopup.pi_dob:setAlpha( textAlpha )
	newPopup:addElement( newPopup.pi_dob )
	personalInformation_PosY = personalInformation_PosY - offsetForLeftRightButtons + personalInformation_Step * 2 - offsetForLeftRightButtons * 2 + personalInformation_Step
	newPopup.li_account = LUI.UIText.new()
	newPopup.li_account:setLeftRight( true, true, 0, RightMargin )
	newPopup.li_account:setTopBottom( true, false, topMargin + personalInformation_PosY, topMargin + personalInformation_PosY + CoD.textSize.Default )
	newPopup.li_account:setRGB( CoD.white.r, CoD.white.g, CoD.white.b )
	newPopup.li_account:setAlignment( alignment )
	newPopup.li_account:setFont( CoD.fonts.Default )
	newPopup.li_account:setText( Engine.Localize( "MPUI_REGISTRATION_UCD_ACCOUNT_NAME" ) )
	newPopup.li_account:setAlpha( textAlpha )
	newPopup:addElement( newPopup.li_account )
	personalInformation_PosY = personalInformation_PosY + personalInformation_Step
	newPopup.li_email = LUI.UIText.new()
	newPopup.li_email:setLeftRight( true, true, 0, RightMargin )
	newPopup.li_email:setTopBottom( true, false, topMargin + personalInformation_PosY, topMargin + personalInformation_PosY + CoD.textSize.Default )
	newPopup.li_email:setRGB( CoD.white.r, CoD.white.g, CoD.white.b )
	newPopup.li_email:setAlignment( alignment )
	newPopup.li_email:setFont( CoD.fonts.Default )
	newPopup.li_email:setText( Engine.Localize( "MPUI_EMAIL_REGISTRATION_POPUP_EMAIL_ADDRESS" ) )
	newPopup.li_email:setAlpha( textAlpha )
	newPopup:addElement( newPopup.li_email )
	personalInformation_PosY = personalInformation_PosY + personalInformation_Step
	newPopup.li_password = LUI.UIText.new()
	newPopup.li_password:setLeftRight( true, true, 0, RightMargin )
	newPopup.li_password:setTopBottom( true, false, topMargin + personalInformation_PosY, topMargin + personalInformation_PosY + CoD.textSize.Default )
	newPopup.li_password:setRGB( CoD.white.r, CoD.white.g, CoD.white.b )
	newPopup.li_password:setAlignment( alignment )
	newPopup.li_password:setFont( CoD.fonts.Default )
	newPopup.li_password:setText( Engine.Localize( "MPUI_EMAIL_REGISTRATION_POPUP_PASSWORD" ) )
	newPopup.li_password:setAlpha( textAlpha )
	newPopup:addElement( newPopup.li_password )
	personalInformation_PosY = personalInformation_PosY + personalInformation_Step
	newPopup.li_confirm_password = LUI.UIText.new()
	newPopup.li_confirm_password:setLeftRight( true, true, 0, RightMargin )
	newPopup.li_confirm_password:setTopBottom( true, false, topMargin + personalInformation_PosY, topMargin + personalInformation_PosY + CoD.textSize.Default )
	newPopup.li_confirm_password:setRGB( CoD.white.r, CoD.white.g, CoD.white.b )
	newPopup.li_confirm_password:setAlignment( alignment )
	newPopup.li_confirm_password:setFont( CoD.fonts.Default )
	newPopup.li_confirm_password:setText( Engine.Localize( "MPUI_EMAIL_REGISTRATION_POPUP_CONFIRM_PASSWORD" ) )
	newPopup.li_confirm_password:setAlpha( textAlpha )
	newPopup:addElement( newPopup.li_confirm_password )
	personalInformation_PosY = personalInformation_PosY + personalInformation_Step
	newPopup.li_subscribe = LUI.UIText.new()
	newPopup.li_subscribe:setLeftRight( true, true, 0, RightMargin )
	newPopup.li_subscribe:setTopBottom( true, false, topMargin + personalInformation_PosY, topMargin + personalInformation_PosY + CoD.textSize.Default )
	newPopup.li_subscribe:setRGB( CoD.white.r, CoD.white.g, CoD.white.b )
	newPopup.li_subscribe:setAlignment( alignment )
	newPopup.li_subscribe:setFont( CoD.fonts.Default )
	newPopup.li_subscribe:setText( Engine.Localize( "MPUI_ELITE_SUBSCRIBE" ) )
	newPopup.li_subscribe:setAlpha( textAlpha )
	UpdateEnrollNotification()
	newPopup.legalText = LUI.UIText.new()
	newPopup.legalText:setLeftRight( true, true, 540, 0 )
	newPopup.legalText:setTopBottom( true, false, 510, 510 + CoD.textSize.ExtraSmall )
	newPopup.legalText:setRGB( CoD.white.r, CoD.white.g, CoD.white.b )
	newPopup.legalText:setAlignment( LUI.Alignment.Left )
	newPopup.legalText:setFont( CoD.fonts.ExtraSmall )
	newPopup.legalText:setText( Engine.Localize( "MPUI_ELITE_BENEFITS_2" ) )
	newPopup.legalText:setAlpha( 0.2 )
	newPopup:addElement( newPopup.legalText )
	CoD.EliteRegistrationEmailPopup.CanCheckFields = true
	newPopup.leftRepeater = LUI.UIButtonRepeater.new( "left", {
		name = "gamepad_button",
		button = "left",
		down = true
	} )
	newPopup.rightRepeater = LUI.UIButtonRepeater.new( "right", {
		name = "gamepad_button",
		button = "right",
		down = true
	} )
	newPopup:addElement( newPopup.leftRepeater )
	newPopup:addElement( newPopup.rightRepeater )
	return newPopup
end

