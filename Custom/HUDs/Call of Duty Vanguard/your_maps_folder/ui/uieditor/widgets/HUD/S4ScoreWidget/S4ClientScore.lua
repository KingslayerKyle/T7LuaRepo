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

CoD.S4ClientScore = InheritFrom( LUI.UIElement )
CoD.S4ClientScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.S4ClientScore )
	self.id = "S4ClientScore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.Circle = LUI.UIImage.new()
	self.Circle:setLeftRight( true, false, 22, 26 )
	self.Circle:setTopBottom( false, true, -100, -96 )
	self.Circle:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_blur" ) )
	self.Circle:setRGB( 0.33, 0.68, 0.91 )
	self:addElement( self.Circle )

	self.Name = LUI.UIText.new()
	self.Name:setLeftRight( true, true, -387, 0 )
	self.Name:setTopBottom( false, true, -113, -83 )
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
	self.HealthBG:setLeftRight( true, false, 19.5, 124.5 )
	self.HealthBG:setTopBottom( false, true, -108.5, -104.5 )
	self.HealthBG:setImage( RegisterImage( "$white" ) )
	self.HealthBG:setRGB( 0, 0, 0 )
	self.HealthBG:setAlpha( 0.25 )
	self:addElement( self.HealthBG )
	
	self.HealthLoss = LUI.UIImage.new()
	self.HealthLoss:setLeftRight( true, false, 19.5 + 0.5, 124.5 - 0.5 )
	self.HealthLoss:setTopBottom( false, true, -108.5 + 0.5, -104.5 - 1 )
	self.HealthLoss:setImage( RegisterImage( "$white" ) )
	self.HealthLoss:setRGB( 0.74, 0.31, 0.16 )
	self.HealthLoss:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.HealthLoss:setShaderVector( 1, 0, 0, 0, 0 )
	self.HealthLoss:setShaderVector( 2, 1, 0, 0, 0 )
	self.HealthLoss:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( self.HealthLoss )

	self.Health = LUI.UIImage.new()
	self.Health:setLeftRight( true, false, 19.5 + 0.5, 124.5 - 0.5 )
	self.Health:setTopBottom( false, true, -108.5 + 0.5, -104.5 - 1 )
	self.Health:setImage( RegisterImage( "$white" ) )
	self.Health:setRGB( 1, 1, 1 )
	self.Health:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.Health:setShaderVector( 1, 0, 0, 0, 0 )
	self.Health:setShaderVector( 2, 1, 0, 0, 0 )
	self.Health:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( self.Health )

	self.ShieldBG = LUI.UIImage.new()
	self.ShieldBG:setLeftRight( true, false, 19.5, 124.5 )
	self.ShieldBG:setTopBottom( false, true, -113.5, -109.5 )
	self.ShieldBG:setImage( RegisterImage( "$white" ) )
	self.ShieldBG:setRGB( 0, 0, 0 )
	self.ShieldBG:setAlpha( 0.25 )
	self:addElement( self.ShieldBG )

	self.ShieldLoss = LUI.UIImage.new()
	self.ShieldLoss:setLeftRight( true, false, 19.5 + 0.5, 124.5 - 0.5 )
	self.ShieldLoss:setTopBottom( false, true, -113.5 + 0.5, -109.5 - 1 )
	self.ShieldLoss:setImage( RegisterImage( "$white" ) )
	self.ShieldLoss:setRGB( 0.74, 0.31, 0.16 )
	self.ShieldLoss:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.ShieldLoss:setShaderVector( 1, 0, 0, 0, 0 )
	self.ShieldLoss:setShaderVector( 2, 1, 0, 0, 0 )
	self.ShieldLoss:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( self.ShieldLoss )

	self.Shield = LUI.UIImage.new()
	self.Shield:setLeftRight( true, false, 19.5 + 0.5, 124.5 - 0.5 )
	self.Shield:setTopBottom( false, true, -113.5 + 0.5, -109.5 - 1 )
	self.Shield:setImage( RegisterImage( "$white" ) )
	self.Shield:setRGB( 0, 0.47, 0.96 )
	self.Shield:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.Shield:setShaderVector( 1, 0, 0, 0, 0 )
	self.Shield:setShaderVector( 2, 1, 0, 0, 0 )
	self.Shield:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( self.Shield )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				self.Circle:completeAnimation()
				self.Circle:setAlpha( 0 )
				self.clipFinished( self.Circle, {} )

				self.Name:completeAnimation()
				self.Name:setAlpha( 0 )
				self.clipFinished( self.Name, {} )

				self.HealthBG:completeAnimation()
				self.HealthBG:setAlpha( 0 )
				self.clipFinished( self.HealthBG, {} )

				self.HealthLoss:completeAnimation()
				self.HealthLoss:setAlpha( 0 )
				self.clipFinished( self.HealthLoss, {} )

				self.Health:completeAnimation()
				self.Health:setAlpha( 0 )
				self.clipFinished( self.Health, {} )

				self.ShieldBG:completeAnimation()
				self.ShieldBG:setAlpha( 0 )
				self.clipFinished( self.ShieldBG, {} )

				self.ShieldLoss:completeAnimation()
				self.ShieldLoss:setAlpha( 0 )
				self.clipFinished( self.ShieldLoss, {} )

				self.Shield:completeAnimation()
				self.Shield:setAlpha( 0 )
				self.clipFinished( self.Shield, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				self.Circle:completeAnimation()
				self.Circle:setAlpha( 1 )
				self.clipFinished( self.Circle, {} )

				self.Name:completeAnimation()
				self.Name:setAlpha( 1 )
				self.clipFinished( self.Name, {} )

				self.HealthBG:completeAnimation()
				self.HealthBG:setAlpha( 0.25 )
				self.clipFinished( self.HealthBG, {} )

				self.HealthLoss:completeAnimation()
				self.HealthLoss:setAlpha( 1 )
				self.clipFinished( self.HealthLoss, {} )

				self.Health:completeAnimation()
				self.Health:setAlpha( 1 )
				self.clipFinished( self.Health, {} )

				self.ShieldBG:completeAnimation()
				self.ShieldBG:setAlpha( 0.25 )
				self.clipFinished( self.ShieldBG, {} )

				self.ShieldLoss:completeAnimation()
				self.ShieldLoss:setAlpha( 1 )
				self.clipFinished( self.ShieldLoss, {} )

				self.Shield:completeAnimation()
				self.Shield:setAlpha( 1 )
				self.clipFinished( self.Shield, {} )
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
		element.Circle:close()
		element.Name:close()
		element.HealthBG:close()
		element.HealthLoss:close()
		element.Health:close()
		element.ShieldBG:close()
		element.ShieldLoss:close()
		element.Shield:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
