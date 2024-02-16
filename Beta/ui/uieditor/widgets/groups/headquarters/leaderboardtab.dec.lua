require( "ui.uieditor.widgets.Leaderboard.LeaderboardInformation" )
require( "ui.uieditor.widgets.Leaderboard.Leaderboard" )
require( "ui.uieditor.widgets.Groups.GroupsLeaderboardSummary" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_wHeader" )

CoD.Leaderboard_MP = {}
CoD.Leaderboard_MP.BaseDefName = 1
CoD.Leaderboard_MP.CoreName = 2
CoD.Leaderboard_MP.SortColumn = 3
CoD.Leaderboard_MP.TimeFrame = 4
CoD.Leaderboard_MP.Hardcore = 5
CoD.Leaderboard_MP.LeaderboardCoreNames = {
	{
		name = "CAREER",
		stringRef = "MPUI_LB_CAREER",
		icon = "playlist_gungame",
		lbMakerHint = "GROUPS_LBMAKER_CAREER_HINT_TEXT"
	},
	{
		name = "TDM",
		stringRef = "MPUI_TDM",
		icon = "playlist_tdm",
		lbMakerHint = "GROUPS_LBMAKER_TDM_HINT_TEXT"
	},
	{
		name = "DOM",
		stringRef = "MPUI_DOM",
		icon = "playlist_dom",
		lbMakerHint = "GROUPS_LBMAKER_DOM_HINT_TEXT"
	}
}
CoD.Leaderboard_MP.LeaderboardSortColumns = {
	{
		name = "SPM",
		stringRef = "MENU_LB_SCORE_PER_MINUTE"
	},
	{
		name = "SCORE",
		stringRef = "MENU_LB_SCORE"
	},
	{
		name = "GAMESPLAYED",
		stringRef = "MENU_LB_GAMES_PLAYED"
	},
	{
		name = "TIMEPLAYED",
		stringRef = "MENU_LB_TIME_PLAYED"
	},
	{
		name = "KILLS",
		stringRef = "MENU_LB_KILLS"
	},
	{
		name = "KDRATIO",
		stringRef = "MENU_LB_KILLDEATH_RATIO"
	},
	{
		name = "ASSISTS",
		stringRef = "MENU_LB_ASSISTS"
	},
	{
		name = "CAPTURES",
		stringRef = "MENU_LB_CAPTURES"
	},
	{
		name = "DEFENDS",
		stringRef = "MENU_LB_DEFENDS"
	}
}
CoD.Leaderboard_MP.LeaderboardTimeFrames = {
	{
		name = "ALLTIME",
		stringRef = "MENU_LB_DFILTER_ALL_TIME",
		value = Enum.LbTrackType.LB_TRK_ALLTIME,
		lbMakerHint = "GROUPS_LBMAKER_TIMEFRAME_ALLTIME_HINT_TEXT"
	},
	{
		name = "MONTHLY",
		stringRef = "MENU_LB_DFILTER_MONTHLY",
		value = Enum.LbTrackType.LB_TRK_MONTHLY,
		lbMakerHint = "GROUPS_LBMAKER_TIMEFRAME_MONTHLY_HINT_TEXT"
	},
	{
		name = "WEEKLY",
		stringRef = "MENU_LB_DFILTER_WEEKLY",
		value = Enum.LbTrackType.LB_TRK_WEEKLY,
		lbMakerHint = "GROUPS_LBMAKER_TIMEFRAME_WEEKLY_HINT_TEXT"
	},
	{
		name = "DAILY",
		stringRef = "MENU_LB_DFILTER_DAILY",
		value = Enum.LbTrackType.LB_TRK_DAILY,
		lbMakerHint = ""
	},
	{
		name = "PRESTIGE_ALLTIME",
		stringRef = "MENU_LB_DFILTER_ALL_TIME",
		value = Enum.LbTrackType.LB_TRK_PRESTIGE_ALLTIME,
		lbMakerHint = ""
	},
	{
		name = "PRESTIGE_MONTHLY",
		stringRef = "MENU_LB_DFILTER_MONTHLY",
		value = Enum.LbTrackType.LB_TRK_PRESTIGE_MONTHLY,
		lbMakerHint = ""
	},
	{
		name = "PRESTIGE_WEEKLY",
		stringRef = "MENU_LB_DFILTER_WEEKLY",
		value = Enum.LbTrackType.LB_TRK_PRESTIGE_WEEKLY,
		lbMakerHint = ""
	},
	{
		name = "PRESTIGE_DAILY",
		stringRef = "MENU_LB_DFILTER_DAILY",
		value = Enum.LbTrackType.LB_TRK_PRESTIGE_DAILY,
		lbMakerHint = ""
	}
}
CoD.Leaderboard_MP.Leaderboards = {
	{
		"GB",
		"CAREER",
		{
			"SPM",
			"SCORE",
			"GAMESPLAYED",
			"TIMEPLAYED"
		},
		{
			"ALLTIME",
			"MONTHLY",
			"WEEKLY"
		},
		false
	},
	{
		"GM",
		"TDM",
		{
			"SPM",
			"KILLS",
			"KDRATIO",
			"ASSISTS"
		},
		{
			"ALLTIME",
			"MONTHLY",
			"WEEKLY"
		},
		true
	},
	{
		"GM",
		"DOM",
		{
			"SPM",
			"KILLS",
			"CAPTURES",
			"DEFENDS"
		},
		{
			"ALLTIME",
			"MONTHLY",
			"WEEKLY"
		},
		true
	}
}
CoD.Leaderboard_MP.GetLeaderboardIndex = function ( coreName )
	for i = 1, #CoD.Leaderboard_MP.Leaderboards, 1 do
		local row = CoD.Leaderboard_MP.Leaderboards[i]
		if row[CoD.Leaderboard_MP.CoreName] == coreName then
			return i
		end
	end
	return 0
end

CoD.Leaderboard_MP.GetSortColumnIndex = function ( leaderboardIndex, sortColumnName )
	local id = 0
	local row = CoD.Leaderboard_MP.Leaderboards[leaderboardIndex]
	local sortColumnData = row[CoD.Leaderboard_MP.SortColumn]
	for i = 1, #sortColumnData, 1 do
		if sortColumnData[i] == sortColumnName then
			return i
		end
	end
	return 0
end

CoD.Leaderboard_MP.GetTimeFrameIndex = function ( leaderboardIndex, timeFrameName )
	local id = 0
	local row = CoD.Leaderboard_MP.Leaderboards[leaderboardIndex]
	local timeFrameData = row[CoD.Leaderboard_MP.TimeFrame]
	for i = 1, #timeFrameData, 1 do
		if timeFrameData[i] == timeFrameName then
			return i
		end
	end
	return 0
end

CoD.Leaderboard_MP.GetLeaderboardCoreNameData = function ( coreName )
	for i = 1, #CoD.Leaderboard_MP.LeaderboardCoreNames, 1 do
		local row = CoD.Leaderboard_MP.LeaderboardCoreNames[i]
		if row.name == coreName then
			return row
		end
	end
	return nil
end

CoD.Leaderboard_MP.GetLeaderboardSortColumnData = function ( sortColumnName )
	for i = 1, #CoD.Leaderboard_MP.LeaderboardSortColumns, 1 do
		local row = CoD.Leaderboard_MP.LeaderboardSortColumns[i]
		if row.name == sortColumnName then
			return row
		end
	end
	return nil
end

CoD.Leaderboard_MP.GetTimeFrameDataFromName = function ( timeFrameName )
	for i = 1, #CoD.Leaderboard_MP.LeaderboardTimeFrames, 1 do
		local row = CoD.Leaderboard_MP.LeaderboardTimeFrames[i]
		if row.name == timeFrameName then
			return row
		end
	end
	return nil
end

CoD.Leaderboard_MP.GetTimeFrameDataFromEnumValue = function ( value )
	for i = 1, #CoD.Leaderboard_MP.LeaderboardTimeFrames, 1 do
		local row = CoD.Leaderboard_MP.LeaderboardTimeFrames[i]
		if row.value == value then
			return row
		end
	end
	return -1
end

CoD.Leaderboard_MP.GetLeaderboardDefName = function ( leaderboardId, sortColumnIndex, isHardcore )
	local row = CoD.Leaderboard_MP.Leaderboards[leaderboardId]
	local sortColumnName = row[CoD.Leaderboard_MP.SortColumn][sortColumnIndex]
	local result = "LB_MP"
	result = result .. "_" .. row[CoD.Leaderboard_MP.BaseDefName] .. "_" .. row[CoD.Leaderboard_MP.CoreName] .. "_" .. sortColumnName
	if isHardcore then
		result = result .. "_HC"
	end
	return result
end

local UpdateNavigation = function ( self, controller )
	if DoesHaveAdminRightsForGroup( nil, controller ) and not IsGroupLeaderboardInitialized() then
		self.CreateLeaderboardButton.navigation = {
			down = self.UseDefaultButton
		}
		self.UseDefaultButton.navigation = {
			up = self.CreateLeaderboardButton
		}
		self.Leaderboard.navigation = {}
	elseif not IsGroupLeaderboardAvailable() then
		self.CreateLeaderboardButton.navigation = {}
		self.UseDefaultButton.navigation = {}
		self.Leaderboard.navigation = {}
	else
		self.CreateLeaderboardButton.navigation = {}
		self.UseDefaultButton.navigation = {}
		self.Leaderboard.navigation = {}
	end
	self:processEvent( {
		name = "gain_focus",
		controller = controller
	} )
end

local HandleLeaderboardUpdate = function ( self, event )
	if event.error == true then
		return 
	else
		local controller = event.controller
		DataSources.LeaderboardHeader.getModel( controller )
		self:UpdateNavigation( controller )
	end
end

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "leaderboardlist_update", HandleLeaderboardUpdate )
	self:registerEventHandler( "gain_focus", function ( self, event )
		if DoesHaveAdminRightsForGroup( nil, event.controller ) and not IsGroupLeaderboardInitialized() then
			if self.CreateLeaderboardButton:processEvent( event ) then
				return true
			end
		elseif self.Leaderboard:processEvent( event ) then
			return true
		end
		return LUI.UIElement.gainFocus( self, event )
	end )
	self.UpdateNavigation = UpdateNavigation
	self:UpdateNavigation( controller )
	self:setModel( CoD.perController[controller].selectedGroup )
