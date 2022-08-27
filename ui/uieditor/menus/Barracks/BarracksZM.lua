-- 4ed8a5664eeccd9a675164cd41ba2290
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Barracks.LeaderboardsButton" )
require( "ui.uieditor.menus.Leaderboard.Leaderboard_Main" )
require( "ui.uieditor.widgets.Barracks.CombatRecordButtonZM" )
require( "ui.uieditor.menus.Barracks.CombatRecordZM.CombatRecordZM" )
require( "ui.uieditor.widgets.Barracks.PrestigeButton" )
require( "ui.uieditor.menus.Prestige.Prestige_Main" )

local PreLoadFunc = function ( self, controller )
	SetGlobalModelValueArg( "prestigeGameMode", Enum.eModes.MODE_ZOMBIES )
	CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( controller )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.disablePopupOpenCloseAnim = true
	f2_arg0.originalOcclusionChange = f2_arg0.m_eventHandlers.occlusion_change
	f2_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded then
			UpdateElementState( element, "PrestigeButton", f2_arg1 )
		end
		element:originalOcclusionChange( event )
	end )
end

LUI.createMenu.BarracksZM = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BarracksZM" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BarracksZM.buttonPrompts" )
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( f4_local1, controller )
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
	BlackBG:setAlpha( 0.9 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f4_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrame.new( f4_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_BARRACKS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BARRACKS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f4_local1, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 23, 83 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local LeaderboardsButton = CoD.LeaderboardsButton.new( f4_local1, controller )
	LeaderboardsButton:setLeftRight( false, false, 169.5, 548 )
	LeaderboardsButton:setTopBottom( true, false, 110.5, 408.5 )
	LeaderboardsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_LEADERBOARDS" ) )
	LeaderboardsButton:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	LeaderboardsButton:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	f4_local1:AddButtonCallbackFunction( LeaderboardsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		NavigateToLeaderboardMain( f10_arg1, "Leaderboard_Main", f10_arg2 )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	LeaderboardsButton:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( LeaderboardsButton )
	self.LeaderboardsButton = LeaderboardsButton
	
	local CombatRecordButton = CoD.CombatRecordButtonZM.new( f4_local1, controller )
	CombatRecordButton:setLeftRight( true, false, 91.5, 798.5 )
	CombatRecordButton:setTopBottom( true, false, 110.5, 408.5 )
	CombatRecordButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "FEATURE_COMBAT_RECORD" ) )
	CombatRecordButton:registerEventHandler( "gain_focus", function ( element, event )
		local f13_local0 = nil
		if element.gainFocus then
			f13_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f13_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f13_local0
	end )
	CombatRecordButton:registerEventHandler( "lose_focus", function ( element, event )
		local f14_local0 = nil
		if element.loseFocus then
			f14_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f14_local0 = element.super:loseFocus( event )
		end
		return f14_local0
	end )
	f4_local1:AddButtonCallbackFunction( CombatRecordButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		CombatRecordSetXUIDForLocalController( f15_arg2 )
		NavigateToMenu( self, "CombatRecordZM", true, f15_arg2 )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( CombatRecordButton )
	self.CombatRecordButton = CombatRecordButton
	
	local PrestigeButton = CoD.PrestigeButton.new( f4_local1, controller )
	PrestigeButton:setLeftRight( false, false, 169.5, 548 )
	PrestigeButton:setTopBottom( true, false, 431.5, 647.5 )
	PrestigeButton.LockedHint:setText( Engine.Localize( "MENU_ZM_PRESTIGE_MODE_LOCKED_HINT" ) )
	PrestigeButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MPUI_PRESTIGE_MODE" ) )
	PrestigeButton:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f17_local0
	end )
	PrestigeButton:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	f4_local1:AddButtonCallbackFunction( PrestigeButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if not IsElementInState( f19_arg0, "Locked" ) then
			OpenOverlay( self, "Prestige_Main", f19_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if not IsElementInState( f20_arg0, "Locked" ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( PrestigeButton )
	self.PrestigeButton = PrestigeButton
	
	LeaderboardsButton.navigation = {
		left = CombatRecordButton,
		down = PrestigeButton
	}
	CombatRecordButton.navigation = {
		right = LeaderboardsButton
	}
	PrestigeButton.navigation = {
		up = LeaderboardsButton
	}
	CoD.Menu.AddNavigationHandler( f4_local1, self, controller )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		GoBack( self, f21_arg2 )
		return true
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetGlobalModelValueArg( "prestigeGameMode", Enum.eModes.MODE_INVALID )
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	LeaderboardsButton.id = "LeaderboardsButton"
	CombatRecordButton.id = "CombatRecordButton"
	PrestigeButton.id = "PrestigeButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f4_local1
	} )
	if not self:restoreState() then
		self.CombatRecordButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.LeaderboardsButton:close()
		element.CombatRecordButton:close()
		element.PrestigeButton:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BarracksZM.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

