require( "ui.uieditor.widgets.Competitive.Competitive_Settings_SelectedItemInfo" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList_Specialist" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local CreateSpecialistItemOptions = function ( controller, dataSourceName, items )
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		for index, itemIndex in ipairs( items ) do
			if Engine.ItemIndexValid( itemIndex ) then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
				if itemInfo.allocation >= 0 and LUI.startswith( itemInfo.loadoutSlot, "hero" ) then
					local image = itemInfo.image
					local name = itemInfo.name
					local desc = ""
					table.insert( dataTable, CoD.OptionsUtility.CreateItemRestrictionSettings( controller, name, desc, "CompetitiveSettings_ItemRestriction_" .. tostring( itemIndex ), CoD.GameSettingsUtility.GetRestrictionOptions(), image, CoD.OptionsUtility.GametypeSettingsSetItemRestrictionState, {
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
		if #dataTable > 0 then
			dataTable[1].properties.first = true
			dataTable[#dataTable].properties.last = true
		end
		return dataTable
	end )
	return dataSourceName
end

local PrepareSpecialistListOptions = function ( controller )
	local optionsTable = {}
	local heroTable = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
	local items = {}
	for _, hero in ipairs( heroTable ) do
		local heroIndex = hero.bodyIndex
		if hero.disabled ~= true then
			local weapon = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
			local ability = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
			table.insert( optionsTable, {
				models = {
					name = Engine.Localize( hero.displayName ),
					optionsDatasource = CreateSpecialistItemOptions( controller, "CompetitiveSettings_HeroRestriction_" .. tostring( heroIndex ), {
						weapon,
						ability
					} )
				}
			} )
		end
	end
	return optionsTable
end

local ItemOptionsUpdate = function ( controller, list, listModel )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local updateModel = Engine.CreateModel( gametypeSettingsModel, "Update" )
	if list.updateSubscription then
		list:removeSubscription( list.updateSubscription )
	end
	list.updateSubscription = list:subscribeToModel( updateModel, function ()
		list:updateDataSource( false )
	end, false )
end

DataSources.CompetitiveSettingsSpecialistOptions = DataSourceHelpers.ListSetup( "CompetitiveSettingsSpecialistOptions", PrepareSpecialistListOptions, nil, nil, ItemOptionsUpdate )
local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

LUI.createMenu.Competitive_Settings_Specialists = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_Settings_Specialists" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings_Specialists.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( 0, 1, 0, 0 )
	GameSettingsBackground:setTopBottom( 0, 1, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "HEROES_SPECIALISTS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "HEROES_SPECIALISTS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.ToolTip:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local Options = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	Options:makeFocusable()
	Options:setLeftRight( 0, 0, 41, 1046 )
	Options:setTopBottom( 0, 0, 208, 868 )
	Options:setWidgetType( CoD.Competitive_SettingsList_Specialist )
	Options:setVerticalCount( 4 )
	Options:setSpacing( 0 )
	Options:setVerticalCounter( CoD.verticalCounter )
	Options:setDataSource( "CompetitiveSettingsSpecialistOptions" )
	self:addElement( Options )
	self.Options = Options
	
	local CompetitiveSettingsSelectedItemInfo = CoD.Competitive_Settings_SelectedItemInfo.new( self, controller )
	CompetitiveSettingsSelectedItemInfo:mergeStateConditions( {
		{
			stateName = "SquareImage",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	CompetitiveSettingsSelectedItemInfo:setLeftRight( 0, 1, 0, 0 )
	CompetitiveSettingsSelectedItemInfo:setTopBottom( 0, 1, 0, 0 )
	self:addElement( CompetitiveSettingsSelectedItemInfo )
	self.CompetitiveSettingsSelectedItemInfo = CompetitiveSettingsSelectedItemInfo
	
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings_Specialists.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

