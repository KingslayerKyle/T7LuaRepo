-- 546f379d47790a6950e2f8ae15dc6b39
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.IncomingExplosive.IncomingExplosive_Grenade" )
require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewPlus" )
require( "ui.uieditor.widgets.CPSystems.IncomingExplosive.IncomingExplosive_DistanceText" )

CoD.IncomingExplosive_Distance = InheritFrom( LUI.UIElement )
CoD.IncomingExplosive_Distance.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IncomingExplosive_Distance )
	self.id = "IncomingExplosive_Distance"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 176 )
	self:setTopBottom( true, false, 0, 63 )
	self.anyChildUsesUpdateState = true
	
	local icon = CoD.IncomingExplosive_Grenade.new( menu, controller )
	icon:setLeftRight( true, false, 49, 85 )
	icon:setTopBottom( true, false, 0, 48 )
	icon:setAlpha( RandomAddPercent( -30, 0.99 ) )
	self:addElement( icon )
	self.icon = icon
	
	local weakpointNewPlus0 = CoD.weakpoint_NewPlus.new( menu, controller )
	weakpointNewPlus0:setLeftRight( false, false, -53, -37 )
	weakpointNewPlus0:setTopBottom( false, false, -39.5, -23.5 )
	weakpointNewPlus0:setRGB( 1, 0.59, 0.59 )
	self:addElement( weakpointNewPlus0 )
	self.weakpointNewPlus0 = weakpointNewPlus0
	
	local weakpointNewPlus1 = CoD.weakpoint_NewPlus.new( menu, controller )
	weakpointNewPlus1:setLeftRight( false, false, -53, -37 )
	weakpointNewPlus1:setTopBottom( false, false, 8.5, 24.5 )
	weakpointNewPlus1:setRGB( 1, 0.59, 0.59 )
	self:addElement( weakpointNewPlus1 )
	self.weakpointNewPlus1 = weakpointNewPlus1
	
	local weakpointNewPlus00 = CoD.weakpoint_NewPlus.new( menu, controller )
	weakpointNewPlus00:setLeftRight( false, false, 31, 47 )
	weakpointNewPlus00:setTopBottom( false, false, -39.5, -23.5 )
	weakpointNewPlus00:setRGB( 1, 0.59, 0.59 )
	self:addElement( weakpointNewPlus00 )
	self.weakpointNewPlus00 = weakpointNewPlus00
	
	local weakpointNewPlus10 = CoD.weakpoint_NewPlus.new( menu, controller )
	weakpointNewPlus10:setLeftRight( false, false, 31, 47 )
	weakpointNewPlus10:setTopBottom( false, false, 8.5, 24.5 )
	weakpointNewPlus10:setRGB( 1, 0.59, 0.59 )
	self:addElement( weakpointNewPlus10 )
	self.weakpointNewPlus10 = weakpointNewPlus10
	
	local IncomingExplosiveDistanceText0 = CoD.IncomingExplosive_DistanceText.new( menu, controller )
	IncomingExplosiveDistanceText0:setLeftRight( true, false, 35, 168 )
	IncomingExplosiveDistanceText0:setTopBottom( true, false, -7, 48 )
	IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( -30, 0.99 ) )
	IncomingExplosiveDistanceText0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	IncomingExplosiveDistanceText0:setShaderVector( 0, 0.1, 0, 0, 0 )
	IncomingExplosiveDistanceText0:setShaderVector( 1, 0, 0, 0, 0 )
	IncomingExplosiveDistanceText0:setShaderVector( 2, 0, 0, 0, 0 )
	IncomingExplosiveDistanceText0:setShaderVector( 3, 0, 0, 0, 0 )
	IncomingExplosiveDistanceText0:setShaderVector( 4, 0, 0, 0, 0 )
	IncomingExplosiveDistanceText0.textDistance:setText( Engine.Localize( "32" ) )
	IncomingExplosiveDistanceText0:linkToElementModel( self, nil, false, function ( model )
		IncomingExplosiveDistanceText0:setModel( model, controller )
	end )
	IncomingExplosiveDistanceText0:mergeStateConditions( {
		{
			stateName = "Grenade",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "timeLeftPerc", 0 )
			end
		}
	} )
	IncomingExplosiveDistanceText0:linkToElementModel( IncomingExplosiveDistanceText0, "timeLeftPerc", true, function ( model )
		menu:updateElementState( IncomingExplosiveDistanceText0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "timeLeftPerc"
		} )
	end )
	self:addElement( IncomingExplosiveDistanceText0 )
	self.IncomingExplosiveDistanceText0 = IncomingExplosiveDistanceText0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				icon:completeAnimation()
				self.icon:setAlpha( RandomAddPercent( -30, 0 ) )
				self.clipFinished( icon, {} )

				weakpointNewPlus0:completeAnimation()
				self.weakpointNewPlus0:setAlpha( 0 )
				self.clipFinished( weakpointNewPlus0, {} )

				weakpointNewPlus1:completeAnimation()
				self.weakpointNewPlus1:setAlpha( 0 )
				self.clipFinished( weakpointNewPlus1, {} )

				weakpointNewPlus00:completeAnimation()
				self.weakpointNewPlus00:setAlpha( 0 )
				self.clipFinished( weakpointNewPlus00, {} )

				weakpointNewPlus10:completeAnimation()
				self.weakpointNewPlus10:setAlpha( 0 )
				self.clipFinished( weakpointNewPlus10, {} )

				IncomingExplosiveDistanceText0:completeAnimation()
				self.IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( -30, 0 ) )
				self.clipFinished( IncomingExplosiveDistanceText0, {} )
			end
		},
		Grenade = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				local iconFrame2 = function ( icon, event )
					if not event.interrupted then
						icon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					icon:setAlpha( RandomAddPercent( -30, 0.99 ) )
					if event.interrupted then
						self.clipFinished( icon, event )
					else
						icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				icon:completeAnimation()
				self.icon:setAlpha( RandomAddPercent( -30, 1 ) )
				iconFrame2( icon, {} )

				weakpointNewPlus0:completeAnimation()
				self.weakpointNewPlus0:setAlpha( 1 )
				self.clipFinished( weakpointNewPlus0, {} )

				weakpointNewPlus1:completeAnimation()
				self.weakpointNewPlus1:setAlpha( 1 )
				self.clipFinished( weakpointNewPlus1, {} )

				weakpointNewPlus00:completeAnimation()
				self.weakpointNewPlus00:setAlpha( 1 )
				self.clipFinished( weakpointNewPlus00, {} )

				weakpointNewPlus10:completeAnimation()
				self.weakpointNewPlus10:setAlpha( 1 )
				self.clipFinished( weakpointNewPlus10, {} )
				local IncomingExplosiveDistanceText0Frame2 = function ( IncomingExplosiveDistanceText0, event )
					if not event.interrupted then
						IncomingExplosiveDistanceText0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( -30, 0.99 ) )
					if event.interrupted then
						self.clipFinished( IncomingExplosiveDistanceText0, event )
					else
						IncomingExplosiveDistanceText0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IncomingExplosiveDistanceText0:completeAnimation()
				self.IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( -30, 1 ) )
				IncomingExplosiveDistanceText0Frame2( IncomingExplosiveDistanceText0, {} )

				self.nextClip = "DefaultClip"
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 6 )

				local f9_local0 = function ( f10_arg0, f10_arg1 )
					local f10_local0 = function ( f11_arg0, f11_arg1 )
						local f11_local0 = function ( f12_arg0, f12_arg1 )
							local f12_local0 = function ( f13_arg0, f13_arg1 )
								local f13_local0 = function ( f14_arg0, f14_arg1 )
									local f14_local0 = function ( f15_arg0, f15_arg1 )
										local f15_local0 = function ( f16_arg0, f16_arg1 )
											if not f16_arg1.interrupted then
												f16_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Bounce )
											end
											f16_arg0:setAlpha( RandomAddPercent( -30, 0 ) )
											if f16_arg1.interrupted then
												self.clipFinished( f16_arg0, f16_arg1 )
											else
												f16_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f15_arg1.interrupted then
											f15_local0( f15_arg0, f15_arg1 )
											return 
										else
											f15_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
											f15_arg0:setAlpha( RandomAddPercent( -30, 0.5 ) )
											f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
										end
									end
									
									if f14_arg1.interrupted then
										f14_local0( f14_arg0, f14_arg1 )
										return 
									else
										f14_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Bounce )
										f14_arg0:setAlpha( RandomAddPercent( -30, 0 ) )
										f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
									end
								end
								
								if f13_arg1.interrupted then
									f13_local0( f13_arg0, f13_arg1 )
									return 
								else
									f13_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Bounce )
									f13_arg0:setAlpha( RandomAddPercent( -30, 0.5 ) )
									f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
								end
							end
							
							if f12_arg1.interrupted then
								f12_local0( f12_arg0, f12_arg1 )
								return 
							else
								f12_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
								f12_arg0:setAlpha( RandomAddPercent( -30, 0 ) )
								f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
							end
						end
						
						if f11_arg1.interrupted then
							f11_local0( f11_arg0, f11_arg1 )
							return 
						else
							f11_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							f11_arg0:setAlpha( RandomAddPercent( -30, 1 ) )
							f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
						end
					end
					
					if f10_arg1.interrupted then
						f10_local0( f10_arg0, f10_arg1 )
						return 
					else
						f10_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
						f10_arg0:setAlpha( RandomAddPercent( -30, 0 ) )
						f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
					end
				end
				
				icon:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				icon:setAlpha( RandomAddPercent( -30, 1 ) )
				icon:registerEventHandler( "transition_complete_keyframe", f9_local0 )
				local f9_local1 = function ( f17_arg0, f17_arg1 )
					local f17_local0 = function ( f18_arg0, f18_arg1 )
						local f18_local0 = function ( f19_arg0, f19_arg1 )
							local f19_local0 = function ( f20_arg0, f20_arg1 )
								local f20_local0 = function ( f21_arg0, f21_arg1 )
									local f21_local0 = function ( f22_arg0, f22_arg1 )
										local f22_local0 = function ( f23_arg0, f23_arg1 )
											if not f23_arg1.interrupted then
												f23_arg0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Bounce )
											end
											f23_arg0:setAlpha( 0 )
											if f23_arg1.interrupted then
												self.clipFinished( f23_arg0, f23_arg1 )
											else
												f23_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f22_arg1.interrupted then
											f22_local0( f22_arg0, f22_arg1 )
											return 
										else
											f22_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
											f22_arg0:setAlpha( 0.5 )
											f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
										end
									end
									
									if f21_arg1.interrupted then
										f21_local0( f21_arg0, f21_arg1 )
										return 
									else
										f21_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
										f21_arg0:setAlpha( 0 )
										f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
									end
								end
								
								if f20_arg1.interrupted then
									f20_local0( f20_arg0, f20_arg1 )
									return 
								else
									f20_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Bounce )
									f20_arg0:setAlpha( 0.5 )
									f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
								end
							end
							
							if f19_arg1.interrupted then
								f19_local0( f19_arg0, f19_arg1 )
								return 
							else
								f19_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
								f19_arg0:setAlpha( 0 )
								f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
							end
						end
						
						if f18_arg1.interrupted then
							f18_local0( f18_arg0, f18_arg1 )
							return 
						else
							f18_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
							f18_arg0:setAlpha( 1 )
							f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
						end
					end
					
					if f17_arg1.interrupted then
						f17_local0( f17_arg0, f17_arg1 )
						return 
					else
						f17_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
						f17_arg0:setAlpha( 0 )
						f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
					end
				end
				
				weakpointNewPlus0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				weakpointNewPlus0:setAlpha( 1 )
				weakpointNewPlus0:registerEventHandler( "transition_complete_keyframe", f9_local1 )
				local f9_local2 = function ( f24_arg0, f24_arg1 )
					local f24_local0 = function ( f25_arg0, f25_arg1 )
						local f25_local0 = function ( f26_arg0, f26_arg1 )
							local f26_local0 = function ( f27_arg0, f27_arg1 )
								local f27_local0 = function ( f28_arg0, f28_arg1 )
									local f28_local0 = function ( f29_arg0, f29_arg1 )
										local f29_local0 = function ( f30_arg0, f30_arg1 )
											if not f30_arg1.interrupted then
												f30_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Bounce )
											end
											f30_arg0:setAlpha( 0 )
											if f30_arg1.interrupted then
												self.clipFinished( f30_arg0, f30_arg1 )
											else
												f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f29_arg1.interrupted then
											f29_local0( f29_arg0, f29_arg1 )
											return 
										else
											f29_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
											f29_arg0:setAlpha( 0.5 )
											f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
										end
									end
									
									if f28_arg1.interrupted then
										f28_local0( f28_arg0, f28_arg1 )
										return 
									else
										f28_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
										f28_arg0:setAlpha( 0 )
										f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
									end
								end
								
								if f27_arg1.interrupted then
									f27_local0( f27_arg0, f27_arg1 )
									return 
								else
									f27_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Bounce )
									f27_arg0:setAlpha( 0.5 )
									f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
								end
							end
							
							if f26_arg1.interrupted then
								f26_local0( f26_arg0, f26_arg1 )
								return 
							else
								f26_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
								f26_arg0:setAlpha( 0 )
								f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
							end
						end
						
						if f25_arg1.interrupted then
							f25_local0( f25_arg0, f25_arg1 )
							return 
						else
							f25_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							f25_arg0:setAlpha( 1 )
							f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
						end
					end
					
					if f24_arg1.interrupted then
						f24_local0( f24_arg0, f24_arg1 )
						return 
					else
						f24_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
						f24_arg0:setAlpha( 0 )
						f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
					end
				end
				
				weakpointNewPlus1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				weakpointNewPlus1:setAlpha( 1 )
				weakpointNewPlus1:registerEventHandler( "transition_complete_keyframe", f9_local2 )
				local weakpointNewPlus00Frame2 = function ( weakpointNewPlus00, event )
					local weakpointNewPlus00Frame3 = function ( weakpointNewPlus00, event )
						local weakpointNewPlus00Frame4 = function ( weakpointNewPlus00, event )
							local weakpointNewPlus00Frame5 = function ( weakpointNewPlus00, event )
								local weakpointNewPlus00Frame6 = function ( weakpointNewPlus00, event )
									local weakpointNewPlus00Frame7 = function ( weakpointNewPlus00, event )
										local weakpointNewPlus00Frame8 = function ( weakpointNewPlus00, event )
											if not event.interrupted then
												weakpointNewPlus00:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Bounce )
											end
											weakpointNewPlus00:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( weakpointNewPlus00, event )
											else
												weakpointNewPlus00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											weakpointNewPlus00Frame8( weakpointNewPlus00, event )
											return 
										else
											weakpointNewPlus00:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
											weakpointNewPlus00:setAlpha( 0.5 )
											weakpointNewPlus00:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus00Frame8 )
										end
									end
									
									if event.interrupted then
										weakpointNewPlus00Frame7( weakpointNewPlus00, event )
										return 
									else
										weakpointNewPlus00:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
										weakpointNewPlus00:setAlpha( 0 )
										weakpointNewPlus00:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus00Frame7 )
									end
								end
								
								if event.interrupted then
									weakpointNewPlus00Frame6( weakpointNewPlus00, event )
									return 
								else
									weakpointNewPlus00:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Bounce )
									weakpointNewPlus00:setAlpha( 0.5 )
									weakpointNewPlus00:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus00Frame6 )
								end
							end
							
							if event.interrupted then
								weakpointNewPlus00Frame5( weakpointNewPlus00, event )
								return 
							else
								weakpointNewPlus00:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
								weakpointNewPlus00:setAlpha( 0 )
								weakpointNewPlus00:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus00Frame5 )
							end
						end
						
						if event.interrupted then
							weakpointNewPlus00Frame4( weakpointNewPlus00, event )
							return 
						else
							weakpointNewPlus00:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
							weakpointNewPlus00:setAlpha( 1 )
							weakpointNewPlus00:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus00Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewPlus00Frame3( weakpointNewPlus00, event )
						return 
					else
						weakpointNewPlus00:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
						weakpointNewPlus00:setAlpha( 0 )
						weakpointNewPlus00:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus00Frame3 )
					end
				end
				
				weakpointNewPlus00:completeAnimation()
				self.weakpointNewPlus00:setAlpha( 1 )
				weakpointNewPlus00Frame2( weakpointNewPlus00, {} )
				local f9_local4 = function ( f38_arg0, f38_arg1 )
					local f38_local0 = function ( f39_arg0, f39_arg1 )
						local f39_local0 = function ( f40_arg0, f40_arg1 )
							local f40_local0 = function ( f41_arg0, f41_arg1 )
								local f41_local0 = function ( f42_arg0, f42_arg1 )
									local f42_local0 = function ( f43_arg0, f43_arg1 )
										local f43_local0 = function ( f44_arg0, f44_arg1 )
											if not f44_arg1.interrupted then
												f44_arg0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Bounce )
											end
											f44_arg0:setAlpha( 0 )
											if f44_arg1.interrupted then
												self.clipFinished( f44_arg0, f44_arg1 )
											else
												f44_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f43_arg1.interrupted then
											f43_local0( f43_arg0, f43_arg1 )
											return 
										else
											f43_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
											f43_arg0:setAlpha( 0.5 )
											f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
										end
									end
									
									if f42_arg1.interrupted then
										f42_local0( f42_arg0, f42_arg1 )
										return 
									else
										f42_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Bounce )
										f42_arg0:setAlpha( 0 )
										f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 )
									end
								end
								
								if f41_arg1.interrupted then
									f41_local0( f41_arg0, f41_arg1 )
									return 
								else
									f41_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Bounce )
									f41_arg0:setAlpha( 0.5 )
									f41_arg0:registerEventHandler( "transition_complete_keyframe", f41_local0 )
								end
							end
							
							if f40_arg1.interrupted then
								f40_local0( f40_arg0, f40_arg1 )
								return 
							else
								f40_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
								f40_arg0:setAlpha( 0 )
								f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
							end
						end
						
						if f39_arg1.interrupted then
							f39_local0( f39_arg0, f39_arg1 )
							return 
						else
							f39_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							f39_arg0:setAlpha( 1 )
							f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
						end
					end
					
					if f38_arg1.interrupted then
						f38_local0( f38_arg0, f38_arg1 )
						return 
					else
						f38_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
						f38_arg0:setAlpha( 0 )
						f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 )
					end
				end
				
				weakpointNewPlus10:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				weakpointNewPlus10:setAlpha( 1 )
				weakpointNewPlus10:registerEventHandler( "transition_complete_keyframe", f9_local4 )
				local IncomingExplosiveDistanceText0Frame2 = function ( IncomingExplosiveDistanceText0, event )
					local IncomingExplosiveDistanceText0Frame3 = function ( IncomingExplosiveDistanceText0, event )
						local IncomingExplosiveDistanceText0Frame4 = function ( IncomingExplosiveDistanceText0, event )
							local IncomingExplosiveDistanceText0Frame5 = function ( IncomingExplosiveDistanceText0, event )
								local IncomingExplosiveDistanceText0Frame6 = function ( IncomingExplosiveDistanceText0, event )
									local IncomingExplosiveDistanceText0Frame7 = function ( IncomingExplosiveDistanceText0, event )
										local IncomingExplosiveDistanceText0Frame8 = function ( IncomingExplosiveDistanceText0, event )
											if not event.interrupted then
												IncomingExplosiveDistanceText0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Bounce )
											end
											IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( -30, 0 ) )
											if event.interrupted then
												self.clipFinished( IncomingExplosiveDistanceText0, event )
											else
												IncomingExplosiveDistanceText0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											IncomingExplosiveDistanceText0Frame8( IncomingExplosiveDistanceText0, event )
											return 
										else
											IncomingExplosiveDistanceText0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
											IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( -30, 0.5 ) )
											IncomingExplosiveDistanceText0:registerEventHandler( "transition_complete_keyframe", IncomingExplosiveDistanceText0Frame8 )
										end
									end
									
									if event.interrupted then
										IncomingExplosiveDistanceText0Frame7( IncomingExplosiveDistanceText0, event )
										return 
									else
										IncomingExplosiveDistanceText0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
										IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( -30, 0 ) )
										IncomingExplosiveDistanceText0:registerEventHandler( "transition_complete_keyframe", IncomingExplosiveDistanceText0Frame7 )
									end
								end
								
								if event.interrupted then
									IncomingExplosiveDistanceText0Frame6( IncomingExplosiveDistanceText0, event )
									return 
								else
									IncomingExplosiveDistanceText0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Bounce )
									IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( -30, 0.5 ) )
									IncomingExplosiveDistanceText0:registerEventHandler( "transition_complete_keyframe", IncomingExplosiveDistanceText0Frame6 )
								end
							end
							
							if event.interrupted then
								IncomingExplosiveDistanceText0Frame5( IncomingExplosiveDistanceText0, event )
								return 
							else
								IncomingExplosiveDistanceText0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
								IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( -30, 0 ) )
								IncomingExplosiveDistanceText0:registerEventHandler( "transition_complete_keyframe", IncomingExplosiveDistanceText0Frame5 )
							end
						end
						
						if event.interrupted then
							IncomingExplosiveDistanceText0Frame4( IncomingExplosiveDistanceText0, event )
							return 
						else
							IncomingExplosiveDistanceText0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
							IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( -30, 1 ) )
							IncomingExplosiveDistanceText0:registerEventHandler( "transition_complete_keyframe", IncomingExplosiveDistanceText0Frame4 )
						end
					end
					
					if event.interrupted then
						IncomingExplosiveDistanceText0Frame3( IncomingExplosiveDistanceText0, event )
						return 
					else
						IncomingExplosiveDistanceText0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
						IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( -30, 0 ) )
						IncomingExplosiveDistanceText0:registerEventHandler( "transition_complete_keyframe", IncomingExplosiveDistanceText0Frame3 )
					end
				end
				
				IncomingExplosiveDistanceText0:completeAnimation()
				self.IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( -30, 1 ) )
				IncomingExplosiveDistanceText0Frame2( IncomingExplosiveDistanceText0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Grenade",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "timeLeftPerc", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "timeLeftPerc", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "timeLeftPerc"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.icon:close()
		element.weakpointNewPlus0:close()
		element.weakpointNewPlus1:close()
		element.weakpointNewPlus00:close()
		element.weakpointNewPlus10:close()
		element.IncomingExplosiveDistanceText0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

