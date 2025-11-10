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
CoD.Leaderboard_MP.GetLeaderboardIndex = function ( f1_arg0 )
	for f1_local0 = 1, #CoD.Leaderboard_MP.Leaderboards, 1 do
		if CoD.Leaderboard_MP.Leaderboards[f1_local0][CoD.Leaderboard_MP.CoreName] == f1_arg0 then
			return f1_local0
		end
	end
	return 0
end

CoD.Leaderboard_MP.GetSortColumnIndex = function ( f2_arg0, f2_arg1 )
	local f2_local0 = 0
	local f2_local1 = CoD.Leaderboard_MP.Leaderboards[f2_arg0][CoD.Leaderboard_MP.SortColumn]
	for f2_local2 = 1, #f2_local1, 1 do
		if f2_local1[f2_local2] == f2_arg1 then
			return f2_local2
		end
	end
	return 0
end

CoD.Leaderboard_MP.GetTimeFrameIndex = function ( f3_arg0, f3_arg1 )
	local f3_local0 = 0
	local f3_local1 = CoD.Leaderboard_MP.Leaderboards[f3_arg0][CoD.Leaderboard_MP.TimeFrame]
	for f3_local2 = 1, #f3_local1, 1 do
		if f3_local1[f3_local2] == f3_arg1 then
			return f3_local2
		end
	end
	return 0
end

CoD.Leaderboard_MP.GetLeaderboardCoreNameData = function ( f4_arg0 )
	for f4_local0 = 1, #CoD.Leaderboard_MP.LeaderboardCoreNames, 1 do
		local f4_local3 = CoD.Leaderboard_MP.LeaderboardCoreNames[f4_local0]
		if f4_local3.name == f4_arg0 then
			return f4_local3
		end
	end
	return nil
end

CoD.Leaderboard_MP.GetLeaderboardSortColumnData = function ( f5_arg0 )
	for f5_local0 = 1, #CoD.Leaderboard_MP.LeaderboardSortColumns, 1 do
		local f5_local3 = CoD.Leaderboard_MP.LeaderboardSortColumns[f5_local0]
		if f5_local3.name == f5_arg0 then
			return f5_local3
		end
	end
	return nil
end

CoD.Leaderboard_MP.GetTimeFrameDataFromName = function ( f6_arg0 )
	for f6_local0 = 1, #CoD.Leaderboard_MP.LeaderboardTimeFrames, 1 do
		local f6_local3 = CoD.Leaderboard_MP.LeaderboardTimeFrames[f6_local0]
		if f6_local3.name == f6_arg0 then
			return f6_local3
		end
	end
	return nil
end

CoD.Leaderboard_MP.GetTimeFrameDataFromEnumValue = function ( f7_arg0 )
	for f7_local0 = 1, #CoD.Leaderboard_MP.LeaderboardTimeFrames, 1 do
		local f7_local3 = CoD.Leaderboard_MP.LeaderboardTimeFrames[f7_local0]
		if f7_local3.value == f7_arg0 then
			return f7_local3
		end
	end
	return -1
end

CoD.Leaderboard_MP.GetLeaderboardDefName = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0 = CoD.Leaderboard_MP.Leaderboards[f8_arg0]
	local f8_local1 = "LB_MP" .. "_" .. f8_local0[CoD.Leaderboard_MP.BaseDefName] .. "_" .. f8_local0[CoD.Leaderboard_MP.CoreName] .. "_" .. f8_local0[CoD.Leaderboard_MP.SortColumn][f8_arg1]
	if f8_arg2 then
		f8_local1 = f8_local1 .. "_HC"
	end
	return f8_local1
end

