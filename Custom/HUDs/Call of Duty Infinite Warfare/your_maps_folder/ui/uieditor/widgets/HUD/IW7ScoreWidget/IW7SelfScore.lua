CoD.IW7SelfScore = InheritFrom( LUI.UIElement )
CoD.IW7SelfScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IW7SelfScore )
	self.id = "IW7SelfScore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.ScoreBG = LUI.UIImage.new()
	self.ScoreBG:setLeftRight( true, false, 122.5, 218.5 )
	self.ScoreBG:setTopBottom( false, true, -123.5, -100 )
	self.ScoreBG:setImage( RegisterImage( "zm_pc_score_bg" ) )
	self.ScoreBG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self.ScoreBG:setAlpha( 0.5 )
	self:addElement( self.ScoreBG )

	self.ScoreText = LUI.UIText.new()
	self.ScoreText:setLeftRight( true, false, 125.5, 1280 )
	self.ScoreText:setTopBottom( false, true, -123.5, -100 )
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
	self.PortraitImage:setLeftRight( true, false, 15.5, 124.5 )
	self.PortraitImage:setTopBottom( false, true, -240.5, -99.75 )
	self.PortraitImage:setImage( RegisterImage( "blacktransparent" ) )
	self.PortraitImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self.PortraitImage:linkToElementModel( self, "zombiePlayerIcon", true, function ( model )
		local zombiePlayerIcon = Engine.GetModelValue( model )

		if zombiePlayerIcon then
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
	end )
	self:addElement( self.PortraitImage )

	self.ShieldOutline = LUI.UIImage.new()
	self.ShieldOutline:setLeftRight( true, false, 20.5, 45.5 )
	self.ShieldOutline:setTopBottom( false, true, -129.75, -104.75 )
	self.ShieldOutline:setImage( RegisterImage( "blacktransparent" ) )
	self.ShieldOutline:setRGB( 0, 0, 0 )
	self.ShieldOutline:setScale( 1.1 )
	self.ShieldOutline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	self.ShieldOutline:setShaderVector( 0, 0, 1, 0, 0 )
	self.ShieldOutline:setShaderVector( 1, 0, 0, 0, 0 )
	self.ShieldOutline:setShaderVector( 3, 0, 0, 0, 0 )
	self.ShieldOutline:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ), function ( model )
		local showDpadDown = Engine.GetModelValue( model )

		if showDpadDown then
			if showDpadDown == 1 then
				self.ShieldOutline:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
			else
				self.ShieldOutline:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self.ShieldOutline:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ZMInventory.shield_health" ), function ( model )
		local shield_health = Engine.GetModelValue( model )

		if shield_health then
			self.ShieldOutline:setShaderVector( 2, SetVectorComponent( 2, 1, SubtractVectorComponentFrom( 1, 0.5, ScaleVector( 0.5,
				CoD.GetVectorComponentFromString( shield_health, 1 ),
				CoD.GetVectorComponentFromString( shield_health, 2 ),
				CoD.GetVectorComponentFromString( shield_health, 3 ),
				CoD.GetVectorComponentFromString( shield_health, 4 ) ) ) ) )
		end
	end )
	self:addElement( self.ShieldOutline )

	self.ShieldHealth = LUI.UIImage.new()
	self.ShieldHealth:setLeftRight( true, false, 20.5, 45.5 )
	self.ShieldHealth:setTopBottom( false, true, -129.75, -104.75 )
	self.ShieldHealth:setImage( RegisterImage( "blacktransparent" ) )
	self.ShieldHealth:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	self.ShieldHealth:setShaderVector( 0, 0, 1, 0, 0 )
	self.ShieldHealth:setShaderVector( 1, 0, 0, 0, 0 )
	self.ShieldHealth:setShaderVector( 3, 0, 0, 0, 0 )
	self.ShieldHealth:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ), function ( model )
		local showDpadDown = Engine.GetModelValue( model )

		if showDpadDown then
			if showDpadDown == 1 then
				self.ShieldHealth:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
			else
				self.ShieldHealth:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self.ShieldHealth:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ZMInventory.shield_health" ), function ( model )
		local shield_health = Engine.GetModelValue( model )

		if shield_health then
			self.ShieldHealth:setShaderVector( 2, SetVectorComponent( 2, 1, SubtractVectorComponentFrom( 1, 0.5, ScaleVector( 0.5,
				CoD.GetVectorComponentFromString( shield_health, 1 ),
				CoD.GetVectorComponentFromString( shield_health, 2 ),
				CoD.GetVectorComponentFromString( shield_health, 3 ),
				CoD.GetVectorComponentFromString( shield_health, 4 ) ) ) ) )
		end
	end )
	self:addElement( self.ShieldHealth )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreBG:close()
		element.ScoreText:close()
		element.PortraitImage:close()
		element.ShieldOutline:close()
		element.ShieldHealth:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
