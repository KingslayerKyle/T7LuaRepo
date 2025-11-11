require( "ui.uieditor.widgets.Competitive.Competitive_Settings_SelectedItemInfo" )
require( "ui.uieditor.widgets.Controls.Slider_Small" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_TabBar" )

local WeaponGroupTabs = {
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
local AttachmentWeaponUpdate = function ( controller, list, listModel )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local attachmentUpdateModel = Engine.CreateModel( gametypeSettingsModel, "attachmentWeaponUpdate" )
	if list.attachmentUpdateSubscription then
		list:removeSubscription( list.attachmentUpdateSubscription )
	end
	list.attachmentUpdateSubscription = list:subscribeToModel( attachmentUpdateModel, function ()
		list:updateDataSource( false )
	end, false )
	local updateModel = Engine.CreateModel( gametypeSettingsModel, "Update" )
	if list.updateSubscription then
		list:removeSubscription( list.updateSubscription )
	end
	list.updateSubscription = list:subscribeToModel( updateModel, function ()
		list:updateDataSource( false )
	end, false )
end

local PrepareAttachmentWeaponOptions = function ( controller, dataSourceName, groups, attachmentInfo )
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		local items, attachments = CoD.CACUtility.GetAllItems()
		for itemIndex, item in pairs( items ) do
			if item.attachments and item.attachments[attachmentInfo.index] and groups.weapon_category[item.groupIndex] then
				local image = item.image
				if image ~= nil and image ~= "" then
					image = image .. "_pu"
				end
				table.insert( dataTable, CoD.OptionsUtility.CreateItemRestrictionSettings( controller, item.name, "", "ItemRestriction_" .. tostring( itemIndex ), CoD.GameSettingsUtility.GetRestrictionOptions(), image, CoD.OptionsUtility.GametypeSettingsSetAttachmentRestrictionStateForWeapon, {
					attachmentIndex = attachmentInfo.index,
					weaponIndex = itemIndex
				}, function ( params )
					return Engine.GetAttachmentRestrictionState( params.attachmentIndex, params.weaponIndex, false )
				end, function ( element )
					local default = Engine.GetAttachmentRestrictionState( element.attachmentIndex, element.weaponIndex, true )
					Engine.SetAttachmentRestrictionState( element.attachmentIndex, element.weaponIndex, default )
				end ) )
			end
		end
		return dataTable
	end, nil, nil, function ( controller, list, listModel )
		local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
		local weaponUpdateModel = Engine.CreateModel( gametypeSettingsModel, "updateWeaponList" )
		if list.weaponUpdateSubscription then
			list:removeSubscription( list.weaponUpdateSubscription )
		end
		list.weaponUpdateSubscription = list:subscribeToModel( weaponUpdateModel, function ()
			list:updateDataSource( true )
		end, false )
		local updateModel = Engine.CreateModel( gametypeSettingsModel, "Update" )
		if list.updateSubscription then
			list:removeSubscription( list.updateSubscription )
		end
		list.updateSubscription = list:subscribeToModel( updateModel, function ()
			list:updateDataSource( false )
		end, false )
	end )
	return dataSourceName
end

local CreateAllOption = function ( controller, dataSourceName, groupInfo, attachmentInfo )
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		local image = attachmentInfo.image
		table.insert( dataTable, CoD.OptionsUtility.CreateItemRestrictionSettings( controller, Engine.Localize( "MENU_ALL_VAR", groupInfo.name ), "", "WeaponAttachmentGroup_" .. groupInfo.name, CoD.GameSettingsUtility.GetGroupRestrictionOptions(), image, CoD.OptionsUtility.GametypeSettingsSetAttachmentRestrictionStateForGroup, {
			attachmentIndex = attachmentInfo.index,
			weaponGroups = groupInfo.weapon_category
		}, function ( params )
			local weaponGroups = params.weaponGroups
			local attachmentIndex = params.attachmentIndex
			local items, attachments = CoD.CACUtility.GetAllItems()
			local restrictionState = nil
			for itemIndex, item in pairs( items ) do
				if item.attachments and item.attachments[attachmentInfo.index] and weaponGroups[item.groupIndex] then
					if restrictionState == nil then
						restrictionState = Engine.GetAttachmentRestrictionState( attachmentIndex, itemIndex, false )
					end
					if restrictionState ~= Engine.GetAttachmentRestrictionState( attachmentIndex, itemIndex, false ) then
						return -1
					end
				end
			end
			return restrictionState
		end, function ( element )
			local weaponGroups = element.weaponGroups
			local attachmentIndex = element.attachmentIndex
			local items, attachments = CoD.CACUtility.GetAllItems()
			for itemIndex, item in pairs( items ) do
				if item.attachments and item.attachments[attachmentInfo.index] and weaponGroups[item.groupIndex] then
					local default = Engine.GetAttachmentRestrictionState( attachmentIndex, itemIndex, true )
					Engine.SetAttachmentRestrictionState( attachmentIndex, itemIndex, default )
					print( "Setting Weapon Attachment Restriction: Attachment: " .. attachmentIndex .. " Weapon: " .. itemIndex .. " State: " .. default )
				end
			end
		end ) )
		return dataTable
	end, nil, nil, function ( controller, list, listModel )
		local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
		local groupUpdateModel = Engine.CreateModel( gametypeSettingsModel, "updateWeaponGroup" )
		if list.groupUpdateSubscription then
			list:removeSubscription( list.groupUpdateSubscription )
		end
		list.groupUpdateSubscription = list:subscribeToModel( groupUpdateModel, function ()
			list:updateDataSource( true )
		end, false )
		local updateModel = Engine.CreateModel( gametypeSettingsModel, "Update" )
		if list.updateSubscription then
			list:removeSubscription( list.updateSubscription )
		end
		list.updateSubscription = list:subscribeToModel( updateModel, function ()
			list:updateDataSource( false )
		end, false )
	end )
	return dataSourceName
