require( "ui.uieditor.widgets.GameSettings.GameSettings_Background" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsList" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	local f1_local0 = f1_arg3
	local f1_local1 = Engine.DvarInt( nil, f1_local0 )
	local f1_local2 = f1_arg1.value
	UpdateInfoModels( f1_arg1 )
	if f1_local2 == f1_local1 then
		return 
	end
	print( "Setting Dvar: " .. f1_local0 .. " to: " .. f1_local2 )
	Engine.SetDvar( f1_local0, f1_local2 )
	if CoDShared.IsGametypeTeamBased() then
		local f1_local3 = Engine.DvarInt( nil, "bot_maxAllies" )
		local f1_local4 = Engine.DvarInt( nil, "bot_maxAxis" )
		local f1_local5 = CoD.GameSettingsUtility.GetMaxBotsCount()
		if f1_local5 < f1_local3 + f1_local4 then
			local f1_local6 = 0
			if f1_local0 == "bot_maxAllies" and f1_local3 > 0 then
				f1_local6 = f1_local5 - f1_local3 + 1
			else
				f1_local6 = f1_local5 - f1_local4 + 1
			end
			if f1_local6 > 0 then
				if f1_local0 == "bot_maxAllies" then
					Engine.SetDvar( "bot_maxAxis", f1_local6 - 1 )
				else
					Engine.SetDvar( "bot_maxAllies", f1_local6 - 1 )
				end
			end
		end
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "Update" ) )
end

DataSources.BotSettings = DataSourceHelpers.ListSetup( "BotSettings", function ( f2_arg0 )
	local f2_local0 = {}
	local f2_local1 = CoD.GameSettingsUtility.GetMaxBotsCount()
	local f2_local2 = {}
	table.insert( f2_local2, {
		option = "MENU_DISABLED",
		value = 0,
		default = true
	} )
	local f2_local3 = 1
	if not CoDShared.IsGametypeTeamBased() then
		f2_local3 = 2
	end
	for f2_local4 = f2_local3, f2_local1, 1 do
		table.insert( f2_local2, {
			option = tostring( f2_local4 ),
			value = f2_local4
		} )
	end
	if CoDShared.IsGametypeTeamBased() then
		table.insert( f2_local0, CoD.OptionsUtility.CreateDvarSettings( f2_arg0, "MPUI_ALLIES_CAPS", "MENU_ALLIES_BOT_DESC", "BotOptions_AlliesBots", "bot_maxAllies", f2_local2, nil, f0_local0 ) )
		table.insert( f2_local0, CoD.OptionsUtility.CreateDvarSettings( f2_arg0, "MPUI_AXIS_CAPS", "MENU_AXIS_BOT_DESC", "BotOptions_AxisBots", "bot_maxAxis", f2_local2, nil, f0_local0 ) )
	else
		table.insert( f2_local0, CoD.OptionsUtility.CreateDvarSettings( f2_arg0, "MENU_GAME_SIZE", "MENU_FREE_BOT_DESC", "BotOptions_EnemyBots", "bot_maxFree", f2_local2, nil, f0_local0 ) )
	end
	table.insert( f2_local0, CoD.OptionsUtility.CreateDvarSettings( f2_arg0, "MENU_BASICTRAINING_DIFFICULTY_CAPS", "MENU_BOT_DIFFICULTY", "BotOptions_Difficulty", "bot_difficulty", {
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
	}, nil, f0_local0 ) )
	return f2_local0
end, nil, nil, function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "Update" )
	if f3_arg1.updateSubscription then
		f3_arg1:removeSubscription( f3_arg1.updateSubscription )
	end
	f3_arg1.updateSubscription = f3_arg1:subscribeToModel( f3_local0, function ()
		f3_arg1:updateDataSource()
	end, false )
end )
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GameSettings_Bots.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( self, controller )
	GameSettingsBackground:setLeftRight( true, true, 0, 0 )
	GameSettingsBackground:setTopBottom( true, true, 0, 0 )
	GameSettingsBackground.MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SETUP_BOTS_CAPS" ) )
	GameSettingsBackground.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SETUP_BOTS_CAPS" ) )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeInfo:setAlpha( 0 )
	GameSettingsBackground.GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local Options = CoD.Competitive_SettingsList.new( self, controller )
	Options:setLeftRight( true, false, 26, 741 )
	Options:setTopBottom( true, false, 135, 720 )
	Options.Title.DescTitle:setText( Engine.Localize( "MENU_DESIRED_TEAM_SIZE_CAPS" ) )
	Options.ButtonList:setVerticalCount( 15 )
	Options.ButtonList:setDataSource( "BotSettings" )
	self:addElement( Options )
	self.Options = Options
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Options:completeAnimation()
				Options.Title.DescTitle:completeAnimation()
				self.Options.Title.DescTitle:setText( Engine.Localize( "MENU_DESIRED_TEAM_SIZE_CAPS" ) )
				self.clipFinished( Options, {} )
			end
		},
		NonTeamBased = {
			DefaultClip = function ()
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
		SetPerControllerTableProperty( controller, "disableGameSettingsOptions", nil )
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GameSettings_Bots.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

