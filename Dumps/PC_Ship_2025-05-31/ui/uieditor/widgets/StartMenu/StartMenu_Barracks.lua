require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Button_CP" )
require( "ui.uieditor.menus.Barracks.CombatRecordCP.CombatRecordCP" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Button_MP" )
require( "ui.uieditor.menus.Barracks.BarracksMP" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Button_ZM" )
require( "ui.uieditor.menus.Barracks.BarracksZM" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	CoD.UnlockablesTable = nil
	LUI.OverrideFunction_CallOriginalSecond( f1_arg0, "close", function ( element )
		CoD.UnlockablesTable = nil
	end )
end

CoD.StartMenu_Barracks = InheritFrom( LUI.UIElement )
CoD.StartMenu_Barracks.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Barracks )
	self.id = "StartMenu_Barracks"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local StartMenuBarracksButtonCP = CoD.StartMenu_Barracks_Button_CP.new( menu, controller )
	StartMenuBarracksButtonCP:setLeftRight( true, false, 9, 375 )
	StartMenuBarracksButtonCP:setTopBottom( true, false, 13, 450 )
	StartMenuBarracksButtonCP.SessionName:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	StartMenuBarracksButtonCP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_BARRACKS_DESC" ) )
	StartMenuBarracksButtonCP.unlockRequirements:setText( LocalizeIntoString( "CPUI_REQUIRES_LEVEL", "2" ) )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp", function ( model )
		local statsCp = Engine.GetModelValue( model )
		if statsCp then
			StartMenuBarracksButtonCP.Emblem:setImage( RegisterImage( GetRankIconLarge( GetRankIcon( controller, "playerstatslist.rank.statvalue", "playerstatslist.plevel.statvalue", "cp", statsCp ) ) ) )
		end
	end )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp", function ( model )
		local statsCp = Engine.GetModelValue( model )
		if statsCp then
			StartMenuBarracksButtonCP.RankName:setText( Engine.Localize( RankTitleFromStorage( controller, "cp", statsCp ) ) )
		end
	end )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp", function ( model )
		local statsCp = Engine.GetModelValue( model )
		if statsCp then
			StartMenuBarracksButtonCP.Rank:setText( RankToLevelString( "cp", StorageLookup( controller, "playerstatslist.rank.statvalue", statsCp ) ) )
		end
	end )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp", function ( model )
		local statsCp = Engine.GetModelValue( model )
		if statsCp then
			StartMenuBarracksButtonCP.TotalKills.Title:setText( Engine.Localize( StorageLookup( controller, "playerstatslist.kills.statvalue", statsCp ) ) )
		end
	end )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "CombatRecordCPPercentComplete", "localPlayerPercent", function ( model )
		local localPlayerPercent = Engine.GetModelValue( model )
		if localPlayerPercent then
			StartMenuBarracksButtonCP.PercentComplete.Title:setText( Engine.Localize( localPlayerPercent ) )
		end
	end )
	StartMenuBarracksButtonCP:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( StartMenuBarracksButtonCP, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disable" ) then
			SetGlobalModelValue( "combatRecordMode", "cp" )
			CombatRecordSetXUIDForLocalController( controller )
			OpenOverlay( self, "CombatRecordCP", controller, "", "" )
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
				return not IsStorageValueAtLeast( controller, "stats_cp", "playerstatslist.rank.statvalue", 1 )
			end
		},
		{
			stateName = "NoStats",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( StartMenuBarracksButtonCP )
	self.StartMenuBarracksButtonCP = StartMenuBarracksButtonCP
	
	local StartMenuBarracksButtonMP = CoD.StartMenu_Barracks_Button_MP.new( menu, controller )
	StartMenuBarracksButtonMP:setLeftRight( true, false, 384, 750 )
	StartMenuBarracksButtonMP:setTopBottom( true, false, 13, 449.94 )
	StartMenuBarracksButtonMP.SessionName:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	StartMenuBarracksButtonMP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MP_BARRACKS_DESC" ) )
	StartMenuBarracksButtonMP.unlockRequirements:setText( LocalizeIntoString( "CPUI_REQUIRES_LEVEL", "7" ) )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksButtonMP.Emblem:setImage( RegisterImage( GetRankIconLarge( GetRankOrParagonIcon( controller, "playerstatslist.rank.statvalue", "playerstatslist.plevel.statvalue", "playerstatslist.paragon_icon_id.statvalue", "mp", statsMp ) ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksButtonMP.RankName:setText( Engine.Localize( RankTitleFromStorage( controller, "mp", statsMp ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksButtonMP.Rank:setRGB( SetToParagonColorIfPrestigeMasterFromStorage( controller, "mp", 255, 255, 255, statsMp ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksButtonMP.Rank:setText( LevelStringFromStorage( controller, "mp", statsMp ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksButtonMP.TotalKills.Title:setText( Engine.Localize( StorageLookup( controller, "playerstatslist.kills.statvalue", statsMp ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksButtonMP.KD.Title:setText( Engine.Localize( StorageLookupTwoStatRatio( controller, "playerstatslist.kills.statvalue", "playerstatslist.deaths.statvalue", statsMp ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksButtonMP.SPM.Title:setText( Engine.Localize( StorageLookupSPM( controller, "playerstatslist.score.statvalue", "playerstatslist.time_played_total.statvalue", statsMp ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksButtonMP.WL.Title:setText( Engine.Localize( StorageLookupTwoStatRatio( controller, "playerstatslist.wins.statvalue", "playerstatslist.losses.statvalue", statsMp ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksButtonMP.PrestigeMasterTierWidget:setAlpha( ShowIfPrestigeMasterByPLevel( "mp", GetPLevelFromStorage( controller, "mp", statsMp ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksButtonMP.PrestigeMasterTierWidget.ParagonStars:setHorizontalCount( GetPrestigeMasterTierCountFromStorage( controller, "mp", statsMp ) )
		end
	end )
	StartMenuBarracksButtonMP:registerEventHandler( "gain_focus", function ( element, event )
		local f25_local0 = nil
		if element.gainFocus then
			f25_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f25_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f25_local0
	end )
	StartMenuBarracksButtonMP:registerEventHandler( "lose_focus", function ( element, event )
		local f26_local0 = nil
		if element.loseFocus then
			f26_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f26_local0 = element.super:loseFocus( event )
		end
		return f26_local0
	end )
	menu:AddButtonCallbackFunction( StartMenuBarracksButtonMP, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disable" ) then
			SetGlobalModelValue( "combatRecordMode", "mp" )
			OpenOverlay( self, "BarracksMP", controller, "", "" )
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
				local f29_local0
				if not IsStorageValueAtLeast( controller, "stats_mp", "playerstatslist.rank.statvalue", 6 ) then
					f29_local0 = not IsStorageValueAtLeast( controller, "stats_mp", "playerstatslist.plevel.statvalue", 1 )
				else
					f29_local0 = false
				end
				return f29_local0
			end
		},
		{
			stateName = "NoStats",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( StartMenuBarracksButtonMP )
	self.StartMenuBarracksButtonMP = StartMenuBarracksButtonMP
	
	local StartMenuBarracksButtonZM = CoD.StartMenu_Barracks_Button_ZM.new( menu, controller )
	StartMenuBarracksButtonZM:setLeftRight( true, false, 760, 1126 )
	StartMenuBarracksButtonZM:setTopBottom( true, false, 13, 450 )
	StartMenuBarracksButtonZM.SessionName:setText( Engine.Localize( "MENU_ZOMBIES_CAPS" ) )
	StartMenuBarracksButtonZM.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MP_BARRACKS_DESC" ) )
	StartMenuBarracksButtonZM.unlockRequirements:setText( LocalizeIntoString( "CPUI_REQUIRES_LEVEL", "2" ) )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local statsZm = Engine.GetModelValue( model )
		if statsZm then
			StartMenuBarracksButtonZM.Emblem:setImage( RegisterImage( GetRankIconLarge( GetRankOrParagonIcon( controller, "playerstatslist.rank.statvalue", "playerstatslist.plevel.statvalue", "playerstatslist.paragon_icon_id.statvalue", "zm", statsZm ) ) ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local statsZm = Engine.GetModelValue( model )
		if statsZm then
			StartMenuBarracksButtonZM.RankName:setText( Engine.Localize( RankTitleFromStorage( controller, "zm", statsZm ) ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local statsZm = Engine.GetModelValue( model )
		if statsZm then
			StartMenuBarracksButtonZM.Rank:setRGB( SetToParagonColorIfPrestigeMasterFromStorage( controller, "zm", 255, 255, 255, statsZm ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local statsZm = Engine.GetModelValue( model )
		if statsZm then
			StartMenuBarracksButtonZM.Rank:setText( LevelStringFromStorage( controller, "zm", statsZm ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local statsZm = Engine.GetModelValue( model )
		if statsZm then
			StartMenuBarracksButtonZM.TotalKills.Title:setText( Engine.Localize( StorageLookup( controller, "playerstatslist.kills.statvalue", statsZm ) ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local statsZm = Engine.GetModelValue( model )
		if statsZm then
			StartMenuBarracksButtonZM.RoundsSurvived.Title:setText( Engine.Localize( StorageLookup( controller, "playerstatslist.total_rounds_survived.statvalue", statsZm ) ) )
			StartMenuBarracksButtonZM.SPM.Title:setText( Engine.Localize( StorageLookupTwoStatRatioRounded( controller, "playerstatslist.total_rounds_survived.statvalue", "playerstatslist.total_games_played.statvalue", statsZm ) ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local statsZm = Engine.GetModelValue( model )
		if statsZm then
			StartMenuBarracksButtonZM.PrestigeMasterTierWidget:setAlpha( ShowIfPrestigeMasterByPLevel( "zm", GetPLevelFromStorage( controller, "zm", statsZm ) ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local statsZm = Engine.GetModelValue( model )
		if statsZm then
			StartMenuBarracksButtonZM.PrestigeMasterTierWidget.ParagonStars:setHorizontalCount( GetPrestigeMasterTierCountFromStorage( controller, "zm", statsZm ) )
		end
	end )
	StartMenuBarracksButtonZM:registerEventHandler( "gain_focus", function ( element, event )
		local f39_local0 = nil
		if element.gainFocus then
			f39_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f39_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f39_local0
	end )
	StartMenuBarracksButtonZM:registerEventHandler( "lose_focus", function ( element, event )
		local f40_local0 = nil
		if element.loseFocus then
			f40_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f40_local0 = element.super:loseFocus( event )
		end
		return f40_local0
	end )
	menu:AddButtonCallbackFunction( StartMenuBarracksButtonZM, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsElementInState( element, "Disable" ) then
			SetGlobalModelValue( "combatRecordMode", "zm" )
			OpenOverlay( self, "BarracksZM", controller, "", "" )
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
				local f43_local0
				if not IsStorageValueAtLeast( controller, "stats_zm", "playerstatslist.rank.statvalue", 1 ) then
					f43_local0 = not IsStorageValueAtLeast( controller, "stats_zm", "playerstatslist.plevel.statvalue", 1 )
				else
					f43_local0 = false
				end
				return f43_local0
			end
		},
		{
			stateName = "NoStats",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	StartMenuBarracksButtonCP.id = "StartMenuBarracksButtonCP"
	StartMenuBarracksButtonMP.id = "StartMenuBarracksButtonMP"
	StartMenuBarracksButtonZM.id = "StartMenuBarracksButtonZM"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.StartMenuBarracksButtonMP:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBarracksButtonCP:close()
		element.StartMenuBarracksButtonMP:close()
		element.StartMenuBarracksButtonZM:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

