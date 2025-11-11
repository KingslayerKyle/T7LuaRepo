CoD.StartMenu_CODpoints = InheritFrom( LUI.UIElement )
CoD.StartMenu_CODpoints.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_CODpoints )
	self.id = "StartMenu_CODpoints"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 114 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local ring = LUI.UIImage.new()
	ring:setLeftRight( 0.5, 0.5, -78, 2 )
	ring:setTopBottom( 0.5, 0.5, -40, 40 )
	ring:setAlpha( 0 )
	ring:setImage( RegisterImage( "uie_t7_blackmarket_keyringglow_glow" ) )
	self:addElement( ring )
	self.ring = ring
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0.5, 0.5, -83, 7 )
	Glow:setTopBottom( 0.5, 0.5, -45, 47 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_blackmarket_keyglow_gold" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local codpoints = LUI.UIImage.new()
	codpoints:setLeftRight( 0, 0, 0, 38 )
	codpoints:setTopBottom( 0.5, 0.5, -19, 19 )
	codpoints:setImage( RegisterImage( "uie_ui_codpoints_symbol_32x32" ) )
	self:addElement( codpoints )
	self.codpoints = codpoints
	
	local codpointGlint = LUI.UIImage.new()
	codpointGlint:setLeftRight( 0, 0, 0, 38 )
	codpointGlint:setTopBottom( 0.5, 0.5, -19, 19 )
	codpointGlint:setRGB( 1, 0.94, 0.57 )
	codpointGlint:setImage( RegisterImage( "uie_ui_codpoints_symbol_32x32" ) )
	codpointGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
	codpointGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
	self:addElement( codpointGlint )
	self.codpointGlint = codpointGlint
	
	local codpointsCount = LUI.UITightText.new()
	codpointsCount:setLeftRight( 0, 0, 39, 114 )
	codpointsCount:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	codpointsCount:setTTF( "fonts/default.ttf" )
	codpointsCount:subscribeToGlobalModel( controller, "CryptoKeyProgress", "codPoints", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			codpointsCount:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", modelValue ) ) )
		end
	end )
	self:addElement( codpointsCount )
	self.codpointsCount = codpointsCount
	
	self.resetProperties = function ()
		codpointGlint:completeAnimation()
		codpoints:completeAnimation()
		ring:completeAnimation()
		Glow:completeAnimation()
		codpointGlint:setAlpha( 1 )
		codpointGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
		codpointGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
		codpoints:setAlpha( 1 )
		ring:setAlpha( 0 )
		ring:setScale( 1 )
		Glow:setAlpha( 0 )
		Glow:setScale( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				codpointGlint:completeAnimation()
				self.codpointGlint:setAlpha( 0 )
				self.clipFinished( codpointGlint, {} )
			end
		},
		ShowShimmer = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local ringFrame2 = function ( ring, event )
					local ringFrame3 = function ( ring, event )
						local ringFrame4 = function ( ring, event )
							local ringFrame5 = function ( ring, event )
								local ringFrame6 = function ( ring, event )
									if not event.interrupted then
										ring:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									end
									ring:setAlpha( 0 )
									ring:setScale( 1.9 )
									if event.interrupted then
										self.clipFinished( ring, event )
									else
										ring:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ringFrame6( ring, event )
									return 
								else
									ring:beginAnimation( "keyframe", 619, false, false, CoD.TweenType.Linear )
									ring:setAlpha( 0 )
									ring:setScale( 1.85 )
									ring:registerEventHandler( "transition_complete_keyframe", ringFrame6 )
								end
							end
							
							if event.interrupted then
								ringFrame5( ring, event )
								return 
							else
								ring:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								ring:setAlpha( 0.5 )
								ring:setScale( 1.3 )
								ring:registerEventHandler( "transition_complete_keyframe", ringFrame5 )
							end
						end
						
						if event.interrupted then
							ringFrame4( ring, event )
							return 
						else
							ring:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							ring:setAlpha( 1 )
							ring:setScale( 1.08 )
							ring:registerEventHandler( "transition_complete_keyframe", ringFrame4 )
						end
					end
					
					if event.interrupted then
						ringFrame3( ring, event )
						return 
					else
						ring:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						ring:setAlpha( 0.86 )
						ring:registerEventHandler( "transition_complete_keyframe", ringFrame3 )
					end
				end
				
				ring:beginAnimation( "keyframe", 1169, false, false, CoD.TweenType.Linear )
				ring:setAlpha( 0 )
				ring:setScale( 1 )
				ring:registerEventHandler( "transition_complete_keyframe", ringFrame2 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									if not event.interrupted then
										Glow:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
									end
									Glow:setAlpha( 0 )
									Glow:setScale( 0.8 )
									if event.interrupted then
										self.clipFinished( Glow, event )
									else
										Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
									Glow:setAlpha( 0.2 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							Glow:setScale( 0.8 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:setScale( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:beginAnimation( "keyframe", 1250, false, false, CoD.TweenType.Linear )
				Glow:setAlpha( 0 )
				Glow:setScale( 0.8 )
				Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame2 )
				local codpointsFrame2 = function ( codpoints, event )
					local codpointsFrame3 = function ( codpoints, event )
						local codpointsFrame4 = function ( codpoints, event )
							local codpointsFrame5 = function ( codpoints, event )
								local codpointsFrame6 = function ( codpoints, event )
									if not event.interrupted then
										codpoints:beginAnimation( "keyframe", 3559, false, false, CoD.TweenType.Linear )
									end
									codpoints:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( codpoints, event )
									else
										codpoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									codpointsFrame6( codpoints, event )
									return 
								else
									codpoints:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									codpoints:setAlpha( 1 )
									codpoints:registerEventHandler( "transition_complete_keyframe", codpointsFrame6 )
								end
							end
							
							if event.interrupted then
								codpointsFrame5( codpoints, event )
								return 
							else
								codpoints:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								codpoints:registerEventHandler( "transition_complete_keyframe", codpointsFrame5 )
							end
						end
						
						if event.interrupted then
							codpointsFrame4( codpoints, event )
							return 
						else
							codpoints:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							codpoints:setAlpha( 0.85 )
							codpoints:registerEventHandler( "transition_complete_keyframe", codpointsFrame4 )
						end
					end
					
					if event.interrupted then
						codpointsFrame3( codpoints, event )
						return 
					else
						codpoints:beginAnimation( "keyframe", 1250, false, false, CoD.TweenType.Linear )
						codpoints:registerEventHandler( "transition_complete_keyframe", codpointsFrame3 )
					end
				end
				
				codpoints:completeAnimation()
				self.codpoints:setAlpha( 1 )
				codpointsFrame2( codpoints, {} )
				local codpointGlintFrame2 = function ( codpointGlint, event )
					local codpointGlintFrame3 = function ( codpointGlint, event )
						local codpointGlintFrame4 = function ( codpointGlint, event )
							if not event.interrupted then
								codpointGlint:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							end
							codpointGlint:setAlpha( 0 )
							codpointGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
							codpointGlint:setShaderVector( 0, 0.99, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( codpointGlint, event )
							else
								codpointGlint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							codpointGlintFrame4( codpointGlint, event )
							return 
						else
							codpointGlint:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
							codpointGlint:setShaderVector( 0, 0.99, 0, 0, 0 )
							codpointGlint:registerEventHandler( "transition_complete_keyframe", codpointGlintFrame4 )
						end
					end
					
					if event.interrupted then
						codpointGlintFrame3( codpointGlint, event )
						return 
					else
						codpointGlint:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						codpointGlint:setAlpha( 1 )
						codpointGlint:registerEventHandler( "transition_complete_keyframe", codpointGlintFrame3 )
					end
				end
				
				codpointGlint:completeAnimation()
				self.codpointGlint:setAlpha( 0 )
				self.codpointGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
				self.codpointGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
				codpointGlintFrame2( codpointGlint, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ShowShimmer",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "CryptoKeyProgress.codPoints", 200 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.codPoints" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.codPoints"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.codpointsCount:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

