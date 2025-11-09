require( "ui.uieditor.widgets.HUD.CP_PartyList.PartyList_ClanContainer" )
require( "ui.uieditor.widgets.HUD.CP_PartyList.PartyList_ScoreRankIcon" )

local PostLoadFunc = function ( self, controller )
	self.setModel = function ( self, model, controller )
		self.super:setModel( model, controller )
		local f2_local0 = self:getParent()
		f2_local0:updatePlayerScoreWidgetLayout()
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
	Gamertag:setRGB( 1, 1, 1 )
	Gamertag:setAlpha( 0.8 )
	Gamertag:setTTF( "fonts/Entovo.ttf" )
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
	ClanContainer:setRGB( 1, 1, 1 )
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
	ScoreRankIcon:setRGB( 1, 1, 1 )
	ScoreRankIcon:linkToElementModel( self, "playerRankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreRankIcon.rankImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	ScoreRankIcon:mergeStateConditions( {
		{
			stateName = "PlayerDown",
			condition = function ( menu, element, event )
				return IsPlayerInLastStand( element, controller )
			end
		},
		{
			stateName = "PlayerDead",
			condition = function ( menu, element, event )
				return IsPlayerDead( element, controller )
			end
		}
	} )
	if ScoreRankIcon.m_eventHandlers.hud_update_scores then
		local currentEv = ScoreRankIcon.m_eventHandlers.hud_update_scores
		ScoreRankIcon:registerEventHandler( "hud_update_scores", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		ScoreRankIcon:registerEventHandler( "hud_update_scores", LUI.UIElement.updateState )
	end
	if ScoreRankIcon.m_eventHandlers.hud_update_refresh then
		local currentEv = ScoreRankIcon.m_eventHandlers.hud_update_refresh
		ScoreRankIcon:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		ScoreRankIcon:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	if ScoreRankIcon.m_eventHandlers.client_last_stand_change then
		local currentEv = ScoreRankIcon.m_eventHandlers.client_last_stand_change
		ScoreRankIcon:registerEventHandler( "client_last_stand_change", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		ScoreRankIcon:registerEventHandler( "client_last_stand_change", LUI.UIElement.updateState )
	end
	if ScoreRankIcon.m_eventHandlers.client_status_image_update then
		local currentEv = ScoreRankIcon.m_eventHandlers.client_status_image_update
		ScoreRankIcon:registerEventHandler( "client_status_image_update", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		ScoreRankIcon:registerEventHandler( "client_status_image_update", LUI.UIElement.updateState )
	end
	self:addElement( ScoreRankIcon )
	self.ScoreRankIcon = ScoreRankIcon
	
	local currentEv = LUI.UITightText.new()
	currentEv:setLeftRight( false, true, -143, -129 )
	currentEv:setTopBottom( false, false, -7.17, 8.83 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:setAlpha( 0.8 )
	currentEv:setTTF( "fonts/Entovo.ttf" )
	currentEv:linkToElementModel( self, "rankNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( currentEv )
	self.LblRank = currentEv
	
	local voipCustomElement = LUI.UIImage.new()
	voipCustomElement:setLeftRight( false, true, -158, -144 )
	voipCustomElement:setTopBottom( false, false, -7.17, 6.83 )
	voipCustomElement:setRGB( 1, 1, 1 )
	voipCustomElement:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
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
				currentEv:completeAnimation()
				self.LblRank:setRGB( 1, 1, 1 )
				self.clipFinished( currentEv, {} )
			end
		}
	}
	self.close = function ( self )
		self.ClanContainer:close()
		self.ScoreRankIcon:close()
		self.Gamertag:close()
		self.LblRank:close()
		self.voipCustomElement:close()
		CoD.PartyList_PlayerScoreInternal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

