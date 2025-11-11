require( "ui.uieditor.widgets.GameSettings.GameSettings_Button" )

local PreLoadFunc = function ( self, controller )
	SetGlobalModelValueFalse( "lobbyRoot.ShowCACItemBansRestrictionFlyout" )
end

local PostLoadFunc = function ( self, controller, menu )
	MakeElementNotFocusable( self, "CaCOptions", controller )
end

local OpenScorestreakRestrictions = function ( self, element, controller, param, menu )
	menu:saveState()
	OpenPopup( self, "Competitive_Settings_Scorestreaks", controller )
end

local OpenSpecialistRestrictions = function ( self, element, controller, param, menu )
	menu:saveState()
	OpenPopup( self, "Competitive_Settings_Specialists", controller )
end

local PrepareItemBanRestrictionButtons = function ( controller )
	local buttonOptions = {
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
	local buttons = {}
	for index, buttonData in ipairs( buttonOptions ) do
		table.insert( buttons, {
			models = {
				displayText = Engine.Localize( buttonData.optionDisplay ),
				customId = buttonData.customId
			},
			properties = {
				title = buttonData.optionDisplay,
				desc = buttonData.desc,
				action = buttonData.action,
				actionParam = buttonData.actionParam
			}
		} )
	end
	return buttons
end

local OpenWeaponRestrictions = function ( self, element, controller, param, menu )
	menu:saveState()
	OpenOverlay( self, "Competitive_Settings_Weapons", controller )
end

local OpenAttachmentRestrictions = function ( self, element, controller, param, menu )
	menu:saveState()
	OpenOverlay( self, "Competitive_Settings_Attachments", controller )
end

local OpenPerkRestrictions = function ( self, element, controller, param, menu )
	menu:saveState()
	OpenOverlay( self, "Competitive_Settings_Perks", controller )
end

local OpenEquipmentRestrictions = function ( self, element, controller, param, menu )
	menu:saveState()
	OpenOverlay( self, "Competitive_Settings_Equipment", controller )
end

local OpenWildcardRestrictions = function ( self, element, controller, param, menu )
	menu:saveState()
	OpenOverlay( self, "Competitive_Settings_Wildcards", controller )
end

local PrepareItemBanRestrictionCategoryButtons = function ( controller )
	local buttonOptions = {
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
	local buttons = {}
	for index, buttonData in ipairs( buttonOptions ) do
		table.insert( buttons, {
			models = {
				displayText = Engine.Localize( buttonData.optionDisplay ),
				customId = buttonData.customId
			},
			properties = {
				title = buttonData.optionDisplay,
				desc = buttonData.desc,
				action = buttonData.action,
				actionParam = buttonData.actionParam
			}
		} )
	end
	return buttons
end

DataSources.CompetitiveSettingsButtons = DataSourceHelpers.ListSetup( "CompetitiveSettingsButtons", PrepareItemBanRestrictionButtons, nil, nil, nil )
DataSources.CompetitiveSettingsCategoryButtons = DataSourceHelpers.ListSetup( "CompetitiveSettingsCategoryButtons", PrepareItemBanRestrictionCategoryButtons, nil, nil, nil )
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
	self:setLeftRight( 0, 0, 0, 949 )
	self:setTopBottom( 0, 0, 0, 240 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ButtonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0, 0, 0, 420 )
	ButtonList:setTopBottom( 0, 0, 1, 149 )
	ButtonList:setWidgetType( CoD.GameSettings_Button )
	ButtonList:setVerticalCount( 3 )
	ButtonList:setDataSource( "CompetitiveSettingsButtons" )
	ButtonList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		GameSettingsButtonGainFocus( self, element, controller )
		return retVal
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
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
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "DEMO_OPTIONS_HINT", nil )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local Spacer = LUI.UIImage.new()
	Spacer:setLeftRight( 0, 0, 420, 435 )
	Spacer:setTopBottom( 0, 0, 0, 192 )
	Spacer:setAlpha( 0 )
	self:addElement( Spacer )
	self.Spacer = Spacer
	
	local CaCOptions = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	CaCOptions:makeFocusable()
	CaCOptions:setLeftRight( 0, 0, 435, 855 )
	CaCOptions:setTopBottom( 0, 0, 0, 240 )
	CaCOptions:setAlpha( 0 )
	CaCOptions:setWidgetType( CoD.GameSettings_Button )
	CaCOptions:setVerticalCount( 5 )
	CaCOptions:setSpacing( 0 )
	CaCOptions:setDataSource( "CompetitiveSettingsCategoryButtons" )
	CaCOptions:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	CaCOptions:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CaCOptions, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		SetGlobalModelValueFalse( "lobbyRoot.ShowCACItemBansRestrictionFlyout" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	menu:AddButtonCallbackFunction( CaCOptions, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	menu:AddButtonCallbackFunction( CaCOptions, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
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
	self.resetProperties = function ()
		CaCOptions:completeAnimation()
		ButtonList:completeAnimation()
		CaCOptions:setAlpha( 0 )
		ButtonList:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		CACOptionsVisible = {
			DefaultClip = function ()
				self.resetProperties()
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
		local element = self
		if not IsGlobalModelValueTrue( element, controller, "lobbyRoot.ShowCACItemBansRestrictionFlyout" ) and not IsInDefaultStateOrStateNotSet( element ) then
			SetState( self, "DefaultState" )
			SetLoseFocusToElement( self, "ButtonList", controller )
			MakeElementNotFocusable( self, "CaCOptions", controller )
			MakeElementFocusable( self, "ButtonList", controller )
			SetFocusToElement( self, "ButtonList", controller )
			PlaySoundSetSound( self, "toggle" )
		elseif IsGlobalModelValueTrue( element, controller, "lobbyRoot.ShowCACItemBansRestrictionFlyout" ) then
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonList:close()
		self.CaCOptions:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

