require( "ui.uieditor.widgets.HUD.IW7GameOverWidget.IW7GameOverListItem" )

local PostLoadFunc = function ( self, controller )
	if CoD.UsermapName then
		self.Mapname:setText( Engine.Localize( string.upper( CoD.UsermapName ) ) )
	end

	-- Keep character images up-to-date until the game ends
	for clientIndex = 0, Dvar.com_maxclients:get() - 1 do
		self.PlayerList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "PlayerList." .. clientIndex .. ".zombiePlayerIcon" ), function ( model )
			-- If we update the images after this is set to 1, the wrong images will be set.
			if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ) ) ~= 1 then
				self.PlayerList:updateDataSource()
			end
		end )
	end
end

CoD.IW7GameOver = InheritFrom( LUI.UIElement )
CoD.IW7GameOver.new = function ( menu, controller )
    local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IW7GameOver )
	self.id = "IW7GameOver"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.Background = LUI.UIImage.new()
	self.Background:setLeftRight( true, true, 0, 0 )
	self.Background:setTopBottom( true, true, 0, 0 )
	self.Background:setImage( RegisterImage( "$white" ) )
	self.Background:setRGB( 0, 0, 0 )
	self.Background:setAlpha( 0.5 )
	self:addElement( self.Background )

	self.BottomDiagSlice = LUI.UIImage.new()
	self.BottomDiagSlice:setLeftRight( true, true, -100, 100 )
	self.BottomDiagSlice:setTopBottom( false, true, -160, 160 )
	self.BottomDiagSlice:setImage( RegisterImage( "$white" ) )
	self.BottomDiagSlice:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.BottomDiagSlice:setRGB( 0, 0, 0 )
	self.BottomDiagSlice:setZRot( 12 )
	self.BottomDiagSlice:setAlpha( 0.5 )
	self:addElement( self.BottomDiagSlice )

	self.BottomDiagSliceOutline = LUI.UIImage.new()
	self.BottomDiagSliceOutline:setLeftRight( true, true, -100 - 3, 100 - 3 )
	self.BottomDiagSliceOutline:setTopBottom( false, true, -160 - 3, -159 - 3 )
	self.BottomDiagSliceOutline:setImage( RegisterImage( "$white" ) )
	self.BottomDiagSliceOutline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.BottomDiagSliceOutline:setRGB( 0, 1, 0 )
	self.BottomDiagSliceOutline:setZRot( 12 )
	self.BottomDiagSliceOutline:setAlpha( 0.5 )
	self:addElement( self.BottomDiagSliceOutline )

	self.TopDiagSlice = LUI.UIImage.new()
	self.TopDiagSlice:setLeftRight( true, true, -100, 100 )
	self.TopDiagSlice:setTopBottom( true, false, -160, 160 )
	self.TopDiagSlice:setImage( RegisterImage( "$white" ) )
	self.TopDiagSlice:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.TopDiagSlice:setRGB( 0, 0, 0 )
	self.TopDiagSlice:setZRot( 12 )
	self.TopDiagSlice:setAlpha( 0.5 )
	self:addElement( self.TopDiagSlice )

	self.TopDiagSliceOutline = LUI.UIImage.new()
	self.TopDiagSliceOutline:setLeftRight( true, true, -100 + 3, 100 + 3 )
	self.TopDiagSliceOutline:setTopBottom( true, false, 159 + 3, 160 + 3 )
	self.TopDiagSliceOutline:setImage( RegisterImage( "$white" ) )
	self.TopDiagSliceOutline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.TopDiagSliceOutline:setRGB( 0, 1, 0 )
	self.TopDiagSliceOutline:setZRot( 12 )
	self.TopDiagSliceOutline:setAlpha( 0.5 )
	self:addElement( self.TopDiagSliceOutline )

	self.TitleLine = LUI.UIImage.new()
	self.TitleLine:setLeftRight( true, true, 0, 0 )
	self.TitleLine:setTopBottom( true, false, 105, 145 )
	self.TitleLine:setImage( RegisterImage( "cp_menu_title_line_glow" ) )
	self:addElement( self.TitleLine )

	self.ZombiesLogo = LUI.UIImage.new()
	self.ZombiesLogo:setLeftRight( false, true, -365, -156 )
	self.ZombiesLogo:setTopBottom( false, true, -206, -103.5 )
	self.ZombiesLogo:setImage( RegisterImage( "cp_menu_zombies_logo" ) )
	self.ZombiesLogo:setZRot( -1 )
	self:addElement( self.ZombiesLogo )

	self.Mapname = LUI.UIText.new()
	self.Mapname:setLeftRight( false, true, -365 + 12 - 100, -156 + 12 + 100 )
	self.Mapname:setTopBottom( false, true, -206 + 95, -206 + 40 + 95 )
	self.Mapname:setTTF( "fonts/zm_clean.ttf" )
	self.Mapname:setText( Engine.Localize( "" ) )
	self.Mapname:setRGB( 0.85, 0.16, 0.47 )
	self.Mapname:setZRot( 5.5 )
	self.Mapname:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( self.Mapname )

	self.ScenesSurvived = LUI.UIText.new()
	self.ScenesSurvived:setLeftRight( true, false, 0 + 85, 50 + 85 )
	self.ScenesSurvived:setTopBottom( true, false, 0 + 83, 44 + 83 )
	self.ScenesSurvived:setTTF( "fonts/zm_clean.ttf" )
	self.ScenesSurvived:setText( Engine.Localize( "SCENES SURVIVED" ) )
	self.ScenesSurvived:setRGB( 0.78, 0.05, 0 )
	self.ScenesSurvived:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.roundsPlayed" ), function ( model )
		local roundsPlayed = Engine.GetModelValue( model )

		if roundsPlayed then
			self.ScenesSurvived:setText( Engine.Localize( "SCENES SURVIVED " .. roundsPlayed - 1 ) )
		end
	end )
	self:addElement( self.ScenesSurvived )

	self.MatchEnded = LUI.UIText.new()
	self.MatchEnded:setLeftRight( true, false, 0 + 85, 50 + 85 )
	self.MatchEnded:setTopBottom( true, false, 0 + 36, 54 + 36 )
	self.MatchEnded:setTTF( "fonts/zm_clean.ttf" )
	self.MatchEnded:setText( Engine.Localize( "MATCH ENDED" ) )
	self:addElement( self.MatchEnded )

	self.MatchEndedTime1 = LUI.UIText.new()
	self.MatchEndedTime1:setLeftRight( true, true, 85, 0 )
	self.MatchEndedTime1:setTopBottom( true, false, 0 + 123, 34 + 123 )
	self.MatchEndedTime1:setTTF( "fonts/blender_pro_bold.ttf" )
	self.MatchEndedTime1:setText( Engine.Localize( "FOR" ) )
	self.MatchEndedTime1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( self.MatchEndedTime1 )

	self.MatchEndedTime2 = LUI.UIText.new()
	self.MatchEndedTime2:setLeftRight( true, true, 150, 0 )
	self.MatchEndedTime2:setTopBottom( true, false, 0 + 123, 34 + 123 )
	self.MatchEndedTime2:setTTF( "fonts/blender_pro_bold.ttf" )
	self.MatchEndedTime2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.MatchEndedTime2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.time.game_end_time" ), function ( model )
		local game_end_time = Engine.GetModelValue( model )

		if game_end_time then
			self.MatchEndedTime2:setupServerTime( 0 - game_end_time * 1000 )
		end
	end )
	self:addElement( self.MatchEndedTime2 )

	self.PlayerList = LUI.UIList.new( menu, controller, 250, 0, nil, false, false, 0, 0, false, false )
	self.PlayerList:makeFocusable()
	self.PlayerList:setLeftRight( false, false, 0, 0 )
	self.PlayerList:setTopBottom( false, false, 0, 0 )
	self.PlayerList:setWidgetType( CoD.IW7GameOverListItem )
	self.PlayerList:setDataSource( "PlayerListZM" )
	self.PlayerList:setHorizontalCount( 4 )
	self.PlayerList:setZRot( 12 )
	self:addElement( self.PlayerList )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				self.Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( self.Background, {} )

				self.BottomDiagSlice:completeAnimation()
				self.BottomDiagSlice:setAlpha( 0 )
				self.clipFinished( self.BottomDiagSlice, {} )

				self.BottomDiagSliceOutline:completeAnimation()
				self.BottomDiagSliceOutline:setAlpha( 0 )
				self.clipFinished( self.BottomDiagSliceOutline, {} )

				self.TopDiagSlice:completeAnimation()
				self.TopDiagSlice:setAlpha( 0 )
				self.clipFinished( self.TopDiagSlice, {} )

				self.TopDiagSliceOutline:completeAnimation()
				self.TopDiagSliceOutline:setAlpha( 0 )
				self.clipFinished( self.TopDiagSliceOutline, {} )

				self.TitleLine:completeAnimation()
				self.TitleLine:setAlpha( 0 )
				self.clipFinished( self.TitleLine, {} )

				self.ZombiesLogo:completeAnimation()
				self.ZombiesLogo:setAlpha( 0 )
				self.clipFinished( self.ZombiesLogo, {} )

				self.Mapname:completeAnimation()
				self.Mapname:setAlpha( 0 )
				self.clipFinished( self.Mapname, {} )

				self.ScenesSurvived:completeAnimation()
				self.ScenesSurvived:setAlpha( 0 )
				self.clipFinished( self.ScenesSurvived, {} )

				self.MatchEnded:completeAnimation()
				self.MatchEnded:setAlpha( 0 )
				self.clipFinished( self.MatchEnded, {} )

				self.MatchEndedTime1:completeAnimation()
				self.MatchEndedTime1:setAlpha( 0 )
				self.clipFinished( self.MatchEndedTime1, {} )

				self.MatchEndedTime2:completeAnimation()
				self.MatchEndedTime2:setAlpha( 0 )
				self.clipFinished( self.MatchEndedTime2, {} )

				self.PlayerList:completeAnimation()
				self.PlayerList:setAlpha( 0 )
				self.clipFinished( self.PlayerList, {} )
			end,
			Visible = function ()
				self:setupElementClipCounter( 13 )

				local VisibleTransition2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )
					end
	
					element:setAlpha( 0.5 )
	
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				self.Background:completeAnimation()
				self.Background:setAlpha( 0 )
				VisibleTransition2( self.Background, {} )
				
				self.BottomDiagSlice:completeAnimation()
				self.BottomDiagSlice:setAlpha( 0 )
				VisibleTransition2( self.BottomDiagSlice, {} )
				
				self.BottomDiagSliceOutline:completeAnimation()
				self.BottomDiagSliceOutline:setAlpha( 0 )
				VisibleTransition2( self.BottomDiagSliceOutline, {} )
				
				self.TopDiagSlice:completeAnimation()
				self.TopDiagSlice:setAlpha( 0 )
				VisibleTransition2( self.TopDiagSlice, {} )
				
				self.TopDiagSliceOutline:completeAnimation()
				self.TopDiagSliceOutline:setAlpha( 0 )
				VisibleTransition2( self.TopDiagSliceOutline, {} )

				local VisibleTransition1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )
					end
	
					element:setAlpha( 1 )
	
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				self.TitleLine:completeAnimation()
				self.TitleLine:setAlpha( 0 )
				VisibleTransition1( self.TitleLine, {} )

				self.ZombiesLogo:completeAnimation()
				self.ZombiesLogo:setAlpha( 0 )
				VisibleTransition1( self.ZombiesLogo, {} )

				self.Mapname:completeAnimation()
				self.Mapname:setAlpha( 0 )
				VisibleTransition1( self.Mapname, {} )

				self.ScenesSurvived:completeAnimation()
				self.ScenesSurvived:setAlpha( 0 )
				VisibleTransition1( self.ScenesSurvived, {} )

				self.MatchEnded:completeAnimation()
				self.MatchEnded:setAlpha( 0 )
				VisibleTransition1( self.MatchEnded, {} )

				self.MatchEndedTime1:completeAnimation()
				self.MatchEndedTime1:setAlpha( 0 )
				VisibleTransition1( self.MatchEndedTime1, {} )

				self.MatchEndedTime2:completeAnimation()
				self.MatchEndedTime2:setAlpha( 0 )
				VisibleTransition1( self.MatchEndedTime2, {} )

				self.PlayerList:completeAnimation()
				self.PlayerList:setAlpha( 0 )
				VisibleTransition1( self.PlayerList, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				self.Background:completeAnimation()
				self.Background:setAlpha( 0.5 )
				self.clipFinished( self.Background, {} )
				
				self.BottomDiagSlice:completeAnimation()
				self.BottomDiagSlice:setAlpha( 0.5 )
				self.clipFinished( self.BottomDiagSlice, {} )
				
				self.BottomDiagSliceOutline:completeAnimation()
				self.BottomDiagSliceOutline:setAlpha( 0.5 )
				self.clipFinished( self.BottomDiagSliceOutline, {} )
				
				self.TopDiagSlice:completeAnimation()
				self.TopDiagSlice:setAlpha( 0.5 )
				self.clipFinished( self.TopDiagSlice, {} )
				
				self.TopDiagSliceOutline:completeAnimation()
				self.TopDiagSliceOutline:setAlpha( 0.5 )
				self.clipFinished( self.TopDiagSliceOutline, {} )
				
				self.TitleLine:completeAnimation()
				self.TitleLine:setAlpha( 1 )
				self.clipFinished( self.TitleLine, {} )

				self.ZombiesLogo:completeAnimation()
				self.ZombiesLogo:setAlpha( 1 )
				self.clipFinished( self.ZombiesLogo, {} )

				self.Mapname:completeAnimation()
				self.Mapname:setAlpha( 1 )
				self.clipFinished( self.Mapname, {} )
				
				self.ScenesSurvived:completeAnimation()
				self.ScenesSurvived:setAlpha( 1 )
				self.clipFinished( self.ScenesSurvived, {} )
				
				self.MatchEnded:completeAnimation()
				self.MatchEnded:setAlpha( 1 )
				self.clipFinished( self.MatchEnded, {} )

				self.MatchEndedTime1:completeAnimation()
				self.MatchEndedTime1:setAlpha( 1 )
				self.clipFinished( self.MatchEndedTime1, {} )

				self.MatchEndedTime2:completeAnimation()
				self.MatchEndedTime2:setAlpha( 1 )
				self.clipFinished( self.MatchEndedTime2, {} )

				self.PlayerList:completeAnimation()
				self.PlayerList:setAlpha( 1 )
				self.clipFinished( self.PlayerList, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
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

	self.PlayerList.id = "PlayerList"

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Background:close()
		element.BottomDiagSlice:close()
		element.BottomDiagSliceOutline:close()
		element.TopDiagSlice:close()
		element.TopDiagSliceOutline:close()
		element.TitleLine:close()
		element.ZombiesLogo:close()
		element.Mapname:close()
		element.ScenesSurvived:close()
		element.MatchEnded:close()
		element.MatchEndedTime1:close()
		element.MatchEndedTime2:close()
		element.PlayerList:close()
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end

	return self
end
