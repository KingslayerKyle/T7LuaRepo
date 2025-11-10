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
	StartMenuBarracksButtonCP.unlockRequirements:setText( Engine.Localize( LocalizeIntoString( "CPUI_REQUIRES_LEVEL", "2" ) ) )
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
			StartMenuBarracksButtonCP.Rank:setText( Engine.Localize( RankToLevelString( "cp", StorageLookup( controller, "playerstatslist.rank.statvalue", statsCp ) ) ) )
		end
	end )
	StartMenuBarracksButtonCP:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	StartMenuBarracksButtonCP:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	menu:AddButtonCallbackFunction( StartMenuBarracksButtonCP, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disable" ) then
			SetGlobalModelValue( "combatRecordMode", "cp" )
			OpenOverlay( self, "CombatRecordCP", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( element, "Disable" ) then
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
		}
	} )
	self:addElement( StartMenuBarracksButtonCP )
	self.StartMenuBarracksButtonCP = StartMenuBarracksButtonCP
	
	local StartMenuBarracksButtonMP = CoD.StartMenu_Barracks_Button_MP.new( menu, controller )
	StartMenuBarracksButtonMP:setLeftRight( true, false, 384, 750 )
	StartMenuBarracksButtonMP:setTopBottom( true, false, 13, 449.94 )
	StartMenuBarracksButtonMP.SessionName:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	StartMenuBarracksButtonMP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MP_BARRACKS_DESC" ) )
	StartMenuBarracksButtonMP.unlockRequirements:setText( Engine.Localize( LocalizeIntoString( "CPUI_REQUIRES_LEVEL", "7" ) ) )
	StartMenuBarracksButtonMP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksButtonMP.Emblem:setImage( RegisterImage( GetRankIconLarge( GetRankIcon( controller, "playerstatslist.rank.statvalue", "playerstatslist.plevel.statvalue", "mp", statsMp ) ) ) )
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
			StartMenuBarracksButtonMP.Rank:setText( Engine.Localize( RankToLevelString( "mp", StorageLookup( controller, "playerstatslist.rank.statvalue", statsMp ) ) ) )
		end
	end )
	StartMenuBarracksButtonMP:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f15_local0
	end )
	StartMenuBarracksButtonMP:registerEventHandler( "lose_focus", function ( element, event )
		local f16_local0 = nil
		if element.loseFocus then
			f16_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f16_local0 = element.super:loseFocus( event )
		end
		return f16_local0
	end )
	menu:AddButtonCallbackFunction( StartMenuBarracksButtonMP, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Disable" ) then
			SetGlobalModelValue( "combatRecordMode", "mp" )
			OpenOverlay( self, "BarracksMP", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( element, "Disable" ) then
			return true
		else
			return false
		end
	end, false )
	StartMenuBarracksButtonMP:mergeStateConditions( {
		{
			stateName = "Disable",
			condition = function ( menu, element, event )
				local f19_local0
				if not IsStorageValueAtLeast( controller, "stats_mp", "playerstatslist.rank.statvalue", 6 ) then
					f19_local0 = not IsStorageValueAtLeast( controller, "stats_mp", "playerstatslist.plevel.statvalue", 1 )
				else
					f19_local0 = false
				end
				return f19_local0
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
	StartMenuBarracksButtonZM.unlockRequirements:setText( Engine.Localize( LocalizeIntoString( "CPUI_REQUIRES_LEVEL", "2" ) ) )
	StartMenuBarracksButtonZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local statsZm = Engine.GetModelValue( model )
		if statsZm then
			StartMenuBarracksButtonZM.Emblem:setImage( RegisterImage( GetRankIconLarge( GetRankIcon( controller, "playerstatslist.rank.statvalue", "playerstatslist.plevel.statvalue", "zm", statsZm ) ) ) )
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
			StartMenuBarracksButtonZM.Rank:setText( Engine.Localize( RankToLevelString( "zm", StorageLookup( controller, "playerstatslist.rank.statvalue", statsZm ) ) ) )
		end
	end )
	StartMenuBarracksButtonZM:registerEventHandler( "gain_focus", function ( element, event )
		local f23_local0 = nil
		if element.gainFocus then
			f23_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f23_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f23_local0
	end )
	StartMenuBarracksButtonZM:registerEventHandler( "lose_focus", function ( element, event )
		local f24_local0 = nil
		if element.loseFocus then
			f24_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f24_local0 = element.super:loseFocus( event )
		end
		return f24_local0
	end )
	menu:AddButtonCallbackFunction( StartMenuBarracksButtonZM, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsElementInState( element, "Disable" ) then
			SetGlobalModelValue( "combatRecordMode", "zm" )
			OpenOverlay( self, "BarracksZM", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( element, "Disable" ) then
			return true
		else
			return false
		end
	end, false )
	StartMenuBarracksButtonZM:mergeStateConditions( {
		{
			stateName = "Disable",
			condition = function ( menu, element, event )
				local f27_local0
				if not IsStorageValueAtLeast( controller, "stats_zm", "playerstatslist.rank.statvalue", 1 ) then
					f27_local0 = not IsStorageValueAtLeast( controller, "stats_zm", "playerstatslist.plevel.statvalue", 1 )
				else
					f27_local0 = false
				end
				return f27_local0
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

