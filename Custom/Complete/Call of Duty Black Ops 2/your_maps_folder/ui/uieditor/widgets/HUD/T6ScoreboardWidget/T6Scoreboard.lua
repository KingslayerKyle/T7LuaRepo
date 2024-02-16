require( "ui.uieditor.widgets.HUD.T6ScoreboardWidget.T6ScoreboardListItem" )

local PostLoadFunc = function ( self, controller )
	self.Team1:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "updateScoreboard" ), function ( model )
		self.Team1:updateDataSource( false, true )
	end )

	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self.m_inputDisabled = not Engine.GetModelValue( model )
	end )
	
	if CoD.UsermapName then
		self.Title:setText( Engine.Localize( string.upper( CoD.UsermapName ) ) )
	end
end

local PreLoadFunc = function ( self, controller )
	CoD.ScoreboardUtility.SetScoreboardUIModels( controller )
end

CoD.T6Scoreboard = InheritFrom( LUI.UIElement )
CoD.T6Scoreboard.new = function ( menu, controller )
    local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T6Scoreboard )
	self.id = "T6Scoreboard"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true

	self.HeaderBG = LUI.UIImage.new()
	self.HeaderBG:setLeftRight( true, false, 208, 1072 )
	self.HeaderBG:setTopBottom( true, false, 238, 270 )
	self.HeaderBG:setImage( RegisterImage( "$white" ) )
	self.HeaderBG:setRGB( 0, 0, 0 )
	self.HeaderBG:setAlpha( 0.7 )
	self:addElement( self.HeaderBG )

	self.HeaderBGStrip = LUI.UIImage.new()
	self.HeaderBGStrip:setLeftRight( true, false, 210, 1070 )
	self.HeaderBGStrip:setTopBottom( true, false, 240, 245 )
	self.HeaderBGStrip:setImage( RegisterImage( "$white" ) )
	self.HeaderBGStrip:setAlpha( 0.1 )
	self:addElement( self.HeaderBGStrip )

	self.BG = LUI.UIImage.new()
	self.BG:setLeftRight( true, false, 208, 1072 )
	self.BG:setTopBottom( true, false, 274, 392 )
	self.BG:setImage( RegisterImage( "$white" ) )
	self.BG:setRGB( 0, 0, 0 )
	self.BG:setAlpha( 0.7 )
	self:addElement( self.BG )

	self.BGStrip = LUI.UIImage.new()
	self.BGStrip:setLeftRight( true, false, 210, 398 )
	self.BGStrip:setTopBottom( true, false, 276, 283 )
	self.BGStrip:setImage( RegisterImage( "$white" ) )
	self.BGStrip:setAlpha( 0.1 )
	self:addElement( self.BGStrip )

	self.Title = LUI.UIText.new()
	self.Title:setLeftRight( true, true, 290, 0 )
	self.Title:setTopBottom( true, false, 238 + 4, 270 - 4 )
	self.Title:setText( Engine.Localize( "" ) )
	self.Title:setTTF( "fonts/bigFont.ttf" )
	self.Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.Title )

	self.TeamIconBG = LUI.UIImage.new()
	self.TeamIconBG:setLeftRight( true, false, 208, 398 )
	self.TeamIconBG:setTopBottom( true, false, 274, 392 )
	self.TeamIconBG:setImage( RegisterImage( "$white" ) )
	self.TeamIconBG:setRGB( 0, 0.5, 1 )
	self.TeamIconBG:setAlpha( 0.33 )
	self.TeamIconBG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.TeamIconBG:setShaderVector( 0, 0, 2, 0, 0 )
	self:addElement( self.TeamIconBG )

	self.TeamIcon = LUI.UIImage.new()
	self.TeamIcon:setLeftRight( true, false, 237.5, 366 )
	self.TeamIcon:setTopBottom( true, false, 268.5, 397 )
	self.TeamIcon:setImage( RegisterImage( "team_icon_transit" ) )
	self:addElement( self.TeamIcon )

	self.ScoreColumn1Label = LUI.UIText.new()
	self.ScoreColumn1Label:setLeftRight( true, false, 708, 774 )
	self.ScoreColumn1Label:setTopBottom( true, false, 238 + 6, 270 - 6 )
	self.ScoreColumn1Label:setText( "Score" )
	self.ScoreColumn1Label:setTTF( "fonts/bigFont.ttf" )
	self.ScoreColumn1Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreColumn1Label:setAlpha( 0.5 )
	self:addElement( self.ScoreColumn1Label )

	self.ScoreColumn2Label = LUI.UIText.new()
	self.ScoreColumn2Label:setLeftRight( true, false, 774, 840 )
	self.ScoreColumn2Label:setTopBottom( true, false, 238 + 6, 270 - 6 )
	self.ScoreColumn2Label:setText( "Kills" )
	self.ScoreColumn2Label:setTTF( "fonts/bigFont.ttf" )
	self.ScoreColumn2Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreColumn2Label:setAlpha( 0.5 )
	self:addElement( self.ScoreColumn2Label )

	self.ScoreColumn3Label = LUI.UIText.new()
	self.ScoreColumn3Label:setLeftRight( true, false, 972, 1038 )
	self.ScoreColumn3Label:setTopBottom( true, false, 238 + 6, 270 - 6 )
	self.ScoreColumn3Label:setText( "Headshots" )
	self.ScoreColumn3Label:setTTF( "fonts/bigFont.ttf" )
	self.ScoreColumn3Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreColumn3Label:setAlpha( 0.5 )
	self:addElement( self.ScoreColumn3Label )

	self.ScoreColumn4Label = LUI.UIText.new()
	self.ScoreColumn4Label:setLeftRight( true, false, 906, 972 )
	self.ScoreColumn4Label:setTopBottom( true, false, 238 + 6, 270 - 6 )
	self.ScoreColumn4Label:setText( "Revives" )
	self.ScoreColumn4Label:setTTF( "fonts/bigFont.ttf" )
	self.ScoreColumn4Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreColumn4Label:setAlpha( 0.5 )
	self:addElement( self.ScoreColumn4Label )

	self.ScoreColumn5Label = LUI.UIText.new()
	self.ScoreColumn5Label:setLeftRight( true, false, 840, 906 )
	self.ScoreColumn5Label:setTopBottom( true, false, 238 + 6, 270 - 6 )
	self.ScoreColumn5Label:setText( "Downs" )
	self.ScoreColumn5Label:setTTF( "fonts/bigFont.ttf" )
	self.ScoreColumn5Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreColumn5Label:setAlpha( 0.5 )
	self:addElement( self.ScoreColumn5Label )

	self.PingLabel = LUI.UIText.new()
	self.PingLabel:setLeftRight( true, false, 1038, 1072 )
	self.PingLabel:setTopBottom( true, false, 238 + 6, 270 - 6 )
	self.PingLabel:setText( "Ping" )
	self.PingLabel:setTTF( "fonts/bigFont.ttf" )
	self.PingLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.PingLabel:setAlpha( 0.5 )
	self:addElement( self.PingLabel )

	self.Team1 = LUI.UIList.new( menu, controller, 1, 0, nil, false, false, 0, 0, false, false )
	self.Team1:makeFocusable()
	self.Team1:setLeftRight( true, true, 0, 0 )
	self.Team1:setTopBottom( true, true, 0, 0 )
	self.Team1:setDataSource( "ScoreboardTeam1List" )
	self.Team1:setWidgetType( CoD.T6ScoreboardListItem )
	self.Team1:setVerticalCount( 9 )
	self.Team1:setSpacing( 2 )
	self:addElement( self.Team1 )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				self.HeaderBG:completeAnimation()
				self.HeaderBG:setAlpha( 0 )
				self.clipFinished( self.HeaderBG, {} )

				self.HeaderBGStrip:completeAnimation()
				self.HeaderBGStrip:setAlpha( 0 )
				self.clipFinished( self.HeaderBGStrip, {} )

				self.BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( self.BG, {} )

				self.BGStrip:completeAnimation()
				self.BGStrip:setAlpha( 0 )
				self.clipFinished( self.BGStrip, {} )

				self.Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( self.Title, {} )

				self.TeamIconBG:completeAnimation()
				self.TeamIconBG:setAlpha( 0 )
				self.clipFinished( self.TeamIconBG, {} )

				self.TeamIcon:completeAnimation()
				self.TeamIcon:setAlpha( 0 )
				self.clipFinished( self.TeamIcon, {} )

				self.ScoreColumn1Label:completeAnimation()
				self.ScoreColumn1Label:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn1Label, {} )

				self.ScoreColumn2Label:completeAnimation()
				self.ScoreColumn2Label:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn2Label, {} )

				self.ScoreColumn3Label:completeAnimation()
				self.ScoreColumn3Label:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn3Label, {} )

				self.ScoreColumn4Label:completeAnimation()
				self.ScoreColumn4Label:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn4Label, {} )

				self.ScoreColumn5Label:completeAnimation()
				self.ScoreColumn5Label:setAlpha( 0 )
				self.clipFinished( self.ScoreColumn5Label, {} )

				self.PingLabel:completeAnimation()
				self.PingLabel:setAlpha( 0 )
				self.clipFinished( self.PingLabel, {} )

				self.Team1:completeAnimation()
				self.Team1:setAlpha( 0 )
				self.clipFinished( self.Team1, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				self.HeaderBG:completeAnimation()
				self.HeaderBG:setAlpha( 0.7 )
				self.clipFinished( self.HeaderBG, {} )

				self.HeaderBGStrip:completeAnimation()
				self.HeaderBGStrip:setAlpha( 0.1 )
				self.clipFinished( self.HeaderBGStrip, {} )

				self.BG:completeAnimation()
				self.BG:setAlpha( 0.7 )
				self.clipFinished( self.BG, {} )

				self.BGStrip:completeAnimation()
				self.BGStrip:setAlpha( 0.1 )
				self.clipFinished( self.BGStrip, {} )

				self.Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( self.Title, {} )

				self.TeamIconBG:completeAnimation()
				self.TeamIconBG:setAlpha( 0.33 )
				self.clipFinished( self.TeamIconBG, {} )

				self.TeamIcon:completeAnimation()
				self.TeamIcon:setAlpha( 1 )
				self.clipFinished( self.TeamIcon, {} )

				self.ScoreColumn1Label:completeAnimation()
				self.ScoreColumn1Label:setAlpha( 0.5 )
				self.clipFinished( self.ScoreColumn1Label, {} )

				self.ScoreColumn2Label:completeAnimation()
				self.ScoreColumn2Label:setAlpha( 0.5 )
				self.clipFinished( self.ScoreColumn2Label, {} )

				self.ScoreColumn3Label:completeAnimation()
				self.ScoreColumn3Label:setAlpha( 0.5 )
				self.clipFinished( self.ScoreColumn3Label, {} )

				self.ScoreColumn4Label:completeAnimation()
				self.ScoreColumn4Label:setAlpha( 0.5 )
				self.clipFinished( self.ScoreColumn4Label, {} )

				self.ScoreColumn5Label:completeAnimation()
				self.ScoreColumn5Label:setAlpha( 0.5 )
				self.clipFinished( self.ScoreColumn5Label, {} )

				self.PingLabel:completeAnimation()
				self.PingLabel:setAlpha( 0.5 )
				self.clipFinished( self.PingLabel, {} )

				self.Team1:completeAnimation()
				self.Team1:setAlpha( 1 )
				self.clipFinished( self.Team1, {} )
			end
		},
		ForceVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				self.HeaderBG:completeAnimation()
				self.HeaderBG:setAlpha( 0.7 )
				self.clipFinished( self.HeaderBG, {} )

				self.HeaderBGStrip:completeAnimation()
				self.HeaderBGStrip:setAlpha( 0.1 )
				self.clipFinished( self.HeaderBGStrip, {} )

				self.BG:completeAnimation()
				self.BG:setAlpha( 0.7 )
				self.clipFinished( self.BG, {} )

				self.BGStrip:completeAnimation()
				self.BGStrip:setAlpha( 0.1 )
				self.clipFinished( self.BGStrip, {} )

				self.Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( self.Title, {} )

				self.TeamIconBG:completeAnimation()
				self.TeamIconBG:setAlpha( 0.33 )
				self.clipFinished( self.TeamIconBG, {} )

				self.TeamIcon:completeAnimation()
				self.TeamIcon:setAlpha( 1 )
				self.clipFinished( self.TeamIcon, {} )

				self.ScoreColumn1Label:completeAnimation()
				self.ScoreColumn1Label:setAlpha( 0.5 )
				self.clipFinished( self.ScoreColumn1Label, {} )

				self.ScoreColumn2Label:completeAnimation()
				self.ScoreColumn2Label:setAlpha( 0.5 )
				self.clipFinished( self.ScoreColumn2Label, {} )

				self.ScoreColumn3Label:completeAnimation()
				self.ScoreColumn3Label:setAlpha( 0.5 )
				self.clipFinished( self.ScoreColumn3Label, {} )

				self.ScoreColumn4Label:completeAnimation()
				self.ScoreColumn4Label:setAlpha( 0.5 )
				self.clipFinished( self.ScoreColumn4Label, {} )

				self.ScoreColumn5Label:completeAnimation()
				self.ScoreColumn5Label:setAlpha( 0.5 )
				self.clipFinished( self.ScoreColumn5Label, {} )

				self.PingLabel:completeAnimation()
				self.PingLabel:setAlpha( 0.5 )
				self.clipFinished( self.PingLabel, {} )

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
		element.HeaderBG:close()
		element.HeaderBGStrip:close()
		element.BG:close()
		element.BGStrip:close()
		element.Title:close()
		element.TeamIconBG:close()
		element.TeamIcon:close()
		element.ScoreColumn1Label:close()
		element.ScoreColumn2Label:close()
		element.ScoreColumn3Label:close()
		element.ScoreColumn4Label:close()
		element.ScoreColumn5Label:close()
		element.PingLabel:close()
		element.Team1:close()
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end

	return self
end
