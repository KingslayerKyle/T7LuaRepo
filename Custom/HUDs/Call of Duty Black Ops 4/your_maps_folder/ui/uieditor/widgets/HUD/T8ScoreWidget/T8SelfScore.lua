local SetHealthText = function ( controller, element )
	local health = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "T8.Health" ) )
	local juggernaut = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.perks.juggernaut" ) )

	if health ~= nil and juggernaut ~= nil then
		if juggernaut > 0 then
			element:setText( Engine.Localize( math.floor( ( health * 100 ) * 2 ) ) )
		else
			element:setText( Engine.Localize( math.floor( health * 100 ) ) )
		end
	end
end

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "t8_zone_name" )
end

CoD.T8SelfScore = InheritFrom( LUI.UIElement )
CoD.T8SelfScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T8SelfScore )
	self.id = "T8SelfScore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.ZoneText = LUI.UIText.new()
	self.ZoneText:setLeftRight( true, false, 20, 0 )
	self.ZoneText:setTopBottom( true, false, 20, 40 )
	self.ZoneText:setText( Engine.Localize( "" ) )
	self.ZoneText:setTTF( "fonts/skorzhen.ttf" )
	self.ZoneText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.ZoneText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "t8_zone_name" ), function ( model )
		local t8_zone_name = Engine.GetModelValue( model )

		if t8_zone_name then
			if t8_zone_name == "none" then
				self.ZoneText:setText( Engine.Localize( "" ) )
			else
				self.ZoneText:setText( Engine.Localize( t8_zone_name ) )
			end
		end
	end )
	self:addElement( self.ZoneText )

	self.ScoreBGGlow = LUI.UIImage.new()
	self.ScoreBGGlow:setLeftRight( true, false, 25.5, 237 )
	self.ScoreBGGlow:setTopBottom( false, true, -96, -23 )
	self.ScoreBGGlow:setImage( RegisterImage( "t8_hud_ammowidget_bg_glow" ) )
	self.ScoreBGGlow:setYRot( 180 )
	self.ScoreBGGlow:setAlpha( 0.5 )
	self:addElement( self.ScoreBGGlow )

	self.ScoreBG = LUI.UIImage.new()
	self.ScoreBG:setLeftRight( true, false, 25.5, 237 )
	self.ScoreBG:setTopBottom( false, true, -96, -23 )
	self.ScoreBG:setImage( RegisterImage( "t8_hud_ammowidget_bg" ) )
	self.ScoreBG:setYRot( 180 )
	self:addElement( self.ScoreBG )

	self.PortraitImage = LUI.UIImage.new()
	self.PortraitImage:setLeftRight( true, false, 19, 103 )
	self.PortraitImage:setTopBottom( false, true, -96, -22 )
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

	self.ScoreText = LUI.UIText.new()
	self.ScoreText:setLeftRight( true, false, 91, 237 )
	self.ScoreText:setTopBottom( false, true, -77.5, -47.5 )
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

	self.HealthBar = LUI.UIImage.new()
	self.HealthBar:setLeftRight( true, false, 124, 213.5 )
	self.HealthBar:setTopBottom( false, true, -46, -41 )
	self.HealthBar:setImage( RegisterImage( "t8_hud_healthbar" ) )
	self.HealthBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.HealthBar:setShaderVector( 1, 0, 0, 0, 0 )
	self.HealthBar:setShaderVector( 2, 1, 0, 0, 0 )
	self.HealthBar:setShaderVector( 3, 0, 0, 0, 0 )
	self.HealthBar:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "T8.Health" ), function ( model )
		local health = Engine.GetModelValue( model )

		if health then
			self.HealthBar:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
			
			if health <= 0.33 then
				self.HealthBar:setRGB( 1, 0, 0 )
			else
				self.HealthBar:setRGB( 1, 1, 1 )
			end

			self.HealthBar:setShaderVector( 0,
				CoD.GetVectorComponentFromString( health, 1 ),
				CoD.GetVectorComponentFromString( health, 2 ),
				CoD.GetVectorComponentFromString( health, 3 ),
				CoD.GetVectorComponentFromString( health, 4 ) )
		end
	end )
	self:addElement( self.HealthBar )

	self.HealthText = LUI.UIText.new()
	self.HealthText:setLeftRight( true, false, 101, 121 )
	self.HealthText:setTopBottom( false, true, -48.5, -37.5 )
	self.HealthText:setTTF( "fonts/skorzhen.ttf" )
	self.HealthText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.HealthText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "T8.Health" ), function ( model )
		SetHealthText( controller, self.HealthText )
	end )
	self.HealthText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.perks.juggernaut" ), function ( model )
		SetHealthText( controller, self.HealthText )
	end )
	self:addElement( self.HealthText )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZoneText:close()
		element.ScoreBGGlow:close()
		element.ScoreBG:close()
		element.PortraitImage:close()
		element.ScoreText:close()
		element.HealthBar:close()
		element.HealthText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
