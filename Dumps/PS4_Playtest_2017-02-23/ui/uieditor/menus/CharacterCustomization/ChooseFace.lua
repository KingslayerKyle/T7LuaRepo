require( "ui.uieditor.menus.CPFlow.ChooseCompanion" )
require( "ui.uieditor.widgets.BackgroundFrames.PrototypeBackgroundFrame" )
require( "ui.uieditor.widgets.Controls.Slider_Small" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Lobby.Flyouts.lobbyFlyout_GenericSelectionButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

LUI.createMenu.ChooseFace = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseFace" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseFace.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local PrototypeBackgroundFrame = CoD.PrototypeBackgroundFrame.new( self, controller )
	PrototypeBackgroundFrame:setLeftRight( 0, 1, 0, 0 )
	PrototypeBackgroundFrame:setTopBottom( 0, 1, 0, 0 )
	PrototypeBackgroundFrame:setZoom( 10 )
	self:addElement( PrototypeBackgroundFrame )
	self.PrototypeBackgroundFrame = PrototypeBackgroundFrame
	
	local TitleBox = LUI.UIText.new()
	TitleBox:setLeftRight( 0, 0, 96, 896 )
	TitleBox:setTopBottom( 0, 0, 129, 159 )
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
	TextBox:setTopBottom( 0, 0, 54, 129 )
	TextBox:setRGB( 0.74, 1, 0.9 )
	TextBox:setAlpha( 0.8 )
	TextBox:setZoom( 25 )
	TextBox:setText( Engine.Localize( "MENU_CHANGE_FACE" ) )
	TextBox:setTTF( "fonts/default.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0.5, 0.5, -864, -48 )
	ButtonList:setTopBottom( 0, 0, 322, 820 )
	ButtonList:setWidgetType( CoD.Slider_Small )
	ButtonList:setVerticalCount( 10 )
	ButtonList:setVerticalCounter( CoD.verticalCounter )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local FETabBar = CoD.FE_TabBar.new( self, controller )
	FETabBar:setLeftRight( 0, 1, 0, 1826 )
	FETabBar:setTopBottom( 0, 0, 191, 253 )
	FETabBar.Tabs.grid:setHorizontalCount( 12 )
	FETabBar.Tabs.grid:setDataSource( "ChooseFaceFeatures" )
	FETabBar:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		return retVal
	end )
	self:addElement( FETabBar )
	self.FETabBar = FETabBar
	
	local FacialFeatureText = LUI.UIText.new()
	FacialFeatureText:setLeftRight( 0, 0, 96, 296 )
	FacialFeatureText:setTopBottom( 0, 0, 261, 311 )
	FacialFeatureText:setTTF( "fonts/default.ttf" )
	FacialFeatureText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FacialFeatureText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FacialFeatureText )
	self.FacialFeatureText = FacialFeatureText
	
	local ConfirmButton = CoD.lobbyFlyout_GenericSelectionButton.new( self, controller )
	ConfirmButton:setLeftRight( 0, 0, 960, 1122 )
	ConfirmButton:setTopBottom( 0, 0, 658, 820 )
	ConfirmButton.icon:setImage( RegisterImage( "uie_menu_cp_frontend_icon_confirmation" ) )
	ConfirmButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ConfirmButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( ConfirmButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN ) then
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
	self:addElement( ConfirmButton )
	self.ConfirmButton = ConfirmButton
	
	ButtonList:linkToElementModel( FETabBar.Tabs.grid, "dataSource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ButtonList:setDataSource( modelValue )
		end
	end )
	FacialFeatureText:linkToElementModel( FETabBar.Tabs.grid, "tabName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FacialFeatureText:setText( Engine.Localize( modelValue ) )
		end
	end )
	ButtonList.navigation = {
		right = ConfirmButton
	}
	ConfirmButton.navigation = {
		left = ButtonList
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SendClientScriptNotifyForAdjustedClient( controller, "updateCpCharacter", "show" )
		SetCharacterModeToCurrentSessionMode( self, self, controller )
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "R", function ( element, menu, controller, model )
		CoD.CPUtility.RandomizeFacialFeatures( controller, self.ButtonList )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "CP_FACIAL_CUSTOMIZATION_RANDOMIZE", nil )
		return true
	end, false )
	PrototypeBackgroundFrame:setModel( self.buttonModel, controller )
	ButtonList.id = "ButtonList"
	ConfirmButton.id = "ConfirmButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PrototypeBackgroundFrame:close()
		self.ButtonList:close()
		self.FETabBar:close()
		self.ConfirmButton:close()
		self.FacialFeatureText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseFace.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

