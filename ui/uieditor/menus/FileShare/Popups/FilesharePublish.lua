-- 27a66debe1c1e6fd10ef5c2f39ba080a
-- This hash is used for caching, delete to decompile the file again

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
		down = f2_arg0.inputDescription
	}
	f2_arg0.inputDescription.navigation = {
		up = f2_arg0.GunsmithInputButton,
		down = f2_arg0.BtnPublish
	}
	f2_arg0.BtnPublish.navigation = {
		up = f2_arg0.inputDescription,
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
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate = CoD.FullscreenPopupTemplate.new( f3_local1, controller )
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
		f3_local1:updateElementState( FullscreenPopupTemplate, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isPublishing"
		} )
	end )
	self:addElement( FullscreenPopupTemplate )
	self.FullscreenPopupTemplate = FullscreenPopupTemplate
	
	local GunsmithInputButton = CoD.GunsmithInputButton.new( f3_local1, controller )
	GunsmithInputButton:setLeftRight( true, false, 457.96, 819.96 )
	GunsmithInputButton:setTopBottom( true, false, 382, 416 )
	GunsmithInputButton.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
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
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	f3_local1:AddButtonCallbackFunction( GunsmithInputButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if IsMenuInState( f10_arg1, "DefaultState" ) and FileshareCanEditNameAndDescription( f10_arg2 ) then
			FileshareEnterPublishName( self, f10_arg0, f10_arg2 )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		if IsMenuInState( f11_arg1, "DefaultState" ) and FileshareCanEditNameAndDescription( f11_arg2 ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	GunsmithInputButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return FileshareIsLocalCategory( controller )
			end
		}
	} )
	self:addElement( GunsmithInputButton )
	self.GunsmithInputButton = GunsmithInputButton
	
	local LblName = LUI.UITightText.new()
	LblName:setLeftRight( true, false, 461.96, 661.96 )
	LblName:setTopBottom( true, false, 353, 378 )
	LblName:setText( Engine.Localize( "MENU_FILESHARE_NEWNAME" ) )
	LblName:setTTF( "fonts/default.ttf" )
	self:addElement( LblName )
	self.LblName = LblName
	
	local inputDescription = CoD.GunsmithInputButton.new( f3_local1, controller )
	inputDescription:setLeftRight( true, false, 457.96, 1218 )
	inputDescription:setTopBottom( true, false, 448, 482 )
	inputDescription.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	inputDescription:subscribeToGlobalModel( controller, "FileshareRoot", "publishDescription", function ( model )
		local publishDescription = Engine.GetModelValue( model )
		if publishDescription then
			inputDescription.Text:setText( publishDescription )
		end
	end )
	inputDescription:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f14_local0
	end )
	inputDescription:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	f3_local1:AddButtonCallbackFunction( inputDescription, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if IsMenuInState( f16_arg1, "DefaultState" ) and FileshareCanEditNameAndDescription( f16_arg2 ) then
			FileshareEnterPublishDescription( self, f16_arg0, f16_arg2 )
			return true
		else
			
		end
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		if IsMenuInState( f17_arg1, "DefaultState" ) and FileshareCanEditNameAndDescription( f17_arg2 ) then
			CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( inputDescription )
	self.inputDescription = inputDescription
	
	local descriptionText = LUI.UIText.new()
	descriptionText:setLeftRight( true, false, 461.96, 1196.5 )
	descriptionText:setTopBottom( true, false, 419, 444 )
	descriptionText:setText( Engine.Localize( "MPUI_DESCRIPTION" ) )
	descriptionText:setTTF( "fonts/default.ttf" )
	descriptionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	descriptionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( descriptionText )
	self.descriptionText = descriptionText
	
	local LblPermissions = LUI.UITightText.new()
	LblPermissions:setLeftRight( true, false, 461.96, 494.96 )
	LblPermissions:setTopBottom( true, false, 419, 444 )
	LblPermissions:setAlpha( 0 )
	LblPermissions:setText( Engine.Localize( "MENU_FILESHARE_PERMISSIONS" ) )
	LblPermissions:setTTF( "fonts/default.ttf" )
	self:addElement( LblPermissions )
	self.LblPermissions = LblPermissions
	
	local BtnPublish = CoD.List1ButtonLarge_Left_ND.new( f3_local1, controller )
	BtnPublish:setLeftRight( true, false, 457.96, 737.96 )
	BtnPublish:setTopBottom( true, false, 487, 518 )
	BtnPublish.btnDisplayText:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH" ) )
	BtnPublish.btnDisplayTextStroke:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH" ) )
	BtnPublish:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.ready" ), function ( model )
		local f18_local0 = BtnPublish
		local f18_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		}
		CoD.Menu.UpdateButtonShownState( f18_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BtnPublish:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isPublishing" ), function ( model )
		local f19_local0 = BtnPublish
		local f19_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isPublishing"
		}
		CoD.Menu.UpdateButtonShownState( f19_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BtnPublish:registerEventHandler( "gain_focus", function ( element, event )
		local f20_local0 = nil
		if element.gainFocus then
			f20_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f20_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f20_local0
	end )
	BtnPublish:registerEventHandler( "lose_focus", function ( element, event )
		local f21_local0 = nil
		if element.loseFocus then
			f21_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f21_local0 = element.super:loseFocus( event )
		end
		return f21_local0
	end )
	f3_local1:AddButtonCallbackFunction( BtnPublish, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		if FileshareIsReady( f22_arg2 ) and not FileshareIsPublishing() then
			FilesharePublish( self, f22_arg0, f22_arg2 )
			return true
		else
			
		end
	end, function ( f23_arg0, f23_arg1, f23_arg2 )
		if FileshareIsReady( f23_arg2 ) and not FileshareIsPublishing() then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		f3_local1:updateElementState( BtnPublish, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		} )
	end )
	self:addElement( BtnPublish )
	self.BtnPublish = BtnPublish
	
	local AllowDownload0 = CoD.AllowDownload.new( f3_local1, controller )
	AllowDownload0:setLeftRight( true, false, 437.33, 457.33 )
	AllowDownload0:setTopBottom( true, false, 450.5, 469.5 )
	AllowDownload0:setAlpha( 0 )
	self:addElement( AllowDownload0 )
	self.AllowDownload0 = AllowDownload0
	
	local FileshareSlotsAvailable0 = CoD.FileshareSlotsAvailable.new( f3_local1, controller )
	FileshareSlotsAvailable0:setLeftRight( true, false, 906.5, 1196.5 )
	FileshareSlotsAvailable0:setTopBottom( true, false, 487, 517 )
	self:addElement( FileshareSlotsAvailable0 )
	self.FileshareSlotsAvailable0 = FileshareSlotsAvailable0
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( f3_local1, controller )
	leftButtonBar:setLeftRight( true, false, 443, 875 )
	leftButtonBar:setTopBottom( true, false, 531, 563 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	local DialogSpinner0 = CoD.DialogSpinner.new( f3_local1, controller )
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
	
	FullscreenPopupTemplate.navigation = {
		left = GunsmithInputButton,
		right = inputDescription,
		down = GunsmithInputButton
	}
	GunsmithInputButton.navigation = {
		up = FullscreenPopupTemplate,
		right = FullscreenPopupTemplate,
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
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
				inputDescription:completeAnimation()
				self.inputDescription:setAlpha( 1 )
				self.clipFinished( inputDescription, {} )
				descriptionText:completeAnimation()
				self.descriptionText:setAlpha( 1 )
				self.clipFinished( descriptionText, {} )
				BtnPublish:completeAnimation()
				self.BtnPublish:setAlpha( 1 )
				self.clipFinished( BtnPublish, {} )
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
			end
		},
		Working = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
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
				OutofVariant:completeAnimation()
				self.OutofVariant:setAlpha( 0 )
				self.clipFinished( OutofVariant, {} )
			end
		},
		Fetching = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
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
				OutofVariant:completeAnimation()
				self.OutofVariant:setAlpha( 0 )
				self.clipFinished( OutofVariant, {} )
			end
		},
		SlotsFull = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
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
				inputDescription:completeAnimation()
				self.inputDescription:setAlpha( 0 )
				self.clipFinished( inputDescription, {} )
				descriptionText:completeAnimation()
				self.descriptionText:setAlpha( 0 )
				self.clipFinished( descriptionText, {} )
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
				OutofVariant:completeAnimation()
				self.OutofVariant:setAlpha( 0.6 )
				self.clipFinished( OutofVariant, {} )
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
		f3_local1:updateElementState( self, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isPublishing"
		} )
	end )
	CoD.Menu.AddNavigationHandler( f3_local1, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f34_local0 = nil
		FileshareHandleKeyboardComplete( self, element, controller, event )
		if not f34_local0 then
			f34_local0 = element:dispatchEventToChildren( event )
		end
		return f34_local0
	end )
	self:registerEventHandler( "fileshare_publish_success", function ( element, event )
		local f35_local0 = nil
		GoBackMultiple( self, controller, "1" )
		FileshareShowPublishSuccessToast( self, element, controller )
		FileshareRestoreToPreviousCategory( controller )
		FileshareRecordPublishEvent( controller )
		if not f35_local0 then
			f35_local0 = element:dispatchEventToChildren( event )
		end
		return f35_local0
	end )
	self:registerEventHandler( "fileshare_publish_failure", function ( element, event )
		local f36_local0 = nil
		GoBack( self, controller )
		FileshareShowErrorToast( self, element, controller )
		if not f36_local0 then
			f36_local0 = element:dispatchEventToChildren( event )
		end
		return f36_local0
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
		GoBack( self, f37_arg2 )
		ClearMenuSavedState( f37_arg1 )
		FileshareRestoreToPreviousCategory( f37_arg2 )
		return true
	end, function ( f38_arg0, f38_arg1, f38_arg2 )
		CoD.Menu.SetButtonLabel( f38_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsMenuInState( f3_local1, "SlotsFull" ) then
			SetFocusToElement( self, "FullscreenPopupTemplate", controller )
		elseif IsMenuInState( f3_local1, "DefaultState" ) then
			SetFocusToElement( self, "GunsmithInputButton", controller )
		end
	end )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local f40_local0 = self
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
		menu = f3_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FullscreenPopupTemplate:close()
		element.GunsmithInputButton:close()
		element.inputDescription:close()
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

