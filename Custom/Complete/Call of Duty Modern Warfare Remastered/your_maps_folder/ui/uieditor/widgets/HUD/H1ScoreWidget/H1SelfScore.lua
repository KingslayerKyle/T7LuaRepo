require( "ui.uieditor.widgets.HUD.H1ScoreWidget.H1ScoreBG" )

local PostLoadFunc = function ( self, controller, menu )
	self:linkToElementModel( self, "clientNum", true, function ( clientModel )
		local clientNum = Engine.GetModelValue( clientModel )

		if clientNum then
			if self.healthSubscription ~= nil then
				self:removeSubscription( self.healthSubscription )
			end

			self.healthSubscription = self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "h1_health_" .. clientNum ), function ( model )
				local health = Engine.GetModelValue( model )
				
				if health then
					self.Health:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )

					self.Health:setShaderVector( 0,
						CoD.GetVectorComponentFromString( health, 1 ),
						CoD.GetVectorComponentFromString( health, 2 ),
						CoD.GetVectorComponentFromString( health, 3 ),
						CoD.GetVectorComponentFromString( health, 4 ) )

					self.HealthLoss:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )

					self.HealthLoss:setShaderVector( 0,
						CoD.GetVectorComponentFromString( health, 1 ),
						CoD.GetVectorComponentFromString( health, 2 ),
						CoD.GetVectorComponentFromString( health, 3 ),
						CoD.GetVectorComponentFromString( health, 4 ) )
				end
			end )

			if self.shieldSubscription ~= nil then
				self:removeSubscription( self.shieldSubscription )
			end

			self.shieldSubscription = self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "h1_shield_" .. clientNum ), function ( model )
				local shield = Engine.GetModelValue( model )
				
				if shield then
					if shield == 1 then
						self.Shield:setImage( RegisterImage( "$white" ) )
						self.ShieldLoss:setImage( RegisterImage( "$white" ) )
					else
						self.Shield:setImage( RegisterImage( "blacktransparent" ) )
						self.ShieldLoss:setImage( RegisterImage( "blacktransparent" ) )
					end
				end
			end )

			if self.shieldHealthSubscription ~= nil then
				self:removeSubscription( self.shieldHealthSubscription )
			end

			self.shieldHealthSubscription = self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "h1_shield_health_" .. clientNum ), function ( model )
				local shield_health = Engine.GetModelValue( model )
				
				if shield_health then
					self.Shield:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )

					self.Shield:setShaderVector( 0,
						CoD.GetVectorComponentFromString( shield_health, 1 ),
						CoD.GetVectorComponentFromString( shield_health, 2 ),
						CoD.GetVectorComponentFromString( shield_health, 3 ),
						CoD.GetVectorComponentFromString( shield_health, 4 ) )

					self.ShieldLoss:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )

					self.ShieldLoss:setShaderVector( 0,
						CoD.GetVectorComponentFromString( shield_health, 1 ),
						CoD.GetVectorComponentFromString( shield_health, 2 ),
						CoD.GetVectorComponentFromString( shield_health, 3 ),
						CoD.GetVectorComponentFromString( shield_health, 4 ) )
				end
			end )
		end
	end )
end

