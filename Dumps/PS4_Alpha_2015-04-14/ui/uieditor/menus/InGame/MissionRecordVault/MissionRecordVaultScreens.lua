require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Objectives" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Operations" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_MapImage" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Resistance" )

LUI.createMenu.MissionRecordVaultScreens = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MissionRecordVaultScreens" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local MissionRecordVaultObjectives = CoD.MissionRecordVault_Objectives.new( menu, controller )
	MissionRecordVaultObjectives:setLeftRight( true, false, 36, 495 )
	MissionRecordVaultObjectives:setTopBottom( true, false, 282, 462 )
	Engine.SetupUI3DWindow( 1, 459, 180 )
	MissionRecordVaultObjectives:setUI3DWindow( 1 )
	MissionRecordVaultObjectives:setRGB( 1, 1, 1 )
	MissionRecordVaultObjectives:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", nil, function ( model )
		MissionRecordVaultObjectives:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultObjectives )
	self.MissionRecordVaultObjectives = MissionRecordVaultObjectives
	
	local MissionRecordVaultOperations = CoD.MissionRecordVault_Operations.new( menu, controller )
	MissionRecordVaultOperations:setLeftRight( true, false, 513, 1008 )
	MissionRecordVaultOperations:setTopBottom( true, false, 0, 276 )
	Engine.SetupUI3DWindow( 2, 495, 276 )
	MissionRecordVaultOperations:setUI3DWindow( 2 )
	MissionRecordVaultOperations:setRGB( 1, 1, 1 )
	MissionRecordVaultOperations:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", nil, function ( model )
		MissionRecordVaultOperations:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultOperations )
	self.MissionRecordVaultOperations = MissionRecordVaultOperations
	
	local MissionRecordVaultMapImage = CoD.MissionRecordVault_MapImage.new( menu, controller )
	MissionRecordVaultMapImage:setLeftRight( true, false, 561, 879 )
	MissionRecordVaultMapImage:setTopBottom( true, false, 292.5, 451.5 )
	Engine.SetupUI3DWindow( 4, 318, 159 )
	MissionRecordVaultMapImage:setUI3DWindow( 4 )
	MissionRecordVaultMapImage:setRGB( 1, 1, 1 )
	MissionRecordVaultMapImage:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", nil, function ( model )
		MissionRecordVaultMapImage:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultMapImage )
	self.MissionRecordVaultMapImage = MissionRecordVaultMapImage
	
	local MissionRecordVaultResistance = CoD.MissionRecordVault_Resistance.new( menu, controller )
	MissionRecordVaultResistance:setLeftRight( true, false, 12, 495 )
	MissionRecordVaultResistance:setTopBottom( true, false, 0, 268 )
	Engine.SetupUI3DWindow( 3, 483, 268 )
	MissionRecordVaultResistance:setUI3DWindow( 3 )
	MissionRecordVaultResistance:setRGB( 1, 1, 1 )
	MissionRecordVaultResistance:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", nil, function ( model )
		MissionRecordVaultResistance:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultResistance )
	self.MissionRecordVaultResistance = MissionRecordVaultResistance
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	self.close = function ( self )
		self.MissionRecordVaultObjectives:close()
		self.MissionRecordVaultOperations:close()
		self.MissionRecordVaultMapImage:close()
		self.MissionRecordVaultResistance:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

