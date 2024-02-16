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
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupForm = CoD.FullscreeenPupupSteamForm.new( menu, controller )
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
		menu:updateElementState( FullscreenPopupForm, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isPublishing"
		} )
	end )
	self:addElement( FullscreenPopupForm )
	self.FullscreenPopupForm = FullscreenPopupForm
	
	local InputName = CoD.InputButton.new( menu, controller )
	InputName:setLeftRight( true, false, 461.96, 677.96 )
	InputName:setTopBottom( true, false, 378, 412 )
	InputName:subscribeToGlobalModel( controller, "FileshareRoot", "publishName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			InputName.Text:setText( modelValue )
		end
	end )
	InputName:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	InputName:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( InputName, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
	
	local InputDescription = CoD.InputButton.new( menu, controller )
	InputDescription:setLeftRight( true, false, 461.96, 1076.96 )
	InputDescription:setTopBottom( true, false, 437, 530 )
	InputDescription:subscribeToGlobalModel( controller, "FileshareRoot", "publishDescription", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			InputDescription.Text:setText( modelValue )
		end
	end )
	InputDescription:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	InputDescription:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( InputDescription, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
	
	local InputTags = CoD.InputButton.new( menu, controller )
	InputTags:setLeftRight( true, false, 707.96, 1076.96 )
	InputTags:setTopBottom( true, false, 378, 412 )
	InputTags:subscribeToGlobalModel( controller, "FileshareRoot", "publishTags", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			InputTags.Text:setText( modelValue )
		end
	end )
	InputTags:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	InputTags:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( InputTags, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
	
	local BtnPublish = CoD.List1ButtonLarge_Left_ND.new( menu, controller )
	BtnPublish:setLeftRight( true, false, 984.96, 1076.96 )
	BtnPublish:setTopBottom( true, false, 564, 595 )
	BtnPublish.btnDisplayText:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH" ) )
	BtnPublish.btnDisplayTextStroke:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH" ) )
	BtnPublish:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.ready" ), function ( model )
		local element = BtnPublish
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BtnPublish:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.publishSteamAgreement" ), function ( model )
		local element = BtnPublish
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.publishSteamAgreement"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BtnPublish:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		if not FileshareIsSteamAgreed() then
			SetHintText( self, element, controller )
		else
			CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		end
		return retVal
	end )
	BtnPublish:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( BtnPublish, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
		menu:updateElementState( BtnPublish, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.publishSteamAgreement"
		} )
	end )
	self:addElement( BtnPublish )
	self.BtnPublish = BtnPublish
	
	local BtnAgreement = CoD.List1ButtonLarge_Left_ND.new( menu, controller )
	BtnAgreement:setLeftRight( true, false, 679.98, 771.98 )
	BtnAgreement:setTopBottom( true, false, 564, 595 )
	BtnAgreement.btnDisplayText:setText( Engine.Localize( "PLATFORM_STEAM_AGREEMENT_LABEL" ) )
	BtnAgreement.btnDisplayTextStroke:setText( Engine.Localize( "PLATFORM_STEAM_AGREEMENT_LABEL" ) )
	BtnAgreement:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	BtnAgreement:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( BtnAgreement, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SteamWorkshopOpenAgreement( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BtnAgreement )
	self.BtnAgreement = BtnAgreement
	
	local BtnFAQ = CoD.List1ButtonLarge_Left_ND.new( menu, controller )
	BtnFAQ:setLeftRight( true, false, 461.96, 553.96 )
	BtnFAQ:setTopBottom( true, false, 564, 595 )
	BtnFAQ.btnDisplayText:setText( Engine.Localize( "PLATFORM_STEAM_FAQ_LABEL" ) )
	BtnFAQ.btnDisplayTextStroke:setText( Engine.Localize( "PLATFORM_STEAM_FAQ_LABEL" ) )
	BtnFAQ:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	BtnFAQ:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( BtnFAQ, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SteamWorkshopOpenFAQ( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BtnFAQ )
	self.BtnFAQ = BtnFAQ
	
	local BtnViewSteamWorkshop = CoD.List1ButtonLarge_Left_ND.new( menu, controller )
	BtnViewSteamWorkshop:setLeftRight( true, false, 461.96, 553.96 )
	BtnViewSteamWorkshop:setTopBottom( true, false, 564, 595 )
	BtnViewSteamWorkshop.btnDisplayText:setText( Engine.Localize( "PLATFORM_STEAM_OPEN_WORKSHOP" ) )
	BtnViewSteamWorkshop.btnDisplayTextStroke:setText( Engine.Localize( "PLATFORM_STEAM_OPEN_WORKSHOP" ) )
	BtnViewSteamWorkshop:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	BtnViewSteamWorkshop:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( BtnViewSteamWorkshop, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SteamWorkshopViewWorkshop( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BtnViewSteamWorkshop )
	self.BtnViewSteamWorkshop = BtnViewSteamWorkshop
	
	local BtnViewItemInWorkshop = CoD.List1ButtonLarge_Left_ND.new( menu, controller )
	BtnViewItemInWorkshop:setLeftRight( true, false, 679.98, 771.98 )
	BtnViewItemInWorkshop:setTopBottom( true, false, 564, 595 )
	BtnViewItemInWorkshop.btnDisplayText:setText( Engine.Localize( "PLATFORM_STEAM_OPEN_WORKSHOP_ITEM" ) )
	BtnViewItemInWorkshop.btnDisplayTextStroke:setText( Engine.Localize( "PLATFORM_STEAM_OPEN_WORKSHOP_ITEM" ) )
	BtnViewItemInWorkshop:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	BtnViewItemInWorkshop:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( BtnViewItemInWorkshop, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SteamWorkshopOpenItem( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BtnViewItemInWorkshop )
	self.BtnViewItemInWorkshop = BtnViewItemInWorkshop
	
	local BtnDone = CoD.List1ButtonLarge_Left_ND.new( menu, controller )
	BtnDone:setLeftRight( true, false, 984.96, 1076.96 )
	BtnDone:setTopBottom( true, false, 564, 595 )
	BtnDone.btnDisplayText:setText( Engine.Localize( "MPUI_DONE_CAPS" ) )
	BtnDone.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_DONE_CAPS" ) )
	BtnDone:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	BtnDone:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( BtnDone, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BtnDone )
	self.BtnDone = BtnDone
	
	local checkboxSteamAgreement = CoD.checkbox.new( menu, controller )
	checkboxSteamAgreement:setLeftRight( false, false, -178.04, 442 )
	checkboxSteamAgreement:setTopBottom( true, false, 530, 564 )
	checkboxSteamAgreement.labelText:setText( Engine.Localize( "PLATFORM_STEAM_PUBLISH_AGREEMENT_CHECKBOX" ) )
	checkboxSteamAgreement:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	checkboxSteamAgreement:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( checkboxSteamAgreement, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleGlobalModelValueBoolean( "FileshareRoot.publishSteamAgreement" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( checkboxSteamAgreement, "setText", function ( element, text )
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
		menu:updateElementState( checkboxSteamAgreement, {
			name = "model_validation",
			menu = menu,
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
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isPublishing"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		FileshareHandleKeyboardComplete( self, element, controller, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "fileshare_publish_success", function ( element, event )
		local retVal = nil
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
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
		menu = menu
	} )
	if not self:restoreState() then
		self.InputName:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FullscreenPopupForm:close()
		self.InputName:close()
		self.InputDescription:close()
		self.InputTags:close()
		self.BtnPublish:close()
		self.BtnAgreement:close()
		self.BtnFAQ:close()
		self.BtnViewSteamWorkshop:close()
		self.BtnViewItemInWorkshop:close()
		self.BtnDone:close()
		self.checkboxSteamAgreement:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SteamWorkshopPublish.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

