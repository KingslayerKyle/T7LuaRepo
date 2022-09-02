-- 00c0d279f37ba9fae242b00ad3c293d4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_ChallengeSelectedInfo" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Heading" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_ChallengeRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_lines" )

local PostLoadFunc = function ( self, controller, menu )
	local f1_local0 = Engine.CreateModel( menu:getModel(), "selectedAccolade" )
	Engine.CreateModel( f1_local0, "rewardName" )
	Engine.CreateModel( f1_local0, "rewardImage" )
	Engine.CreateModel( f1_local0, "challengeWidget" )
	Engine.CreateModel( f1_local0, "centerText" )
	Engine.CreateModel( f1_local0, "challengeProgressQuantity" )
	Engine.CreateModel( f1_local0, "challengeName" )
	Engine.CreateModel( f1_local0, "challengeDetails" )
	Engine.CreateModel( f1_local0, "completed" )
	if IsCurrentMenu( menu, "CPAAR" ) then
		local f1_local1 = CoD.mapsTable[Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "aarAccoladeMapName" ) )]
		self.challengeList:setDataSource( "AARAccolades" )
		self.MissionRecordVaultHeading.Title:setText( Engine.Localize( f1_local1.mapName ) )
	end
end

CoD.MissionRecordVault_Challenges = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Challenges.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Challenges )
	self.id = "MissionRecordVault_Challenges"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local TitleBG = LUI.UIImage.new()
	TitleBG:setLeftRight( true, false, -80, 469.86 )
	TitleBG:setTopBottom( true, false, 5, 75 )
	TitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_pri_title_bg" ) )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local MissionRecordVaultChallengeSelectedInfo = CoD.MissionRecordVault_ChallengeSelectedInfo.new( menu, controller )
	MissionRecordVaultChallengeSelectedInfo:setLeftRight( true, false, -13.14, 423.86 )
	MissionRecordVaultChallengeSelectedInfo:setTopBottom( true, false, 83, 516 )
	self:addElement( MissionRecordVaultChallengeSelectedInfo )
	self.MissionRecordVaultChallengeSelectedInfo = MissionRecordVaultChallengeSelectedInfo
	
	local Subtitle = LUI.UITightText.new()
	Subtitle:setLeftRight( true, false, 9.86, 299.86 )
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
	MissionRecordVaultHeading:setLeftRight( true, false, -9, 500 )
	MissionRecordVaultHeading:setTopBottom( true, false, -3, 100 )
	MissionRecordVaultHeading:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "mapName", function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			MissionRecordVaultHeading.Title:setText( LocalizeToUpperString( mapName ) )
		end
	end )
	self:addElement( MissionRecordVaultHeading )
	self.MissionRecordVaultHeading = MissionRecordVaultHeading
	
	local challengeList = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	challengeList:makeFocusable()
	challengeList:setLeftRight( true, false, 469.86, 1147.86 )
	challengeList:setTopBottom( true, false, 3.56, 501.56 )
	challengeList:setWidgetType( CoD.MissionRecordVault_ChallengeRow )
	challengeList:setHorizontalCount( 4 )
	challengeList:setVerticalCount( 4 )
	challengeList:setSpacing( 10 )
	challengeList:setVerticalCounter( CoD.verticalCounter )
	challengeList:setDataSource( "MissionRecordVaultChallengeInfo" )
	challengeList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f4_local0 = nil
		MRV_SelectAccolade( menu, element, controller )
		return f4_local0
	end )
	self:addElement( challengeList )
	self.challengeList = challengeList
	
	local MissionRecordVaultlines01 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines01:setLeftRight( true, false, -33.14, 1210 )
	MissionRecordVaultlines01:setTopBottom( true, false, 383.56, 387.56 )
	MissionRecordVaultlines01:setAlpha( 0.35 )
	self:addElement( MissionRecordVaultlines01 )
	self.MissionRecordVaultlines01 = MissionRecordVaultlines01
	
	local MissionRecordVaultlines02 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines02:setLeftRight( true, false, -8.14, 1235 )
	MissionRecordVaultlines02:setTopBottom( true, false, 499.56, 503.56 )
	MissionRecordVaultlines02:setAlpha( 0.35 )
	self:addElement( MissionRecordVaultlines02 )
	self.MissionRecordVaultlines02 = MissionRecordVaultlines02
	
	MissionRecordVaultChallengeSelectedInfo:linkToElementModel( challengeList, nil, false, function ( model )
		MissionRecordVaultChallengeSelectedInfo:setModel( model, controller )
	end )
	challengeList.id = "challengeList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.challengeList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MissionRecordVaultChallengeSelectedInfo:close()
		element.MissionRecordVaultHeading:close()
		element.challengeList:close()
		element.MissionRecordVaultlines01:close()
		element.MissionRecordVaultlines02:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

