require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardHeaderWidgetCP" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardFactionScoresList" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.ScoreboardFactionScoresListCP0.Team1:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( f1_arg1 ), "updateScoreboard" ), function ( model )
		f1_arg0.ScoreboardFactionScoresListCP0.Team1:updateDataSource( false, true )
		f1_arg0.ScoreboardFactionScoresListCP0.Team2:updateDataSource( false, true )
	end )
	f1_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f1_arg0.m_inputDisabled = not Engine.GetModelValue( model )
	end )
end

local PreLoadFunc = function ( self, controller )
	CoD.ScoreboardUtility.SetScoreboardUIModels( controller )
end

CoD.ScoreboardWidgetCP = InheritFrom( LUI.UIElement )
CoD.ScoreboardWidgetCP.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardWidgetCP )
	self.id = "ScoreboardWidgetCP"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1006 )
	self:setTopBottom( true, false, 0, 526 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ScoreboardHeaderWidgetCP0 = CoD.ScoreboardHeaderWidgetCP.new( menu, controller )
	ScoreboardHeaderWidgetCP0:setLeftRight( true, false, 105, 907 )
	ScoreboardHeaderWidgetCP0:setTopBottom( true, false, 0, 32 )
	ScoreboardHeaderWidgetCP0:subscribeToGlobalModel( controller, "Scoreboard", nil, function ( model )
		ScoreboardHeaderWidgetCP0:setModel( model, controller )
	end )
	self:addElement( ScoreboardHeaderWidgetCP0 )
	self.ScoreboardHeaderWidgetCP0 = ScoreboardHeaderWidgetCP0
	
	local ScoreboardFactionScoresListCP0 = CoD.ScoreboardFactionScoresList.new( menu, controller )
	ScoreboardFactionScoresListCP0:setLeftRight( true, false, 105, 906 )
	ScoreboardFactionScoresListCP0:setTopBottom( true, false, 47, 515 )
	ScoreboardFactionScoresListCP0.Team1:setVerticalCount( 4 )
	ScoreboardFactionScoresListCP0.Team2:setAlpha( 0 )
	ScoreboardFactionScoresListCP0.Team2:setVerticalCount( 1 )
	self:addElement( ScoreboardFactionScoresListCP0 )
	self.ScoreboardFactionScoresListCP0 = ScoreboardFactionScoresListCP0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ScoreboardHeaderWidgetCP0:completeAnimation()
				self.ScoreboardHeaderWidgetCP0:setAlpha( 0 )
				self.clipFinished( ScoreboardHeaderWidgetCP0, {} )
				ScoreboardFactionScoresListCP0:completeAnimation()
				self.ScoreboardFactionScoresListCP0:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionScoresListCP0, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 2 )
				local ScoreboardHeaderWidgetCP0Frame2 = function ( ScoreboardHeaderWidgetCP0, event )
					if not event.interrupted then
						ScoreboardHeaderWidgetCP0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
					end
					ScoreboardHeaderWidgetCP0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ScoreboardHeaderWidgetCP0, event )
					else
						ScoreboardHeaderWidgetCP0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScoreboardHeaderWidgetCP0:completeAnimation()
				self.ScoreboardHeaderWidgetCP0:setAlpha( 0 )
				ScoreboardHeaderWidgetCP0Frame2( ScoreboardHeaderWidgetCP0, {} )
				local f8_local1 = function ( f10_arg0, f10_arg1 )
					if not f10_arg1.interrupted then
						f10_arg0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Bounce )
					end
					f10_arg0:setAlpha( 1 )
					if f10_arg1.interrupted then
						self.clipFinished( f10_arg0, f10_arg1 )
					else
						f10_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScoreboardFactionScoresListCP0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				ScoreboardFactionScoresListCP0:setAlpha( 0 )
				ScoreboardFactionScoresListCP0:registerEventHandler( "transition_complete_keyframe", f8_local1 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ScoreboardHeaderWidgetCP0:completeAnimation()
				self.ScoreboardHeaderWidgetCP0:setAlpha( 1 )
				self.clipFinished( ScoreboardHeaderWidgetCP0, {} )
				ScoreboardFactionScoresListCP0:completeAnimation()
				self.ScoreboardFactionScoresListCP0:setAlpha( 1 )
				self.clipFinished( ScoreboardFactionScoresListCP0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	ScoreboardFactionScoresListCP0.id = "ScoreboardFactionScoresListCP0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ScoreboardFactionScoresListCP0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreboardHeaderWidgetCP0:close()
		element.ScoreboardFactionScoresListCP0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

