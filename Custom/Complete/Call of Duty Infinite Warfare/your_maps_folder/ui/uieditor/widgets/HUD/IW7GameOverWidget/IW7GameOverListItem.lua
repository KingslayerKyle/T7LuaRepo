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
					self.PortraitImage:setImage( RegisterImage( "zm_main_nikolai" ) )
				
				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char1_old" then
					self.PortraitImage:setImage( RegisterImage( "zm_main_nikolai_old" ) )
				
				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char2" then
					self.PortraitImage:setImage( RegisterImage( "zm_main_takeo" ) )
				
				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char2_old" then
					self.PortraitImage:setImage( RegisterImage( "zm_main_takeo_old" ) )
				
				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char3" then
					self.PortraitImage:setImage( RegisterImage( "zm_main_dempsey" ) )
				
				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char3_old" then
					self.PortraitImage:setImage( RegisterImage( "zm_main_dempsey_old" ) )
				
				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char4" then
					self.PortraitImage:setImage( RegisterImage( "zm_main_richtofen" ) )
				
				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char4_old" then
					self.PortraitImage:setImage( RegisterImage( "zm_main_richtofen_old" ) )
				
				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char5" then
					self.PortraitImage:setImage( RegisterImage( "zm_main_jessica" ) )
				
				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char6" then
					self.PortraitImage:setImage( RegisterImage( "zm_main_jack" ) )
				
				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char7" then
					self.PortraitImage:setImage( RegisterImage( "zm_main_nero" ) )
				
				elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char8" then
					self.PortraitImage:setImage( RegisterImage( "zm_main_floyd" ) )
				end
			end
		end
	end )
	
	self:linkToElementModel( self, "clientNum", true, function ( clientNum )
		if Engine.GetModelValue( clientNum ) then
			local playerScore = nil
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

			if self.highScoreSubscription then
				self:removeSubscription( self.highScoreSubscription )
			end

			self.highScoreSubscription = self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
				local scores = {}
			
				for clientIndex = 0, Dvar.com_maxclients:get() - 1 do
					local oneBasedListIndex = clientNumToArrayIndex( clientIndex, ourClientNum )
			
					local clientData = Engine.GetPlayerListData( controller, clientIndex )
			
					local clientModel = Engine.GetModel( playerListListModel, oneBasedListIndex - 1 )
			
					for playerListItem, modelItem in pairs( DataSources.PlayerListZM.modelLinks ) do
						if modelItem == "playerScore" then
							if clientIndex == Engine.GetModelValue( clientNum ) then
								playerScore = Engine.GetModelValue( Engine.GetModel( clientModel, modelItem ), clientData[playerListItem] )
							end
	
							table.insert( scores, Engine.GetModelValue( Engine.GetModel( clientModel, modelItem ), clientData[playerListItem] ) )
						end
					end
				end
	
				table.sort( scores )

				if playerScore ~= nil then
					if playerScore == scores[#scores] then
						self.ScoreText:setRGB( 0, 0.8, 0 )
						self.FireFX:setMaterial( LUI.UIImage.GetCachedMaterial( "zm_wc_fire_loop" ) )
						self.Circle:setImage( RegisterImage( "zm_tix_arcane_spinner" ) )
						self.CircleGlow:setImage( RegisterImage( "cp_menu_pause_red_glow" ) )
					else
						self.ScoreText:setRGB( 0.78, 0.05, 0 )
						self.FireFX:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
						self.Circle:setImage( RegisterImage( "blacktransparent" ) )
						self.CircleGlow:setImage( RegisterImage( "blacktransparent" ) )
					end
				end
			end )
		end
	end )
end

