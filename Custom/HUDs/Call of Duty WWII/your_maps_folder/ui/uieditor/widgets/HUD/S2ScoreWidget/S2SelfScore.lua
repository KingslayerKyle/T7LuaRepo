CoD.S2SelfScore = InheritFrom( LUI.UIElement )
CoD.S2SelfScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.S2SelfScore )
	self.id = "S2SelfScore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.PortraitImage = LUI.UIImage.new()
	self.PortraitImage:setLeftRight( true, false, 26.5, 104 )
	self.PortraitImage:setTopBottom( false, true, -132, -54.5 )
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
	self.ScoreTextShadow:setLeftRight( true, true, 109.5, 0 )
	self.ScoreTextShadow:setTopBottom( false, true, -116, -78.5 )
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
	self.ScoreText:setLeftRight( true, true, 111, 0 )
	self.ScoreText:setTopBottom( false, true, -117.5, -80 )
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

	self.HealthBar = LUI.UIImage.new()
	self.HealthBar:setLeftRight( true, false, 16.5, 114 )
	self.HealthBar:setTopBottom( false, true, -142, -44.5 )
	self.HealthBar:setImage( RegisterImage( "uie_t7_zm_hud_revive_ringtop" ) )
	self.HealthBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	self.HealthBar:setRGB( 0.88, 0.77, 0.49 )
	self.HealthBar:setShaderVector( 0, 1, 0, 0, 0 )
	self.HealthBar:setShaderVector( 1, 0.5, 0, 0, 0 )
	self.HealthBar:setShaderVector( 2, 0.5, 0, 0, 0 )
	self.HealthBar:setShaderVector( 3, 0, 0, 0, 0 )
	self.HealthBar:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "S2.Health" ), function ( model )
		local health = Engine.GetModelValue( model )

		if health then
			self.HealthBar:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
			
			if health <= 0.33 then
				self.HealthBar:setRGB( 1, 0.22, 0.22 )
			else
				self.HealthBar:setRGB( 0.88, 0.77, 0.49 )
			end

			self.HealthBar:setShaderVector( 0,
				CoD.GetVectorComponentFromString( health, 1 ),
				CoD.GetVectorComponentFromString( health, 2 ),
				CoD.GetVectorComponentFromString( health, 3 ),
				CoD.GetVectorComponentFromString( health, 4 ) )
		end
	end )
	self:addElement( self.HealthBar )

	self.ShieldHealth = LUI.UIImage.new()
	self.ShieldHealth:setLeftRight( true, false, 59 - 2.5, 71 + 2.5 )
	self.ShieldHealth:setTopBottom( false, true, -76 - 2.5 + 33, -64 + 2.5 + 33 )
	self.ShieldHealth:setImage( RegisterImage( "blacktransparent" ) )
	self.ShieldHealth:setRGB( 0.66, 0.66, 0.66 )
	self.ShieldHealth:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	self.ShieldHealth:setShaderVector( 0, 0, 1, 0, 0 )
	self.ShieldHealth:setShaderVector( 1, 0, 0, 0, 0 )
	self.ShieldHealth:setShaderVector( 3, 0, 0, 0, 0 )
	self.ShieldHealth:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ), function ( model )
		local showDpadDown = Engine.GetModelValue( model )

		if showDpadDown then
			if showDpadDown == 1 then
				self.ShieldHealth:setImage( RegisterImage( "hud_shield_fill" ) )
			else
				self.ShieldHealth:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self.ShieldHealth:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ZMInventory.shield_health" ), function ( model )
		local shield_health = Engine.GetModelValue( model )

		if shield_health then
			if shield_health <= 0.5 then
				self.ShieldHealth:setRGB( 1, 0.22, 0.22 )
			else
				self.ShieldHealth:setRGB( 0.66, 0.66, 0.66 )
			end

			self.ShieldHealth:setShaderVector( 2, SetVectorComponent( 2, 1, SubtractVectorComponentFrom( 1, 0.6, ScaleVector( 0.5,
				CoD.GetVectorComponentFromString( shield_health, 1 ),
				CoD.GetVectorComponentFromString( shield_health, 2 ),
				CoD.GetVectorComponentFromString( shield_health, 3 ),
				CoD.GetVectorComponentFromString( shield_health, 4 ) ) ) ) )
		end
	end )
	self:addElement( self.ShieldHealth )

	self.ShieldOutline = LUI.UIImage.new()
	self.ShieldOutline:setLeftRight( true, false, 59 - 2.5, 71 + 2.5 )
	self.ShieldOutline:setTopBottom( false, true, -76 - 2.5 + 33, -64 + 2.5 + 33 )
	self.ShieldOutline:setImage( RegisterImage( "blacktransparent" ) )
	self.ShieldOutline:setRGB( 0.11, 0.11, 0.11 )
	self.ShieldOutline:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ), function ( model )
		local showDpadDown = Engine.GetModelValue( model )

		if showDpadDown then
			if showDpadDown == 1 then
				self.ShieldOutline:setImage( RegisterImage( "hud_shield_empty" ) )
			else
				self.ShieldOutline:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.ShieldOutline )

	self.ArmorSlot1 = LUI.UIImage.new()
	self.ArmorSlot1:setLeftRight( true, false, 59 - 12.5, 71 - 12.5 )
	self.ArmorSlot1:setTopBottom( false, true, -76, -64 )
	self.ArmorSlot1:setImage( RegisterImage( "blacktransparent" ) )
	self.ArmorSlot1:setRGB( 0.88, 0.77, 0.49 )
	self.ArmorSlot1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "S2.Armor" ), function ( model )
		local armor = Engine.GetModelValue( model )

		if armor then
			if armor > 0 then
				self.ArmorSlot1:setImage( RegisterImage( "hud_shield_fill" ) )
			else
				self.ArmorSlot1:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.ArmorSlot1 )
	
	self.ArmorSlot1Outline = LUI.UIImage.new()
	self.ArmorSlot1Outline:setLeftRight( true, false, 59 - 12.5, 71 - 12.5 )
	self.ArmorSlot1Outline:setTopBottom( false, true, -76, -64 )
	self.ArmorSlot1Outline:setImage( RegisterImage( "blacktransparent" ) )
	self.ArmorSlot1Outline:setRGB( 0.88, 0.77, 0.49 )
	self.ArmorSlot1Outline:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "S2.Armor" ), function ( model )
		local armor = Engine.GetModelValue( model )

		if armor then
			self.ArmorSlot1Outline:setImage( RegisterImage( "hud_shield_empty" ) )
		else
			self.ArmorSlot1Outline:setImage( RegisterImage( "blacktransparent" ) )
		end
	end )
	self:addElement( self.ArmorSlot1Outline )

	self.ArmorSlot2 = LUI.UIImage.new()
	self.ArmorSlot2:setLeftRight( true, false, 59, 71 )
	self.ArmorSlot2:setTopBottom( false, true, -76, -64 )
	self.ArmorSlot2:setImage( RegisterImage( "blacktransparent" ) )
	self.ArmorSlot2:setRGB( 0.88, 0.77, 0.49 )
	self.ArmorSlot2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "S2.Armor" ), function ( model )
		local armor = Engine.GetModelValue( model )

		if armor then
			if armor > 1 then
				self.ArmorSlot2:setImage( RegisterImage( "hud_shield_fill" ) )
			else
				self.ArmorSlot2:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.ArmorSlot2 )
	
	self.ArmorSlot2Outline = LUI.UIImage.new()
	self.ArmorSlot2Outline:setLeftRight( true, false, 59, 71 )
	self.ArmorSlot2Outline:setTopBottom( false, true, -76, -64 )
	self.ArmorSlot2Outline:setImage( RegisterImage( "blacktransparent" ) )
	self.ArmorSlot2Outline:setRGB( 0.88, 0.77, 0.49 )
	self.ArmorSlot2Outline:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "S2.Armor" ), function ( model )
		local armor = Engine.GetModelValue( model )

		if armor then
			self.ArmorSlot2Outline:setImage( RegisterImage( "hud_shield_empty" ) )
		else
			self.ArmorSlot2Outline:setImage( RegisterImage( "blacktransparent" ) )
		end
	end )
	self:addElement( self.ArmorSlot2Outline )

	self.ArmorSlot3 = LUI.UIImage.new()
	self.ArmorSlot3:setLeftRight( true, false, 59 + 12.5, 71 + 12.5 )
	self.ArmorSlot3:setTopBottom( false, true, -76, -64 )
	self.ArmorSlot3:setImage( RegisterImage( "blacktransparent" ) )
	self.ArmorSlot3:setRGB( 0.88, 0.77, 0.49 )
	self.ArmorSlot3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "S2.Armor" ), function ( model )
		local armor = Engine.GetModelValue( model )

		if armor then
			if armor > 2 then
				self.ArmorSlot3:setImage( RegisterImage( "hud_shield_fill" ) )
			else
				self.ArmorSlot3:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.ArmorSlot3 )
	
	self.ArmorSlot3Outline = LUI.UIImage.new()
	self.ArmorSlot3Outline:setLeftRight( true, false, 59 + 12.5, 71 + 12.5 )
	self.ArmorSlot3Outline:setTopBottom( false, true, -76, -64 )
	self.ArmorSlot3Outline:setImage( RegisterImage( "blacktransparent" ) )
	self.ArmorSlot3Outline:setRGB( 0.88, 0.77, 0.49 )
	self.ArmorSlot3Outline:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "S2.Armor" ), function ( model )
		local armor = Engine.GetModelValue( model )

		if armor then
			self.ArmorSlot3Outline:setImage( RegisterImage( "hud_shield_empty" ) )
		else
			self.ArmorSlot3Outline:setImage( RegisterImage( "blacktransparent" ) )
		end
	end )
	self:addElement( self.ArmorSlot3Outline )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PortraitImage:close()
		element.ScoreTextShadow:close()
		element.ScoreText:close()
		element.HealthBar:close()
		element.ShieldHealth:close()
		element.ShieldOutline:close()
		element.ArmorSlot1:close()
		element.ArmorSlot1Outline:close()
		element.ArmorSlot2:close()
		element.ArmorSlot2Outline:close()
		element.ArmorSlot3:close()
		element.ArmorSlot3Outline:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
