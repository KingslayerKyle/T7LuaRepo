require( "ui.uieditor.widgets.HUD.T8ScoreboardWidget.T8ScoreboardListItem" )

local PostLoadFunc = function ( self, controller )
	self.Team1:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "updateScoreboard" ), function ( model )
		self.Team1:updateDataSource( false, true )
	end )

	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self.m_inputDisabled = not Engine.GetModelValue( model )
	end )

	-- Keep character images up-to-date until the game ends
	for clientIndex = 0, Dvar.com_maxclients:get() - 1 do
		self.Team1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "PlayerList." .. clientIndex .. ".zombiePlayerIcon" ), function ( model )
			-- If we update the images after this is set to 1, the wrong images will be set.
			if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ) ) ~= 1 then
				self.Team1:updateDataSource()
			end
		end )
	end

	self.Team1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1.count" ), function ( model )
		local count = Engine.GetModelValue( model )

		if count then
			self.Team1:setVerticalCount( count )
		end
	end )

	if CoD.UsermapName then
		self.Mapname:setText( Engine.Localize( CoD.UsermapName ) )
	end
end

local PreLoadFunc = function ( self, controller )
	CoD.ScoreboardUtility.SetScoreboardUIModels( controller )
end

CoD.T8Scoreboard = InheritFrom( LUI.UIElement )
CoD.T8Scoreboard.new = function ( menu, controller )
    local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T8Scoreboard )
	self.id = "T8Scoreboard"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true

	self.ScoreColumnBG = LUI.UIImage.new()
	self.ScoreColumnBG:setLeftRight( true, false, 344, 936 )
	self.ScoreColumnBG:setTopBottom( true, false, 129, 158 )
	self.ScoreColumnBG:setImage( RegisterImage( "$white" ) )
	self.ScoreColumnBG:setRGB( 0, 0, 0 )
	self.ScoreColumnBG:setAlpha( 0.5 )
	self:addElement( self.ScoreColumnBG )

	self.ScoreColumnDivider = LUI.UIImage.new()
	self.ScoreColumnDivider:setLeftRight( true, false, 341, 939 )
	self.ScoreColumnDivider:setTopBottom( true, false, 121.5 + 3, 129 + 3 )
	self.ScoreColumnDivider:setImage( RegisterImage( "uie_ui_hud_zm_aar_common_bar" ) )
	self.ScoreColumnDivider:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	self.ScoreColumnDivider:setShaderVector( 0, 0, 0, 0, 0 )
	self.ScoreColumnDivider:setupNineSliceShader( 20, 4 )
	self:addElement( self.ScoreColumnDivider )

	self.Gamertag = LUI.UIText.new()
	self.Gamertag:setLeftRight( true, true, 147, 0 )
	self.Gamertag:setTopBottom( true, false, 126, 157 )
	self.Gamertag:setText( Engine.Localize( "Player Name" ) )
	self.Gamertag:setTTF( "fonts/dinnext_regular.ttf" )
	self.Gamertag:setRGB( 0.83, 0.11, 0.01 )
	self.Gamertag:setScale( 0.5 )
	self.Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.Gamertag )

	self.ScoreColumn1 = LUI.UIText.new()
	self.ScoreColumn1:setLeftRight( true, true, 377, 0 )
	self.ScoreColumn1:setTopBottom( true, false, 126, 157 )
	self.ScoreColumn1:setText( Engine.Localize( "Score" ) )
	self.ScoreColumn1:setTTF( "fonts/dinnext_regular.ttf" )
	self.ScoreColumn1:setRGB( 0.83, 0.11, 0.01 )
	self.ScoreColumn1:setScale( 0.5 )
	self.ScoreColumn1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn1 )

	self.ScoreColumn2 = LUI.UIText.new()
	self.ScoreColumn2:setLeftRight( true, true, 503, 0 )
	self.ScoreColumn2:setTopBottom( true, false, 126, 157 )
	self.ScoreColumn2:setText( Engine.Localize( "Kills" ) )
	self.ScoreColumn2:setTTF( "fonts/dinnext_regular.ttf" )
	self.ScoreColumn2:setRGB( 0.83, 0.11, 0.01 )
	self.ScoreColumn2:setScale( 0.5 )
	self.ScoreColumn2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn2 )

	self.ScoreColumn3 = LUI.UIText.new()
	self.ScoreColumn3:setLeftRight( true, true, 569, 0 )
	self.ScoreColumn3:setTopBottom( true, false, 126, 157 )
	self.ScoreColumn3:setText( Engine.Localize( "Headshots" ) )
	self.ScoreColumn3:setTTF( "fonts/dinnext_regular.ttf" )
	self.ScoreColumn3:setRGB( 0.83, 0.11, 0.01 )
	self.ScoreColumn3:setScale( 0.5 )
	self.ScoreColumn3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn3 )

	self.ScoreColumn4 = LUI.UIText.new()
	self.ScoreColumn4:setLeftRight( true, true, 665, 0 )
	self.ScoreColumn4:setTopBottom( true, false, 126, 157 )
	self.ScoreColumn4:setText( Engine.Localize( "Revives" ) )
	self.ScoreColumn4:setTTF( "fonts/dinnext_regular.ttf" )
	self.ScoreColumn4:setRGB( 0.83, 0.11, 0.01 )
	self.ScoreColumn4:setScale( 0.5 )
	self.ScoreColumn4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn4 )

	self.ScoreColumn5 = LUI.UIText.new()
	self.ScoreColumn5:setLeftRight( true, true, 756, 0 )
	self.ScoreColumn5:setTopBottom( true, false, 126, 157 )
	self.ScoreColumn5:setText( Engine.Localize( "Downs" ) )
	self.ScoreColumn5:setTTF( "fonts/dinnext_regular.ttf" )
	self.ScoreColumn5:setRGB( 0.83, 0.11, 0.01 )
	self.ScoreColumn5:setScale( 0.5 )
	self.ScoreColumn5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.ScoreColumn5 )

	self.Mapname = LUI.UIText.new()
	self.Mapname:setLeftRight( true, true, 0, 0 )
	self.Mapname:setTopBottom( true, false, 84, 142 )
	self.Mapname:setText( Engine.Localize( "" ) )
	self.Mapname:setTTF( "fonts/skorzhen.ttf" )
	self.Mapname:setRGB( 0.58, 0.85, 1 )
	self.Mapname:setScale( 0.5 )
	self.Mapname:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( self.Mapname )

	self.Team1 = LUI.UIList.new( menu, controller, 58.5, 0, nil, false, false, 0, 0, false, false )
	self.Team1:makeFocusable()
	self.Team1:setLeftRight( true, true, 287.5, 0 )
	self.Team1:setTopBottom( true, true, 157.5, 0 )
	self.Team1:setDataSource( "ScoreboardTeam1List" )
	self.Team1:setWidgetType( CoD.T8ScoreboardListItem )
	self.Team1:setVerticalCount( 9 )
	self:addElement( self.Team1 )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				self.ScoreColumnBG:completeAnimation()
				self.ScoreColumnBG:setAlpha( 0 )
				self.clipFinished( self.ScoreColumnBG, {} )

				self.ScoreColumnDivider:completeAnimation()
				self.ScoreColumnDivider:setAlpha( 0 )
				self.clipFinished( self.ScoreColumnDivider, {} )

				self.Gamertag:completeAnimation()
				self.Gamertag:setAlpha( 0 )
				self.clipFinished( self.Gamertag, {} )

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
				self:setupElementClipCounter( 10 )

				self.ScoreColumnBG:completeAnimation()
				self.ScoreColumnBG:setAlpha( 0.5 )
				self.clipFinished( self.ScoreColumnBG, {} )

				self.ScoreColumnDivider:completeAnimation()
				self.ScoreColumnDivider:setAlpha( 1 )
				self.clipFinished( self.ScoreColumnDivider, {} )

				self.Gamertag:completeAnimation()
				self.Gamertag:setAlpha( 1 )
				self.clipFinished( self.Gamertag, {} )

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
				self:setupElementClipCounter( 10 )

				self.ScoreColumnBG:completeAnimation()
				self.ScoreColumnBG:setAlpha( 0.5 )
				self.clipFinished( self.ScoreColumnBG, {} )

				self.ScoreColumnDivider:completeAnimation()
				self.ScoreColumnDivider:setAlpha( 1 )
				self.clipFinished( self.ScoreColumnDivider, {} )

				self.Gamertag:completeAnimation()
				self.Gamertag:setAlpha( 1 )
				self.clipFinished( self.Gamertag, {} )

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
		element.ScoreColumnBG:close()
		element.ScoreColumnDivider:close()
		element.Gamertag:close()
		element.ScoreColumn1:close()
		element.ScoreColumn2:close()
		element.ScoreColumn3:close()
		element.ScoreColumn4:close()
		element.ScoreColumn5:close()
		element.Mapname:close()
		element.Team1:close()
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end

	return self
end
