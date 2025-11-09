require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CodCaster.codcaster_options_slider" )
require( "ui.uieditor.widgets.CodCaster.CodCasterTeamIdentityInformationPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Optionstextbox" )
require( "ui.uieditor.widgets.Theater.Theater_HintText" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( DataSources.TeamIdentity.getModel( controller ), "team" )
	if not Engine.GetModelValue( f1_local0 ) then
		Engine.SetModelValue( f1_local0, "team" )
	end
	CoD.SetupTeamIdentityInformation( self, controller, "team1" )
	CoD.SetupTeamIdentityInformation( self, controller, "team2" )
end

LUI.createMenu.EditCodCasterSettings = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EditCodCasterSettings" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EditCodCasterSettings.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, true, 0, 0 )
	FEButtonPanelShaderContainer0:setTopBottom( true, true, 0, 0 )
	FEButtonPanelShaderContainer0:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
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
		self:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame.titleLabel:setText( Engine.Localize( "MENU_EDIT_CODCASTER_SETTINGS" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EDIT_CODCASTER_SETTINGS" ) )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 27, 697 )
	ButtonList:setTopBottom( true, false, 172, 442 )
	ButtonList:setWidgetType( CoD.codcaster_options_slider )
	ButtonList:setVerticalCount( 8 )
	ButtonList:setDataSource( "EditCodCasterSettingsButtonList" )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	self:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if HasProperty( element, "action" ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if HasProperty( element, "action" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local CodCasterTeamIdentityInformationPanel = CoD.CodCasterTeamIdentityInformationPanel.new( self, controller )
	CodCasterTeamIdentityInformationPanel:setLeftRight( true, false, 600, 1170.5 )
	CodCasterTeamIdentityInformationPanel:setTopBottom( true, false, 232.5, 592.5 )
	CodCasterTeamIdentityInformationPanel:mergeStateConditions( {
		{
			stateName = "ShowBoth",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "showTeam1Info" ) and IsSelfModelValueTrue( element, controller, "showTeam2Info" )
			end
		},
		{
			stateName = "ShowTeam1Only",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "showTeam1Info" ) and not IsSelfModelValueTrue( element, controller, "showTeam2Info" )
			end
		},
		{
			stateName = "ShowTeam2Only",
			condition = function ( menu, element, event )
				local f11_local0
				if not IsSelfModelValueTrue( element, controller, "showTeam1Info" ) then
					f11_local0 = IsSelfModelValueTrue( element, controller, "showTeam2Info" )
				else
					f11_local0 = false
				end
				return f11_local0
			end
		}
	} )
	CodCasterTeamIdentityInformationPanel:linkToElementModel( CodCasterTeamIdentityInformationPanel, "showTeam1Info", true, function ( model )
		self:updateElementState( CodCasterTeamIdentityInformationPanel, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showTeam1Info"
		} )
	end )
	CodCasterTeamIdentityInformationPanel:linkToElementModel( CodCasterTeamIdentityInformationPanel, "showTeam2Info", true, function ( model )
		self:updateElementState( CodCasterTeamIdentityInformationPanel, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showTeam2Info"
		} )
	end )
	self:addElement( CodCasterTeamIdentityInformationPanel )
	self.CodCasterTeamIdentityInformationPanel = CodCasterTeamIdentityInformationPanel
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, false, 0, 1280 )
	GenericMenuFrame0:setTopBottom( true, false, 0, 720 )
	GenericMenuFrame0.titleLabel:setText( LocalizeToUpperString( "MENU_EDIT_CODCASTER_SETTINGS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeToUpperString( "MENU_EDIT_CODCASTER_SETTINGS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_codcaster" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local DescTitle = LUI.UITightText.new()
	DescTitle:setLeftRight( true, false, 68, 145 )
	DescTitle:setTopBottom( true, false, 145, 165 )
	DescTitle:setText( Engine.Localize( "MENU_SETTINGS_CAPS" ) )
	DescTitle:setTTF( "fonts/escom.ttf" )
	DescTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	DescTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	DescTitle:setShaderVector( 1, 0, 0, 0, 0 )
	DescTitle:setShaderVector( 2, 1, 0, 0, 0 )
	DescTitle:setLetterSpacing( 1 )
	LUI.OverrideFunction_CallOriginalFirst( DescTitle, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( DescTitle )
	self.DescTitle = DescTitle
	
	local DescTitle0 = LUI.UITightText.new()
	DescTitle0:setLeftRight( true, false, 68, 171 )
	DescTitle0:setTopBottom( true, false, 327, 347 )
	DescTitle0:setText( LocalizeToUpperString( "CODCASTER_TEAM_IDENTITY" ) )
	DescTitle0:setTTF( "fonts/escom.ttf" )
	DescTitle0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	DescTitle0:setShaderVector( 0, 0.08, 0, 0, 0 )
	DescTitle0:setShaderVector( 1, 0, 0, 0, 0 )
	DescTitle0:setShaderVector( 2, 1, 0, 0, 0 )
	DescTitle0:setLetterSpacing( 1 )
	LUI.OverrideFunction_CallOriginalFirst( DescTitle0, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( DescTitle0 )
	self.DescTitle0 = DescTitle0
	
	local TitleBox = CoD.scorestreaks_TitleBox.new( self, controller )
	TitleBox:setLeftRight( true, false, 601, 852 )
	TitleBox:setTopBottom( true, false, 137.5, 172.5 )
	TitleBox.TitleGlow1:setAlpha( 0.9 )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	local GameSettingsOptionstextbox = CoD.GameSettings_Optionstextbox.new( self, controller )
	GameSettingsOptionstextbox:setLeftRight( true, false, 601, 1048.5 )
	GameSettingsOptionstextbox:setTopBottom( true, false, 175.91, 197.91 )
	self:addElement( GameSettingsOptionstextbox )
	self.GameSettingsOptionstextbox = GameSettingsOptionstextbox
	
	local TheaterHintText = CoD.Theater_HintText.new( self, controller )
	TheaterHintText:setLeftRight( true, false, 64, 344 )
	TheaterHintText:setTopBottom( true, false, 506, 531 )
	self:addElement( TheaterHintText )
	self.TheaterHintText = TheaterHintText
	
	CodCasterTeamIdentityInformationPanel:linkToElementModel( ButtonList, nil, false, function ( model )
		CodCasterTeamIdentityInformationPanel:setModel( model, controller )
	end )
	TitleBox:linkToElementModel( ButtonList, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			TitleBox.ScorestreaksLabel:setText( Engine.Localize( displayText ) )
		end
	end )
	GameSettingsOptionstextbox:linkToElementModel( ButtonList, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			GameSettingsOptionstextbox.TextBox:setText( Engine.Localize( hintText ) )
		end
	end )
	TheaterHintText:linkToElementModel( ButtonList, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			TheaterHintText.ItemHintText:setText( Engine.Localize( hintText ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f20_local0 = nil
		ShowHeaderKickerAndIcon( self )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClip( self, "intro", controller )
		SetHeadingKickerText( "MENU_CUSTOM_GAMES" )
		if not f20_local0 then
			f20_local0 = self:dispatchEventToChildren( event )
		end
		return f20_local0
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
	GenericMenuFrame:setModel( self.buttonModel, controller )
	ButtonList.id = "ButtonList"
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanelShaderContainer0:close()
		element.FadeForStreamer:close()
		element.GenericMenuFrame:close()
		element.ButtonList:close()
		element.CodCasterTeamIdentityInformationPanel:close()
		element.GenericMenuFrame0:close()
		element.FEMenuLeftGraphics:close()
		element.TitleBox:close()
		element.GameSettingsOptionstextbox:close()
		element.TheaterHintText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EditCodCasterSettings.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

