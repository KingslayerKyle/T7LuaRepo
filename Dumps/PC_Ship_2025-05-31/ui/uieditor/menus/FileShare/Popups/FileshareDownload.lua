require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithInputButton" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.MediaManager.LocalMediaSlotsAvailable" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.FullscreenPopupTemplate0.navigation = nil
	f1_arg0.InputName.navigation = {
		up = f1_arg0.BtnPublish,
		down = f1_arg0.BtnPublish
	}
	f1_arg0.BtnPublish.navigation = {
		up = f1_arg0.InputName,
		down = f1_arg0.InputName
	}
end

LUI.createMenu.FileshareDownload = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FileshareDownload" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FileshareDownload.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate0 = CoD.FullscreenPopupTemplate.new( self, controller )
	FullscreenPopupTemplate0:setLeftRight( true, false, 2.96, 1282.96 )
	FullscreenPopupTemplate0:setTopBottom( true, false, 0, 720 )
	FullscreenPopupTemplate0.WorkingTitle:setText( Engine.Localize( "MENU_FILESHARE_DOWNLOAD_WORKING_TITLE" ) )
	FullscreenPopupTemplate0.Title:setText( Engine.Localize( "MENU_FILESHARE_DOWNLOAD_TITLE" ) )
	FullscreenPopupTemplate0.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_DOWNLOAD_DESC" ) )
	FullscreenPopupTemplate0.DoneTitle:setText( Engine.Localize( "MENU_NEW" ) )
	FullscreenPopupTemplate0.ErrorSubtitle:setText( Engine.Localize( "MENU_FILESHARE_DOWNLOAD_ERROR" ) )
	FullscreenPopupTemplate0:mergeStateConditions( {
		{
			stateName = "WorkingState",
			condition = function ( menu, element, event )
				return FileshareIsDownloading()
			end
		},
		{
			stateName = "ErrorState",
			condition = function ( menu, element, event )
				return FileshareIsDownloadingInError()
			end
		}
	} )
	FullscreenPopupTemplate0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isDownloading" ), function ( model )
		self:updateElementState( FullscreenPopupTemplate0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isDownloading"
		} )
	end )
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
	InputName.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	InputName:subscribeToGlobalModel( controller, "FileshareRoot", "downloadFileName", function ( model )
		local downloadFileName = Engine.GetModelValue( model )
		if downloadFileName then
			InputName.Text:setText( downloadFileName )
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
		FileshareEnterDownloadName( self, element, controller )
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
	
	local BtnPublish = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	BtnPublish:setLeftRight( true, false, 461.96, 741.96 )
	BtnPublish:setTopBottom( true, false, 458.01, 489.01 )
	BtnPublish.btnDisplayText:setText( Engine.Localize( "MENU_FILESHARE_DOWNLOAD" ) )
	BtnPublish.btnDisplayTextStroke:setText( Engine.Localize( "MENU_FILESHARE_DOWNLOAD" ) )
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
			FileshareDownload( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if FileshareIsReady( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	leftButtonBar:setLeftRight( true, false, 64, 496 )
	leftButtonBar:setTopBottom( true, false, 534.11, 566.11 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	local LocalMediaSlotsAvailable0 = CoD.LocalMediaSlotsAvailable.new( self, controller )
	LocalMediaSlotsAvailable0:setLeftRight( true, false, 906.5, 1146.5 )
	LocalMediaSlotsAvailable0:setTopBottom( true, false, 459.01, 489.01 )
	self:addElement( LocalMediaSlotsAvailable0 )
	self.LocalMediaSlotsAvailable0 = LocalMediaSlotsAvailable0
	
	FullscreenPopupTemplate0.navigation = {
		left = InputName,
		down = InputName
	}
	InputName.navigation = {
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
				self:setupElementClipCounter( 3 )
				InputName:completeAnimation()
				self.InputName:setAlpha( 0 )
				self.clipFinished( InputName, {} )
				LblName:completeAnimation()
				self.LblName:setAlpha( 0 )
				self.clipFinished( LblName, {} )
				BtnPublish:completeAnimation()
				self.BtnPublish:setAlpha( 0 )
				self.clipFinished( BtnPublish, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Working",
			condition = function ( menu, element, event )
				return FileshareIsDownloading()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isDownloading" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isDownloading"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( self, event )
		local f23_local0 = nil
		FileshareHandleKeyboardComplete( self, self, controller, event )
		if not f23_local0 then
			f23_local0 = self:dispatchEventToChildren( event )
		end
		return f23_local0
	end )
	self:registerEventHandler( "fileshare_copy_success", function ( self, event )
		local f24_local0 = nil
		FileshareShowDownloadSuccessToast( self, self, controller )
		GoBackMultiple( self, controller, "1" )
		MediaManagerUpdateLocalData( controller )
		if not f24_local0 then
			f24_local0 = self:dispatchEventToChildren( event )
		end
		return f24_local0
	end )
	self:registerEventHandler( "fileshare_copy_failure", function ( self, event )
		local f25_local0 = nil
		FileshareShowErrorToast( self, self, controller )
		GoBackMultiple( self, controller, "1" )
		if not f25_local0 then
			f25_local0 = self:dispatchEventToChildren( event )
		end
		return f25_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	FullscreenPopupTemplate0.id = "FullscreenPopupTemplate0"
	InputName.id = "InputName"
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
		element.BtnPublish:close()
		element.leftButtonBar:close()
		element.LocalMediaSlotsAvailable0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FileshareDownload.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