CoD.IW7GameOverListItem = InheritFrom( LUI.UIElement )
CoD.IW7GameOverListItem.new = function ( menu, controller )
    local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IW7GameOverListItem )
	self.id = "IW7GameOverListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 50 )
	self:setZRot( math.random( -10, 10 ) )
	self.anyChildUsesUpdateState = true

	self.Circle = LUI.UIImage.new()
	self.Circle:setLeftRight( false, false, -220, 220 )
	self.Circle:setTopBottom( false, false, -220, 220 )
	self.Circle:setImage( RegisterImage( "blacktransparent" ) )
	self.Circle:setZRot( -4 )
	self:addElement( self.Circle )

	self.CircleGlow = LUI.UIImage.new()
	self.CircleGlow:setLeftRight( false, false, -220, 220 )
	self.CircleGlow:setTopBottom( false, false, -220, 220 )
	self.CircleGlow:setImage( RegisterImage( "blacktransparent" ) )
	self.CircleGlow:setZRot( -4 )
	self.CircleGlow:setAlpha( 0.5 )
	self:addElement( self.CircleGlow )

	self.FireFX = LUI.UIImage.new()
	self.FireFX:setLeftRight( false, false, -100, 130 )
	self.FireFX:setTopBottom( false, false, -320, 0 )
	self.FireFX:setImage( RegisterImage( "zm_wc_fire_loop" ) )
	self.FireFX:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	self.FireFX:setZRot( -4 )
	self:addElement( self.FireFX )

	self.ScoreBG = LUI.UIImage.new()
	self.ScoreBG:setLeftRight( false, false, -107.5, 139.5 )
	self.ScoreBG:setTopBottom( false, false, -127, -167 )
	self.ScoreBG:setImage( RegisterImage( "zm_pc_score_bg" ) )
	self.ScoreBG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.ScoreBG:setShaderVector( 0, 0.2, 0, 0.2, 0 )
	self.ScoreBG:setZRot( -4 )
	self:addElement( self.ScoreBG )

	self.ScoreText = LUI.UIText.new()
	self.ScoreText:setLeftRight( false, false, -111.5, 135.5 )
	self.ScoreText:setTopBottom( true, false, -140, -105 )
	self.ScoreText:setText( Engine.Localize( "" ) )
	self.ScoreText:setTTF( "fonts/blender_pro_medium.ttf" )
	self.ScoreText:setZRot( -4 )
	self.ScoreText:setRGB( 0.78, 0.05, 0 )
	self.ScoreText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreText:linkToElementModel( self, "playerScore", true, function ( model )
		local playerScore = Engine.GetModelValue( model )

		if playerScore then
			self.ScoreText:setText( Engine.Localize( playerScore ) )
		end
	end )
	self:addElement( self.ScoreText )

	self.NameBG = LUI.UIImage.new()
	self.NameBG:setLeftRight( false, false, -130.5, 116.5 )
	self.NameBG:setTopBottom( false, false, 167, 127 )
	self.NameBG:setImage( RegisterImage( "zm_pc_score_bg" ) )
	self.NameBG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.NameBG:setShaderVector( 0, 0.2, 0, 0.2, 0 )
	self.NameBG:setZRot( -4 )
	self:addElement( self.NameBG )

	self.NameText = LUI.UIText.new()
	self.NameText:setLeftRight( false, false, -130.5, 116.5 )
	self.NameText:setTopBottom( true, false, 155, 190 )
	self.NameText:setText( Engine.Localize( "" ) )
	self.NameText:setTTF( "fonts/blender_pro_medium.ttf" )
	self.NameText:setZRot( -4 )
	self.NameText:setScale( 0.6 )
	self.NameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.NameText:linkToElementModel( self, "playerName", true, function ( model )
		local playerName = Engine.GetModelValue( model )

		if playerName then
			self.NameText:setText( Engine.Localize( playerName ) )
		end
	end )
	self:addElement( self.NameText )

	self.PortraitImage = LUI.UIImage.new()
	self.PortraitImage:setLeftRight( false, false, -93.5, 93.5 )
	self.PortraitImage:setTopBottom( false, false, -129.5, 129.5 )
	self.PortraitImage:setImage( RegisterImage( "blacktransparent" ) )
	self.PortraitImage:setZRot( -4 )
	self:addElement( self.PortraitImage )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			CircleAnim = function ()
				self:setupElementClipCounter( 1 )
			
				local CircleAnimationStage1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 60000, false, false, CoD.TweenType.Linear )
					end
			
					element:setZRot( 360 )
			
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
			
				self.Circle:completeAnimation()
				self.Circle:setZRot( 0 )
				CircleAnimationStage1( self.Circle, {} )
			
				self.nextClip = "CircleAnim"
			end
		}
	}

	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		local game_ended = Engine.GetModelValue( model )

		if game_ended then
			if game_ended == 1 then
				PlayClip( self, "CircleAnim", controller )
			end
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Circle:close()
		element.CircleGlow:close()
		element.FireFX:close()
		element.ScoreBG:close()
		element.ScoreText:close()
		element.NameBG:close()
		element.NameText:close()
		element.PortraitImage:close()
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end

	return self
end
