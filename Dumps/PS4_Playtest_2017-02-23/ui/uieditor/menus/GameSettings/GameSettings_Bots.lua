require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )

local OnBotSettingsChange = function ( self, element, controller, actionParam, menu )
	local dvar = actionParam
	local currentValue = Engine.GetDvarInt( dvar )
	local newValue = element.value
	CoD.OptionsUtility.UpdateInfoModels( element )
	if newValue == currentValue then
		return 
	end
	print( "Setting Dvar: " .. dvar .. " to: " .. newValue )
	Engine.SetDvar( dvar, newValue )
	if CoDShared.IsGametypeTeamBased() then
		local allies = Engine.GetDvarInt( "bot_maxAllies" )
		local axis = Engine.GetDvarInt( "bot_maxAxis" )
		local maxBots = CoD.GameSettingsUtility.GetMaxBotsCount()
		if maxBots < allies + axis then
			local diff = 0
			if dvar == "bot_maxAllies" and allies > 0 then
				diff = maxBots - allies + 1
			else
				diff = maxBots - axis + 1
			end
			if diff > 0 then
				if dvar == "bot_maxAllies" then
					Engine.SetDvar( "bot_maxAxis", diff - 1 )
				else
					Engine.SetDvar( "bot_maxAllies", diff - 1 )
				end
			end
		end
	end
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local updateModel = Engine.CreateModel( gametypeSettingsModel, "Update" )
	Engine.ForceNotifyModelSubscriptions( updateModel )
end

local PrepareBotSettingsOptions = function ( controller )
	local optionsTable = {}
	local maxBots = CoD.GameSettingsUtility.GetMaxBotsCount()
	local options = {}
	table.insert( options, {
		option = "MENU_DISABLED",
		value = 0,
		default = true
	} )
	local startingBotCount = 1
	if not CoDShared.IsGametypeTeamBased() then
		startingBotCount = 2
	end
	for optionIndex = startingBotCount, maxBots, 1 do
		table.insert( options, {
			option = tostring( optionIndex ),
			value = optionIndex
		} )
	end
	if CoDShared.IsGametypeTeamBased() then
		table.insert( optionsTable, CoD.OptionsUtility.CreateDvarSettings( controller, "MPUI_ALLIES_CAPS", "MENU_ALLIES_BOT_DESC", "BotOptions_AlliesBots", "bot_maxAllies", options, nil, OnBotSettingsChange ) )
		table.insert( optionsTable, CoD.OptionsUtility.CreateDvarSettings( controller, "MPUI_AXIS_CAPS", "MENU_AXIS_BOT_DESC", "BotOptions_AxisBots", "bot_maxAxis", options, nil, OnBotSettingsChange ) )
	else
		table.insert( optionsTable, CoD.OptionsUtility.CreateDvarSettings( controller, "MENU_GAME_SIZE", "MENU_FREE_BOT_DESC", "BotOptions_EnemyBots", "bot_maxFree", options, nil, OnBotSettingsChange ) )
	end
	table.insert( optionsTable, CoD.OptionsUtility.CreateDvarSettings( controller, "MENU_BASICTRAINING_DIFFICULTY_CAPS", "MENU_BOT_DIFFICULTY", "BotOptions_Difficulty", "bot_difficulty", {
		{
			option = "MENU_BASICTRAINING_EASY_CAPS",
			value = 0
		},
		{
			option = "MENU_BASICTRAINING_NORMAL_CAPS",
			value = 1,
			default = true
		},
		{
			option = "MENU_BASICTRAINING_HARD_CAPS",
			value = 2
		},
		{
			option = "MENU_BASICTRAINING_FU_CAPS",
			value = 3
		}
	}, nil, OnBotSettingsChange ) )
	return optionsTable
end

local BotSettingsUpdate = function ( controller, list, listModel )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local updateModel = Engine.CreateModel( gametypeSettingsModel, "Update" )
	if list.updateSubscription then
		list:removeSubscription( list.updateSubscription )
	end
	list.updateSubscription = list:subscribeToModel( updateModel, function ()
		list:updateDataSource()
	end, false )
end

DataSources.BotSettings = DataSourceHelpers.ListSetup( "BotSettings", PrepareBotSettingsOptions, nil, nil, BotSettingsUpdate )
local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

LUI.createMenu.GameSettings_Bots = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GameSettings_Bots" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GameSettings_Bots.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( 0, 1, 0, 0 )
	GameSettingsBackground:setTopBottom( 0, 1, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SETUP_BOTS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SETUP_BOTS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local Options = CoD.Competitive_SettingsList.new( self, controller )
	Options:setLeftRight( 0, 0, 39, 1111 )
	Options:setTopBottom( 0, 0, 202, 1080 )
	Options.Title.DescTitle:setText( Engine.Localize( "MENU_DESIRED_TEAM_SIZE_CAPS" ) )
	Options.ButtonList:setVerticalCount( 15 )
	Options.ButtonList:setDataSource( "BotSettings" )
	self:addElement( Options )
	self.Options = Options
	
	self.resetProperties = function ()
		Options:completeAnimation()
		Options.Title.DescTitle:setText( Engine.Localize( "MENU_DESIRED_TEAM_SIZE_CAPS" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NonTeamBased = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Options:completeAnimation()
				Options.Title.DescTitle:completeAnimation()
				self.Options.Title.DescTitle:setText( Engine.Localize( "MENU_DESIRED_GAME_SIZE_CAPS" ) )
				self.clipFinished( Options, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NonTeamBased",
			condition = function ( menu, element, event )
				return not IsGametypeTeambased()
			end
		}
	} )
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GameSettings_Bots.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

