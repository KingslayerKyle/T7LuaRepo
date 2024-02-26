CoD.H1ScoreboardListItem = InheritFrom( LUI.UIElement )
CoD.H1ScoreboardListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.H1ScoreboardListItem )
	self.id = "H1ScoreboardListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 343.5, 970 )
	self:setTopBottom( true, false, 306, 336 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true

	self.Background = LUI.UIImage.new()
	self.Background:setLeftRight( true, false, 343.5, 970 )
	self.Background:setTopBottom( true, false, 306, 336 )
	self.Background:setImage( RegisterImage( "$white" ) )
	self.Background:setRGB( 0, 0, 0 )
	self.Background:setAlpha( 0.5 )
	self:addElement( self.Background )

	self.FocusBarB = LUI.UIImage.new()
	self.FocusBarB:setLeftRight( true, false, 343.5 + 1, 970 - 1 )
	self.FocusBarB:setTopBottom( true, false, 335, 336 )
	self.FocusBarB:setImage( RegisterImage( "$white" ) )
	self.FocusBarB:setRGB( 0, 1, 0 )
	self.FocusBarB:setAlpha( 0 )
	self:addElement( self.FocusBarB )

	self.FocusBarT = LUI.UIImage.new()
	self.FocusBarT:setLeftRight( true, false, 343.5 + 1, 970 - 1 )
	self.FocusBarT:setTopBottom( true, false, 306, 307 )
	self.FocusBarT:setImage( RegisterImage( "$white" ) )
	self.FocusBarT:setRGB( 0, 1, 0 )
	self.FocusBarT:setAlpha( 0 )
	self:addElement( self.FocusBarT )

	self.FocusBarL = LUI.UIImage.new()
	self.FocusBarL:setLeftRight( true, false, 343.5, 344.5 )
	self.FocusBarL:setTopBottom( true, false, 306, 336 )
	self.FocusBarL:setImage( RegisterImage( "$white" ) )
	self.FocusBarL:setRGB( 0, 1, 0 )
	self.FocusBarL:setAlpha( 0 )
	self:addElement( self.FocusBarL )

	self.FocusBarR = LUI.UIImage.new()
	self.FocusBarR:setLeftRight( true, false, 969, 970 )
	self.FocusBarR:setTopBottom( true, false, 306, 336 )
	self.FocusBarR:setImage( RegisterImage( "$white" ) )
	self.FocusBarR:setRGB( 0, 1, 0 )
	self.FocusBarR:setAlpha( 0 )
	self:addElement( self.FocusBarR )
	
	self.Gamertag = LUI.UIText.new()
	self.Gamertag:setLeftRight( true, false, 208.5, 835 )
	self.Gamertag:setTopBottom( true, false, 306, 336 )
	self.Gamertag:setTTF( "fonts/defaultbold.otf" )
	self.Gamertag:setScale( 0.5 )
	self.Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.Gamertag:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )

		if clientNum then
			if clientNum == Engine.GetClientNum( controller ) then
				self.Gamertag:setRGB( 1, 0.85, 0.54 )
			end

			self.Gamertag:setText( string.upper( Engine.Localize( GetClientName( controller, clientNum ) ) ) )
		end
	end )
	self:addElement( self.Gamertag )

	self.ScoreColumn1 = LUI.UIText.new()
	self.ScoreColumn1:setLeftRight( true, false, 343.5 + 42, 970 + 42 )
	self.ScoreColumn1:setTopBottom( true, false, 306, 336 )
	self.ScoreColumn1:setTTF( "fonts/defaultbold.otf" )
	self.ScoreColumn1:setScale( 0.5 )
	self.ScoreColumn1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.ScoreColumn1:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local score = Engine.GetModelValue( model )

		if score then
			self.ScoreColumn1:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 0, score ) ) )
		end
	end )
	self:addElement( self.ScoreColumn1 )
	
	self.ScoreColumn2 = LUI.UIText.new()
	self.ScoreColumn2:setLeftRight( true, false, 343.5 + 126, 970 + 126 )
	self.ScoreColumn2:setTopBottom( true, false, 306, 336 )
	self.ScoreColumn2:setTTF( "fonts/defaultbold.otf" )
	self.ScoreColumn2:setScale( 0.5 )
	self.ScoreColumn2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.ScoreColumn2:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local kills = Engine.GetModelValue( model )

		if kills then
			self.ScoreColumn2:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 1, kills ) ) )
		end
	end )
	self:addElement( self.ScoreColumn2 )
	
	self.ScoreColumn3 = LUI.UIText.new()
	self.ScoreColumn3:setLeftRight( true, false, 343.5 + 226, 970 + 226 )
	self.ScoreColumn3:setTopBottom( true, false, 306, 336 )
	self.ScoreColumn3:setTTF( "fonts/defaultbold.otf" )
	self.ScoreColumn3:setScale( 0.5 )
	self.ScoreColumn3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.ScoreColumn3:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local headshots = Engine.GetModelValue( model )

		if headshots then
			self.ScoreColumn3:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 4, headshots ) ) )
		end
	end )
	self:addElement( self.ScoreColumn3 )
	
	self.ScoreColumn4 = LUI.UIText.new()
	self.ScoreColumn4:setLeftRight( true, false, 343.5 + 326, 970 + 326 )
	self.ScoreColumn4:setTopBottom( true, false, 306, 336 )
	self.ScoreColumn4:setTTF( "fonts/defaultbold.otf" )
	self.ScoreColumn4:setScale( 0.5 )
	self.ScoreColumn4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.ScoreColumn4:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local revives = Engine.GetModelValue( model )

		if revives then
			self.ScoreColumn4:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 3, revives ) ) )
		end
	end )
	self:addElement( self.ScoreColumn4 )
	
	self.ScoreColumn5 = LUI.UIText.new()
	self.ScoreColumn5:setLeftRight( true, false, 343.5 + 406, 970 + 406 )
	self.ScoreColumn5:setTopBottom( true, false, 306, 336 )
	self.ScoreColumn5:setTTF( "fonts/defaultbold.otf" )
	self.ScoreColumn5:setScale( 0.5 )
	self.ScoreColumn5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.ScoreColumn5:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local downs = Engine.GetModelValue( model )

		if downs then
			self.ScoreColumn5:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 2, downs ) ) )
		end
	end )
	self:addElement( self.ScoreColumn5 )
	
	self.PingText = LUI.UIText.new()
	self.PingText:setLeftRight( true, false, 343.5 + 476, 970 + 476 )
	self.PingText:setTopBottom( true, false, 306, 336 )
	self.PingText:setTTF( "fonts/defaultbold.otf" )
	self.PingText:setScale( 0.5 )
	self.PingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.PingText:linkToElementModel( self, "ping", true, function ( model )
		local ping = Engine.GetModelValue( model )

		if ping then
			if ping > 1 then
				self.PingText:setText( Engine.Localize( "PING: " .. ping ) )
			end
		end
	end )
	self:addElement( self.PingText )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				self.FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( self.FocusBarB, {} )

                self.FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( self.FocusBarT, {} )

                self.FocusBarL:completeAnimation()
				self.FocusBarL:setAlpha( 0 )
				self.clipFinished( self.FocusBarL, {} )

                self.FocusBarR:completeAnimation()
				self.FocusBarR:setAlpha( 0 )
				self.clipFinished( self.FocusBarR, {} )
			end,
			Focus = function ()
                self:setupElementClipCounter( 4 )

				local FocusAnimationStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end

					element:setRGB( 0, 1, 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local FocusAnimationStage1 = function ( randomFloat, element, event )
					if event.interrupted then
						FocusAnimationStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )

						element:setRGB( 0, randomFloat, 0 )

						element:registerEventHandler( "transition_complete_keyframe", FocusAnimationStage2 )
					end
				end

				local randomFloat = math.random( 45, 90 ) / 100

				self.FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0.75 )
				self.FocusBarB:setRGB( 0, 1, 0 )
				FocusAnimationStage1( randomFloat, self.FocusBarB, {} )

                self.FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.75 )
				self.FocusBarT:setRGB( 0, 1, 0 )
				FocusAnimationStage1( randomFloat, self.FocusBarT, {} )

                self.FocusBarL:completeAnimation()
				self.FocusBarL:setAlpha( 0.75 )
				self.FocusBarL:setRGB( 0, 1, 0 )
				FocusAnimationStage1( randomFloat, self.FocusBarL, {} )

                self.FocusBarR:completeAnimation()
				self.FocusBarR:setAlpha( 0.75 )
				self.FocusBarR:setRGB( 0, 1, 0 )
				FocusAnimationStage1( randomFloat, self.FocusBarR, {} )

				self.nextClip = "Focus"
			end
		}
	}

	self:linkToElementModel( self, "clientNum", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientNum"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerIndex" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "deadSpectator.playerIndex"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Background:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.FocusBarL:close()
		element.FocusBarR:close()
		element.Gamertag:close()
		element.ScoreColumn1:close()
		element.ScoreColumn2:close()
		element.ScoreColumn3:close()
		element.ScoreColumn4:close()
		element.ScoreColumn5:close()
		element.PingText:close()
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end

	return self
end
