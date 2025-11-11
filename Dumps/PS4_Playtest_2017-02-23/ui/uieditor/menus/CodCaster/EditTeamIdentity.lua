require( "ui.uieditor.menus.CodCaster.EditTeamLogo" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CodCaster.codcaster_color_element" )
require( "ui.uieditor.widgets.CodCaster.CodCasterFakeMap" )
require( "ui.uieditor.widgets.CodCaster.CodCasterTeamLogoButton" )
require( "ui.uieditor.widgets.InputButton" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )

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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EditTeamIdentity.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	FEButtonPanelShaderContainer0:setLeftRight( 0, 1, 0, 0 )
	FEButtonPanelShaderContainer0:setTopBottom( 0, 1, 0, 0 )
	FEButtonPanelShaderContainer0:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 )
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		self:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	FadeForStreamer:setLeftRight( 0, 1, 0, 0 )
	FadeForStreamer:setTopBottom( 0, 1, 0, 0 )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame:setLeftRight( 0, 1, 0, 0 )
	GenericMenuFrame:setTopBottom( 0, 1, 0, 0 )
	GenericMenuFrame.titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU" ) )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local TeamLogoTitle = LUI.UIText.new()
	TeamLogoTitle:setLeftRight( 0, 0, 102, 402 )
	TeamLogoTitle:setTopBottom( 0, 0, 217, 247 )
	TeamLogoTitle:setText( LocalizeToUpperString( "CODCASTER_TEAM_LOGO_COLON" ) )
	TeamLogoTitle:setTTF( "fonts/escom.ttf" )
	TeamLogoTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	TeamLogoTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	TeamLogoTitle:setShaderVector( 1, 0, 0, 0, 0 )
	TeamLogoTitle:setShaderVector( 2, 1, 0, 0, 0 )
	TeamLogoTitle:setLetterSpacing( 1 )
	TeamLogoTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamLogoTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamLogoTitle )
	self.TeamLogoTitle = TeamLogoTitle
	
	local TeamNameTitle = LUI.UIText.new()
	TeamNameTitle:setLeftRight( 0, 0, 102, 402 )
	TeamNameTitle:setTopBottom( 0, 0, 626, 655 )
	TeamNameTitle:setText( LocalizeToUpperString( "CODCASTER_TEAM_NAME_COLON" ) )
	TeamNameTitle:setTTF( "fonts/escom.ttf" )
	TeamNameTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	TeamNameTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	TeamNameTitle:setShaderVector( 1, 0, 0, 0, 0 )
	TeamNameTitle:setShaderVector( 2, 1, 0, 0, 0 )
	TeamNameTitle:setLetterSpacing( 1 )
	TeamNameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamNameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamNameTitle )
	self.TeamNameTitle = TeamNameTitle
	
	local TeamNameInputButton = CoD.InputButton.new( self, controller )
	TeamNameInputButton:setLeftRight( 0, 0, 119, 740 )
	TeamNameInputButton:setTopBottom( 0, 0, 668.5, 719.5 )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( TeamNameInputButton )
	self.TeamNameInputButton = TeamNameInputButton
	
	local TeamColorTitle = LUI.UIText.new()
	TeamColorTitle:setLeftRight( 0, 0, 102, 402 )
	TeamColorTitle:setTopBottom( 0, 0, 765, 795 )
	TeamColorTitle:setText( LocalizeToUpperString( "CODCASTER_TEAM_COLOR_COLON" ) )
	TeamColorTitle:setTTF( "fonts/escom.ttf" )
	TeamColorTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	TeamColorTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	TeamColorTitle:setShaderVector( 1, 0, 0, 0, 0 )
	TeamColorTitle:setShaderVector( 2, 1, 0, 0, 0 )
	TeamColorTitle:setLetterSpacing( 0.08 )
	TeamColorTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamColorTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamColorTitle )
	self.TeamColorTitle = TeamColorTitle
	
	local TeamColorList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	TeamColorList:makeFocusable()
	TeamColorList:setLeftRight( 0, 0, 122, 736 )
	TeamColorList:setTopBottom( 0, 0, 809, 961 )
	TeamColorList:setWidgetType( CoD.codcaster_color_element )
	TeamColorList:setHorizontalCount( 8 )
	TeamColorList:setVerticalCount( 2 )
	TeamColorList:setDataSource( "TeamIdentityColorList" )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
		return false
	end, false )
	self:addElement( TeamColorList )
	self.TeamColorList = TeamColorList
	
	local TeamLogoImageButton = CoD.CodCasterTeamLogoButton.new( self, controller )
	TeamLogoImageButton:setLeftRight( 0, 0, 118, 577 )
	TeamLogoImageButton:setTopBottom( 0, 0, 269, 564 )
	TeamLogoImageButton.BoxButtonLrgInactive:setAlpha( 0.56 )
	TeamLogoImageButton:subscribeToGlobalModel( controller, "TeamIdentityInformation", "teamLogo", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TeamLogoImageButton.unfocused:setImage( RegisterImage( modelValue ) )
		end
	end )
	TeamLogoImageButton:subscribeToGlobalModel( controller, "TeamIdentityInformation", "teamLogoName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TeamLogoImageButton.LabelButton.itemName:setText( Engine.Localize( modelValue ) )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( TeamLogoImageButton )
	self.TeamLogoImageButton = TeamLogoImageButton
	
	local CodCasterFakeMap = CoD.CodCasterFakeMap.new( self, controller )
	CodCasterFakeMap:setLeftRight( 0, 0, 900, 1686 )
	CodCasterFakeMap:setTopBottom( 0, 0, 88.5, 991.5 )
	self:addElement( CodCasterFakeMap )
	self.CodCasterFakeMap = CodCasterFakeMap
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
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
		self.FEButtonPanelShaderContainer0:close()
		self.FadeForStreamer:close()
		self.GenericMenuFrame:close()
		self.TeamNameInputButton:close()
		self.TeamColorList:close()
		self.TeamLogoImageButton:close()
		self.CodCasterFakeMap:close()
		self.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EditTeamIdentity.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

