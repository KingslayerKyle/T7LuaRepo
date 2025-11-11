require( "ui.uieditor.widgets.Controls.Slider_Small" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_GameModeRulesList" )

local PrepareDraftSettingsOptions = function ( controller )
	local optionsTable = {}
	local settingInfo = nil
	local draftSettings = CoD.OptionsUtility.DraftSettings
	if draftSettings and #draftSettings > 0 then
		for index, setting in ipairs( draftSettings ) do
			settingInfo = CoD.OptionsUtility.GameSettings[setting]
			table.insert( optionsTable, CoD.OptionsUtility.CreateListOptions( controller, settingInfo.name, settingInfo.hintText, setting, settingInfo, "GameTypeOptionsList_" .. setting ) )
		end
	end
	return optionsTable
end

local PrepareAllCharacterSettings = function ( controller )
	local characters = Engine.GetHeroList( Engine.CurrentSessionMode() )
	local gametypeSettings = Engine.GetGametypeSettings()
	local SetAllSettings = function ( val )
		print( "Setting ALL Max Character Count:  Max: " .. val )
		if characters and #characters > 0 then
			for _, character in ipairs( characters ) do
				gametypeSettings.maxUniqueRolesPerTeam[character.bodyIndex]:set( val )
			end
			Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.UpdateCharacters" ) )
		end
	end
	
	local allCharOptionsDatasourceName = "allCharacterOptions"
	DataSources[allCharOptionsDatasourceName] = DataSourceHelpers.ListSetup( allCharOptionsDatasourceName, function ( controller )
		local dataTable = {}
		table.insert( dataTable, {
			models = {
				text = "MENU_CUSTOM",
				prevAction = function ()
					SetAllSettings( 5 )
				end,
				nextAction = function ()
					SetAllSettings( 0 )
				end
			},
			properties = {
				selectIndex = true,
				loopEdges = true
			}
		} )
		for i = 0, 5, 1 do
			local f4_local2 = i
			table.insert( dataTable, {
				models = {
					text = f4_local2,
					prevAction = function ()
						if f4_local2 - 1 >= 0 then
							SetAllSettings( f4_local2 - 1 )
						end
					end,
					nextAction = function ()
						if f4_local2 + 1 <= 5 then
							SetAllSettings( f4_local2 + 1 )
						end
					end
				},
				properties = {
					selectIndex = false,
					loopEdges = true
				}
			} )
		end
		dataTable[1].properties.first = true
		dataTable[#dataTable].properties.last = true
		return dataTable
	end, nil, nil, nil )
	local optionsTable = {}
	table.insert( optionsTable, {
		models = {
			name = "MENU_ALL_SPECIALISTS",
			desc = "MENU_ALL_SPECIALISTS_HINT",
			image = "blacktransparent",
			optionsDatasource = allCharOptionsDatasourceName
		},
		properties = {}
	} )
	return optionsTable
end

local CreateSettingsDataSource = function ( defaultCharacterSetting, characterSetting, characterIndex )
	local maxPlayersPerTeam = 5
	local maxCharacterCount = characterSetting:get()
	local defaultMaxCharacterCount = defaultCharacterSetting:get()
	local SetCharacter = function ( value )
		characterSetting:set( value )
		print( "Setting Max Character Count: Character:" .. characterIndex .. " Max: " .. value )
		Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.CharacterUpdated" ) )
	end
	
	local datasourceName = "gts_maxUniqueRolesPerTeam" .. characterIndex
	DataSources[datasourceName] = DataSourceHelpers.ListSetup( datasourceName, function ()
		local dataTable = {}
		for i = 0, maxPlayersPerTeam, 1 do
			local f11_local2 = i
			table.insert( dataTable, {
				models = {
					text = f11_local2,
					prevAction = function ()
						SetCharacter( (f11_local2 - 1) % 6 )
					end,
					nextAction = function ()
						SetCharacter( (f11_local2 + 1) % 6 )
					end
				},
				properties = {
					title = "",
					desc = "",
					image = "",
					value = f11_local2,
					isDefault = defaultMaxCharacterCount == f11_local2,
					selectIndex = f11_local2 == maxCharacterCount,
					loopEdges = true
				}
			} )
		end
		dataTable[1].properties.first = true
		dataTable[maxPlayersPerTeam + 1].properties.last = true
		return dataTable
	end, nil, nil, nil )
	return datasourceName
end

local PrepareCharacterSettings = function ( controller )
	local optionsTable = {}
	local settingInfo = nil
	local gametypeSettings = Engine.GetGametypeSettings()
	local defaultGametypeSettings = Engine.GetGametypeSettings()
	local characters = Engine.GetHeroList( Engine.CurrentSessionMode() )
	if characters and #characters > 0 then
		for _, character in ipairs( characters ) do
			local characterIndex = character.bodyIndex
			local defaultCharacterSetting = defaultGametypeSettings.maxUniqueRolesPerTeam[characterIndex]
			local characterSetting = gametypeSettings.maxUniqueRolesPerTeam[characterIndex]
			table.insert( optionsTable, {
				models = {
					name = Engine.Localize( character.displayName ),
					desc = "MENU_MAX_UNIQUE_ROLES_HINT",
					image = "blacktransparent",
					optionsDatasource = CreateSettingsDataSource( defaultCharacterSetting, characterSetting, characterIndex )
				},
				properties = {
					revert = function ( self )
						characterSetting:set( defaultCharacterSetting:get() )
					end
				}
			} )
		end
	end
	return optionsTable
end

local CharacterChangedUpdate = function ( controller, list, listModel )
	local f16_local0 = Engine.GetGlobalModel()
	local model = f16_local0:create( "GametypeSettings.CharacterUpdated" )
	if list.updateSubscription then
		list:removeSubscription( list.updateSubscription )
	end
	list.updateSubscription = list:subscribeToModel( model, function ()
		list:updateDataSource( true )
	end, false )
end

local SettingsUpdate = function ( controller, list, listModel )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local updateModel = Engine.CreateModel( gametypeSettingsModel, "UpdateCharacters" )
	if list.updateSubscription then
		list:removeSubscription( list.updateSubscription )
	end
	list.updateSubscription = list:subscribeToModel( updateModel, function ()
		list:updateDataSource( true )
	end, false )
end

DataSources.DraftSettings = DataSourceHelpers.ListSetup( "DraftSettings", PrepareDraftSettingsOptions, nil, nil, nil )
DataSources.AllCharacterSettings = DataSourceHelpers.ListSetup( "AllCharacterSettings", PrepareAllCharacterSettings, nil, nil, CharacterChangedUpdate )
DataSources.CharacterSettings = DataSourceHelpers.ListSetup( "CharacterSettings", PrepareCharacterSettings, nil, nil, SettingsUpdate )
CoD.GameSettings_Characters = InheritFrom( LUI.UIElement )
CoD.GameSettings_Characters.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_Characters )
	self.id = "GameSettings_Characters"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 877 )
	self.anyChildUsesUpdateState = true
	
	local DraftSettings = CoD.GameSettings_GameModeRulesList.new( menu, controller )
	DraftSettings:setLeftRight( 0, 0, 961, 1865 )
	DraftSettings:setTopBottom( 0, 0, 6, 611 )
	DraftSettings.Title.DescTitle:setText( Engine.Localize( "MENU_DRAFT_SETTINGS_CAPS" ) )
	DraftSettings.Sliders:setDataSource( "DraftSettings" )
	self:addElement( DraftSettings )
	self.DraftSettings = DraftSettings
	
	local Characters = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Characters:makeFocusable()
	Characters:setLeftRight( 0, 0, 46, 862 )
	Characters:setTopBottom( 0, 0, 142.5, 890.5 )
	Characters:setWidgetType( CoD.Slider_Small )
	Characters:setVerticalCount( 15 )
	Characters:setDataSource( "CharacterSettings" )
	Characters:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	Characters:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Characters, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( Characters, "close", function ( element )
		ForceNotifyGlobalModel( controller, "GametypeSettings.Update" )
	end )
	self:addElement( Characters )
	self.Characters = Characters
	
	local AllCharacters = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	AllCharacters:makeFocusable()
	AllCharacters:setLeftRight( 0, 0, 46, 862 )
	AllCharacters:setTopBottom( 0, 0, 73, 121 )
	AllCharacters:setWidgetType( CoD.Slider_Small )
	AllCharacters:setDataSource( "AllCharacterSettings" )
	self:addElement( AllCharacters )
	self.AllCharacters = AllCharacters
	
	local DescTitle = LUI.UITightText.new()
	DescTitle:setLeftRight( 0, 0, 109.5, 312.5 )
	DescTitle:setTopBottom( 0, 0, 24, 54 )
	DescTitle:setText( Engine.Localize( "MENU_SPECIALIST_LIMITS_CAPS" ) )
	DescTitle:setTTF( "fonts/escom.ttf" )
	DescTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	DescTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	DescTitle:setShaderVector( 1, 0, 0, 0, 0 )
	DescTitle:setShaderVector( 2, 1, 0, 0, 0 )
	DescTitle:setLetterSpacing( 1 )
	LUI.OverrideFunction_CallOriginalFirst( DescTitle, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( DescTitle )
	self.DescTitle = DescTitle
	
	DraftSettings.navigation = {
		left = {
			AllCharacters,
			Characters
		}
	}
	Characters.navigation = {
		up = AllCharacters,
		right = DraftSettings
	}
	AllCharacters.navigation = {
		right = DraftSettings,
		down = Characters
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	DraftSettings.id = "DraftSettings"
	Characters.id = "Characters"
	AllCharacters.id = "AllCharacters"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.DraftSettings:close()
		self.Characters:close()
		self.AllCharacters:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

