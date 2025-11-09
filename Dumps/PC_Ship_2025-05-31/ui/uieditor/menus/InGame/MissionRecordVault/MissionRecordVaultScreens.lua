require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Resistance_inGame" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Objectives_inGame" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Operations_inGame" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_MapImage_inGame" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "nextMap" ), function ( model )
		DataSources.MissionRecordVaultMapInfo.getModel( f1_arg1 )
	end )
end

LUI.createMenu.MissionRecordVaultScreens = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MissionRecordVaultScreens" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MissionRecordVaultScreens.buttonPrompts" )
	local f3_local1 = self
	
	local MissionRecordVaultResistanceinGame = CoD.MissionRecordVault_Resistance_inGame.new( f3_local1, controller )
	MissionRecordVaultResistanceinGame:setLeftRight( true, false, 640, 1280 )
	MissionRecordVaultResistanceinGame:setTopBottom( true, false, 0, 360 )
	Engine.SetupUI3DWindow( controller, 2, 640, 360 )
	MissionRecordVaultResistanceinGame:setUI3DWindow( 2 )
	MissionRecordVaultResistanceinGame:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", nil, function ( model )
		MissionRecordVaultResistanceinGame:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultResistanceinGame )
	self.MissionRecordVaultResistanceinGame = MissionRecordVaultResistanceinGame
	
	local MissionRecordVaultObjectivesinGame = CoD.MissionRecordVault_Objectives_inGame.new( f3_local1, controller )
	MissionRecordVaultObjectivesinGame:setLeftRight( true, false, 0, 640 )
	MissionRecordVaultObjectivesinGame:setTopBottom( true, false, 0, 360 )
	Engine.SetupUI3DWindow( controller, 3, 640, 360 )
	MissionRecordVaultObjectivesinGame:setUI3DWindow( 3 )
	MissionRecordVaultObjectivesinGame.Subtitle:setText( Engine.Localize( "MENU_MISSION_OVERVIEW_CAP" ) )
	MissionRecordVaultObjectivesinGame:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", nil, function ( model )
		MissionRecordVaultObjectivesinGame:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultObjectivesinGame )
	self.MissionRecordVaultObjectivesinGame = MissionRecordVaultObjectivesinGame
	
	local MissionRecordVaultOperationsinGame = CoD.MissionRecordVault_Operations_inGame.new( f3_local1, controller )
	MissionRecordVaultOperationsinGame:setLeftRight( true, false, 0, 640 )
	MissionRecordVaultOperationsinGame:setTopBottom( true, false, 360, 720 )
	Engine.SetupUI3DWindow( controller, 1, 640, 360 )
	MissionRecordVaultOperationsinGame:setUI3DWindow( 1 )
	MissionRecordVaultOperationsinGame:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", nil, function ( model )
		MissionRecordVaultOperationsinGame:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultOperationsinGame )
	self.MissionRecordVaultOperationsinGame = MissionRecordVaultOperationsinGame
	
	local MissionRecordVaultMapImageinGame = CoD.MissionRecordVault_MapImage_inGame.new( f3_local1, controller )
	MissionRecordVaultMapImageinGame:setLeftRight( true, false, 640, 1280 )
	MissionRecordVaultMapImageinGame:setTopBottom( true, false, 360, 720 )
	Engine.SetupUI3DWindow( controller, 4, 640, 360 )
	MissionRecordVaultMapImageinGame:setUI3DWindow( 4 )
	MissionRecordVaultMapImageinGame:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", nil, function ( model )
		MissionRecordVaultMapImageinGame:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultMapImageinGame )
	self.MissionRecordVaultMapImageinGame = MissionRecordVaultMapImageinGame
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MissionRecordVaultResistanceinGame:close()
		element.MissionRecordVaultObjectivesinGame:close()
		element.MissionRecordVaultOperationsinGame:close()
		element.MissionRecordVaultMapImageinGame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MissionRecordVaultScreens.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

