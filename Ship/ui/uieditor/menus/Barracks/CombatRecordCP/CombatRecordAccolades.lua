-- f17c7d4fd2ae1eff62ee458a6eeabaae
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Barracks.CombatRecordAccoladeMissionSelector" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_ChallengeSelectedInfo" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_ChallengeRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabIdle" )

local PreLoadFunc = function ( self, controller )
	SetGlobalModelValueTrue( "inBarracks" )
	local f1_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordAccolades" )
	local f1_local1 = Engine.CreateModel( f1_local0, "mapName" )
	local f1_local2 = Engine.CreateModel( f1_local0, "unique_id" )
	local f1_local3 = Engine.CreateModel( Engine.GetGlobalModel(), "nextMap" )
	self:setModel( f1_local0 )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "CombatRecordAccolades" )
	f2_arg0.AccoladeList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "nextMap" ), function ( model )
		f2_arg0.AccoladeList:updateDataSource()
	end )
	LUI.OverrideFunction_CallOriginalFirst( f2_arg0, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( f2_local0 )
	end )
end

LUI.createMenu.CombatRecordAccolades = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordAccolades" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordAccolades.buttonPrompts" )
	local f5_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( f5_local1, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( f5_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_ACCOLADES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_ACCOLADES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_accolades" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( true, false, 182.75, 385.75 )
	Backing:setTopBottom( true, false, 85.68, 121.68 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0.6 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local CombatRecordAccoladeMissionSelector = CoD.CombatRecordAccoladeMissionSelector.new( f5_local1, controller )
	CombatRecordAccoladeMissionSelector:setLeftRight( false, false, -496, -216 )
	CombatRecordAccoladeMissionSelector:setTopBottom( true, false, 84.68, 129.68 )
	self:addElement( CombatRecordAccoladeMissionSelector )
	self.CombatRecordAccoladeMissionSelector = CombatRecordAccoladeMissionSelector
	
	local MissionRecordVaultChallengeSelectedInfo = CoD.MissionRecordVault_ChallengeSelectedInfo.new( f5_local1, controller )
	MissionRecordVaultChallengeSelectedInfo:setLeftRight( false, false, -576, -136 )
	MissionRecordVaultChallengeSelectedInfo:setTopBottom( true, false, 185.18, 617.18 )
	self:addElement( MissionRecordVaultChallengeSelectedInfo )
	self.MissionRecordVaultChallengeSelectedInfo = MissionRecordVaultChallengeSelectedInfo
	
	local AccoladeList = LUI.UIList.new( f5_local1, controller, 10, 0, nil, false, false, 0, 0, false, false )
	AccoladeList:makeFocusable()
	AccoladeList:setLeftRight( false, false, -130, 548 )
	AccoladeList:setTopBottom( true, false, 134.18, 632.18 )
	AccoladeList:setWidgetType( CoD.MissionRecordVault_ChallengeRow )
	AccoladeList:setHorizontalCount( 4 )
	AccoladeList:setVerticalCount( 4 )
	AccoladeList:setSpacing( 10 )
	AccoladeList:setVerticalCounter( CoD.verticalCounter )
	AccoladeList:setDataSource( "MissionRecordVaultChallengeInfo" )
	AccoladeList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f6_local0 = nil
		MRV_SelectAccolade( f5_local1, element, controller )
		return f6_local0
	end )
	self:addElement( AccoladeList )
	self.AccoladeList = AccoladeList
	
	local FETabIdle0 = CoD.FE_TabIdle.new( f5_local1, controller )
	FETabIdle0:setLeftRight( true, false, -2, 1332 )
	FETabIdle0:setTopBottom( true, false, 81, 123.68 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	MissionRecordVaultChallengeSelectedInfo:linkToElementModel( AccoladeList, nil, false, function ( model )
		MissionRecordVaultChallengeSelectedInfo:setModel( model, controller )
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f8_local0 = nil
		ShowHeaderKickerAndIcon( f5_local1 )
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode( "" )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	f5_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		GoBack( self, f9_arg2 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f5_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		CombatRecordAccoladesChangeMap( self, f11_arg2, f11_arg0, "-1" )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_LB, "" )
		return false
	end, false )
	f5_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		CombatRecordAccoladesChangeMap( self, f13_arg2, f13_arg0, "1" )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_RB, "" )
		return false
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetGlobalModelValueFalse( "inBarracks" )
		ClearMenuSavedState( f5_local1 )
		ClearSavedState( self, controller )
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	AccoladeList.id = "AccoladeList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f5_local1
	} )
	if not self:restoreState() then
		self.AccoladeList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.MenuFrame:close()
		element.CombatRecordAccoladeMissionSelector:close()
		element.MissionRecordVaultChallengeSelectedInfo:close()
		element.AccoladeList:close()
		element.FETabIdle0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordAccolades.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

