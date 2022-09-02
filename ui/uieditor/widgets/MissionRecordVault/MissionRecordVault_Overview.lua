-- 0874d373fff4954908fdbac3eef44c71
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Resistance" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Operations" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Objectives" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Heading" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_FrameBG" )

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
	self:setTopBottom( true, false, 0, 520 )
	self.anyChildUsesUpdateState = true
	
	local TitleBG = LUI.UIImage.new()
	TitleBG:setLeftRight( true, false, -80, 399 )
	TitleBG:setTopBottom( true, false, 5, 75 )
	TitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_pri_title_bg" ) )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local MissionRecordVaultResistance = CoD.MissionRecordVault_Resistance.new( menu, controller )
	MissionRecordVaultResistance:setLeftRight( false, true, -703.68, 108 )
	MissionRecordVaultResistance:setTopBottom( false, true, -227, 9 )
	MissionRecordVaultResistance:linkToElementModel( self, nil, false, function ( model )
		MissionRecordVaultResistance:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultResistance )
	self.MissionRecordVaultResistance = MissionRecordVaultResistance
	
	local MissionRecordVaultOperations = CoD.MissionRecordVault_Operations.new( menu, controller )
	MissionRecordVaultOperations:setLeftRight( true, false, -32, 437.32 )
	MissionRecordVaultOperations:setTopBottom( false, true, -251, -4 )
	MissionRecordVaultOperations:linkToElementModel( self, nil, false, function ( model )
		MissionRecordVaultOperations:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultOperations )
	self.MissionRecordVaultOperations = MissionRecordVaultOperations
	
	local MissionRecordVaultObjectives = CoD.MissionRecordVault_Objectives.new( menu, controller )
	MissionRecordVaultObjectives:setLeftRight( true, false, -37, 432 )
	MissionRecordVaultObjectives:setTopBottom( true, false, -26, 289 )
	MissionRecordVaultObjectives:linkToElementModel( self, nil, false, function ( model )
		MissionRecordVaultObjectives:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultObjectives )
	self.MissionRecordVaultObjectives = MissionRecordVaultObjectives
	
	local Subtitle = LUI.UITightText.new()
	Subtitle:setLeftRight( true, false, 10, 300 )
	Subtitle:setTopBottom( true, false, 50, 68 )
	Subtitle:setAlpha( 0.5 )
	Subtitle:setText( Engine.Localize( "MENU_MISSION_OVERVIEW_CAP" ) )
	Subtitle:setTTF( "fonts/escom.ttf" )
	Subtitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Subtitle:setShaderVector( 0, 0.06, 0, 0, 0 )
	Subtitle:setShaderVector( 1, 0.02, 0, 0, 0 )
	Subtitle:setShaderVector( 2, 1, 0, 0, 0 )
	Subtitle:setLetterSpacing( 1 )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local MissionRecordVaultHeading = CoD.MissionRecordVault_Heading.new( menu, controller )
	MissionRecordVaultHeading:setLeftRight( true, false, -9, 521 )
	MissionRecordVaultHeading:setTopBottom( true, false, -3, 100 )
	MissionRecordVaultHeading:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "mapName", function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			MissionRecordVaultHeading.Title:setText( LocalizeToUpperString( mapName ) )
		end
	end )
	self:addElement( MissionRecordVaultHeading )
	self.MissionRecordVaultHeading = MissionRecordVaultHeading
	
	local MissionRecordVaultFrameBG0 = CoD.MissionRecordVault_FrameBG.new( menu, controller )
	MissionRecordVaultFrameBG0:setLeftRight( false, true, -658, -71 )
	MissionRecordVaultFrameBG0:setTopBottom( true, false, 6, 287 )
	self:addElement( MissionRecordVaultFrameBG0 )
	self.MissionRecordVaultFrameBG0 = MissionRecordVaultFrameBG0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MissionRecordVaultResistance:close()
		element.MissionRecordVaultOperations:close()
		element.MissionRecordVaultObjectives:close()
		element.MissionRecordVaultHeading:close()
		element.MissionRecordVaultFrameBG0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

