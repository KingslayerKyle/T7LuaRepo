require( "ui.uieditor.menus.CharacterCustomization.ChooseFace" )
require( "ui.uieditor.menus.CPFlow.ChooseCompanion" )
require( "ui.uieditor.widgets.BackgroundFrames.PrototypeBackgroundFrame" )
require( "ui.uieditor.widgets.Lobby.Flyouts.lobbyFlyout_GenericSelectionButton" )

local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	self.disableDarkenElement = true
end

LUI.createMenu.ChooseGender = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseGender" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseGender.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local PrototypeBackgroundFrame = CoD.PrototypeBackgroundFrame.new( self, controller )
	PrototypeBackgroundFrame:setLeftRight( 0, 1, 0, 0 )
	PrototypeBackgroundFrame:setTopBottom( 0, 1, 0, 0 )
	PrototypeBackgroundFrame:setZoom( 10 )
	self:addElement( PrototypeBackgroundFrame )
	self.PrototypeBackgroundFrame = PrototypeBackgroundFrame
	
	local genderList = LUI.UIList.new( self, controller, -28, 0, nil, false, false, 0, 0, false, false )
	genderList:makeFocusable()
	genderList:setLeftRight( 0.5, 0.5, -864, -568 )
	genderList:setTopBottom( 1, 1, -491, -329 )
	genderList:setZoom( 50 )
	genderList:setWidgetType( CoD.lobbyFlyout_GenericSelectionButton )
	genderList:setHorizontalCount( 2 )
	genderList:setSpacing( -28 )
	genderList:setDataSource( "GendersList" )
	genderList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SendCustomClientScriptNotifyForAdjustedClient( controller, "updateCpCharacter", "changeGender", element.gender, Enum.eModes.MODE_CAMPAIGN )
		return retVal
	end )
	genderList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	genderList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( genderList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN ) and CoD.CPUtility.UseFaceCustomization( controller ) then
			SetCharacterModeToSessionMode( self, element, controller, Enum.eModes.MODE_CAMPAIGN )
			SelectGender( self, element, controller )
			SaveLoadoutGeneric( controller )
			SetEdittingHeroFromStats( controller )
			RefreshCharacterCustomization( self, element, controller )
			NavigateToMenu( self, "ChooseFace", true, controller )
			ClearMenuSavedState( menu )
			return true
		elseif IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN ) then
			SetCharacterModeToSessionMode( self, element, controller, Enum.eModes.MODE_CAMPAIGN )
			SelectGender( self, element, controller )
			SaveLoadoutGeneric( controller )
			SetEdittingHeroFromStats( controller )
			RefreshCharacterCustomization( self, element, controller )
			NavigateToMenu( self, "ChooseCompanion", true, controller )
			ClearMenuSavedState( menu )
			return true
		else
			SelectGender( self, element, controller )
			SaveLoadoutGeneric( controller )
			SetEdittingHeroFromStats( controller )
			RefreshCharacterCustomization( self, element, controller )
			GoBack( self, controller )
			ClearMenuSavedState( menu )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
		return true
	end, false )
	self:addElement( genderList )
	self.genderList = genderList
	
	local TitleBox = LUI.UIText.new()
	TitleBox:setLeftRight( 0, 0, 96, 896 )
	TitleBox:setTopBottom( 0, 0, 434, 464 )
	TitleBox:setRGB( 0.74, 1, 0.9 )
	TitleBox:setAlpha( 0.5 )
	TitleBox:setZoom( 25 )
	TitleBox:setText( Engine.Localize( "MENU_DESCRIPTION" ) )
	TitleBox:setTTF( "fonts/default.ttf" )
	TitleBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TitleBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( 0, 0, 96, 896 )
	TextBox:setTopBottom( 0, 0, 359, 434 )
	TextBox:setRGB( 0.74, 1, 0.9 )
	TextBox:setAlpha( 0.4 )
	TextBox:setZoom( 25 )
	TextBox:setText( Engine.Localize( "Create Operative" ) )
	TextBox:setTTF( "fonts/default.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SendClientScriptNotifyForAdjustedClient( controller, "updateCpCharacter", "show" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	PrototypeBackgroundFrame:setModel( self.buttonModel, controller )
	genderList.id = "genderList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.genderList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PrototypeBackgroundFrame:close()
		self.genderList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseGender.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

