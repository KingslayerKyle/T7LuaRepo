require( "ui.uieditor.widgets.HUD.DOA.fullscreen" )
require( "ui.uieditor.widgets.HUD.DOA.score" )
require( "ui.uieditor.widgets.HUD.DOA.score_lower" )
require( "ui.uieditor.widgets.HUD.DOA.firstplace" )
require( "ui.uieditor.widgets.HUD.DOA.redinsHUD" )
require( "ui.uieditor.widgets.HUD.DOA.generic_banner_wbar" )
require( "ui.uieditor.widgets.HUD.DOA.countbox" )
require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardWidgetCP" )
require( "ui.uieditor.widgets.DynamicContainerWidget" )
require( "ui.uieditor.widgets.Chat.inGame.IngameChatClientContainer" )
require( "ui.uieditor.widgets.DOA.round" )
require( "ui.uieditor.widgets.DOA.survived" )
require( "ui.uieditor.widgets.DOA.choosepath" )
require( "ui.uieditor.widgets.DOA.teleporter" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetModelForController( f1_arg1 )
	local f1_local1 = function ( f2_arg0, f2_arg1 )
		DataSources.DeadOpsArcadePlayers.updateModelsForClient( f2_arg0, f2_arg1 )
	end
	
	if not f1_arg0.playerConnectedSubscription then
		f1_arg0.playerConnectedSubscription = f1_arg0:subscribeToModel( Engine.GetModel( f1_local0, "playerConnected" ), function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue ~= nil then
				f1_local1( f1_arg1, modelValue )
			end
		end, false )
	end
	if not f1_arg0.playerDisconnectedSubscription then
		f1_arg0.playerDisconnectedSubscription = f1_arg0:subscribeToModel( Engine.GetModel( f1_local0, "playerDisconnected" ), function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue ~= nil then
				f1_local1( f1_arg1, modelValue )
			end
		end, false )
	end
	local f1_local2 = DataSources.WorldSpaceIndicators.getModel( f1_arg1 )
	if f1_arg0.setupGeneric3DWidget then
		local f1_local3 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
			local f5_local0 = Engine.CreateModel( f1_local2, "bubble_" .. f5_arg0 )
			if f5_local0 then
				LUI.CreateModelAndInitialize( f5_local0, "text", f5_arg1 )
				local f5_local1 = CoD.doa_bubble.new( f1_arg0, f1_arg1 )
				f5_local1.internal:setModel( f5_local0 )
				f5_local1.internal:beginAnimation( "setup" )
				f5_local1.internal:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT | Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
				f5_local1.internal:setupGeneric3DWidget( f5_arg2, f5_arg3, f5_arg4 )
				LUI.OverrideFunction_CallOriginalFirst( f5_local1, "close", function ()
					Engine.UnsubscribeAndFreeModel( f5_local0 )
				end )
				return f5_local1
			else
				
			end
		end
		
		f1_arg0.bubbles = {}
		f1_arg0:subscribeToGlobalModel( f1_arg1, "PerController", "scriptNotify", function ( model )
			local modelValue = Engine.GetModelValue( model )
			local f7_local1 = {
				controller = f1_arg1,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			}
			if modelValue == "doa_bubbleKillAll" then
				for f7_local2 = 0, #f1_arg0.bubbles, 1 do
					local f7_local5 = f1_arg0.bubbles[f7_local2]
					if f7_local5 ~= nil then
						f7_local5:close()
					end
				end
				f1_arg0.bubbles = {}
			end
			if modelValue == "doa_bubble" then
				local f7_local2 = f7_local1.data[2]
				if f7_local1.data[1] == -1 then
					if not f1_arg0.bubbles[f7_local2] then
						local f7_local6 = f1_local3( f7_local2, Engine.GetIString( f7_local1.data[3], "CS_LOCALIZED_STRINGS" ), f7_local1.data[4], f7_local1.data[5], f7_local1.data[6] )
						if f7_local6 then
							f1_arg0.bubbles[f7_local2] = f7_local6
							f1_arg0.fullscreenContainer:addElement( f7_local6 )
							f7_local6:processEvent( {
								name = "update_state",
								controller = f1_arg1,
								menu = f1_arg0
							} )
						end
					end
				elseif f7_local1.data[1] >= 0 and f1_arg0.bubbles[f7_local2] then
					local f7_local3 = f1_arg0.bubbles[f7_local2]
					if f7_local1.data[1] == 0 then
						f7_local3:close()
					else
						f7_local3:registerEventHandler( "transition_complete_fadeOut", function ()
							f7_local3:close()
						end )
						f7_local3:beginAnimation( "fadeOut", f7_local1.data[1], true, true )
						f7_local3:setAlpha( 0 )
					end
					f1_arg0.bubbles[f7_local2] = nil
				end
				return true
			else
				
			end
		end )
	end
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "T7Hud_DOA.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local bezel = CoD.fullscreen.new( self, controller )
	bezel:setLeftRight( true, true, -7, -7 )
	bezel:setTopBottom( true, true, 0, 0 )
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
	score0:setLeftRight( true, false, 9, 309 )
	score0:setTopBottom( true, false, 0, 31 )
	score0:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player1", function ( model )
		score0:setModel( model, controller )
	end )
	score0:linkToElementModel( self, "weaplevel1", true, function ( model )
		local weaplevel1 = Engine.GetModelValue( model )
		if weaplevel1 then
			score0.skull1:setAlpha( weaplevel1 )
		end
	end )
	score0:linkToElementModel( self, "weaplevel2", true, function ( model )
		local weaplevel2 = Engine.GetModelValue( model )
		if weaplevel2 then
			score0.skull2:setAlpha( weaplevel2 )
		end
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
	score1:setLeftRight( false, true, -338, -22 )
	score1:setTopBottom( true, false, 0, 31 )
	score1.score:setRGB( 0.11, 0.4, 0.75 )
	score1:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player2", function ( model )
		score1:setModel( model, controller )
	end )
	score1:linkToElementModel( self, "weaplevel1", true, function ( model )
		local weaplevel1 = Engine.GetModelValue( model )
		if weaplevel1 then
			score1.skull1:setAlpha( weaplevel1 )
		end
	end )
	score1:linkToElementModel( self, "weaplevel2", true, function ( model )
		local weaplevel2 = Engine.GetModelValue( model )
		if weaplevel2 then
			score1.skull2:setAlpha( weaplevel2 )
		end
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
	score2:setLeftRight( true, false, 9, 309 )
	score2:setTopBottom( false, true, -60, -29 )
	score2.score:setRGB( 0.89, 0, 0.04 )
	score2:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player3", function ( model )
		score2:setModel( model, controller )
	end )
	score2:linkToElementModel( self, "bulletbar_rgb", true, function ( model )
		local bulletbarRgb = Engine.GetModelValue( model )
		if bulletbarRgb then
			score2.bulletbar1:setRGB( bulletbarRgb )
		end
	end )
	score2:linkToElementModel( self, "weaplevel1", true, function ( model )
		local weaplevel1 = Engine.GetModelValue( model )
		if weaplevel1 then
			score2.skull1:setAlpha( weaplevel1 )
		end
	end )
	score2:linkToElementModel( self, "weaplevel2", true, function ( model )
		local weaplevel2 = Engine.GetModelValue( model )
		if weaplevel2 then
			score2.skull2:setAlpha( weaplevel2 )
		end
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
	score3:setLeftRight( false, true, -338, -22 )
	score3:setTopBottom( false, true, -60, -29 )
	score3.score:setRGB( 0.57, 0.57, 0 )
	score3:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player4", function ( model )
		score3:setModel( model, controller )
	end )
	score3:linkToElementModel( self, "bulletbar_rgb", true, function ( model )
		local bulletbarRgb = Engine.GetModelValue( model )
		if bulletbarRgb then
			score3.bulletbar1:setRGB( bulletbarRgb )
		end
	end )
	score3:linkToElementModel( self, "weaplevel1", true, function ( model )
		local weaplevel1 = Engine.GetModelValue( model )
		if weaplevel1 then
			score3.skull1:setAlpha( weaplevel1 )
		end
	end )
	score3:linkToElementModel( self, "weaplevel2", true, function ( model )
		local weaplevel2 = Engine.GetModelValue( model )
		if weaplevel2 then
			score3.skull2:setAlpha( weaplevel2 )
		end
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
	firstplace0:setLeftRight( true, false, 332, 394 )
	firstplace0:setTopBottom( true, false, 36, 89 )
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
	firstplace1:setLeftRight( false, true, -387, -328 )
	firstplace1:setTopBottom( true, false, 36, 89 )
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
	firstplace2:setLeftRight( true, false, 332, 398 )
	firstplace2:setTopBottom( false, true, -91, -36 )
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
	firstplace3:setLeftRight( false, true, -387, -328 )
	firstplace3:setTopBottom( false, true, -91, -36 )
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
	
	local redinsHUD0 = CoD.redinsHUD.new( self, controller )
	redinsHUD0:setLeftRight( false, true, -372, -64 )
	redinsHUD0:setTopBottom( true, false, 297.86, 361.86 )
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
	genericbanner:setLeftRight( true, true, 451.27, -512.73 )
	genericbanner:setTopBottom( true, false, 2, 33 )
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
	
	local ScoreboardWidgetCP = CoD.ScoreboardWidgetCP.new( self, controller )
	ScoreboardWidgetCP:setLeftRight( true, true, 137, -137 )
	ScoreboardWidgetCP:setTopBottom( true, false, 428, 954 )
	self:addElement( ScoreboardWidgetCP )
	self.ScoreboardWidgetCP = ScoreboardWidgetCP
	
	local fullscreenContainer = CoD.DynamicContainerWidget.new( self, controller )
	fullscreenContainer:setLeftRight( true, true, 0, 0 )
	fullscreenContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( fullscreenContainer )
	self.fullscreenContainer = fullscreenContainer
	
	local IngameChatClientContainer = CoD.IngameChatClientContainer.new( self, controller )
	IngameChatClientContainer:setLeftRight( true, false, 0, 360 )
	IngameChatClientContainer:setTopBottom( true, false, -2.5, 717.5 )
	self:addElement( IngameChatClientContainer )
	self.IngameChatClientContainer = IngameChatClientContainer
	
	local roundTxt0 = CoD.round.new( self, controller )
	roundTxt0:setLeftRight( true, true, 64, -64 )
	roundTxt0:setTopBottom( true, false, 116.5, 193.5 )
	roundTxt0:setRGB( 0.94, 0.94, 0 )
	roundTxt0:subscribeToGlobalModel( controller, "DeadOpsArcadeGlobal", nil, function ( model )
		roundTxt0:setModel( model, controller )
	end )
	roundTxt0:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "round", 0 )
			end
		}
	} )
	roundTxt0:linkToElementModel( roundTxt0, "round", true, function ( model )
		self:updateElementState( roundTxt0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "round"
		} )
	end )
	self:addElement( roundTxt0 )
	self.roundTxt0 = roundTxt0
	
	local survived0 = CoD.survived.new( self, controller )
	survived0:setLeftRight( true, true, 64, -64 )
	survived0:setTopBottom( true, false, 173.02, 233.02 )
	survived0:setRGB( 0.94, 0.94, 0 )
	survived0:subscribeToGlobalModel( controller, "DeadOpsArcadeGlobal", nil, function ( model )
		survived0:setModel( model, controller )
	end )
	survived0:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "gameover", 0 )
			end
		}
	} )
	survived0:linkToElementModel( survived0, "gameover", true, function ( model )
		self:updateElementState( survived0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameover"
		} )
	end )
	self:addElement( survived0 )
	self.survived0 = survived0
	
	local choosepath0 = CoD.choosepath.new( self, controller )
	choosepath0:setLeftRight( true, true, 64, -64 )
	choosepath0:setTopBottom( true, false, 172.02, 232.02 )
	choosepath0:setRGB( 0.94, 0.94, 0 )
	choosepath0:subscribeToGlobalModel( controller, "DeadOpsArcadeGlobal", nil, function ( model )
		choosepath0:setModel( model, controller )
	end )
	choosepath0:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsSelfModelValueLessThanOrEqualTo( element, controller, "numexits", 1 )
			end
		}
	} )
	choosepath0:linkToElementModel( choosepath0, "numexits", true, function ( model )
		self:updateElementState( choosepath0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "numexits"
		} )
	end )
	self:addElement( choosepath0 )
	self.choosepath0 = choosepath0
	
	local teleporter0 = CoD.teleporter.new( self, controller )
	teleporter0:setLeftRight( true, true, 477, -491 )
	teleporter0:setTopBottom( true, false, 176, 236 )
	teleporter0:setRGB( 0.94, 0.94, 0 )
	teleporter0:subscribeToGlobalModel( controller, "DeadOpsArcadeGlobal", nil, function ( model )
		teleporter0:setModel( model, controller )
	end )
	teleporter0:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsSelfModelValueNilOrZero( element, controller, "teleporter" )
			end
		}
	} )
	teleporter0:linkToElementModel( teleporter0, "teleporter", true, function ( model )
		self:updateElementState( teleporter0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "teleporter"
		} )
	end )
	self:addElement( teleporter0 )
	self.teleporter0 = teleporter0
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f70_local0 = nil
		SizeToSafeArea( self, controller )
		if not f70_local0 then
			f70_local0 = self:dispatchEventToChildren( event )
		end
		return f70_local0
	end )
	ScoreboardWidgetCP.id = "ScoreboardWidgetCP"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.bezel:close()
		element.score0:close()
		element.score1:close()
		element.score2:close()
		element.score3:close()
		element.firstplace0:close()
		element.firstplace1:close()
		element.firstplace2:close()
		element.firstplace3:close()
		element.redinsHUD0:close()
		element.genericbanner:close()
		element.countbox:close()
		element.ScoreboardWidgetCP:close()
		element.fullscreenContainer:close()
		element.IngameChatClientContainer:close()
		element.roundTxt0:close()
		element.survived0:close()
		element.choosepath0:close()
		element.teleporter0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "T7Hud_DOA.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

