CoD.S2ClientScore = InheritFrom( LUI.UIElement )
CoD.S2ClientScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.S2ClientScore )
	self.id = "S2ClientScore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.PortraitImage = LUI.UIImage.new()
	self.PortraitImage:setLeftRight( true, false, 37.5, 75 )
	self.PortraitImage:setTopBottom( false, true, -178.5, -141 )
	self.PortraitImage:setImage( RegisterImage( "blacktransparent" ) )
	self.PortraitImage:linkToElementModel( self, "zombiePlayerIcon", true, function ( model )
		local zombiePlayerIcon = Engine.GetModelValue( model )

		if zombiePlayerIcon then
			if zombiePlayerIcon == "uie_t7_zm_hud_score_char1" then
				self.PortraitImage:setImage( RegisterImage( "hud_player_nikolai_circle" ) )

			elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char1_old" then
				self.PortraitImage:setImage( RegisterImage( "hud_player_nikolai_old_circle" ) )

			elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char2" then
				self.PortraitImage:setImage( RegisterImage( "hud_player_takeo_circle" ) )

			elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char2_old" then
				self.PortraitImage:setImage( RegisterImage( "hud_player_takeo_old_circle" ) )

			elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char3" then
				self.PortraitImage:setImage( RegisterImage( "hud_player_dempsey_circle" ) )

			elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char3_old" then
				self.PortraitImage:setImage( RegisterImage( "hud_player_dempsey_old_circle" ) )

			elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char4" then
				self.PortraitImage:setImage( RegisterImage( "hud_player_richtofen_circle" ) )

			elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char4_old" then
				self.PortraitImage:setImage( RegisterImage( "hud_player_richtofen_old_circle" ) )

			elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char5" then
				self.PortraitImage:setImage( RegisterImage( "hud_player_jessica_circle" ) )

			elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char6" then
				self.PortraitImage:setImage( RegisterImage( "hud_player_jack_circle" ) )

			elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char7" then
				self.PortraitImage:setImage( RegisterImage( "hud_player_nero_circle" ) )

			elseif zombiePlayerIcon == "uie_t7_zm_hud_score_char8" then
				self.PortraitImage:setImage( RegisterImage( "hud_player_floyd_circle" ) )
			end
		end
	end )
	self:addElement( self.PortraitImage )

	self.ScoreTextShadow = LUI.UIText.new()
	self.ScoreTextShadow:setLeftRight( true, true, 85, 0 )
	self.ScoreTextShadow:setTopBottom( false, true, -158, -138 )
	self.ScoreTextShadow:setTTF( "fonts/dinnextslabpro-regular.ttf" )
	self.ScoreTextShadow:setRGB( 0.11, 0.11, 0.11 )
	self.ScoreTextShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.ScoreTextShadow:linkToElementModel( self, "playerScore", true, function ( model )
		local playerScore = Engine.GetModelValue( model )

		if playerScore then
			self.ScoreTextShadow:setText( Engine.Localize( playerScore ) )
		end
	end )
	self:addElement( self.ScoreTextShadow )

	self.ScoreText = LUI.UIText.new()
	self.ScoreText:setLeftRight( true, true, 86, 0 )
	self.ScoreText:setTopBottom( false, true, -159, -139 )
	self.ScoreText:setTTF( "fonts/dinnextslabpro-regular.ttf" )
	self.ScoreText:setRGB( 0.65, 0.63, 0.57 )
	self.ScoreText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
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
				self:setupElementClipCounter( 3 )

				self.PortraitImage:completeAnimation()
				self.PortraitImage:setAlpha( 0 )
				self.clipFinished( self.PortraitImage, {} )

				self.ScoreTextShadow:completeAnimation()
				self.ScoreTextShadow:setAlpha( 0 )
				self.clipFinished( self.ScoreTextShadow, {} )

				self.ScoreText:completeAnimation()
				self.ScoreText:setAlpha( 0 )
				self.clipFinished( self.ScoreText, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				self.PortraitImage:completeAnimation()
				self.PortraitImage:setAlpha( 1 )
				self.clipFinished( self.PortraitImage, {} )

				self.ScoreTextShadow:completeAnimation()
				self.ScoreTextShadow:setAlpha( 1 )
				self.clipFinished( self.ScoreTextShadow, {} )

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
		element.PortraitImage:close()
		element.ScoreTextShadow:close()
		element.ScoreText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
