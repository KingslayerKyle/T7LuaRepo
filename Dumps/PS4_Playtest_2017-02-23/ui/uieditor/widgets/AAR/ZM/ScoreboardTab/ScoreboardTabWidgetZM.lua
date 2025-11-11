require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardHeaderWidget" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardRowWidget" )
require( "ui.uieditor.widgets.AAR.ZM.ScoreboardTab.PlayerStylesWidget" )
require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardWidgetCP" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )

local PostLoadFunc = function ( self, controller )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self.m_inputDisabled = not Engine.GetModelValue( model )
	end )
end

CoD.ScoreboardTabWidgetZM = InheritFrom( LUI.UIElement )
CoD.ScoreboardTabWidgetZM.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardTabWidgetZM )
	self.id = "ScoreboardTabWidgetZM"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 789 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( 0, 0, 0, 1920 )
	VignetteBack:setTopBottom( 0, 0, -142, 938 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local AARScoreboardHeaderWidget = CoD.AARScoreboardHeaderWidget.new( menu, controller )
	AARScoreboardHeaderWidget:setLeftRight( 0, 0, 339, 1505 )
	AARScoreboardHeaderWidget:setTopBottom( 0, 0, 64, 105 )
	AARScoreboardHeaderWidget.GametypeAndMapName:setText( Engine.Localize( "MENU_SCOREBOARD_HEADER_CP" ) )
	self:addElement( AARScoreboardHeaderWidget )
	self.AARScoreboardHeaderWidget = AARScoreboardHeaderWidget
	
	local ScoreboardWidget = CoD.ScoreboardWidgetCP.new( menu, controller )
	ScoreboardWidget:mergeStateConditions( {
		{
			stateName = "ArabicZombieAAR",
			condition = function ( menu, element, event )
				return IsCurrentLanguageArabic() and IsZombies()
			end
		}
	} )
	ScoreboardWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( ScoreboardWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	ScoreboardWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( ScoreboardWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	ScoreboardWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		menu:updateElementState( ScoreboardWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		} )
	end )
	ScoreboardWidget:setLeftRight( 0, 0, 208, 1717 )
	ScoreboardWidget:setTopBottom( 0, 0, 51, 329 )
	ScoreboardWidget.ScoreboardFactionScoresListCP0.Team1:setWidgetType( CoD.AARScoreboardRowWidget )
	ScoreboardWidget.ScoreboardFactionScoresListCP0.Team2:setWidgetType( CoD.AARScoreboardRowWidget )
	self:addElement( ScoreboardWidget )
	self.ScoreboardWidget = ScoreboardWidget
	
	local PlayerStylesList = LUI.UIList.new( menu, controller, 62, 0, nil, false, false, 0, 0, false, false )
	PlayerStylesList:makeFocusable()
	PlayerStylesList:setLeftRight( 0, 0, 307, 1693 )
	PlayerStylesList:setTopBottom( 0, 0, 583, 737 )
	PlayerStylesList:setWidgetType( CoD.PlayerStylesWidget )
	PlayerStylesList:setHorizontalCount( 4 )
	PlayerStylesList:setSpacing( 62 )
	PlayerStylesList:setDataSource( "ZmPlayerStyles" )
	self:addElement( PlayerStylesList )
	self.PlayerStylesList = PlayerStylesList
	
	ScoreboardWidget.navigation = {
		down = PlayerStylesList
	}
	PlayerStylesList.navigation = {
		up = ScoreboardWidget
	}
	self.resetProperties = function ()
		VignetteBack:completeAnimation()
		VignetteBack:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local VignetteBackFrame2 = function ( VignetteBack, event )
					if not event.interrupted then
						VignetteBack:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
					end
					VignetteBack:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( VignetteBack, event )
					else
						VignetteBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setAlpha( 0 )
				VignetteBackFrame2( VignetteBack, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	ScoreboardWidget.id = "ScoreboardWidget"
	PlayerStylesList.id = "PlayerStylesList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ScoreboardWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.VignetteBack:close()
		self.AARScoreboardHeaderWidget:close()
		self.ScoreboardWidget:close()
		self.PlayerStylesList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

