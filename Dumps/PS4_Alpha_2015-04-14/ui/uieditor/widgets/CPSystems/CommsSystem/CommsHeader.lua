require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_PanelNoBlur" )
require( "ui.uieditor.widgets.HUD.CP_CommsWidget.CommsWidget_IconMessage" )
require( "ui.uieditor.widgets.HUD.core_MapWidget.MapWidget_BarTop" )

CoD.CommsHeader = InheritFrom( LUI.UIElement )
CoD.CommsHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CommsHeader )
	self.id = "CommsHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 325 )
	self:setTopBottom( true, false, 0, 22 )
	
	local panel = CoD.DamageWidget_PanelNoBlur.new( menu, controller )
	panel:setLeftRight( true, true, 0, -119 )
	panel:setTopBottom( true, true, 0, 2 )
	panel:setRGB( 0, 0, 0 )
	panel:setAlpha( 0.2 )
	self:addElement( panel )
	self.panel = panel
	
	local icon = CoD.CommsWidget_IconMessage.new( menu, controller )
	icon:setLeftRight( true, false, 0, 21.33 )
	icon:setTopBottom( true, false, 0, 21.33 )
	icon:setRGB( 1, 1, 1 )
	icon:setZoom( 5 )
	icon:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	icon:setShaderVector( 0, 0.2, 1, 0, 0 )
	icon:setShaderVector( 1, 0, 0, 0, 0 )
	icon:setShaderVector( 2, 0, 0, 0, 0 )
	icon:setShaderVector( 3, 0, 0, 0, 0 )
	icon:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( icon )
	self.icon = icon
	
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 24.33, 390.33 )
	title:setTopBottom( true, false, 3.66, 19.67 )
	title:setRGB( 1, 1, 1 )
	title:setAlpha( 0.38 )
	title:setZoom( 5 )
	title:setText( Engine.Localize( "ACTIVE COMMUNICATION" ) )
	title:setTTF( "fonts/Entovo.ttf" )
	title:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	title:setShaderVector( 0, 0.1, 1, 0, 0 )
	title:setShaderVector( 1, 0, 0, 0, 0 )
	title:setShaderVector( 2, 0, 0, 0, 0 )
	title:setShaderVector( 3, 0, 0, 0, 0 )
	title:setShaderVector( 4, 0, 0, 0, 0 )
	title:setLetterSpacing( 0.4 )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title )
	self.title = title
	
	local BarBase = CoD.MapWidget_BarTop.new( menu, controller )
	BarBase:setLeftRight( true, false, 0, 205 )
	BarBase:setTopBottom( true, false, 26, 29.5 )
	BarBase:setRGB( 1, 1, 1 )
	BarBase:setAlpha( 0.2 )
	BarBase:setZoom( 15 )
	BarBase:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BarBase:setShaderVector( 0, 0.15, 1, 0, 0 )
	BarBase:setShaderVector( 1, 1, 0, 0, 0 )
	BarBase:setShaderVector( 2, 0, 0, 0, 0 )
	BarBase:setShaderVector( 3, 0, 0, 0, 0 )
	BarBase:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( BarBase )
	self.BarBase = BarBase
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				panel:completeAnimation()
				self.panel:setAlpha( 0 )
				self.clipFinished( panel, {} )
				icon:completeAnimation()
				self.icon:setLeftRight( true, false, 0, 21.33 )
				self.icon:setTopBottom( true, false, 0, 21.33 )
				self.icon:setAlpha( 0 )
				self.icon:setZRot( 0 )
				self.icon:setZoom( 5 )
				self.clipFinished( icon, {} )
				title:completeAnimation()
				self.title:setLeftRight( true, false, 24.33, 390.33 )
				self.title:setTopBottom( true, false, 3.66, 19.67 )
				self.title:setAlpha( 0 )
				self.title:setZoom( 5 )
				self.clipFinished( title, {} )
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0 )
				self.clipFinished( BarBase, {} )
			end,
			Add = function ()
				self:setupElementClipCounter( 4 )
				local panelFrame2 = function ( panel, event )
					local panelFrame3 = function ( panel, event )
						local panelFrame4 = function ( panel, event )
							local panelFrame5 = function ( panel, event )
								if not event.interrupted then
									panel:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								end
								panel:setRGB( 0.09, 0.09, 0.13 )
								panel:setAlpha( 0.2 )
								if event.interrupted then
									self.clipFinished( panel, event )
								else
									panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								panelFrame5( panel, event )
								return 
							else
								panel:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								panel:registerEventHandler( "transition_complete_keyframe", panelFrame5 )
							end
						end
						
						if event.interrupted then
							panelFrame4( panel, event )
							return 
						else
							panel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							panel:setAlpha( 0 )
							panel:registerEventHandler( "transition_complete_keyframe", panelFrame4 )
						end
					end
					
					if event.interrupted then
						panelFrame3( panel, event )
						return 
					else
						panel:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						panel:setAlpha( 0.49 )
						panel:registerEventHandler( "transition_complete_keyframe", panelFrame3 )
					end
				end
				
				panel:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
				panel:setRGB( 0.09, 0.09, 0.13 )
				panel:setAlpha( 0 )
				panel:registerEventHandler( "transition_complete_keyframe", panelFrame2 )
				local iconFrame2 = function ( icon, event )
					local iconFrame3 = function ( icon, event )
						local iconFrame4 = function ( icon, event )
							local iconFrame5 = function ( icon, event )
								local iconFrame6 = function ( icon, event )
									local iconFrame7 = function ( icon, event )
										local iconFrame8 = function ( icon, event )
											local iconFrame9 = function ( icon, event )
												if not event.interrupted then
													icon:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
												end
												icon:setAlpha( 1 )
												icon:setZRot( 0 )
												icon:setZoom( 5 )
												if event.interrupted then
													self.clipFinished( icon, event )
												else
													icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												iconFrame9( icon, event )
												return 
											else
												icon:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												icon:setAlpha( 0.15 )
												icon:registerEventHandler( "transition_complete_keyframe", iconFrame9 )
											end
										end
										
										if event.interrupted then
											iconFrame8( icon, event )
											return 
										else
											icon:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											icon:setAlpha( 1 )
											icon:registerEventHandler( "transition_complete_keyframe", iconFrame8 )
										end
									end
									
									if event.interrupted then
										iconFrame7( icon, event )
										return 
									else
										icon:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										icon:registerEventHandler( "transition_complete_keyframe", iconFrame7 )
									end
								end
								
								if event.interrupted then
									iconFrame6( icon, event )
									return 
								else
									icon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									icon:setAlpha( 0 )
									icon:setZRot( 0 )
									icon:registerEventHandler( "transition_complete_keyframe", iconFrame6 )
								end
							end
							
							if event.interrupted then
								iconFrame5( icon, event )
								return 
							else
								icon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								icon:registerEventHandler( "transition_complete_keyframe", iconFrame5 )
							end
						end
						
						if event.interrupted then
							iconFrame4( icon, event )
							return 
						else
							icon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							icon:setZoom( 5 )
							icon:registerEventHandler( "transition_complete_keyframe", iconFrame4 )
						end
					end
					
					if event.interrupted then
						iconFrame3( icon, event )
						return 
					else
						icon:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						icon:setAlpha( 1 )
						icon:setZoom( 7.73 )
						icon:registerEventHandler( "transition_complete_keyframe", iconFrame3 )
					end
				end
				
				icon:completeAnimation()
				self.icon:setAlpha( 0 )
				self.icon:setZRot( -180 )
				self.icon:setZoom( 20 )
				iconFrame2( icon, {} )
				local titleFrame2 = function ( title, event )
					local titleFrame3 = function ( title, event )
						local titleFrame4 = function ( title, event )
							local titleFrame5 = function ( title, event )
								local titleFrame6 = function ( title, event )
									local titleFrame7 = function ( title, event )
										local titleFrame8 = function ( title, event )
											local titleFrame9 = function ( title, event )
												if not event.interrupted then
													title:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
												end
												title:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( title, event )
												else
													title:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												titleFrame9( title, event )
												return 
											else
												title:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												title:setAlpha( 0 )
												title:registerEventHandler( "transition_complete_keyframe", titleFrame9 )
											end
										end
										
										if event.interrupted then
											titleFrame8( title, event )
											return 
										else
											title:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											title:setAlpha( 0.86 )
											title:registerEventHandler( "transition_complete_keyframe", titleFrame8 )
										end
									end
									
									if event.interrupted then
										titleFrame7( title, event )
										return 
									else
										title:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										title:registerEventHandler( "transition_complete_keyframe", titleFrame7 )
									end
								end
								
								if event.interrupted then
									titleFrame6( title, event )
									return 
								else
									title:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									title:setAlpha( 0 )
									title:registerEventHandler( "transition_complete_keyframe", titleFrame6 )
								end
							end
							
							if event.interrupted then
								titleFrame5( title, event )
								return 
							else
								title:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								title:registerEventHandler( "transition_complete_keyframe", titleFrame5 )
							end
						end
						
						if event.interrupted then
							titleFrame4( title, event )
							return 
						else
							title:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							title:setAlpha( 1 )
							title:registerEventHandler( "transition_complete_keyframe", titleFrame4 )
						end
					end
					
					if event.interrupted then
						titleFrame3( title, event )
						return 
					else
						title:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						title:registerEventHandler( "transition_complete_keyframe", titleFrame3 )
					end
				end
				
				title:completeAnimation()
				self.title:setAlpha( 0 )
				titleFrame2( title, {} )
				local BarBaseFrame2 = function ( BarBase, event )
					if not event.interrupted then
						BarBase:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
					end
					BarBase:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( BarBase, event )
					else
						BarBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BarBase:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
				BarBase:setAlpha( 0 )
				BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame2 )
			end,
			Off = function ()
				self:setupElementClipCounter( 4 )
				local panelFrame2 = function ( panel, event )
					local panelFrame3 = function ( panel, event )
						local panelFrame4 = function ( panel, event )
							local panelFrame5 = function ( panel, event )
								local panelFrame6 = function ( panel, event )
									if not event.interrupted then
										panel:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
									end
									panel:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( panel, event )
									else
										panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									panelFrame6( panel, event )
									return 
								else
									panel:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									panel:registerEventHandler( "transition_complete_keyframe", panelFrame6 )
								end
							end
							
							if event.interrupted then
								panelFrame5( panel, event )
								return 
							else
								panel:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								panel:setAlpha( 0.68 )
								panel:registerEventHandler( "transition_complete_keyframe", panelFrame5 )
							end
						end
						
						if event.interrupted then
							panelFrame4( panel, event )
							return 
						else
							panel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							panel:registerEventHandler( "transition_complete_keyframe", panelFrame4 )
						end
					end
					
					if event.interrupted then
						panelFrame3( panel, event )
						return 
					else
						panel:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						panel:setAlpha( 0 )
						panel:registerEventHandler( "transition_complete_keyframe", panelFrame3 )
					end
				end
				
				panel:completeAnimation()
				self.panel:setAlpha( 0.2 )
				panelFrame2( panel, {} )
				local iconFrame2 = function ( icon, event )
					if not event.interrupted then
						icon:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
					end
					icon:setLeftRight( true, false, 266, 287.33 )
					icon:setTopBottom( true, false, 0, 21.33 )
					icon:setAlpha( 0 )
					icon:setZRot( 0 )
					icon:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( icon, event )
					else
						icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				icon:completeAnimation()
				self.icon:setLeftRight( true, false, 0, 21.33 )
				self.icon:setTopBottom( true, false, 0, 21.33 )
				self.icon:setAlpha( 1 )
				self.icon:setZRot( 0 )
				self.icon:setZoom( 5 )
				iconFrame2( icon, {} )
				local titleFrame2 = function ( title, event )
					local titleFrame3 = function ( title, event )
						local titleFrame4 = function ( title, event )
							local titleFrame5 = function ( title, event )
								local titleFrame6 = function ( title, event )
									local titleFrame7 = function ( title, event )
										local titleFrame8 = function ( title, event )
											local titleFrame9 = function ( title, event )
												local titleFrame10 = function ( title, event )
													if not event.interrupted then
														title:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
													end
													title:setAlpha( 0 )
													title:setZoom( 5 )
													if event.interrupted then
														self.clipFinished( title, event )
													else
														title:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													titleFrame10( title, event )
													return 
												else
													title:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													title:setAlpha( 0.54 )
													title:registerEventHandler( "transition_complete_keyframe", titleFrame10 )
												end
											end
											
											if event.interrupted then
												titleFrame9( title, event )
												return 
											else
												title:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												title:registerEventHandler( "transition_complete_keyframe", titleFrame9 )
											end
										end
										
										if event.interrupted then
											titleFrame8( title, event )
											return 
										else
											title:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											title:setAlpha( 0 )
											title:registerEventHandler( "transition_complete_keyframe", titleFrame8 )
										end
									end
									
									if event.interrupted then
										titleFrame7( title, event )
										return 
									else
										title:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										title:setAlpha( 0.72 )
										title:registerEventHandler( "transition_complete_keyframe", titleFrame7 )
									end
								end
								
								if event.interrupted then
									titleFrame6( title, event )
									return 
								else
									title:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									title:setAlpha( 0.9 )
									title:registerEventHandler( "transition_complete_keyframe", titleFrame6 )
								end
							end
							
							if event.interrupted then
								titleFrame5( title, event )
								return 
							else
								title:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								title:registerEventHandler( "transition_complete_keyframe", titleFrame5 )
							end
						end
						
						if event.interrupted then
							titleFrame4( title, event )
							return 
						else
							title:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							title:setAlpha( 0 )
							title:registerEventHandler( "transition_complete_keyframe", titleFrame4 )
						end
					end
					
					if event.interrupted then
						titleFrame3( title, event )
						return 
					else
						title:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						title:setAlpha( 0.7 )
						title:registerEventHandler( "transition_complete_keyframe", titleFrame3 )
					end
				end
				
				title:completeAnimation()
				self.title:setAlpha( 1 )
				self.title:setZoom( 5 )
				titleFrame2( title, {} )
				local BarBaseFrame2 = function ( BarBase, event )
					if not event.interrupted then
						BarBase:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					BarBase:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BarBase, event )
					else
						BarBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BarBase:completeAnimation()
				self.BarBase:setAlpha( 0.2 )
				BarBaseFrame2( BarBase, {} )
			end
		}
	}
	self.close = function ( self )
		self.panel:close()
		self.icon:close()
		self.BarBase:close()
		CoD.CommsHeader.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

