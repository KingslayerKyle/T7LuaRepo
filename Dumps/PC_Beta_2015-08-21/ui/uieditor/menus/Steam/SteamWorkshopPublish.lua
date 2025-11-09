require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreeenPupupSteamForm" )
require( "ui.uieditor.widgets.InputButton" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )
require( "ui.uieditor.widgets.checkbox" )

LUI.createMenu.SteamWorkshopPublish = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SteamWorkshopPublish" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SteamWorkshopPublish.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupForm = CoD.FullscreeenPupupSteamForm.new( self, controller )
	FullscreenPopupForm:setLeftRight( true, false, 0, 1280 )
	FullscreenPopupForm:setTopBottom( true, false, 0, 720 )
	FullscreenPopupForm.Title:setText( Engine.Localize( "PLATFORM_STEAM_PUBLISH_CAPS" ) )
	FullscreenPopupForm.Subtitle:setText( Engine.Localize( "PLATFORM_STEAM_PUBLISH_DESC" ) )
	FullscreenPopupForm.WorkingTitle:setText( Engine.Localize( "PLATFORM_STEAM_PUBLISH_WORKING_TITLE" ) )
	FullscreenPopupForm.DoneTitle:setText( Engine.Localize( "PLATFORM_STEAM_DONE_TITLE" ) )
	FullscreenPopupForm.ErrorSubtitle:setText( Engine.Localize( "PLATFORM_STEAM_PUBLISH_ERROR_DESC" ) )
	FullscreenPopupForm:mergeStateConditions( {
		{
			stateName = "WorkingState",
			condition = function ( menu, element, event )
				return FileshareIsPublishing()
			end
		},
		{
			stateName = "ErrorState",
			condition = function ( menu, element, event )
				return FileshareIsPublishingInError()
			end
		},
		{
			stateName = "DoneState",
			condition = function ( menu, element, event )
				return FileshareIsPublishingInSuccess()
			end
		}
	} )
	FullscreenPopupForm:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isPublishing" ), function ( model )
		self:updateElementState( FullscreenPopupForm, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isPublishing"
		} )
	end )
	self:addElement( FullscreenPopupForm )
	self.FullscreenPopupForm = FullscreenPopupForm
	
	local InputName = CoD.InputButton.new( self, controller )
	InputName:setLeftRight( true, false, 461.96, 677.96 )
	InputName:setTopBottom( true, false, 378, 412 )
	InputName:subscribeToGlobalModel( controller, "FileshareRoot", "publishName", function ( model )
		local publishName = Engine.GetModelValue( model )
		if publishName then
			InputName.Text:setText( publishName )
		end
	end )
	InputName:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	InputName:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	self:AddButtonCallbackFunction( InputName, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		FileshareEnterPublishName( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( InputName )
	self.InputName = InputName
	
	local LblName = LUI.UITightText.new()
	LblName:setLeftRight( true, false, 461.96, 661.96 )
	LblName:setTopBottom( true, false, 353, 378 )
	LblName:setText( Engine.Localize( "MENU_FILESHARE_NEWNAME" ) )
	LblName:setTTF( "fonts/default.ttf" )
	self:addElement( LblName )
	self.LblName = LblName
	
	local InputDescription = CoD.InputButton.new( self, controller )
	InputDescription:setLeftRight( true, false, 461.96, 1076.96 )
	InputDescription:setTopBottom( true, false, 437, 530 )
	InputDescription:subscribeToGlobalModel( controller, "FileshareRoot", "publishDescription", function ( model )
		local publishDescription = Engine.GetModelValue( model )
		if publishDescription then
			InputDescription.Text:setText( publishDescription )
		end
	end )
	InputDescription:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f12_local0
	end )
	InputDescription:registerEventHandler( "lose_focus", function ( element, event )
		local f13_local0 = nil
		if element.loseFocus then
			f13_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f13_local0 = element.super:loseFocus( event )
		end
		return f13_local0
	end )
	self:AddButtonCallbackFunction( InputDescription, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		FileshareEnterPublishDescription( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( InputDescription )
	self.InputDescription = InputDescription
	
	local LblDescription = LUI.UITightText.new()
	LblDescription:setLeftRight( true, false, 461.96, 529.96 )
	LblDescription:setTopBottom( true, false, 412, 437 )
	LblDescription:setText( Engine.Localize( "MENU_FILESHARE_DESCRIPTION" ) )
	LblDescription:setTTF( "fonts/default.ttf" )
	self:addElement( LblDescription )
	self.LblDescription = LblDescription
	
	local InputTags = CoD.InputButton.new( self, controller )
	InputTags:setLeftRight( true, false, 707.96, 1076.96 )
	InputTags:setTopBottom( true, false, 378, 412 )
	InputTags:subscribeToGlobalModel( controller, "FileshareRoot", "publishTags", function ( model )
		local publishTags = Engine.GetModelValue( model )
		if publishTags then
			InputTags.Text:setText( publishTags )
		end
	end )
	InputTags:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f17_local0
	end )
	InputTags:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	self:AddButtonCallbackFunction( InputTags, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		FileshareEnterPublishTags( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( InputTags )
	self.InputTags = InputTags
	
	local LblTags = LUI.UITightText.new()
	LblTags:setLeftRight( true, false, 707.96, 857.96 )
	LblTags:setTopBottom( true, false, 353, 378 )
	LblTags:setText( Engine.Localize( "MENU_FILESHARE_TAGS" ) )
	LblTags:setTTF( "fonts/default.ttf" )
	self:addElement( LblTags )
	self.LblTags = LblTags
	
	local BtnPublish = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	BtnPublish:setLeftRight( true, false, 984.96, 1076.96 )
	BtnPublish:setTopBottom( true, false, 564, 595 )
	BtnPublish.btnDisplayText:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH" ) )
	BtnPublish.btnDisplayTextStroke:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH" ) )
	BtnPublish:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.ready" ), function ( model )
		local f21_local0 = BtnPublish
		local f21_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		}
		CoD.Menu.UpdateButtonShownState( f21_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BtnPublish:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.publishSteamAgreement" ), function ( model )
		local f22_local0 = BtnPublish
		local f22_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.publishSteamAgreement"
		}
		CoD.Menu.UpdateButtonShownState( f22_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BtnPublish:registerEventHandler( "gain_focus", function ( element, event )
		local f23_local0 = nil
		if element.gainFocus then
			f23_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f23_local0 = element.super:gainFocus( event )
		end
		if not FileshareIsSteamAgreed() then
			SetHintText( self, element, controller )
		else
			CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		end
		return f23_local0
	end )
	BtnPublish:registerEventHandler( "lose_focus", function ( element, event )
		local f24_local0 = nil
		if element.loseFocus then
			f24_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f24_local0 = element.super:loseFocus( event )
		end
		return f24_local0
	end )
	self:AddButtonCallbackFunction( BtnPublish, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if FileshareIsReady( controller ) and FileshareIsSteamAgreed() then
			SteamWorkshopPublish( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if FileshareIsReady( controller ) and FileshareIsSteamAgreed() then
			return true
		else
			return false
		end
	end, false )
	BtnPublish:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return FilesharePublishToSteamDisabled( controller )
			end
		}
	} )
	BtnPublish:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.publishSteamAgreement" ), function ( model )
		self:updateElementState( BtnPublish, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.publishSteamAgreement"
		} )
	end )
	self:addElement( BtnPublish )
	self.BtnPublish = BtnPublish
	
	local BtnAgreement = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	BtnAgreement:setLeftRight( true, false, 679.98, 771.98 )
	BtnAgreement:setTopBottom( true, false, 564, 595 )
	BtnAgreement.btnDisplayText:setText( Engine.Localize( "PLATFORM_STEAM_AGREEMENT_LABEL" ) )
	BtnAgreement.btnDisplayTextStroke:setText( Engine.Localize( "PLATFORM_STEAM_AGREEMENT_LABEL" ) )
	BtnAgreement:registerEventHandler( "gain_focus", function ( element, event )
		local f29_local0 = nil
		if element.gainFocus then
			f29_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f29_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f29_local0
	end )
	BtnAgreement:registerEventHandler( "lose_focus", function ( element, event )
		local f30_local0 = nil
		if element.loseFocus then
			f30_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f30_local0 = element.super:loseFocus( event )
		end
		return f30_local0
	end )
	self:AddButtonCallbackFunction( BtnAgreement, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SteamWorkshopOpenAgreement( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BtnAgreement )
	self.BtnAgreement = BtnAgreement
	
	local BtnFAQ = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	BtnFAQ:setLeftRight( true, false, 461.96, 553.96 )
	BtnFAQ:setTopBottom( true, false, 564, 595 )
	BtnFAQ.btnDisplayText:setText( Engine.Localize( "PLATFORM_STEAM_FAQ_LABEL" ) )
	BtnFAQ.btnDisplayTextStroke:setText( Engine.Localize( "PLATFORM_STEAM_FAQ_LABEL" ) )
	BtnFAQ:registerEventHandler( "gain_focus", function ( element, event )
		local f33_local0 = nil
		if element.gainFocus then
			f33_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f33_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f33_local0
	end )
	BtnFAQ:registerEventHandler( "lose_focus", function ( element, event )
		local f34_local0 = nil
		if element.loseFocus then
			f34_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f34_local0 = element.super:loseFocus( event )
		end
		return f34_local0
	end )
	self:AddButtonCallbackFunction( BtnFAQ, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SteamWorkshopOpenFAQ( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BtnFAQ )
	self.BtnFAQ = BtnFAQ
	
	local BtnViewSteamWorkshop = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	BtnViewSteamWorkshop:setLeftRight( true, false, 461.96, 553.96 )
	BtnViewSteamWorkshop:setTopBottom( true, false, 564, 595 )
	BtnViewSteamWorkshop.btnDisplayText:setText( Engine.Localize( "PLATFORM_STEAM_OPEN_WORKSHOP" ) )
	BtnViewSteamWorkshop.btnDisplayTextStroke:setText( Engine.Localize( "PLATFORM_STEAM_OPEN_WORKSHOP" ) )
	BtnViewSteamWorkshop:registerEventHandler( "gain_focus", function ( element, event )
		local f37_local0 = nil
		if element.gainFocus then
			f37_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f37_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f37_local0
	end )
	BtnViewSteamWorkshop:registerEventHandler( "lose_focus", function ( element, event )
		local f38_local0 = nil
		if element.loseFocus then
			f38_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f38_local0 = element.super:loseFocus( event )
		end
		return f38_local0
	end )
	self:AddButtonCallbackFunction( BtnViewSteamWorkshop, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SteamWorkshopViewWorkshop( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BtnViewSteamWorkshop )
	self.BtnViewSteamWorkshop = BtnViewSteamWorkshop
	
	local BtnViewItemInWorkshop = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	BtnViewItemInWorkshop:setLeftRight( true, false, 679.98, 771.98 )
	BtnViewItemInWorkshop:setTopBottom( true, false, 564, 595 )
	BtnViewItemInWorkshop.btnDisplayText:setText( Engine.Localize( "PLATFORM_STEAM_OPEN_WORKSHOP_ITEM" ) )
	BtnViewItemInWorkshop.btnDisplayTextStroke:setText( Engine.Localize( "PLATFORM_STEAM_OPEN_WORKSHOP_ITEM" ) )
	BtnViewItemInWorkshop:registerEventHandler( "gain_focus", function ( element, event )
		local f41_local0 = nil
		if element.gainFocus then
			f41_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f41_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f41_local0
	end )
	BtnViewItemInWorkshop:registerEventHandler( "lose_focus", function ( element, event )
		local f42_local0 = nil
		if element.loseFocus then
			f42_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f42_local0 = element.super:loseFocus( event )
		end
		return f42_local0
	end )
	self:AddButtonCallbackFunction( BtnViewItemInWorkshop, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SteamWorkshopOpenItem( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BtnViewItemInWorkshop )
	self.BtnViewItemInWorkshop = BtnViewItemInWorkshop
	
	local BtnDone = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	BtnDone:setLeftRight( true, false, 984.96, 1076.96 )
	BtnDone:setTopBottom( true, false, 564, 595 )
	BtnDone.btnDisplayText:setText( Engine.Localize( "MPUI_DONE_CAPS" ) )
	BtnDone.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_DONE_CAPS" ) )
	BtnDone:registerEventHandler( "gain_focus", function ( element, event )
		local f45_local0 = nil
		if element.gainFocus then
			f45_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f45_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f45_local0
	end )
	BtnDone:registerEventHandler( "lose_focus", function ( element, event )
		local f46_local0 = nil
		if element.loseFocus then
			f46_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f46_local0 = element.super:loseFocus( event )
		end
		return f46_local0
	end )
	self:AddButtonCallbackFunction( BtnDone, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BtnDone )
	self.BtnDone = BtnDone
	
	local checkboxSteamAgreement = CoD.checkbox.new( self, controller )
	checkboxSteamAgreement:setLeftRight( false, false, -178.04, 442 )
	checkboxSteamAgreement:setTopBottom( true, false, 530, 564 )
	checkboxSteamAgreement.labelText:setText( Engine.Localize( "PLATFORM_STEAM_PUBLISH_AGREEMENT_CHECKBOX" ) )
	checkboxSteamAgreement:registerEventHandler( "gain_focus", function ( element, event )
		local f49_local0 = nil
		if element.gainFocus then
			f49_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f49_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f49_local0
	end )
	checkboxSteamAgreement:registerEventHandler( "lose_focus", function ( element, event )
		local f50_local0 = nil
		if element.loseFocus then
			f50_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f50_local0 = element.super:loseFocus( event )
		end
		return f50_local0
	end )
	self:AddButtonCallbackFunction( checkboxSteamAgreement, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGlobalModelValueBoolean( "FileshareRoot.publishSteamAgreement" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( checkboxSteamAgreement, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	checkboxSteamAgreement:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return IsGlobalModelValueTrue( element, controller, "FileshareRoot.publishSteamAgreement" )
			end
		}
	} )
	checkboxSteamAgreement:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.publishSteamAgreement" ), function ( model )
		self:updateElementState( checkboxSteamAgreement, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.publishSteamAgreement"
		} )
	end )
	self:addElement( checkboxSteamAgreement )
	self.checkboxSteamAgreement = checkboxSteamAgreement
	
	InputName.navigation = {
		right = InputTags,
		down = InputDescription
	}
	InputDescription.navigation = {
		up = {
			InputName,
			InputTags
		},
		down = checkboxSteamAgreement
	}
	InputTags.navigation = {
		left = InputName,
		down = InputDescription
	}
	BtnPublish.navigation = {
		left = BtnDone,
		up = BtnDone
	}
	BtnAgreement.navigation = {
		left = BtnViewItemInWorkshop,
		up = BtnViewItemInWorkshop,
		right = {
			BtnPublish,
			BtnDone
		}
	}
	BtnFAQ.navigation = {
		left = BtnViewSteamWorkshop,
		up = BtnViewSteamWorkshop,
		right = {
			BtnAgreement,
			BtnViewItemInWorkshop
		}
	}
	BtnViewSteamWorkshop.navigation = {
		left = BtnFAQ,
		up = BtnFAQ,
		right = {
			BtnAgreement,
			BtnViewItemInWorkshop
		}
	}
	BtnViewItemInWorkshop.navigation = {
		left = BtnAgreement,
		up = BtnAgreement,
		right = {
			BtnPublish,
			BtnDone
		}
	}
	BtnDone.navigation = {
		left = BtnPublish,
		up = BtnPublish
	}
	checkboxSteamAgreement.navigation = {
		up = InputDescription,
		down = {
			BtnFAQ,
			BtnViewSteamWorkshop,
			BtnAgreement,
			BtnViewItemInWorkshop,
			BtnPublish,
			BtnDone
		}
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				BtnViewSteamWorkshop:completeAnimation()
				self.BtnViewSteamWorkshop:setAlpha( 0 )
				self.clipFinished( BtnViewSteamWorkshop, {} )
				BtnViewItemInWorkshop:completeAnimation()
				self.BtnViewItemInWorkshop:setAlpha( 0 )
				self.clipFinished( BtnViewItemInWorkshop, {} )
				BtnDone:completeAnimation()
				self.BtnDone:setAlpha( 0 )
				self.clipFinished( BtnDone, {} )
			end
		},
		Working = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				InputName:completeAnimation()
				self.InputName:setAlpha( 0 )
				self.clipFinished( InputName, {} )
				LblName:completeAnimation()
				self.LblName:setAlpha( 0 )
				self.clipFinished( LblName, {} )
				InputDescription:completeAnimation()
				self.InputDescription:setAlpha( 0 )
				self.clipFinished( InputDescription, {} )
				LblDescription:completeAnimation()
				self.LblDescription:setAlpha( 0 )
				self.clipFinished( LblDescription, {} )
				InputTags:completeAnimation()
				self.InputTags:setAlpha( 0 )
				self.clipFinished( InputTags, {} )
				LblTags:completeAnimation()
				self.LblTags:setAlpha( 0 )
				self.clipFinished( LblTags, {} )
				BtnPublish:completeAnimation()
				self.BtnPublish:setAlpha( 0 )
				self.clipFinished( BtnPublish, {} )
				BtnAgreement:completeAnimation()
				self.BtnAgreement:setAlpha( 0 )
				self.clipFinished( BtnAgreement, {} )
				BtnDone:completeAnimation()
				self.BtnDone:setAlpha( 0 )
				self.clipFinished( BtnDone, {} )
				checkboxSteamAgreement:completeAnimation()
				self.checkboxSteamAgreement:setAlpha( 0 )
				self.clipFinished( checkboxSteamAgreement, {} )
			end
		},
		Success = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				InputName:completeAnimation()
				self.InputName:setAlpha( 0 )
				self.clipFinished( InputName, {} )
				LblName:completeAnimation()
				self.LblName:setAlpha( 0 )
				self.clipFinished( LblName, {} )
				InputDescription:completeAnimation()
				self.InputDescription:setAlpha( 0 )
				self.clipFinished( InputDescription, {} )
				LblDescription:completeAnimation()
				self.LblDescription:setAlpha( 0 )
				self.clipFinished( LblDescription, {} )
				InputTags:completeAnimation()
				self.InputTags:setAlpha( 0 )
				self.clipFinished( InputTags, {} )
				LblTags:completeAnimation()
				self.LblTags:setAlpha( 0 )
				self.clipFinished( LblTags, {} )
				BtnPublish:completeAnimation()
				self.BtnPublish:setAlpha( 0 )
				self.clipFinished( BtnPublish, {} )
				BtnAgreement:completeAnimation()
				self.BtnAgreement:setAlpha( 0 )
				self.clipFinished( BtnAgreement, {} )
				BtnFAQ:completeAnimation()
				self.BtnFAQ:setAlpha( 0 )
				self.clipFinished( BtnFAQ, {} )
				BtnViewSteamWorkshop:completeAnimation()
				self.BtnViewSteamWorkshop:setAlpha( 1 )
				self.clipFinished( BtnViewSteamWorkshop, {} )
				BtnViewItemInWorkshop:completeAnimation()
				self.BtnViewItemInWorkshop:setAlpha( 1 )
				self.clipFinished( BtnViewItemInWorkshop, {} )
				BtnDone:completeAnimation()
				self.BtnDone:setAlpha( 1 )
				self.clipFinished( BtnDone, {} )
				checkboxSteamAgreement:completeAnimation()
				self.checkboxSteamAgreement:setAlpha( 0 )
				self.clipFinished( checkboxSteamAgreement, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Working",
			condition = function ( menu, element, event )
				return FileshareIsPublishing()
			end
		},
		{
			stateName = "Success",
			condition = function ( menu, element, event )
				return FileshareIsPublishingInSuccess()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isPublishing" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isPublishing"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( self, event )
		local f62_local0 = nil
		FileshareHandleKeyboardComplete( self, self, controller, event )
		if not f62_local0 then
			f62_local0 = self:dispatchEventToChildren( event )
		end
		return f62_local0
	end )
	self:registerEventHandler( "fileshare_publish_success", function ( self, event )
		local f63_local0 = nil
		if not f63_local0 then
			f63_local0 = self:dispatchEventToChildren( event )
		end
		return f63_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	InputName.id = "InputName"
	InputDescription.id = "InputDescription"
	InputTags.id = "InputTags"
	BtnPublish.id = "BtnPublish"
	BtnAgreement.id = "BtnAgreement"
	BtnFAQ.id = "BtnFAQ"
	BtnViewSteamWorkshop.id = "BtnViewSteamWorkshop"
	BtnViewItemInWorkshop.id = "BtnViewItemInWorkshop"
	BtnDone.id = "BtnDone"
	checkboxSteamAgreement.id = "checkboxSteamAgreement"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.InputName:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FullscreenPopupForm:close()
		element.InputName:close()
		element.InputDescription:close()
		element.InputTags:close()
		element.BtnPublish:close()
		element.BtnAgreement:close()
		element.BtnFAQ:close()
		element.BtnViewSteamWorkshop:close()
		element.BtnViewItemInWorkshop:close()
		element.BtnDone:close()
		element.checkboxSteamAgreement:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SteamWorkshopPublish.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

