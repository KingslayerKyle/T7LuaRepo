require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithInputButton" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.FullscreenPopupTemplate.navigation = nil
	f1_arg0.InputButton.navigation = {
		up = f1_arg0.BtnPublish,
		down = f1_arg0.inputDescription
	}
	f1_arg0.inputDescription.navigation = {
		up = f1_arg0.InputButton,
		down = f1_arg0.BtnPublish
	}
	f1_arg0.BtnPublish.navigation = {
		up = f1_arg0.inputDescription,
		down = f1_arg0.InputButton
	}
end

LUI.createMenu.CustomGamesSave = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CustomGamesSave" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CustomGamesSave.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate = CoD.FullscreenPopupTemplate.new( self, controller )
	FullscreenPopupTemplate:setLeftRight( true, false, 0, 1280 )
	FullscreenPopupTemplate:setTopBottom( true, false, 0, 720 )
	FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE" ) )
	FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE" ) )
	FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE_DESC" ) )
	FullscreenPopupTemplate.DoneTitle:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE_DONE" ) )
	FullscreenPopupTemplate.ErrorSubtitle:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE_ERROR" ) )
	self:addElement( FullscreenPopupTemplate )
	self.FullscreenPopupTemplate = FullscreenPopupTemplate
	
	local inputDescription = CoD.GunsmithInputButton.new( self, controller )
	inputDescription:setLeftRight( true, false, 457.96, 1218 )
	inputDescription:setTopBottom( true, false, 448, 482 )
	inputDescription.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	inputDescription:subscribeToGlobalModel( controller, "CustomGamesRoot", "gameDescription", function ( model )
		local gameDescription = Engine.GetModelValue( model )
		if gameDescription then
			inputDescription.Text:setText( gameDescription )
		end
	end )
	inputDescription:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	inputDescription:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	self:AddButtonCallbackFunction( inputDescription, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsMenuInState( menu, "DefaultState" ) then
			FileshareEnterPublishDescription( self, element, controller )
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
	descriptionText:setTopBottom( true, false, 419, 444 )
	descriptionText:setText( Engine.Localize( "MPUI_DESCRIPTION" ) )
	descriptionText:setTTF( "fonts/default.ttf" )
	descriptionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	descriptionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( descriptionText )
	self.descriptionText = descriptionText
	
	local InputButton = CoD.GunsmithInputButton.new( self, controller )
	InputButton:setLeftRight( true, false, 457.96, 819.96 )
	InputButton:setTopBottom( true, false, 382, 416 )
	InputButton.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	InputButton:subscribeToGlobalModel( controller, "CustomGamesRoot", "gameName", function ( model )
		local gameName = Engine.GetModelValue( model )
		if gameName then
			InputButton.Text:setText( gameName )
		end
	end )
	InputButton:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	InputButton:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	self:AddButtonCallbackFunction( InputButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsMenuInState( menu, "DefaultState" ) then
			FileshareEnterPublishName( self, element, controller )
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
	self:addElement( InputButton )
	self.InputButton = InputButton
	
	local LblName = LUI.UITightText.new()
	LblName:setLeftRight( true, false, 461.96, 552.96 )
	LblName:setTopBottom( true, false, 353, 378 )
	LblName:setText( Engine.Localize( "MENU_FILESHARE_NEWNAME" ) )
	LblName:setTTF( "fonts/default.ttf" )
	self:addElement( LblName )
	self.LblName = LblName
	
	local BtnPublish = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	BtnPublish:setLeftRight( true, false, 457.96, 737.96 )
	BtnPublish:setTopBottom( true, false, 487, 518 )
	BtnPublish.btnDisplayText:setText( Engine.Localize( "MENU_SAVE" ) )
	BtnPublish.btnDisplayTextStroke:setText( Engine.Localize( "MENU_SAVE" ) )
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
		SaveCustomGameYes( self, element, controller, "", menu )
		Close( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	BtnPublish:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( BtnPublish )
	self.BtnPublish = BtnPublish
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	leftButtonBar:setLeftRight( true, false, 64, 496 )
	leftButtonBar:setTopBottom( true, false, 531, 563 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	FullscreenPopupTemplate.navigation = {
		left = InputButton,
		right = inputDescription,
		down = InputButton
	}
	inputDescription.navigation = {
		left = FullscreenPopupTemplate,
		up = FullscreenPopupTemplate,
		down = BtnPublish
	}
	InputButton.navigation = {
		up = FullscreenPopupTemplate,
		right = FullscreenPopupTemplate,
		down = inputDescription
	}
	BtnPublish.navigation = {
		up = FullscreenPopupTemplate,
		right = FullscreenPopupTemplate
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.RedLine:completeAnimation()
				FullscreenPopupTemplate.WorkingTitle:completeAnimation()
				FullscreenPopupTemplate.Title:completeAnimation()
				FullscreenPopupTemplate.Subtitle:completeAnimation()
				FullscreenPopupTemplate.DoneTitle:completeAnimation()
				FullscreenPopupTemplate.ErrorSubtitle:completeAnimation()
				self.FullscreenPopupTemplate.RedLine:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE" ) )
				self.FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE" ) )
				self.FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE_DESC" ) )
				self.FullscreenPopupTemplate.DoneTitle:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE_DONE" ) )
				self.FullscreenPopupTemplate.ErrorSubtitle:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE_ERROR" ) )
				self.clipFinished( FullscreenPopupTemplate, {} )
				InputButton:completeAnimation()
				self.InputButton:setAlpha( 1 )
				self.clipFinished( InputButton, {} )
				LblName:completeAnimation()
				self.LblName:setAlpha( 1 )
				self.clipFinished( LblName, {} )
				BtnPublish:completeAnimation()
				self.BtnPublish:setAlpha( 1 )
				self.clipFinished( BtnPublish, {} )
			end
		},
		SlotsFull = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.RedLine:completeAnimation()
				FullscreenPopupTemplate.WorkingTitle:completeAnimation()
				FullscreenPopupTemplate.Title:completeAnimation()
				FullscreenPopupTemplate.Subtitle:completeAnimation()
				self.FullscreenPopupTemplate.RedLine:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "CUSTOM_VALUE_SECONDS_POINT_35" ) )
				self.FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_FILESHARE_SLOTS_FULL_TITLE" ) )
				self.FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_CUSTOMGAME_SLOTSFULL_DESC" ) )
				self.clipFinished( FullscreenPopupTemplate, {} )
				InputButton:completeAnimation()
				self.InputButton:setAlpha( 0 )
				self.clipFinished( InputButton, {} )
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
			stateName = "SlotsFull",
			condition = function ( menu, element, event )
				return not CustomGamesSlotsAvailable( element, controller )
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( self, event )
		local f21_local0 = nil
		CustomGameHandleKeyboardComplete( self, self, controller, event )
		if not f21_local0 then
			f21_local0 = self:dispatchEventToChildren( event )
		end
		return f21_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		Close( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_CLOSE" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsMenuInState( self, "SlotsFull" ) then
			SetFocusToElement( self, "FullscreenPopupTemplate", controller )
			MakeElementNotFocusable( self, "BtnPublish", controller )
			MakeElementNotFocusable( self, "InputButton", controller )
		elseif IsMenuInState( self, "DefaultState" ) then
			MakeElementFocusable( self, "BtnPublish", controller )
			MakeElementFocusable( self, "InputButton", controller )
			SetFocusToElement( self, "InputButton", controller )
		end
	end )
	FullscreenPopupTemplate.id = "FullscreenPopupTemplate"
	inputDescription.id = "inputDescription"
	InputButton.id = "InputButton"
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
		self.InputButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FullscreenPopupTemplate:close()
		element.inputDescription:close()
		element.InputButton:close()
		element.BtnPublish:close()
		element.leftButtonBar:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CustomGamesSave.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

