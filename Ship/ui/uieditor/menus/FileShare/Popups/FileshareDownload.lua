-- c0f59cfbad14da2ec42fe80629589c2c
-- This hash is used for caching, delete to decompile the file again

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
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate0 = CoD.FullscreenPopupTemplate.new( f2_local1, controller )
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
		f2_local1:updateElementState( FullscreenPopupTemplate0, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isDownloading"
		} )
	end )
	FullscreenPopupTemplate0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isPublishing" ), function ( model )
		f2_local1:updateElementState( FullscreenPopupTemplate0, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isPublishing"
		} )
	end )
	self:addElement( FullscreenPopupTemplate0 )
	self.FullscreenPopupTemplate0 = FullscreenPopupTemplate0
	
	local InputName = CoD.GunsmithInputButton.new( f2_local1, controller )
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
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	f2_local1:AddButtonCallbackFunction( InputName, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		FileshareEnterDownloadName( self, f10_arg0, f10_arg2 )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
	
	local BtnPublish = CoD.List1ButtonLarge_Left_ND.new( f2_local1, controller )
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
		CoD.Menu.UpdateButtonShownState( f12_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BtnPublish:registerEventHandler( "gain_focus", function ( element, event )
		local f13_local0 = nil
		if element.gainFocus then
			f13_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f13_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	f2_local1:AddButtonCallbackFunction( BtnPublish, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		if FileshareIsReady( f15_arg2 ) then
			FileshareDownload( self, f15_arg0, f15_arg2 )
			return true
		else
			
		end
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		if FileshareIsReady( f16_arg2 ) then
			CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		f2_local1:updateElementState( BtnPublish, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		} )
	end )
	self:addElement( BtnPublish )
	self.BtnPublish = BtnPublish
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( f2_local1, controller )
	leftButtonBar:setLeftRight( true, false, 64, 496 )
	leftButtonBar:setTopBottom( true, false, 534.11, 566.11 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	local LocalMediaSlotsAvailable0 = CoD.LocalMediaSlotsAvailable.new( f2_local1, controller )
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
		f2_local1:updateElementState( self, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isDownloading"
		} )
	end )
	CoD.Menu.AddNavigationHandler( f2_local1, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f23_local0 = nil
		FileshareHandleKeyboardComplete( self, element, controller, event )
		if not f23_local0 then
			f23_local0 = element:dispatchEventToChildren( event )
		end
		return f23_local0
	end )
	self:registerEventHandler( "fileshare_copy_success", function ( element, event )
		local f24_local0 = nil
		FileshareShowDownloadSuccessToast( self, element, controller )
		GoBackMultiple( self, controller, "1" )
		MediaManagerUpdateLocalData( controller )
		if not f24_local0 then
			f24_local0 = element:dispatchEventToChildren( event )
		end
		return f24_local0
	end )
	self:registerEventHandler( "fileshare_copy_failure", function ( element, event )
		local f25_local0 = nil
		FileshareShowErrorToast( self, element, controller )
		GoBackMultiple( self, controller, "1" )
		if not f25_local0 then
			f25_local0 = element:dispatchEventToChildren( event )
		end
		return f25_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		GoBack( self, f26_arg2 )
		ClearSavedState( self, f26_arg2 )
		return true
	end, function ( f27_arg0, f27_arg1, f27_arg2 )
		CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
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
		menu = f2_local1
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

