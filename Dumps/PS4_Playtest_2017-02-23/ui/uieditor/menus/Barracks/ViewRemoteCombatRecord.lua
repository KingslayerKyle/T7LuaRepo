require( "ui.uieditor.menus.Barracks.CombatRecordCP.CombatRecordCP" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordMP" )
require( "ui.uieditor.menus.Barracks.CombatRecordZM.CombatRecordZM" )
require( "ui.uieditor.menus.Social.Social_InspectPlayerPopupLoading" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Button_CP" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Button_MP" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Button_ZM" )

LUI.createMenu.ViewRemoteCombatRecord = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ViewRemoteCombatRecord" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ViewRemoteCombatRecord.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	StartMenuBackground0:setLeftRight( 0, 1, 0, 0 )
	StartMenuBackground0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 27, 105 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 136, 1062 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_VIEW_COMBAT_RECORD" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_VIEW_COMBAT_RECORD" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local StartMenuBarracksButtonCP = CoD.StartMenu_Barracks_Button_CP.new( self, controller )
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
	StartMenuBarracksButtonCP:setLeftRight( 0.5, 0.5, -836.5, -287.5 )
	StartMenuBarracksButtonCP:setTopBottom( 0.5, 0.5, -328, 328 )
	StartMenuBarracksButtonCP.SessionName:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	StartMenuBarracksButtonCP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_BARRACKS_DESC" ) )
	StartMenuBarracksButtonCP.TotalKills.Title:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.kills.statvalue", "888" ) ) )
	StartMenuBarracksButtonCP.unlockRequirements:setText( LocalizeIntoString( "CPUI_REQUIRES_LEVEL", "2" ) )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		StartMenuBarracksButtonCP:setModel( model, controller )
	end )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "SocialPlayerInfo", "cpRankIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonCP.Emblem:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "SocialPlayerInfo", "cpRank", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonCP.RankName:setText( Engine.Localize( RankToTitleString( "cp", modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "SocialPlayerInfo", "cpRank", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonCP.Rank:setText( RankToLevelString( "cp", modelValue ) )
		end
	end )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "CombatRecordCPPercentComplete", "percent", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonCP.PercentComplete.Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	StartMenuBarracksButtonCP:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	StartMenuBarracksButtonCP:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( StartMenuBarracksButtonCP )
	self.StartMenuBarracksButtonCP = StartMenuBarracksButtonCP
	
	local StartMenuBarracksButtonMP = CoD.StartMenu_Barracks_Button_MP.new( self, controller )
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
	StartMenuBarracksButtonMP:setLeftRight( 0.5, 0.5, -274.5, 274.5 )
	StartMenuBarracksButtonMP:setTopBottom( 0.5, 0.5, -328, 327 )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonMP.Emblem:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "SocialPlayerInfo", "mpRank", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonMP.RankName:setText( Engine.Localize( RankToTitleStringFromSocialPlayerInfo( controller, "mp", modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "SocialPlayerInfo", "mpRank", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonMP.Rank:setRGB( SetToParagonColorIfPrestigeMasterByRank( 255, 255, 255, modelValue ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "SocialPlayerInfo", "mpRank", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonMP.Rank:setText( RankToLevelString( "mp", modelValue ) )
		end
	end )
	StartMenuBarracksButtonMP:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	StartMenuBarracksButtonMP:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( StartMenuBarracksButtonMP )
	self.StartMenuBarracksButtonMP = StartMenuBarracksButtonMP
	
	local StartMenuBarracksButtonZM = CoD.StartMenu_Barracks_Button_ZM.new( self, controller )
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
	StartMenuBarracksButtonZM:setLeftRight( 0.5, 0.5, 290.5, 839.5 )
	StartMenuBarracksButtonZM:setTopBottom( 0.5, 0.5, -328, 328 )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonZM.Emblem:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "SocialPlayerInfo", "zmRank", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonZM.RankName:setText( Engine.Localize( RankToTitleStringFromSocialPlayerInfo( controller, "zm", modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "SocialPlayerInfo", "zmRank", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonZM.Rank:setText( RankToLevelString( "zm", modelValue ) )
		end
	end )
	StartMenuBarracksButtonZM:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	StartMenuBarracksButtonZM:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( StartMenuBarracksButtonZM )
	self.StartMenuBarracksButtonZM = StartMenuBarracksButtonZM
	
	MenuFrame.navigation = {
		left = StartMenuBarracksButtonMP,
		up = {
			StartMenuBarracksButtonCP,
			StartMenuBarracksButtonZM
		},
		right = StartMenuBarracksButtonZM
	}
	StartMenuBarracksButtonCP.navigation = {
		up = MenuFrame,
		right = MenuFrame
	}
	StartMenuBarracksButtonMP.navigation = {
		left = MenuFrame,
		right = StartMenuBarracksButtonZM,
		down = MenuFrame
	}
	StartMenuBarracksButtonZM.navigation = {
		left = MenuFrame,
		up = MenuFrame
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetGlobalModelValueArg( "prestigeGameMode", Enum.eModes.MODE_INVALID )
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	MenuFrame.id = "MenuFrame"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.FEMenuLeftGraphics:close()
		self.MenuFrame:close()
		self.StartMenuBarracksButtonCP:close()
		self.StartMenuBarracksButtonMP:close()
		self.StartMenuBarracksButtonZM:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ViewRemoteCombatRecord.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

