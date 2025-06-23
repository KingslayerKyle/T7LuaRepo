local PostLoadFunc = function ( self, controller )
	self:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )

		if clientNum then
			self.Gamertag:setRGB( ZombieClientScoreboardColor( clientNum ) )
			self.ScoreColumn1:setRGB( ZombieClientScoreboardColor( clientNum ) )
			self.ScoreColumn2:setRGB( ZombieClientScoreboardColor( clientNum ) )
			self.ScoreColumn3:setRGB( ZombieClientScoreboardColor( clientNum ) )
			self.ScoreColumn4:setRGB( ZombieClientScoreboardColor( clientNum ) )
			self.ScoreColumn5:setRGB( ZombieClientScoreboardColor( clientNum ) )
			self.ScoreColumn6:setRGB( ZombieClientScoreboardColor( clientNum ) )
		end
	end )
end

CoD.T4ScoreboardListItem = InheritFrom( LUI.UIElement )
CoD.T4ScoreboardListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T4ScoreboardListItem )
	self.id = "T4ScoreboardListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 738 )
	self:setTopBottom( true, false, 0, 18 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true

	self.Background = LUI.UIImage.new()
	self.Background:setLeftRight( true, false, 271, 1009 )
	self.Background:setTopBottom( true, false, 160, 178 )
	self.Background:setImage( RegisterImage( "blacktransparent" ) )
	self.Background:setRGB( 0.41, 0, 0 )
	self.Background:setAlpha( 0.75 )
	self.Background:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )
		
		if clientNum ~= nil then
			if clientNum ~= -1 then
				self.Background:setImage( RegisterImage( "t4_scorebar_zom_long_" .. (clientNum + 1) ) )
			else
				self.Background:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.Background )
	
	self.Gamertag = LUI.UIText.new()
	self.Gamertag:setLeftRight( true, true, 235, 0 )
	self.Gamertag:setTopBottom( true, false, 154, 184 )
	self.Gamertag:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.Gamertag:setScale( 0.5 )
	self.Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.Gamertag:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )

		if clientNum then
			self.Gamertag:setText( Engine.Localize( GetClientName( controller, clientNum ) ) )
		end
	end )
	self:addElement( self.Gamertag )

	self.ScoreColumn1 = LUI.UIText.new()
	self.ScoreColumn1:setLeftRight( true, true, 602, 0 )
	self.ScoreColumn1:setTopBottom( true, false, 154, 184 )
	self.ScoreColumn1:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
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
	self.ScoreColumn2:setLeftRight( true, true, 713, 0 )
	self.ScoreColumn2:setTopBottom( true, false, 154, 184 )
	self.ScoreColumn2:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
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
	self.ScoreColumn3:setLeftRight( true, true, 845, 0 )
	self.ScoreColumn3:setTopBottom( true, false, 154, 184 )
	self.ScoreColumn3:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.ScoreColumn3:setScale( 0.5 )
	self.ScoreColumn3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.ScoreColumn3:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local downs = Engine.GetModelValue( model )

		if downs then
			self.ScoreColumn3:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 2, downs ) ) )
		end
	end )
	self:addElement( self.ScoreColumn3 )
	
	self.ScoreColumn4 = LUI.UIText.new()
	self.ScoreColumn4:setLeftRight( true, true, 983, 0 )
	self.ScoreColumn4:setTopBottom( true, false, 154, 184 )
	self.ScoreColumn4:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
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
	self.ScoreColumn5:setLeftRight( true, true, 1119, 0 )
	self.ScoreColumn5:setTopBottom( true, false, 154, 184 )
	self.ScoreColumn5:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.ScoreColumn5:setScale( 0.5 )
	self.ScoreColumn5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.ScoreColumn5:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local headshots = Engine.GetModelValue( model )

		if headshots then
			self.ScoreColumn5:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 4, headshots ) ) )
		end
	end )
	self:addElement( self.ScoreColumn5 )
	
	self.ScoreColumn6 = LUI.UIText.new()
	self.ScoreColumn6:setLeftRight( true, true, 1258, 0 )
	self.ScoreColumn6:setTopBottom( true, false, 154, 184 )
	self.ScoreColumn6:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.ScoreColumn6:setScale( 0.5 )
	self.ScoreColumn6:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.ScoreColumn6:linkToElementModel( self, "ping", true, function ( model )
		local ping = Engine.GetModelValue( model )

		if ping then
			if ping > 1 then
				self.ScoreColumn6:setText( Engine.Localize( ping ) )
			else
				self.ScoreColumn6:setText( Engine.Localize( "0" ) )
			end
		end
	end )
	self:addElement( self.ScoreColumn6 )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.Background:completeAnimation()
				self.Background:setRGB( 0.41, 0, 0 )
				self.clipFinished( self.Background, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )

				self.Background:completeAnimation()
				self.Background:setRGB( 0.61, 0, 0 )
				self.clipFinished( self.Background, {} )
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
		element.Gamertag:close()
		element.ScoreColumn1:close()
		element.ScoreColumn2:close()
		element.ScoreColumn3:close()
		element.ScoreColumn4:close()
		element.ScoreColumn5:close()
		element.ScoreColumn6:close()
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end

	return self
end
