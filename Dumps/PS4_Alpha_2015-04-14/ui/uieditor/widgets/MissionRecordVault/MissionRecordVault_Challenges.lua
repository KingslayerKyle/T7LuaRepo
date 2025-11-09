require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_ChallengeRow" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_ChallengeSelectedInfo" )

local PostLoadFunc = function ( self, controller, menu )
	local selectedAccoladeModel = Engine.CreateModel( menu:getModel(), "selectedAccolade" )
	Engine.CreateModel( selectedAccoladeModel, "rewardName" )
	Engine.CreateModel( selectedAccoladeModel, "rewardImage" )
	Engine.CreateModel( selectedAccoladeModel, "challengeImage" )
	Engine.CreateModel( selectedAccoladeModel, "centerTextBlack" )
	Engine.CreateModel( selectedAccoladeModel, "centerTextWhite" )
	Engine.CreateModel( selectedAccoladeModel, "challengeProgressQuantity" )
	Engine.CreateModel( selectedAccoladeModel, "challengeName" )
	Engine.CreateModel( selectedAccoladeModel, "challengeDetails" )
	Engine.CreateModel( selectedAccoladeModel, "completed" )
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
	self:setTopBottom( true, false, 0, 534 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local challengeList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	challengeList:makeFocusable()
	challengeList:setLeftRight( true, false, 346, 1152 )
	challengeList:setTopBottom( true, false, 0, 506 )
	challengeList:setRGB( 1, 1, 1 )
	challengeList:setDataSource( "MissionRecordVaultChallengeInfo" )
	challengeList:setWidgetType( CoD.MissionRecordVault_ChallengeRow )
	challengeList:setHorizontalCount( 4 )
	challengeList:setVerticalCount( 4 )
	challengeList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		MRV_SelectAccolade( menu, element, controller )
		return retVal
	end )
	self:addElement( challengeList )
	self.challengeList = challengeList
	
	local MissionRecordVaultChallengeSelectedInfo = CoD.MissionRecordVault_ChallengeSelectedInfo.new( menu, controller )
	MissionRecordVaultChallengeSelectedInfo:setLeftRight( true, false, 46, 303 )
	MissionRecordVaultChallengeSelectedInfo:setTopBottom( true, false, 35, 504 )
	MissionRecordVaultChallengeSelectedInfo:setRGB( 1, 1, 1 )
	MissionRecordVaultChallengeSelectedInfo:linkToElementModel( self, "selectedAccolade", false, function ( model )
		MissionRecordVaultChallengeSelectedInfo:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultChallengeSelectedInfo )
	self.MissionRecordVaultChallengeSelectedInfo = MissionRecordVaultChallengeSelectedInfo
	
	challengeList.id = "challengeList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.challengeList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.challengeList:close()
		self.MissionRecordVaultChallengeSelectedInfo:close()
		CoD.MissionRecordVault_Challenges.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

