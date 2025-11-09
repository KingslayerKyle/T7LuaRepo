CoD.T8ClientScore = InheritFrom( LUI.UIElement )
CoD.T8ClientScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T8ClientScore )
	self.id = "T8ClientScore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	self.ScoreBG = LUI.UIImage.new()
	self.ScoreBG:setLeftRight( true, false, 25, 153.5 )
	self.ScoreBG:setTopBottom( false, true, -172.5, -114.5 )
	self.ScoreBG:setImage( RegisterImage( "t8_hud_playercard_sm_bg" ) )
	self:addElement( self.ScoreBG )

	self.PortraitImage = LUI.UIImage.new()
	self.PortraitImage:setLeftRight( true, false, 19, 87 )
	self.PortraitImage:setTopBottom( false, true, -172, -112.5 )
	self.PortraitImage:setScale( 0.87 )
	self.PortraitImage:setImage( RegisterImage( "blacktransparent" ) )
	self.PortraitImage:linkToElementModel( self, "zombiePlayerIcon", true, function ( model )
		local zombiePlayerIcon = Engine.GetModelValue( model )
		
		if zombiePlayerIcon then
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
	end )
	self:addElement( self.PortraitImage )

	self.ScoreTextGlow = LUI.UIImage.new()
	self.ScoreTextGlow:setLeftRight( true, false, 64, 150.5 )
	self.ScoreTextGlow:setTopBottom( false, true, -155, -130 )
	self.ScoreTextGlow:setAlpha( 0.3 )
	self.ScoreTextGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self.ScoreTextGlow:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )

		if clientNum then
			self.ScoreTextGlow:setRGB( ZombieClientScoreboardColor( clientNum ) )
		end
	end )
	self:addElement( self.ScoreTextGlow )

	self.ScoreText = LUI.UIText.new()
	self.ScoreText:setLeftRight( true, false, 64, 150.5 )
	self.ScoreText:setTopBottom( false, true, -150, -135 )
	self.ScoreText:setTTF( "fonts/skorzhen.ttf" )
	self.ScoreText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ScoreText:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )

		if clientNum then
			self.ScoreText:setRGB( ZombieClientScoreboardColor( clientNum ) )
		end
	end )
	self.ScoreText:linkToElementModel( self, "playerScore", true, function ( model )
		local playerScore = Engine.GetModelValue( model )

		if playerScore then
			self.ScoreText:setText( Engine.Localize( playerScore ) )
		end
	end )
	self:addElement( self.ScoreText )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				self.ScoreBG:completeAnimation()
				self.ScoreBG:setAlpha( 0 )
				self.clipFinished( self.ScoreBG, {} )

				self.PortraitImage:completeAnimation()
				self.PortraitImage:setAlpha( 0 )
				self.clipFinished( self.PortraitImage, {} )

				self.ScoreTextGlow:completeAnimation()
				self.ScoreTextGlow:setAlpha( 0 )
				self.clipFinished( self.ScoreTextGlow, {} )

				self.ScoreText:completeAnimation()
				self.ScoreText:setAlpha( 0 )
				self.clipFinished( self.ScoreText, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				self.ScoreBG:completeAnimation()
				self.ScoreBG:setAlpha( 1 )
				self.clipFinished( self.ScoreBG, {} )

				self.PortraitImage:completeAnimation()
				self.PortraitImage:setAlpha( 1 )
				self.clipFinished( self.PortraitImage, {} )

				self.ScoreTextGlow:completeAnimation()
				self.ScoreTextGlow:setAlpha( 0.3 )
				self.clipFinished( self.ScoreTextGlow, {} )

				self.ScoreText:completeAnimation()
				self.ScoreText:setAlpha( 1 )
				self.clipFinished( self.ScoreText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "playerScoreShown", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "playerScoreShown", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerScoreShown"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreBG:close()
		element.PortraitImage:close()
		element.ScoreTextGlow:close()
		element.ScoreText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
