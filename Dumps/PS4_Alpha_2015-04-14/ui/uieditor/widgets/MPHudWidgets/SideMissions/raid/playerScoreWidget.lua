require( "ui.uieditor.widgets.MPHudWidgets.SideMissions.raid.playerScoreRankIconWidget" )
require( "ui.uieditor.widgets.MPHudWidgets.SideMissions.raid.playerScoreStatusIconWidget" )

CoD.playerScoreWidget = InheritFrom( LUI.UIElement )
CoD.playerScoreWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.playerScoreWidget )
	self.id = "playerScoreWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 62 )
	self.anyChildUsesUpdateState = true
	
	local voipCustomElement = LUI.UIImage.new()
	voipCustomElement:setLeftRight( true, false, 0, 24 )
	voipCustomElement:setTopBottom( false, false, -11, 13 )
	voipCustomElement:setRGB( 1, 1, 1 )
	voipCustomElement:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( voipCustomElement )
	self.voipCustomElement = voipCustomElement
	
	local nameText = LUI.UIText.new()
	nameText:setLeftRight( true, false, 77, 457 )
	nameText:setTopBottom( false, false, -24, 2 )
	nameText:setRGB( 1, 1, 1 )
	nameText:setTTF( "fonts/default.ttf" )
	nameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	nameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( nameText )
	self.nameText = nameText
	
	local scoreText = LUI.UIText.new()
	scoreText:setLeftRight( true, false, 77, 458.72 )
	scoreText:setTopBottom( false, false, 1, 31 )
	scoreText:setRGB( 0.07, 0.59, 0 )
	scoreText:setTTF( "fonts/default.ttf" )
	scoreText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	scoreText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( scoreText )
	self.scoreText = scoreText
	
	local rankIconWidget = CoD.playerScoreRankIconWidget.new( menu, controller )
	rankIconWidget:setLeftRight( true, false, 24, 70 )
	rankIconWidget:setTopBottom( false, false, -19, 27 )
	rankIconWidget:setRGB( 1, 1, 1 )
	rankIconWidget:mergeStateConditions( {
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
		},
		{
			stateName = "PlayerHasObjective",
			condition = function ( menu, element, event )
				return PlayerHasAnObjective( element, controller )
			end
		}
	} )
	if rankIconWidget.m_eventHandlers.hud_update_scores then
		local currentEv = rankIconWidget.m_eventHandlers.hud_update_scores
		rankIconWidget:registerEventHandler( "hud_update_scores", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		rankIconWidget:registerEventHandler( "hud_update_scores", LUI.UIElement.updateState )
	end
	if rankIconWidget.m_eventHandlers.hud_update_refresh then
		local currentEv = rankIconWidget.m_eventHandlers.hud_update_refresh
		rankIconWidget:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		rankIconWidget:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	if rankIconWidget.m_eventHandlers.client_last_stand_change then
		local currentEv = rankIconWidget.m_eventHandlers.client_last_stand_change
		rankIconWidget:registerEventHandler( "client_last_stand_change", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		rankIconWidget:registerEventHandler( "client_last_stand_change", LUI.UIElement.updateState )
	end
	if rankIconWidget.m_eventHandlers.client_status_image_update then
		local currentEv = rankIconWidget.m_eventHandlers.client_status_image_update
		rankIconWidget:registerEventHandler( "client_status_image_update", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		rankIconWidget:registerEventHandler( "client_status_image_update", LUI.UIElement.updateState )
	end
	if rankIconWidget.m_eventHandlers.player_objectives_change then
		local currentEv = rankIconWidget.m_eventHandlers.player_objectives_change
		rankIconWidget:registerEventHandler( "player_objectives_change", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		rankIconWidget:registerEventHandler( "player_objectives_change", LUI.UIElement.updateState )
	end
	self:addElement( rankIconWidget )
	self.rankIconWidget = rankIconWidget
	
	local currentEv = CoD.playerScoreStatusIconWidget.new( menu, controller )
	currentEv:setLeftRight( true, false, 12, 36 )
	currentEv:setTopBottom( false, false, -31, -7 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "IsDown",
			condition = function ( menu, element, event )
				return IsPlayerInLastStand( element, controller )
			end
		},
		{
			stateName = "HasObjective",
			condition = function ( menu, element, event )
				return PlayerHasAnObjective( element, controller )
			end
		},
		{
			stateName = "IsDown_Last10Seconds",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	if currentEv.m_eventHandlers.hud_update_scores then
		local currentEv = currentEv.m_eventHandlers.hud_update_scores
		currentEv:registerEventHandler( "hud_update_scores", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "hud_update_scores", LUI.UIElement.updateState )
	end
	if currentEv.m_eventHandlers.hud_update_refresh then
		local currentEv = currentEv.m_eventHandlers.hud_update_refresh
		currentEv:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	if currentEv.m_eventHandlers.client_last_stand_change then
		local currentEv = currentEv.m_eventHandlers.client_last_stand_change
		currentEv:registerEventHandler( "client_last_stand_change", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "client_last_stand_change", LUI.UIElement.updateState )
	end
	if currentEv.m_eventHandlers.player_objectives_change then
		local currentEv = currentEv.m_eventHandlers.player_objectives_change
		currentEv:registerEventHandler( "player_objectives_change", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "player_objectives_change", LUI.UIElement.updateState )
	end
	self:addElement( currentEv )
	self.statusIconWidget = currentEv
	
	self.voipCustomElement:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			voipCustomElement:setupVoipImage( modelValue )
		end
	end )
	self.nameText:linkToElementModel( self, "playerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			nameText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.scoreText:linkToElementModel( self, "playerScore", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			scoreText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.rankIconWidget:linkToElementModel( self, "playerRankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIconWidget.rankImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.statusIconWidget:linkToElementModel( self, "objectiveIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv.objectiveIconWidget:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				voipCustomElement:completeAnimation()
				self.voipCustomElement:setAlpha( 1 )
				self.clipFinished( voipCustomElement, {} )
				nameText:completeAnimation()
				self.nameText:setAlpha( 1 )
				self.clipFinished( nameText, {} )
				scoreText:completeAnimation()
				self.scoreText:setAlpha( 1 )
				self.clipFinished( scoreText, {} )
				rankIconWidget:completeAnimation()
				self.rankIconWidget:setAlpha( 1 )
				self.clipFinished( rankIconWidget, {} )
				currentEv:completeAnimation()
				self.statusIconWidget:setAlpha( 1 )
				self.clipFinished( currentEv, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				voipCustomElement:completeAnimation()
				self.voipCustomElement:setAlpha( 0 )
				self.clipFinished( voipCustomElement, {} )
				nameText:completeAnimation()
				self.nameText:setAlpha( 0 )
				self.clipFinished( nameText, {} )
				scoreText:completeAnimation()
				self.scoreText:setAlpha( 0 )
				self.clipFinished( scoreText, {} )
				rankIconWidget:completeAnimation()
				self.rankIconWidget:setAlpha( 0 )
				self.clipFinished( rankIconWidget, {} )
				currentEv:completeAnimation()
				self.statusIconWidget:setAlpha( 0 )
				self.clipFinished( currentEv, {} )
			end
		}
	}
	self.close = function ( self )
		self.rankIconWidget:close()
		self.statusIconWidget:close()
		self.voipCustomElement:close()
		self.nameText:close()
		self.scoreText:close()
		CoD.playerScoreWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

