require( "ui.uieditor.widgets.Competitive.Competitive_Settings_SelectedItemInfo" )
require( "ui.uieditor.widgets.Controls.Slider_Small" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_TabBar" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local WeaponGroupTabs = {
	{
		weapon_category = {
			weapon_smg = true
		},
		name = "MPUI_WEAPON_SMG_ABBR_CAPS_WITH_S",
		tabWidget = "Competitive_Settings_Weapons_SMG"
	},
	{
		weapon_category = {
			weapon_assault = true
		},
		name = "MPUI_WEAPON_ASSAULT_CAPS",
		tabWidget = "Competitive_Settings_Weapons_AR"
	},
	{
		weapon_category = {
			weapon_cqb = true
		},
		name = "MPUI_CQBS_CAPS",
		tabWidget = "Competitive_Settings_Weapons_CQB"
	},
	{
		weapon_category = {
			weapon_lmg = true
		},
		name = "MPUI_WEAPON_LMG_ABBR_CAPS_WITH_S",
		tabWidget = "Competitive_Settings_Weapons_LMG"
	},
	{
		weapon_category = {
			weapon_sniper = true
		},
		name = "MPUI_WEAPON_SNIPER_CAPS",
		tabWidget = "Competitive_Settings_Weapons_SNIPER"
	},
	{
		weapon_category = {
			weapon_pistol = true,
			weapon_launcher = true,
			weapon_special = true,
			weapon_knife = true
		},
		name = "MPUI_WEAPON_SECONDARIES_CAPS",
		tabWidget = "Competitive_Settings_Weapons_SECONDARY"
	}
}
local PrepareCompetitiveSettingsRestrictionsTabs = function ( controller )
	local tabs = {}
	table.insert( tabs, {
		models = {
			index = -1,
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for index, group in ipairs( CoD.CraftUtility.WeaponGroupNames ) do
		table.insert( tabs, {
			models = {
				tabName = group.name,
				tabWidget = WeaponGroupTabs[index].tabWidget
			},
			properties = {
				groupIndex = index
			}
		} )
	end
	table.insert( tabs, {
		models = {
			index = -1,
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedTabGroupModel = Engine.CreateModel( gametypeSettingsModel, "selectedItemSettingGroup" )
	Engine.SetModelValue( selectedTabGroupModel, tabs[2].groupIndex )
	local pregameModel = Engine.GetModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedItemSettingGroupCountModel = Engine.CreateModel( pregameModel, "selectedItemSettingGroupCount" )
	Engine.SetModelValue( selectedItemSettingGroupCountModel, #tabs - 2 )
	return tabs
end

local PrepareItemOptions = function ( controller )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedTabGroupModel = Engine.CreateModel( gametypeSettingsModel, "selectedItemSettingGroup" )
	local selectedItemGroup = Engine.GetModelValue( selectedTabGroupModel )
	local optionsTable = {}
	local items = {}
	for itemIndex = 0, 255, 1 do
		if Engine.ItemIndexValid( itemIndex ) then
			local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
			local image = itemInfo.image
			if image ~= nil and image ~= "" then
				image = image .. "_pu"
			end
			local groupInfo = WeaponGroupTabs[selectedItemGroup]
			if groupInfo.weapon_category[itemInfo.group] ~= nil and itemInfo.allocation >= 0 then
				table.insert( optionsTable, CoD.OptionsUtility.CreateItemRestrictionSettings( controller, itemInfo.name, "", "CompetitiveSettings_ItemRestriction_" .. tostring( itemIndex ), CoD.GameSettingsUtility.GetRestrictionOptions(), image, CoD.OptionsUtility.GametypeSettingsSetItemRestrictionState, {
					itemIndex = itemIndex
				}, function ( params )
					return Engine.GetItemRestrictionState( params.itemIndex )
				end, function ( element )
					local default = Engine.GetItemRestrictionState( element.itemIndex, true )
					Engine.SetItemRestrictionState( element.itemIndex, default )
				end ) )
			end
		end
	end
	local WeaponSort = function ( a, b )
		return a.models.name < b.models.name
	end
	
	table.sort( optionsTable, WeaponSort )
	return optionsTable
end

local ItemOptionsUpdate = function ( controller, list, listModel )
	local gametypeSettingsControllerModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedTabGroupModel = Engine.CreateModel( gametypeSettingsControllerModel, "selectedItemSettingGroup" )
	if list.selectedTabChangedModel then
		list:removeSubscription( list.selectedTabChangedModel )
	end
	list.selectedTabChangedModel = list:subscribeToModel( selectedTabGroupModel, function ()
		list:clearSavedActiveIndex()
		list:clearSavedState()
		list:updateDataSource( false, false )
	end, false )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local updateModel = Engine.CreateModel( gametypeSettingsModel, "Update" )
	if list.updateSubscription then
		list:removeSubscription( list.updateSubscription )
	end
	list.updateSubscription = list:subscribeToModel( updateModel, function ()
		list:updateDataSource( false )
	end, false )
end

DataSources.CompetitiveSettingsRestrictionsTabs = DataSourceHelpers.ListSetup( "CompetitiveSettingsRestrictionsTabs", PrepareCompetitiveSettingsRestrictionsTabs, nil, nil, nil )
DataSources.CompetitiveSettingsItemOptions = DataSourceHelpers.ListSetup( "CompetitiveSettingsItemOptions", PrepareItemOptions, nil, nil, ItemOptionsUpdate )
local PreLoadFunc = function ( self, controller )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedTabGroupModel = Engine.CreateModel( gametypeSettingsModel, "selectedItemSettingGroup" )
	Engine.SetModelValue( selectedTabGroupModel, 1 )
	self.disablePopupOpenCloseAnim = true
end

local PostLoadFunc = function ( self, controller, menu )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedTabGroupModel = Engine.CreateModel( gametypeSettingsModel, "selectedItemSettingGroup" )
	self:subscribeToModel( selectedTabGroupModel, function ( model )
		local currentFilter = Engine.GetModelValue( model )
		self.Tabs:setActiveIndex( 1, currentFilter + 1 )
	end )
end

LUI.createMenu.Competitive_Settings_Weapons = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings_Weapons" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings_Weapons.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( 0, 1, 0, 0 )
	GameSettingsBackground:setTopBottom( 0, 1, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.ToolTip:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local Options = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Options:makeFocusable()
	Options:setLeftRight( 0, 0, 41, 857 )
	Options:setTopBottom( 0, 0, 236, 934 )
	Options:setWidgetType( CoD.Slider_Small )
	Options:setVerticalCount( 14 )
	Options:setVerticalCounter( CoD.verticalCounter )
	Options:setDataSource( "CompetitiveSettingsItemOptions" )
	Options:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	Options:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		AdjustCompetitiveItemSettingsFilter( self, element, controller, "-1" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		AdjustCompetitiveItemSettingsFilter( self, element, controller, "1" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
		return true
	end, false )
	self:addElement( Options )
	self.Options = Options
	
	local CompetitiveSettingsSelectedItemInfo = CoD.Competitive_Settings_SelectedItemInfo.new( self, controller )
	CompetitiveSettingsSelectedItemInfo:mergeStateConditions( {
		{
			stateName = "SquareImage",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "WeaponImage",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	CompetitiveSettingsSelectedItemInfo:setLeftRight( 0, 1, 0, 0 )
	CompetitiveSettingsSelectedItemInfo:setTopBottom( 0, 1, 0, 0 )
	self:addElement( CompetitiveSettingsSelectedItemInfo )
	self.CompetitiveSettingsSelectedItemInfo = CompetitiveSettingsSelectedItemInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 27, 105 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 136, 1062 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local Tabs = CoD.GameSettings_TabBar.new( self, controller )
	Tabs:setLeftRight( 0, 0, 0, 2421 )
	Tabs:setTopBottom( 0, 0, 130.5, 187.5 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ForceNotifyGlobalModel( controller, "GametypeSettings.Update" )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	GameSettingsBackground.MenuFrame:setModel( self.buttonModel, controller )
	Options.id = "Options"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Options:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingsBackground:close()
		self.Options:close()
		self.CompetitiveSettingsSelectedItemInfo:close()
		self.FEMenuLeftGraphics:close()
		self.Tabs:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings_Weapons.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

