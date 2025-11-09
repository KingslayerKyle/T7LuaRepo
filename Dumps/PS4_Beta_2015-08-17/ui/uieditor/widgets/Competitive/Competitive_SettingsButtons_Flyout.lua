require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.ShowCACItemBansRestrictionFlyout" )
end

local PrepareItemBanRestrictionButtons = function ( controller )
	local buttonOptions = {
		{
			optionDisplay = "MENU_CREATE_A_CLASS",
			customId = "btnCAC",
			action = OpenCACItemBansRestrictionsFlyout,
			actionParam = nil
		},
		{
			optionDisplay = "MENU_SPECIALISTS",
			customId = "btnHeroes",
			action = nil,
			actionParam = nil
		},
		{
			optionDisplay = "MENU_SCORESTREAKS",
			customId = "btnScorestreaks",
			action = nil,
			actionParam = nil
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
				action = buttonData.action,
				actionParam = buttonData.actionParam
			}
		} )
	end
	return buttons
end

local PrepareItemBanRestrictionCategoryButtons = function ( controller )
	local buttonOptions = {
		{
			optionDisplay = "MENU_WEAPONS",
			customId = "btnWeapons",
			action = nil,
			actionParam = nil
		},
		{
			optionDisplay = "MENU_ATTACHMENTS",
			customId = "btnAttachments",
			action = nil,
			actionParam = nil
		},
		{
			optionDisplay = "MENU_PERKS",
			customId = "btnPerks",
			action = nil,
			actionParam = nil
		},
		{
			optionDisplay = "MENU_EQUIPMENT",
			customId = "btnEquipment",
			action = nil,
			actionParam = nil
		},
		{
			optionDisplay = "MENU_WILDCARDS",
			customId = "btnWildcards",
			action = nil,
			actionParam = nil
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
	self:setLeftRight( true, false, 0, 633 )
	self:setTopBottom( true, false, 0, 160 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ButtonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, -6.5, 300 )
	ButtonList:setTopBottom( true, false, 0, 100 )
	ButtonList:setDataSource( "CompetitiveSettingsButtons" )
	ButtonList:setWidgetType( CoD.List1ButtonLarge_PH )
	ButtonList:setVerticalCount( 3 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
	
	local CaCOptions = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, true )
	CaCOptions:makeFocusable()
	CaCOptions:setLeftRight( true, false, 389.5, 669.5 )
	CaCOptions:setTopBottom( true, false, 0, 160 )
	CaCOptions:setAlpha( 0 )
	CaCOptions:setDataSource( "CompetitiveSettingsCategoryButtons" )
	CaCOptions:setWidgetType( CoD.List1ButtonLarge_PH )
	CaCOptions:setVerticalCount( 5 )
	CaCOptions:setSpacing( 0 )
	CaCOptions:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	self:subscribeToGlobalModel( controller, "LobbyRoot", "ShowCACItemBansRestrictionFlyout", function ( model )
		local element = self
		if not IsGlobalModelValueTrue( element, controller, "lobbyRoot.ShowCACItemBansRestrictionFlyout" ) and not IsInDefaultStateOrStateNotSet( element ) then
			SetState( self, "DefaultState" )
			SetLoseFocusToElement( self, "ButtonList", controller )
			MakeElementNotFocusable( self, "CaCOptions", controller )
			MakeElementFocusable( self, "ButtonList", controller )
			SetFocusToElement( self, "ButtonList", controller )
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