CoD.H1SelfScore = InheritFrom( LUI.UIElement )
CoD.H1SelfScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.H1SelfScore )
	self.id = "H1SelfScore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.ScoreBG = CoD.H1ScoreBG.new( menu, controller )
	self.ScoreBG:setLeftRight( true, true, 0, 0 )
	self.ScoreBG:setTopBottom( true, true, 0, 0 )
	self.ScoreBG:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	self.ScoreBG:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( self.ScoreBG )

	self.ScoreBorder = LUI.UIImage.new()
	self.ScoreBorder:setLeftRight( true, false, 15, 350 )
    self.ScoreBorder:setTopBottom( false, true, -100, -15 )
	self.ScoreBorder:setImage( RegisterImage( "h1_weaponwidget_firearms_border" ) )
	self.ScoreBorder:setYRot( 180 )
	self.ScoreBorder:setRGB( 0, 0, 0 )
	self:addElement( self.ScoreBorder )

	self.Portrait = LUI.UIImage.new()
	self.Portrait:setLeftRight( true, false, 20 - 3, 65 - 3 )
	self.Portrait:setTopBottom( false, true, -65, -20 )
	self.Portrait:setImage( RegisterImage( "blacktransparent" ) )
	self.Portrait:linkToElementModel( self, "zombiePlayerIcon", true, function ( model )
		local zombiePlayerIcon = Engine.GetModelValue( model )

		if zombiePlayerIcon then
			self.Portrait:setImage( RegisterImage( zombiePlayerIcon ) )
		end
	end )
	self:addElement( self.Portrait )

	self.HealthBG = LUI.UIImage.new()
	self.HealthBG:setLeftRight( true, false, 70.5 - 1, 170 + 1 )
	self.HealthBG:setTopBottom( false, true, -36.5 - 1 + 3, -33 + 1 + 3 )
	self.HealthBG:setImage( RegisterImage( "$white" ) )
	self.HealthBG:setRGB( 0, 0, 0 )
	self.HealthBG:setAlpha( 0.5 )
	self:addElement( self.HealthBG )
	
	self.HealthLoss = LUI.UIImage.new()
	self.HealthLoss:setLeftRight( true, false, 70.5, 170 )
	self.HealthLoss:setTopBottom( false, true, -36.5 + 3, -33 + 3 )
	self.HealthLoss:setImage( RegisterImage( "$white" ) )
	self.HealthLoss:setRGB( 0.74, 0.31, 0.16 )
	self.HealthLoss:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.HealthLoss:setShaderVector( 1, 0, 0, 0, 0 )
	self.HealthLoss:setShaderVector( 2, 1, 0, 0, 0 )
	self.HealthLoss:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( self.HealthLoss )

	self.Health = LUI.UIImage.new()
	self.Health:setLeftRight( true, false, 70.5, 170 )
	self.Health:setTopBottom( false, true, -36.5 + 3, -33 + 3 )
	self.Health:setImage( RegisterImage( "$white" ) )
	self.Health:setRGB( 1, 1, 1 )
	self.Health:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.Health:setShaderVector( 1, 0, 0, 0, 0 )
	self.Health:setShaderVector( 2, 1, 0, 0, 0 )
	self.Health:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( self.Health )

	self.ShieldBG = LUI.UIImage.new()
	self.ShieldBG:setLeftRight( true, false, 70.5 - 1, 170 + 1 )
	self.ShieldBG:setTopBottom( false, true, -36.5 - 1 + 6 + 3, -33 + 1 + 6 + 3 )
	self.ShieldBG:setImage( RegisterImage( "$white" ) )
	self.ShieldBG:setRGB( 0, 0, 0 )
	self.ShieldBG:setAlpha( 0.5 )
	self:addElement( self.ShieldBG )

	self.ShieldLoss = LUI.UIImage.new()
	self.ShieldLoss:setLeftRight( true, false, 70.5, 170 )
	self.ShieldLoss:setTopBottom( false, true, -36.5 + 6 + 3, -33 + 6 + 3 )
	self.ShieldLoss:setImage( RegisterImage( "$white" ) )
	self.ShieldLoss:setRGB( 0.74, 0.31, 0.16 )
	self.ShieldLoss:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.ShieldLoss:setShaderVector( 1, 0, 0, 0, 0 )
	self.ShieldLoss:setShaderVector( 2, 1, 0, 0, 0 )
	self.ShieldLoss:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( self.ShieldLoss )

	self.Shield = LUI.UIImage.new()
	self.Shield:setLeftRight( true, false, 70.5, 170 )
	self.Shield:setTopBottom( false, true, -36.5 + 6 + 3, -33 + 6 + 3 )
	self.Shield:setImage( RegisterImage( "$white" ) )
	self.Shield:setRGB( 0, 0.47, 0.96 )
	self.Shield:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.Shield:setShaderVector( 1, 0, 0, 0, 0 )
	self.Shield:setShaderVector( 2, 1, 0, 0, 0 )
	self.Shield:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( self.Shield )

	self.Score = LUI.UIText.new()
	self.Score:setLeftRight( true, true, -335, 0 )
	self.Score:setTopBottom( false, true, -65 - 10 + 3, -15 - 10 + 3 )
	self.Score:setTTF( "fonts/defaultbold.otf" )
	self.Score:setScale( 0.5 )
	self.Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.Score:linkToElementModel( self, "playerScore", true, function ( model )
		local score = Engine.GetModelValue( model )

		if score then
			self.Score:setText( Engine.Localize( score ) )
		end
	end )
	self:addElement( self.Score )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreBG:close()
		element.ScoreBorder:close()
		element.Portrait:close()
		element.HealthBG:close()
		element.HealthLoss:close()
		element.Health:close()
		element.ShieldBG:close()
		element.ShieldLoss:close()
		element.Shield:close()
		element.Score:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
