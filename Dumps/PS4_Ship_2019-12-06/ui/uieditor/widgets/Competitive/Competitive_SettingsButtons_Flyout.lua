require( "ui.uieditor.widgets.GameSettings.GameSettings_Button" )

local PreLoadFunc = function ( self, controller )
	SetGlobalModelValueFalse( "lobbyRoot.ShowCACItemBansRestrictionFlyout" )
end

local PostLoadFunc = function ( self, controller, menu )
	MakeElementNotFocusable( self, "CaCOptions", controller )
end

function OpenScorestreakRestrictions( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4 )
	f3_arg4:saveState()
	OpenPopup( f3_arg0, "Competitive_Settings_Scorestreaks", f3_arg2 )
end

function OpenSpecialistRestrictions( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
	f4_arg4:saveState()
	OpenPopup( f4_arg0, "Competitive_Settings_Specialists", f4_arg2 )
end

local f0_local2 = function ( f5_arg0 )
	local f5_local0 = {
		{
			optionDisplay = "MENU_CREATE_A_CLASS",
			desc = "MENU_GENERIC_RESTRICTION_DESC",
			customId = "btnCAC",
			action = OpenCACItemBansRestrictionsFlyout,
			actionParam = {
				"Competitive_Settings_Weapons",
				"Competitive_Settings_Attachments",
				"Competitive_Settings_Perks",
				"Competitive_Settings_Equipment",
				"Competitive_Settings_Wildcards"
			}
		},
		{
			optionDisplay = "MENU_SPECIALISTS",
			desc = "MENU_GENERIC_RESTRICTION_DESC",
			customId = "btnHeroes",
			action = OpenSpecialistRestrictions,
			actionParam = {
				"Competitive_Settings_Specialists"
			}
		},
		{
			optionDisplay = "MENU_SCORESTREAKS",
			desc = "MENU_GENERIC_RESTRICTION_DESC",
			customId = "btnScorestreaks",
			action = OpenScorestreakRestrictions,
			actionParam = {
				"Competitive_Settings_Scorestreaks"
			}
		}
	}
	local f5_local1 = {}
	for f5_local5, f5_local6 in ipairs( f5_local0 ) do
		table.insert( f5_local1, {
			models = {
				displayText = Engine.Localize( f5_local6.optionDisplay ),
				customId = f5_local6.customId
			},
			properties = {
				title = f5_local6.optionDisplay,
				desc = f5_local6.desc,
				action = f5_local6.action,
				actionParam = f5_local6.actionParam
			}
		} )
	end
	return f5_local1
end

function OpenWeaponRestrictions( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4 )
	f6_arg4:saveState()
	OpenOverlay( f6_arg0, "Competitive_Settings_Weapons", f6_arg2 )
end

function OpenAttachmentRestrictions( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
	f7_arg4:saveState()
	OpenOverlay( f7_arg0, "Competitive_Settings_Attachments", f7_arg2 )
end

function OpenPerkRestrictions( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
	f8_arg4:saveState()
	OpenOverlay( f8_arg0, "Competitive_Settings_Perks", f8_arg2 )
end

function OpenEquipmentRestrictions( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
	f9_arg4:saveState()
	OpenOverlay( f9_arg0, "Competitive_Settings_Equipment", f9_arg2 )
end

function OpenWildcardRestrictions( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
	f10_arg4:saveState()
	OpenOverlay( f10_arg0, "Competitive_Settings_Wildcards", f10_arg2 )
end

local f0_local3 = function ( f11_arg0 )
	local f11_local0 = {
		{
			optionDisplay = "MENU_WEAPONS",
			desc = "MENU_GENERIC_RESTRICTION_DESC",
			customId = "btnWeapons",
			action = OpenWeaponRestrictions,
			actionParam = {
				"Competitive_Settings_Weapons"
			}
		},
		{
			optionDisplay = "MENU_ATTACHMENTS",
			desc = "MENU_ATTACHMENT_RESTRICTION_DESC",
			customId = "btnAttachments",
			action = OpenAttachmentRestrictions,
			actionParam = {
				"Competitive_Settings_Attachments"
			}
		},
		{
			optionDisplay = "MENU_PERKS",
			desc = "MENU_GENERIC_RESTRICTION_DESC",
			customId = "btnPerks",
			action = OpenPerkRestrictions,
			actionParam = {
				"Competitive_Settings_Perks"
			}
		},
		{
			optionDisplay = "MENU_EQUIPMENT",
			desc = "MENU_GENERIC_RESTRICTION_DESC",
			customId = "btnEquipment",
			action = OpenEquipmentRestrictions,
			actionParam = {
				"Competitive_Settings_Equipment"
			}
		},
		{
			optionDisplay = "MENU_WILDCARDS",
			desc = "MENU_GENERIC_RESTRICTION_DESC",
			customId = "btnWildcards",
			action = OpenWildcardRestrictions,
			actionParam = {
				"Competitive_Settings_Wildcards"
			}
		}
	}
	local f11_local1 = {}
	for f11_local5, f11_local6 in ipairs( f11_local0 ) do
		table.insert( f11_local1, {
			models = {
				displayText = Engine.Localize( f11_local6.optionDisplay ),
				customId = f11_local6.customId
			},
			properties = {
				title = f11_local6.optionDisplay,
				desc = f11_local6.desc,
				action = f11_local6.action,
				actionParam = f11_local6.actionParam
			}
		} )
	end
	return f11_local1
end

DataSources.CompetitiveSettingsButtons = DataSourceHelpers.ListSetup( "CompetitiveSettingsButtons", f0_local2, nil, nil, nil )
DataSources.CompetitiveSettingsCategoryButtons = DataSourceHelpers.ListSetup( "CompetitiveSettingsCategoryButtons", f0_local3, nil, nil, nil )
CoD.Competitive_SettingsButtons_Flyout = InheritFrom( LUI.UIElement )
CoD.Competitive_SettingsButtons_Flyout.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Competitive_SettingsButtons_Flyout )
	self.id = "Competitive_SettingsButtons_Flyout"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 633 )
	self:setTopBottom( true, false, 0, 160 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ButtonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 0, 280 )
	ButtonList:setTopBottom( true, false, 0, 100 )
	ButtonList:setDataSource( "CompetitiveSettingsButtons" )
	ButtonList:setWidgetType( CoD.GameSettings_Button )
	ButtonList:setVerticalCount( 3 )
	ButtonList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f13_local0 = nil
		GameSettingsButtonGainFocus( self, element, controller )
		return f13_local0
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return f14_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "DEMO_OPTIONS_HINT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local Spacer = LUI.UIImage.new()
	Spacer:setLeftRight( true, false, 280, 290 )
	Spacer:setTopBottom( true, false, 0, 128 )
	Spacer:setAlpha( 0 )
	self:addElement( Spacer )
	self.Spacer = Spacer
	
	local CaCOptions = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	CaCOptions:makeFocusable()
	CaCOptions:setLeftRight( true, false, 290, 570 )
	CaCOptions:setTopBottom( true, false, 0, 160 )
	CaCOptions:setAlpha( 0 )
	CaCOptions:setDataSource( "CompetitiveSettingsCategoryButtons" )
	CaCOptions:setWidgetType( CoD.GameSettings_Button )
	CaCOptions:setVerticalCount( 5 )
	CaCOptions:setSpacing( 0 )
	CaCOptions:registerEventHandler( "gain_focus", function ( element, event )
		local f20_local0 = nil
		if element.gainFocus then
			f20_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f20_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return f20_local0
	end )
	CaCOptions:registerEventHandler( "lose_focus", function ( element, event )
		local f21_local0 = nil
		if element.loseFocus then
			f21_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f21_local0 = element.super:loseFocus( event )
		end
		return f21_local0
	end )
	menu:AddButtonCallbackFunction( CaCOptions, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		SetGlobalModelValueFalse( "lobbyRoot.ShowCACItemBansRestrictionFlyout" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( CaCOptions, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( CaCOptions, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		return true
	end, false )
	self:addElement( CaCOptions )
	self.CaCOptions = CaCOptions
	
	ButtonList.navigation = {
		right = CaCOptions
	}
	CaCOptions.navigation = {
		left = ButtonList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 1 )
				self.clipFinished( ButtonList, {} )
				CaCOptions:completeAnimation()
				self.CaCOptions:setAlpha( 0 )
				self.clipFinished( CaCOptions, {} )
			end
		},
		CACOptionsVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 0.5 )
				self.clipFinished( ButtonList, {} )
				CaCOptions:completeAnimation()
				self.CaCOptions:setAlpha( 1 )
				self.clipFinished( CaCOptions, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetGlobalModelValueFalse( "lobbyRoot.ShowCACItemBansRestrictionFlyout" )
	end )
	self:subscribeToGlobalModel( controller, "LobbyRoot", "ShowCACItemBansRestrictionFlyout", function ( model )
		local f31_local0 = self
		if not IsGlobalModelValueTrue( f31_local0, controller, "lobbyRoot.ShowCACItemBansRestrictionFlyout" ) and not IsInDefaultStateOrStateNotSet( f31_local0 ) then
			SetState( self, "DefaultState" )
			SetLoseFocusToElement( self, "ButtonList", controller )
			MakeElementNotFocusable( self, "CaCOptions", controller )
			MakeElementFocusable( self, "ButtonList", controller )
			SetFocusToElement( self, "ButtonList", controller )
			PlaySoundSetSound( self, "toggle" )
		elseif IsGlobalModelValueTrue( f31_local0, controller, "lobbyRoot.ShowCACItemBansRestrictionFlyout" ) then
			SetState( self, "CACOptionsVisible" )
			SetLoseFocusToElement( self, "ButtonList", controller )
			MakeElementNotFocusable( self, "ButtonList", controller )
			MakeElementFocusable( self, "CaCOptions", controller )
			SetFocusToElement( self, "CaCOptions", controller )
		end
	end )
	ButtonList.id = "ButtonList"
	CaCOptions.id = "CaCOptions"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.CaCOptions:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

