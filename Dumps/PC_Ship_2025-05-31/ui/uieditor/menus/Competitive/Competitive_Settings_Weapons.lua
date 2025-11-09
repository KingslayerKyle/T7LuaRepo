require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.Controls.Slider_Small" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Competitive.Competitive_Settings_SelectedItemInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_TabBar" )

local f0_local0 = {
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
local f0_local1 = function ( f1_arg0 )
	local f1_local0 = {}
	table.insert( f1_local0, {
		models = {
			index = -1,
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for f1_local4, f1_local5 in ipairs( CoD.Craft.WeaponGroupNames ) do
		table.insert( f1_local0, {
			models = {
				tabName = f1_local5.name,
				tabWidget = f0_local0[f1_local4].tabWidget
			},
			properties = {
				groupIndex = f1_local4
			}
		} )
	end
	table.insert( f1_local0, {
		models = {
			index = -1,
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "GametypeSettings" ), "selectedItemSettingGroup" ), f1_local0[2].groupIndex )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "GametypeSettings" ), "selectedItemSettingGroupCount" ), #f1_local0 - 2 )
	return f1_local0
end

local f0_local2 = function ( f2_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f2_arg0 ), "GametypeSettings" ), "selectedItemSettingGroup" ) )
	local f2_local1 = {}
	local f2_local2 = {}
	for f2_local3 = 0, 255, 1 do
		local f2_local6 = CoD.statsTable
		if f2_local6 then
			f2_local6 = CoD.CACUtility.GetIdForItemRef( f2_local3 )
		end
		if Engine.ItemIndexValid( f2_local3 ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f2_local6 ) and (not CoD.ContractWeaponTiers[f2_local6] or IsThermometerUnlockIndexGreaterThanorEqualTo( CoD.ContractWeaponTiers[f2_local6] )) then
			local f2_local7 = Engine.GetUnlockableInfoByIndex( f2_local3 )
			local f2_local8 = f2_local7.image
			if f2_local8 ~= nil and f2_local8 ~= "" then
				f2_local8 = f2_local8 .. "_pu"
			end
			if f0_local0[modelValue].weapon_category[f2_local7.group] ~= nil and f2_local7.allocation >= 0 then
				table.insert( f2_local1, CoD.OptionsUtility.CreateItemRestrictionSettings( f2_arg0, f2_local7.name, "", "CompetitiveSettings_ItemRestriction_" .. tostring( f2_local3 ), CoD.GameSettingsUtility.GetRestrictionOptions(), f2_local8, CoD.OptionsUtility.GametypeSettingsSetItemRestrictionState, {
					itemIndex = f2_local3
				}, function ( f3_arg0 )
					return Engine.GetItemRestrictionState( f3_arg0.itemIndex )
				end, function ( f4_arg0 )
					Engine.SetItemRestrictionState( f4_arg0.itemIndex, Engine.GetItemRestrictionState( f4_arg0.itemIndex, true ) )
				end ) )
			end
		end
	end
	table.sort( f2_local1, function ( f5_arg0, f5_arg1 )
		return f5_arg0.models.name < f5_arg1.models.name
	end )
	return f2_local1
end

local f0_local3 = function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f6_arg0 ), "GametypeSettings" ), "selectedItemSettingGroup" )
	if f6_arg1.selectedTabChangedModel then
		f6_arg1:removeSubscription( f6_arg1.selectedTabChangedModel )
	end
	f6_arg1.selectedTabChangedModel = f6_arg1:subscribeToModel( f6_local0, function ()
		f6_arg1:clearSavedActiveIndex()
		f6_arg1:clearSavedState()
		f6_arg1:updateDataSource( false, false )
	end, false )
	local f6_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "Update" )
	if f6_arg1.updateSubscription then
		f6_arg1:removeSubscription( f6_arg1.updateSubscription )
	end
	f6_arg1.updateSubscription = f6_arg1:subscribeToModel( f6_local1, function ()
		f6_arg1:updateDataSource( false )
	end, false )
end

DataSources.CompetitiveSettingsRestrictionsTabs = DataSourceHelpers.ListSetup( "CompetitiveSettingsRestrictionsTabs", f0_local1, nil, nil, nil )
DataSources.CompetitiveSettingsItemOptions = DataSourceHelpers.ListSetup( "CompetitiveSettingsItemOptions", f0_local2, nil, nil, f0_local3 )
local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" ), "selectedItemSettingGroup" ), 1 )
	self.disablePopupOpenCloseAnim = true
end

local f0_local5 = function ( f10_arg0, f10_arg1 )
	f10_arg0.Tabs:setForceMouseEventDispatch( true )
	f10_arg0:registerEventHandler( "grid_item_changed", function ( element, event )
		if event.grid == f10_arg0.Tabs.Tabs then
			SetCompetitiveItemSettingsFilter( f10_arg0, element, f10_arg1, event.grid.savedActiveIndex )
		end
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	self:subscribeToModel( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" ), "selectedItemSettingGroup" ), function ( model )
		self.Tabs:setActiveIndex( 1, Engine.GetModelValue( model ) + 1 )
	end )
	if CoD.isPC then
		f0_local5( self, controller, menu )
	end
end

LUI.createMenu.Competitive_Settings_Weapons = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings_Weapons" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings_Weapons.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( true, true, 0, 0 )
	GameSettingsBackground:setTopBottom( true, true, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.ToolTip:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local Options = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	Options:makeFocusable()
	Options:setLeftRight( true, false, 27, 697 )
	Options:setTopBottom( true, false, 153, 627 )
	Options:setDataSource( "CompetitiveSettingsItemOptions" )
	Options:setWidgetType( CoD.Slider_Small )
	Options:setVerticalCount( 14 )
	Options:setVerticalCounter( CoD.verticalCounter )
	Options:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		return f15_local0
	end )
	Options:registerEventHandler( "lose_focus", function ( element, event )
		local f16_local0 = nil
		if element.loseFocus then
			f16_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f16_local0 = element.super:loseFocus( event )
		end
		return f16_local0
	end )
	self:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		AdjustCompetitiveItemSettingsFilter( self, element, controller, "-1" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		AdjustCompetitiveItemSettingsFilter( self, element, controller, "1" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		return true
	end, false )
	self:addElement( Options )
	self.Options = Options
	
	local CompetitiveSettingsSelectedItemInfo = CoD.Competitive_Settings_SelectedItemInfo.new( self, controller )
	CompetitiveSettingsSelectedItemInfo:setLeftRight( true, true, 0, 0 )
	CompetitiveSettingsSelectedItemInfo:setTopBottom( true, true, 0, 0 )
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
	self:addElement( CompetitiveSettingsSelectedItemInfo )
	self.CompetitiveSettingsSelectedItemInfo = CompetitiveSettingsSelectedItemInfo
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local Tabs = CoD.GameSettings_TabBar.new( self, controller )
	Tabs:setLeftRight( true, false, 0, 1614 )
	Tabs:setTopBottom( true, false, 87, 125 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ForceNotifyGlobalModel( controller, "GametypeSettings.Update" )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingsBackground:close()
		element.Options:close()
		element.CompetitiveSettingsSelectedItemInfo:close()
		element.FEMenuLeftGraphics:close()
		element.Tabs:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings_Weapons.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

