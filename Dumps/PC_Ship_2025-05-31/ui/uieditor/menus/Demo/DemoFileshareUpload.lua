require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithInputButton" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )
require( "ui.uieditor.widgets.FileShare.AllowDownload" )
require( "ui.uieditor.widgets.FileShare.FileshareSlotsAvailable" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.GenericPopups.DialogSpinner" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.FullscreenPopupTemplate.navigation = nil
	f1_arg0.GunsmithInputButton.navigation = {
		up = nil,
		down = f1_arg0.inputDescription
	}
	f1_arg0.inputDescription.navigation = {
		up = f1_arg0.GunsmithInputButton,
		down = f1_arg0.BtnUpload
	}
	f1_arg0.BtnUpload.navigation = {
		up = f1_arg0.inputDescription,
		down = nil
	}
end

LUI.createMenu.DemoFileshareUpload = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "DemoFileshareUpload" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "DemoFileshareUpload.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate = CoD.FullscreenPopupTemplate.new( self, controller )
	FullscreenPopupTemplate:setLeftRight( true, false, -3.04, 1280.96 )
	FullscreenPopupTemplate:setTopBottom( true, false, 0, 720 )
	FullscreenPopupTemplate.ButtonList:setDataSource( "FileshareSlotsFullButtonList" )
	FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_FILESHARE_UPLOAD_WORKING_TITLE" ) )
	FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_FILESHARE_UPLOAD_TITLE" ) )
	FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_UPLOAD_DESC" ) )
	FullscreenPopupTemplate.DoneTitle:setText( Engine.Localize( "MENU_NEW" ) )
	FullscreenPopupTemplate.ErrorSubtitle:setText( Engine.Localize( "MENU_FILESHARE_UPLOAD_ERROR" ) )
	FullscreenPopupTemplate:mergeStateConditions( {
		{
			stateName = "WorkingState",
			condition = function ( menu, element, event )
				return FileshareIsUploading()
			end
		},
		{
			stateName = "ErrorState",
			condition = function ( menu, element, event )
				return FileshareIsUploadingInError()
			end
		}
	} )
	FullscreenPopupTemplate:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isUploading" ), function ( model )
		self:updateElementState( FullscreenPopupTemplate, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isUploading"
		} )
	end )
	self:addElement( FullscreenPopupTemplate )
	self.FullscreenPopupTemplate = FullscreenPopupTemplate
	
	local inputDescription = CoD.GunsmithInputButton.new( self, controller )
	inputDescription:setLeftRight( true, false, 457.96, 1218 )
	inputDescription:setTopBottom( true, false, 427, 461 )
	inputDescription.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	inputDescription:subscribeToGlobalModel( controller, "Demo", "savePopupDescription", function ( model )
		local savePopupDescription = Engine.GetModelValue( model )
		if savePopupDescription then
			inputDescription.Text:setText( savePopupDescription )
		end
	end )
	inputDescription:registerEventHandler( "demo_keyboard_complete", function ( element, event )
		local f7_local0 = nil
		HandleDemoKeyboardComplete( self, element, controller, event )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	inputDescription:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	inputDescription:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	self:AddButtonCallbackFunction( inputDescription, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsMenuInState( menu, "DefaultState" ) then
			OpenDemoSaveKeyboard( self, element, controller, "desc" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsMenuInState( menu, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( inputDescription )
	self.inputDescription = inputDescription
	
	local descriptionText = LUI.UIText.new()
	descriptionText:setLeftRight( true, false, 461.96, 1196.5 )
	descriptionText:setTopBottom( true, false, 398, 423 )
	descriptionText:setText( Engine.Localize( "MPUI_DESCRIPTION" ) )
	descriptionText:setTTF( "fonts/default.ttf" )
	descriptionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	descriptionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( descriptionText )
	self.descriptionText = descriptionText
	
	local GunsmithInputButton = CoD.GunsmithInputButton.new( self, controller )
	GunsmithInputButton:setLeftRight( true, false, 457.96, 819.96 )
	GunsmithInputButton:setTopBottom( true, false, 361, 395 )
	GunsmithInputButton.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	GunsmithInputButton:subscribeToGlobalModel( controller, "Demo", "savePopupTitle", function ( model )
		local savePopupTitle = Engine.GetModelValue( model )
		if savePopupTitle then
			GunsmithInputButton.Text:setText( savePopupTitle )
		end
	end )
	GunsmithInputButton:registerEventHandler( "demo_keyboard_complete", function ( element, event )
		local f13_local0 = nil
		HandleDemoKeyboardComplete( self, element, controller, event )
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	GunsmithInputButton:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f14_local0
	end )
	GunsmithInputButton:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	self:AddButtonCallbackFunction( GunsmithInputButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsMenuInState( menu, "DefaultState" ) then
			OpenDemoSaveKeyboard( self, element, controller, "name" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsMenuInState( menu, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( GunsmithInputButton )
	self.GunsmithInputButton = GunsmithInputButton
	
	local titleText = LUI.UIText.new()
	titleText:setLeftRight( true, false, 461.96, 815.96 )
	titleText:setTopBottom( true, false, 332, 357 )
	titleText:setText( Engine.Localize( "MPUI_TITLE" ) )
	titleText:setTTF( "fonts/default.ttf" )
	titleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	titleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( titleText )
	self.titleText = titleText
	
	local LblPermissions = LUI.UITightText.new()
	LblPermissions:setLeftRight( true, false, 461.96, 494.96 )
	LblPermissions:setTopBottom( true, false, 419, 444 )
	LblPermissions:setAlpha( 0 )
	LblPermissions:setText( Engine.Localize( "MENU_FILESHARE_PERMISSIONS" ) )
	LblPermissions:setTTF( "fonts/default.ttf" )
	self:addElement( LblPermissions )
	self.LblPermissions = LblPermissions
	
	local BtnUpload = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	BtnUpload:setLeftRight( true, false, 457.96, 819.96 )
	BtnUpload:setTopBottom( true, false, 476.5, 507.5 )
	BtnUpload.btnDisplayText:setText( Engine.Localize( "MENU_FILESHARE_UPLOAD_CAPS" ) )
	BtnUpload.btnDisplayTextStroke:setText( Engine.Localize( "MENU_FILESHARE_UPLOAD_CAPS" ) )
	BtnUpload:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.ready" ), function ( model )
		local f18_local0 = BtnUpload
		local f18_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		}
		CoD.Menu.UpdateButtonShownState( f18_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BtnUpload:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isUploading" ), function ( model )
		local f19_local0 = BtnUpload
		local f19_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isUploading"
		}
		CoD.Menu.UpdateButtonShownState( f19_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BtnUpload:registerEventHandler( "gain_focus", function ( element, event )
		local f20_local0 = nil
		if element.gainFocus then
			f20_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f20_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f20_local0
	end )
	BtnUpload:registerEventHandler( "lose_focus", function ( element, event )
		local f21_local0 = nil
		if element.loseFocus then
			f21_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f21_local0 = element.super:loseFocus( event )
		end
		return f21_local0
	end )
	self:AddButtonCallbackFunction( BtnUpload, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if FileshareIsReady( controller ) and not FileshareIsUploading() then
			FilesharePrivateUpload( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if FileshareIsReady( controller ) and not FileshareIsUploading() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	BtnUpload:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not FileshareIsReady( controller )
			end
		}
	} )
	BtnUpload:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.ready" ), function ( model )
		self:updateElementState( BtnUpload, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		} )
	end )
	self:addElement( BtnUpload )
	self.BtnUpload = BtnUpload
	
	local AllowDownload0 = CoD.AllowDownload.new( self, controller )
	AllowDownload0:setLeftRight( true, false, 437.33, 457.33 )
	AllowDownload0:setTopBottom( true, false, 450.5, 469.5 )
	AllowDownload0:setAlpha( 0 )
	self:addElement( AllowDownload0 )
	self.AllowDownload0 = AllowDownload0
	
	local FileshareSlotsAvailable0 = CoD.FileshareSlotsAvailable.new( self, controller )
	FileshareSlotsAvailable0:setLeftRight( true, false, 926, 1216 )
	FileshareSlotsAvailable0:setTopBottom( true, false, 476.5, 506.5 )
	self:addElement( FileshareSlotsAvailable0 )
	self.FileshareSlotsAvailable0 = FileshareSlotsAvailable0
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	leftButtonBar:setLeftRight( true, false, 445.96, 877.96 )
	leftButtonBar:setTopBottom( true, false, 523.25, 555.25 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	local DialogSpinner0 = CoD.DialogSpinner.new( self, controller )
	DialogSpinner0:setLeftRight( true, false, 533.96, 661.96 )
	DialogSpinner0:setTopBottom( true, false, 322.5, 450.5 )
	DialogSpinner0:setAlpha( 0 )
	self:addElement( DialogSpinner0 )
	self.DialogSpinner0 = DialogSpinner0
	
	local OutofVariant = LUI.UIImage.new()
	OutofVariant:setLeftRight( true, false, -3.04, 544.33 )
	OutofVariant:setTopBottom( true, false, 211.75, 523.25 )
	OutofVariant:setAlpha( 0.6 )
	OutofVariant:setImage( RegisterImage( "uie_t7_icon_novariant_bkg_overlays" ) )
	OutofVariant:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutofVariant )
	self.OutofVariant = OutofVariant
	
	local Thumbnail = LUI.UIElement.new()
	Thumbnail:setLeftRight( true, false, 73, 385 )
	Thumbnail:setTopBottom( true, false, 236.5, 419 )
	Thumbnail:subscribeToGlobalModel( controller, "Demo", "savePopupThumbnailFileId", function ( model )
		local savePopupThumbnailFileId = Engine.GetModelValue( model )
		if savePopupThumbnailFileId then
			Thumbnail:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_THUMBNAIL", savePopupThumbnailFileId ) )
		end
	end )
	self:addElement( Thumbnail )
	self.Thumbnail = Thumbnail
	
	local GametypeOnMapName = LUI.UIText.new()
	GametypeOnMapName:setLeftRight( true, false, 73, 385 )
	GametypeOnMapName:setTopBottom( true, false, 431.5, 456.5 )
	GametypeOnMapName:setText( Engine.Localize( GetGameModeOnMapName( "Domination on Stronghold" ) ) )
	GametypeOnMapName:setTTF( "fonts/default.ttf" )
	GametypeOnMapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GametypeOnMapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GametypeOnMapName )
	self.GametypeOnMapName = GametypeOnMapName
	
	FullscreenPopupTemplate.navigation = {
		left = GunsmithInputButton,
		right = inputDescription,
		down = GunsmithInputButton
	}
	inputDescription.navigation = {
		left = FullscreenPopupTemplate,
		up = FullscreenPopupTemplate,
		down = BtnUpload
	}
	GunsmithInputButton.navigation = {
		up = FullscreenPopupTemplate,
		right = FullscreenPopupTemplate,
		down = inputDescription
	}
	BtnUpload.navigation = {
		up = FullscreenPopupTemplate,
		right = FullscreenPopupTemplate
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.RedLine:completeAnimation()
				FullscreenPopupTemplate.WorkingTitle:completeAnimation()
				FullscreenPopupTemplate.Title:completeAnimation()
				FullscreenPopupTemplate.Subtitle:completeAnimation()
				self.FullscreenPopupTemplate:setAlpha( 1 )
				self.FullscreenPopupTemplate.RedLine:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_FILESHARE_UPLOAD_WORKING_TITLE" ) )
				self.FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_FILESHARE_UPLOAD_TITLE" ) )
				self.FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_UPLOAD_DESC" ) )
				self.clipFinished( FullscreenPopupTemplate, {} )
				inputDescription:completeAnimation()
				self.inputDescription:setAlpha( 1 )
				self.clipFinished( inputDescription, {} )
				descriptionText:completeAnimation()
				self.descriptionText:setAlpha( 1 )
				self.clipFinished( descriptionText, {} )
				GunsmithInputButton:completeAnimation()
				self.GunsmithInputButton:setAlpha( 1 )
				self.clipFinished( GunsmithInputButton, {} )
				titleText:completeAnimation()
				self.titleText:setAlpha( 1 )
				self.clipFinished( titleText, {} )
				BtnUpload:completeAnimation()
				self.BtnUpload:setAlpha( 1 )
				self.clipFinished( BtnUpload, {} )
				FileshareSlotsAvailable0:completeAnimation()
				self.FileshareSlotsAvailable0:setAlpha( 1 )
				self.clipFinished( FileshareSlotsAvailable0, {} )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
				OutofVariant:completeAnimation()
				self.OutofVariant:setAlpha( 0 )
				self.OutofVariant:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( OutofVariant, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 1 )
				self.clipFinished( Thumbnail, {} )
			end
		},
		Working = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.RedLine:completeAnimation()
				self.FullscreenPopupTemplate.RedLine:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( FullscreenPopupTemplate, {} )
				inputDescription:completeAnimation()
				self.inputDescription:setAlpha( 0 )
				self.clipFinished( inputDescription, {} )
				descriptionText:completeAnimation()
				self.descriptionText:setAlpha( 0 )
				self.clipFinished( descriptionText, {} )
				GunsmithInputButton:completeAnimation()
				self.GunsmithInputButton:setAlpha( 0 )
				self.clipFinished( GunsmithInputButton, {} )
				titleText:completeAnimation()
				self.titleText:setAlpha( 0 )
				self.clipFinished( titleText, {} )
				LblPermissions:completeAnimation()
				self.LblPermissions:setAlpha( 0 )
				self.clipFinished( LblPermissions, {} )
				BtnUpload:completeAnimation()
				self.BtnUpload:setAlpha( 0 )
				self.clipFinished( BtnUpload, {} )
				AllowDownload0:completeAnimation()
				self.AllowDownload0:setAlpha( 0 )
				self.clipFinished( AllowDownload0, {} )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 1 )
				self.clipFinished( DialogSpinner0, {} )
				OutofVariant:completeAnimation()
				self.OutofVariant:setAlpha( 0 )
				self.clipFinished( OutofVariant, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )
			end
		},
		Fetching = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.RedLine:completeAnimation()
				FullscreenPopupTemplate.WorkingTitle:completeAnimation()
				FullscreenPopupTemplate.Title:completeAnimation()
				FullscreenPopupTemplate.Subtitle:completeAnimation()
				FullscreenPopupTemplate.DoneTitle:completeAnimation()
				self.FullscreenPopupTemplate.RedLine:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_FILESHARE_WAITING_LOCAL" ) )
				self.FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_FILESHARE_WAITING_LOCAL" ) )
				self.FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "0" ) )
				self.FullscreenPopupTemplate.DoneTitle:setText( Engine.Localize( "0" ) )
				self.clipFinished( FullscreenPopupTemplate, {} )
				inputDescription:completeAnimation()
				self.inputDescription:setAlpha( 0 )
				self.clipFinished( inputDescription, {} )
				descriptionText:completeAnimation()
				self.descriptionText:setAlpha( 0 )
				self.clipFinished( descriptionText, {} )
				GunsmithInputButton:completeAnimation()
				self.GunsmithInputButton:setAlpha( 0 )
				self.clipFinished( GunsmithInputButton, {} )
				titleText:completeAnimation()
				self.titleText:setAlpha( 0 )
				self.clipFinished( titleText, {} )
				LblPermissions:completeAnimation()
				self.LblPermissions:setAlpha( 0 )
				self.clipFinished( LblPermissions, {} )
				BtnUpload:completeAnimation()
				self.BtnUpload:setAlpha( 0 )
				self.clipFinished( BtnUpload, {} )
				AllowDownload0:completeAnimation()
				self.AllowDownload0:setAlpha( 0 )
				self.clipFinished( AllowDownload0, {} )
				FileshareSlotsAvailable0:completeAnimation()
				self.FileshareSlotsAvailable0:setAlpha( 0 )
				self.clipFinished( FileshareSlotsAvailable0, {} )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 1 )
				self.clipFinished( DialogSpinner0, {} )
				OutofVariant:completeAnimation()
				self.OutofVariant:setAlpha( 0 )
				self.clipFinished( OutofVariant, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )
			end
		},
		SlotsFull = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.RedLine:completeAnimation()
				FullscreenPopupTemplate.WorkingTitle:completeAnimation()
				FullscreenPopupTemplate.Title:completeAnimation()
				FullscreenPopupTemplate.Subtitle:completeAnimation()
				self.FullscreenPopupTemplate:setAlpha( 1 )
				self.FullscreenPopupTemplate.RedLine:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "0" ) )
				self.FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_FILESHARE_SLOTS_FULL_TITLE" ) )
				self.FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_MEDIA_MANAGER_SLOTS_FULL_DESC" ) )
				self.clipFinished( FullscreenPopupTemplate, {} )
				inputDescription:completeAnimation()
				self.inputDescription:setAlpha( 0 )
				self.clipFinished( inputDescription, {} )
				descriptionText:completeAnimation()
				self.descriptionText:setAlpha( 0 )
				self.clipFinished( descriptionText, {} )
				GunsmithInputButton:completeAnimation()
				self.GunsmithInputButton:setAlpha( 0 )
				self.clipFinished( GunsmithInputButton, {} )
				titleText:completeAnimation()
				self.titleText:setAlpha( 0 )
				self.clipFinished( titleText, {} )
				LblPermissions:completeAnimation()
				self.LblPermissions:setAlpha( 0 )
				self.clipFinished( LblPermissions, {} )
				BtnUpload:completeAnimation()
				self.BtnUpload:setAlpha( 0 )
				self.clipFinished( BtnUpload, {} )
				AllowDownload0:completeAnimation()
				self.AllowDownload0:setAlpha( 0 )
				self.clipFinished( AllowDownload0, {} )
				FileshareSlotsAvailable0:completeAnimation()
				self.FileshareSlotsAvailable0:setAlpha( 0 )
				self.clipFinished( FileshareSlotsAvailable0, {} )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
				OutofVariant:completeAnimation()
				self.OutofVariant:setAlpha( 0.6 )
				self.clipFinished( OutofVariant, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Working",
			condition = function ( menu, element, event )
				return FileshareIsUploading()
			end
		},
		{
			stateName = "Fetching",
			condition = function ( menu, element, event )
				return not FileshareIsReadyToUpload( controller )
			end
		},
		{
			stateName = "SlotsFull",
			condition = function ( menu, element, event )
				return FileshareIsReadyToUpload( controller ) and not FileshareShowcaseSlotsAvailable( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isUploading" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isUploading"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "fileshare_upload_success", function ( self, event )
		local f35_local0 = nil
		UploadClip_GoBack( self, self, controller, self )
		FileshareShowUploadSuccessToast( self, self, controller )
		FileshareRecordSaveEvent( controller )
		if not f35_local0 then
			f35_local0 = self:dispatchEventToChildren( event )
		end
		return f35_local0
	end )
	self:registerEventHandler( "fileshare_upload_failure", function ( self, event )
		local f36_local0 = nil
		FileshareShowErrorToast( self, self, controller )
		if not f36_local0 then
			f36_local0 = self:dispatchEventToChildren( event )
		end
		return f36_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		UploadClip_GoBack( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsMenuInState( self, "SlotsFull" ) then
			SetFocusToElement( self, "FullscreenPopupTemplate", controller )
		elseif IsMenuInState( self, "DefaultState" ) then
			SetFocusToElement( self, "GunsmithInputButton", controller )
		end
	end )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local f40_local0 = self
		if FileshareIsReadyToUpload( controller ) and not FileshareShowcaseSlotsAvailable( controller ) then
			SetState( self, "SlotsFull" )
		elseif FileshareIsReadyToUpload( controller ) and FileshareShowcaseSlotsAvailable( controller ) then
			SetState( self, "DefaultState" )
		end
	end )
	FullscreenPopupTemplate.id = "FullscreenPopupTemplate"
	inputDescription.id = "inputDescription"
	GunsmithInputButton.id = "GunsmithInputButton"
	BtnUpload.id = "BtnUpload"
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
		element.inputDescription:close()
		element.GunsmithInputButton:close()
		element.BtnUpload:close()
		element.AllowDownload0:close()
		element.FileshareSlotsAvailable0:close()
		element.leftButtonBar:close()
		element.DialogSpinner0:close()
		element.Thumbnail:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "DemoFileshareUpload.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

