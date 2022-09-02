-- 35d3a426876d0938745301f2f2d7678b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardHeaderWidget" )
require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardWidgetCP" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardRowWidget" )
require( "ui.uieditor.widgets.AAR.ZM.ScoreboardTab.PlayerStylesWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f1_arg0.m_inputDisabled = not Engine.GetModelValue( model )
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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 526 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( true, false, 0, 1280 )
	VignetteBack:setTopBottom( true, false, -94.37, 625.63 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local AARScoreboardHeaderWidget = CoD.AARScoreboardHeaderWidget.new( menu, controller )
	AARScoreboardHeaderWidget:setLeftRight( true, false, 226, 1003 )
	AARScoreboardHeaderWidget:setTopBottom( true, false, 42.5, 69.5 )
	AARScoreboardHeaderWidget.GametypeAndMapName:setText( Engine.Localize( "MENU_SCOREBOARD_HEADER_CP" ) )
	self:addElement( AARScoreboardHeaderWidget )
	self.AARScoreboardHeaderWidget = AARScoreboardHeaderWidget
	
	local ScoreboardWidget = CoD.ScoreboardWidgetCP.new( menu, controller )
	ScoreboardWidget:setLeftRight( true, false, 138.86, 1144.86 )
	ScoreboardWidget:setTopBottom( true, false, 34.5, 219.5 )
	ScoreboardWidget.ScoreboardFactionScoresListCP0.Team1:setWidgetType( CoD.AARScoreboardRowWidget )
	ScoreboardWidget.ScoreboardFactionScoresListCP0.Team2:setWidgetType( CoD.AARScoreboardRowWidget )
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
	self:addElement( ScoreboardWidget )
	self.ScoreboardWidget = ScoreboardWidget
	
	local PlayerStylesList = LUI.UIList.new( menu, controller, 41, 0, nil, false, false, 0, 0, false, true )
	PlayerStylesList:makeFocusable()
	PlayerStylesList:setLeftRight( true, false, 204.86, 1127.86 )
	PlayerStylesList:setTopBottom( true, false, 388.19, 491.19 )
	PlayerStylesList:setWidgetType( CoD.PlayerStylesWidget )
	PlayerStylesList:setHorizontalCount( 4 )
	PlayerStylesList:setSpacing( 41 )
	PlayerStylesList:setDataSource( "ZmPlayerStyles" )
	self:addElement( PlayerStylesList )
	self.PlayerStylesList = PlayerStylesList
	
	ScoreboardWidget.navigation = {
		down = PlayerStylesList
	}
	PlayerStylesList.navigation = {
		up = ScoreboardWidget
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ScoreboardWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VignetteBack:close()
		element.AARScoreboardHeaderWidget:close()
		element.ScoreboardWidget:close()
		element.PlayerStylesList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

