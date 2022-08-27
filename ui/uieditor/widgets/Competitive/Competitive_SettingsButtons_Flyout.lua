-- d61fc61c27fa9695397329335e4ec9a2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GameSettings.GameSettings_Button" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if not CoD.useMouse then
		return 
	else
		f1_arg0:setForceMouseEventDispatch( true )
		LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "setState", function ( element, controller )
			if IsSelfInState( f1_arg0, "CACOptionsVisible" ) then
				f1_arg0.CaCOptions:setMouseDisabled( false )
				f1_arg0.ButtonList:setMouseDisabled( true )
				f1_arg0.m_playlistSet = false
			else
				f1_arg0.CaCOptions:setMouseDisabled( true )
				f1_arg0.ButtonList:setMouseDisabled( false )
			end
		end )
		f1_arg0.CaCOptions:setMouseDisabled( true )
		f1_arg0.CaCOptions:registerEventHandler( "leftclick_outside", function ( element, event )
			if IsSelfInState( f1_arg0, "CACOptionsVisible" ) and f1_arg0.m_playlistSet then
				CoD.PCUtil.SimulateButtonPress( f1_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
			end
			f1_arg0.m_playlistSet = true
			return true
		end )
	end
end

local PreLoadFunc = function ( self, controller )
	SetGlobalModelValueFalse( "lobbyRoot.ShowCACItemBansRestrictionFlyout" )
end

local PostLoadFunc = function ( self, controller, menu )
	f0_local0( self, controller )
	MakeElementNotFocusable( self, "CaCOptions", controller )
end

function OpenScorestreakRestrictions( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4 )
	f6_arg4:saveState()
	OpenPopup( f6_arg0, "Competitive_Settings_Scorestreaks", f6_arg2 )
end

function OpenSpecialistRestrictions( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
	f7_arg4:saveState()
	OpenPopup( f7_arg0, "Competitive_Settings_Specialists", f7_arg2 )
end

local f0_local3 = function ( f8_arg0 )
	local f8_local0 = {
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
	local f8_local1 = {}
	for f8_local5, f8_local6 in ipairs( f8_local0 ) do
		table.insert( f8_local1, {
			models = {
				displayText = Engine.Localize( f8_local6.optionDisplay ),
				customId = f8_local6.customId
			},
			properties = {
				title = f8_local6.optionDisplay,
				desc = f8_local6.desc,
				action = f8_local6.action,
				actionParam = f8_local6.actionParam
			}
		} )
	end
	return f8_local1
end

function OpenWeaponRestrictions( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
	f9_arg4:saveState()
	OpenOverlay( f9_arg0, "Competitive_Settings_Weapons", f9_arg2 )
end

function OpenAttachmentRestrictions( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
	f10_arg4:saveState()
	OpenOverlay( f10_arg0, "Competitive_Settings_Attachments", f10_arg2 )
end

function OpenPerkRestrictions( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
	f11_arg4:saveState()
	OpenOverlay( f11_arg0, "Competitive_Settings_Perks", f11_arg2 )
end

function OpenEquipmentRestrictions( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
	f12_arg4:saveState()
	OpenOverlay( f12_arg0, "Competitive_Settings_Equipment", f12_arg2 )
end

function OpenWildcardRestrictions( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4 )
	f13_arg4:saveState()
	OpenOverlay( f13_arg0, "Competitive_Settings_Wildcards", f13_arg2 )
end

local f0_local4 = function ( f14_arg0 )
	local f14_local0 = {
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
	local f14_local1 = {}
	for f14_local5, f14_local6 in ipairs( f14_local0 ) do
		table.insert( f14_local1, {
			models = {
				displayText = Engine.Localize( f14_local6.optionDisplay ),
				customId = f14_local6.customId
			},
			properties = {
				title = f14_local6.optionDisplay,
				desc = f14_local6.desc,
				action = f14_local6.action,
				actionParam = f14_local6.actionParam
			}
		} )
	end
	return f14_local1
end

DataSources.CompetitiveSettingsButtons = DataSourceHelpers.ListSetup( "CompetitiveSettingsButtons", f0_local3, nil, nil, nil )
DataSources.CompetitiveSettingsCategoryButtons = DataSourceHelpers.ListSetup( "CompetitiveSettingsCategoryButtons", f0_local4, nil, nil, nil )
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
		local f16_local0 = nil
		GameSettingsButtonGainFocus( self, element, controller )
		return f16_local0
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return f17_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		ProcessListAction( self, f19_arg0, f19_arg2 )
		return true
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		OpenGameSettingsOptionsMenu( self, f21_arg0, f21_arg2, f21_arg1 )
		return true
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_START, "DEMO_OPTIONS_HINT" )
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
		local f23_local0 = nil
		if element.gainFocus then
			f23_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f23_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return f23_local0
	end )
	CaCOptions:registerEventHandler( "lose_focus", function ( element, event )
		local f24_local0 = nil
		if element.loseFocus then
			f24_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f24_local0 = element.super:loseFocus( event )
		end
		return f24_local0
	end )
	menu:AddButtonCallbackFunction( CaCOptions, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		SetGlobalModelValueFalse( "lobbyRoot.ShowCACItemBansRestrictionFlyout" )
		return true
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( CaCOptions, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		ProcessListAction( self, f27_arg0, f27_arg2 )
		return true
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( CaCOptions, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
		OpenGameSettingsOptionsMenu( self, f29_arg0, f29_arg2, f29_arg1 )
		return true
	end, function ( f30_arg0, f30_arg1, f30_arg2 )
		CoD.Menu.SetButtonLabel( f30_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
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
		local f34_local0 = self
		if not IsGlobalModelValueTrue( f34_local0, controller, "lobbyRoot.ShowCACItemBansRestrictionFlyout" ) and not IsInDefaultStateOrStateNotSet( f34_local0 ) then
			SetState( self, "DefaultState" )
			SetLoseFocusToElement( self, "ButtonList", controller )
			MakeElementNotFocusable( self, "CaCOptions", controller )
			MakeElementFocusable( self, "ButtonList", controller )
			SetFocusToElement( self, "ButtonList", controller )
			PlaySoundSetSound( self, "toggle" )
		elseif IsGlobalModelValueTrue( f34_local0, controller, "lobbyRoot.ShowCACItemBansRestrictionFlyout" ) then
			SetState( self, "CACOptionsVisible" )
			SetLoseFocusToElement( self, "ButtonList", controller )
			MakeElementNotFocusable( self, "ButtonList", controller )
			MakeElementFocusable( self, "CaCOptions", controller )
			SetFocusToElement( self, "CaCOptions", controller )
		end
	end )
	ButtonList.id = "ButtonList"
	CaCOptions.id = "CaCOptions"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
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

