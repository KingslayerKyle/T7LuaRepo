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
	icon:setRGB( 1, 1, 1 )
	icon:setAlpha( RandomAddPercent( 0.99, -30 ) )
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
	IncomingExplosiveDistanceText0:setRGB( 1, 1, 1 )
	IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( 0.99, -30 ) )
	IncomingExplosiveDistanceText0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	IncomingExplosiveDistanceText0:setShaderVector( 0, 0.1, 0, 0, 0 )
	IncomingExplosiveDistanceText0:setShaderVector( 1, 0, 0, 0, 0 )
	IncomingExplosiveDistanceText0:setShaderVector( 2, 0, 0, 0, 0 )
	IncomingExplosiveDistanceText0:setShaderVector( 3, 0, 0, 0, 0 )
	IncomingExplosiveDistanceText0:setShaderVector( 4, 0, 0, 0, 0 )
	IncomingExplosiveDistanceText0.textDistance:setText( Engine.Localize( "32" ) )
	self:addElement( IncomingExplosiveDistanceText0 )
	self.IncomingExplosiveDistanceText0 = IncomingExplosiveDistanceText0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				icon:completeAnimation()
				self.icon:setAlpha( RandomAddPercent( 0, -30 ) )
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
				self.IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( 0, -30 ) )
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
					icon:setAlpha( RandomAddPercent( 0.99, -30 ) )
					if event.interrupted then
						self.clipFinished( icon, event )
					else
						icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				icon:completeAnimation()
				self.icon:setAlpha( RandomAddPercent( 1, -30 ) )
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
					IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( 0.99, -30 ) )
					if event.interrupted then
						self.clipFinished( IncomingExplosiveDistanceText0, event )
					else
						IncomingExplosiveDistanceText0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IncomingExplosiveDistanceText0:completeAnimation()
				self.IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( 1, -30 ) )
				IncomingExplosiveDistanceText0Frame2( IncomingExplosiveDistanceText0, {} )
				self.nextClip = "DefaultClip"
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 6 )
				local iconFrame2 = function ( icon, event )
					local iconFrame3 = function ( icon, event )
						local iconFrame4 = function ( icon, event )
							local iconFrame5 = function ( icon, event )
								local iconFrame6 = function ( icon, event )
									local iconFrame7 = function ( icon, event )
										local iconFrame8 = function ( icon, event )
											if not event.interrupted then
												icon:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Bounce )
											end
											icon:setAlpha( RandomAddPercent( 0, -30 ) )
											if event.interrupted then
												self.clipFinished( icon, event )
											else
												icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											iconFrame8( icon, event )
											return 
										else
											icon:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
											icon:setAlpha( RandomAddPercent( 0.5, -30 ) )
											icon:registerEventHandler( "transition_complete_keyframe", iconFrame8 )
										end
									end
									
									if event.interrupted then
										iconFrame7( icon, event )
										return 
									else
										icon:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Bounce )
										icon:setAlpha( RandomAddPercent( 0, -30 ) )
										icon:registerEventHandler( "transition_complete_keyframe", iconFrame7 )
									end
								end
								
								if event.interrupted then
									iconFrame6( icon, event )
									return 
								else
									icon:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Bounce )
									icon:setAlpha( RandomAddPercent( 0.5, -30 ) )
									icon:registerEventHandler( "transition_complete_keyframe", iconFrame6 )
								end
							end
							
							if event.interrupted then
								iconFrame5( icon, event )
								return 
							else
								icon:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
								icon:setAlpha( RandomAddPercent( 0, -30 ) )
								icon:registerEventHandler( "transition_complete_keyframe", iconFrame5 )
							end
						end
						
						if event.interrupted then
							iconFrame4( icon, event )
							return 
						else
							icon:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							icon:setAlpha( RandomAddPercent( 1, -30 ) )
							icon:registerEventHandler( "transition_complete_keyframe", iconFrame4 )
						end
					end
					
					if event.interrupted then
						iconFrame3( icon, event )
						return 
					else
						icon:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
						icon:setAlpha( RandomAddPercent( 0, -30 ) )
						icon:registerEventHandler( "transition_complete_keyframe", iconFrame3 )
					end
				end
				
				icon:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				icon:setAlpha( RandomAddPercent( 1, -30 ) )
				icon:registerEventHandler( "transition_complete_keyframe", iconFrame2 )
				local weakpointNewPlus0Frame2 = function ( weakpointNewPlus0, event )
					local weakpointNewPlus0Frame3 = function ( weakpointNewPlus0, event )
						local weakpointNewPlus0Frame4 = function ( weakpointNewPlus0, event )
							local weakpointNewPlus0Frame5 = function ( weakpointNewPlus0, event )
								local weakpointNewPlus0Frame6 = function ( weakpointNewPlus0, event )
									local weakpointNewPlus0Frame7 = function ( weakpointNewPlus0, event )
										local weakpointNewPlus0Frame8 = function ( weakpointNewPlus0, event )
											if not event.interrupted then
												weakpointNewPlus0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Bounce )
											end
											weakpointNewPlus0:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( weakpointNewPlus0, event )
											else
												weakpointNewPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											weakpointNewPlus0Frame8( weakpointNewPlus0, event )
											return 
										else
											weakpointNewPlus0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
											weakpointNewPlus0:setAlpha( 0.5 )
											weakpointNewPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus0Frame8 )
										end
									end
									
									if event.interrupted then
										weakpointNewPlus0Frame7( weakpointNewPlus0, event )
										return 
									else
										weakpointNewPlus0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
										weakpointNewPlus0:setAlpha( 0 )
										weakpointNewPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus0Frame7 )
									end
								end
								
								if event.interrupted then
									weakpointNewPlus0Frame6( weakpointNewPlus0, event )
									return 
								else
									weakpointNewPlus0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Bounce )
									weakpointNewPlus0:setAlpha( 0.5 )
									weakpointNewPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus0Frame6 )
								end
							end
							
							if event.interrupted then
								weakpointNewPlus0Frame5( weakpointNewPlus0, event )
								return 
							else
								weakpointNewPlus0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
								weakpointNewPlus0:setAlpha( 0 )
								weakpointNewPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus0Frame5 )
							end
						end
						
						if event.interrupted then
							weakpointNewPlus0Frame4( weakpointNewPlus0, event )
							return 
						else
							weakpointNewPlus0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
							weakpointNewPlus0:setAlpha( 1 )
							weakpointNewPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewPlus0Frame3( weakpointNewPlus0, event )
						return 
					else
						weakpointNewPlus0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
						weakpointNewPlus0:setAlpha( 0 )
						weakpointNewPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus0Frame3 )
					end
				end
				
				weakpointNewPlus0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				weakpointNewPlus0:setAlpha( 1 )
				weakpointNewPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus0Frame2 )
				local weakpointNewPlus1Frame2 = function ( weakpointNewPlus1, event )
					local weakpointNewPlus1Frame3 = function ( weakpointNewPlus1, event )
						local weakpointNewPlus1Frame4 = function ( weakpointNewPlus1, event )
							local weakpointNewPlus1Frame5 = function ( weakpointNewPlus1, event )
								local weakpointNewPlus1Frame6 = function ( weakpointNewPlus1, event )
									local weakpointNewPlus1Frame7 = function ( weakpointNewPlus1, event )
										local weakpointNewPlus1Frame8 = function ( weakpointNewPlus1, event )
											if not event.interrupted then
												weakpointNewPlus1:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Bounce )
											end
											weakpointNewPlus1:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( weakpointNewPlus1, event )
											else
												weakpointNewPlus1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											weakpointNewPlus1Frame8( weakpointNewPlus1, event )
											return 
										else
											weakpointNewPlus1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
											weakpointNewPlus1:setAlpha( 0.5 )
											weakpointNewPlus1:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus1Frame8 )
										end
									end
									
									if event.interrupted then
										weakpointNewPlus1Frame7( weakpointNewPlus1, event )
										return 
									else
										weakpointNewPlus1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
										weakpointNewPlus1:setAlpha( 0 )
										weakpointNewPlus1:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus1Frame7 )
									end
								end
								
								if event.interrupted then
									weakpointNewPlus1Frame6( weakpointNewPlus1, event )
									return 
								else
									weakpointNewPlus1:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Bounce )
									weakpointNewPlus1:setAlpha( 0.5 )
									weakpointNewPlus1:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus1Frame6 )
								end
							end
							
							if event.interrupted then
								weakpointNewPlus1Frame5( weakpointNewPlus1, event )
								return 
							else
								weakpointNewPlus1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
								weakpointNewPlus1:setAlpha( 0 )
								weakpointNewPlus1:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus1Frame5 )
							end
						end
						
						if event.interrupted then
							weakpointNewPlus1Frame4( weakpointNewPlus1, event )
							return 
						else
							weakpointNewPlus1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							weakpointNewPlus1:setAlpha( 1 )
							weakpointNewPlus1:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus1Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewPlus1Frame3( weakpointNewPlus1, event )
						return 
					else
						weakpointNewPlus1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
						weakpointNewPlus1:setAlpha( 0 )
						weakpointNewPlus1:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus1Frame3 )
					end
				end
				
				weakpointNewPlus1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				weakpointNewPlus1:setAlpha( 1 )
				weakpointNewPlus1:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus1Frame2 )
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
				local weakpointNewPlus10Frame2 = function ( weakpointNewPlus10, event )
					local weakpointNewPlus10Frame3 = function ( weakpointNewPlus10, event )
						local weakpointNewPlus10Frame4 = function ( weakpointNewPlus10, event )
							local weakpointNewPlus10Frame5 = function ( weakpointNewPlus10, event )
								local weakpointNewPlus10Frame6 = function ( weakpointNewPlus10, event )
									local weakpointNewPlus10Frame7 = function ( weakpointNewPlus10, event )
										local weakpointNewPlus10Frame8 = function ( weakpointNewPlus10, event )
											if not event.interrupted then
												weakpointNewPlus10:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Bounce )
											end
											weakpointNewPlus10:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( weakpointNewPlus10, event )
											else
												weakpointNewPlus10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											weakpointNewPlus10Frame8( weakpointNewPlus10, event )
											return 
										else
											weakpointNewPlus10:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
											weakpointNewPlus10:setAlpha( 0.5 )
											weakpointNewPlus10:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus10Frame8 )
										end
									end
									
									if event.interrupted then
										weakpointNewPlus10Frame7( weakpointNewPlus10, event )
										return 
									else
										weakpointNewPlus10:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Bounce )
										weakpointNewPlus10:setAlpha( 0 )
										weakpointNewPlus10:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus10Frame7 )
									end
								end
								
								if event.interrupted then
									weakpointNewPlus10Frame6( weakpointNewPlus10, event )
									return 
								else
									weakpointNewPlus10:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Bounce )
									weakpointNewPlus10:setAlpha( 0.5 )
									weakpointNewPlus10:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus10Frame6 )
								end
							end
							
							if event.interrupted then
								weakpointNewPlus10Frame5( weakpointNewPlus10, event )
								return 
							else
								weakpointNewPlus10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
								weakpointNewPlus10:setAlpha( 0 )
								weakpointNewPlus10:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus10Frame5 )
							end
						end
						
						if event.interrupted then
							weakpointNewPlus10Frame4( weakpointNewPlus10, event )
							return 
						else
							weakpointNewPlus10:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							weakpointNewPlus10:setAlpha( 1 )
							weakpointNewPlus10:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus10Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewPlus10Frame3( weakpointNewPlus10, event )
						return 
					else
						weakpointNewPlus10:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
						weakpointNewPlus10:setAlpha( 0 )
						weakpointNewPlus10:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus10Frame3 )
					end
				end
				
				weakpointNewPlus10:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				weakpointNewPlus10:setAlpha( 1 )
				weakpointNewPlus10:registerEventHandler( "transition_complete_keyframe", weakpointNewPlus10Frame2 )
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
											IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( 0, -30 ) )
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
											IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( 0.5, -30 ) )
											IncomingExplosiveDistanceText0:registerEventHandler( "transition_complete_keyframe", IncomingExplosiveDistanceText0Frame8 )
										end
									end
									
									if event.interrupted then
										IncomingExplosiveDistanceText0Frame7( IncomingExplosiveDistanceText0, event )
										return 
									else
										IncomingExplosiveDistanceText0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
										IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( 0, -30 ) )
										IncomingExplosiveDistanceText0:registerEventHandler( "transition_complete_keyframe", IncomingExplosiveDistanceText0Frame7 )
									end
								end
								
								if event.interrupted then
									IncomingExplosiveDistanceText0Frame6( IncomingExplosiveDistanceText0, event )
									return 
								else
									IncomingExplosiveDistanceText0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Bounce )
									IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( 0.5, -30 ) )
									IncomingExplosiveDistanceText0:registerEventHandler( "transition_complete_keyframe", IncomingExplosiveDistanceText0Frame6 )
								end
							end
							
							if event.interrupted then
								IncomingExplosiveDistanceText0Frame5( IncomingExplosiveDistanceText0, event )
								return 
							else
								IncomingExplosiveDistanceText0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
								IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( 0, -30 ) )
								IncomingExplosiveDistanceText0:registerEventHandler( "transition_complete_keyframe", IncomingExplosiveDistanceText0Frame5 )
							end
						end
						
						if event.interrupted then
							IncomingExplosiveDistanceText0Frame4( IncomingExplosiveDistanceText0, event )
							return 
						else
							IncomingExplosiveDistanceText0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
							IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( 1, -30 ) )
							IncomingExplosiveDistanceText0:registerEventHandler( "transition_complete_keyframe", IncomingExplosiveDistanceText0Frame4 )
						end
					end
					
					if event.interrupted then
						IncomingExplosiveDistanceText0Frame3( IncomingExplosiveDistanceText0, event )
						return 
					else
						IncomingExplosiveDistanceText0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
						IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( 0, -30 ) )
						IncomingExplosiveDistanceText0:registerEventHandler( "transition_complete_keyframe", IncomingExplosiveDistanceText0Frame3 )
					end
				end
				
				IncomingExplosiveDistanceText0:completeAnimation()
				self.IncomingExplosiveDistanceText0:setAlpha( RandomAddPercent( 1, -30 ) )
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
	self.close = function ( self )
		self.icon:close()
		self.weakpointNewPlus0:close()
		self.weakpointNewPlus1:close()
		self.weakpointNewPlus00:close()
		self.weakpointNewPlus10:close()
		self.IncomingExplosiveDistanceText0:close()
		CoD.IncomingExplosive_Distance.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

