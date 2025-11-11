require( "ui.uieditor.menus.Barracks.BarracksMP" )
require( "ui.uieditor.menus.Barracks.BarracksZM" )
require( "ui.uieditor.menus.Barracks.CombatRecordCP.CombatRecordCP" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Button_CP" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Button_MP" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Button_ZM" )

local PostLoadFunc = function ( self, controller )
	CoD.CACUtility.UnlockablesTable = nil
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		CoD.CACUtility.UnlockablesTable = nil
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
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local StartMenuBarracksButtonCP = CoD.StartMenu_Barracks_Button_CP.new( menu, controller )
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
	StartMenuBarracksButtonCP:setLeftRight( 0, 0, 13.5, 562.5 )
	StartMenuBarracksButtonCP:setTopBottom( 0, 0, 19, 675 )
	StartMenuBarracksButtonCP.SessionName:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	StartMenuBarracksButtonCP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_BARRACKS_DESC" ) )
	StartMenuBarracksButtonCP.unlockRequirements:setText( LocalizeIntoString( "CPUI_REQUIRES_LEVEL", "2" ) )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonCP.Emblem:setImage( RegisterImage( GetRankIconLarge( GetRankIcon( controller, "playerstatslist.rank.statvalue", "playerstatslist.plevel.statvalue", "cp", modelValue ) ) ) )
		end
	end )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonCP.RankName:setText( Engine.Localize( RankTitleFromStorage( controller, "cp", modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonCP.Rank:setText( RankToLevelString( "cp", StorageLookup( controller, "playerstatslist.rank.statvalue", modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonCP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonCP.TotalKills.Title:setText( Engine.Localize( StorageLookup( controller, "playerstatslist.kills.statvalue", modelValue ) ) )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( StartMenuBarracksButtonCP )
	self.StartMenuBarracksButtonCP = StartMenuBarracksButtonCP
	
	local StartMenuBarracksButtonMP = CoD.StartMenu_Barracks_Button_MP.new( menu, controller )
	StartMenuBarracksButtonMP:mergeStateConditions( {
		{
			stateName = "Disable",
			condition = function ( menu, element, event )
				local f15_local0
				if not IsStorageValueAtLeast( controller, "stats_mp", "playerstatslist.rank.statvalue", 6 ) then
					f15_local0 = not IsStorageValueAtLeast( controller, "stats_mp", "playerstatslist.plevel.statvalue", 1 )
				else
					f15_local0 = false
				end
				return f15_local0
			end
		},
		{
			stateName = "NoStats",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	StartMenuBarracksButtonMP:setLeftRight( 0, 0, 575.5, 1124.5 )
	StartMenuBarracksButtonMP:setTopBottom( 0, 0, 20, 675 )
	StartMenuBarracksButtonMP.SessionName:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	StartMenuBarracksButtonMP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MP_BARRACKS_DESC" ) )
	StartMenuBarracksButtonMP.unlockRequirements:setText( LocalizeIntoString( "CPUI_REQUIRES_LEVEL", "7" ) )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonMP.Emblem:setImage( RegisterImage( GetRankIconLarge( GetRankOrParagonIcon( controller, "playerstatslist.rank.statvalue", "playerstatslist.plevel.statvalue", "playerstatslist.paragon_icon_id.statvalue", "mp", modelValue ) ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonMP.RankName:setText( Engine.Localize( RankTitleFromStorage( controller, "mp", modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonMP.Rank:setRGB( SetToParagonColorIfPrestigeMasterFromStorage( controller, "mp", 255, 255, 255, modelValue ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonMP.Rank:setText( LevelStringFromStorage( controller, "mp", modelValue ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonMP.TotalKills.Title:setText( Engine.Localize( StorageLookup( controller, "playerstatslist.kills.statvalue", modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonMP.KD.Title:setText( Engine.Localize( StorageLookupTwoStatRatio( controller, "playerstatslist.kills.statvalue", "playerstatslist.deaths.statvalue", modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonMP.SPM.Title:setText( Engine.Localize( StorageLookupSPM( controller, "playerstatslist.score.statvalue", "playerstatslist.time_played_total.statvalue", modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonMP.WL.Title:setText( Engine.Localize( StorageLookupTwoStatRatio( controller, "playerstatslist.wins.statvalue", "playerstatslist.losses.statvalue", modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonMP:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( StartMenuBarracksButtonMP, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disable" ) then
			SetGlobalModelValue( "combatRecordMode", "mp" )
			OpenOverlay( self, "BarracksMP", controller, "", "" )
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
	
	local StartMenuBarracksButtonZM = CoD.StartMenu_Barracks_Button_ZM.new( menu, controller )
	StartMenuBarracksButtonZM:mergeStateConditions( {
		{
			stateName = "Disable",
			condition = function ( menu, element, event )
				local f29_local0
				if not IsStorageValueAtLeast( controller, "stats_zm", "playerstatslist.rank.statvalue", 1 ) then
					f29_local0 = not IsStorageValueAtLeast( controller, "stats_zm", "playerstatslist.plevel.statvalue", 1 )
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
	StartMenuBarracksButtonZM:setLeftRight( 0, 0, 1139.5, 1688.5 )
	StartMenuBarracksButtonZM:setTopBottom( 0, 0, 19, 675 )
	StartMenuBarracksButtonZM.SessionName:setText( Engine.Localize( "MENU_ZOMBIES_CAPS" ) )
	StartMenuBarracksButtonZM.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MP_BARRACKS_DESC" ) )
	StartMenuBarracksButtonZM.RoundsSurvived.Title:setText( Engine.Localize( "0" ) )
	StartMenuBarracksButtonZM.unlockRequirements:setText( LocalizeIntoString( "CPUI_REQUIRES_LEVEL", "2" ) )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonZM.Emblem:setImage( RegisterImage( GetRankIconLarge( GetRankOrParagonIcon( controller, "playerstatslist.rank.statvalue", "playerstatslist.plevel.statvalue", "playerstatslist.paragon_icon_id.statvalue", "zm", modelValue ) ) ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonZM.RankName:setText( Engine.Localize( RankTitleFromStorage( controller, "zm", modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonZM.Rank:setRGB( SetToParagonColorIfPrestigeMasterFromStorage( controller, "zm", 255, 255, 255, modelValue ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonZM.Rank:setText( LevelStringFromStorage( controller, "zm", modelValue ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonZM.TotalKills.Title:setText( Engine.Localize( StorageLookup( controller, "playerstatslist.kills.statvalue", modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksButtonZM.SPM.Title:setText( Engine.Localize( StorageLookupTwoStatRatioRounded( controller, "playerstatslist.total_rounds_survived.statvalue", "playerstatslist.total_games_played.statvalue", modelValue ) ) )
		end
	end )
	StartMenuBarracksButtonZM:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( StartMenuBarracksButtonZM, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsElementInState( element, "Disable" ) then
			SetGlobalModelValue( "combatRecordMode", "zm" )
			OpenOverlay( self, "BarracksZM", controller, "", "" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBarracksButtonCP:close()
		self.StartMenuBarracksButtonMP:close()
		self.StartMenuBarracksButtonZM:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

