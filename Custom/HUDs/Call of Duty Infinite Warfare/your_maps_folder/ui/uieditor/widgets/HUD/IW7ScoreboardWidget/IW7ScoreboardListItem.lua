local PostLoadFunc = function ( self, controller )
	self:linkToElementModel( self, "clientNum", true, function ( model )
		if Engine.GetModelValue( model ) then
			local zombiePlayerIcon = nil
			local perControllerModel = Engine.GetModelForController( controller )
			local playerListListModel = Engine.GetModel( perControllerModel, "PlayerList" )
			local ourClientNum = Engine.GetClientNum( controller )
			
			local clientNumToArrayIndex = function ( clientNum, ourClientNum )
				if clientNum == ourClientNum then
					return 1
				elseif clientNum < ourClientNum then
					return 2 + clientNum
				else
					return 1 + clientNum
				end
			end
			
			for clientIndex = 0, Dvar.com_maxclients:get() - 1 do
				local oneBasedListIndex = clientNumToArrayIndex( clientIndex, ourClientNum )
		
				local clientData = Engine.GetPlayerListData( controller, clientIndex )
		
				local clientModel = Engine.GetModel( playerListListModel, oneBasedListIndex - 1 )
		
				for playerListItem, modelItem in pairs( DataSources.PlayerListZM.modelLinks ) do
					if modelItem == "zombiePlayerIcon" then
						if clientIndex == Engine.GetModelValue( model ) then
							zombiePlayerIcon = Engine.GetModelValue( Engine.GetModel( clientModel, modelItem ), clientData[playerListItem] )
						end
					end
				end
			end

			if zombiePlayerIcon ~= nil then
				if zombiePlayerIcon == "uie_t7_zm_hud_score_char1" then
					self.PortraitImage:setImage( RegisterImage( "zm_team_nikolai" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char1_old" then
					self.PortraitImage:setImage( RegisterImage( "zm_team_nikolai_old" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char2" then
					self.PortraitImage:setImage( RegisterImage( "zm_team_takeo" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char2_old" then
					self.PortraitImage:setImage( RegisterImage( "zm_team_takeo_old" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char3" then
					self.PortraitImage:setImage( RegisterImage( "zm_team_dempsey" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char3_old" then
					self.PortraitImage:setImage( RegisterImage( "zm_team_dempsey_old" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char4" then
					self.PortraitImage:setImage( RegisterImage( "zm_team_richtofen" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char4_old" then
					self.PortraitImage:setImage( RegisterImage( "zm_team_richtofen_old" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char5" then
					self.PortraitImage:setImage( RegisterImage( "zm_team_jessica" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char6" then
					self.PortraitImage:setImage( RegisterImage( "zm_team_jack" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char7" then
					self.PortraitImage:setImage( RegisterImage( "zm_team_nero" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char8" then
					self.PortraitImage:setImage( RegisterImage( "zm_team_floyd" ) )
				end
			end
		end
	end )
end

CoD.IW7ScoreboardListItem = InheritFrom( LUI.UIElement )
CoD.IW7ScoreboardListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IW7ScoreboardListItem )
	self.id = "IW7ScoreboardListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 64, 774 )
	self:setTopBottom( true, false, 58, 100 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true

    self.BorderB = LUI.UIImage.new()
	self.BorderB:setLeftRight( true, false, 64, 774 )
	self.BorderB:setTopBottom( true, false, 99, 100 )
	self.BorderB:setImage( RegisterImage( "$white" ) )
	self.BorderB:setRGB( 0.85, 0.16, 0.47 )
	self.BorderB:setAlpha( 0.66 )
	self:addElement( self.BorderB )

    self.BorderT = LUI.UIImage.new()
	self.BorderT:setLeftRight( true, false, 64, 774 )
	self.BorderT:setTopBottom( true, false, 58, 59 )
	self.BorderT:setImage( RegisterImage( "$white" ) )
	self.BorderT:setRGB( 0.85, 0.16, 0.47 )
	self.BorderT:setAlpha( 0.66 )
	self:addElement( self.BorderT )

    self.BorderL = LUI.UIImage.new()
	self.BorderL:setLeftRight( true, false, 64, 65 )
	self.BorderL:setTopBottom( true, false, 58, 100 )
	self.BorderL:setImage( RegisterImage( "$white" ) )
	self.BorderL:setRGB( 0.85, 0.16, 0.47 )
	self.BorderL:setAlpha( 0.66 )
	self:addElement( self.BorderL )

    self.BorderR = LUI.UIImage.new()
	self.BorderR:setLeftRight( true, false, 773, 774 )
	self.BorderR:setTopBottom( true, false, 58, 100 )
	self.BorderR:setImage( RegisterImage( "$white" ) )
	self.BorderR:setRGB( 0.85, 0.16, 0.47 )
	self.BorderR:setAlpha( 0.66 )
	self:addElement( self.BorderR )

    self.Background = LUI.UIImage.new()
	self.Background:setLeftRight( true, false, 65, 773 )
	self.Background:setTopBottom( true, false, 59, 99 )
	self.Background:setImage( RegisterImage( "$white" ) )
	self.Background:setRGB( 0.34, 0.34, 0.36 )
	self.Background:setAlpha( 0.66 )
	self:addElement( self.Background )

    self.PortraitImage = LUI.UIImage.new()
	self.PortraitImage:setLeftRight( true, false, 79, 130 )
	self.PortraitImage:setTopBottom( true, false, 53, 104 )
	self.PortraitImage:setImage( RegisterImage( "blacktransparent" ) )
	self:addElement( self.PortraitImage )
	
	self.Gamertag = LUI.UIText.new()
	self.Gamertag:setLeftRight( true, true, 207.5, 0 )
	self.Gamertag:setTopBottom( true, false, 58 + 13.5, 100 - 13.5 )
	self.Gamertag:setTTF( "fonts/blender_pro_medium.ttf" )
	self.Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.Gamertag:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )

		if clientNum then
			self.Gamertag:setText( Engine.Localize( GetClientName( controller, clientNum ) ) )
		end
	end )
	self:addElement( self.Gamertag )

	self.ScoreColumn1 = LUI.UIText.new()
	self.ScoreColumn1:setLeftRight( true, false, 412.5, 466.5 )
	self.ScoreColumn1:setTopBottom( true, false, 58 + 13.5, 100 - 13.5 )
	self.ScoreColumn1:setTTF( "fonts/blender_pro_medium.ttf" )
	self.ScoreColumn1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreColumn1:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local score = Engine.GetModelValue( model )

		if score then
			self.ScoreColumn1:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 0, score ) ) )
		end
	end )
	self:addElement( self.ScoreColumn1 )
	
	self.ScoreColumn2 = LUI.UIText.new()
	self.ScoreColumn2:setLeftRight( true, false, 497.5, 551.5 )
	self.ScoreColumn2:setTopBottom( true, false, 58 + 13.5, 100 - 13.5 )
	self.ScoreColumn2:setTTF( "fonts/blender_pro_medium.ttf" )
	self.ScoreColumn2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreColumn2:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local kills = Engine.GetModelValue( model )

		if kills then
			self.ScoreColumn2:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 1, kills ) ) )
		end
	end )
	self:addElement( self.ScoreColumn2 )
	
	self.ScoreColumn3 = LUI.UIText.new()
	self.ScoreColumn3:setLeftRight( true, false, 586, 640 )
	self.ScoreColumn3:setTopBottom( true, false, 58 + 13.5, 100 - 13.5 )
	self.ScoreColumn3:setTTF( "fonts/blender_pro_medium.ttf" )
	self.ScoreColumn3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreColumn3:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local headshots = Engine.GetModelValue( model )

		if headshots then
			self.ScoreColumn3:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 4, headshots ) ) )
		end
	end )
	self:addElement( self.ScoreColumn3 )
	
	self.ScoreColumn4 = LUI.UIText.new()
	self.ScoreColumn4:setLeftRight( true, false, 657.5, 711.5 )
	self.ScoreColumn4:setTopBottom( true, false, 58 + 13.5, 100 - 13.5 )
	self.ScoreColumn4:setTTF( "fonts/blender_pro_medium.ttf" )
	self.ScoreColumn4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreColumn4:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local revives = Engine.GetModelValue( model )

		if revives then
			self.ScoreColumn4:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 3, revives ) ) )
		end
	end )
	self:addElement( self.ScoreColumn4 )
	
	self.ScoreColumn5 = LUI.UIText.new()
	self.ScoreColumn5:setLeftRight( true, false, 715.5, 769.5 )
	self.ScoreColumn5:setTopBottom( true, false, 58 + 13.5, 100 - 13.5 )
	self.ScoreColumn5:setTTF( "fonts/blender_pro_medium.ttf" )
	self.ScoreColumn5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreColumn5:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local downs = Engine.GetModelValue( model )

		if downs then
			self.ScoreColumn5:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 2, downs ) ) )
		end
	end )
	self:addElement( self.ScoreColumn5 )
	
	self.PingText = LUI.UIText.new()
	self.PingText:setLeftRight( true, true, 715.5 + 70, 769.5 + 70 )
	self.PingText:setTopBottom( true, false, 58 + 13.5, 100 - 13.5 )
	self.PingText:setTTF( "fonts/blender_pro_medium.ttf" )
	self.PingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.PingText:linkToElementModel( self, "ping", true, function ( model )
		local ping = Engine.GetModelValue( model )

		if ping then
			if ping > 1 then
				self.PingText:setText( Engine.Localize( "Ping: " .. ping ) )
			end
		end
	end )
	self:addElement( self.PingText )
	
	self.FocusBarB = LUI.UIImage.new()
	self.FocusBarB:setLeftRight( true, false, 64, 774 )
	self.FocusBarB:setTopBottom( true, false, 100 - 3, 100 )
	self.FocusBarB:setRGB( 0.85, 1, 0.47 )
	self.FocusBarB:setAlpha( 0 )
	self:addElement( self.FocusBarB )
	
	self.FocusBarT = LUI.UIImage.new()
	self.FocusBarT:setLeftRight( true, false, 64, 774 )
	self.FocusBarT:setTopBottom( true, false, 58, 58 + 3 )
    self.FocusBarT:setRGB( 0.85, 1, 0.47 )
	self.FocusBarT:setAlpha( 0 )
	self:addElement( self.FocusBarT )

    self.FocusBarL = LUI.UIImage.new()
	self.FocusBarL:setLeftRight( true, false, 64, 64 + 3 )
	self.FocusBarL:setTopBottom( true, false, 58, 100 )
    self.FocusBarL:setRGB( 0.85, 1, 0.47 )
	self.FocusBarL:setAlpha( 0 )
	self:addElement( self.FocusBarL )

    self.FocusBarR = LUI.UIImage.new()
	self.FocusBarR:setLeftRight( true, false, 774 - 3, 774 )
	self.FocusBarR:setTopBottom( true, false, 58, 100 )
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

					element:setRGB( 1, 1, 1 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local FocusAnimationStage1 = function ( randomFloat1, randomFloat2, randomFloat3, element, event )
					if event.interrupted then
						FocusAnimationStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )

						element:setRGB( randomFloat1, randomFloat2, randomFloat3 )

						element:registerEventHandler( "transition_complete_keyframe", FocusAnimationStage2 )
					end
				end

				local randomFloat1 = math.random( 1, 100 ) / 100
				local randomFloat2 = math.random( 1, 100 ) / 100
				local randomFloat3 = math.random( 1, 100 ) / 100

				self.FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.FocusBarB:setRGB( 1, 1, 1 )
				FocusAnimationStage1( randomFloat1, randomFloat2, randomFloat3, self.FocusBarB, {} )

                self.FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.FocusBarT:setRGB( 1, 1, 1 )
				FocusAnimationStage1( randomFloat1, randomFloat2, randomFloat3, self.FocusBarT, {} )

                self.FocusBarL:completeAnimation()
				self.FocusBarL:setAlpha( 1 )
				self.FocusBarL:setRGB( 1, 1, 1 )
				FocusAnimationStage1( randomFloat1, randomFloat2, randomFloat3, self.FocusBarL, {} )

                self.FocusBarR:completeAnimation()
				self.FocusBarR:setAlpha( 1 )
				self.FocusBarR:setRGB( 1, 1, 1 )
				FocusAnimationStage1( randomFloat1, randomFloat2, randomFloat3, self.FocusBarR, {} )

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
		element.BorderB:close()
		element.BorderT:close()
		element.BorderL:close()
		element.BorderR:close()
		element.Background:close()
		element.PortraitImage:close()
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
