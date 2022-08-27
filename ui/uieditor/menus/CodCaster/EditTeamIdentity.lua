-- 9aeb36fd1d93ec4350bdb4ea05b83dd7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.InputButton" )
require( "ui.uieditor.widgets.CodCaster.codcaster_color_element" )
require( "ui.uieditor.widgets.CodCaster.CodCasterTeamLogoButton" )
require( "ui.uieditor.menus.CodCaster.EditTeamLogo" )
require( "ui.uieditor.widgets.CodCaster.CodCasterFakeMap" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local PreLoadFunc = function ( self, controller )
	CoD.SetupTeamIdentityInformation( self, controller, Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( controller ), "team" ) ) )
	self.restoreState = function ()
		
	end
	
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	local f3_local0 = Engine.ToUpper( Engine.Localize( "CODCASTER_" .. Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f3_arg1 ), "team" ) ) .. "_SETTINGS" ) )
	f3_arg0.GenericMenuFrame.titleLabel:setText( f3_local0 )
	f3_arg0.GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( f3_local0 )
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EditTeamIdentity.buttonPrompts" )
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( f4_local1, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, true, 0, 0 )
	FEButtonPanelShaderContainer0:setTopBottom( true, true, 0, 0 )
	FEButtonPanelShaderContainer0:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( f4_local1, controller )
	FadeForStreamer:setLeftRight( true, true, 0, 0 )
	FadeForStreamer:setTopBottom( true, true, 0, 0 )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 )
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		f4_local1:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( f4_local1, controller )
	GenericMenuFrame:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame.titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU" ) )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local TeamLogoTitle = LUI.UIText.new()
	TeamLogoTitle:setLeftRight( true, false, 68, 268 )
	TeamLogoTitle:setTopBottom( true, false, 145, 165 )
	TeamLogoTitle:setText( Engine.Localize( LocalizeToUpperString( "CODCASTER_TEAM_LOGO_COLON" ) ) )
	TeamLogoTitle:setTTF( "fonts/escom.ttf" )
	TeamLogoTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TeamLogoTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	TeamLogoTitle:setShaderVector( 1, 0, 0, 0, 0 )
	TeamLogoTitle:setShaderVector( 2, 1, 0, 0, 0 )
	TeamLogoTitle:setLetterSpacing( 1 )
	TeamLogoTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamLogoTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamLogoTitle )
	self.TeamLogoTitle = TeamLogoTitle
	
	local TeamNameTitle = LUI.UIText.new()
	TeamNameTitle:setLeftRight( true, false, 68, 268 )
	TeamNameTitle:setTopBottom( true, false, 417, 436.63 )
	TeamNameTitle:setText( Engine.Localize( LocalizeToUpperString( "CODCASTER_TEAM_NAME_COLON" ) ) )
	TeamNameTitle:setTTF( "fonts/escom.ttf" )
	TeamNameTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TeamNameTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	TeamNameTitle:setShaderVector( 1, 0, 0, 0, 0 )
	TeamNameTitle:setShaderVector( 2, 1, 0, 0, 0 )
	TeamNameTitle:setLetterSpacing( 1 )
	TeamNameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamNameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamNameTitle )
	self.TeamNameTitle = TeamNameTitle
	
	local TeamNameInputButton = CoD.InputButton.new( f4_local1, controller )
	TeamNameInputButton:setLeftRight( true, false, 79, 493 )
	TeamNameInputButton:setTopBottom( true, false, 445.63, 479.63 )
	TeamNameInputButton:subscribeToGlobalModel( controller, "TeamIdentityInformation", "teamName", function ( model )
		local teamName = Engine.GetModelValue( model )
		if teamName then
			TeamNameInputButton.Text:setText( teamName )
		end
	end )
	TeamNameInputButton:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	TeamNameInputButton:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	f4_local1:AddButtonCallbackFunction( TeamNameInputButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		ShowKeyboard( self, f10_arg0, f10_arg2, "KEYBOARD_TYPE_TEAM_IDENTITY_TEAMNAME" )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( TeamNameInputButton )
	self.TeamNameInputButton = TeamNameInputButton
	
	local TeamColorTitle = LUI.UIText.new()
	TeamColorTitle:setLeftRight( true, false, 68, 268 )
	TeamColorTitle:setTopBottom( true, false, 510, 530 )
	TeamColorTitle:setText( Engine.Localize( LocalizeToUpperString( "CODCASTER_TEAM_COLOR_COLON" ) ) )
	TeamColorTitle:setTTF( "fonts/escom.ttf" )
	TeamColorTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TeamColorTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	TeamColorTitle:setShaderVector( 1, 0, 0, 0, 0 )
	TeamColorTitle:setShaderVector( 2, 1, 0, 0, 0 )
	TeamColorTitle:setLetterSpacing( 0.08 )
	TeamColorTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamColorTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamColorTitle )
	self.TeamColorTitle = TeamColorTitle
	
	local TeamColorList = LUI.UIList.new( f4_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	TeamColorList:makeFocusable()
	TeamColorList:setLeftRight( true, false, 79, 493 )
	TeamColorList:setTopBottom( true, false, 539, 641 )
	TeamColorList:setDataSource( "TeamIdentityColorList" )
	TeamColorList:setWidgetType( CoD.codcaster_color_element )
	TeamColorList:setHorizontalCount( 8 )
	TeamColorList:setVerticalCount( 2 )
	TeamColorList:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f12_local0
	end )
	TeamColorList:registerEventHandler( "lose_focus", function ( element, event )
		local f13_local0 = nil
		if element.loseFocus then
			f13_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f13_local0 = element.super:loseFocus( event )
		end
		return f13_local0
	end )
	f4_local1:AddButtonCallbackFunction( TeamColorList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		UpdateSelectedTeamIdentityColorElement( self, f14_arg0, f14_arg2 )
		SetTeamIdentityTeamColor( self, f14_arg0, f14_arg2 )
		SetTeamIdentityProfileValue( self, f14_arg0, f14_arg2, "color" )
		return true
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( TeamColorList )
	self.TeamColorList = TeamColorList
	
	local TeamLogoImageButton = CoD.CodCasterTeamLogoButton.new( f4_local1, controller )
	TeamLogoImageButton:setLeftRight( true, false, 79, 385 )
	TeamLogoImageButton:setTopBottom( true, false, 179.57, 376.29 )
	TeamLogoImageButton.BoxButtonLrgInactive:setAlpha( 0.56 )
	TeamLogoImageButton:subscribeToGlobalModel( controller, "TeamIdentityInformation", "teamLogo", function ( model )
		local teamLogo = Engine.GetModelValue( model )
		if teamLogo then
			TeamLogoImageButton.unfocused:setImage( RegisterImage( teamLogo ) )
		end
	end )
	TeamLogoImageButton:subscribeToGlobalModel( controller, "TeamIdentityInformation", "teamLogoName", function ( model )
		local teamLogoName = Engine.GetModelValue( model )
		if teamLogoName then
			TeamLogoImageButton.LabelButton.itemName:setText( Engine.Localize( teamLogoName ) )
		end
	end )
	TeamLogoImageButton:registerEventHandler( "gain_focus", function ( element, event )
		local f18_local0 = nil
		if element.gainFocus then
			f18_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f18_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f18_local0
	end )
	TeamLogoImageButton:registerEventHandler( "lose_focus", function ( element, event )
		local f19_local0 = nil
		if element.loseFocus then
			f19_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f19_local0 = element.super:loseFocus( event )
		end
		return f19_local0
	end )
	f4_local1:AddButtonCallbackFunction( TeamLogoImageButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		NavigateToMenu( self, "EditTeamLogo", true, f20_arg2 )
		return true
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( TeamLogoImageButton )
	self.TeamLogoImageButton = TeamLogoImageButton
	
	local CodCasterFakeMap = CoD.CodCasterFakeMap.new( f4_local1, controller )
	CodCasterFakeMap:setLeftRight( true, false, 600, 1124 )
	CodCasterFakeMap:setTopBottom( true, false, 59, 661 )
	self:addElement( CodCasterFakeMap )
	self.CodCasterFakeMap = CodCasterFakeMap
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f4_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
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
	CoD.Menu.AddNavigationHandler( f4_local1, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f22_local0 = nil
		HandleTeamIdentityKeyboardComplete( self, element, controller, event )
		if not f22_local0 then
			f22_local0 = element:dispatchEventToChildren( event )
		end
		return f22_local0
	end )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		SaveShoutcasterSettings( self, f23_arg0, f23_arg2 )
		RefreshLobbyGameClient( self, f23_arg2 )
		GoBack( self, f23_arg2 )
		return true
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		return true
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		menu = f4_local1
	} )
	if not self:restoreState() then
		self.TeamLogoImageButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanelShaderContainer0:close()
		element.FadeForStreamer:close()
		element.GenericMenuFrame:close()
		element.TeamNameInputButton:close()
		element.TeamColorList:close()
		element.TeamLogoImageButton:close()
		element.CodCasterFakeMap:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EditTeamIdentity.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

