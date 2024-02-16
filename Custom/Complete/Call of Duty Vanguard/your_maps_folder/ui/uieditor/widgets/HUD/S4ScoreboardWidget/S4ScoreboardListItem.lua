CoD.S4ScoreboardListItem = InheritFrom( LUI.UIElement )
CoD.S4ScoreboardListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.S4ScoreboardListItem )
	self.id = "S4ScoreboardListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 343.5, 970 )
	self:setTopBottom( true, false, 306, 336 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true

	self.FocusBar = LUI.UIImage.new()
	self.FocusBar:setLeftRight( true, false, 343.5 - 10, 970 + 10 )
	self.FocusBar:setTopBottom( true, false, 306 - 4, 336 + 4 )
	self.FocusBar:setImage( RegisterImage( "v_ui_elements_zm_scoreboard_playerhighlight" ) )
	self.FocusBar:setAlpha( 0 )
	self:addElement( self.FocusBar )
	
	self.Gamertag = LUI.UIText.new()
	self.Gamertag:setLeftRight( true, false, 343.5 - 90, 970 - 90 )
	self.Gamertag:setTopBottom( true, false, 306, 336 )
	self.Gamertag:setTTF( "fonts/main_bold.ttf" )
	self.Gamertag:setScale( 0.5 )
	self.Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.Gamertag:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )

		if clientNum then
			if clientNum == Engine.GetClientNum( controller ) then
				self.Gamertag:setRGB( 1, 0.85, 0.54 )
			end

			self.Gamertag:setText( Engine.Localize( GetClientName( controller, clientNum ) ) )
		end
	end )
	self:addElement( self.Gamertag )

	self.ScoreColumn1 = LUI.UIText.new()
	self.ScoreColumn1:setLeftRight( true, false, 343.5 + 42, 970 + 42 )
	self.ScoreColumn1:setTopBottom( true, false, 306, 336 )
	self.ScoreColumn1:setTTF( "fonts/main_bold.ttf" )
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
	self.ScoreColumn2:setTTF( "fonts/main_bold.ttf" )
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
	self.ScoreColumn3:setTTF( "fonts/main_bold.ttf" )
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
	self.ScoreColumn4:setTTF( "fonts/main_bold.ttf" )
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
	self.ScoreColumn5:setTTF( "fonts/main_bold.ttf" )
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
	self.PingText:setTTF( "fonts/main_bold.ttf" )
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
				self:setupElementClipCounter( 1 )

				self.FocusBar:completeAnimation()
				self.FocusBar:setAlpha( 0 )
				self.clipFinished( self.FocusBar, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )

				self.FocusBar:completeAnimation()
				self.FocusBar:setAlpha( 1 )
				self.clipFinished( self.FocusBar, {} )
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
		element.FocusBar:close()
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
