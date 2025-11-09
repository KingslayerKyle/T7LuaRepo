require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.InputButton" )
require( "ui.uieditor.widgets.CodCaster.codcaster_color_element" )
require( "ui.uieditor.widgets.CodCaster.CodCasterTeamLogoButton" )
require( "ui.uieditor.menus.CodCaster.EditTeamLogo" )
require( "ui.uieditor.widgets.CodCaster.CodCasterFakeMap" )

local PreLoadFunc = function ( self, controller )
	local team = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( controller ), "team" ) )
	CoD.SetupTeamIdentityInformation( self, controller, team )
	self.restoreState = function ()
		
	end
	
end

local PostLoadFunc = function ( self, controller )
	local team = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( controller ), "team" ) )
	local titleText = Engine.ToUpper( Engine.Localize( "CODCASTER_" .. team .. "_SETTINGS" ) )
	self.GenericMenuFrame.titleLabel:setText( titleText )
	self.GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( titleText )
end

LUI.createMenu.EditTeamIdentity = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EditTeamIdentity" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EditTeamIdentity.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame.titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU" ) )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local TeamLogoTitle = LUI.UIText.new()
	TeamLogoTitle:setLeftRight( true, false, 69, 269 )
	TeamLogoTitle:setTopBottom( true, false, 117, 142 )
	TeamLogoTitle:setText( Engine.Localize( "CODCASTER_TEAM_LOGO_COLON" ) )
	TeamLogoTitle:setTTF( "fonts/default.ttf" )
	TeamLogoTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamLogoTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamLogoTitle )
	self.TeamLogoTitle = TeamLogoTitle
	
	local TeamNameTitle = LUI.UIText.new()
	TeamNameTitle:setLeftRight( true, false, 69, 269 )
	TeamNameTitle:setTopBottom( true, false, 297, 322 )
	TeamNameTitle:setText( Engine.Localize( "CODCASTER_TEAM_NAME_COLON" ) )
	TeamNameTitle:setTTF( "fonts/default.ttf" )
	TeamNameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamNameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamNameTitle )
	self.TeamNameTitle = TeamNameTitle
	
	local TeamNameInputButton = CoD.InputButton.new( self, controller )
	TeamNameInputButton:setLeftRight( true, false, 100, 485 )
	TeamNameInputButton:setTopBottom( true, false, 349, 383 )
	TeamNameInputButton:subscribeToGlobalModel( controller, "TeamIdentityInformation", "teamName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TeamNameInputButton.Text:setText( modelValue )
		end
	end )
	TeamNameInputButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	TeamNameInputButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( TeamNameInputButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_TEAM_IDENTITY_TEAMNAME" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( TeamNameInputButton )
	self.TeamNameInputButton = TeamNameInputButton
	
	local TeamColorTitle = LUI.UIText.new()
	TeamColorTitle:setLeftRight( true, false, 64, 264 )
	TeamColorTitle:setTopBottom( true, false, 421, 446 )
	TeamColorTitle:setText( Engine.Localize( "CODCASTER_TEAM_COLOR_COLON" ) )
	TeamColorTitle:setTTF( "fonts/default.ttf" )
	TeamColorTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamColorTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamColorTitle )
	self.TeamColorTitle = TeamColorTitle
	
	local TeamColorList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	TeamColorList:makeFocusable()
	TeamColorList:setLeftRight( true, false, 100, 618 )
	TeamColorList:setTopBottom( true, false, 470, 572 )
	TeamColorList:setDataSource( "TeamIdentityColorList" )
	TeamColorList:setWidgetType( CoD.codcaster_color_element )
	TeamColorList:setHorizontalCount( 10 )
	TeamColorList:setVerticalCount( 2 )
	TeamColorList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	TeamColorList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( TeamColorList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		UpdateSelectedTeamIdentityColorElement( self, element, controller )
		SetTeamIdentityTeamColor( self, element, controller )
		SetTeamIdentityProfileValue( self, element, controller, "color" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( TeamColorList )
	self.TeamColorList = TeamColorList
	
	local TeamLogoImageButton = CoD.CodCasterTeamLogoButton.new( self, controller )
	TeamLogoImageButton:setLeftRight( true, false, 209, 349 )
	TeamLogoImageButton:setTopBottom( true, false, 168, 258 )
	TeamLogoImageButton:subscribeToGlobalModel( controller, "TeamIdentityInformation", "teamLogo", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TeamLogoImageButton.unfocused:setImage( RegisterImage( modelValue ) )
		end
	end )
	TeamLogoImageButton:subscribeToGlobalModel( controller, "TeamIdentityInformation", "teamLogoName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TeamLogoImageButton.FocusWidget.Name:setText( Engine.Localize( modelValue ) )
		end
	end )
	TeamLogoImageButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	TeamLogoImageButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( TeamLogoImageButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "EditTeamLogo", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( TeamLogoImageButton )
	self.TeamLogoImageButton = TeamLogoImageButton
	
	local CodCasterFakeMap = CoD.CodCasterFakeMap.new( self, controller )
	CodCasterFakeMap:setLeftRight( true, false, 654, 1181 )
	CodCasterFakeMap:setTopBottom( true, false, 59, 661 )
	self:addElement( CodCasterFakeMap )
	self.CodCasterFakeMap = CodCasterFakeMap
	
	TeamNameInputButton.navigation = {
		up = TeamLogoImageButton,
		down = TeamColorList
	}
	TeamColorList.navigation = {
		up = TeamNameInputButton
	}
	TeamLogoImageButton.navigation = {
		down = TeamNameInputButton
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		HandleTeamIdentityKeyboardComplete( self, element, controller, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SaveShoutcasterSettings( self, element, controller )
		RefreshLobbyGameClient( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	GenericMenuFrame:setModel( self.buttonModel, controller )
	TeamNameInputButton.id = "TeamNameInputButton"
	TeamColorList.id = "TeamColorList"
	TeamLogoImageButton.id = "TeamLogoImageButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.TeamLogoImageButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GenericMenuFrame:close()
		self.TeamNameInputButton:close()
		self.TeamColorList:close()
		self.TeamLogoImageButton:close()
		self.CodCasterFakeMap:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EditTeamIdentity.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

