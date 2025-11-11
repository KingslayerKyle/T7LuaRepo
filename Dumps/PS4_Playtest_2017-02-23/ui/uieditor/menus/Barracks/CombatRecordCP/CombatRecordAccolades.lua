require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Barracks.CombatRecordAccoladeMissionSelector" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabIdle" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_ChallengeRow" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_ChallengeSelectedInfo" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )

local PreLoadFunc = function ( self, controller )
	SetGlobalModelValueTrue( "inBarracks" )
	local combatRecordAccoladeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordAccolades" )
	local mapNameModel = Engine.CreateModel( combatRecordAccoladeModel, "mapName" )
	local mapUniqueIdModel = Engine.CreateModel( combatRecordAccoladeModel, "unique_id" )
	local nextMapNameModel = Engine.CreateModel( Engine.GetGlobalModel(), "nextMap" )
	self:setModel( combatRecordAccoladeModel )
end

local PostLoadFunc = function ( self, controller )
	local combatRecordAccoladeModel = Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordAccolades" )
	local nextMapNameModel = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
	self.AccoladeList:subscribeToModel( nextMapNameModel, function ( model )
		self.AccoladeList:updateDataSource()
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		if LUI.DEV then
			local modelsAreDifferent = LUI.DEV.ErrorIfModelsDoNotMatch( combatRecordAccoladeModel, Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordAccolades" ) )
		end
		Engine.UnsubscribeAndFreeModel( combatRecordAccoladeModel )
	end )
end

LUI.createMenu.CombatRecordAccolades = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordAccolades" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordAccolades.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
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
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_ACCOLADES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_ACCOLADES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_accolades" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( 0, 0, 274, 578 )
	Backing:setTopBottom( 0, 0, 129, 183 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0.6 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local CombatRecordAccoladeMissionSelector = CoD.CombatRecordAccoladeMissionSelector.new( self, controller )
	CombatRecordAccoladeMissionSelector:setLeftRight( 0.5, 0.5, -744, -324 )
	CombatRecordAccoladeMissionSelector:setTopBottom( 0, 0, 127, 194 )
	self:addElement( CombatRecordAccoladeMissionSelector )
	self.CombatRecordAccoladeMissionSelector = CombatRecordAccoladeMissionSelector
	
	local MissionRecordVaultChallengeSelectedInfo = CoD.MissionRecordVault_ChallengeSelectedInfo.new( self, controller )
	MissionRecordVaultChallengeSelectedInfo:setLeftRight( 0.5, 0.5, -864, -204 )
	MissionRecordVaultChallengeSelectedInfo:setTopBottom( 0, 0, 278, 926 )
	self:addElement( MissionRecordVaultChallengeSelectedInfo )
	self.MissionRecordVaultChallengeSelectedInfo = MissionRecordVaultChallengeSelectedInfo
	
	local AccoladeList = LUI.UIList.new( self, controller, 15, 0, nil, false, false, 0, 0, false, false )
	AccoladeList:makeFocusable()
	AccoladeList:setLeftRight( 0.5, 0.5, -195, 822 )
	AccoladeList:setTopBottom( 0, 0, 202, 947 )
	AccoladeList:setWidgetType( CoD.MissionRecordVault_ChallengeRow )
	AccoladeList:setHorizontalCount( 4 )
	AccoladeList:setVerticalCount( 4 )
	AccoladeList:setSpacing( 15 )
	AccoladeList:setVerticalCounter( CoD.verticalCounter )
	AccoladeList:setDataSource( "MissionRecordVaultChallengeInfo" )
	AccoladeList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		MRV_SelectAccolade( self, element, controller )
		return retVal
	end )
	self:addElement( AccoladeList )
	self.AccoladeList = AccoladeList
	
	local FETabIdle0 = CoD.FE_TabIdle.new( self, controller )
	FETabIdle0:setLeftRight( 0, 0, -3, 1998 )
	FETabIdle0:setTopBottom( 0, 0, 122, 186 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	MissionRecordVaultChallengeSelectedInfo:linkToElementModel( AccoladeList, nil, false, function ( model )
		MissionRecordVaultChallengeSelectedInfo:setModel( model, controller )
	end )
	MenuFrame.navigation = {
		right = AccoladeList,
		down = AccoladeList
	}
	AccoladeList.navigation = {
		left = MenuFrame,
		up = MenuFrame
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode( "" )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		CombatRecordAccoladesChangeMap( self, controller, element, "-1" )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		CombatRecordAccoladesChangeMap( self, controller, element, "1" )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
		return false
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetGlobalModelValueFalse( "inBarracks" )
		ClearMenuSavedState( self )
		ClearSavedState( self, controller )
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	MenuFrame.id = "MenuFrame"
	AccoladeList.id = "AccoladeList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.AccoladeList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.MenuFrame:close()
		self.CombatRecordAccoladeMissionSelector:close()
		self.MissionRecordVaultChallengeSelectedInfo:close()
		self.AccoladeList:close()
		self.FETabIdle0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordAccolades.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

