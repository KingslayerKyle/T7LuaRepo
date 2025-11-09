require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CodCaster.codcaster_options_slider" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.CodCaster.CodCasterTeamIdentityInformationPanel" )

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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EditCodCasterSettings.buttonPrompts" )
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
	GenericMenuFrame.titleLabel:setText( Engine.Localize( "MENU_EDIT_CODCASTER_SETTINGS" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EDIT_CODCASTER_SETTINGS" ) )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 79, 589 )
	ButtonList:setTopBottom( true, false, 107.5, 361.5 )
	ButtonList:setDataSource( "EditCodCasterSettingsButtonList" )
	ButtonList:setWidgetType( CoD.codcaster_options_slider )
	ButtonList:setVerticalCount( 8 )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if HasProperty( element, "action" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, false, 705, 1190 )
	Desc:setTopBottom( true, false, 155, 177 )
	Desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local StartMenuOptionHighlight = CoD.StartMenu_OptionHighlight.new( self, controller )
	StartMenuOptionHighlight:setLeftRight( true, false, 695, 841 )
	StartMenuOptionHighlight:setTopBottom( true, false, 107.5, 147.5 )
	StartMenuOptionHighlight:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	StartMenuOptionHighlight.DescTitle:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	self:addElement( StartMenuOptionHighlight )
	self.StartMenuOptionHighlight = StartMenuOptionHighlight
	
	local Image00000 = LUI.UIImage.new()
	Image00000:setLeftRight( true, false, 641, 657 )
	Image00000:setTopBottom( true, false, 107.5, 115.5 )
	Image00000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000 )
	self.Image00000 = Image00000
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( true, false, 641, 657 )
	Image000000:setTopBottom( true, false, 209.5, 217.5 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local CodCasterTeamIdentityInformationPanel = CoD.CodCasterTeamIdentityInformationPanel.new( self, controller )
	CodCasterTeamIdentityInformationPanel:setLeftRight( true, false, 705, 1160.5 )
	CodCasterTeamIdentityInformationPanel:setTopBottom( true, false, 240, 600 )
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
				local f9_local0
				if not IsSelfModelValueTrue( element, controller, "showTeam1Info" ) then
					f9_local0 = IsSelfModelValueTrue( element, controller, "showTeam2Info" )
				else
					f9_local0 = false
				end
				return f9_local0
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
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "MENU_EDIT_CODCASTER_SETTINGS" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( "MENU_EDIT_CODCASTER_SETTINGS" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_codcaster" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local TeamIdentity = LUI.UIText.new()
	TeamIdentity:setLeftRight( true, false, 90, 290 )
	TeamIdentity:setTopBottom( true, false, 255, 280 )
	TeamIdentity:setText( Engine.Localize( LocalizeToUpperString( "CODCASTER_TEAM_IDENTITY" ) ) )
	TeamIdentity:setTTF( "fonts/default.ttf" )
	TeamIdentity:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamIdentity:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamIdentity )
	self.TeamIdentity = TeamIdentity
	
	Desc:linkToElementModel( ButtonList, "hintText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Desc:setText( Engine.Localize( modelValue ) )
		end
	end )
	StartMenuOptionHighlight:linkToElementModel( ButtonList, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuOptionHighlight.DescTitle:setText( Engine.Localize( LocalizeToUpperString( modelValue ) ) )
		end
	end )
	CodCasterTeamIdentityInformationPanel:linkToElementModel( ButtonList, nil, false, function ( model )
		CodCasterTeamIdentityInformationPanel:setModel( model, controller )
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClip( self, "intro", controller )
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
		self.GenericMenuFrame:close()
		self.ButtonList:close()
		self.StartMenuOptionHighlight:close()
		self.CodCasterTeamIdentityInformationPanel:close()
		self.GenericMenuFrame0:close()
		self.Desc:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EditCodCasterSettings.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

