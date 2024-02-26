require( "ui.uieditor.widgets.HUD.H1ScoreboardWidget.H1ScoreboardListItem" )

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

	if CoD.UsermapName then
		self.Mapname:setText( Engine.Localize( string.upper( CoD.UsermapName ) ) )
	end
end

local PreLoadFunc = function ( self, controller )
	CoD.ScoreboardUtility.SetScoreboardUIModels( controller )
end

CoD.H1Scoreboard = InheritFrom( LUI.UIElement )
CoD.H1Scoreboard.new = function ( menu, controller )
    local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.H1Scoreboard )
	self.id = "H1Scoreboard"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true

	self.ScoreColumn1 = LUI.UIText.new()
	self.ScoreColumn1:setLeftRight( true, false, 343.5 + 42, 970 + 42 )
	self.ScoreColumn1:setTopBottom( true, false, 306 - 31 + 10, 336 - 31 )
	self.ScoreColumn1:setText( Engine.Localize( "SCORE" ) )
	self.ScoreColumn1:setTTF( "fonts/defaultbold.otf" )
	self.ScoreColumn1:setScale( 0.5 )
	self.ScoreColumn1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn1 )

	self.ScoreColumn2 = LUI.UIText.new()
	self.ScoreColumn2:setLeftRight( true, false, 343.5 + 126, 970 + 126 )
	self.ScoreColumn2:setTopBottom( true, false, 306 - 31 + 10, 336 - 31 )
	self.ScoreColumn2:setText( Engine.Localize( "ELIMINATIONS" ) )
	self.ScoreColumn2:setTTF( "fonts/defaultbold.otf" )
	self.ScoreColumn2:setScale( 0.5 )
	self.ScoreColumn2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn2 )

	self.ScoreColumn3 = LUI.UIText.new()
	self.ScoreColumn3:setLeftRight( true, false, 343.5 + 226, 970 + 226 )
	self.ScoreColumn3:setTopBottom( true, false, 306 - 31 + 10, 336 - 31 )
	self.ScoreColumn3:setText( Engine.Localize( "CRITICAL KILLS" ) )
	self.ScoreColumn3:setTTF( "fonts/defaultbold.otf" )
	self.ScoreColumn3:setScale( 0.5 )
	self.ScoreColumn3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn3 )

	self.ScoreColumn4 = LUI.UIText.new()
	self.ScoreColumn4:setLeftRight( true, false, 343.5 + 326, 970 + 326 )
	self.ScoreColumn4:setTopBottom( true, false, 306 - 31 + 10, 336 - 31 )
	self.ScoreColumn4:setText( Engine.Localize( "REVIVES" ) )
	self.ScoreColumn4:setTTF( "fonts/defaultbold.otf" )
	self.ScoreColumn4:setScale( 0.5 )
	self.ScoreColumn4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn4 )

	self.ScoreColumn5 = LUI.UIText.new()
	self.ScoreColumn5:setLeftRight( true, false, 343.5 + 406, 970 + 406 )
	self.ScoreColumn5:setTopBottom( true, false, 306 - 31 + 10, 336 - 31 )
	self.ScoreColumn5:setText( Engine.Localize( "DOWNS" ) )
	self.ScoreColumn5:setTTF( "fonts/defaultbold.otf" )
	self.ScoreColumn5:setScale( 0.5 )
	self.ScoreColumn5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn5 )

	self.Underline = LUI.UIImage.new()
	self.Underline:setLeftRight( false, false, -302, 331.5 )
	self.Underline:setTopBottom( false, false, -81.5, -80.5 )
	self.Underline:setImage( RegisterImage( "$white" ) )
	self:addElement( self.Underline )

	self.Divider = LUI.UIImage.new()
	self.Divider:setLeftRight( false, false, -195.5, -194.5 )
	self.Divider:setTopBottom( false, false, -98.5, -84 )
	self.Divider:setImage( RegisterImage( "$white" ) )
	self:addElement( self.Divider )

	self.ZombiesText = LUI.UIText.new()
	self.ZombiesText:setLeftRight( true, true, 27, 0 )
	self.ZombiesText:setTopBottom( false, true, -480 + 10, -425 - 10 )
	self.ZombiesText:setText( Engine.Localize( "ZOMBIES" ) )
	self.ZombiesText:setTTF( "fonts/defaultbold.otf" )
	self.ZombiesText:setScale( 0.5 )
	self.ZombiesText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ZombiesText )

	self.RoundText = LUI.UIText.new()
	self.RoundText:setLeftRight( true, true, 0, 14 )
	self.RoundText:setTopBottom( false, true, -480 + 10, -425 - 10 )
	self.RoundText:setText( Engine.Localize( "" ) )
	self.RoundText:setTTF( "fonts/defaultbold.otf" )
	self.RoundText:setScale( 0.5 )
	self.RoundText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.RoundText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.roundsPlayed" ), function ( model )
		local roundsPlayed = Engine.GetModelValue( model )
		
		if roundsPlayed then
			self.RoundText:setText( "ROUND " .. Engine.Localize( roundsPlayed - 1 ) )
		end
	end )
	self:addElement( self.RoundText )

	self.Mapname = LUI.UIText.new()
	self.Mapname:setLeftRight( true, true, 213, 0 )
	self.Mapname:setTopBottom( false, true, -480 + 10, -425 - 10 )
	self.Mapname:setText( Engine.Localize( "" ) )
	self.Mapname:setTTF( "fonts/defaultbold.otf" )
	self.Mapname:setScale( 0.5 )
	self.Mapname:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.Mapname )

	self.Team1 = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	self.Team1:makeFocusable()
	self.Team1:setLeftRight( true, true, 0, 0 )
	self.Team1:setTopBottom( true, true, 0, 0 )
	self.Team1:setDataSource( "ScoreboardTeam1List" )
	self.Team1:setWidgetType( CoD.H1ScoreboardListItem )
	self.Team1:setVerticalCount( 9 )
	self:addElement( self.Team1 )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				self.ScoreColumn1:completeAnimation()
				self.ScoreColumn1:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn1, {} )

				self.ScoreColumn2:completeAnimation()
				self.ScoreColumn2:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn2, {} )

				self.ScoreColumn3:completeAnimation()
				self.ScoreColumn3:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn3, {} )

				self.ScoreColumn4:completeAnimation()
				self.ScoreColumn4:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn4, {} )

				self.ScoreColumn5:completeAnimation()
				self.ScoreColumn5:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn5, {} )

				self.Underline:completeAnimation()
				self.Underline:setAlpha( 0 )
				self.clipFinished( self.Underline, {} )

				self.Divider:completeAnimation()
				self.Divider:setAlpha( 0 )
				self.clipFinished( self.Divider, {} )

				self.ZombiesText:completeAnimation()
				self.ZombiesText:setAlpha( 0 )
				self.clipFinished( self.ZombiesText, {} )

				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 0 )
				self.clipFinished( self.RoundText, {} )

				self.Mapname:completeAnimation()
				self.Mapname:setAlpha( 0 )
				self.clipFinished( self.Mapname, {} )

				self.Team1:completeAnimation()
				self.Team1:setAlpha( 0 )
				self.clipFinished( self.Team1, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				self.ScoreColumn1:completeAnimation()
				self.ScoreColumn1:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn1, {} )

				self.ScoreColumn2:completeAnimation()
				self.ScoreColumn2:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn2, {} )

				self.ScoreColumn3:completeAnimation()
				self.ScoreColumn3:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn3, {} )

				self.ScoreColumn4:completeAnimation()
				self.ScoreColumn4:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn4, {} )

				self.ScoreColumn5:completeAnimation()
				self.ScoreColumn5:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn5, {} )

				self.Underline:completeAnimation()
				self.Underline:setAlpha( 1 )
				self.clipFinished( self.Underline, {} )

				self.Divider:completeAnimation()
				self.Divider:setAlpha( 1 )
				self.clipFinished( self.Divider, {} )

				self.ZombiesText:completeAnimation()
				self.ZombiesText:setAlpha( 1 )
				self.clipFinished( self.ZombiesText, {} )

				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 1 )
				self.clipFinished( self.RoundText, {} )

				self.Mapname:completeAnimation()
				self.Mapname:setAlpha( 1 )
				self.clipFinished( self.Mapname, {} )

				self.Team1:completeAnimation()
				self.Team1:setAlpha( 1 )
				self.clipFinished( self.Team1, {} )
			end
		},
		ForceVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				self.ScoreColumn1:completeAnimation()
				self.ScoreColumn1:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn1, {} )

				self.ScoreColumn2:completeAnimation()
				self.ScoreColumn2:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn2, {} )

				self.ScoreColumn3:completeAnimation()
				self.ScoreColumn3:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn3, {} )

				self.ScoreColumn4:completeAnimation()
				self.ScoreColumn4:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn4, {} )

				self.ScoreColumn5:completeAnimation()
				self.ScoreColumn5:setAlpha( 1 )
				self.clipFinished( self.ScoreColumn5, {} )

				self.Underline:completeAnimation()
				self.Underline:setAlpha( 1 )
				self.clipFinished( self.Underline, {} )

				self.Divider:completeAnimation()
				self.Divider:setAlpha( 1 )
				self.clipFinished( self.Divider, {} )

				self.ZombiesText:completeAnimation()
				self.ZombiesText:setAlpha( 1 )
				self.clipFinished( self.ZombiesText, {} )

				self.RoundText:completeAnimation()
				self.RoundText:setAlpha( 1 )
				self.clipFinished( self.RoundText, {} )

				self.Mapname:completeAnimation()
				self.Mapname:setAlpha( 1 )
				self.clipFinished( self.Mapname, {} )

				self.Team1:completeAnimation()
				self.Team1:setAlpha( 1 )
				self.clipFinished( self.Team1, {} )
			end
		}
	}
	
	self:mergeStateConditions( {
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
		element.ScoreColumn1:close()
		element.ScoreColumn2:close()
		element.ScoreColumn3:close()
		element.ScoreColumn4:close()
		element.ScoreColumn5:close()
		element.Underline:close()
		element.Divider:close()
		element.ZombiesText:close()
		element.RoundText:close()
		element.Mapname:close()
		element.Team1:close()
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end

	return self
end
