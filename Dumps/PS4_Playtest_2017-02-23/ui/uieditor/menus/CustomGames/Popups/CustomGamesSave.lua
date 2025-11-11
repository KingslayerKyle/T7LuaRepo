require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithInputButton" )
require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )

local PostLoadFunc = function ( self, controller )
	self.FullscreenPopupTemplate.navigation = nil
	self.InputButton.navigation = {
		up = self.BtnPublish,
		down = self.inputDescription
	}
	self.inputDescription.navigation = {
		up = self.InputButton,
		down = self.BtnPublish
	}
	self.BtnPublish.navigation = {
		up = self.inputDescription,
		down = self.InputButton
	}
end

LUI.createMenu.CustomGamesSave = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CustomGamesSave" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CustomGamesSave.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate = CoD.FullscreenPopupTemplate.new( self, controller )
	FullscreenPopupTemplate:setLeftRight( 0, 0, 0, 1920 )
	FullscreenPopupTemplate:setTopBottom( 0, 0, 0, 1080 )
	FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE" ) )
	FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE" ) )
	FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE_DESC" ) )
	FullscreenPopupTemplate.DoneTitle:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE_DONE" ) )
	FullscreenPopupTemplate.ErrorSubtitle:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE_ERROR" ) )
	self:addElement( FullscreenPopupTemplate )
	self.FullscreenPopupTemplate = FullscreenPopupTemplate
	
	local inputDescription = CoD.GunsmithInputButton.new( self, controller )
	inputDescription:setLeftRight( 0, 0, 687, 1827 )
	inputDescription:setTopBottom( 0, 0, 672.5, 723.5 )
	inputDescription.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	inputDescription:subscribeToGlobalModel( controller, "CustomGamesRoot", "gameDescription", function ( model )
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
		if IsMenuInState( menu, "DefaultState" ) then
			FileshareEnterPublishDescription( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsMenuInState( menu, "DefaultState" ) then
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
	
	local InputButton = CoD.GunsmithInputButton.new( self, controller )
	InputButton:setLeftRight( 0, 0, 687, 1230 )
	InputButton:setTopBottom( 0, 0, 572.5, 623.5 )
	InputButton.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	InputButton:subscribeToGlobalModel( controller, "CustomGamesRoot", "gameName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			InputButton.Text:setText( modelValue )
		end
	end )
	InputButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	InputButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( InputButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsMenuInState( menu, "DefaultState" ) then
			FileshareEnterPublishName( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsMenuInState( menu, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( InputButton )
	self.InputButton = InputButton
	
	local LblName = LUI.UITightText.new()
	LblName:setLeftRight( 0, 0, 693, 829 )
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
				return AlwaysFalse()
			end
		}
	} )
	BtnPublish:setLeftRight( 0, 0, 687, 1107 )
	BtnPublish:setTopBottom( 0, 0, 731, 777 )
	BtnPublish.btnDisplayText:setText( Engine.Localize( "MENU_SAVE" ) )
	BtnPublish.btnDisplayTextStroke:setText( Engine.Localize( "MENU_SAVE" ) )
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
		SaveCustomGameYes( self, element, controller, "", menu )
		Close( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( BtnPublish )
	self.BtnPublish = BtnPublish
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	leftButtonBar:setLeftRight( 0, 0, 96, 744 )
	leftButtonBar:setTopBottom( 0, 0, 796, 844 )
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
	self.resetProperties = function ()
		FullscreenPopupTemplate:completeAnimation()
		BtnPublish:completeAnimation()
		LblName:completeAnimation()
		InputButton:completeAnimation()
		FullscreenPopupTemplate.RedLine:setRGB( 1, 0.6, 0 )
		FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE" ) )
		FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE" ) )
		FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_CUSTOM_GAMES_SAVE_DESC" ) )
		BtnPublish:setAlpha( 1 )
		LblName:setAlpha( 1 )
		InputButton:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.RedLine:completeAnimation()
				self.FullscreenPopupTemplate.RedLine:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.clipFinished( FullscreenPopupTemplate, {} )
			end
		},
		SlotsFull = {
			DefaultClip = function ()
				self.resetProperties()
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
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		CustomGameHandleKeyboardComplete( self, element, controller, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		Close( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_CLOSE", nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FullscreenPopupTemplate:close()
		self.inputDescription:close()
		self.InputButton:close()
		self.BtnPublish:close()
		self.leftButtonBar:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CustomGamesSave.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

