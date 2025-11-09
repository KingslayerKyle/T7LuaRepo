require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Heading" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Resistance" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Operations" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Objectives" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_MapImage" )

CoD.MissionRecordVault_Overview = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Overview.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Overview )
	self.id = "MissionRecordVault_Overview"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 534 )
	
	local MapImageBackground = LUI.UIImage.new()
	MapImageBackground:setLeftRight( true, false, 491, 950 )
	MapImageBackground:setTopBottom( true, false, 71, 251 )
	MapImageBackground:setRGB( 0.36, 0.36, 0.36 )
	MapImageBackground:setAlpha( 0.5 )
	MapImageBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( MapImageBackground )
	self.MapImageBackground = MapImageBackground
	
	local MissionRecordVaultHeading = CoD.MissionRecordVault_Heading.new( menu, controller )
	MissionRecordVaultHeading:setLeftRight( true, false, 0, 404 )
	MissionRecordVaultHeading:setTopBottom( true, false, 0, 100.43 )
	MissionRecordVaultHeading:setRGB( 1, 1, 1 )
	MissionRecordVaultHeading.Subtitle:setText( Engine.Localize( "MENU_MISSION_OVERVIEW" ) )
	MissionRecordVaultHeading:linkToElementModel( self, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MissionRecordVaultHeading.Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MissionRecordVaultHeading )
	self.MissionRecordVaultHeading = MissionRecordVaultHeading
	
	local MissionRecordVaultResistance = CoD.MissionRecordVault_Resistance.new( menu, controller )
	MissionRecordVaultResistance:setLeftRight( true, false, 508, 950 )
	MissionRecordVaultResistance:setTopBottom( true, false, 265, 500 )
	MissionRecordVaultResistance:setRGB( 1, 1, 1 )
	MissionRecordVaultResistance:linkToElementModel( self, nil, false, function ( model )
		MissionRecordVaultResistance:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultResistance )
	self.MissionRecordVaultResistance = MissionRecordVaultResistance
	
	local MissionRecordVaultOperations = CoD.MissionRecordVault_Operations.new( menu, controller )
	MissionRecordVaultOperations:setLeftRight( true, false, 32, 500 )
	MissionRecordVaultOperations:setTopBottom( true, false, 265, 500 )
	MissionRecordVaultOperations:setRGB( 1, 1, 1 )
	MissionRecordVaultOperations:linkToElementModel( self, nil, false, function ( model )
		MissionRecordVaultOperations:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultOperations )
	self.MissionRecordVaultOperations = MissionRecordVaultOperations
	
	local MissionRecordVaultObjectives = CoD.MissionRecordVault_Objectives.new( menu, controller )
	MissionRecordVaultObjectives:setLeftRight( true, false, 32, 491 )
	MissionRecordVaultObjectives:setTopBottom( true, false, 71, 251 )
	MissionRecordVaultObjectives:setRGB( 1, 1, 1 )
	MissionRecordVaultObjectives:linkToElementModel( self, nil, false, function ( model )
		MissionRecordVaultObjectives:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultObjectives )
	self.MissionRecordVaultObjectives = MissionRecordVaultObjectives
	
	local MissionRecordVaultMapImage = CoD.MissionRecordVault_MapImage.new( menu, controller )
	MissionRecordVaultMapImage:setLeftRight( true, false, 623, 941 )
	MissionRecordVaultMapImage:setTopBottom( true, false, 80.43, 239.43 )
	MissionRecordVaultMapImage:setRGB( 1, 1, 1 )
	MissionRecordVaultMapImage:linkToElementModel( self, nil, false, function ( model )
		MissionRecordVaultMapImage:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultMapImage )
	self.MissionRecordVaultMapImage = MissionRecordVaultMapImage
	
	self.close = function ( self )
		self.MissionRecordVaultHeading:close()
		self.MissionRecordVaultResistance:close()
		self.MissionRecordVaultOperations:close()
		self.MissionRecordVaultObjectives:close()
		self.MissionRecordVaultMapImage:close()
		CoD.MissionRecordVault_Overview.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

