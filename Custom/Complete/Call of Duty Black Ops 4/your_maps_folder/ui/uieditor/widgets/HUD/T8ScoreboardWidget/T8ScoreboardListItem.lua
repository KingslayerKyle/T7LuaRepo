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
					self.PortraitImage:setImage( RegisterImage( "ui_icon_hero_portrait_draft_nikolai" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char1_old" then
					self.PortraitImage:setImage( RegisterImage( "ui_icon_specialist_portrait_nikolai_ultimus" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char2" then
					self.PortraitImage:setImage( RegisterImage( "ui_icon_hero_portrait_draft_takeo" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char2_old" then
					self.PortraitImage:setImage( RegisterImage( "ui_icon_specialist_portrait_takeo_ultimus" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char3" then
					self.PortraitImage:setImage( RegisterImage( "ui_icon_hero_portrait_draft_dempsey" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char3_old" then
					self.PortraitImage:setImage( RegisterImage( "ui_icon_specialist_portrait_dempsey_ultimus" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char4" then
					self.PortraitImage:setImage( RegisterImage( "ui_icon_hero_portrait_draft_richtofen" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char4_old" then
					self.PortraitImage:setImage( RegisterImage( "ui_icon_specialist_portrait_richtofen_ultimus" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char5" then
					self.PortraitImage:setImage( RegisterImage( "ui_icon_hero_portrait_draft_jessica" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char6" then
					self.PortraitImage:setImage( RegisterImage( "ui_icon_hero_portrait_draft_jack" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char7" then
					self.PortraitImage:setImage( RegisterImage( "ui_icon_hero_portrait_draft_nero" ) )

				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char8" then
					self.PortraitImage:setImage( RegisterImage( "ui_icon_hero_portrait_draft_floyd" ) )
				end
			end
		end
	end )
end

CoD.T8ScoreboardListItem = InheritFrom( LUI.UIElement )
CoD.T8ScoreboardListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T8ScoreboardListItem )
	self.id = "T8ScoreboardListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 0 )
	self:setTopBottom( true, false, 0, 0 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true

	self.BackingMid = LUI.UIImage.new()
	self.BackingMid:setLeftRight( true, false, 62, 651 )
	self.BackingMid:setTopBottom( true, false, 10.5, 50.5 )
	self.BackingMid:setImage( RegisterImage( "uie_zm_hud_inventory_backing_mid" ) )
	self:addElement( self.BackingMid )

	self.BackingTipLeft = LUI.UIImage.new()
	self.BackingTipLeft:setLeftRight( true, false, 30, 126 )
	self.BackingTipLeft:setTopBottom( true, false, 10.5, 50.5 )
	self.BackingTipLeft:setImage( RegisterImage( "uie_zm_hud_inventory_backing_tip" ) )
	self:addElement( self.BackingTipLeft )

	self.BackingTipRight = LUI.UIImage.new()
	self.BackingTipRight:setLeftRight( true, false, 580, 676 )
	self.BackingTipRight:setTopBottom( true, false, 10.5, 50.5 )
	self.BackingTipRight:setImage( RegisterImage( "uie_zm_hud_inventory_backing_tip" ) )
	self.BackingTipRight:setZRot( 180 )
	self:addElement( self.BackingTipRight )

	self.FrameTip = LUI.UIImage.new()
	self.FrameTip:setLeftRight( true, false, 0, 93 )
	self.FrameTip:setTopBottom( true, false, 0, 61 )
	self.FrameTip:setImage( RegisterImage( "uie_zm_hud_scoreboard_frame_tip" ) )
	self:addElement( self.FrameTip )

	self.FrameEnd = LUI.UIImage.new()
	self.FrameEnd:setLeftRight( true, false, 610, 681 )
	self.FrameEnd:setTopBottom( true, false, 0, 61 )
	self.FrameEnd:setImage( RegisterImage( "uie_zm_hud_scoreboard_frame_end" ) )
	self:addElement( self.FrameEnd )

	self.PortraitImage = LUI.UIImage.new()
	self.PortraitImage:setLeftRight( true, false, 0, 59 )
	self.PortraitImage:setTopBottom( true, false, 5, 59 )
	self.PortraitImage:setImage( RegisterImage( "blacktransparent" ) )
	self:addElement( self.PortraitImage )
	
	self.Gamertag = LUI.UIText.new()
	self.Gamertag:setLeftRight( true, false, -200, 992.5 )
	self.Gamertag:setTopBottom( true, false, 18, 44 )
	self.Gamertag:setTTF( "fonts/notosans_bold.ttf" )
	self.Gamertag:setScale( 0.5 )
	self.Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.Gamertag:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )

		if clientNum then
			self.Gamertag:setText( Engine.Localize( GetClientName( controller, clientNum ) ) )
		end
	end )
	self:addElement( self.Gamertag )

	self.PingText = LUI.UIText.new()
	self.PingText:setLeftRight( true, false, -200, 992.5 )
	self.PingText:setTopBottom( true, false, 31, 52 )
	self.PingText:setTTF( "fonts/skorzhen.ttf" )
	self.PingText:setScale( 0.5 )
	self.PingText:setAlpha( 0.75 )
	self.PingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.PingText:linkToElementModel( self, "ping", true, function ( model )
		local ping = Engine.GetModelValue( model )

		if ping then
			self.PingText:setText( Engine.Localize( "Ping: " .. ping ) )
		end
	end )
	self:addElement( self.PingText )

	self.ScoreColumn1 = LUI.UIText.new()
	self.ScoreColumn1:setLeftRight( true, false, 95, 992.5 )
	self.ScoreColumn1:setTopBottom( true, false, 17, 47 )
	self.ScoreColumn1:setTTF( "fonts/skorzhen.ttf" )
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
	self.ScoreColumn2:setLeftRight( true, false, 226, 992.5 )
	self.ScoreColumn2:setTopBottom( true, false, 17, 47 )
	self.ScoreColumn2:setTTF( "fonts/skorzhen.ttf" )
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
	self.ScoreColumn3:setLeftRight( true, false, 313, 992.5 )
	self.ScoreColumn3:setTopBottom( true, false, 17, 47 )
	self.ScoreColumn3:setTTF( "fonts/skorzhen.ttf" )
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
	self.ScoreColumn4:setLeftRight( true, false, 400, 992.5 )
	self.ScoreColumn4:setTopBottom( true, false, 17, 47 )
	self.ScoreColumn4:setTTF( "fonts/skorzhen.ttf" )
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
	self.ScoreColumn5:setLeftRight( true, false, 487, 992.5 )
	self.ScoreColumn5:setTopBottom( true, false, 17, 47 )
	self.ScoreColumn5:setTTF( "fonts/skorzhen.ttf" )
	self.ScoreColumn5:setScale( 0.5 )
	self.ScoreColumn5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.ScoreColumn5:linkToElementModel( self, "clientNumScoreInfoUpdated", true, function ( model )
		local downs = Engine.GetModelValue( model )

		if downs then
			self.ScoreColumn5:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 2, downs ) ) )
		end
	end )
	self:addElement( self.ScoreColumn5 )

	self.Divider1 = LUI.UIImage.new()
	self.Divider1:setLeftRight( true, false, 268, 274 )
	self.Divider1:setTopBottom( true, false, 13.5, 47.5 )
	self.Divider1:setImage( RegisterImage( "ximage_84cf831d4add5c3" ) )
	self:addElement( self.Divider1 )

	self.Divider2 = LUI.UIImage.new()
	self.Divider2:setLeftRight( true, false, 387, 393 )
	self.Divider2:setTopBottom( true, false, 13.5, 47.5 )
	self.Divider2:setImage( RegisterImage( "ximage_84cf831d4add5c3" ) )
	self:addElement( self.Divider2 )

	self.Divider3 = LUI.UIImage.new()
	self.Divider3:setLeftRight( true, false, 452, 458 )
	self.Divider3:setTopBottom( true, false, 13.5, 47.5 )
	self.Divider3:setImage( RegisterImage( "ximage_84cf831d4add5c3" ) )
	self:addElement( self.Divider3 )

	self.Divider4 = LUI.UIImage.new()
	self.Divider4:setLeftRight( true, false, 517, 523 )
	self.Divider4:setTopBottom( true, false, 13.5, 47.5 )
	self.Divider4:setImage( RegisterImage( "ximage_84cf831d4add5c3" ) )
	self:addElement( self.Divider4 )

	self.Divider5 = LUI.UIImage.new()
	self.Divider5:setLeftRight( true, false, 582, 588 )
	self.Divider5:setTopBottom( true, false, 13.5, 47.5 )
	self.Divider5:setImage( RegisterImage( "ximage_84cf831d4add5c3" ) )
	self:addElement( self.Divider5 )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				
				self.Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 1, 1 )
				self.clipFinished( self.Gamertag, {} )

				self.PingText:completeAnimation()
				self.PingText:setRGB( 1, 1, 1 )
				self.clipFinished( self.PingText, {} )

				self.ScoreColumn1:completeAnimation()
				self.ScoreColumn1:setRGB( 1, 1, 1 )
				self.clipFinished( self.ScoreColumn1, {} )

				self.ScoreColumn2:completeAnimation()
				self.ScoreColumn2:setRGB( 1, 1, 1 )
				self.clipFinished( self.ScoreColumn2, {} )

				self.ScoreColumn3:completeAnimation()
				self.ScoreColumn3:setRGB( 1, 1, 1 )
				self.clipFinished( self.ScoreColumn3, {} )

				self.ScoreColumn4:completeAnimation()
				self.ScoreColumn4:setRGB( 1, 1, 1 )
				self.clipFinished( self.ScoreColumn4, {} )

				self.ScoreColumn5:completeAnimation()
				self.ScoreColumn5:setRGB( 1, 1, 1 )
				self.clipFinished( self.ScoreColumn5, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				
				self.Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 0.76, 0 )
				self.clipFinished( self.Gamertag, {} )

				self.PingText:completeAnimation()
				self.PingText:setRGB( 0.89, 0.64, 0 )
				self.clipFinished( self.PingText, {} )

				self.ScoreColumn1:completeAnimation()
				self.ScoreColumn1:setRGB( 1, 0.76, 0 )
				self.clipFinished( self.ScoreColumn1, {} )

				self.ScoreColumn2:completeAnimation()
				self.ScoreColumn2:setRGB( 1, 0.76, 0 )
				self.clipFinished( self.ScoreColumn2, {} )

				self.ScoreColumn3:completeAnimation()
				self.ScoreColumn3:setRGB( 1, 0.76, 0 )
				self.clipFinished( self.ScoreColumn3, {} )

				self.ScoreColumn4:completeAnimation()
				self.ScoreColumn4:setRGB( 1, 0.76, 0 )
				self.clipFinished( self.ScoreColumn4, {} )

				self.ScoreColumn5:completeAnimation()
				self.ScoreColumn5:setRGB( 1, 0.76, 0 )
				self.clipFinished( self.ScoreColumn5, {} )
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
		element.BackingMid:close()
		element.BackingTipLeft:close()
		element.BackingTipRight:close()
		element.FrameTip:close()
		element.FrameEnd:close()
		element.PortraitImage:close()
		element.Gamertag:close()
		element.PingText:close()
		element.ScoreColumn1:close()
		element.ScoreColumn2:close()
		element.ScoreColumn3:close()
		element.ScoreColumn4:close()
		element.ScoreColumn5:close()
		element.Divider1:close()
		element.Divider2:close()
		element.Divider3:close()
		element.Divider4:close()
		element.Divider5:close()
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end

	return self
end
