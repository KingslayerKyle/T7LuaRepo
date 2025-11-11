require( "ui.uieditor.menus.GameSettings.GameSettings_OptionsMenu" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsButtons_Flyout" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )

LUI.createMenu.Competitive_Settings = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( 0, 1, 0, 0 )
	GameSettingsBackground:setTopBottom( 0, 1, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MENU_COMPETITIVE_SETTINGS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_COMPETITIVE_SETTINGS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local DraftSettings = CoD.Competitive_SettingsList.new( self, controller )
	DraftSettings:setLeftRight( 0, 0, 0, 936 )
	DraftSettings:setTopBottom( 0, 0, 448, 610 )
	DraftSettings.Title.DescTitle:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_SETTINGS_CAPS" ) )
	DraftSettings.ButtonList:setDataSource( "CompetitiveDraftSettings" )
	self:addElement( DraftSettings )
	self.DraftSettings = DraftSettings
	
	local BanProtectSettings = CoD.Competitive_SettingsList.new( self, controller )
	BanProtectSettings:setLeftRight( 0, 0, 0, 936 )
	BanProtectSettings:setTopBottom( 0, 0, 135, 448 )
	BanProtectSettings.Title.DescTitle:setText( Engine.Localize( "MENU_BAN_PROTECT_SETTINGS_CAPS" ) )
	BanProtectSettings.ButtonList:setVerticalCount( 5 )
	BanProtectSettings.ButtonList:setDataSource( "CompetitiveBanProtectSettings" )
	self:addElement( BanProtectSettings )
	self.BanProtectSettings = BanProtectSettings
	
	local AdvancedSettingsButton = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	AdvancedSettingsButton:makeFocusable()
	AdvancedSettingsButton:setLeftRight( 0, 0, 59, 479 )
	AdvancedSettingsButton:setTopBottom( 0, 0, 666, 714 )
	AdvancedSettingsButton:setWidgetType( CoD.List1ButtonLarge_PH )
	AdvancedSettingsButton:setSpacing( 0 )
	AdvancedSettingsButton:setDataSource( "CompetitiveAdvancedSettingsButtons" )
	AdvancedSettingsButton:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		GameSettingsButtonGainFocus( self, element, controller )
		return retVal
	end )
	AdvancedSettingsButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	AdvancedSettingsButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( AdvancedSettingsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( AdvancedSettingsButton )
	self.AdvancedSettingsButton = AdvancedSettingsButton
	
	local BanRestrictionsTitle = CoD.StartMenu_OptionHighlight.new( self, controller )
	BanRestrictionsTitle:setLeftRight( 0, 0, 66, 579 )
	BanRestrictionsTitle:setTopBottom( 0, 0, 714, 774 )
	BanRestrictionsTitle:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	BanRestrictionsTitle.DescTitle:setText( Engine.Localize( "MENU_ITEM_BANS_RESTRICTIONS_CAPS" ) )
	self:addElement( BanRestrictionsTitle )
	self.BanRestrictionsTitle = BanRestrictionsTitle
	
	local CompetitiveSettingsButtonsFlyout = CoD.Competitive_SettingsButtons_Flyout.new( self, controller )
	CompetitiveSettingsButtonsFlyout:setLeftRight( 0, 0, 66, 987 )
	CompetitiveSettingsButtonsFlyout:setTopBottom( 0, 0, 774, 1014 )
	CompetitiveSettingsButtonsFlyout:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		GameSettingsButtonGainFocus( self, element, controller )
		return retVal
	end )
	LUI.OverrideFunction_CallOriginalFirst( CompetitiveSettingsButtonsFlyout, "setState", function ( element, state )
		if not IsInDefaultState( element ) then
			MakeElementNotFocusable( self, "BanProtectSettings", controller )
			MakeElementNotFocusable( self, "DraftSettings", controller )
			MakeElementNotFocusable( self, "AdvancedSettingsButton", controller )
			PlaySoundSetSound( self, "toggle" )
		elseif IsInDefaultState( element ) then
			MakeElementFocusable( self, "AdvancedSettingsButton", controller )
			MakeElementFocusable( self, "BanProtectSettings", controller )
			MakeElementFocusable( self, "DraftSettings", controller )
		end
	end )
	self:addElement( CompetitiveSettingsButtonsFlyout )
	self.CompetitiveSettingsButtonsFlyout = CompetitiveSettingsButtonsFlyout
	
	local AdvancedSettingsTitle = CoD.StartMenu_OptionHighlight.new( self, controller )
	AdvancedSettingsTitle:setLeftRight( 0, 0, 59, 572 )
	AdvancedSettingsTitle:setTopBottom( 0, 0, 610, 670 )
	AdvancedSettingsTitle:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	AdvancedSettingsTitle.DescTitle:setText( Engine.Localize( "MENU_ADVANCED_SETTINGS_CAPS" ) )
	self:addElement( AdvancedSettingsTitle )
	self.AdvancedSettingsTitle = AdvancedSettingsTitle
	
	DraftSettings.navigation = {
		up = BanProtectSettings,
		down = AdvancedSettingsButton
	}
	BanProtectSettings.navigation = {
		down = DraftSettings
	}
	AdvancedSettingsButton.navigation = {
		up = DraftSettings,
		down = CompetitiveSettingsButtonsFlyout
	}
	CompetitiveSettingsButtonsFlyout.navigation = {
		up = AdvancedSettingsButton
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		OpenPopup( self, "GameSettings_OptionsMenu", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
		return true
	end, false )
	DraftSettings.id = "DraftSettings"
	BanProtectSettings.id = "BanProtectSettings"
	AdvancedSettingsButton.id = "AdvancedSettingsButton"
	CompetitiveSettingsButtonsFlyout.id = "CompetitiveSettingsButtonsFlyout"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.BanProtectSettings:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingsBackground:close()
		self.DraftSettings:close()
		self.BanProtectSettings:close()
		self.AdvancedSettingsButton:close()
		self.BanRestrictionsTitle:close()
		self.CompetitiveSettingsButtonsFlyout:close()
		self.AdvancedSettingsTitle:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

