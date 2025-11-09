CoD.T6ScoreboardListItem = InheritFrom( LUI.UIElement )
CoD.T6ScoreboardListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T6ScoreboardListItem )
	self.id = "T6ScoreboardListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 676 )
	self:setTopBottom( true, false, 0, 27 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true

    self.Strip = LUI.UIImage.new()
	self.Strip:setLeftRight( true, false, 398, 1037 )
	self.Strip:setTopBottom( true, false, 276, 283 )
	self.Strip:setImage( RegisterImage( "$white" ) )
	self.Strip:setAlpha( 0.1 )
	self:addElement( self.Strip )

	self.ScoreColumn1BG = LUI.UIImage.new()
	self.ScoreColumn1BG:setLeftRight( true, false, 708, 774 )
	self.ScoreColumn1BG:setTopBottom( true, false, 276, 303 )
	self.ScoreColumn1BG:setImage( RegisterImage( "$white" ) )
	self.ScoreColumn1BG:setRGB( 0, 0.5, 1 )
	self.ScoreColumn1BG:setAlpha( 0.33 )
	self:addElement( self.ScoreColumn1BG )

	self.ScoreColumn2BG = LUI.UIImage.new()
	self.ScoreColumn2BG:setLeftRight( true, false, 840, 906 )
	self.ScoreColumn2BG:setTopBottom( true, false, 276, 303 )
	self.ScoreColumn2BG:setImage( RegisterImage( "$white" ) )
	self.ScoreColumn2BG:setRGB( 0, 0.5, 1 )
	self.ScoreColumn2BG:setAlpha( 0.33 )
	self:addElement( self.ScoreColumn2BG )

	self.ScoreColumn3BG = LUI.UIImage.new()
	self.ScoreColumn3BG:setLeftRight( true, false, 972, 1038 )
	self.ScoreColumn3BG:setTopBottom( true, false, 276, 303 )
	self.ScoreColumn3BG:setImage( RegisterImage( "$white" ) )
	self.ScoreColumn3BG:setRGB( 0, 0.5, 1 )
	self.ScoreColumn3BG:setAlpha( 0.33 )
	self:addElement( self.ScoreColumn3BG )
	
	self.Gamertag = LUI.UIText.new()
	self.Gamertag:setLeftRight( true, true, 427.5, 0 )
	self.Gamertag:setTopBottom( true, false, 274 + 5, 305 - 5 )
	self.Gamertag:setTTF( "fonts/bigFont.ttf" )
	self.Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.Gamertag:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )

		if clientNum then
			self.Gamertag:setText( Engine.Localize( GetClientName( controller, clientNum ) ) )

			if clientNum == Engine.GetClientNum( controller ) then
				self.Gamertag:setRGB( 1, 0.9, 0 )
			else
				self.Gamertag:setRGB( 1, 1, 1 )
			end
		end
	end )
	self:addElement( self.Gamertag )

	self.ScoreColumn1 = LUI.UIText.new()
	self.ScoreColumn1:setLeftRight( true, false, 708, 774 )
	self.ScoreColumn1:setTopBottom( true, false, 274 + 5, 305 - 5 )
	self.ScoreColumn1:setTTF( "fonts/bigFont.ttf" )
	self.ScoreColumn1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreColumn1:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local score = Engine.GetModelValue( model )

		if score then
			self.ScoreColumn1:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 0, score ) ) )
		end
	end )
	self:addElement( self.ScoreColumn1 )
	
	self.ScoreColumn2 = LUI.UIText.new()
	self.ScoreColumn2:setLeftRight( true, false, 774, 840 )
	self.ScoreColumn2:setTopBottom( true, false, 274 + 5, 305 - 5 )
	self.ScoreColumn2:setTTF( "fonts/bigFont.ttf" )
	self.ScoreColumn2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreColumn2:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local kills = Engine.GetModelValue( model )

		if kills then
			self.ScoreColumn2:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 1, kills ) ) )
		end
	end )
	self:addElement( self.ScoreColumn2 )
	
	self.ScoreColumn3 = LUI.UIText.new()
	self.ScoreColumn3:setLeftRight( true, false, 972, 1038 )
	self.ScoreColumn3:setTopBottom( true, false, 274 + 5, 305 - 5 )
	self.ScoreColumn3:setTTF( "fonts/bigFont.ttf" )
	self.ScoreColumn3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreColumn3:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local headshots = Engine.GetModelValue( model )

		if headshots then
			self.ScoreColumn3:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 4, headshots ) ) )
		end
	end )
	self:addElement( self.ScoreColumn3 )
	
	self.ScoreColumn4 = LUI.UIText.new()
	self.ScoreColumn4:setLeftRight( true, false, 906, 972 )
	self.ScoreColumn4:setTopBottom( true, false, 274 + 5, 305 - 5 )
	self.ScoreColumn4:setTTF( "fonts/bigFont.ttf" )
	self.ScoreColumn4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreColumn4:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local revives = Engine.GetModelValue( model )

		if revives then
			self.ScoreColumn4:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 3, revives ) ) )
		end
	end )
	self:addElement( self.ScoreColumn4 )
	
	self.ScoreColumn5 = LUI.UIText.new()
	self.ScoreColumn5:setLeftRight( true, false, 840, 906 )
	self.ScoreColumn5:setTopBottom( true, false, 274 + 5, 305 - 5 )
	self.ScoreColumn5:setTTF( "fonts/bigFont.ttf" )
	self.ScoreColumn5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreColumn5:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local downs = Engine.GetModelValue( model )

		if downs then
			self.ScoreColumn5:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 2, downs ) ) )
		end
	end )
	self:addElement( self.ScoreColumn5 )
	
	self.PingText = LUI.UIText.new()
	self.PingText:setLeftRight( true, false, 1038, 1072 )
	self.PingText:setTopBottom( true, false, 274 + 5, 305 - 5 )
	self.PingText:setTTF( "fonts/bigFont.ttf" )
	self.PingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.PingText:linkToElementModel( self, "ping", true, function ( model )
		local ping = Engine.GetModelValue( model )

		if ping then
			if ping > 1 then
				self.PingText:setText( Engine.Localize( ping ) )
			end
		end
	end )
	self:addElement( self.PingText )
	
	self.FocusBarB = LUI.UIImage.new()
	self.FocusBarB:setLeftRight( true, false, 396, 1037 )
	self.FocusBarB:setTopBottom( true, false, 303, 305 )
	self.FocusBarB:setRGB( 0.85, 1, 0.47 )
	self.FocusBarB:setAlpha( 0 )
	self:addElement( self.FocusBarB )
	
	self.FocusBarT = LUI.UIImage.new()
	self.FocusBarT:setLeftRight( true, false, 396, 1037 )
	self.FocusBarT:setTopBottom( true, false, 274, 276 )
    self.FocusBarT:setRGB( 0.85, 1, 0.47 )
	self.FocusBarT:setAlpha( 0 )
	self:addElement( self.FocusBarT )

    self.FocusBarL = LUI.UIImage.new()
	self.FocusBarL:setLeftRight( true, false, 396, 398 )
	self.FocusBarL:setTopBottom( true, false, 274, 305 )
    self.FocusBarL:setRGB( 0.85, 1, 0.47 )
	self.FocusBarL:setAlpha( 0 )
	self:addElement( self.FocusBarL )

    self.FocusBarR = LUI.UIImage.new()
	self.FocusBarR:setLeftRight( true, false, 1037, 1039 )
	self.FocusBarR:setTopBottom( true, false, 274, 305 )
    self.FocusBarR:setRGB( 0.85, 1, 0.47 )
	self.FocusBarR:setAlpha( 0 )
	self:addElement( self.FocusBarR )
	
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

					element:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local FocusAnimationStage1 = function ( randomFloat1, randomFloat2, element, event )
					if event.interrupted then
						FocusAnimationStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )

						element:setRGB( randomFloat1, randomFloat2, 0 )

						element:registerEventHandler( "transition_complete_keyframe", FocusAnimationStage2 )
					end
				end

				local randomFloat1 = math.random( 75, 100 ) / 100
				local randomFloat2 = math.random( 20, 40 ) / 100

				self.FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.FocusBarB:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
				FocusAnimationStage1( randomFloat1, randomFloat2, self.FocusBarB, {} )

                self.FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.FocusBarT:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
				FocusAnimationStage1( randomFloat1, randomFloat2, self.FocusBarT, {} )

                self.FocusBarL:completeAnimation()
				self.FocusBarL:setAlpha( 1 )
				self.FocusBarL:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
				FocusAnimationStage1( randomFloat1, randomFloat2, self.FocusBarL, {} )

                self.FocusBarR:completeAnimation()
				self.FocusBarR:setAlpha( 1 )
				self.FocusBarR:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
				FocusAnimationStage1( randomFloat1, randomFloat2, self.FocusBarR, {} )

				self.nextClip = "Focus"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Strip:close()
		element.ScoreColumn1BG:close()
		element.ScoreColumn2BG:close()
		element.ScoreColumn3BG:close()
		element.Gamertag:close()
		element.ScoreColumn1:close()
		element.ScoreColumn2:close()
		element.ScoreColumn3:close()
		element.ScoreColumn4:close()
		element.ScoreColumn5:close()
		element.PingText:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.FocusBarL:close()
		element.FocusBarR:close()
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end

	return self
end
