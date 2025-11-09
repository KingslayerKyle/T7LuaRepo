CoD.ZmAmmo_BBGumMeterWidget = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_BBGumMeterWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_BBGumMeterWidget )
	self.id = "ZmAmmo_BBGumMeterWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 53 )
	self:setTopBottom( true, false, 0, 53 )
	
	local AbilitySwirl = LUI.UIImage.new()
	AbilitySwirl:setLeftRight( true, false, -4.99, 57.87 )
	AbilitySwirl:setTopBottom( true, false, -4.93, 57.93 )
	AbilitySwirl:setRGB( 1, 0.64, 0 )
	AbilitySwirl:setAlpha( 0.9 )
	AbilitySwirl:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityswirl" ) )
	AbilitySwirl:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilitySwirl )
	self.AbilitySwirl = AbilitySwirl
	
	local BBGumRingBacker = LUI.UIImage.new()
	BBGumRingBacker:setLeftRight( true, false, 0, 53 )
	BBGumRingBacker:setTopBottom( true, false, 0, 53 )
	BBGumRingBacker:setAlpha( 0.1 )
	BBGumRingBacker:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bbgummeterringbacker" ) )
	self:addElement( BBGumRingBacker )
	self.BBGumRingBacker = BBGumRingBacker
	
	local BBGumRing000 = LUI.UIImage.new()
	BBGumRing000:setLeftRight( true, false, 0, 53 )
	BBGumRing000:setTopBottom( true, false, 0, 53 )
	BBGumRing000:setRGB( 1, 0.85, 0 )
	BBGumRing000:setAlpha( 0.5 )
	BBGumRing000:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bbgummeterringblur3" ) )
	BBGumRing000:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	BBGumRing000:setShaderVector( 1, 0.5, 0, 0, 0 )
	BBGumRing000:setShaderVector( 2, 0.5, 0, 0, 0 )
	BBGumRing000:setShaderVector( 3, 0.08, 0, 0, 0 )
	BBGumRing000:subscribeToGlobalModel( controller, "PerController", "bgb_timer", function ( model )
		local bgbTimer = Engine.GetModelValue( model )
		if bgbTimer then
			BBGumRing000:setShaderVector( 0, CoD.GetVectorComponentFromString( bgbTimer, 1 ), CoD.GetVectorComponentFromString( bgbTimer, 2 ), CoD.GetVectorComponentFromString( bgbTimer, 3 ), CoD.GetVectorComponentFromString( bgbTimer, 4 ) )
		end
	end )
	self:addElement( BBGumRing000 )
	self.BBGumRing000 = BBGumRing000
	
	local BBGumRing00 = LUI.UIImage.new()
	BBGumRing00:setLeftRight( true, false, 0, 53 )
	BBGumRing00:setTopBottom( true, false, 0, 53 )
	BBGumRing00:setRGB( 1, 0.69, 0 )
	BBGumRing00:setAlpha( 0.5 )
	BBGumRing00:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bbgummeterringblur1" ) )
	BBGumRing00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	BBGumRing00:setShaderVector( 1, 0.5, 0, 0, 0 )
	BBGumRing00:setShaderVector( 2, 0.5, 0, 0, 0 )
	BBGumRing00:setShaderVector( 3, 0.08, 0, 0, 0 )
	BBGumRing00:subscribeToGlobalModel( controller, "PerController", "bgb_timer", function ( model )
		local bgbTimer = Engine.GetModelValue( model )
		if bgbTimer then
			BBGumRing00:setShaderVector( 0, CoD.GetVectorComponentFromString( bgbTimer, 1 ), CoD.GetVectorComponentFromString( bgbTimer, 2 ), CoD.GetVectorComponentFromString( bgbTimer, 3 ), CoD.GetVectorComponentFromString( bgbTimer, 4 ) )
		end
	end )
	self:addElement( BBGumRing00 )
	self.BBGumRing00 = BBGumRing00
	
	local BBGumRing0 = LUI.UIImage.new()
	BBGumRing0:setLeftRight( true, false, 0, 53 )
	BBGumRing0:setTopBottom( true, false, 0, 53 )
	BBGumRing0:setRGB( 1, 0.78, 0 )
	BBGumRing0:setAlpha( 0.5 )
	BBGumRing0:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bbgummeterringblur1" ) )
	BBGumRing0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	BBGumRing0:setShaderVector( 1, 0.5, 0, 0, 0 )
	BBGumRing0:setShaderVector( 2, 0.5, 0, 0, 0 )
	BBGumRing0:setShaderVector( 3, 0.08, 0, 0, 0 )
	BBGumRing0:subscribeToGlobalModel( controller, "PerController", "bgb_timer", function ( model )
		local bgbTimer = Engine.GetModelValue( model )
		if bgbTimer then
			BBGumRing0:setShaderVector( 0, CoD.GetVectorComponentFromString( bgbTimer, 1 ), CoD.GetVectorComponentFromString( bgbTimer, 2 ), CoD.GetVectorComponentFromString( bgbTimer, 3 ), CoD.GetVectorComponentFromString( bgbTimer, 4 ) )
		end
	end )
	self:addElement( BBGumRing0 )
	self.BBGumRing0 = BBGumRing0
	
	local BBGumRing = LUI.UIImage.new()
	BBGumRing:setLeftRight( true, false, 0, 52.89 )
	BBGumRing:setTopBottom( true, false, 0, 52.88 )
	BBGumRing:setRGB( 1, 0.96, 0.75 )
	BBGumRing:setAlpha( 0.75 )
	BBGumRing:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bbgummeterring" ) )
	BBGumRing:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	BBGumRing:setShaderVector( 1, 0.5, 0, 0, 0 )
	BBGumRing:setShaderVector( 2, 0.5, 0, 0, 0 )
	BBGumRing:setShaderVector( 3, 0.08, 0, 0, 0 )
	BBGumRing:subscribeToGlobalModel( controller, "PerController", "bgb_timer", function ( model )
		local bgbTimer = Engine.GetModelValue( model )
		if bgbTimer then
			BBGumRing:setShaderVector( 0, CoD.GetVectorComponentFromString( bgbTimer, 1 ), CoD.GetVectorComponentFromString( bgbTimer, 2 ), CoD.GetVectorComponentFromString( bgbTimer, 3 ), CoD.GetVectorComponentFromString( bgbTimer, 4 ) )
		end
	end )
	self:addElement( BBGumRing )
	self.BBGumRing = BBGumRing
	
	local BBGumRingEdge = LUI.UIImage.new()
	BBGumRingEdge:setLeftRight( true, false, 0, 52.89 )
	BBGumRingEdge:setTopBottom( true, false, 0, 52.88 )
	BBGumRingEdge:setRGB( 1, 0.83, 0.08 )
	BBGumRingEdge:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bbgummeterring" ) )
	BBGumRingEdge:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	BBGumRingEdge:setShaderVector( 1, 0.5, 0, 0, 0 )
	BBGumRingEdge:setShaderVector( 2, 0.5, 0, 0, 0 )
	BBGumRingEdge:setShaderVector( 3, 0.08, -0.22, 0, 0 )
	BBGumRingEdge:subscribeToGlobalModel( controller, "PerController", "bgb_timer", function ( model )
		local bgbTimer = Engine.GetModelValue( model )
		if bgbTimer then
			BBGumRingEdge:setShaderVector( 0, CoD.GetVectorComponentFromString( bgbTimer, 1 ), CoD.GetVectorComponentFromString( bgbTimer, 2 ), CoD.GetVectorComponentFromString( bgbTimer, 3 ), CoD.GetVectorComponentFromString( bgbTimer, 4 ) )
		end
	end )
	self:addElement( BBGumRingEdge )
	self.BBGumRingEdge = BBGumRingEdge
	
	local BBGumTexture = LUI.UIImage.new()
	BBGumTexture:setLeftRight( true, false, 8, 44 )
	BBGumTexture:setTopBottom( true, false, 8, 44 )
	BBGumTexture:subscribeToGlobalModel( controller, "PerController", "bgb_current", function ( model )
		local bgbCurrent = Engine.GetModelValue( model )
		if bgbCurrent then
			BBGumTexture:setImage( RegisterImage( GetItemImageFromIndex( bgbCurrent ) ) )
		end
	end )
	self:addElement( BBGumTexture )
	self.BBGumTexture = BBGumTexture
	
	local Glow1 = LUI.UIImage.new()
	Glow1:setLeftRight( true, false, -3.56, 55.44 )
	Glow1:setTopBottom( true, false, -2.56, 56.44 )
	Glow1:setRGB( 1, 0.28, 0 )
	Glow1:setAlpha( 0.75 )
	Glow1:setZRot( -4 )
	Glow1:setScale( 1.2 )
	Glow1:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow1 )
	self.Glow1 = Glow1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				BBGumRingBacker:completeAnimation()
				self.BBGumRingBacker:setAlpha( 0 )
				self.clipFinished( BBGumRingBacker, {} )
				BBGumRing000:completeAnimation()
				self.BBGumRing000:setRGB( 1, 0.85, 0 )
				self.BBGumRing000:setAlpha( 0 )
				self.clipFinished( BBGumRing000, {} )
				BBGumRing00:completeAnimation()
				self.BBGumRing00:setRGB( 1, 0.69, 0 )
				self.BBGumRing00:setAlpha( 0 )
				self.clipFinished( BBGumRing00, {} )
				BBGumRing0:completeAnimation()
				self.BBGumRing0:setRGB( 1, 0.78, 0 )
				self.BBGumRing0:setAlpha( 0 )
				self.clipFinished( BBGumRing0, {} )
				BBGumRing:completeAnimation()
				self.BBGumRing:setRGB( 1, 0.96, 0.75 )
				self.BBGumRing:setAlpha( 0 )
				self.clipFinished( BBGumRing, {} )
				BBGumRingEdge:completeAnimation()
				self.BBGumRingEdge:setRGB( 1, 0.83, 0.08 )
				self.BBGumRingEdge:setAlpha( 0 )
				self.clipFinished( BBGumRingEdge, {} )
				BBGumTexture:completeAnimation()
				self.BBGumTexture:setAlpha( 0 )
				self.BBGumTexture:setScale( 1 )
				self.clipFinished( BBGumTexture, {} )
				Glow1:completeAnimation()
				self.Glow1:setAlpha( 0 )
				self.clipFinished( Glow1, {} )
			end
		},
		ActiveLow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				BBGumRingBacker:completeAnimation()
				self.BBGumRingBacker:setAlpha( 0.1 )
				self.clipFinished( BBGumRingBacker, {} )
				BBGumRing000:completeAnimation()
				self.BBGumRing000:setRGB( 1, 0.07, 0 )
				self.BBGumRing000:setAlpha( 0.5 )
				self.clipFinished( BBGumRing000, {} )
				BBGumRing00:completeAnimation()
				self.BBGumRing00:setRGB( 1, 0.08, 0 )
				self.BBGumRing00:setAlpha( 0.5 )
				self.clipFinished( BBGumRing00, {} )
				BBGumRing0:completeAnimation()
				self.BBGumRing0:setRGB( 1, 0.18, 0 )
				self.BBGumRing0:setAlpha( 0.5 )
				self.clipFinished( BBGumRing0, {} )
				BBGumRing:completeAnimation()
				self.BBGumRing:setRGB( 1, 0.77, 0.75 )
				self.BBGumRing:setAlpha( 0.7 )
				self.clipFinished( BBGumRing, {} )
				BBGumRingEdge:completeAnimation()
				self.BBGumRingEdge:setRGB( 1, 0.21, 0.12 )
				self.BBGumRingEdge:setAlpha( 1 )
				self.clipFinished( BBGumRingEdge, {} )
				BBGumTexture:completeAnimation()
				self.BBGumTexture:setLeftRight( true, false, 8, 44 )
				self.BBGumTexture:setTopBottom( true, false, 8, 44 )
				self.BBGumTexture:setAlpha( 1 )
				self.clipFinished( BBGumTexture, {} )
				Glow1:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
				Glow1:setAlpha( 0 )
				Glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local BBGumTextureFrame2 = function ( BBGumTexture, event )
					local BBGumTextureFrame3 = function ( BBGumTexture, event )
						local BBGumTextureFrame4 = function ( BBGumTexture, event )
							local BBGumTextureFrame5 = function ( BBGumTexture, event )
								local BBGumTextureFrame6 = function ( BBGumTexture, event )
									local BBGumTextureFrame7 = function ( BBGumTexture, event )
										local BBGumTextureFrame8 = function ( BBGumTexture, event )
											local BBGumTextureFrame9 = function ( BBGumTexture, event )
												local BBGumTextureFrame10 = function ( BBGumTexture, event )
													if not event.interrupted then
														BBGumTexture:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
													end
													BBGumTexture:setAlpha( 1 )
													BBGumTexture:setScale( 0 )
													if event.interrupted then
														self.clipFinished( BBGumTexture, event )
													else
														BBGumTexture:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													BBGumTextureFrame10( BBGumTexture, event )
													return 
												else
													BBGumTexture:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
													BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame10 )
												end
											end
											
											if event.interrupted then
												BBGumTextureFrame9( BBGumTexture, event )
												return 
											else
												BBGumTexture:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
												BBGumTexture:setScale( 1 )
												BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame9 )
											end
										end
										
										if event.interrupted then
											BBGumTextureFrame8( BBGumTexture, event )
											return 
										else
											BBGumTexture:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
											BBGumTexture:setScale( 0.8 )
											BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame8 )
										end
									end
									
									if event.interrupted then
										BBGumTextureFrame7( BBGumTexture, event )
										return 
									else
										BBGumTexture:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
										BBGumTexture:setScale( 1.2 )
										BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame7 )
									end
								end
								
								if event.interrupted then
									BBGumTextureFrame6( BBGumTexture, event )
									return 
								else
									BBGumTexture:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
									BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame6 )
								end
							end
							
							if event.interrupted then
								BBGumTextureFrame5( BBGumTexture, event )
								return 
							else
								BBGumTexture:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
								BBGumTexture:setScale( 1 )
								BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame5 )
							end
						end
						
						if event.interrupted then
							BBGumTextureFrame4( BBGumTexture, event )
							return 
						else
							BBGumTexture:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							BBGumTexture:setScale( 0.8 )
							BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame4 )
						end
					end
					
					if event.interrupted then
						BBGumTextureFrame3( BBGumTexture, event )
						return 
					else
						BBGumTexture:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						BBGumTexture:setScale( 1.2 )
						BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame3 )
					end
				end
				
				BBGumTexture:completeAnimation()
				self.BBGumTexture:setAlpha( 1 )
				self.BBGumTexture:setScale( 0 )
				BBGumTextureFrame2( BBGumTexture, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				BBGumRingBacker:completeAnimation()
				self.BBGumRingBacker:setAlpha( 0.1 )
				self.clipFinished( BBGumRingBacker, {} )
				BBGumRing000:completeAnimation()
				self.BBGumRing000:setRGB( 1, 0.85, 0 )
				self.BBGumRing000:setAlpha( 0.5 )
				self.clipFinished( BBGumRing000, {} )
				BBGumRing00:completeAnimation()
				self.BBGumRing00:setRGB( 1, 0.69, 0 )
				self.BBGumRing00:setAlpha( 0.5 )
				self.clipFinished( BBGumRing00, {} )
				BBGumRing0:completeAnimation()
				self.BBGumRing0:setRGB( 1, 0.78, 0 )
				self.BBGumRing0:setAlpha( 0.5 )
				self.clipFinished( BBGumRing0, {} )
				BBGumRing:completeAnimation()
				self.BBGumRing:setRGB( 1, 0.96, 0.75 )
				self.BBGumRing:setAlpha( 0.7 )
				self.clipFinished( BBGumRing, {} )
				BBGumRingEdge:completeAnimation()
				self.BBGumRingEdge:setRGB( 1, 0.71, 0.12 )
				self.BBGumRingEdge:setAlpha( 1 )
				self.clipFinished( BBGumRingEdge, {} )
				BBGumTexture:completeAnimation()
				self.BBGumTexture:setLeftRight( true, false, 8, 44 )
				self.BBGumTexture:setTopBottom( true, false, 8, 44 )
				self.BBGumTexture:setAlpha( 1 )
				self.BBGumTexture:setScale( 1 )
				self.clipFinished( BBGumTexture, {} )
				Glow1:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
				Glow1:setAlpha( 0 )
				Glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local BBGumTextureFrame2 = function ( BBGumTexture, event )
					local BBGumTextureFrame3 = function ( BBGumTexture, event )
						local BBGumTextureFrame4 = function ( BBGumTexture, event )
							local BBGumTextureFrame5 = function ( BBGumTexture, event )
								local BBGumTextureFrame6 = function ( BBGumTexture, event )
									local BBGumTextureFrame7 = function ( BBGumTexture, event )
										local BBGumTextureFrame8 = function ( BBGumTexture, event )
											local BBGumTextureFrame9 = function ( BBGumTexture, event )
												local BBGumTextureFrame10 = function ( BBGumTexture, event )
													if not event.interrupted then
														BBGumTexture:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
													end
													BBGumTexture:setAlpha( 1 )
													BBGumTexture:setScale( 0 )
													if event.interrupted then
														self.clipFinished( BBGumTexture, event )
													else
														BBGumTexture:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													BBGumTextureFrame10( BBGumTexture, event )
													return 
												else
													BBGumTexture:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
													BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame10 )
												end
											end
											
											if event.interrupted then
												BBGumTextureFrame9( BBGumTexture, event )
												return 
											else
												BBGumTexture:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
												BBGumTexture:setScale( 1 )
												BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame9 )
											end
										end
										
										if event.interrupted then
											BBGumTextureFrame8( BBGumTexture, event )
											return 
										else
											BBGumTexture:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
											BBGumTexture:setScale( 0.8 )
											BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame8 )
										end
									end
									
									if event.interrupted then
										BBGumTextureFrame7( BBGumTexture, event )
										return 
									else
										BBGumTexture:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
										BBGumTexture:setScale( 1.2 )
										BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame7 )
									end
								end
								
								if event.interrupted then
									BBGumTextureFrame6( BBGumTexture, event )
									return 
								else
									BBGumTexture:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
									BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame6 )
								end
							end
							
							if event.interrupted then
								BBGumTextureFrame5( BBGumTexture, event )
								return 
							else
								BBGumTexture:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
								BBGumTexture:setScale( 1 )
								BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame5 )
							end
						end
						
						if event.interrupted then
							BBGumTextureFrame4( BBGumTexture, event )
							return 
						else
							BBGumTexture:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							BBGumTexture:setScale( 0.8 )
							BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame4 )
						end
					end
					
					if event.interrupted then
						BBGumTextureFrame3( BBGumTexture, event )
						return 
					else
						BBGumTexture:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						BBGumTexture:setScale( 1.2 )
						BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame3 )
					end
				end
				
				BBGumTexture:completeAnimation()
				self.BBGumTexture:setAlpha( 1 )
				self.BBGumTexture:setScale( 0 )
				BBGumTextureFrame2( BBGumTexture, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				BBGumRingBacker:completeAnimation()
				self.BBGumRingBacker:setAlpha( 0.1 )
				self.clipFinished( BBGumRingBacker, {} )
				BBGumRing000:completeAnimation()
				self.BBGumRing000:setRGB( 0.73, 0.73, 0.73 )
				self.BBGumRing000:setAlpha( 0 )
				self.clipFinished( BBGumRing000, {} )
				BBGumRing00:completeAnimation()
				self.BBGumRing00:setRGB( 0.73, 0.73, 0.73 )
				self.BBGumRing00:setAlpha( 0 )
				self.clipFinished( BBGumRing00, {} )
				BBGumRing0:completeAnimation()
				self.BBGumRing0:setRGB( 0.73, 0.73, 0.73 )
				self.BBGumRing0:setAlpha( 0 )
				self.clipFinished( BBGumRing0, {} )
				BBGumRing:completeAnimation()
				self.BBGumRing:setRGB( 0.73, 0.73, 0.73 )
				self.BBGumRing:setAlpha( 0 )
				self.clipFinished( BBGumRing, {} )
				BBGumRingEdge:completeAnimation()
				self.BBGumRingEdge:setRGB( 1, 0.83, 0.08 )
				self.BBGumRingEdge:setAlpha( 0 )
				self.clipFinished( BBGumRingEdge, {} )
				BBGumTexture:completeAnimation()
				self.BBGumTexture:setLeftRight( true, false, 8, 44 )
				self.BBGumTexture:setTopBottom( true, false, 8, 44 )
				self.BBGumTexture:setAlpha( 1 )
				self.clipFinished( BBGumTexture, {} )
				Glow1:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
				Glow1:setAlpha( 0 )
				Glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			Active = function ()
				self:setupElementClipCounter( 9 )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					local AbilitySwirlFrame3 = function ( AbilitySwirl, event )
						local AbilitySwirlFrame4 = function ( AbilitySwirl, event )
							local AbilitySwirlFrame5 = function ( AbilitySwirl, event )
								local AbilitySwirlFrame6 = function ( AbilitySwirl, event )
									if not event.interrupted then
										AbilitySwirl:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									end
									AbilitySwirl:setLeftRight( true, false, -4.99, 57.87 )
									AbilitySwirl:setTopBottom( true, false, -4.93, 57.93 )
									AbilitySwirl:setAlpha( 0 )
									AbilitySwirl:setZRot( 631 )
									AbilitySwirl:setScale( 1.3 )
									if event.interrupted then
										self.clipFinished( AbilitySwirl, event )
									else
										AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									AbilitySwirlFrame6( AbilitySwirl, event )
									return 
								else
									AbilitySwirl:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									AbilitySwirl:setAlpha( 0 )
									AbilitySwirl:setZRot( 592.29 )
									AbilitySwirl:setScale( 1.25 )
									AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame6 )
								end
							end
							
							if event.interrupted then
								AbilitySwirlFrame5( AbilitySwirl, event )
								return 
							else
								AbilitySwirl:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								AbilitySwirl:setZRot( 476.14 )
								AbilitySwirl:setScale( 1.11 )
								AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame5 )
							end
						end
						
						if event.interrupted then
							AbilitySwirlFrame4( AbilitySwirl, event )
							return 
						else
							AbilitySwirl:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							AbilitySwirl:setZRot( 360 )
							AbilitySwirl:setScale( 0.96 )
							AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame4 )
						end
					end
					
					if event.interrupted then
						AbilitySwirlFrame3( AbilitySwirl, event )
						return 
					else
						AbilitySwirl:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						AbilitySwirl:setAlpha( 0.9 )
						AbilitySwirl:setZRot( 248.28 )
						AbilitySwirl:setScale( 0.82 )
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame3 )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setLeftRight( true, false, -4.99, 57.87 )
				self.AbilitySwirl:setTopBottom( true, false, -4.93, 57.93 )
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( 0 )
				self.AbilitySwirl:setScale( 0.5 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
				local BBGumRingBackerFrame2 = function ( BBGumRingBacker, event )
					if not event.interrupted then
						BBGumRingBacker:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					BBGumRingBacker:setAlpha( 0.1 )
					if event.interrupted then
						self.clipFinished( BBGumRingBacker, event )
					else
						BBGumRingBacker:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BBGumRingBacker:completeAnimation()
				self.BBGumRingBacker:setAlpha( 0.1 )
				BBGumRingBackerFrame2( BBGumRingBacker, {} )
				local BBGumRing000Frame2 = function ( BBGumRing000, event )
					if not event.interrupted then
						BBGumRing000:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					BBGumRing000:setRGB( 1, 0.85, 0 )
					BBGumRing000:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( BBGumRing000, event )
					else
						BBGumRing000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BBGumRing000:completeAnimation()
				self.BBGumRing000:setRGB( 0.73, 0.73, 0.73 )
				self.BBGumRing000:setAlpha( 0 )
				BBGumRing000Frame2( BBGumRing000, {} )
				local BBGumRing00Frame2 = function ( BBGumRing00, event )
					if not event.interrupted then
						BBGumRing00:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					BBGumRing00:setRGB( 1, 0.69, 0 )
					BBGumRing00:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( BBGumRing00, event )
					else
						BBGumRing00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BBGumRing00:completeAnimation()
				self.BBGumRing00:setRGB( 0.73, 0.73, 0.73 )
				self.BBGumRing00:setAlpha( 0 )
				BBGumRing00Frame2( BBGumRing00, {} )
				local BBGumRing0Frame2 = function ( BBGumRing0, event )
					if not event.interrupted then
						BBGumRing0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					BBGumRing0:setRGB( 1, 0.78, 0 )
					BBGumRing0:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( BBGumRing0, event )
					else
						BBGumRing0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BBGumRing0:completeAnimation()
				self.BBGumRing0:setRGB( 0.73, 0.73, 0.73 )
				self.BBGumRing0:setAlpha( 0 )
				BBGumRing0Frame2( BBGumRing0, {} )
				local BBGumRingFrame2 = function ( BBGumRing, event )
					if not event.interrupted then
						BBGumRing:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					BBGumRing:setRGB( 1, 0.96, 0.75 )
					BBGumRing:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( BBGumRing, event )
					else
						BBGumRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BBGumRing:completeAnimation()
				self.BBGumRing:setRGB( 0.73, 0.73, 0.73 )
				self.BBGumRing:setAlpha( 0 )
				BBGumRingFrame2( BBGumRing, {} )
				local BBGumRingEdgeFrame2 = function ( BBGumRingEdge, event )
					if not event.interrupted then
						BBGumRingEdge:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					BBGumRingEdge:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BBGumRingEdge, event )
					else
						BBGumRingEdge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BBGumRingEdge:completeAnimation()
				self.BBGumRingEdge:setAlpha( 0 )
				BBGumRingEdgeFrame2( BBGumRingEdge, {} )
				local BBGumTextureFrame2 = function ( BBGumTexture, event )
					local BBGumTextureFrame3 = function ( BBGumTexture, event )
						local BBGumTextureFrame4 = function ( BBGumTexture, event )
							if not event.interrupted then
								BBGumTexture:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							BBGumTexture:setAlpha( 1 )
							BBGumTexture:setScale( 1 )
							if event.interrupted then
								self.clipFinished( BBGumTexture, event )
							else
								BBGumTexture:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BBGumTextureFrame4( BBGumTexture, event )
							return 
						else
							BBGumTexture:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							BBGumTexture:setScale( 1.2 )
							BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame4 )
						end
					end
					
					if event.interrupted then
						BBGumTextureFrame3( BBGumTexture, event )
						return 
					else
						BBGumTexture:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						BBGumTexture:setScale( 0.8 )
						BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame3 )
					end
				end
				
				BBGumTexture:completeAnimation()
				self.BBGumTexture:setAlpha( 1 )
				self.BBGumTexture:setScale( 1 )
				BBGumTextureFrame2( BBGumTexture, {} )
				local Glow1Frame2 = function ( Glow1, event )
					local Glow1Frame3 = function ( Glow1, event )
						local Glow1Frame4 = function ( Glow1, event )
							if not event.interrupted then
								Glow1:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							Glow1:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Glow1, event )
							else
								Glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Glow1Frame4( Glow1, event )
							return 
						else
							Glow1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame4 )
						end
					end
					
					if event.interrupted then
						Glow1Frame3( Glow1, event )
						return 
					else
						Glow1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						Glow1:setAlpha( 0.65 )
						Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame3 )
					end
				end
				
				Glow1:completeAnimation()
				self.Glow1:setAlpha( 0 )
				Glow1Frame2( Glow1, {} )
			end
		},
		InstantActivate = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 7 )
				BBGumRingBacker:completeAnimation()
				self.BBGumRingBacker:setAlpha( 0.1 )
				self.clipFinished( BBGumRingBacker, {} )
				BBGumRing000:completeAnimation()
				self.BBGumRing000:setRGB( 1, 0.85, 0 )
				self.BBGumRing000:setAlpha( 0.5 )
				self.clipFinished( BBGumRing000, {} )
				BBGumRing00:completeAnimation()
				self.BBGumRing00:setRGB( 1, 0.69, 0 )
				self.BBGumRing00:setAlpha( 0.5 )
				self.clipFinished( BBGumRing00, {} )
				BBGumRing0:completeAnimation()
				self.BBGumRing0:setRGB( 1, 0.78, 0 )
				self.BBGumRing0:setAlpha( 0.5 )
				self.clipFinished( BBGumRing0, {} )
				BBGumRing:completeAnimation()
				self.BBGumRing:setRGB( 1, 0.96, 0.75 )
				self.BBGumRing:setAlpha( 0.7 )
				self.clipFinished( BBGumRing, {} )
				BBGumRingEdge:completeAnimation()
				self.BBGumRingEdge:setRGB( 1, 0.71, 0.12 )
				self.BBGumRingEdge:setAlpha( 1 )
				self.clipFinished( BBGumRingEdge, {} )
				local BBGumTextureFrame2 = function ( BBGumTexture, event )
					local BBGumTextureFrame3 = function ( BBGumTexture, event )
						local BBGumTextureFrame4 = function ( BBGumTexture, event )
							local BBGumTextureFrame5 = function ( BBGumTexture, event )
								local BBGumTextureFrame6 = function ( BBGumTexture, event )
									local BBGumTextureFrame7 = function ( BBGumTexture, event )
										local BBGumTextureFrame8 = function ( BBGumTexture, event )
											local BBGumTextureFrame9 = function ( BBGumTexture, event )
												local BBGumTextureFrame10 = function ( BBGumTexture, event )
													if not event.interrupted then
														BBGumTexture:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
													end
													BBGumTexture:setAlpha( 1 )
													BBGumTexture:setScale( 0 )
													if event.interrupted then
														self.clipFinished( BBGumTexture, event )
													else
														BBGumTexture:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													BBGumTextureFrame10( BBGumTexture, event )
													return 
												else
													BBGumTexture:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
													BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame10 )
												end
											end
											
											if event.interrupted then
												BBGumTextureFrame9( BBGumTexture, event )
												return 
											else
												BBGumTexture:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
												BBGumTexture:setScale( 1 )
												BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame9 )
											end
										end
										
										if event.interrupted then
											BBGumTextureFrame8( BBGumTexture, event )
											return 
										else
											BBGumTexture:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
											BBGumTexture:setScale( 0.8 )
											BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame8 )
										end
									end
									
									if event.interrupted then
										BBGumTextureFrame7( BBGumTexture, event )
										return 
									else
										BBGumTexture:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
										BBGumTexture:setScale( 1.2 )
										BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame7 )
									end
								end
								
								if event.interrupted then
									BBGumTextureFrame6( BBGumTexture, event )
									return 
								else
									BBGumTexture:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
									BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame6 )
								end
							end
							
							if event.interrupted then
								BBGumTextureFrame5( BBGumTexture, event )
								return 
							else
								BBGumTexture:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
								BBGumTexture:setScale( 1 )
								BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame5 )
							end
						end
						
						if event.interrupted then
							BBGumTextureFrame4( BBGumTexture, event )
							return 
						else
							BBGumTexture:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							BBGumTexture:setScale( 0.8 )
							BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame4 )
						end
					end
					
					if event.interrupted then
						BBGumTextureFrame3( BBGumTexture, event )
						return 
					else
						BBGumTexture:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						BBGumTexture:setScale( 1.2 )
						BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame3 )
					end
				end
				
				BBGumTexture:completeAnimation()
				self.BBGumTexture:setAlpha( 1 )
				self.BBGumTexture:setScale( 0 )
				BBGumTextureFrame2( BBGumTexture, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 1 )
				local BBGumTextureFrame2 = function ( BBGumTexture, event )
					local BBGumTextureFrame3 = function ( BBGumTexture, event )
						local BBGumTextureFrame4 = function ( BBGumTexture, event )
							local BBGumTextureFrame5 = function ( BBGumTexture, event )
								local BBGumTextureFrame6 = function ( BBGumTexture, event )
									local BBGumTextureFrame7 = function ( BBGumTexture, event )
										local BBGumTextureFrame8 = function ( BBGumTexture, event )
											local BBGumTextureFrame9 = function ( BBGumTexture, event )
												local BBGumTextureFrame10 = function ( BBGumTexture, event )
													if not event.interrupted then
														BBGumTexture:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
													end
													BBGumTexture:setAlpha( 1 )
													BBGumTexture:setScale( 1 )
													if event.interrupted then
														self.clipFinished( BBGumTexture, event )
													else
														BBGumTexture:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													BBGumTextureFrame10( BBGumTexture, event )
													return 
												else
													BBGumTexture:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
													BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame10 )
												end
											end
											
											if event.interrupted then
												BBGumTextureFrame9( BBGumTexture, event )
												return 
											else
												BBGumTexture:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
												BBGumTexture:setScale( 1 )
												BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame9 )
											end
										end
										
										if event.interrupted then
											BBGumTextureFrame8( BBGumTexture, event )
											return 
										else
											BBGumTexture:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
											BBGumTexture:setScale( 0.8 )
											BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame8 )
										end
									end
									
									if event.interrupted then
										BBGumTextureFrame7( BBGumTexture, event )
										return 
									else
										BBGumTexture:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
										BBGumTexture:setScale( 1.2 )
										BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame7 )
									end
								end
								
								if event.interrupted then
									BBGumTextureFrame6( BBGumTexture, event )
									return 
								else
									BBGumTexture:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
									BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame6 )
								end
							end
							
							if event.interrupted then
								BBGumTextureFrame5( BBGumTexture, event )
								return 
							else
								BBGumTexture:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
								BBGumTexture:setScale( 1 )
								BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame5 )
							end
						end
						
						if event.interrupted then
							BBGumTextureFrame4( BBGumTexture, event )
							return 
						else
							BBGumTexture:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							BBGumTexture:setScale( 0.8 )
							BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame4 )
						end
					end
					
					if event.interrupted then
						BBGumTextureFrame3( BBGumTexture, event )
						return 
					else
						BBGumTexture:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						BBGumTexture:setScale( 1.2 )
						BBGumTexture:registerEventHandler( "transition_complete_keyframe", BBGumTextureFrame3 )
					end
				end
				
				BBGumTexture:completeAnimation()
				self.BBGumTexture:setAlpha( 1 )
				self.BBGumTexture:setScale( 0 )
				BBGumTextureFrame2( BBGumTexture, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ActiveLow",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "bgb_timer", 0 ) and IsModelValueLessThan( controller, "bgb_timer", 0.25 )
			end
		},
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "bgb_timer", 0 )
			end
		},
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "bgb_display", 1 )
			end
		},
		{
			stateName = "InstantActivate",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_timer" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb_timer"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_display" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb_display"
		} )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "deadSpectator.playerIndex", function ( model )
		local f77_local0 = self
		if IsModelValueEqualTo( controller, "deadSpectator.playerIndex", -1 ) then
			SetElementStateWithNoTransitionClip( self, f77_local0, controller, "DefaultState" )
			PlayClip( self, "DefaultClip", controller )
		end
	end )
	self:subscribeToGlobalModel( controller, "PerController", "bgb_one_shot_use", function ( model )
		local f78_local0 = self
		if IsModelValueGreaterThan( controller, "bgb_timer", 0 ) then
			SetElementState( self, f78_local0, controller, "InstantActivate" )
			SetElementState( self, f78_local0, controller, "Active" )
		elseif IsModelValueEqualTo( controller, "bgb_display", 1 ) then
			SetElementState( self, f78_local0, controller, "InstantActivate" )
			SetElementState( self, f78_local0, controller, "DefaultState" )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BBGumRing000:close()
		element.BBGumRing00:close()
		element.BBGumRing0:close()
		element.BBGumRing:close()
		element.BBGumRingEdge:close()
		element.BBGumTexture:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