end

CoD.LeaderboardTab = InheritFrom( LUI.UIElement )
CoD.LeaderboardTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.LeaderboardTab )
	self.id = "LeaderboardTab"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 461 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CreateLeaderboardTitle = LUI.UIText.new()
	CreateLeaderboardTitle:setLeftRight( true, false, 34, 503 )
	CreateLeaderboardTitle:setTopBottom( true, false, 8, 56 )
	CreateLeaderboardTitle:setAlpha( 0 )
	CreateLeaderboardTitle:setText( Engine.Localize( "GROUPS_CREATE_YOUR_LEADERBOARD" ) )
	CreateLeaderboardTitle:setTTF( "fonts/default.ttf" )
	CreateLeaderboardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CreateLeaderboardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CreateLeaderboardTitle )
	self.CreateLeaderboardTitle = CreateLeaderboardTitle
	
	local CreateLeaderboardDesc = LUI.UIText.new()
	CreateLeaderboardDesc:setLeftRight( true, false, 34, 727 )
	CreateLeaderboardDesc:setTopBottom( true, false, 67, 87 )
	CreateLeaderboardDesc:setAlpha( 0 )
	CreateLeaderboardDesc:setText( Engine.Localize( "GROUPS_CREATE_YOUR_LEADERBOARD_DESC" ) )
	CreateLeaderboardDesc:setTTF( "fonts/default.ttf" )
	CreateLeaderboardDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CreateLeaderboardDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CreateLeaderboardDesc )
	self.CreateLeaderboardDesc = CreateLeaderboardDesc
	
	local NoLeaderboardDesc = LUI.UIText.new()
	NoLeaderboardDesc:setLeftRight( true, false, 34, 727 )
	NoLeaderboardDesc:setTopBottom( true, false, 67, 87 )
	NoLeaderboardDesc:setRGB( 0.5, 0.51, 0.52 )
	NoLeaderboardDesc:setAlpha( 0 )
	NoLeaderboardDesc:setText( Engine.Localize( "GROUPS_LEADERBOARD_UNAVAILABLE" ) )
	NoLeaderboardDesc:setTTF( "fonts/default.ttf" )
	NoLeaderboardDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	NoLeaderboardDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NoLeaderboardDesc )
	self.NoLeaderboardDesc = NoLeaderboardDesc
	
	local LeaderboardInformation = CoD.LeaderboardInformation.new( menu, controller )
	LeaderboardInformation:setLeftRight( true, false, 11, 311 )
	LeaderboardInformation:setTopBottom( true, false, 8, 33 )
	LeaderboardInformation:subscribeToGlobalModel( controller, "LeaderboardHeader", "baseLeaderboard", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeaderboardInformation.BaseLeaderboard:setText( Engine.Localize( modelValue ) )
		end
	end )
	LeaderboardInformation:subscribeToGlobalModel( controller, "LeaderboardHeader", "timeFrame", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeaderboardInformation.TimeFrame:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LeaderboardInformation )
	self.LeaderboardInformation = LeaderboardInformation
	
	local Leaderboard = CoD.Leaderboard.new( menu, controller )
	Leaderboard:setLeftRight( true, false, 11, 900 )
	Leaderboard:setTopBottom( true, false, 57, 424 )
	self:addElement( Leaderboard )
	self.Leaderboard = Leaderboard
	
	local GroupsLeaderboardSummary0 = CoD.GroupsLeaderboardSummary.new( menu, controller )
	GroupsLeaderboardSummary0:setLeftRight( true, false, 805, 1152 )
	GroupsLeaderboardSummary0:setTopBottom( true, false, 0, 460 )
	self:addElement( GroupsLeaderboardSummary0 )
	self.GroupsLeaderboardSummary0 = GroupsLeaderboardSummary0
	
	local CreateLeaderboardButton = CoD.List1ButtonLarge_Left_wHeader.new( menu, controller )
	CreateLeaderboardButton:setLeftRight( true, false, 11, 367 )
	CreateLeaderboardButton:setTopBottom( true, false, 107.5, 139.5 )
	CreateLeaderboardButton:setAlpha( 0 )
	CreateLeaderboardButton.Text:setText( Engine.Localize( "GROUPS_CREATE" ) )
	CreateLeaderboardButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CreateLeaderboardButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CreateLeaderboardButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenLeaderboardMaker( self, element, controller, "ChooseBaseLeaderboard" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	CreateLeaderboardButton:mergeStateConditions( {
		{
			stateName = "WithSelectedIcon",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( CreateLeaderboardButton )
	self.CreateLeaderboardButton = CreateLeaderboardButton
	
	local UseDefaultButton = CoD.List1ButtonLarge_Left_wHeader.new( menu, controller )
	UseDefaultButton:setLeftRight( true, false, 11, 367 )
	UseDefaultButton:setTopBottom( true, false, 147.5, 179.5 )
	UseDefaultButton:setAlpha( 0 )
	UseDefaultButton.Text:setText( Engine.Localize( "GROUPS_USE_DEFAULT_CAREER" ) )
	UseDefaultButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	UseDefaultButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( UseDefaultButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SetDefaultCareerLeaderboard( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( UseDefaultButton )
	self.UseDefaultButton = UseDefaultButton
	
	GroupsLeaderboardSummary0:linkToElementModel( Leaderboard.LeaderboardRows, nil, false, function ( model )
		GroupsLeaderboardSummary0:setModel( model, controller )
	end )
	Leaderboard.navigation = {
		left = {
			CreateLeaderboardButton,
			UseDefaultButton
		},
		up = UseDefaultButton
	}
	CreateLeaderboardButton.navigation = {
		right = Leaderboard,
		down = Leaderboard
	}
	UseDefaultButton.navigation = {
		up = CreateLeaderboardButton,
		right = Leaderboard,
		down = Leaderboard
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				CreateLeaderboardTitle:completeAnimation()
				self.CreateLeaderboardTitle:setAlpha( 0 )
				self.clipFinished( CreateLeaderboardTitle, {} )
				CreateLeaderboardDesc:completeAnimation()
				self.CreateLeaderboardDesc:setAlpha( 0 )
				self.clipFinished( CreateLeaderboardDesc, {} )
				NoLeaderboardDesc:completeAnimation()
				self.NoLeaderboardDesc:setAlpha( 0 )
				self.clipFinished( NoLeaderboardDesc, {} )
				LeaderboardInformation:completeAnimation()
				self.LeaderboardInformation:setAlpha( 1 )
				self.clipFinished( LeaderboardInformation, {} )
				Leaderboard:completeAnimation()
				self.Leaderboard:setAlpha( 1 )
				self.clipFinished( Leaderboard, {} )
				GroupsLeaderboardSummary0:completeAnimation()
				self.GroupsLeaderboardSummary0:setAlpha( 1 )
				self.clipFinished( GroupsLeaderboardSummary0, {} )
				CreateLeaderboardButton:completeAnimation()
				self.CreateLeaderboardButton:setAlpha( 0 )
				self.clipFinished( CreateLeaderboardButton, {} )
				UseDefaultButton:completeAnimation()
				self.UseDefaultButton:setAlpha( 0 )
				self.clipFinished( UseDefaultButton, {} )
			end
		},
		LeaderboardOptions = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				CreateLeaderboardTitle:completeAnimation()
				self.CreateLeaderboardTitle:setAlpha( 1 )
				self.clipFinished( CreateLeaderboardTitle, {} )
				CreateLeaderboardDesc:completeAnimation()
				self.CreateLeaderboardDesc:setAlpha( 1 )
				self.clipFinished( CreateLeaderboardDesc, {} )
				NoLeaderboardDesc:completeAnimation()
				self.NoLeaderboardDesc:setAlpha( 0 )
				self.clipFinished( NoLeaderboardDesc, {} )
				LeaderboardInformation:completeAnimation()
				self.LeaderboardInformation:setAlpha( 0.1 )
				self.clipFinished( LeaderboardInformation, {} )
				Leaderboard:completeAnimation()
				self.Leaderboard:setAlpha( 0.1 )
				self.clipFinished( Leaderboard, {} )
				GroupsLeaderboardSummary0:completeAnimation()
				self.GroupsLeaderboardSummary0:setAlpha( 0.1 )
				self.clipFinished( GroupsLeaderboardSummary0, {} )
				CreateLeaderboardButton:completeAnimation()
				self.CreateLeaderboardButton:setAlpha( 1 )
				self.clipFinished( CreateLeaderboardButton, {} )
				UseDefaultButton:completeAnimation()
				self.UseDefaultButton:setAlpha( 1 )
				self.clipFinished( UseDefaultButton, {} )
			end
		},
		NoLeaderboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				CreateLeaderboardTitle:completeAnimation()
				self.CreateLeaderboardTitle:setAlpha( 0 )
				self.clipFinished( CreateLeaderboardTitle, {} )
				CreateLeaderboardDesc:completeAnimation()
				self.CreateLeaderboardDesc:setAlpha( 0 )
				self.clipFinished( CreateLeaderboardDesc, {} )
				NoLeaderboardDesc:completeAnimation()
				self.NoLeaderboardDesc:setAlpha( 1 )
				self.clipFinished( NoLeaderboardDesc, {} )
				LeaderboardInformation:completeAnimation()
				self.LeaderboardInformation:setAlpha( 0 )
				self.clipFinished( LeaderboardInformation, {} )
				Leaderboard:completeAnimation()
				self.Leaderboard:setAlpha( 0 )
				self.clipFinished( Leaderboard, {} )
				GroupsLeaderboardSummary0:completeAnimation()
				self.GroupsLeaderboardSummary0:setAlpha( 0 )
				self.clipFinished( GroupsLeaderboardSummary0, {} )
				CreateLeaderboardButton:completeAnimation()
				self.CreateLeaderboardButton:setAlpha( 0 )
				self.clipFinished( CreateLeaderboardButton, {} )
				UseDefaultButton:completeAnimation()
				self.UseDefaultButton:setAlpha( 0 )
				self.clipFinished( UseDefaultButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "LeaderboardOptions",
			condition = function ( menu, element, event )
				local f29_local0 = DoesHaveAdminRightsForGroup( element, controller )
				if f29_local0 then
					f29_local0 = not IsGroupLeaderboardInitialized()
				end
				return f29_local0
			end
		},
		{
			stateName = "NoLeaderboard",
			condition = function ( menu, element, event )
				local f30_local0 = IsGroupLeaderboardInitialized()
				if f30_local0 then
					f30_local0 = not IsGroupLeaderboardAvailable()
				end
				return f30_local0
			end
		}
	} )
	self:linkToElementModel( "lbInitialized", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lbInitialized"
		} )
	end )
	self:linkToElementModel( "lbIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lbIndex"
		} )
	end )
	self:linkToElementModel( "lbSortColumn", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lbSortColumn"
		} )
	end )
	self:linkToElementModel( "lbTimeFrame", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lbTimeFrame"
		} )
	end )
	self:linkToElementModel( "lbHardcore", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lbHardcore"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Leaderboard.id = "Leaderboard"
	CreateLeaderboardButton.id = "CreateLeaderboardButton"
	UseDefaultButton.id = "UseDefaultButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Leaderboard:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeaderboardInformation:close()
		self.Leaderboard:close()
		self.GroupsLeaderboardSummary0:close()
		self.CreateLeaderboardButton:close()
		self.UseDefaultButton:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

