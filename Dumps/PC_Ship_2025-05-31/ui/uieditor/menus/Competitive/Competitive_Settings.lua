require( "ui.uieditor.menus.GameSettings.GameSettings_OptionsMenu" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsButtons_Flyout" )

LUI.createMenu.Competitive_Settings = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( true, true, 0, 0 )
	GameSettingsBackground:setTopBottom( true, true, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MENU_COMPETITIVE_SETTINGS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_COMPETITIVE_SETTINGS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local DraftSettings = CoD.Competitive_SettingsList.new( self, controller )
	DraftSettings:setLeftRight( true, false, 0, 624 )
	DraftSettings:setTopBottom( true, false, 298.5, 406.5 )
	DraftSettings.Title.DescTitle:setText( Engine.Localize( "MENU_SPECIALIST_DRAFT_SETTINGS_CAPS" ) )
	DraftSettings.ButtonList:setDataSource( "CompetitiveDraftSettings" )
	self:addElement( DraftSettings )
	self.DraftSettings = DraftSettings
	
	local BanProtectSettings = CoD.Competitive_SettingsList.new( self, controller )
	BanProtectSettings:setLeftRight( true, false, 0, 624 )
	BanProtectSettings:setTopBottom( true, false, 90, 298.5 )
	BanProtectSettings.Title.DescTitle:setText( Engine.Localize( "MENU_BAN_PROTECT_SETTINGS_CAPS" ) )
	BanProtectSettings.ButtonList:setDataSource( "CompetitiveBanProtectSettings" )
	BanProtectSettings.ButtonList:setVerticalCount( 5 )
	self:addElement( BanProtectSettings )
	self.BanProtectSettings = BanProtectSettings
	
	local AdvancedSettingsButton = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, true )
	AdvancedSettingsButton:makeFocusable()
	AdvancedSettingsButton:setLeftRight( true, false, 39, 319 )
	AdvancedSettingsButton:setTopBottom( true, false, 444, 476 )
	AdvancedSettingsButton:setDataSource( "CompetitiveAdvancedSettingsButtons" )
	AdvancedSettingsButton:setWidgetType( CoD.List1ButtonLarge_PH )
	AdvancedSettingsButton:setSpacing( 0 )
	AdvancedSettingsButton:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f2_local0 = nil
		GameSettingsButtonGainFocus( self, element, controller )
		return f2_local0
	end )
	AdvancedSettingsButton:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	AdvancedSettingsButton:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	self:AddButtonCallbackFunction( AdvancedSettingsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( AdvancedSettingsButton )
	self.AdvancedSettingsButton = AdvancedSettingsButton
	
	local BanRestrictionsTitle = CoD.StartMenu_OptionHighlight.new( self, controller )
	BanRestrictionsTitle:setLeftRight( true, false, 44, 386 )
	BanRestrictionsTitle:setTopBottom( true, false, 476, 516 )
	BanRestrictionsTitle:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	BanRestrictionsTitle.DescTitle:setText( Engine.Localize( "MENU_ITEM_BANS_RESTRICTIONS_CAPS" ) )
	self:addElement( BanRestrictionsTitle )
	self.BanRestrictionsTitle = BanRestrictionsTitle
	
	local CompetitiveSettingsButtonsFlyout = CoD.Competitive_SettingsButtons_Flyout.new( self, controller )
	CompetitiveSettingsButtonsFlyout:setLeftRight( true, false, 44, 658 )
	CompetitiveSettingsButtonsFlyout:setTopBottom( true, false, 516, 676 )
	CompetitiveSettingsButtonsFlyout:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f7_local0 = nil
		GameSettingsButtonGainFocus( self, element, controller )
		return f7_local0
	end )
	LUI.OverrideFunction_CallOriginalFirst( CompetitiveSettingsButtonsFlyout, "setState", function ( element, controller )
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
	AdvancedSettingsTitle:setLeftRight( true, false, 39, 381 )
	AdvancedSettingsTitle:setTopBottom( true, false, 406.5, 446.5 )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		OpenPopup( self, "GameSettings_OptionsMenu", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingsBackground:close()
		element.DraftSettings:close()
		element.BanProtectSettings:close()
		element.AdvancedSettingsButton:close()
		element.BanRestrictionsTitle:close()
		element.CompetitiveSettingsButtonsFlyout:close()
		element.AdvancedSettingsTitle:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

