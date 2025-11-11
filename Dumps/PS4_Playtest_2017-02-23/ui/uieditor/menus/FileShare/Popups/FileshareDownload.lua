require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithInputButton" )
require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )
require( "ui.uieditor.widgets.MediaManager.LocalMediaSlotsAvailable" )

local PostLoadFunc = function ( self, controller )
	self.FullscreenPopupTemplate0.navigation = nil
	self.InputName.navigation = {
		up = self.BtnPublish,
		down = self.BtnPublish
	}
	self.BtnPublish.navigation = {
		up = self.InputName,
		down = self.InputName
	}
end

LUI.createMenu.FileshareDownload = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FileshareDownload" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FileshareDownload.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate0 = CoD.FullscreenPopupTemplate.new( self, controller )
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
	FullscreenPopupTemplate0:setLeftRight( 0, 0, 4, 1924 )
	FullscreenPopupTemplate0:setTopBottom( 0, 0, 0, 1080 )
	FullscreenPopupTemplate0.WorkingTitle:setText( Engine.Localize( "MENU_FILESHARE_DOWNLOAD_WORKING_TITLE" ) )
	FullscreenPopupTemplate0.Title:setText( Engine.Localize( "MENU_FILESHARE_DOWNLOAD_TITLE" ) )
	FullscreenPopupTemplate0.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_DOWNLOAD_DESC" ) )
	FullscreenPopupTemplate0.DoneTitle:setText( Engine.Localize( "MENU_NEW" ) )
	FullscreenPopupTemplate0.ErrorSubtitle:setText( Engine.Localize( "MENU_FILESHARE_DOWNLOAD_ERROR" ) )
	self:addElement( FullscreenPopupTemplate0 )
	self.FullscreenPopupTemplate0 = FullscreenPopupTemplate0
	
	local InputName = CoD.GunsmithInputButton.new( self, controller )
	InputName:setLeftRight( 0, 0, 693, 1236 )
	InputName:setTopBottom( 0, 0, 566.5, 617.5 )
	InputName.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	InputName:subscribeToGlobalModel( controller, "FileshareRoot", "downloadFileName", function ( model )
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
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	self:AddButtonCallbackFunction( InputName, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		FileshareEnterDownloadName( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( InputName )
	self.InputName = InputName
	
	local LblName = LUI.UITightText.new()
	LblName:setLeftRight( 0, 0, 693, 993 )
	LblName:setTopBottom( 0, 0, 529, 567 )
	LblName:setText( Engine.Localize( "MENU_FILESHARE_NEWNAME" ) )
	LblName:setTTF( "fonts/default.ttf" )
	self:addElement( LblName )
	self.LblName = LblName
	
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
	BtnPublish:setLeftRight( 0, 0, 693, 1113 )
	BtnPublish:setTopBottom( 0, 0, 687, 733 )
	BtnPublish.btnDisplayText:setText( Engine.Localize( "MENU_FILESHARE_DOWNLOAD" ) )
	BtnPublish.btnDisplayTextStroke:setText( Engine.Localize( "MENU_FILESHARE_DOWNLOAD" ) )
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
		if FileshareIsReady( controller ) then
			FileshareDownload( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if FileshareIsReady( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( BtnPublish )
	self.BtnPublish = BtnPublish
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	leftButtonBar:setLeftRight( 0, 0, 96, 744 )
	leftButtonBar:setTopBottom( 0, 0, 846, 894 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	local LocalMediaSlotsAvailable0 = CoD.LocalMediaSlotsAvailable.new( self, controller )
	LocalMediaSlotsAvailable0:setLeftRight( 0, 0, 1360, 1720 )
	LocalMediaSlotsAvailable0:setTopBottom( 0, 0, 688.5, 733.5 )
	self:addElement( LocalMediaSlotsAvailable0 )
	self.LocalMediaSlotsAvailable0 = LocalMediaSlotsAvailable0
	
	FullscreenPopupTemplate0.navigation = {
		left = BtnPublish,
		right = InputName,
		down = InputName
	}
	InputName.navigation = {
		left = FullscreenPopupTemplate0,
		up = FullscreenPopupTemplate0,
		down = BtnPublish
	}
	BtnPublish.navigation = {
		up = FullscreenPopupTemplate0,
		right = FullscreenPopupTemplate0
	}
	self.resetProperties = function ()
		InputName:completeAnimation()
		BtnPublish:completeAnimation()
		LblName:completeAnimation()
		InputName:setAlpha( 1 )
		BtnPublish:setAlpha( 1 )
		LblName:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Working = {
			DefaultClip = function ()
				self.resetProperties()
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
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		FileshareHandleKeyboardComplete( self, element, controller, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "fileshare_copy_success", function ( element, event )
		local retVal = nil
		FileshareShowDownloadSuccessToast( self, element, controller )
		GoBackMultiple( self, controller, "1" )
		MediaManagerUpdateLocalData( controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "fileshare_copy_failure", function ( element, event )
		local retVal = nil
		FileshareShowErrorToast( self, element, controller )
		GoBackMultiple( self, controller, "1" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FullscreenPopupTemplate0:close()
		self.InputName:close()
		self.BtnPublish:close()
		self.leftButtonBar:close()
		self.LocalMediaSlotsAvailable0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FileshareDownload.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

