require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Button_CP" )
require( "ui.uieditor.menus.Barracks.CombatRecordCP.CombatRecordCP" )
require( "ui.uieditor.menus.Social.Social_InspectPlayerPopupLoading" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Button_MP" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordMP" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Button_ZM" )
require( "ui.uieditor.menus.Barracks.CombatRecordZM.CombatRecordZM" )

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
	local f1_local0 = Engine.GetModel( Engine.GetGlobalModel(), "combatRecordMode" )
	if f1_local0 then
		CoD.perController[controller].previousCombatRecordMode = Engine.GetModelValue( f1_local0 )
	end
end

LUI.createMenu.ViewRemoteCombatRecord = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ViewRemoteCombatRecord" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ViewRemoteCombatRecord.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 0, 0 )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_VIEW_COMBAT_RECORD" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_VIEW_COMBAT_RECORD" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local StartMenuBarracksButtonCP = CoD.StartMenu_Barracks_Button_CP.new( self, controller )
	StartMenuBarracksButtonCP:setLeftRight( false, false, -558, -192 )
	StartMenuBarracksButtonCP:setTopBottom( false, false, -218.5, 218.5 )
	StartMenuBarracksButtonCP.SessionName:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	StartMenuBarracksButtonCP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_BARRACKS_DESC" ) )
	StartMenuBarracksButtonCP.TotalKills.Title:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.kills.statvalue", "888" ) ) )
	StartMenuBarracksButtonCP.unlockRequirements:setText( LocalizeIntoString( "CPUI_REQUIRES_LEVEL", "2" ) )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		StartMenuBarracksButtonCP:setModel( model, controller )
	end )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "SocialPlayerInfo", "cpRankIcon", function ( model )
		local cpRankIcon = Engine.GetModelValue( model )
		if cpRankIcon then
			StartMenuBarracksButtonCP.Emblem:setImage( RegisterImage( GetRankIconLarge( cpRankIcon ) ) )
		end
	end )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "SocialPlayerInfo", "cpRank", function ( model )
		local cpRank = Engine.GetModelValue( model )
		if cpRank then
			StartMenuBarracksButtonCP.RankName:setText( Engine.Localize( RankToTitleString( "cp", cpRank ) ) )
		end
	end )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "SocialPlayerInfo", "cpRank", function ( model )
		local cpRank = Engine.GetModelValue( model )
		if cpRank then
			StartMenuBarracksButtonCP.Rank:setText( RankToLevelString( "cp", cpRank ) )
		end
	end )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "CombatRecordCPPercentComplete", "percent", function ( model )
		local percent = Engine.GetModelValue( model )
		if percent then
			StartMenuBarracksButtonCP.PercentComplete.Title:setText( Engine.Localize( percent ) )
		end
	end )
	StartMenuBarracksButtonCP:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	StartMenuBarracksButtonCP:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	self:AddButtonCallbackFunction( StartMenuBarracksButtonCP, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disable" ) then
			SetGlobalModelValue( "combatRecordMode", "cp" )
			CombatRecordSetMenuForPostStatsLoad( self, "CombatRecordCP" )
			CombatRecordSetXUIDFromSelectedFriend( controller )
			OpenPopup( self, "Social_InspectPlayerPopupLoading", controller, "", "" )
			CombatRecordReadOtherPlayerStats( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Disable" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	StartMenuBarracksButtonCP:mergeStateConditions( {
		{
			stateName = "Disable",
			condition = function ( menu, element, event )
				return IsCPCombatRecordLockedForSocialPlayerInfo( controller, element )
			end
		},
		{
			stateName = "NoStats",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( StartMenuBarracksButtonCP )
	self.StartMenuBarracksButtonCP = StartMenuBarracksButtonCP
	
	local StartMenuBarracksButtonMP = CoD.StartMenu_Barracks_Button_MP.new( self, controller )
	StartMenuBarracksButtonMP:setLeftRight( false, false, -183, 183 )
	StartMenuBarracksButtonMP:setTopBottom( false, false, -218.5, 218.44 )
	StartMenuBarracksButtonMP.SessionName:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	StartMenuBarracksButtonMP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_BARRACKS_DESC" ) )
	StartMenuBarracksButtonMP.TotalKills.Title:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.kills.statvalue", "888" ) ) )
	StartMenuBarracksButtonMP.KD.Title:setText( Engine.Localize( CombatRecordGetTwoStatRatio( controller, "playerstatslist.kills.statvalue", "playerstatslist.deaths.statvalue", "0.93" ) ) )
	StartMenuBarracksButtonMP.SPM.Title:setText( Engine.Localize( CombatRecordGetSPM( controller, "playerstatslist.score.statvalue", "playerstatslist.time_played_total.statvalue", "425" ) ) )
	StartMenuBarracksButtonMP.WL.Title:setText( Engine.Localize( CombatRecordGetTwoStatRatio( controller, "playerstatslist.wins.statvalue", "playerstatslist.losses.statvalue", "0.93" ) ) )
	StartMenuBarracksButtonMP.unlockRequirements:setText( LocalizeIntoString( "CPUI_REQUIRES_LEVEL", "7" ) )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		StartMenuBarracksButtonMP:setModel( model, controller )
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "SocialPlayerInfo", "mpRankIcon", function ( model )
		local mpRankIcon = Engine.GetModelValue( model )
		if mpRankIcon then
			StartMenuBarracksButtonMP.Emblem:setImage( RegisterImage( GetRankIconLarge( mpRankIcon ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "SocialPlayerInfo", "mpRank", function ( model )
		local mpRank = Engine.GetModelValue( model )
		if mpRank then
			StartMenuBarracksButtonMP.RankName:setText( Engine.Localize( RankToTitleStringFromSocialPlayerInfo( controller, "mp", mpRank ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "SocialPlayerInfo", "mpPrestige", function ( model )
		local mpPrestige = Engine.GetModelValue( model )
		if mpPrestige then
			StartMenuBarracksButtonMP.Rank:setRGB( SetToParagonColorIfPrestigeMasterByPLevel( "mp", 255, 255, 255, mpPrestige ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "SocialPlayerInfo", "mpRank", function ( model )
		local mpRank = Engine.GetModelValue( model )
		if mpRank then
			StartMenuBarracksButtonMP.Rank:setText( RankToLevelString( "mp", mpRank ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "SocialPlayerInfo", "mpPrestige", function ( model )
		local mpPrestige = Engine.GetModelValue( model )
		if mpPrestige then
			StartMenuBarracksButtonMP.PrestigeMasterTierWidget:setAlpha( ShowIfPrestigeMasterByPLevel( "mp", mpPrestige ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "SocialPlayerInfo", "mpPrestigeMasterTier", function ( model )
		local mpPrestigeMasterTier = Engine.GetModelValue( model )
		if mpPrestigeMasterTier then
			StartMenuBarracksButtonMP.PrestigeMasterTierWidget.ParagonStars:setHorizontalCount( mpPrestigeMasterTier )
		end
	end )
	StartMenuBarracksButtonMP:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f22_local0
	end )
	StartMenuBarracksButtonMP:registerEventHandler( "lose_focus", function ( element, event )
		local f23_local0 = nil
		if element.loseFocus then
			f23_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f23_local0 = element.super:loseFocus( event )
		end
		return f23_local0
	end )
	self:AddButtonCallbackFunction( StartMenuBarracksButtonMP, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disable" ) then
			SetGlobalModelValue( "combatRecordMode", "mp" )
			CombatRecordSetMenuForPostStatsLoad( self, "CombatRecordMP" )
			CombatRecordSetXUIDFromSelectedFriend( controller )
			OpenPopup( self, "Social_InspectPlayerPopupLoading", controller, "", "" )
			CombatRecordReadOtherPlayerStats( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Disable" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	StartMenuBarracksButtonMP:mergeStateConditions( {
		{
			stateName = "Disable",
			condition = function ( menu, element, event )
				return IsMPCombatRecordLockedForSocialPlayerInfo( controller, element )
			end
		},
		{
			stateName = "NoStats",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( StartMenuBarracksButtonMP )
	self.StartMenuBarracksButtonMP = StartMenuBarracksButtonMP
	
	local StartMenuBarracksButtonZM = CoD.StartMenu_Barracks_Button_ZM.new( self, controller )
	StartMenuBarracksButtonZM:setLeftRight( false, false, 193.5, 559.5 )
	StartMenuBarracksButtonZM:setTopBottom( false, false, -218.5, 218.5 )
	StartMenuBarracksButtonZM.SessionName:setText( Engine.Localize( "MENU_ZOMBIES_CAPS" ) )
	StartMenuBarracksButtonZM.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_BARRACKS_DESC" ) )
	StartMenuBarracksButtonZM.TotalKills.Title:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.kills.statvalue", "888" ) ) )
	StartMenuBarracksButtonZM.RoundsSurvived.Title:setText( Engine.Localize( "0" ) )
	StartMenuBarracksButtonZM.SPM.Title:setText( Engine.Localize( CombatRecordGetTwoStatRatioRounded( controller, "playerstatslist.total_rounds_survived.statvalue", "playerstatslist.total_games_played.statvalue", "888" ) ) )
	StartMenuBarracksButtonZM.unlockRequirements:setText( LocalizeIntoString( "CPUI_REQUIRES_LEVEL", "2" ) )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		StartMenuBarracksButtonZM:setModel( model, controller )
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "SocialPlayerInfo", "zmRankIcon", function ( model )
		local zmRankIcon = Engine.GetModelValue( model )
		if zmRankIcon then
			StartMenuBarracksButtonZM.Emblem:setImage( RegisterImage( GetRankIconLarge( zmRankIcon ) ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "SocialPlayerInfo", "zmRank", function ( model )
		local zmRank = Engine.GetModelValue( model )
		if zmRank then
			StartMenuBarracksButtonZM.RankName:setText( Engine.Localize( RankToTitleStringFromSocialPlayerInfo( controller, "zm", zmRank ) ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "SocialPlayerInfo", "zmPrestige", function ( model )
		local zmPrestige = Engine.GetModelValue( model )
		if zmPrestige then
			StartMenuBarracksButtonZM.Rank:setRGB( SetToParagonColorIfPrestigeMasterByPLevel( "zm", 255, 255, 255, zmPrestige ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "SocialPlayerInfo", "zmRank", function ( model )
		local zmRank = Engine.GetModelValue( model )
		if zmRank then
			StartMenuBarracksButtonZM.Rank:setText( RankToLevelString( "zm", zmRank ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "SocialPlayerInfo", "zmPrestige", function ( model )
		local zmPrestige = Engine.GetModelValue( model )
		if zmPrestige then
			StartMenuBarracksButtonZM.PrestigeMasterTierWidget:setAlpha( ShowIfPrestigeMasterByPLevel( "zm", zmPrestige ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "SocialPlayerInfo", "zmPrestigeMasterTier", function ( model )
		local zmPrestigeMasterTier = Engine.GetModelValue( model )
		if zmPrestigeMasterTier then
			StartMenuBarracksButtonZM.PrestigeMasterTierWidget.ParagonStars:setHorizontalCount( zmPrestigeMasterTier )
		end
	end )
	StartMenuBarracksButtonZM:registerEventHandler( "gain_focus", function ( element, event )
		local f35_local0 = nil
		if element.gainFocus then
			f35_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f35_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f35_local0
	end )
	StartMenuBarracksButtonZM:registerEventHandler( "lose_focus", function ( element, event )
		local f36_local0 = nil
		if element.loseFocus then
			f36_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f36_local0 = element.super:loseFocus( event )
		end
		return f36_local0
	end )
	self:AddButtonCallbackFunction( StartMenuBarracksButtonZM, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsElementInState( element, "Disable" ) then
			SetGlobalModelValue( "combatRecordMode", "zm" )
			CombatRecordSetMenuForPostStatsLoad( self, "CombatRecordZM" )
			CombatRecordSetXUIDFromSelectedFriend( controller )
			OpenPopup( self, "Social_InspectPlayerPopupLoading", controller, "", "" )
			CombatRecordReadOtherPlayerStats( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Disable" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	StartMenuBarracksButtonZM:mergeStateConditions( {
		{
			stateName = "Disable",
			condition = function ( menu, element, event )
				return IsZMCombatRecordLockedForSocialPlayerInfo( controller, element )
			end
		},
		{
			stateName = "NoStats",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( StartMenuBarracksButtonZM )
	self.StartMenuBarracksButtonZM = StartMenuBarracksButtonZM
	
	StartMenuBarracksButtonCP.navigation = {
		right = StartMenuBarracksButtonMP
	}
	StartMenuBarracksButtonMP.navigation = {
		left = StartMenuBarracksButtonCP,
		right = StartMenuBarracksButtonZM
	}
	StartMenuBarracksButtonZM.navigation = {
		left = StartMenuBarracksButtonMP
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f41_local0 = nil
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not f41_local0 then
			f41_local0 = self:dispatchEventToChildren( event )
		end
		return f41_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		if not IsPerControllerTablePropertyValue( controller, "previousCombatRecordMode", nil ) then
			SetGlobalModelValueArg( "prestigeGameMode", Enum.eModes.MODE_INVALID )
			SetGlobalModelValueArg( "combatRecordMode", CoD.perController[controller].previousCombatRecordMode )
		else
			SetGlobalModelValueArg( "prestigeGameMode", Enum.eModes.MODE_INVALID )
		end
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	StartMenuBarracksButtonCP.id = "StartMenuBarracksButtonCP"
	StartMenuBarracksButtonMP.id = "StartMenuBarracksButtonMP"
	StartMenuBarracksButtonZM.id = "StartMenuBarracksButtonZM"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.StartMenuBarracksButtonMP:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.StartMenuBarracksButtonCP:close()
		element.StartMenuBarracksButtonMP:close()
		element.StartMenuBarracksButtonZM:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ViewRemoteCombatRecord.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