end

local PrepareAttachmentWeaponTabs = function ( controller )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedAttachment = Engine.GetModelValue( Engine.CreateModel( gametypeSettingsModel, "selectedAttachment" ) )
	local items, attachments = CoD.CACUtility.GetAllItems()
	local attachment = attachments[selectedAttachment]
	for index, weaponGroupTab in ipairs( WeaponGroupTabs ) do
		weaponGroupTab.active = false
	end
	for index, weaponGroupTab in pairs( attachment.items ) do
		local itemGroup = items[weaponGroupTab.itemIndex].groupIndex
		for index, weaponGroupTab in ipairs( WeaponGroupTabs ) do
			if weaponGroupTab.weapon_category[itemGroup] then
				weaponGroupTab.active = true
			end
		end
	end
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
	for index, group in ipairs( WeaponGroupTabs ) do
		if group.active == true then
			table.insert( tabs, {
				models = {
					tabName = group.name,
					listDatasource = PrepareAttachmentWeaponOptions( controller, "WeaponAttachments_" .. index, group, attachment ),
					allItemsDatasource = CreateAllOption( controller, "WeaponAttachmentsAll_" .. index, group, attachment ),
					tabIcon = ""
				},
				properties = {
					groups = WeaponGroupTabs[index],
					groupIndex = index
				}
			} )
		end
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
	Engine.SetModelValue( Engine.CreateModel( gametypeSettingsModel, "selectedTab" ), tabs[2].properties.groupIndex )
	Engine.SetModelValue( Engine.CreateModel( gametypeSettingsModel, "tabCount" ), #tabs - 2 )
	return tabs
end

DataSources.CompetitiveSettingsAttachmentWeaponTabs = DataSourceHelpers.ListSetup( "CompetitiveSettingsAttachmentWeaponTabs", PrepareAttachmentWeaponTabs, nil, nil, nil )
local PreLoadFunc = function ( self, controller )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedTabModel = Engine.CreateModel( gametypeSettingsModel, "selectedTab" )
	Engine.SetModelValue( selectedTabModel, 1 )
	self.disablePopupOpenCloseAnim = true
end

local PreLoadFunc = function ( self, controller )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local updateModel = Engine.CreateModel( gametypeSettingsModel, "updateWeaponList" )
	self.disablePopupOpenCloseAnim = true
end

local PostLoadFunc = function ( self, controller, menu )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedTabModel = Engine.CreateModel( gametypeSettingsModel, "selectedTab" )
	self:subscribeToModel( selectedTabModel, function ( model )
		local currentTab = Engine.GetModelValue( model )
		self.Tabs:setActiveIndex( 1, (currentTab or 0) + 1 )
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
end

LUI.createMenu.Competitive_Settings_Attachment_Weapons = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings_Attachment_Weapons" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings_Attachment_Weapons.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( 0, 1, 0, 0 )
	GameSettingsBackground:setTopBottom( 0, 1, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( GametypeSettingsAttachmentHeader( controller, "MPUI_ATTACHMENTS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( GametypeSettingsAttachmentHeader( controller, "MPUI_ATTACHMENTS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.ToolTip:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local Options = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Options:makeFocusable()
	Options:setLeftRight( 0, 0, 41, 857 )
	Options:setTopBottom( 0, 0, 295, 1043 )
	Options:setWidgetType( CoD.Slider_Small )
	Options:setVerticalCount( 15 )
	Options:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		SetElementStateByElementName( self, "CompetitiveSettingsSelectedItemInfo", controller, "WeaponImage" )
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
		AdjustGameSettingsTab( self, element, controller, "-1" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		AdjustGameSettingsTab( self, element, controller, "1" )
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
	LUI.OverrideFunction_CallOriginalFirst( Options, "close", function ( element )
		ForceNotifyGlobalModel( controller, "GametypeSettings.Update" )
	end )
	self:addElement( Options )
	self.Options = Options
	
	local CompetitiveSettingsSelectedItemInfo = CoD.Competitive_Settings_SelectedItemInfo.new( self, controller )
	CompetitiveSettingsSelectedItemInfo:setLeftRight( 0, 1, 0, 0 )
	CompetitiveSettingsSelectedItemInfo:setTopBottom( 0, 1, 0, 0 )
	self:addElement( CompetitiveSettingsSelectedItemInfo )
	self.CompetitiveSettingsSelectedItemInfo = CompetitiveSettingsSelectedItemInfo
	
	local AllWeaponsOption = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	AllWeaponsOption:makeFocusable()
	AllWeaponsOption:setLeftRight( 0, 0, 41, 857 )
	AllWeaponsOption:setTopBottom( 0, 0, 208, 256 )
	AllWeaponsOption:setWidgetType( CoD.Slider_Small )
	AllWeaponsOption:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		SetElementStateByElementName( self, "CompetitiveSettingsSelectedItemInfo", controller, "SquareImage" )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	AllWeaponsOption:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( AllWeaponsOption, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		AdjustGameSettingsTab( self, element, controller, "-1" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( AllWeaponsOption, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		AdjustGameSettingsTab( self, element, controller, "1" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( AllWeaponsOption, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
		return true
	end, false )
	self:addElement( AllWeaponsOption )
	self.AllWeaponsOption = AllWeaponsOption
	
	local Tabs = CoD.GameSettings_TabBar.new( self, controller )
	Tabs:setLeftRight( 0, 0, 0, 2421 )
	Tabs:setTopBottom( 0, 0, 130.5, 187.5 )
	Tabs.Tabs:setDataSource( "CompetitiveSettingsAttachmentWeaponTabs" )
	Tabs:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ForceNotifyGlobalModel( controller, "GametypeSettings.updateWeaponList" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingsBackground:close()
		self.Options:close()
		self.CompetitiveSettingsSelectedItemInfo:close()
		self.AllWeaponsOption:close()
		self.Tabs:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings_Attachment_Weapons.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

