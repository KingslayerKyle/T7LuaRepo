require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordMedals" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordMP" )
require( "ui.uieditor.menus.Leaderboard.Leaderboard_Main" )
require( "ui.uieditor.menus.Prestige.Prestige_Main" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Barracks.CombatRecordButton" )
require( "ui.uieditor.widgets.Barracks.LeaderboardsButton" )
require( "ui.uieditor.widgets.Barracks.MedalsButton" )
require( "ui.uieditor.widgets.Barracks.PrestigeButton" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )

local PreLoadFunc = function ( self, controller )
	SetGlobalModelValueArg( "prestigeGameMode", Enum.eModes.MODE_MULTIPLAYER )
	CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( controller )
	self.disablePopupOpenCloseAnim = true
end

local PostLoadFunc = function ( self, controller )
	self.originalOcclusionChange = self.m_eventHandlers.occlusion_change
	self:registerEventHandler( "occlusion_change", function ( self, event )
		if not event.occluded then
			UpdateElementState( self, "PrestigeButton", controller )
		end
		self:originalOcclusionChange( event )
	end )
end

LUI.createMenu.BarracksMP = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BarracksMP" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BarracksMP.buttonPrompts" )
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
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_BARRACKS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BARRACKS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( 1, 1, -652, -138 )
	SelfIdentityBadge:setTopBottom( 0, 0, 35, 125 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local CombatRecordButton = CoD.CombatRecordButton.new( self, controller )
	CombatRecordButton:setLeftRight( 0.5, 0.5, -822, 238 )
	CombatRecordButton:setTopBottom( 0, 0, 165.5, 612.5 )
	CombatRecordButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "FEATURE_COMBAT_RECORD" ) )
	CombatRecordButton:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CombatRecordButton.RankName:setText( Engine.Localize( RankTitleFromStorage( controller, "mp", modelValue ) ) )
		end
	end )
	CombatRecordButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CombatRecordButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( CombatRecordButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		CombatRecordSetXUIDForLocalController( controller )
		NavigateToMenu( self, "CombatRecordMP", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( CombatRecordButton )
	self.CombatRecordButton = CombatRecordButton
	
	local MedalsButton = CoD.MedalsButton.new( self, controller )
	MedalsButton:setLeftRight( 0.5, 0.5, -822, 238 )
	MedalsButton:setTopBottom( 0, 0, 647, 971 )
	MedalsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_MEDALS" ) )
	MedalsButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MedalsButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( MedalsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "CombatRecordMedals", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( MedalsButton )
	self.MedalsButton = MedalsButton
	
	local LeaderboardsButton = CoD.LeaderboardsButton.new( self, controller )
	LeaderboardsButton:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsBooleanDvarSet( "tu1_build" )
			end
		}
	} )
	LeaderboardsButton:setLeftRight( 0.5, 0.5, 254, 822 )
	LeaderboardsButton:setTopBottom( 0, 0, 166, 613 )
	LeaderboardsButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_LEADERBOARDS" ) )
	LeaderboardsButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	LeaderboardsButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( LeaderboardsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsBooleanDvarSet( "tu1_build" ) then
			NavigateToMenu( self, "Leaderboard_Main", true, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsBooleanDvarSet( "tu1_build" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( LeaderboardsButton )
	self.LeaderboardsButton = LeaderboardsButton
	
	local PrestigeButton = CoD.PrestigeButton.new( self, controller )
	PrestigeButton:setLeftRight( 0.5, 0.5, 254, 822 )
	PrestigeButton:setTopBottom( 0, 0, 647, 971 )
	PrestigeButton.LockedHint:setText( Engine.Localize( "MENU_PRESTIGE_MODE_LOCKED_HINT" ) )
	PrestigeButton.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MPUI_PRESTIGE_MODE" ) )
	PrestigeButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	PrestigeButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( PrestigeButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Locked" ) then
			OpenOverlay( self, "Prestige_Main", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Locked" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( PrestigeButton )
	self.PrestigeButton = PrestigeButton
	
	SelfIdentityBadge.navigation = {
		down = LeaderboardsButton
	}
	CombatRecordButton.navigation = {
		right = LeaderboardsButton,
		down = MedalsButton
	}
	MedalsButton.navigation = {
		up = CombatRecordButton,
		right = PrestigeButton
	}
	LeaderboardsButton.navigation = {
		left = CombatRecordButton,
		up = SelfIdentityBadge,
		down = PrestigeButton
	}
	PrestigeButton.navigation = {
		left = MedalsButton,
		up = LeaderboardsButton
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetGlobalModelValueArg( "prestigeGameMode", Enum.eModes.MODE_INVALID )
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	SelfIdentityBadge.id = "SelfIdentityBadge"
	CombatRecordButton.id = "CombatRecordButton"
	MedalsButton.id = "MedalsButton"
	LeaderboardsButton.id = "LeaderboardsButton"
	PrestigeButton.id = "PrestigeButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.CombatRecordButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.FEMenuLeftGraphics:close()
		self.MenuFrame:close()
		self.SelfIdentityBadge:close()
		self.CombatRecordButton:close()
		self.MedalsButton:close()
		self.LeaderboardsButton:close()
		self.PrestigeButton:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BarracksMP.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

