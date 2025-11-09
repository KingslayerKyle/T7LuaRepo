require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.Controls.Slider_Small" )
require( "ui.uieditor.widgets.Competitive.Competitive_Settings_SelectedItemInfo" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_TabBar" )

local f0_local0 = {
	{
		weapon_category = {
			[Enum.itemGroup_t.ITEMGROUP_SMG] = true
		},
		name = "MPUI_WEAPON_SMG_ABBR_CAPS_WITH_S"
	},
	{
		weapon_category = {
			[Enum.itemGroup_t.ITEMGROUP_ASSAULT] = true
		},
		name = "MPUI_WEAPON_ASSAULT_CAPS"
	},
	{
		weapon_category = {
			[Enum.itemGroup_t.ITEMGROUP_CQB] = true
		},
		name = "MPUI_CQBS_CAPS"
	},
	{
		weapon_category = {
			[Enum.itemGroup_t.ITEMGROUP_LMG] = true
		},
		name = "MPUI_WEAPON_LMG_ABBR_CAPS_WITH_S"
	},
	{
		weapon_category = {
			[Enum.itemGroup_t.ITEMGROUP_SNIPER] = true
		},
		name = "MPUI_WEAPON_SNIPER_CAPS"
	},
	{
		weapon_category = {
			[Enum.itemGroup_t.ITEMGROUP_PISTOL] = true,
			[Enum.itemGroup_t.ITEMGROUP_LAUNCHER] = true,
			[Enum.itemGroup_t.ITEMGROUP_SPECIAL] = true,
			[Enum.itemGroup_t.ITEMGROUP_KNIFE] = true
		},
		name = "MPUI_WEAPON_SECONDARIES_CAPS"
	}
}
local f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local f1_local1 = Engine.CreateModel( f1_local0, "attachmentWeaponUpdate" )
	if f1_arg1.attachmentUpdateSubscription then
		f1_arg1:removeSubscription( f1_arg1.attachmentUpdateSubscription )
	end
	f1_arg1.attachmentUpdateSubscription = f1_arg1:subscribeToModel( f1_local1, function ()
		f1_arg1:updateDataSource( false )
	end, false )
	local f1_local2 = Engine.CreateModel( f1_local0, "Update" )
	if f1_arg1.updateSubscription then
		f1_arg1:removeSubscription( f1_arg1.updateSubscription )
	end
	f1_arg1.updateSubscription = f1_arg1:subscribeToModel( f1_local2, function ()
		f1_arg1:updateDataSource( false )
	end, false )
end

local f0_local2 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	DataSources[f4_arg1] = DataSourceHelpers.ListSetup( f4_arg1, function ( f5_arg0 )
		local f5_local0 = {}
		local f5_local1, f5_local2 = CoD.CACUtility.GetAllItems()
		for f5_local7, f5_local8 in pairs( f5_local1 ) do
			if f5_local8.attachments and f5_local8.attachments[f4_arg3.index] and f4_arg2.weapon_category[f5_local8.groupIndex] then
				local f5_local6 = f5_local8.image
				if f5_local6 ~= nil and f5_local6 ~= "" then
					f5_local6 = f5_local6 .. "_pu"
				end
				table.insert( f5_local0, CoD.OptionsUtility.CreateItemRestrictionSettings( f5_arg0, f5_local8.name, "", "ItemRestriction_" .. tostring( f5_local7 ), CoD.GameSettingsUtility.GetRestrictionOptions(), f5_local6, CoD.OptionsUtility.GametypeSettingsSetAttachmentRestrictionStateForWeapon, {
					attachmentIndex = f4_arg3.index,
					weaponIndex = f5_local7
				}, function ( f6_arg0 )
					return Engine.GetAttachmentRestrictionState( f6_arg0.attachmentIndex, f6_arg0.weaponIndex, false )
				end, function ( f7_arg0 )
					Engine.SetAttachmentRestrictionState( f7_arg0.attachmentIndex, f7_arg0.weaponIndex, Engine.GetAttachmentRestrictionState( f7_arg0.attachmentIndex, f7_arg0.weaponIndex, true ) )
				end ) )
			end
		end
		return f5_local0
	end, nil, nil, function ( f8_arg0, f8_arg1, f8_arg2 )
		local f8_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
		local f8_local1 = Engine.CreateModel( f8_local0, "updateWeaponList" )
		if f8_arg1.weaponUpdateSubscription then
			f8_arg1:removeSubscription( f8_arg1.weaponUpdateSubscription )
		end
		f8_arg1.weaponUpdateSubscription = f8_arg1:subscribeToModel( f8_local1, function ()
			f8_arg1:updateDataSource( true )
		end, false )
		local f8_local2 = Engine.CreateModel( f8_local0, "Update" )
		if f8_arg1.updateSubscription then
			f8_arg1:removeSubscription( f8_arg1.updateSubscription )
		end
		f8_arg1.updateSubscription = f8_arg1:subscribeToModel( f8_local2, function ()
			f8_arg1:updateDataSource( false )
		end, false )
	end )
	return f4_arg1
end

local f0_local3 = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	DataSources[f11_arg1] = DataSourceHelpers.ListSetup( f11_arg1, function ( f12_arg0 )
		local f12_local0 = {}
		table.insert( f12_local0, CoD.OptionsUtility.CreateItemRestrictionSettings( f12_arg0, Engine.Localize( "MENU_ALL_VAR", f11_arg2.name ), "", "WeaponAttachmentGroup_" .. f11_arg2.name, CoD.GameSettingsUtility.GetGroupRestrictionOptions(), f11_arg3.image, CoD.OptionsUtility.GametypeSettingsSetAttachmentRestrictionStateForGroup, {
			attachmentIndex = f11_arg3.index,
			weaponGroups = f11_arg2.weapon_category
		}, function ( f13_arg0 )
			local f13_local0 = f13_arg0.weaponGroups
			local f13_local1 = f13_arg0.attachmentIndex
			local f13_local2, f13_local3 = CoD.CACUtility.GetAllItems()
			local f13_local4 = nil
			for f13_local8, f13_local9 in pairs( f13_local2 ) do
				if f13_local9.attachments and f13_local9.attachments[f11_arg3.index] and f13_local0[f13_local9.groupIndex] then
					if f13_local4 == nil then
						f13_local4 = Engine.GetAttachmentRestrictionState( f13_local1, f13_local8, false )
					end
					if f13_local4 ~= Engine.GetAttachmentRestrictionState( f13_local1, f13_local8, false ) then
						return -1
					end
				end
			end
			return f13_local4
		end, function ( f14_arg0 )
			local f14_local0 = f14_arg0.weaponGroups
			local f14_local1 = f14_arg0.attachmentIndex
			local f14_local2, f14_local3 = CoD.CACUtility.GetAllItems()
			for f14_local8, f14_local9 in pairs( f14_local2 ) do
				if f14_local9.attachments and f14_local9.attachments[f11_arg3.index] and f14_local0[f14_local9.groupIndex] then
					local f14_local7 = Engine.GetAttachmentRestrictionState( f14_local1, f14_local8, true )
					Engine.SetAttachmentRestrictionState( f14_local1, f14_local8, f14_local7 )
					print( "Setting Weapon Attachment Restriction: Attachment: " .. f14_local1 .. " Weapon: " .. f14_local8 .. " State: " .. f14_local7 )
				end
			end
		end ) )
		return f12_local0
	end, nil, nil, function ( f15_arg0, f15_arg1, f15_arg2 )
		local f15_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
		local f15_local1 = Engine.CreateModel( f15_local0, "updateWeaponGroup" )
		if f15_arg1.groupUpdateSubscription then
			f15_arg1:removeSubscription( f15_arg1.groupUpdateSubscription )
		end
		f15_arg1.groupUpdateSubscription = f15_arg1:subscribeToModel( f15_local1, function ()
			f15_arg1:updateDataSource( true )
		end, false )
		local f15_local2 = Engine.CreateModel( f15_local0, "Update" )
		if f15_arg1.updateSubscription then
			f15_arg1:removeSubscription( f15_arg1.updateSubscription )
		end
		f15_arg1.updateSubscription = f15_arg1:subscribeToModel( f15_local2, function ()
			f15_arg1:updateDataSource( false )
		end, false )
	end )
	return f11_arg1
end

DataSources.CompetitiveSettingsAttachmentWeaponTabs = DataSourceHelpers.ListSetup( "CompetitiveSettingsAttachmentWeaponTabs", function ( f18_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f18_arg0 ), "GametypeSettings" ), "selectedAttachment" ) )
	local f18_local1, f18_local2 = CoD.CACUtility.GetAllItems()
	local f18_local3 = f18_local2[modelValue]
	for f18_local7, f18_local8 in ipairs( f0_local0 ) do
		f18_local8.active = false
	end
	for f18_local7, f18_local8 in pairs( f18_local3.items ) do
		local f18_local12 = f18_local1[f18_local8.itemIndex].groupIndex
		for f18_local9, f18_local10 in ipairs( f0_local0 ) do
			if f18_local10.weapon_category[f18_local12] then
				f18_local10.active = true
			end
		end
	end
	f18_local4 = {}
	table.insert( f18_local4, {
		models = {
			index = -1,
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for f18_local8, f18_local12 in ipairs( f0_local0 ) do
		if f18_local12.active == true then
			table.insert( f18_local4, {
				models = {
					tabName = f18_local12.name,
					listDatasource = f0_local2( f18_arg0, "WeaponAttachments_" .. f18_local8, f18_local12, f18_local3 ),
					allItemsDatasource = f0_local3( f18_arg0, "WeaponAttachmentsAll_" .. f18_local8, f18_local12, f18_local3 ),
					tabIcon = ""
				},
				properties = {
					groups = f0_local0[f18_local8],
					groupIndex = f18_local8
				}
			} )
		end
	end
	table.insert( f18_local4, {
		models = {
			index = -1,
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	f18_local5 = Engine.CreateModel( Engine.GetModelForController( f18_arg0 ), "GametypeSettings" )
	Engine.SetModelValue( Engine.CreateModel( f18_local5, "selectedTab" ), f18_local4[2].properties.groupIndex )
	Engine.SetModelValue( Engine.CreateModel( f18_local5, "tabCount" ), #f18_local4 - 2 )
	return f18_local4
end, nil, nil, nil )
local f0_local4 = function ( f19_arg0, f19_arg1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f19_arg1 ), "GametypeSettings" ), "selectedTab" ), 1 )
	f19_arg0.disablePopupOpenCloseAnim = true
end

local PreLoadFunc = function ( self, controller )
	local f20_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "updateWeaponList" )
	self.disablePopupOpenCloseAnim = true
end

local f0_local6 = function ( f21_arg0, f21_arg1, f21_arg2 )
	f21_arg0.Tabs:setForceMouseEventDispatch( true )
	f21_arg0:registerEventHandler( "grid_item_changed", function ( element, event )
		if event.grid == f21_arg0.Tabs.Tabs then
			SetGameSettingsTab( f21_arg0, element, f21_arg1, event.grid.savedActiveIndex )
		end
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	self:subscribeToModel( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" ), "selectedTab" ), function ( model )
		self.Tabs:setActiveIndex( 1, (Engine.GetModelValue( model ) or 0) + 1 )
	end )
	self.Options:linkToElementModel( self.Tabs.Tabs, "listDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.Options:setDataSource( modelValue )
		end
	end )
	self.AllWeaponsOption:linkToElementModel( self.Tabs.Tabs, "allItemsDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.AllWeaponsOption:setDataSource( modelValue )
		end
	end )
	if CoD.isPC then
		f0_local6( self, controller, menu )
	end
end

LUI.createMenu.Competitive_Settings_Attachment_Weapons = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings_Attachment_Weapons" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings_Attachment_Weapons.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( true, true, 0, 0 )
	GameSettingsBackground:setTopBottom( true, true, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( GametypeSettingsAttachmentHeader( controller, "MPUI_ATTACHMENTS_CAPS" ) ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( GametypeSettingsAttachmentHeader( controller, "MPUI_ATTACHMENTS_CAPS" ) ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.ToolTip:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local Options = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	Options:makeFocusable()
	Options:setLeftRight( true, false, 27, 697 )
	Options:setTopBottom( true, false, 192, 700 )
	Options:setWidgetType( CoD.Slider_Small )
	Options:setVerticalCount( 15 )
	Options:registerEventHandler( "gain_focus", function ( element, event )
		local f28_local0 = nil
		if element.gainFocus then
			f28_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f28_local0 = element.super:gainFocus( event )
		end
		SetElementStateByElementName( self, "CompetitiveSettingsSelectedItemInfo", controller, "WeaponImage" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		return f28_local0
	end )
	Options:registerEventHandler( "lose_focus", function ( element, event )
		local f29_local0 = nil
		if element.loseFocus then
			f29_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f29_local0 = element.super:loseFocus( event )
		end
		return f29_local0
	end )
	self:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		AdjustGameSettingsTab( self, element, controller, "-1" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		AdjustGameSettingsTab( self, element, controller, "1" )
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
	LUI.OverrideFunction_CallOriginalFirst( Options, "close", function ( element )
		ForceNotifyGlobalModel( controller, "GametypeSettings.Update" )
	end )
	self:addElement( Options )
	self.Options = Options
	
	local CompetitiveSettingsSelectedItemInfo = CoD.Competitive_Settings_SelectedItemInfo.new( self, controller )
	CompetitiveSettingsSelectedItemInfo:setLeftRight( true, true, 0, 0 )
	CompetitiveSettingsSelectedItemInfo:setTopBottom( true, true, 0, 0 )
	self:addElement( CompetitiveSettingsSelectedItemInfo )
	self.CompetitiveSettingsSelectedItemInfo = CompetitiveSettingsSelectedItemInfo
	
	local AllWeaponsOption = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	AllWeaponsOption:makeFocusable()
	AllWeaponsOption:setLeftRight( true, false, 27, 697 )
	AllWeaponsOption:setTopBottom( true, false, 139, 171 )
	AllWeaponsOption:setWidgetType( CoD.Slider_Small )
	AllWeaponsOption:registerEventHandler( "gain_focus", function ( element, event )
		local f37_local0 = nil
		if element.gainFocus then
			f37_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f37_local0 = element.super:gainFocus( event )
		end
		SetElementStateByElementName( self, "CompetitiveSettingsSelectedItemInfo", controller, "SquareImage" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		return f37_local0
	end )
	AllWeaponsOption:registerEventHandler( "lose_focus", function ( element, event )
		local f38_local0 = nil
		if element.loseFocus then
			f38_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f38_local0 = element.super:loseFocus( event )
		end
		return f38_local0
	end )
	self:AddButtonCallbackFunction( AllWeaponsOption, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		AdjustGameSettingsTab( self, element, controller, "-1" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( AllWeaponsOption, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		AdjustGameSettingsTab( self, element, controller, "1" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( AllWeaponsOption, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		return true
	end, false )
	self:addElement( AllWeaponsOption )
	self.AllWeaponsOption = AllWeaponsOption
	
	local Tabs = CoD.GameSettings_TabBar.new( self, controller )
	Tabs:setLeftRight( true, false, 0, 1614 )
	Tabs:setTopBottom( true, false, 87, 125 )
	Tabs.Tabs:setDataSource( "CompetitiveSettingsAttachmentWeaponTabs" )
	Tabs:registerEventHandler( "menu_loaded", function ( element, event )
		local f45_local0 = nil
		ForceNotifyGlobalModel( controller, "GametypeSettings.updateWeaponList" )
		if not f45_local0 then
			f45_local0 = element:dispatchEventToChildren( event )
		end
		return f45_local0
	end )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	Options.navigation = {
		up = AllWeaponsOption
	}
	AllWeaponsOption.navigation = {
		down = Options
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	GameSettingsBackground.MenuFrame:setModel( self.buttonModel, controller )
	Options.id = "Options"
	AllWeaponsOption.id = "AllWeaponsOption"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.AllWeaponsOption:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingsBackground:close()
		element.Options:close()
		element.CompetitiveSettingsSelectedItemInfo:close()
		element.AllWeaponsOption:close()
		element.Tabs:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings_Attachment_Weapons.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

