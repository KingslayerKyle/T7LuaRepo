require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithInputButton" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )
require( "ui.uieditor.widgets.FileShare.AllowDownload" )
require( "ui.uieditor.widgets.FileShare.FileshareSlotsAvailable" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

local PreLoadFunc = function ( self, controller )
	CoD.FileshareUtility.SetPublishAllowDownload( true )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.FullscreenPopupTemplate0.navigation = nil
	f2_arg0.InputName.navigation = {
		up = f2_arg0.BtnPublish,
		down = f2_arg0.BtnAllowDownload
	}
	f2_arg0.BtnAllowDownload.navigation = {
		up = f2_arg0.InputName,
		down = f2_arg0.BtnPublish
	}
	f2_arg0.BtnPublish.navigation = {
		up = f2_arg0.BtnAllowDownload,
		down = f2_arg0.InputName
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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FilesharePublish.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate0 = CoD.FullscreenPopupTemplate.new( self, controller )
	FullscreenPopupTemplate0:setLeftRight( true, false, 2.96, 1282.96 )
	FullscreenPopupTemplate0:setTopBottom( true, false, 0, 720 )
	FullscreenPopupTemplate0.Title:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_TITLE" ) )
	FullscreenPopupTemplate0.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_DESC" ) )
	FullscreenPopupTemplate0.WorkingTitle:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_WORKING_TITLE" ) )
	FullscreenPopupTemplate0.DoneTitle:setText( Engine.Localize( "MENU_NEW" ) )
	FullscreenPopupTemplate0.ErrorSubtitle:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_ERROR" ) )
	FullscreenPopupTemplate0:mergeStateConditions( {
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
	FullscreenPopupTemplate0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isPublishing" ), function ( model )
		self:updateElementState( FullscreenPopupTemplate0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isPublishing"
		} )
	end )
	self:addElement( FullscreenPopupTemplate0 )
	self.FullscreenPopupTemplate0 = FullscreenPopupTemplate0
	
	local InputName = CoD.GunsmithInputButton.new( self, controller )
	InputName:setLeftRight( true, false, 461.96, 823.96 )
	InputName:setTopBottom( true, false, 378, 412 )
	InputName:subscribeToGlobalModel( controller, "FileshareRoot", "publishName", function ( model )
		local publishName = Engine.GetModelValue( model )
		if publishName then
			InputName.Text:setText( publishName )
		end
	end )
	InputName:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	InputName:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
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
	
	local LblPermissions = LUI.UITightText.new()
	LblPermissions:setLeftRight( true, false, 461.96, 494.96 )
	LblPermissions:setTopBottom( true, false, 419, 444 )
	LblPermissions:setText( Engine.Localize( "MENU_FILESHARE_PERMISSIONS" ) )
	LblPermissions:setTTF( "fonts/default.ttf" )
	self:addElement( LblPermissions )
	self.LblPermissions = LblPermissions
	
	local BtnAllowDownload = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	BtnAllowDownload:setLeftRight( true, false, 461.96, 741.96 )
	BtnAllowDownload:setTopBottom( true, false, 444, 476 )
	BtnAllowDownload.btnDisplayText:setText( Engine.Localize( "MENU_FILESHARE_ALLOW_DOWNLOAD" ) )
	BtnAllowDownload.btnDisplayTextStroke:setText( Engine.Localize( "MENU_FILESHARE_ALLOW_DOWNLOAD" ) )
	BtnAllowDownload:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f12_local0
	end )
	BtnAllowDownload:registerEventHandler( "lose_focus", function ( element, event )
		local f13_local0 = nil
		if element.loseFocus then
			f13_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f13_local0 = element.super:loseFocus( event )
		end
		return f13_local0
	end )
	self:AddButtonCallbackFunction( BtnAllowDownload, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		FileshareToggleAllowDownload( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BtnAllowDownload )
	self.BtnAllowDownload = BtnAllowDownload
	
	local BtnPublish = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	BtnPublish:setLeftRight( true, false, 461.96, 741.96 )
	BtnPublish:setTopBottom( true, false, 501, 532 )
	BtnPublish.btnDisplayText:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH" ) )
	BtnPublish.btnDisplayTextStroke:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH" ) )
	BtnPublish:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.ready" ), function ( model )
		local f16_local0 = BtnPublish
		local f16_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		}
		CoD.Menu.UpdateButtonShownState( f16_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BtnPublish:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f17_local0
	end )
	BtnPublish:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
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
	self:addElement( AllowDownload0 )
	self.AllowDownload0 = AllowDownload0
	
	local FileshareSlotsAvailable0 = CoD.FileshareSlotsAvailable.new( self, controller )
	FileshareSlotsAvailable0:setLeftRight( true, false, 906.5, 1143.5 )
	FileshareSlotsAvailable0:setTopBottom( true, false, 501, 531 )
	self:addElement( FileshareSlotsAvailable0 )
	self.FileshareSlotsAvailable0 = FileshareSlotsAvailable0
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	leftButtonBar:setLeftRight( true, false, 64, 496 )
	leftButtonBar:setTopBottom( true, false, 564.11, 596.11 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	FullscreenPopupTemplate0.navigation = {
		left = InputName,
		down = InputName
	}
	InputName.navigation = {
		up = FullscreenPopupTemplate0,
		right = FullscreenPopupTemplate0,
		down = BtnAllowDownload
	}
	BtnAllowDownload.navigation = {
		up = FullscreenPopupTemplate0,
		right = FullscreenPopupTemplate0,
		down = BtnPublish
	}
	BtnPublish.navigation = {
		up = FullscreenPopupTemplate0,
		right = FullscreenPopupTemplate0
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Working = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				InputName:completeAnimation()
				self.InputName:setAlpha( 0 )
				self.clipFinished( InputName, {} )
				LblName:completeAnimation()
				self.LblName:setAlpha( 0 )
				self.clipFinished( LblName, {} )
				LblPermissions:completeAnimation()
				self.LblPermissions:setAlpha( 0 )
				self.clipFinished( LblPermissions, {} )
				BtnAllowDownload:completeAnimation()
				self.BtnAllowDownload:setAlpha( 0 )
				self.clipFinished( BtnAllowDownload, {} )
				BtnPublish:completeAnimation()
				self.BtnPublish:setAlpha( 0 )
				self.clipFinished( BtnPublish, {} )
				AllowDownload0:completeAnimation()
				self.AllowDownload0:setAlpha( 0 )
				self.clipFinished( AllowDownload0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Working",
			condition = function ( menu, element, event )
				return FileshareIsPublishing()
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
		GoBackMultiple( self, controller, "2" )
		if not f29_local0 then
			f29_local0 = self:dispatchEventToChildren( event )
		end
		return f29_local0
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	FullscreenPopupTemplate0.id = "FullscreenPopupTemplate0"
	InputName.id = "InputName"
	BtnAllowDownload.id = "BtnAllowDownload"
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
	if not self:restoreState() then
		self.InputName:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FullscreenPopupTemplate0:close()
		element.InputName:close()
		element.BtnAllowDownload:close()
		element.BtnPublish:close()
		element.AllowDownload0:close()
		element.FileshareSlotsAvailable0:close()
		element.leftButtonBar:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FilesharePublish.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

