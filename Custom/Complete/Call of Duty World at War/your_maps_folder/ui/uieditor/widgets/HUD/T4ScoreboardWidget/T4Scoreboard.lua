require( "ui.uieditor.widgets.HUD.T4ScoreboardWidget.T4ScoreboardListItem" )

local PostLoadFunc = function ( self, controller )
	self.Team1:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "updateScoreboard" ), function ( model )
		self.Team1:updateDataSource( false, true )
	end )

	self.Team1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self.Team1:updateDataSource()
	end )

	self.Team1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		self.Team1:updateDataSource()
	end )

	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self.m_inputDisabled = not Engine.GetModelValue( model )
	end )

	self.Team1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1.count" ), function ( model )
		local count = Engine.GetModelValue( model )

		if count then
			self.Team1:setVerticalCount( count )
		end
	end )
end

local PreLoadFunc = function ( self, controller )
	CoD.ScoreboardUtility.SetScoreboardUIModels( controller )
end

CoD.T4Scoreboard = InheritFrom( LUI.UIElement )
CoD.T4Scoreboard.new = function ( menu, controller )
    local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T4Scoreboard )
	self.id = "T4Scoreboard"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true

	self.GameOver = LUI.UIText.new()
	self.GameOver:setLeftRight( true, true, 0, 0 )
	self.GameOver:setTopBottom( true, false, 290, 400 )
	self.GameOver:setText( Engine.Localize( "ZOMBIE_GAME_OVER" ) )
	self.GameOver:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.GameOver:setScale( 0.5 )
	self.GameOver:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( self.GameOver )

	self.Survived = LUI.UIText.new()
	self.Survived:setLeftRight( true, true, 0, 0 )
	self.Survived:setTopBottom( true, false, 353, 428 )
	self.Survived:setText( Engine.Localize( "You Survived 1 Round" ) )
	self.Survived:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.Survived:setScale( 0.5 )
	self.Survived:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.Survived:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.roundsPlayed" ), function ( model )
		local roundsPlayed = Engine.GetModelValue( model )

		if roundsPlayed then
			if (roundsPlayed - 1) > 1 then
				self.Survived:setText( "You Survived " .. Engine.Localize( roundsPlayed - 1 ) .. " Rounds" )
			else
				self.Survived:setText( "You Survived " .. Engine.Localize( roundsPlayed - 1 ) .. " Round" )
			end
		end
	end )
	self:addElement( self.Survived )

	self.ScoreColumn1Shadow = LUI.UIText.new()
	self.ScoreColumn1Shadow:setLeftRight( true, true, 415 + 0.5, 0 + 0.5 )
	self.ScoreColumn1Shadow:setTopBottom( true, false, 154 - 20 + 0.5, 182 - 20 + 0.5 )
	self.ScoreColumn1Shadow:setText( Engine.Localize( "Points" ) )
	self.ScoreColumn1Shadow:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.ScoreColumn1Shadow:setRGB( 0, 0, 0 )
	self.ScoreColumn1Shadow:setScale( 0.5 )
	self.ScoreColumn1Shadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn1Shadow )

	self.ScoreColumn1 = LUI.UIText.new()
	self.ScoreColumn1:setLeftRight( true, true, 415, 0 )
	self.ScoreColumn1:setTopBottom( true, false, 154 - 20, 182 - 20 )
	self.ScoreColumn1:setText( Engine.Localize( "Points" ) )
	self.ScoreColumn1:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.ScoreColumn1:setScale( 0.5 )
	self.ScoreColumn1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn1 )

	self.ScoreColumn2Shadow = LUI.UIText.new()
	self.ScoreColumn2Shadow:setLeftRight( true, true, 523 + 0.5, 0 + 0.5 )
	self.ScoreColumn2Shadow:setTopBottom( true, false, 154 - 20 + 0.5, 182 - 20 + 0.5 )
	self.ScoreColumn2Shadow:setText( Engine.Localize( "Kills" ) )
	self.ScoreColumn2Shadow:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.ScoreColumn2Shadow:setRGB( 0, 0, 0 )
	self.ScoreColumn2Shadow:setScale( 0.5 )
	self.ScoreColumn2Shadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn2Shadow )

	self.ScoreColumn2 = LUI.UIText.new()
	self.ScoreColumn2:setLeftRight( true, true, 523, 0 )
	self.ScoreColumn2:setTopBottom( true, false, 154 - 20, 182 - 20 )
	self.ScoreColumn2:setText( Engine.Localize( "Kills" ) )
	self.ScoreColumn2:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.ScoreColumn2:setScale( 0.5 )
	self.ScoreColumn2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn2 )

	self.ScoreColumn3Shadow = LUI.UIText.new()
	self.ScoreColumn3Shadow:setLeftRight( true, true, 592 + 0.5, 0 + 0.5 )
	self.ScoreColumn3Shadow:setTopBottom( true, false, 154 - 20 + 0.5, 182 - 20 + 0.5 )
	self.ScoreColumn3Shadow:setText( Engine.Localize( "Downs" ) )
	self.ScoreColumn3Shadow:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.ScoreColumn3Shadow:setRGB( 0, 0, 0 )
	self.ScoreColumn3Shadow:setScale( 0.5 )
	self.ScoreColumn3Shadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn3Shadow )

	self.ScoreColumn3 = LUI.UIText.new()
	self.ScoreColumn3:setLeftRight( true, true, 592, 0 )
	self.ScoreColumn3:setTopBottom( true, false, 154 - 20, 182 - 20 )
	self.ScoreColumn3:setText( Engine.Localize( "Downs" ) )
	self.ScoreColumn3:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.ScoreColumn3:setScale( 0.5 )
	self.ScoreColumn3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn3 )

	self.ScoreColumn4Shadow = LUI.UIText.new()
	self.ScoreColumn4Shadow:setLeftRight( true, true, 682 + 0.5, 0 + 0.5 )
	self.ScoreColumn4Shadow:setTopBottom( true, false, 154 - 20 + 0.5, 182 - 20 + 0.5 )
	self.ScoreColumn4Shadow:setText( Engine.Localize( "Revives" ) )
	self.ScoreColumn4Shadow:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.ScoreColumn4Shadow:setRGB( 0, 0, 0 )
	self.ScoreColumn4Shadow:setScale( 0.5 )
	self.ScoreColumn4Shadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn4Shadow )

	self.ScoreColumn4 = LUI.UIText.new()
	self.ScoreColumn4:setLeftRight( true, true, 682, 0 )
	self.ScoreColumn4:setTopBottom( true, false, 154 - 20, 182 - 20 )
	self.ScoreColumn4:setText( Engine.Localize( "Revives" ) )
	self.ScoreColumn4:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.ScoreColumn4:setScale( 0.5 )
	self.ScoreColumn4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn4 )

	self.ScoreColumn5Shadow = LUI.UIText.new()
	self.ScoreColumn5Shadow:setLeftRight( true, true, 750 + 0.5, 0 + 0.5 )
	self.ScoreColumn5Shadow:setTopBottom( true, false, 154 - 20 + 0.5, 182 - 20 + 0.5 )
	self.ScoreColumn5Shadow:setText( Engine.Localize( "Headshots" ) )
	self.ScoreColumn5Shadow:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.ScoreColumn5Shadow:setRGB( 0, 0, 0 )
	self.ScoreColumn5Shadow:setScale( 0.5 )
	self.ScoreColumn5Shadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn5Shadow )

	self.ScoreColumn5 = LUI.UIText.new()
	self.ScoreColumn5:setLeftRight( true, true, 750, 0 )
	self.ScoreColumn5:setTopBottom( true, false, 154 - 20, 182 - 20 )
	self.ScoreColumn5:setText( Engine.Localize( "Headshots" ) )
	self.ScoreColumn5:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.ScoreColumn5:setScale( 0.5 )
	self.ScoreColumn5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn5 )

	self.ScoreColumn6Shadow = LUI.UIText.new()
	self.ScoreColumn6Shadow:setLeftRight( true, true, 887 + 0.5, 0 + 0.5 )
	self.ScoreColumn6Shadow:setTopBottom( true, false, 154 - 20 + 0.5, 182 - 20 + 0.5 )
	self.ScoreColumn6Shadow:setText( Engine.Localize( "Ping" ) )
	self.ScoreColumn6Shadow:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.ScoreColumn6Shadow:setRGB( 0, 0, 0 )
	self.ScoreColumn6Shadow:setScale( 0.5 )
	self.ScoreColumn6Shadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn6Shadow )

	self.ScoreColumn6 = LUI.UIText.new()
	self.ScoreColumn6:setLeftRight( true, true, 887, 0 )
	self.ScoreColumn6:setTopBottom( true, false, 154 - 20, 182 - 20 )
	self.ScoreColumn6:setText( Engine.Localize( "Ping" ) )
	self.ScoreColumn6:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.ScoreColumn6:setScale( 0.5 )
	self.ScoreColumn6:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn6 )

	self.Team1 = LUI.UIList.new( menu, controller, 7, 0, nil, false, false, 0, 0, false, false )
	self.Team1:makeFocusable()
	self.Team1:setLeftRight( true, true, 0, 0 )
	self.Team1:setTopBottom( true, true, 0, 0 )
	self.Team1:setDataSource( "ScoreboardTeam1List" )
	self.Team1:setWidgetType( CoD.T4ScoreboardListItem )
	self.Team1:setVerticalCount( 9 )
	self:addElement( self.Team1 )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				self.GameOver:completeAnimation()
				self.GameOver:setAlpha( 0 )
				self.clipFinished( self.GameOver, {} )

				self.Survived:completeAnimation()
				self.Survived:setAlpha( 0 )
				self.clipFinished( self.Survived, {} )

				self.ScoreColumn1Shadow:completeAnimation()
				self.ScoreColumn1Shadow:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn1Shadow, {} )

				self.ScoreColumn1:completeAnimation()
				self.ScoreColumn1:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn1, {} )

				self.ScoreColumn2Shadow:completeAnimation()
				self.ScoreColumn2Shadow:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn2Shadow, {} )

				self.ScoreColumn2:completeAnimation()
				self.ScoreColumn2:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn2, {} )

				self.ScoreColumn3Shadow:completeAnimation()
				self.ScoreColumn3Shadow:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn3Shadow, {} )

				self.ScoreColumn3:completeAnimation()
				self.ScoreColumn3:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn3, {} )

				self.ScoreColumn4Shadow:completeAnimation()
				self.ScoreColumn4Shadow:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn4Shadow, {} )

				self.ScoreColumn4:completeAnimation()
				self.ScoreColumn4:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn4, {} )

				self.ScoreColumn5Shadow:completeAnimation()
				self.ScoreColumn5Shadow:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn5Shadow, {} )

				self.ScoreColumn5:completeAnimation()
				self.ScoreColumn5:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn5, {} )

				self.ScoreColumn6Shadow:completeAnimation()
				self.ScoreColumn6Shadow:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn6Shadow, {} )

				self.ScoreColumn6:completeAnimation()
				self.ScoreColumn6:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn6, {} )

				self.Team1:completeAnimation()
				self.Team1:setAlpha( 0 )
				self.clipFinished( self.Team1, {} )
			end
		},
		GameEnded = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				self.GameOver:completeAnimation()
				self.GameOver:setAlpha( 1 )
				self.clipFinished( self.GameOver, {} )

				self.Survived:completeAnimation()
				self.Survived:setAlpha( 1 )
				self.clipFinished( self.Survived, {} )

				self.ScoreColumn1Shadow:completeAnimation()
				self.ScoreColumn1Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn1Shadow, {} )

				self.ScoreColumn1:completeAnimation()
				self.ScoreColumn1:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn1, {} )

				self.ScoreColumn2Shadow:completeAnimation()
				self.ScoreColumn2Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn2Shadow, {} )

				self.ScoreColumn2:completeAnimation()
				self.ScoreColumn2:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn2, {} )

				self.ScoreColumn3Shadow:completeAnimation()
				self.ScoreColumn3Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn3Shadow, {} )

				self.ScoreColumn3:completeAnimation()
				self.ScoreColumn3:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn3, {} )

				self.ScoreColumn4Shadow:completeAnimation()
				self.ScoreColumn4Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn4Shadow, {} )

				self.ScoreColumn4:completeAnimation()
				self.ScoreColumn4:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn4, {} )

				self.ScoreColumn5Shadow:completeAnimation()
				self.ScoreColumn5Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn5Shadow, {} )

				self.ScoreColumn5:completeAnimation()
				self.ScoreColumn5:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn5, {} )

				self.ScoreColumn6Shadow:completeAnimation()
				self.ScoreColumn6Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn6Shadow, {} )

				self.ScoreColumn6:completeAnimation()
				self.ScoreColumn6:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn6, {} )

				self.Team1:completeAnimation()
				self.Team1:setAlpha( 1 )
				self.clipFinished( self.Team1, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				self.GameOver:completeAnimation()
				self.GameOver:setAlpha( 0 )
				self.clipFinished( self.GameOver, {} )

				self.Survived:completeAnimation()
				self.Survived:setAlpha( 0 )
				self.clipFinished( self.Survived, {} )

				self.ScoreColumn1Shadow:completeAnimation()
				self.ScoreColumn1Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn1Shadow, {} )

				self.ScoreColumn1:completeAnimation()
				self.ScoreColumn1:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn1, {} )

				self.ScoreColumn2Shadow:completeAnimation()
				self.ScoreColumn2Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn2Shadow, {} )

				self.ScoreColumn2:completeAnimation()
				self.ScoreColumn2:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn2, {} )

				self.ScoreColumn3Shadow:completeAnimation()
				self.ScoreColumn3Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn3Shadow, {} )

				self.ScoreColumn3:completeAnimation()
				self.ScoreColumn3:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn3, {} )

				self.ScoreColumn4Shadow:completeAnimation()
				self.ScoreColumn4Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn4Shadow, {} )

				self.ScoreColumn4:completeAnimation()
				self.ScoreColumn4:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn4, {} )

				self.ScoreColumn5Shadow:completeAnimation()
				self.ScoreColumn5Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn5Shadow, {} )

				self.ScoreColumn5:completeAnimation()
				self.ScoreColumn5:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn5, {} )

				self.ScoreColumn6Shadow:completeAnimation()
				self.ScoreColumn6Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn6Shadow, {} )

				self.ScoreColumn6:completeAnimation()
				self.ScoreColumn6:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn6, {} )

				self.Team1:completeAnimation()
				self.Team1:setAlpha( 1 )
				self.clipFinished( self.Team1, {} )
			end
		},
		ForceVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				self.GameOver:completeAnimation()
				self.GameOver:setAlpha( 0 )
				self.clipFinished( self.GameOver, {} )

				self.Survived:completeAnimation()
				self.Survived:setAlpha( 0 )
				self.clipFinished( self.Survived, {} )

				self.ScoreColumn1Shadow:completeAnimation()
				self.ScoreColumn1Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn1Shadow, {} )

				self.ScoreColumn1:completeAnimation()
				self.ScoreColumn1:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn1, {} )

				self.ScoreColumn2Shadow:completeAnimation()
				self.ScoreColumn2Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn2Shadow, {} )

				self.ScoreColumn2:completeAnimation()
				self.ScoreColumn2:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn2, {} )

				self.ScoreColumn3Shadow:completeAnimation()
				self.ScoreColumn3Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn3Shadow, {} )

				self.ScoreColumn3:completeAnimation()
				self.ScoreColumn3:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn3, {} )

				self.ScoreColumn4Shadow:completeAnimation()
				self.ScoreColumn4Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn4Shadow, {} )

				self.ScoreColumn4:completeAnimation()
				self.ScoreColumn4:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn4, {} )

				self.ScoreColumn5Shadow:completeAnimation()
				self.ScoreColumn5Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn5Shadow, {} )

				self.ScoreColumn5:completeAnimation()
				self.ScoreColumn5:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn5, {} )

				self.ScoreColumn6Shadow:completeAnimation()
				self.ScoreColumn6Shadow:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn6Shadow, {} )

				self.ScoreColumn6:completeAnimation()
				self.ScoreColumn6:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn6, {} )

				self.Team1:completeAnimation()
				self.Team1:setAlpha( 1 )
				self.clipFinished( self.Team1, {} )
			end
		}
	}
	
	self:mergeStateConditions( {
		{
			stateName = "GameEnded",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		},
		{
			stateName = "ForceVisible",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "forceScoreboard", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		} )
	end )

	self.Team1.id = "Team1"

	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Team1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameOver:close()
		element.Survived:close()
		element.ScoreColumn1Shadow:close()
		element.ScoreColumn1:close()
		element.ScoreColumn2Shadow:close()
		element.ScoreColumn2:close()
		element.ScoreColumn3Shadow:close()
		element.ScoreColumn3:close()
		element.ScoreColumn4Shadow:close()
		element.ScoreColumn4:close()
		element.ScoreColumn5Shadow:close()
		element.ScoreColumn5:close()
		element.ScoreColumn6Shadow:close()
		element.ScoreColumn6:close()
		element.Team1:close()
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end

	return self
end
