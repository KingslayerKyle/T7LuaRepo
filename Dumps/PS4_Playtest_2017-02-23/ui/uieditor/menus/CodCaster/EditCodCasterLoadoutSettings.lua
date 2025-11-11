require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CodCaster.codcaster_options_slider" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Optionstextbox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )

LUI.createMenu.EditCodCasterLoadoutSettings = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EditCodCasterLoadoutSettings" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EditCodCasterLoadoutSettings.buttonPrompts" )
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
	GenericMenuFrame.titleLabel:setText( LocalizeToUpperString( "CODCASTER_LOADOUT_SETTINGS" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeToUpperString( "CODCASTER_LOADOUT_SETTINGS" ) )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0, 0, 41, 1046 )
	ButtonList:setTopBottom( 0, 0, 227, 825 )
	ButtonList:setWidgetType( CoD.codcaster_options_slider )
	ButtonList:setVerticalCount( 12 )
	ButtonList:setDataSource( "CodCasterLoadoutSettingsButtonList" )
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
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 27, 105 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 136, 1062 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local TitleBox = CoD.scorestreaks_TitleBox.new( self, controller )
	TitleBox:setLeftRight( 0, 0, 1058, 1434 )
	TitleBox:setTopBottom( 0, 0, 212, 264 )
	TitleBox.TitleGlow1:setAlpha( 0.9 )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	local GameSettingsOptionstextbox = CoD.GameSettings_Optionstextbox.new( self, controller )
	GameSettingsOptionstextbox:setLeftRight( 0, 0, 1058, 1741 )
	GameSettingsOptionstextbox:setTopBottom( 0, 0, 269, 302 )
	self:addElement( GameSettingsOptionstextbox )
	self.GameSettingsOptionstextbox = GameSettingsOptionstextbox
	
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SaveShoutcasterSettings( self, element, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	GenericMenuFrame:setModel( self.buttonModel, controller )
	ButtonList.id = "ButtonList"
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
		self.FEMenuLeftGraphics:close()
		self.TitleBox:close()
		self.GameSettingsOptionstextbox:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EditCodCasterLoadoutSettings.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

