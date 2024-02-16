local PostLoadFunc = function ( self, controller, menu )
	self:linkToElementModel( self, "clientNum", true, function ( clientModel )
		local clientNum = Engine.GetModelValue( clientModel )

		if clientNum then
			if self.healthSubscription ~= nil then
				self:removeSubscription( self.healthSubscription )
			end

			self.healthSubscription = self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "s4_health_" .. clientNum ), function ( model )
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

			self.shieldSubscription = self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "s4_shield_" .. clientNum ), function ( model )
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

			self.shieldHealthSubscription = self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "s4_shield_health_" .. clientNum ), function ( model )
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

CoD.S4SelfScore = InheritFrom( LUI.UIElement )
CoD.S4SelfScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.S4SelfScore )
	self.id = "S4SelfScore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.Circle = LUI.UIImage.new()
	self.Circle:setLeftRight( true, false, 22, 26 )
	self.Circle:setTopBottom( false, true, -48, -44 )
	self.Circle:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_blur" ) )
	self.Circle:setRGB( 1, 0.62, 0.17 )
	self:addElement( self.Circle )

	self.Name = LUI.UIText.new()
	self.Name:setLeftRight( true, true, -387, 0 )
	self.Name:setTopBottom( false, true, -61, -31 )
	self.Name:setTTF( "fonts/notosans_semicondensedmedium.ttf" )
	self.Name:setScale( 0.5 )
	self.Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.Name:linkToElementModel( self, "playerName", true, function ( model )
		local name = Engine.GetModelValue( model )

		if name then
			self.Name:setText( string.upper( Engine.Localize( name ) ) )
		end
	end )
	self:addElement( self.Name )

	self.HealthBG = LUI.UIImage.new()
	self.HealthBG:setLeftRight( true, false, 19, 150.5 )
	self.HealthBG:setTopBottom( false, true, -57, -52 )
	self.HealthBG:setImage( RegisterImage( "$white" ) )
	self.HealthBG:setRGB( 0, 0, 0 )
	self.HealthBG:setAlpha( 0.25 )
	self:addElement( self.HealthBG )
	
	self.HealthLoss = LUI.UIImage.new()
	self.HealthLoss:setLeftRight( true, false, 19 + 0.5, 150.5 - 0.5 )
	self.HealthLoss:setTopBottom( false, true, -57 + 0.5, -52 - 1 )
	self.HealthLoss:setImage( RegisterImage( "$white" ) )
	self.HealthLoss:setRGB( 0.74, 0.31, 0.16 )
	self.HealthLoss:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.HealthLoss:setShaderVector( 1, 0, 0, 0, 0 )
	self.HealthLoss:setShaderVector( 2, 1, 0, 0, 0 )
	self.HealthLoss:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( self.HealthLoss )

	self.Health = LUI.UIImage.new()
	self.Health:setLeftRight( true, false, 19 + 0.5, 150.5 - 0.5 )
	self.Health:setTopBottom( false, true, -57 + 0.5, -52 - 1 )
	self.Health:setImage( RegisterImage( "$white" ) )
	self.Health:setRGB( 1, 1, 1 )
	self.Health:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.Health:setShaderVector( 1, 0, 0, 0, 0 )
	self.Health:setShaderVector( 2, 1, 0, 0, 0 )
	self.Health:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( self.Health )

	self.ShieldBG = LUI.UIImage.new()
	self.ShieldBG:setLeftRight( true, false, 19, 150.5 )
	self.ShieldBG:setTopBottom( false, true, -63, -58 )
	self.ShieldBG:setImage( RegisterImage( "$white" ) )
	self.ShieldBG:setRGB( 0, 0, 0 )
	self.ShieldBG:setAlpha( 0.25 )
	self:addElement( self.ShieldBG )

	self.ShieldLoss = LUI.UIImage.new()
	self.ShieldLoss:setLeftRight( true, false, 19 + 0.5, 150.5 - 0.5 )
	self.ShieldLoss:setTopBottom( false, true, -63 + 0.5, -58 - 1 )
	self.ShieldLoss:setImage( RegisterImage( "$white" ) )
	self.ShieldLoss:setRGB( 0.74, 0.31, 0.16 )
	self.ShieldLoss:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.ShieldLoss:setShaderVector( 1, 0, 0, 0, 0 )
	self.ShieldLoss:setShaderVector( 2, 1, 0, 0, 0 )
	self.ShieldLoss:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( self.ShieldLoss )

	self.Shield = LUI.UIImage.new()
	self.Shield:setLeftRight( true, false, 19 + 0.5, 150.5 - 0.5 )
	self.Shield:setTopBottom( false, true, -63 + 0.5, -58 - 1 )
	self.Shield:setImage( RegisterImage( "$white" ) )
	self.Shield:setRGB( 0, 0.47, 0.96 )
	self.Shield:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.Shield:setShaderVector( 1, 0, 0, 0, 0 )
	self.Shield:setShaderVector( 2, 1, 0, 0, 0 )
	self.Shield:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( self.Shield )

	self.ScoreIcon = LUI.UIImage.new()
	self.ScoreIcon:setLeftRight( true, false, 17.5, 33.5 )
	self.ScoreIcon:setTopBottom( false, true, -81.5, -65.5 )
	self.ScoreIcon:setImage( RegisterImage( "ui_icons_zombie_essence" ) )
	self:addElement( self.ScoreIcon )

	self.Score = LUI.UIText.new()
	self.Score:setLeftRight( true, true, -382, 0 )
	self.Score:setTopBottom( false, true, -91, -56 )
	self.Score:setTTF( "fonts/focal_bold_headers.ttf" )
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
		element.Circle:close()
		element.Name:close()
		element.HealthBG:close()
		element.HealthLoss:close()
		element.Health:close()
		element.ShieldBG:close()
		element.ShieldLoss:close()
		element.Shield:close()
		element.ScoreIcon:close()
		element.Score:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
