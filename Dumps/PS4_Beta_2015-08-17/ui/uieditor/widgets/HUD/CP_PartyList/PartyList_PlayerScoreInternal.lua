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
		local f3_local0 = self:getParent()
		f3_local0:updatePlayerScoreWidgetLayout()
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
	self:setLeftRight( true, false, 0, 257 )
	self:setTopBottom( true, false, 0, 18 )
	self.anyChildUsesUpdateState = true
	
	local Gamertag = LUI.UITightText.new()
	Gamertag:setLeftRight( false, true, -72, 0 )
	Gamertag:setTopBottom( false, false, -7.17, 8.83 )
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
	ClanContainer:setLeftRight( true, false, 144, 184 )
	ClanContainer:setTopBottom( true, false, 0, 17.67 )
	ClanContainer:setAlpha( 0.8 )
	ClanContainer:linkToElementModel( self, nil, false, function ( model )
		ClanContainer:setModel( model, controller )
	end )
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
	self:addElement( ClanContainer )
	self.ClanContainer = ClanContainer
	
	local ScoreRankIcon = CoD.PartyList_ScoreRankIcon.new( menu, controller )
	ScoreRankIcon:setLeftRight( true, false, 129, 143 )
	ScoreRankIcon:setTopBottom( true, false, 1.67, 15.67 )
	ScoreRankIcon:linkToElementModel( self, "playerRankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreRankIcon.rankImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	ScoreRankIcon:mergeStateConditions( {
		{
			stateName = "PlayerDead",
			condition = function ( menu, element, event )
				return IsPlayerDead( element, controller )
			end
		}
	} )
	ScoreRankIcon:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "updateClientDeadStatus" ), function ( model )
		menu:updateElementState( ScoreRankIcon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "updateClientDeadStatus"
		} )
	end )
	self:addElement( ScoreRankIcon )
	self.ScoreRankIcon = ScoreRankIcon
	
	local LblRank = LUI.UITightText.new()
	LblRank:setLeftRight( false, true, -143, -129 )
	LblRank:setTopBottom( false, false, -7.17, 8.83 )
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
	voipCustomElement:setLeftRight( false, true, -158, -144 )
	voipCustomElement:setTopBottom( false, false, -7.17, 6.83 )
	self:addElement( voipCustomElement )
	self.voipCustomElement = voipCustomElement
	
	self.voipCustomElement:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			voipCustomElement:setupVoipImage( modelValue )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 1, 1 )
				self.clipFinished( Gamertag, {} )
				ClanContainer:completeAnimation()
				self.ClanContainer:setRGB( 1, 1, 1 )
				self.clipFinished( ClanContainer, {} )
				LblRank:completeAnimation()
				self.LblRank:setRGB( 1, 1, 1 )
				self.clipFinished( LblRank, {} )
			end
		}
	}
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

