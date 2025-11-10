require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithInputButton" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )
require( "ui.uieditor.widgets.FileShare.AllowDownload" )
require( "ui.uieditor.widgets.FileShare.FileshareSlotsAvailable" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.GenericPopups.DialogSpinner" )

local PreLoadFunc = function ( self, controller )
	CoD.FileshareUtility.SetPublishAllowDownload( true )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.FullscreenPopupTemplate.navigation = nil
	f2_arg0.GunsmithInputButton.navigation = {
		up = f2_arg0.BtnPublish,
		down = f2_arg0.BtnPublish
	}
	f2_arg0.BtnPublish.navigation = {
		up = f2_arg0.GunsmithInputButton,
		down = f2_arg0.GunsmithInputButton
	}
end

LUI.createMenu.FilesharePublish = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FilesharePublish" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FilesharePublish.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate = CoD.FullscreenPopupTemplate.new( self, controller )
	FullscreenPopupTemplate:setLeftRight( true, false, -3.04, 1280.96 )
	FullscreenPopupTemplate:setTopBottom( true, false, 0, 720 )
	FullscreenPopupTemplate.ButtonList:setDataSource( "FileshareSlotsFullButtonList" )
	FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_WORKING_TITLE" ) )
	FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_TITLE" ) )
	FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_DESC" ) )
	FullscreenPopupTemplate.DoneTitle:setText( Engine.Localize( "MENU_NEW" ) )
	FullscreenPopupTemplate.ErrorSubtitle:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_ERROR" ) )
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
	self:addElement( FullscreenPopupTemplate )
	self.FullscreenPopupTemplate = FullscreenPopupTemplate
	
	local GunsmithInputButton = CoD.GunsmithInputButton.new( self, controller )
	GunsmithInputButton:setLeftRight( true, false, 457.96, 819.96 )
	GunsmithInputButton:setTopBottom( true, false, 382, 416 )
	GunsmithInputButton:subscribeToGlobalModel( controller, "FileshareRoot", "publishName", function ( model )
		local publishName = Engine.GetModelValue( model )
		if publishName then
			GunsmithInputButton.Text:setText( publishName )
		end
	end )
	GunsmithInputButton:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	GunsmithInputButton:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	self:AddButtonCallbackFunction( GunsmithInputButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsMenuInState( menu, "DefaultState" ) then
			FileshareEnterPublishName( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsMenuInState( menu, "DefaultState" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( GunsmithInputButton )
	self.GunsmithInputButton = GunsmithInputButton
	
	local LblName = LUI.UITightText.new()
	LblName:setLeftRight( true, false, 461.96, 661.96 )
	LblName:setTopBottom( true, false, 353, 378 )
	LblName:setText( Engine.Localize( "MENU_FILESHARE_NEWNAME" ) )
	LblName:setTTF( "fonts/default.ttf" )
	self:addElement( LblName )
	self.LblName = LblName
	
	local LblPermissions = LUI.UITightText.new()
	LblPermissions:setLeftRight( true, false, 461.96, 494.96 )
	LblPermissions:setTopBottom( true, false, 419, 444 )
	LblPermissions:setAlpha( 0 )
	LblPermissions:setText( Engine.Localize( "MENU_FILESHARE_PERMISSIONS" ) )
	LblPermissions:setTTF( "fonts/default.ttf" )
	self:addElement( LblPermissions )
	self.LblPermissions = LblPermissions
	
	local BtnPublish = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	BtnPublish:setLeftRight( true, false, 457.96, 737.96 )
	BtnPublish:setTopBottom( true, false, 487, 518 )
	BtnPublish.btnDisplayText:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH" ) )
	BtnPublish.btnDisplayTextStroke:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH" ) )
	BtnPublish:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.ready" ), function ( model )
		local f12_local0 = BtnPublish
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BtnPublish:registerEventHandler( "gain_focus", function ( element, event )
		local f13_local0 = nil
		if element.gainFocus then
			f13_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f13_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f13_local0
	end )
	BtnPublish:registerEventHandler( "lose_focus", function ( element, event )
		local f14_local0 = nil
		if element.loseFocus then
			f14_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f14_local0 = element.super:loseFocus( event )
		end
		return f14_local0
	end )
	self:AddButtonCallbackFunction( BtnPublish, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if FileshareIsReady( controller ) then
			FilesharePublish( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if FileshareIsReady( controller ) then
			return true
		else
			return false
		end
	end, false )
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
	self:addElement( BtnPublish )
	self.BtnPublish = BtnPublish
	
	local AllowDownload0 = CoD.AllowDownload.new( self, controller )
	AllowDownload0:setLeftRight( true, false, 437.33, 457.33 )
	AllowDownload0:setTopBottom( true, false, 450.5, 469.5 )
	AllowDownload0:setAlpha( 0 )
	self:addElement( AllowDownload0 )
	self.AllowDownload0 = AllowDownload0
	
	local FileshareSlotsAvailable0 = CoD.FileshareSlotsAvailable.new( self, controller )
	FileshareSlotsAvailable0:setLeftRight( true, false, 906.5, 1196.5 )
	FileshareSlotsAvailable0:setTopBottom( true, false, 487, 517 )
	self:addElement( FileshareSlotsAvailable0 )
	self.FileshareSlotsAvailable0 = FileshareSlotsAvailable0
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	leftButtonBar:setLeftRight( true, false, 64, 496 )
	leftButtonBar:setTopBottom( true, false, 531, 563 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	local DialogSpinner0 = CoD.DialogSpinner.new( self, controller )
	DialogSpinner0:setLeftRight( true, false, 533.96, 661.96 )
	DialogSpinner0:setTopBottom( true, false, 322.5, 450.5 )
	DialogSpinner0:setAlpha( 0 )
	self:addElement( DialogSpinner0 )
	self.DialogSpinner0 = DialogSpinner0
	
	FullscreenPopupTemplate.navigation = {
		left = GunsmithInputButton,
		down = GunsmithInputButton
	}
	GunsmithInputButton.navigation = {
		up = FullscreenPopupTemplate,
		right = FullscreenPopupTemplate,
		down = BtnPublish
	}
	BtnPublish.navigation = {
		up = FullscreenPopupTemplate,
		right = FullscreenPopupTemplate
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.RedLine:completeAnimation()
				FullscreenPopupTemplate.WorkingTitle:completeAnimation()
				FullscreenPopupTemplate.Title:completeAnimation()
				FullscreenPopupTemplate.Subtitle:completeAnimation()
				self.FullscreenPopupTemplate:setAlpha( 1 )
				self.FullscreenPopupTemplate.RedLine:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_WORKING_TITLE" ) )
				self.FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_TITLE" ) )
				self.FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_DESC" ) )
				self.clipFinished( FullscreenPopupTemplate, {} )
				GunsmithInputButton:completeAnimation()
				self.GunsmithInputButton:setAlpha( 1 )
				self.clipFinished( GunsmithInputButton, {} )
				LblName:completeAnimation()
				self.LblName:setAlpha( 1 )
				self.clipFinished( LblName, {} )
				BtnPublish:completeAnimation()
				self.BtnPublish:setAlpha( 1 )
				self.clipFinished( BtnPublish, {} )
				FileshareSlotsAvailable0:completeAnimation()
				self.FileshareSlotsAvailable0:setAlpha( 1 )
				self.clipFinished( FileshareSlotsAvailable0, {} )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
			end
		},
		Working = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
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
				LblPermissions:completeAnimation()
				self.LblPermissions:setAlpha( 0 )
				self.clipFinished( LblPermissions, {} )
				BtnPublish:completeAnimation()
				self.BtnPublish:setAlpha( 0 )
				self.clipFinished( BtnPublish, {} )
				AllowDownload0:completeAnimation()
				self.AllowDownload0:setAlpha( 0 )
				self.clipFinished( AllowDownload0, {} )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 1 )
				self.clipFinished( DialogSpinner0, {} )
			end
		},
		Fetching = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
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
				LblPermissions:completeAnimation()
				self.LblPermissions:setAlpha( 0 )
				self.clipFinished( LblPermissions, {} )
				BtnPublish:completeAnimation()
				self.BtnPublish:setAlpha( 0 )
				self.clipFinished( BtnPublish, {} )
				AllowDownload0:completeAnimation()
				self.AllowDownload0:setAlpha( 0 )
				self.clipFinished( AllowDownload0, {} )
				FileshareSlotsAvailable0:completeAnimation()
				self.FileshareSlotsAvailable0:setAlpha( 0 )
				self.clipFinished( FileshareSlotsAvailable0, {} )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 1 )
				self.clipFinished( DialogSpinner0, {} )
			end
		},
		SlotsFull = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.RedLine:completeAnimation()
				FullscreenPopupTemplate.WorkingTitle:completeAnimation()
				FullscreenPopupTemplate.Title:completeAnimation()
				FullscreenPopupTemplate.Subtitle:completeAnimation()
				self.FullscreenPopupTemplate:setAlpha( 1 )
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
				LblPermissions:completeAnimation()
				self.LblPermissions:setAlpha( 0 )
				self.clipFinished( LblPermissions, {} )
				BtnPublish:completeAnimation()
				self.BtnPublish:setAlpha( 0 )
				self.clipFinished( BtnPublish, {} )
				AllowDownload0:completeAnimation()
				self.AllowDownload0:setAlpha( 0 )
				self.clipFinished( AllowDownload0, {} )
				FileshareSlotsAvailable0:completeAnimation()
				self.FileshareSlotsAvailable0:setAlpha( 0 )
				self.clipFinished( FileshareSlotsAvailable0, {} )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isPublishing" ), function ( model )
		local f27_local0 = self
		local f27_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isPublishing"
		}
		CoD.Menu.UpdateButtonShownState( f27_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( self, event )
		local f28_local0 = nil
		FileshareHandleKeyboardComplete( self, self, controller, event )
		if not f28_local0 then
			f28_local0 = self:dispatchEventToChildren( event )
		end
		return f28_local0
	end )
	self:registerEventHandler( "fileshare_publish_success", function ( self, event )
		local f29_local0 = nil
		GoBackMultiple( self, controller, "1" )
		FileshareShowPublishSuccessToast( self, self, controller )
		if not f29_local0 then
			f29_local0 = self:dispatchEventToChildren( event )
		end
		return f29_local0
	end )
	self:registerEventHandler( "fileshare_publish_failure", function ( self, event )
		local f30_local0 = nil
		FileshareShowErrorToast( self, self, controller )
		if not f30_local0 then
			f30_local0 = self:dispatchEventToChildren( event )
		end
		return f30_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if not FileshareIsPublishing() then
			GoBack( self, controller )
			ClearMenuSavedState( menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if not FileshareIsPublishing() then
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsMenuInState( self, "SlotsFull" ) then
			SetFocusToElement( self, "FullscreenPopupTemplate", controller )
		elseif IsMenuInState( self, "DefaultState" ) then
			SetFocusToElement( self, "GunsmithInputButton", controller )
		end
	end )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local f34_local0 = self
		if FileshareIsReadyToPublish( controller ) and not FileshareShowcaseSlotsAvailable( controller ) then
			SetState( self, "SlotsFull" )
		elseif FileshareIsReadyToPublish( controller ) and FileshareShowcaseSlotsAvailable( controller ) then
			SetState( self, "DefaultState" )
		end
	end )
	FullscreenPopupTemplate.id = "FullscreenPopupTemplate"
	GunsmithInputButton.id = "GunsmithInputButton"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FullscreenPopupTemplate:close()
		element.GunsmithInputButton:close()
		element.BtnPublish:close()
		element.AllowDownload0:close()
		element.FileshareSlotsAvailable0:close()
		element.leftButtonBar:close()
		element.DialogSpinner0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FilesharePublish.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

