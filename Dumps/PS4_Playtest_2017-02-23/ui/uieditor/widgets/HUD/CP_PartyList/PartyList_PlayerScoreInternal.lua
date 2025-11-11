require( "ui.uieditor.widgets.HUD.CP_PartyList.PartyList_ClanContainer" )
require( "ui.uieditor.widgets.HUD.CP_PartyList.PartyList_ScoreRankIcon" )

local PreLoadFunc = function ( self, controller )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), "updateClientDeadStatus" )
	if model == nil then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "updateClientDeadStatus" ), 0 )
	end
end

local PostLoadFunc = function ( self, controller )
	self.setModel = function ( self, model, controller )
		self.super:setModel( model, controller )
		if self:getParent() then
			local f3_local0 = self:getParent()
			f3_local0:updatePlayerScoreWidgetLayout()
		end
	end
	
end

CoD.PartyList_PlayerScoreInternal = InheritFrom( LUI.UIElement )
CoD.PartyList_PlayerScoreInternal.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 1
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PartyList_PlayerScoreInternal )
	self.id = "PartyList_PlayerScoreInternal"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 385 )
	self:setTopBottom( 0, 0, 0, 27 )
	self.anyChildUsesUpdateState = true
	
	local Gamertag = LUI.UITightText.new()
	Gamertag:setLeftRight( 0, 0, 278, 386 )
	Gamertag:setTopBottom( 0, 0, 3, 27 )
	Gamertag:setAlpha( 0.8 )
	Gamertag:setTTF( "fonts/escom.ttf" )
	Gamertag:linkToElementModel( self, "playerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Gamertag:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local ClanContainer = CoD.PartyList_ClanContainer.new( menu, controller )
	ClanContainer:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueNonEmptyString( element, controller, "clanAbbrev" )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	ClanContainer:linkToElementModel( ClanContainer, "clanAbbrev", true, function ( model )
		menu:updateElementState( ClanContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clanAbbrev"
		} )
	end )
	ClanContainer:setLeftRight( 0, 0, 216, 276 )
	ClanContainer:setTopBottom( 0, 0, 0, 27 )
	ClanContainer:setAlpha( 0.8 )
	ClanContainer:linkToElementModel( self, nil, false, function ( model )
		ClanContainer:setModel( model, controller )
	end )
	self:addElement( ClanContainer )
	self.ClanContainer = ClanContainer
	
	local ScoreRankIcon = CoD.PartyList_ScoreRankIcon.new( menu, controller )
	ScoreRankIcon:mergeStateConditions( {
		{
			stateName = "PlayerDead",
			condition = function ( menu, element, event )
				return IsPlayerDead( element, controller )
			end
		}
	} )
	ScoreRankIcon:setLeftRight( 0, 0, 193, 214 )
	ScoreRankIcon:setTopBottom( 0, 0, 3, 24 )
	ScoreRankIcon:linkToElementModel( self, "playerRankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreRankIcon.rankImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ScoreRankIcon )
	self.ScoreRankIcon = ScoreRankIcon
	
	local LblRank = LUI.UITightText.new()
	LblRank:setLeftRight( 0, 0, 171, 192 )
	LblRank:setTopBottom( 0, 0, 3, 27 )
	LblRank:setAlpha( 0.8 )
	LblRank:setTTF( "fonts/escom.ttf" )
	LblRank:linkToElementModel( self, "rankNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LblRank:setText( Engine.Localize( RankToLevelNumber( "cp", modelValue ) ) )
		end
	end )
	self:addElement( LblRank )
	self.LblRank = LblRank
	
	local voipCustomElement = LUI.UIImage.new()
	voipCustomElement:setLeftRight( 0, 0, 149, 170 )
	voipCustomElement:setTopBottom( 0, 0, 3, 24 )
	self:addElement( voipCustomElement )
	self.voipCustomElement = voipCustomElement
	
	self.voipCustomElement:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			voipCustomElement:setupVoipImage( modelValue )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ClanContainer:close()
		self.ScoreRankIcon:close()
		self.Gamertag:close()
		self.LblRank:close()
		self.voipCustomElement:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

