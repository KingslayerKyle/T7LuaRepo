require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CodCaster.codcaster_options_slider" )
require( "ui.uieditor.widgets.CodCaster.CodCasterTeamIdentityInformationPanel" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Optionstextbox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )
require( "ui.uieditor.widgets.Theater.Theater_HintText" )

local PreLoadFunc = function ( self, controller )
	local teamIdentityModel = DataSources.TeamIdentity.getModel( controller )
	local teamModel = Engine.CreateModel( teamIdentityModel, "team" )
	local team = Engine.GetModelValue( teamModel )
	if not team then
		Engine.SetModelValue( teamModel, "team" )
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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EditCodCasterSettings.buttonPrompts" )
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
	GenericMenuFrame.titleLabel:setText( Engine.Localize( "MENU_EDIT_CODCASTER_SETTINGS" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EDIT_CODCASTER_SETTINGS" ) )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0, 0, 41, 1046 )
	ButtonList:setTopBottom( 0, 0, 261, 659 )
	ButtonList:setWidgetType( CoD.codcaster_options_slider )
	ButtonList:setVerticalCount( 8 )
	ButtonList:setDataSource( "EditCodCasterSettingsButtonList" )
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
		if HasProperty( element, "action" ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if HasProperty( element, "action" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local CodCasterTeamIdentityInformationPanel = CoD.CodCasterTeamIdentityInformationPanel.new( self, controller )
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
	CodCasterTeamIdentityInformationPanel:setLeftRight( 0, 0, 900, 1756 )
	CodCasterTeamIdentityInformationPanel:setTopBottom( 0, 0, 349, 889 )
	self:addElement( CodCasterTeamIdentityInformationPanel )
	self.CodCasterTeamIdentityInformationPanel = CodCasterTeamIdentityInformationPanel
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( 0, 0, 0, 1920 )
	GenericMenuFrame0:setTopBottom( 0, 0, 0, 1080 )
	GenericMenuFrame0.titleLabel:setText( LocalizeToUpperString( "MENU_EDIT_CODCASTER_SETTINGS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeToUpperString( "MENU_EDIT_CODCASTER_SETTINGS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_codcaster" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 27, 105 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 136, 1062 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local DescTitle = LUI.UITightText.new()
	DescTitle:setLeftRight( 0, 0, 102, 218 )
	DescTitle:setTopBottom( 0, 0, 217, 247 )
	DescTitle:setText( Engine.Localize( "MENU_SETTINGS_CAPS" ) )
	DescTitle:setTTF( "fonts/escom.ttf" )
	DescTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	DescTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	DescTitle:setShaderVector( 1, 0, 0, 0, 0 )
	DescTitle:setShaderVector( 2, 1, 0, 0, 0 )
	DescTitle:setLetterSpacing( 1 )
	LUI.OverrideFunction_CallOriginalFirst( DescTitle, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( DescTitle )
	self.DescTitle = DescTitle
	
	local DescTitle0 = LUI.UITightText.new()
	DescTitle0:setLeftRight( 0, 0, 102, 256 )
	DescTitle0:setTopBottom( 0, 0, 491, 521 )
	DescTitle0:setText( LocalizeToUpperString( "CODCASTER_TEAM_IDENTITY" ) )
	DescTitle0:setTTF( "fonts/escom.ttf" )
	DescTitle0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	DescTitle0:setShaderVector( 0, 0.08, 0, 0, 0 )
	DescTitle0:setShaderVector( 1, 0, 0, 0, 0 )
	DescTitle0:setShaderVector( 2, 1, 0, 0, 0 )
	DescTitle0:setLetterSpacing( 1 )
	LUI.OverrideFunction_CallOriginalFirst( DescTitle0, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( DescTitle0 )
	self.DescTitle0 = DescTitle0
	
	local TitleBox = CoD.scorestreaks_TitleBox.new( self, controller )
	TitleBox:setLeftRight( 0, 0, 902, 1278 )
	TitleBox:setTopBottom( 0, 0, 206, 258 )
	TitleBox.TitleGlow1:setAlpha( 0.9 )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	local GameSettingsOptionstextbox = CoD.GameSettings_Optionstextbox.new( self, controller )
	GameSettingsOptionstextbox:setLeftRight( 0, 0, 902, 1573 )
	GameSettingsOptionstextbox:setTopBottom( 0, 0, 264, 297 )
	self:addElement( GameSettingsOptionstextbox )
	self.GameSettingsOptionstextbox = GameSettingsOptionstextbox
	
	local TheaterHintText = CoD.Theater_HintText.new( self, controller )
	TheaterHintText:setLeftRight( 0, 0, 96, 516 )
	TheaterHintText:setTopBottom( 0, 0, 702, 740 )
	self:addElement( TheaterHintText )
	self.TheaterHintText = TheaterHintText
	
	CodCasterTeamIdentityInformationPanel:linkToElementModel( ButtonList, nil, false, function ( model )
		CodCasterTeamIdentityInformationPanel:setModel( model, controller )
	end )
	TitleBox:linkToElementModel( ButtonList, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TitleBox.ScorestreaksLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	GameSettingsOptionstextbox:linkToElementModel( ButtonList, "hintText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameSettingsOptionstextbox.TextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	TheaterHintText:linkToElementModel( ButtonList, "hintText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TheaterHintText.ItemHintText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClip( self, "intro", controller )
		SetHeadingKickerText( "MPUI_PUBLIC_MATCH_LOBBY" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanelShaderContainer0:close()
		self.FadeForStreamer:close()
		self.GenericMenuFrame:close()
		self.ButtonList:close()
		self.CodCasterTeamIdentityInformationPanel:close()
		self.GenericMenuFrame0:close()
		self.FEMenuLeftGraphics:close()
		self.TitleBox:close()
		self.GameSettingsOptionstextbox:close()
		self.TheaterHintText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EditCodCasterSettings.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

