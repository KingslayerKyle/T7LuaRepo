require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList_Specialist" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Competitive.Competitive_Settings_SelectedItemInfo" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	DataSources[f1_arg1] = DataSourceHelpers.ListSetup( f1_arg1, function ( f2_arg0 )
		local f2_local0 = {}
		for f2_local5, f2_local6 in ipairs( f1_arg2 ) do
			if Engine.ItemIndexValid( f2_local6 ) then
				local f2_local4 = Engine.GetUnlockableInfoByIndex( f2_local6 )
				if f2_local4.allocation >= 0 and LUI.startswith( f2_local4.loadoutSlot, "hero" ) then
					table.insert( f2_local0, CoD.OptionsUtility.CreateItemRestrictionSettings( f2_arg0, f2_local4.name, "", "CompetitiveSettings_ItemRestriction_" .. tostring( f2_local6 ), CoD.GameSettingsUtility.GetRestrictionOptions(), f2_local4.image, CoD.OptionsUtility.GametypeSettingsSetItemRestrictionState, {
						itemIndex = f2_local6
					}, function ( f3_arg0 )
						return Engine.GetItemRestrictionState( f3_arg0.itemIndex )
					end, function ( f4_arg0 )
						Engine.SetItemRestrictionState( f4_arg0.itemIndex, Engine.GetItemRestrictionState( f4_arg0.itemIndex, true ) )
					end ) )
				end
			end
		end
		if #f2_local0 > 0 then
			f2_local0[1].properties.first = true
			f2_local0[#f2_local0].properties.last = true
		end
		return f2_local0
	end )
	return f1_arg1
end

DataSources.CompetitiveSettingsSpecialistOptions = DataSourceHelpers.ListSetup( "CompetitiveSettingsSpecialistOptions", function ( f5_arg0 )
	local f5_local0 = {}
	local f5_local1 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
	local f5_local2 = {}
	for f5_local6, f5_local7 in ipairs( f5_local1 ) do
		if f5_local7.disabled ~= true and not CoDShared.IsLootHero( f5_local7 ) then
			table.insert( f5_local0, {
				models = {
					name = Engine.Localize( f5_local7.displayName ),
					optionsDatasource = f0_local0( f5_arg0, "CompetitiveSettings_HeroRestriction_" .. tostring( f5_local6 ), {
						Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), f5_local6 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON ),
						Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), f5_local6 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
					} )
				}
			} )
		end
	end
	return f5_local0
end, nil, nil, function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "Update" )
	if f6_arg1.updateSubscription then
		f6_arg1:removeSubscription( f6_arg1.updateSubscription )
	end
	f6_arg1.updateSubscription = f6_arg1:subscribeToModel( f6_local0, function ()
		f6_arg1:updateDataSource( false )
	end, false )
end )
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_Settings_Specialists.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( true, true, 0, 0 )
	GameSettingsBackground:setTopBottom( true, true, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "HEROES_SPECIALISTS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "HEROES_SPECIALISTS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.ToolTip:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local Options = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	Options:makeFocusable()
	Options:setLeftRight( true, false, 27, 697 )
	Options:setTopBottom( true, false, 139, 579 )
	Options:setDataSource( "CompetitiveSettingsSpecialistOptions" )
	Options:setWidgetType( CoD.Competitive_SettingsList_Specialist )
	Options:setVerticalCount( 4 )
	Options:setSpacing( 0 )
	Options:setVerticalCounter( CoD.verticalCounter )
	self:addElement( Options )
	self.Options = Options
	
	local CompetitiveSettingsSelectedItemInfo = CoD.Competitive_Settings_SelectedItemInfo.new( self, controller )
	CompetitiveSettingsSelectedItemInfo:setLeftRight( true, true, 0, 0 )
	CompetitiveSettingsSelectedItemInfo:setTopBottom( true, true, 0, 0 )
	CompetitiveSettingsSelectedItemInfo:mergeStateConditions( {
		{
			stateName = "SquareImage",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( CompetitiveSettingsSelectedItemInfo )
	self.CompetitiveSettingsSelectedItemInfo = CompetitiveSettingsSelectedItemInfo
	
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_Settings_Specialists.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

