-- 9b21013c503f258511ea39b399771e32
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.Groups.GroupLeaderboardOptions" )
require( "ui.uieditor.widgets.FileshareNoContentGraphic" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_wHeader" )
require( "ui.uieditor.widgets.Leaderboard.Leaderboard" )
require( "ui.uieditor.widgets.Groups.GroupLeaderboardTitle" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Leaderboard.Leaderboard_PlayerProfileInfoWidget" )
require( "ui.uieditor.widgets.Leaderboard.Leaderboard_RankAndStatsWidget" )

CoD.Leaderboard_MP = {}
CoD.Leaderboard_MP.BaseDefName = 1
CoD.Leaderboard_MP.CoreName = 2
CoD.Leaderboard_MP.SortColumn = 3
CoD.Leaderboard_MP.TimeFrame = 4
CoD.Leaderboard_MP.Hardcore = 5
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

CoD.Leaderboard_MP.GetTimeFrameIndex = function ( f2_arg0, f2_arg1 )
	local f2_local0 = 0
	local f2_local1 = CoD.Leaderboard_MP.Leaderboards[f2_arg0][CoD.Leaderboard_MP.TimeFrame]
	for f2_local2 = 1, #f2_local1, 1 do
		if f2_local1[f2_local2] == f2_arg1 then
			return f2_local2
		end
	end
	return 0
end

CoD.Leaderboard_MP.GetTimeFrameDataFromEnumValue = function ( f3_arg0 )
	for f3_local0 = 1, #CoD.Leaderboard_MP.LeaderboardTimeFrames, 1 do
		local f3_local3 = CoD.Leaderboard_MP.LeaderboardTimeFrames[f3_local0]
		if f3_local3.value == f3_arg0 then
			return f3_local3
		end
	end
	return -1
end

CoD.Leaderboard_MP.GetLeaderboardDefName = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = CoD.Leaderboard_MP.Leaderboards[f4_arg0]
	local f4_local1 = "LB_MP" .. "_" .. f4_local0[CoD.Leaderboard_MP.BaseDefName] .. "_" .. f4_local0[CoD.Leaderboard_MP.CoreName] .. "_" .. f4_local0[CoD.Leaderboard_MP.SortColumn][f4_arg1]
	if f4_arg2 then
		f4_local1 = f4_local1 .. "_HC"
	end
	return f4_local1
end

local f0_local0 = function ( f5_arg0, f5_arg1 )
	if HasAdminPrivilege( f5_arg1, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_LEADERBOARD ) and not IsGroupLeaderboardAvailable() then
		f5_arg0.CreateLeaderboardButton.navigation = {
			down = f5_arg0.UseDefaultButton
		}
		f5_arg0.UseDefaultButton.navigation = {
			up = f5_arg0.CreateLeaderboardButton
		}
		f5_arg0.Leaderboard.navigation = {}
	elseif not IsGroupLeaderboardAvailable() then
		f5_arg0.CreateLeaderboardButton.navigation = {}
		f5_arg0.UseDefaultButton.navigation = {}
		f5_arg0.Leaderboard.navigation = {}
	else
		f5_arg0.CreateLeaderboardButton.navigation = {}
		f5_arg0.UseDefaultButton.navigation = {}
		f5_arg0.Leaderboard.navigation = {}
	end
	f5_arg0:processEvent( {
		name = "gain_focus",
		controller = f5_arg1
	} )
end

local f0_local1 = function ( f6_arg0, f6_arg1 )
	if f6_arg1.error == true then
		return 
	else
		local f6_local0 = f6_arg1.controller
		DataSources.LeaderboardHeader.getModel( f6_local0 )
		f6_arg0:UpdateNavigation( f6_local0 )
	end
end

local PostLoadFunc = function ( f7_arg0, f7_arg1 )
	f7_arg0:registerEventHandler( "leaderboardlist_update", f0_local1 )
	f7_arg0:registerEventHandler( "gain_focus", function ( element, event )
		if HasAdminPrivilege( event.controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_LEADERBOARD ) and not IsGroupLeaderboardAvailable() then
			element.UseDefaultButton:processEvent( {
				name = "lose_focus",
				controller = f7_arg1
			} )
			if element.CreateLeaderboardButton:processEvent( event ) then
				return true
			end
		elseif element.Leaderboard:processEvent( event ) then
			return true
		end
		return LUI.UIElement.gainFocus( element, event )
	end )
	f7_arg0.UpdateNavigation = f0_local0
	f7_arg0:UpdateNavigation( f7_arg1 )
	f7_arg0:setModel( CoD.perController[f7_arg1].selectedGroup )
	f7_arg0:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( f7_arg1 ), "groups.updateLeaderboardTabNav" ), function ( model )
		f7_arg0:UpdateNavigation( f7_arg1 )
	end )
