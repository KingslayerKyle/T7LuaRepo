require( "ui.uieditor.widgets.HUD.DOA.fullscreen" )
require( "ui.uieditor.widgets.HUD.DOA.score" )
require( "ui.uieditor.widgets.HUD.DOA.score_lower" )
require( "ui.uieditor.widgets.HUD.DOA.firstplace" )
require( "ui.uieditor.widgets.HUD.DOA.tank_player0" )
require( "ui.uieditor.widgets.HUD.DOA.tank_player1" )
require( "ui.uieditor.widgets.HUD.DOA.redinsHUD" )
require( "ui.uieditor.widgets.HUD.DOA.generic_banner_wbar" )
require( "ui.uieditor.widgets.HUD.DOA.countbox" )

local PostLoadFunc = function ( self, controller )
	local connectionChangeHandler = function ( self, event )
		DataSources.DeadOpsArcadePlayers.updateModelsForClient( event.controller, event.clientNum )
	end
	
	self:registerEventHandler( "player_connected", connectionChangeHandler )
	self:registerEventHandler( "player_disconnected", connectionChangeHandler )
end

LUI.createMenu.T7Hud_DOA = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud_DOA" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local bezel = CoD.fullscreen.new( self, controller )
	bezel:setLeftRight( false, false, -647, 633 )
	bezel:setTopBottom( false, false, -360, 360 )
	bezel:setRGB( 1, 1, 1 )
	bezel:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsGameTypeDOA() and AlwaysFalse()
			end
		}
	} )
	self:addElement( bezel )
	self.bezel = bezel
	
	local score0 = CoD.score.new( self, controller )
	score0:setLeftRight( true, false, 64, 380 )
	score0:setTopBottom( true, false, 36, 67 )
	score0:setRGB( 1, 1, 1 )
	score0.score:setRGB( 0.18, 0.75, 0.11 )
	score0:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player1", function ( model )
		score0:setModel( model, controller )
	end )
	score0:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "name" )
			end
		}
	} )
	score0:linkToElementModel( score0, "name", true, function ( model )
		self:updateElementState( score0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "name"
		} )
	end )
	self:addElement( score0 )
	self.score0 = score0
	
	local score1 = CoD.score.new( self, controller )
	score1:setLeftRight( false, true, -433, -117 )
	score1:setTopBottom( true, false, 36, 67 )
	score1:setRGB( 1, 1, 1 )
	score1.score:setRGB( 0.11, 0.4, 0.75 )
	score1:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player2", function ( model )
		score1:setModel( model, controller )
	end )
	score1:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "name" )
			end
		}
	} )
	score1:linkToElementModel( score1, "name", true, function ( model )
		self:updateElementState( score1, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "name"
		} )
	end )
	self:addElement( score1 )
	self.score1 = score1
	
	local score2 = CoD.score_lower.new( self, controller )
	score2:setLeftRight( true, false, 64, 380 )
	score2:setTopBottom( false, true, -99, -68 )
	score2:setRGB( 1, 1, 1 )
	score2.score:setRGB( 0.89, 0, 0.04 )
	score2:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player3", function ( model )
		score2:setModel( model, controller )
	end )
	score2:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "name" )
			end
		}
	} )
	score2:linkToElementModel( score2, "name", true, function ( model )
		self:updateElementState( score2, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "name"
		} )
	end )
	self:addElement( score2 )
	self.score2 = score2
	
	local score3 = CoD.score_lower.new( self, controller )
	score3:setLeftRight( false, true, -438, -122 )
	score3:setTopBottom( false, true, -98, -67 )
	score3:setRGB( 1, 1, 1 )
	score3.score:setRGB( 0.57, 0.57, 0 )
	score3:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player4", function ( model )
		score3:setModel( model, controller )
	end )
	score3:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "name" )
			end
		}
	} )
	score3:linkToElementModel( score3, "name", true, function ( model )
		self:updateElementState( score3, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "name"
		} )
	end )
	self:addElement( score3 )
	self.score3 = score3
	
	local firstplace0 = CoD.firstplace.new( self, controller )
	firstplace0:setLeftRight( true, false, 430, 492 )
	firstplace0:setTopBottom( true, false, 36, 89 )
	firstplace0:setRGB( 1, 1, 1 )
	firstplace0:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player1", function ( model )
		firstplace0:setModel( model, controller )
	end )
	firstplace0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "ribbon", 1 ) and IsSelfModelValueNonEmptyString( element, controller, "name" )
			end
		}
	} )
	firstplace0:linkToElementModel( firstplace0, "ribbon", true, function ( model )
		self:updateElementState( firstplace0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ribbon"
		} )
	end )
	firstplace0:linkToElementModel( firstplace0, "name", true, function ( model )
		self:updateElementState( firstplace0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "name"
		} )
	end )
	self:addElement( firstplace0 )
	self.firstplace0 = firstplace0
	
	local firstplace1 = CoD.firstplace.new( self, controller )
	firstplace1:setLeftRight( false, true, -475, -416 )
	firstplace1:setTopBottom( true, false, 36, 89 )
	firstplace1:setRGB( 1, 1, 1 )
	firstplace1:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player2", function ( model )
		firstplace1:setModel( model, controller )
	end )
	firstplace1:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "ribbon", 1 ) and IsSelfModelValueNonEmptyString( element, controller, "name" )
			end
		}
	} )
	firstplace1:linkToElementModel( firstplace1, "ribbon", true, function ( model )
		self:updateElementState( firstplace1, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ribbon"
		} )
	end )
	firstplace1:linkToElementModel( firstplace1, "name", true, function ( model )
		self:updateElementState( firstplace1, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "name"
		} )
	end )
	self:addElement( firstplace1 )
	self.firstplace1 = firstplace1
	
	local firstplace2 = CoD.firstplace.new( self, controller )
	firstplace2:setLeftRight( true, false, 430, 492 )
	firstplace2:setTopBottom( false, true, -91, -36 )
	firstplace2:setRGB( 1, 1, 1 )
	firstplace2:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player3", function ( model )
		firstplace2:setModel( model, controller )
	end )
	firstplace2:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "ribbon", 1 ) and IsSelfModelValueNonEmptyString( element, controller, "name" )
			end
		}
	} )
	firstplace2:linkToElementModel( firstplace2, "ribbon", true, function ( model )
		self:updateElementState( firstplace2, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ribbon"
		} )
	end )
	firstplace2:linkToElementModel( firstplace2, "name", true, function ( model )
		self:updateElementState( firstplace2, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "name"
		} )
	end )
	self:addElement( firstplace2 )
	self.firstplace2 = firstplace2
	
	local firstplace3 = CoD.firstplace.new( self, controller )
	firstplace3:setLeftRight( false, true, -475, -416 )
	firstplace3:setTopBottom( false, true, -91, -36 )
	firstplace3:setRGB( 1, 1, 1 )
	firstplace3:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player4", function ( model )
		firstplace3:setModel( model, controller )
	end )
	firstplace3:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "ribbon", 1 ) and IsSelfModelValueNonEmptyString( element, controller, "name" )
			end
		}
	} )
	firstplace3:linkToElementModel( firstplace3, "ribbon", true, function ( model )
		self:updateElementState( firstplace3, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ribbon"
		} )
	end )
	firstplace3:linkToElementModel( firstplace3, "name", true, function ( model )
		self:updateElementState( firstplace3, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "name"
		} )
	end )
	self:addElement( firstplace3 )
	self.firstplace3 = firstplace3
	
	local tankplayer0 = CoD.tank_player0.new( self, controller )
	tankplayer0:setLeftRight( true, false, 168, 484 )
	tankplayer0:setTopBottom( false, true, -630, -599 )
	tankplayer0:setRGB( 1, 1, 1 )
	tankplayer0:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player1", function ( model )
		tankplayer0:setModel( model, controller )
	end )
	tankplayer0:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "tank_name" )
			end
		}
	} )
	tankplayer0:linkToElementModel( tankplayer0, "tank_name", true, function ( model )
		self:updateElementState( tankplayer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "tank_name"
		} )
	end )
	self:addElement( tankplayer0 )
	self.tankplayer0 = tankplayer0
	
	local tankplayer2 = CoD.tank_player0.new( self, controller )
	tankplayer2:setLeftRight( true, false, 165, 339 )
	tankplayer2:setTopBottom( false, true, -67, -36 )
	tankplayer2:setRGB( 1, 1, 1 )
	tankplayer2:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player3", function ( model )
		tankplayer2:setModel( model, controller )
	end )
	tankplayer2:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "tank_name" )
			end
		}
	} )
	tankplayer2:linkToElementModel( tankplayer2, "tank_name", true, function ( model )
		self:updateElementState( tankplayer2, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "tank_name"
		} )
	end )
	self:addElement( tankplayer2 )
	self.tankplayer2 = tankplayer2
	
	local tankplayer1 = CoD.tank_player1.new( self, controller )
	tankplayer1:setLeftRight( false, true, -84.69, 230.31 )
	tankplayer1:setTopBottom( false, true, -630, -599 )
	tankplayer1:setRGB( 1, 1, 1 )
	tankplayer1:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player2", function ( model )
		tankplayer1:setModel( model, controller )
	end )
	tankplayer1:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "tank_name" )
			end
		}
	} )
	tankplayer1:linkToElementModel( tankplayer1, "tank_name", true, function ( model )
		self:updateElementState( tankplayer1, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "tank_name"
		} )
	end )
	self:addElement( tankplayer1 )
	self.tankplayer1 = tankplayer1
	
	local tankplayer3 = CoD.tank_player1.new( self, controller )
	tankplayer3:setLeftRight( false, true, -85.69, 230.31 )
	tankplayer3:setTopBottom( false, true, -67, -36 )
	tankplayer3:setRGB( 1, 1, 1 )
	tankplayer3:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player4", function ( model )
		tankplayer3:setModel( model, controller )
	end )
	tankplayer3:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "tank_name" )
			end
		}
	} )
	tankplayer3:linkToElementModel( tankplayer3, "tank_name", true, function ( model )
		self:updateElementState( tankplayer3, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "tank_name"
		} )
	end )
	self:addElement( tankplayer3 )
	self.tankplayer3 = tankplayer3
	
	local redinsHUD0 = CoD.redinsHUD.new( self, controller )
	redinsHUD0:setLeftRight( false, true, -561, -245 )
	redinsHUD0:setTopBottom( true, false, 60.86, 91.86 )
	redinsHUD0:setRGB( 1, 1, 1 )
	redinsHUD0:subscribeToGlobalModel( controller, "DeadOpsArcadeGlobal", nil, function ( model )
		redinsHUD0:setModel( model, controller )
	end )
	redinsHUD0:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "redins" )
			end
		}
	} )
	redinsHUD0:linkToElementModel( redinsHUD0, "redins", true, function ( model )
		self:updateElementState( redinsHUD0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "redins"
		} )
	end )
	self:addElement( redinsHUD0 )
	self.redinsHUD0 = redinsHUD0
	
	local genericbanner = CoD.generic_banner_wbar.new( self, controller )
	genericbanner:setLeftRight( true, true, 458.27, -505.73 )
	genericbanner:setTopBottom( true, false, 36, 67 )
	genericbanner:setRGB( 1, 1, 1 )
	genericbanner:subscribeToGlobalModel( controller, "DeadOpsArcadeGlobal", nil, function ( model )
		genericbanner:setModel( model, controller )
	end )
	genericbanner:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "gbanner" )
			end
		}
	} )
	genericbanner:linkToElementModel( genericbanner, "gbanner", true, function ( model )
		self:updateElementState( genericbanner, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gbanner"
		} )
	end )
	self:addElement( genericbanner )
	self.genericbanner = genericbanner
	
	local countbox = CoD.countbox.new( self, controller )
	countbox:setLeftRight( false, false, -150.73, 103.27 )
	countbox:setTopBottom( false, false, -209, -124 )
	countbox:setRGB( 1, 1, 1 )
	countbox:subscribeToGlobalModel( controller, "DeadOpsArcadeGlobal", nil, function ( model )
		countbox:setModel( model, controller )
	end )
	countbox:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "countdown" )
			end
		}
	} )
	countbox:linkToElementModel( countbox, "countdown", true, function ( model )
		self:updateElementState( countbox, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "countdown"
		} )
	end )
	self:addElement( countbox )
	self.countbox = countbox
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	self.close = function ( self )
		self.bezel:close()
		self.score0:close()
		self.score1:close()
		self.score2:close()
		self.score3:close()
		self.firstplace0:close()
		self.firstplace1:close()
		self.firstplace2:close()
		self.firstplace3:close()
		self.tankplayer0:close()
		self.tankplayer2:close()
		self.tankplayer1:close()
		self.tankplayer3:close()
		self.redinsHUD0:close()
		self.genericbanner:close()
		self.countbox:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

