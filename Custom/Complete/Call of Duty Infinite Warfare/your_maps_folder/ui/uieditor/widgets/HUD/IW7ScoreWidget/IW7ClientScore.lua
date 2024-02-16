CoD.IW7ClientScore = InheritFrom( LUI.UIElement )
CoD.IW7ClientScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IW7ClientScore )
	self.id = "IW7ClientScore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.ScoreBG = LUI.UIImage.new()
	self.ScoreBG:setLeftRight( true, false, 70, 125 )
	self.ScoreBG:setTopBottom( false, true, -240, -225 )
	self.ScoreBG:setImage( RegisterImage( "zm_pc_score_bg" ) )
	self.ScoreBG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self.ScoreBG:setAlpha( 0.5 )
	self:addElement( self.ScoreBG )

	self.ScoreText = LUI.UIText.new()
	self.ScoreText:setLeftRight( true, false, 70, 1280 )
	self.ScoreText:setTopBottom( false, true, -240, -225 )
	self.ScoreText:setTTF( "fonts/blender_pro_bold.ttf" )
	self.ScoreText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.ScoreText:linkToElementModel( self, "playerScore", true, function ( model )
		local playerScore = Engine.GetModelValue( model )

		if playerScore then
			self.ScoreText:setText( Engine.Localize( "$ " .. playerScore ) )
		end
	end )
	self:addElement( self.ScoreText )

	self.PortraitImage = LUI.UIImage.new()
	self.PortraitImage:setLeftRight( true, false, 25, 75 )
	self.PortraitImage:setTopBottom( false, true, -260, -220 )
	self.PortraitImage:setImage( RegisterImage( "blacktransparent" ) )
	self.PortraitImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self.PortraitImage:linkToElementModel( self, "zombiePlayerIcon", true, function ( model )
		local zombiePlayerIcon = Engine.GetModelValue( model )

		if zombiePlayerIcon then
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
	end )
	self:addElement( self.PortraitImage )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				self.ScoreBG:completeAnimation()
				self.ScoreBG:setAlpha( 0 )
				self.clipFinished( self.ScoreBG, {} )

				self.ScoreText:completeAnimation()
				self.ScoreText:setAlpha( 0 )
				self.clipFinished( self.ScoreText, {} )

				self.PortraitImage:completeAnimation()
				self.PortraitImage:setAlpha( 0 )
				self.clipFinished( self.PortraitImage, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				self.ScoreBG:completeAnimation()
				self.ScoreBG:setAlpha( 0.5 )
				self.clipFinished( self.ScoreBG, {} )

				self.ScoreText:completeAnimation()
				self.ScoreText:setAlpha( 1 )
				self.clipFinished( self.ScoreText, {} )

				self.PortraitImage:completeAnimation()
				self.PortraitImage:setAlpha( 1 )
				self.clipFinished( self.PortraitImage, {} )
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
		element.ScoreText:close()
		element.PortraitImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