end

CoD.LeaderboardTab = InheritFrom( LUI.UIElement )
CoD.LeaderboardTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LeaderboardTab )
	self.id = "LeaderboardTab"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint00 = LUI.UIImage.new()
	BlackTint00:setLeftRight( true, false, 0, 402 )
	BlackTint00:setTopBottom( true, false, -29, 581 )
	BlackTint00:setRGB( 0, 0, 0 )
	BlackTint00:setAlpha( 0.3 )
	self:addElement( BlackTint00 )
	self.BlackTint00 = BlackTint00
	
	local CreateLeaderboardTitle = LUI.UIText.new()
	CreateLeaderboardTitle:setLeftRight( true, false, 20.5, 402 )
	CreateLeaderboardTitle:setTopBottom( true, false, 2, 32 )
	CreateLeaderboardTitle:setRGB( 1, 0.41, 0 )
	CreateLeaderboardTitle:setText( Engine.Localize( "GROUPS_CREATE_YOUR_LEADERBOARD" ) )
	CreateLeaderboardTitle:setTTF( "fonts/default.ttf" )
	CreateLeaderboardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CreateLeaderboardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CreateLeaderboardTitle )
	self.CreateLeaderboardTitle = CreateLeaderboardTitle
	
	local CreateLeaderboardDesc = LUI.UIText.new()
	CreateLeaderboardDesc:setLeftRight( true, false, 20.5, 402 )
	CreateLeaderboardDesc:setTopBottom( true, false, 34, 53 )
	CreateLeaderboardDesc:setText( Engine.Localize( "GROUPS_CREATE_YOUR_LEADERBOARD_DESC" ) )
	CreateLeaderboardDesc:setTTF( "fonts/default.ttf" )
	CreateLeaderboardDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CreateLeaderboardDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CreateLeaderboardDesc )
	self.CreateLeaderboardDesc = CreateLeaderboardDesc
	
	local NoLeaderboardDesc = LUI.UIText.new()
	NoLeaderboardDesc:setLeftRight( true, false, 21, 1139.5 )
	NoLeaderboardDesc:setTopBottom( true, false, 224, 244 )
	NoLeaderboardDesc:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	NoLeaderboardDesc:setAlpha( 0 )
	NoLeaderboardDesc:setText( Engine.Localize( "GROUPS_LEADERBOARD_UNAVAILABLE" ) )
	NoLeaderboardDesc:setTTF( "fonts/escom.ttf" )
	NoLeaderboardDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	NoLeaderboardDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NoLeaderboardDesc )
	self.NoLeaderboardDesc = NoLeaderboardDesc
	
	local FileshareNoContentGraphic = CoD.FileshareNoContentGraphic.new( menu, controller )
	FileshareNoContentGraphic:setLeftRight( true, false, 21, 1144.5 )
	FileshareNoContentGraphic:setTopBottom( true, false, 16.5, 496 )
	FileshareNoContentGraphic:setAlpha( 0 )
	self:addElement( FileshareNoContentGraphic )
	self.FileshareNoContentGraphic = FileshareNoContentGraphic
	
	local CreateLeaderboardButton = CoD.List1ButtonLarge_Left_wHeader.new( menu, controller )
	CreateLeaderboardButton:setLeftRight( true, false, 18.5, 384 )
	CreateLeaderboardButton:setTopBottom( true, false, 111.5, 168.5 )
	CreateLeaderboardButton.commonButtonLabel.itemName:setText( Engine.Localize( "MENU_EMBLEM_CREATE_NEW" ) )
	CreateLeaderboardButton:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	CreateLeaderboardButton:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	menu:AddButtonCallbackFunction( CreateLeaderboardButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if HasAdminPrivilege( f13_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_LEADERBOARD ) then
			OpenLeaderboardMaker( self, f13_arg0, f13_arg2, "ChooseBaseLeaderboard" )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if HasAdminPrivilege( f14_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_LEADERBOARD ) then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
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
	UseDefaultButton:setLeftRight( true, false, 18.5, 384 )
	UseDefaultButton:setTopBottom( true, false, 178.5, 235.5 )
	UseDefaultButton.commonButtonLabel.itemName:setText( Engine.Localize( "GROUPS_USE_DEFAULT_CAREER" ) )
	UseDefaultButton:registerEventHandler( "gain_focus", function ( element, event )
		local f16_local0 = nil
		if element.gainFocus then
			f16_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f16_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f16_local0
	end )
	UseDefaultButton:registerEventHandler( "lose_focus", function ( element, event )
		local f17_local0 = nil
		if element.loseFocus then
			f17_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f17_local0 = element.super:loseFocus( event )
		end
		return f17_local0
	end )
	menu:AddButtonCallbackFunction( UseDefaultButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		SetDefaultCareerLeaderboard( self, f18_arg0, f18_arg2 )
		return true
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( UseDefaultButton )
	self.UseDefaultButton = UseDefaultButton
	
	local Leaderboard = CoD.Leaderboard.new( menu, controller )
	Leaderboard:setLeftRight( true, false, 20.5, 800.5 )
	Leaderboard:setTopBottom( true, false, 15.5, 520 )
	Leaderboard:setAlpha( 0 )
	Leaderboard.LeaderboardRows:setVerticalCount( 16 )
	Leaderboard.LeaderboardRows:setDataSource( "LeaderboardRows" )
	Leaderboard.LeaderboardEmptyText:setText( Engine.Localize( "MENU_LB_EMPTY" ) )
	Leaderboard:subscribeToGlobalModel( controller, "LeaderboardHeader", nil, function ( model )
		Leaderboard.LeaderboardHeader:setModel( model, controller )
	end )
	self:addElement( Leaderboard )
	self.Leaderboard = Leaderboard
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( true, false, -156.5, 1349.5 )
	Backing:setTopBottom( true, false, -35, 8 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local GroupLeaderboardTitle = CoD.GroupLeaderboardTitle.new( menu, controller )
	GroupLeaderboardTitle:setLeftRight( true, false, 28.5, 1139.5 )
	GroupLeaderboardTitle:setTopBottom( true, false, -23, 12 )
	GroupLeaderboardTitle:setAlpha( 0 )
	self:addElement( GroupLeaderboardTitle )
	self.GroupLeaderboardTitle = GroupLeaderboardTitle
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( false, false, 236.5, 561.5 )
	StartMenuframenoBG0:setTopBottom( false, false, -246.5, 236 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local featlineleft0 = LUI.UIImage.new()
	featlineleft0:setLeftRight( true, false, 979, 983 )
	featlineleft0:setTopBottom( true, false, 132, 465 )
	featlineleft0:setAlpha( 0 )
	featlineleft0:setZRot( -90 )
	featlineleft0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0 )
	self.featlineleft0 = featlineleft0
	
	local featlineleft00 = LUI.UIImage.new()
	featlineleft00:setLeftRight( true, false, 979, 983 )
	featlineleft00:setTopBottom( true, false, 234, 567 )
	featlineleft00:setAlpha( 0 )
	featlineleft00:setZRot( -90 )
	featlineleft00:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft00 )
	self.featlineleft00 = featlineleft00
	
	local LeaderboardPlayerProfileInfoWidget = CoD.Leaderboard_PlayerProfileInfoWidget.new( menu, controller )
	LeaderboardPlayerProfileInfoWidget:setLeftRight( true, false, 819.5, 1139.5 )
	LeaderboardPlayerProfileInfoWidget:setTopBottom( true, false, 15.5, 297.5 )
	LeaderboardPlayerProfileInfoWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f21_local0
				if not IsLeaderboardUpdating() and not IsLeaderboardEmpty() then
					f21_local0 = IsGroupLeaderboardAvailable()
				else
					f21_local0 = false
				end
				return f21_local0
			end
		},
		{
			stateName = "PCacheBuffer",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LeaderboardPlayerProfileInfoWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.isUpdating" ), function ( model )
		menu:updateElementState( LeaderboardPlayerProfileInfoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.isUpdating"
		} )
	end )
	LeaderboardPlayerProfileInfoWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.totalResults" ), function ( model )
		menu:updateElementState( LeaderboardPlayerProfileInfoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.totalResults"
		} )
	end )
	LeaderboardPlayerProfileInfoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbDef" ), function ( model )
		menu:updateElementState( LeaderboardPlayerProfileInfoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbDef"
		} )
	end )
	LeaderboardPlayerProfileInfoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbTimeFrame" ), function ( model )
		menu:updateElementState( LeaderboardPlayerProfileInfoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbTimeFrame"
		} )
	end )
	LeaderboardPlayerProfileInfoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbHardcore" ), function ( model )
		menu:updateElementState( LeaderboardPlayerProfileInfoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbHardcore"
		} )
	end )
	LeaderboardPlayerProfileInfoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbInitialized" ), function ( model )
		menu:updateElementState( LeaderboardPlayerProfileInfoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbInitialized"
		} )
	end )
	self:addElement( LeaderboardPlayerProfileInfoWidget )
	self.LeaderboardPlayerProfileInfoWidget = LeaderboardPlayerProfileInfoWidget
	
	local LeaderboardRankAndStatsWidget = CoD.Leaderboard_RankAndStatsWidget.new( menu, controller )
	LeaderboardRankAndStatsWidget:setLeftRight( true, false, 819.5, 1139.5 )
	LeaderboardRankAndStatsWidget:setTopBottom( true, false, 296, 496 )
	LeaderboardRankAndStatsWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f29_local0
				if not IsLeaderboardUpdating() and not IsLeaderboardEmpty() then
					f29_local0 = IsGroupLeaderboardAvailable()
				else
					f29_local0 = false
				end
				return f29_local0
			end
		},
		{
			stateName = "Freerun",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "DOA",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LeaderboardRankAndStatsWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.isUpdating" ), function ( model )
		menu:updateElementState( LeaderboardRankAndStatsWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.isUpdating"
		} )
	end )
	LeaderboardRankAndStatsWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.totalResults" ), function ( model )
		menu:updateElementState( LeaderboardRankAndStatsWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.totalResults"
		} )
	end )
	LeaderboardRankAndStatsWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbDef" ), function ( model )
		menu:updateElementState( LeaderboardRankAndStatsWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbDef"
		} )
	end )
	LeaderboardRankAndStatsWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbTimeFrame" ), function ( model )
		menu:updateElementState( LeaderboardRankAndStatsWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbTimeFrame"
		} )
	end )
	LeaderboardRankAndStatsWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbHardcore" ), function ( model )
		menu:updateElementState( LeaderboardRankAndStatsWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbHardcore"
		} )
	end )
	LeaderboardRankAndStatsWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbInitialized" ), function ( model )
		menu:updateElementState( LeaderboardRankAndStatsWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbInitialized"
		} )
	end )
	self:addElement( LeaderboardRankAndStatsWidget )
	self.LeaderboardRankAndStatsWidget = LeaderboardRankAndStatsWidget
	
	LeaderboardPlayerProfileInfoWidget:linkToElementModel( Leaderboard.LeaderboardRows, "xuid", true, function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			LeaderboardPlayerProfileInfoWidget.emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	LeaderboardPlayerProfileInfoWidget:linkToElementModel( Leaderboard.LeaderboardRows, nil, false, function ( model )
		LeaderboardPlayerProfileInfoWidget.GamerCard:setModel( model, controller )
	end )
	LeaderboardPlayerProfileInfoWidget:linkToElementModel( Leaderboard.LeaderboardRows, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			LeaderboardPlayerProfileInfoWidget.GamerTag.Label0:setText( Engine.Localize( name ) )
		end
	end )
	LeaderboardRankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "rankIcon", true, function ( model )
		local rankIcon = Engine.GetModelValue( model )
		if rankIcon then
			LeaderboardRankAndStatsWidget.rankIcon.imgSolid:setImage( RegisterImage( GetRankIconLarge( rankIcon ) ) )
		end
	end )
	LeaderboardRankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "rankIcon", true, function ( model )
		local rankIcon = Engine.GetModelValue( model )
		if rankIcon then
			LeaderboardRankAndStatsWidget.rankIcon.imgAdd:setImage( RegisterImage( GetRankIconLarge( rankIcon ) ) )
		end
	end )
	LeaderboardRankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "plevel", true, function ( model )
		local plevel = Engine.GetModelValue( model )
		if plevel then
			LeaderboardRankAndStatsWidget.rankText:setRGB( SetToParagonColorIfPrestigeMasterForLeaderboard( 255, 255, 255, plevel ) )
		end
	end )
	LeaderboardRankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			LeaderboardRankAndStatsWidget.rankText.FELabelSubHeadingD0.Label0:setText( Engine.Localize( PrependLocalizedStringWithSeparator( "MENU_LEVEL_CAPS", " ", rank ) ) )
		end
	end )
	LeaderboardRankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "rankString", true, function ( model )
		local rankString = Engine.GetModelValue( model )
		if rankString then
			LeaderboardRankAndStatsWidget.ListHeader0.btnDisplayTextStroke:setText( Engine.Localize( rankString ) )
		end
	end )
	LeaderboardRankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat0color", true, function ( model )
		local stat0color = Engine.GetModelValue( model )
		if stat0color then
			LeaderboardRankAndStatsWidget.StatWidget1.StatText:setRGB( stat0color )
		end
	end )
	LeaderboardRankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat0", true, function ( model )
		local stat0 = Engine.GetModelValue( model )
		if stat0 then
			LeaderboardRankAndStatsWidget.StatWidget1.StatText:setText( Engine.Localize( stat0 ) )
		end
	end )
	LeaderboardRankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat0label", true, function ( model )
		local stat0label = Engine.GetModelValue( model )
		if stat0label then
			LeaderboardRankAndStatsWidget.StatWidget1.btnDisplayTextStroke:setText( Engine.Localize( stat0label ) )
		end
	end )
	LeaderboardRankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat1color", true, function ( model )
		local stat1color = Engine.GetModelValue( model )
		if stat1color then
			LeaderboardRankAndStatsWidget.StatWidget2.StatText:setRGB( stat1color )
		end
	end )
	LeaderboardRankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat1", true, function ( model )
		local stat1 = Engine.GetModelValue( model )
		if stat1 then
			LeaderboardRankAndStatsWidget.StatWidget2.StatText:setText( Engine.Localize( stat1 ) )
		end
	end )
	LeaderboardRankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat1label", true, function ( model )
		local stat1label = Engine.GetModelValue( model )
		if stat1label then
			LeaderboardRankAndStatsWidget.StatWidget2.btnDisplayTextStroke:setText( Engine.Localize( stat1label ) )
		end
	end )
	LeaderboardRankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat2color", true, function ( model )
		local stat2color = Engine.GetModelValue( model )
		if stat2color then
			LeaderboardRankAndStatsWidget.StatWidget3.StatText:setRGB( stat2color )
		end
	end )
	LeaderboardRankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat2", true, function ( model )
		local stat2 = Engine.GetModelValue( model )
		if stat2 then
			LeaderboardRankAndStatsWidget.StatWidget3.StatText:setText( Engine.Localize( stat2 ) )
		end
	end )
	LeaderboardRankAndStatsWidget:linkToElementModel( Leaderboard.LeaderboardRows, "stat2label", true, function ( model )
		local stat2label = Engine.GetModelValue( model )
		if stat2label then
			LeaderboardRankAndStatsWidget.StatWidget3.btnDisplayTextStroke:setText( Engine.Localize( stat2label ) )
		end
	end )
	CreateLeaderboardButton.navigation = {
		right = Leaderboard,
		down = Leaderboard
	}
	UseDefaultButton.navigation = {
		up = CreateLeaderboardButton,
		right = Leaderboard,
		down = Leaderboard
	}
	Leaderboard.navigation = {
		left = {
			CreateLeaderboardButton,
			UseDefaultButton
		},
		up = UseDefaultButton
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				BlackTint00:completeAnimation()
				self.BlackTint00:setAlpha( 0 )
				self.clipFinished( BlackTint00, {} )
				CreateLeaderboardTitle:completeAnimation()
				self.CreateLeaderboardTitle:setAlpha( 0 )
				self.clipFinished( CreateLeaderboardTitle, {} )
				CreateLeaderboardDesc:completeAnimation()
				self.CreateLeaderboardDesc:setAlpha( 0 )
				self.clipFinished( CreateLeaderboardDesc, {} )
				NoLeaderboardDesc:completeAnimation()
				self.NoLeaderboardDesc:setAlpha( 0 )
				self.clipFinished( NoLeaderboardDesc, {} )
				FileshareNoContentGraphic:completeAnimation()
				self.FileshareNoContentGraphic:setAlpha( 0 )
				self.clipFinished( FileshareNoContentGraphic, {} )
				CreateLeaderboardButton:completeAnimation()
				self.CreateLeaderboardButton:setAlpha( 0 )
				self.clipFinished( CreateLeaderboardButton, {} )
				UseDefaultButton:completeAnimation()
				self.UseDefaultButton:setAlpha( 0 )
				self.clipFinished( UseDefaultButton, {} )
				Leaderboard:completeAnimation()
				self.Leaderboard:setAlpha( 1 )
				self.clipFinished( Leaderboard, {} )
				Backing:completeAnimation()
				self.Backing:setAlpha( 0.5 )
				self.clipFinished( Backing, {} )
				GroupLeaderboardTitle:completeAnimation()
				self.GroupLeaderboardTitle:setAlpha( 1 )
				self.clipFinished( GroupLeaderboardTitle, {} )
				featlineleft0:completeAnimation()
				self.featlineleft0:setAlpha( 0 )
				self.clipFinished( featlineleft0, {} )
				featlineleft00:completeAnimation()
				self.featlineleft00:setAlpha( 0 )
				self.clipFinished( featlineleft00, {} )
			end
		},
		LeaderboardOptions = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				BlackTint00:completeAnimation()
				self.BlackTint00:setAlpha( 0.3 )
				self.clipFinished( BlackTint00, {} )
				CreateLeaderboardTitle:completeAnimation()
				self.CreateLeaderboardTitle:setLeftRight( true, false, 20.5, 303.04 )
				self.CreateLeaderboardTitle:setTopBottom( true, false, 2, 32 )
				self.CreateLeaderboardTitle:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.CreateLeaderboardTitle:setAlpha( 1 )
				self.clipFinished( CreateLeaderboardTitle, {} )
				CreateLeaderboardDesc:completeAnimation()
				self.CreateLeaderboardDesc:setLeftRight( true, false, 20.5, 384 )
				self.CreateLeaderboardDesc:setTopBottom( true, false, 34, 53 )
				self.CreateLeaderboardDesc:setAlpha( 1 )
				self.clipFinished( CreateLeaderboardDesc, {} )
				NoLeaderboardDesc:completeAnimation()
				self.NoLeaderboardDesc:setAlpha( 0 )
				self.clipFinished( NoLeaderboardDesc, {} )
				FileshareNoContentGraphic:completeAnimation()
				self.FileshareNoContentGraphic:setAlpha( 0 )
				self.clipFinished( FileshareNoContentGraphic, {} )
				CreateLeaderboardButton:completeAnimation()
				self.CreateLeaderboardButton:setAlpha( 1 )
				self.clipFinished( CreateLeaderboardButton, {} )
				UseDefaultButton:completeAnimation()
				self.UseDefaultButton:setAlpha( 1 )
				self.clipFinished( UseDefaultButton, {} )
				Leaderboard:completeAnimation()
				self.Leaderboard:setAlpha( 0 )
				self.clipFinished( Leaderboard, {} )
				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )
				GroupLeaderboardTitle:completeAnimation()
				self.GroupLeaderboardTitle:setAlpha( 0 )
				self.clipFinished( GroupLeaderboardTitle, {} )
				featlineleft0:completeAnimation()
				self.featlineleft0:setAlpha( 0 )
				self.clipFinished( featlineleft0, {} )
				featlineleft00:completeAnimation()
				self.featlineleft00:setAlpha( 0 )
				self.clipFinished( featlineleft00, {} )
			end
		},
		NoLeaderboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				BlackTint00:completeAnimation()
				self.BlackTint00:setAlpha( 0 )
				self.clipFinished( BlackTint00, {} )
				CreateLeaderboardTitle:completeAnimation()
				self.CreateLeaderboardTitle:setAlpha( 0 )
				self.clipFinished( CreateLeaderboardTitle, {} )
				CreateLeaderboardDesc:completeAnimation()
				self.CreateLeaderboardDesc:setAlpha( 0 )
				self.clipFinished( CreateLeaderboardDesc, {} )
				NoLeaderboardDesc:completeAnimation()
				self.NoLeaderboardDesc:setAlpha( 1 )
				self.clipFinished( NoLeaderboardDesc, {} )
				FileshareNoContentGraphic:completeAnimation()
				self.FileshareNoContentGraphic:setLeftRight( true, false, 21, 1144.5 )
				self.FileshareNoContentGraphic:setTopBottom( true, false, 3.25, 482.75 )
				self.FileshareNoContentGraphic:setAlpha( 1 )
				self.clipFinished( FileshareNoContentGraphic, {} )
				CreateLeaderboardButton:completeAnimation()
				self.CreateLeaderboardButton:setAlpha( 0 )
				self.clipFinished( CreateLeaderboardButton, {} )
				UseDefaultButton:completeAnimation()
				self.UseDefaultButton:setAlpha( 0 )
				self.clipFinished( UseDefaultButton, {} )
				Leaderboard:completeAnimation()
				self.Leaderboard:setAlpha( 0 )
				self.clipFinished( Leaderboard, {} )
				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )
				GroupLeaderboardTitle:completeAnimation()
				self.GroupLeaderboardTitle:setAlpha( 0 )
				self.clipFinished( GroupLeaderboardTitle, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
				featlineleft0:completeAnimation()
				self.featlineleft0:setAlpha( 0 )
				self.clipFinished( featlineleft0, {} )
				featlineleft00:completeAnimation()
				self.featlineleft00:setAlpha( 0 )
				self.clipFinished( featlineleft00, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "LeaderboardOptions",
			condition = function ( menu, element, event )
				return HasAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_LEADERBOARD ) and not IsGroupLeaderboardAvailable()
			end
		},
		{
			stateName = "NoLeaderboard",
			condition = function ( menu, element, event )
				return not IsGroupLeaderboardAvailable()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbDef" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbDef"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbTimeFrame" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbTimeFrame"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbHardcore" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbHardcore"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbInitialized" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbInitialized"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbDef" ), function ( model )
		local f64_local0 = self
		local f64_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbDef"
		}
		CoD.Menu.UpdateButtonShownState( f64_local0, menu, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbTimeFrame" ), function ( model )
		local f65_local0 = self
		local f65_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbTimeFrame"
		}
		CoD.Menu.UpdateButtonShownState( f65_local0, menu, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbHardcore" ), function ( model )
		local f66_local0 = self
		local f66_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbHardcore"
		}
		CoD.Menu.UpdateButtonShownState( f66_local0, menu, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbInitialized" ), function ( model )
		local f67_local0 = self
		local f67_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbInitialized"
		}
		CoD.Menu.UpdateButtonShownState( f67_local0, menu, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( f68_arg0, f68_arg1, f68_arg2, f68_arg3 )
		if HasAdminPrivilege( f68_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_LEADERBOARD ) and IsGroupLeaderboardAvailable() then
			OpenPopup( self, "GroupLeaderboardOptions", f68_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f69_arg0, f69_arg1, f69_arg2 )
		if HasAdminPrivilege( f69_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_LEADERBOARD ) and IsGroupLeaderboardAvailable() then
			CoD.Menu.SetButtonLabel( f69_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS_CAPS" )
			return true
		else
			return false
		end
	end, false )
	CreateLeaderboardButton.id = "CreateLeaderboardButton"
	UseDefaultButton.id = "UseDefaultButton"
	Leaderboard.id = "Leaderboard"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.CreateLeaderboardButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareNoContentGraphic:close()
		element.CreateLeaderboardButton:close()
		element.UseDefaultButton:close()
		element.Leaderboard:close()
		element.GroupLeaderboardTitle:close()
		element.StartMenuframenoBG0:close()
		element.LeaderboardPlayerProfileInfoWidget:close()
		element.LeaderboardRankAndStatsWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

