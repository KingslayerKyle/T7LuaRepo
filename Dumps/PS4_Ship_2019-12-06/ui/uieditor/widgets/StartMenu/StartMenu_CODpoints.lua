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
	self:setLeftRight( true, false, 0, 76 )
	self:setTopBottom( true, false, 0, 25 )
	
	local ring = LUI.UIImage.new()
	ring:setLeftRight( false, false, -52, 1 )
	ring:setTopBottom( false, false, -26.5, 26.5 )
	ring:setAlpha( 0 )
	ring:setImage( RegisterImage( "uie_t7_blackmarket_keyringglow_glow" ) )
	self:addElement( ring )
	self.ring = ring
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( false, false, -55.52, 4.52 )
	Glow:setTopBottom( false, false, -30, 31 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_blackmarket_keyglow_gold" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local codpoints = LUI.UIImage.new()
	codpoints:setLeftRight( true, false, 0, 25 )
	codpoints:setTopBottom( false, false, -12.5, 12.5 )
	codpoints:setImage( RegisterImage( "uie_t7_icon_codpoints" ) )
	self:addElement( codpoints )
	self.codpoints = codpoints
	
	local codpointGlint = LUI.UIImage.new()
	codpointGlint:setLeftRight( true, false, 0, 25 )
	codpointGlint:setTopBottom( false, false, -12.5, 12.5 )
	codpointGlint:setRGB( 1, 0.94, 0.57 )
	codpointGlint:setImage( RegisterImage( "uie_t7_icon_codpoints" ) )
	codpointGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
	codpointGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
	self:addElement( codpointGlint )
	self.codpointGlint = codpointGlint
	
	local codpointsCount = LUI.UITightText.new()
	codpointsCount:setLeftRight( true, false, 26.25, 76.25 )
	codpointsCount:setTopBottom( false, false, -11, 11 )
	codpointsCount:setTTF( "fonts/default.ttf" )
	codpointsCount:subscribeToGlobalModel( controller, "CryptoKeyProgress", "codPoints", function ( model )
		local codPoints = Engine.GetModelValue( model )
		if codPoints then
			codpointsCount:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", codPoints ) ) )
		end
	end )
	self:addElement( codpointsCount )
	self.codpointsCount = codpointsCount
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				ring:completeAnimation()
				self.ring:setAlpha( 0 )
				self.clipFinished( ring, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				codpoints:completeAnimation()
				self.codpoints:setAlpha( 1 )
				self.clipFinished( codpoints, {} )
				codpointGlint:completeAnimation()
				self.codpointGlint:setAlpha( 0 )
				self.clipFinished( codpointGlint, {} )
				codpointsCount:completeAnimation()
				self.codpointsCount:setAlpha( 1 )
				self.clipFinished( codpointsCount, {} )
			end
		},
		ShowShimmer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local f4_local0 = function ( f5_arg0, f5_arg1 )
					local f5_local0 = function ( f6_arg0, f6_arg1 )
						local f6_local0 = function ( f7_arg0, f7_arg1 )
							local f7_local0 = function ( f8_arg0, f8_arg1 )
								local f8_local0 = function ( f9_arg0, f9_arg1 )
									if not f9_arg1.interrupted then
										f9_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									end
									f9_arg0:setAlpha( 0 )
									f9_arg0:setScale( 1.9 )
									if f9_arg1.interrupted then
										self.clipFinished( f9_arg0, f9_arg1 )
									else
										f9_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f8_arg1.interrupted then
									f8_local0( f8_arg0, f8_arg1 )
									return 
								else
									f8_arg0:beginAnimation( "keyframe", 619, false, false, CoD.TweenType.Linear )
									f8_arg0:setAlpha( 0 )
									f8_arg0:setScale( 1.85 )
									f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
								end
							end
							
							if f7_arg1.interrupted then
								f7_local0( f7_arg0, f7_arg1 )
								return 
							else
								f7_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								f7_arg0:setAlpha( 0.5 )
								f7_arg0:setScale( 1.3 )
								f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
							end
						end
						
						if f6_arg1.interrupted then
							f6_local0( f6_arg0, f6_arg1 )
							return 
						else
							f6_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f6_arg0:setAlpha( 1 )
							f6_arg0:setScale( 1.08 )
							f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
						end
					end
					
					if f5_arg1.interrupted then
						f5_local0( f5_arg0, f5_arg1 )
						return 
					else
						f5_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						f5_arg0:setAlpha( 0.86 )
						f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
					end
				end
				
				ring:beginAnimation( "keyframe", 1169, false, false, CoD.TweenType.Linear )
				ring:setAlpha( 0 )
				ring:setScale( 1 )
				ring:registerEventHandler( "transition_complete_keyframe", f4_local0 )
				local f4_local1 = function ( f10_arg0, f10_arg1 )
					local f10_local0 = function ( f11_arg0, f11_arg1 )
						local f11_local0 = function ( f12_arg0, f12_arg1 )
							local f12_local0 = function ( f13_arg0, f13_arg1 )
								local f13_local0 = function ( f14_arg0, f14_arg1 )
									if not f14_arg1.interrupted then
										f14_arg0:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
									end
									f14_arg0:setAlpha( 0 )
									f14_arg0:setScale( 0.8 )
									if f14_arg1.interrupted then
										self.clipFinished( f14_arg0, f14_arg1 )
									else
										f14_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f13_arg1.interrupted then
									f13_local0( f13_arg0, f13_arg1 )
									return 
								else
									f13_arg0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
									f13_arg0:setAlpha( 0.2 )
									f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
								end
							end
							
							if f12_arg1.interrupted then
								f12_local0( f12_arg0, f12_arg1 )
								return 
							else
								f12_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
							end
						end
						
						if f11_arg1.interrupted then
							f11_local0( f11_arg0, f11_arg1 )
							return 
						else
							f11_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							f11_arg0:setScale( 0.8 )
							f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
						end
					end
					
					if f10_arg1.interrupted then
						f10_local0( f10_arg0, f10_arg1 )
						return 
					else
						f10_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						f10_arg0:setAlpha( 1 )
						f10_arg0:setScale( 1 )
						f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
					end
				end
				
				Glow:beginAnimation( "keyframe", 1250, false, false, CoD.TweenType.Linear )
				Glow:setAlpha( 0 )
				Glow:setScale( 0.8 )
				Glow:registerEventHandler( "transition_complete_keyframe", f4_local1 )
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
							codpointGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
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
				self.codpointGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.codpointsCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