local f0_local0 = function ( f9_arg0, f9_arg1 )
	if DoesHaveAdminRightsForGroup( nil, f9_arg1 ) and not IsGroupLeaderboardInitialized() then
		f9_arg0.CreateLeaderboardButton.navigation = {
			down = f9_arg0.UseDefaultButton
		}
		f9_arg0.UseDefaultButton.navigation = {
			up = f9_arg0.CreateLeaderboardButton
		}
		f9_arg0.Leaderboard.navigation = {}
	elseif not IsGroupLeaderboardAvailable() then
		f9_arg0.CreateLeaderboardButton.navigation = {}
		f9_arg0.UseDefaultButton.navigation = {}
		f9_arg0.Leaderboard.navigation = {}
	else
		f9_arg0.CreateLeaderboardButton.navigation = {}
		f9_arg0.UseDefaultButton.navigation = {}
		f9_arg0.Leaderboard.navigation = {}
	end
	f9_arg0:processEvent( {
		name = "gain_focus",
		controller = f9_arg1
	} )
end

local f0_local1 = function ( f10_arg0, f10_arg1 )
	if f10_arg1.error == true then
		return 
	else
		local f10_local0 = f10_arg1.controller
		DataSources.LeaderboardHeader.getModel( f10_local0 )
		f10_arg0:UpdateNavigation( f10_local0 )
	end
end

local PostLoadFunc = function ( f11_arg0, f11_arg1 )
	f11_arg0:registerEventHandler( "leaderboardlist_update", f0_local1 )
	f11_arg0:registerEventHandler( "gain_focus", function ( element, event )
		if DoesHaveAdminRightsForGroup( nil, event.controller ) and not IsGroupLeaderboardInitialized() then
			if element.CreateLeaderboardButton:processEvent( event ) then
				return true
			end
		elseif element.Leaderboard:processEvent( event ) then
			return true
		end
		return LUI.UIElement.gainFocus( element, event )
	end )
	f11_arg0.UpdateNavigation = f0_local0
	f11_arg0:UpdateNavigation( f11_arg1 )
	f11_arg0:setModel( CoD.perController[f11_arg1].selectedGroup )
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
		local baseLeaderboard = Engine.GetModelValue( model )
		if baseLeaderboard then
			LeaderboardInformation.BaseLeaderboard:setText( Engine.Localize( baseLeaderboard ) )
		end
	end )
	LeaderboardInformation:subscribeToGlobalModel( controller, "LeaderboardHeader", "timeFrame", function ( model )
		local timeFrame = Engine.GetModelValue( model )
		if timeFrame then
			LeaderboardInformation.TimeFrame:setText( Engine.Localize( timeFrame ) )
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
		local f16_local0 = nil
		if element.gainFocus then
			f16_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f16_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f16_local0
	end )
	CreateLeaderboardButton:registerEventHandler( "lose_focus", function ( element, event )
		local f17_local0 = nil
		if element.loseFocus then
			f17_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f17_local0 = element.super:loseFocus( event )
		end
		return f17_local0
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
		local f21_local0 = nil
		if element.gainFocus then
			f21_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f21_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f21_local0
	end )
	UseDefaultButton:registerEventHandler( "lose_focus", function ( element, event )
		local f22_local0 = nil
		if element.loseFocus then
			f22_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f22_local0 = element.super:loseFocus( event )
		end
		return f22_local0
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
				return DoesHaveAdminRightsForGroup( element, controller ) and not IsGroupLeaderboardInitialized()
			end
		},
		{
			stateName = "NoLeaderboard",
			condition = function ( menu, element, event )
				return IsGroupLeaderboardInitialized() and not IsGroupLeaderboardAvailable()
			end
		}
	} )
	self:linkToElementModel( self, "lbInitialized", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lbInitialized"
		} )
	end )
	self:linkToElementModel( self, "lbIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lbIndex"
		} )
	end )
	self:linkToElementModel( self, "lbSortColumn", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lbSortColumn"
		} )
	end )
	self:linkToElementModel( self, "lbTimeFrame", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lbTimeFrame"
		} )
	end )
	self:linkToElementModel( self, "lbHardcore", true, function ( model )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeaderboardInformation:close()
		element.Leaderboard:close()
		element.GroupsLeaderboardSummary0:close()
		element.CreateLeaderboardButton:close()
		element.UseDefaultButton:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

