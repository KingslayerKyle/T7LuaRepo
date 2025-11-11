require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithInputButton" )
require( "ui.uieditor.widgets.FileShare.AllowDownload" )
require( "ui.uieditor.widgets.FileShare.FileshareSlotsAvailable" )
require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.GenericPopups.DialogSpinner" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )

local PreLoadFunc = function ( self, controller )
	CoD.FileshareUtility.SetPublishAllowDownload( true )
end

local PostLoadFunc = function ( self, controller )
	self.FullscreenPopupTemplate.navigation = nil
	self.GunsmithInputButton.navigation = {
		up = self.BtnPublish,
		down = self.inputDescription
	}
	self.inputDescription.navigation = {
		up = self.GunsmithInputButton,
		down = self.BtnPublish
	}
	self.BtnPublish.navigation = {
		up = self.inputDescription,
		down = self.GunsmithInputButton
	}
end

LUI.createMenu.FilesharePublish = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FilesharePublish" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FilesharePublish.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate = CoD.FullscreenPopupTemplate.new( self, controller )
	FullscreenPopupTemplate:mergeStateConditions( {
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
		}
	} )
	FullscreenPopupTemplate:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isPublishing" ), function ( model )
		self:updateElementState( FullscreenPopupTemplate, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isPublishing"
		} )
	end )
	FullscreenPopupTemplate:setLeftRight( 0, 0, -5, 1921 )
	FullscreenPopupTemplate:setTopBottom( 0, 0, 0, 1080 )
	FullscreenPopupTemplate.ButtonList:setDataSource( "FileshareSlotsFullButtonList" )
	FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_WORKING_TITLE" ) )
	FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_TITLE" ) )
	FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_DESC" ) )
	FullscreenPopupTemplate.DoneTitle:setText( Engine.Localize( "MENU_NEW" ) )
	FullscreenPopupTemplate.ErrorSubtitle:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_ERROR" ) )
	self:addElement( FullscreenPopupTemplate )
	self.FullscreenPopupTemplate = FullscreenPopupTemplate
	
	local GunsmithInputButton = CoD.GunsmithInputButton.new( self, controller )
	GunsmithInputButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return FileshareIsLocalCategory( controller )
			end
		}
	} )
	GunsmithInputButton:setLeftRight( 0, 0, 687, 1230 )
	GunsmithInputButton:setTopBottom( 0, 0, 572.5, 623.5 )
	GunsmithInputButton.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	GunsmithInputButton:subscribeToGlobalModel( controller, "FileshareRoot", "publishName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GunsmithInputButton.Text:setText( modelValue )
		end
	end )
	GunsmithInputButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	GunsmithInputButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( GunsmithInputButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsMenuInState( menu, "DefaultState" ) and FileshareCanEditNameAndDescription( controller ) then
			FileshareEnterPublishName( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsMenuInState( menu, "DefaultState" ) and FileshareCanEditNameAndDescription( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( GunsmithInputButton )
	self.GunsmithInputButton = GunsmithInputButton
	
	local LblName = LUI.UITightText.new()
	LblName:setLeftRight( 0, 0, 693, 993 )
	LblName:setTopBottom( 0, 0, 529, 567 )
	LblName:setText( Engine.Localize( "MENU_FILESHARE_NEWNAME" ) )
	LblName:setTTF( "fonts/default.ttf" )
	self:addElement( LblName )
	self.LblName = LblName
	
	local inputDescription = CoD.GunsmithInputButton.new( self, controller )
	inputDescription:setLeftRight( 0, 0, 687, 1827 )
	inputDescription:setTopBottom( 0, 0, 672.5, 723.5 )
	inputDescription.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	inputDescription:subscribeToGlobalModel( controller, "FileshareRoot", "publishDescription", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			inputDescription.Text:setText( modelValue )
		end
	end )
	inputDescription:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	inputDescription:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( inputDescription, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsMenuInState( menu, "DefaultState" ) and FileshareCanEditNameAndDescription( controller ) then
			FileshareEnterPublishDescription( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsMenuInState( menu, "DefaultState" ) and FileshareCanEditNameAndDescription( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( inputDescription )
	self.inputDescription = inputDescription
	
	local descriptionText = LUI.UIText.new()
	descriptionText:setLeftRight( 0, 0, 693, 1795 )
	descriptionText:setTopBottom( 0, 0, 628, 666 )
	descriptionText:setText( Engine.Localize( "MPUI_DESCRIPTION" ) )
	descriptionText:setTTF( "fonts/default.ttf" )
	descriptionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	descriptionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( descriptionText )
	self.descriptionText = descriptionText
	
	local LblPermissions = LUI.UITightText.new()
	LblPermissions:setLeftRight( 0, 0, 693, 743 )
	LblPermissions:setTopBottom( 0, 0, 628, 666 )
	LblPermissions:setAlpha( 0 )
	LblPermissions:setText( Engine.Localize( "MENU_FILESHARE_PERMISSIONS" ) )
	LblPermissions:setTTF( "fonts/default.ttf" )
	self:addElement( LblPermissions )
	self.LblPermissions = LblPermissions
	
	local BtnPublish = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	BtnPublish:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not FileshareIsReady( controller )
			end
		}
	} )
	BtnPublish:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.ready" ), function ( model )
		self:updateElementState( BtnPublish, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		} )
	end )
	BtnPublish:setLeftRight( 0, 0, 687, 1107 )
	BtnPublish:setTopBottom( 0, 0, 731, 777 )
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
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BtnPublish:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isPublishing" ), function ( model )
		local element = BtnPublish
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isPublishing"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BtnPublish:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	self:AddButtonCallbackFunction( BtnPublish, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if FileshareIsReady( controller ) and not FileshareIsPublishing() then
			FilesharePublish( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if FileshareIsReady( controller ) and not FileshareIsPublishing() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( BtnPublish )
	self.BtnPublish = BtnPublish
	
	local AllowDownload0 = CoD.AllowDownload.new( self, controller )
	AllowDownload0:setLeftRight( 0, 0, 656, 686 )
	AllowDownload0:setTopBottom( 0, 0, 676, 704 )
	AllowDownload0:setAlpha( 0 )
	self:addElement( AllowDownload0 )
	self.AllowDownload0 = AllowDownload0
	
	local FileshareSlotsAvailable0 = CoD.FileshareSlotsAvailable.new( self, controller )
	FileshareSlotsAvailable0:setLeftRight( 0, 0, 1360, 1795 )
	FileshareSlotsAvailable0:setTopBottom( 0, 0, 730.5, 775.5 )
	self:addElement( FileshareSlotsAvailable0 )
	self.FileshareSlotsAvailable0 = FileshareSlotsAvailable0
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	leftButtonBar:setLeftRight( 0, 0, 96, 744 )
	leftButtonBar:setTopBottom( 0, 0, 796, 844 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	local DialogSpinner0 = CoD.DialogSpinner.new( self, controller )
	DialogSpinner0:setLeftRight( 0, 0, 801, 993 )
	DialogSpinner0:setTopBottom( 0, 0, 484, 676 )
	DialogSpinner0:setAlpha( 0 )
	self:addElement( DialogSpinner0 )
	self.DialogSpinner0 = DialogSpinner0
	
	local OutofVariant = LUI.UIImage.new()
	OutofVariant:setLeftRight( 0, 0, -5, 816 )
	OutofVariant:setTopBottom( 0, 0, 318, 785 )
	OutofVariant:setAlpha( 0.6 )
	OutofVariant:setImage( RegisterImage( "t7_icon_novariant_bkg_overlays" ) )
	OutofVariant:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutofVariant )
	self.OutofVariant = OutofVariant
	
	FullscreenPopupTemplate.navigation = {
		left = BtnPublish,
		right = {
			GunsmithInputButton,
			inputDescription
		},
		down = GunsmithInputButton
	}
	GunsmithInputButton.navigation = {
		left = FullscreenPopupTemplate,
		up = FullscreenPopupTemplate,
		down = inputDescription
	}
	inputDescription.navigation = {
		left = FullscreenPopupTemplate,
		up = FullscreenPopupTemplate,
		down = BtnPublish
	}
	BtnPublish.navigation = {
		up = FullscreenPopupTemplate,
		right = FullscreenPopupTemplate
	}
	self.resetProperties = function ()
		FullscreenPopupTemplate:completeAnimation()
		OutofVariant:completeAnimation()
		BtnPublish:completeAnimation()
		LblName:completeAnimation()
		GunsmithInputButton:completeAnimation()
		DialogSpinner0:completeAnimation()
		descriptionText:completeAnimation()
		inputDescription:completeAnimation()
		FileshareSlotsAvailable0:completeAnimation()
		FullscreenPopupTemplate.RedLine:setRGB( 1, 0.6, 0 )
		FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_WORKING_TITLE" ) )
		FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_TITLE" ) )
		FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_DESC" ) )
		FullscreenPopupTemplate.DoneTitle:setText( Engine.Localize( "MENU_NEW" ) )
		OutofVariant:setAlpha( 0.6 )
		BtnPublish:setAlpha( 1 )
		LblName:setAlpha( 1 )
		GunsmithInputButton:setAlpha( 1 )
		DialogSpinner0:setAlpha( 0 )
		descriptionText:setAlpha( 1 )
		inputDescription:setAlpha( 1 )
		FileshareSlotsAvailable0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.RedLine:completeAnimation()
				self.FullscreenPopupTemplate.RedLine:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( FullscreenPopupTemplate, {} )
				OutofVariant:completeAnimation()
				self.OutofVariant:setAlpha( 0 )
				self.clipFinished( OutofVariant, {} )
			end
		},
		Working = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.RedLine:completeAnimation()
				self.FullscreenPopupTemplate.RedLine:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( FullscreenPopupTemplate, {} )
				GunsmithInputButton:completeAnimation()
				self.GunsmithInputButton:setAlpha( 0 )
				self.clipFinished( GunsmithInputButton, {} )
				LblName:completeAnimation()
				self.LblName:setAlpha( 0 )
				self.clipFinished( LblName, {} )
				inputDescription:completeAnimation()
				self.inputDescription:setAlpha( 0 )
				self.clipFinished( inputDescription, {} )
				descriptionText:completeAnimation()
				self.descriptionText:setAlpha( 0 )
				self.clipFinished( descriptionText, {} )
				BtnPublish:completeAnimation()
				self.BtnPublish:setAlpha( 0 )
				self.clipFinished( BtnPublish, {} )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 1 )
				self.clipFinished( DialogSpinner0, {} )
				OutofVariant:completeAnimation()
				self.OutofVariant:setAlpha( 0 )
				self.clipFinished( OutofVariant, {} )
			end
		},
		Fetching = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.RedLine:completeAnimation()
				FullscreenPopupTemplate.WorkingTitle:completeAnimation()
				FullscreenPopupTemplate.Title:completeAnimation()
				FullscreenPopupTemplate.Subtitle:completeAnimation()
				FullscreenPopupTemplate.DoneTitle:completeAnimation()
				self.FullscreenPopupTemplate.RedLine:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_FILESHARE_WAITING" ) )
				self.FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_FILESHARE_WAITING" ) )
				self.FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "0" ) )
				self.FullscreenPopupTemplate.DoneTitle:setText( Engine.Localize( "0" ) )
				self.clipFinished( FullscreenPopupTemplate, {} )
				GunsmithInputButton:completeAnimation()
				self.GunsmithInputButton:setAlpha( 0 )
				self.clipFinished( GunsmithInputButton, {} )
				LblName:completeAnimation()
				self.LblName:setAlpha( 0 )
				self.clipFinished( LblName, {} )
				inputDescription:completeAnimation()
				self.inputDescription:setAlpha( 0 )
				self.clipFinished( inputDescription, {} )
				descriptionText:completeAnimation()
				self.descriptionText:setAlpha( 0 )
				self.clipFinished( descriptionText, {} )
				BtnPublish:completeAnimation()
				self.BtnPublish:setAlpha( 0 )
				self.clipFinished( BtnPublish, {} )
				FileshareSlotsAvailable0:completeAnimation()
				self.FileshareSlotsAvailable0:setAlpha( 0 )
				self.clipFinished( FileshareSlotsAvailable0, {} )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 1 )
				self.clipFinished( DialogSpinner0, {} )
				OutofVariant:completeAnimation()
				self.OutofVariant:setAlpha( 0 )
				self.clipFinished( OutofVariant, {} )
			end
		},
		SlotsFull = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.RedLine:completeAnimation()
				FullscreenPopupTemplate.WorkingTitle:completeAnimation()
				FullscreenPopupTemplate.Title:completeAnimation()
				FullscreenPopupTemplate.Subtitle:completeAnimation()
				self.FullscreenPopupTemplate.RedLine:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "0" ) )
				self.FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_FILESHARE_SLOTS_FULL_TITLE" ) )
				self.FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_SLOTS_FULL_DESC" ) )
				self.clipFinished( FullscreenPopupTemplate, {} )
				GunsmithInputButton:completeAnimation()
				self.GunsmithInputButton:setAlpha( 0 )
				self.clipFinished( GunsmithInputButton, {} )
				LblName:completeAnimation()
				self.LblName:setAlpha( 0 )
				self.clipFinished( LblName, {} )
				inputDescription:completeAnimation()
				self.inputDescription:setAlpha( 0 )
				self.clipFinished( inputDescription, {} )
				descriptionText:completeAnimation()
				self.descriptionText:setAlpha( 0 )
				self.clipFinished( descriptionText, {} )
				BtnPublish:completeAnimation()
				self.BtnPublish:setAlpha( 0 )
				self.clipFinished( BtnPublish, {} )
				FileshareSlotsAvailable0:completeAnimation()
				self.FileshareSlotsAvailable0:setAlpha( 0 )
				self.clipFinished( FileshareSlotsAvailable0, {} )
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
			stateName = "Fetching",
			condition = function ( menu, element, event )
				return not FileshareIsReadyToPublish( controller )
			end
		},
		{
			stateName = "SlotsFull",
			condition = function ( menu, element, event )
				return FileshareIsReadyToPublish( controller ) and not FileshareShowcaseSlotsAvailable( controller )
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
		GoBackMultiple( self, controller, "1" )
		FileshareShowPublishSuccessToast( self, element, controller )
		FileshareRestoreToPreviousCategory( controller )
		FileshareRecordPublishEvent( controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "fileshare_publish_failure", function ( element, event )
		local retVal = nil
		FileshareShowErrorToast( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		FileshareRestoreToPreviousCategory( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsMenuInState( self, "SlotsFull" ) then
			SetFocusToElement( self, "FullscreenPopupTemplate", controller )
		elseif IsMenuInState( self, "DefaultState" ) then
			SetFocusToElement( self, "GunsmithInputButton", controller )
		end
	end )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local element = self
		if FileshareIsReadyToPublish( controller ) and not FileshareShowcaseSlotsAvailable( controller ) then
			SetState( self, "SlotsFull" )
		elseif FileshareIsReadyToPublish( controller ) and FileshareShowcaseSlotsAvailable( controller ) then
			SetState( self, "DefaultState" )
		end
	end )
	FullscreenPopupTemplate.id = "FullscreenPopupTemplate"
	GunsmithInputButton.id = "GunsmithInputButton"
	inputDescription.id = "inputDescription"
	BtnPublish.id = "BtnPublish"
	leftButtonBar:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FullscreenPopupTemplate:close()
		self.GunsmithInputButton:close()
		self.inputDescription:close()
		self.BtnPublish:close()
		self.AllowDownload0:close()
		self.FileshareSlotsAvailable0:close()
		self.leftButtonBar:close()
		self.DialogSpinner0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FilesharePublish.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

