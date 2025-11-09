require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_PanelNoBlur" )
require( "ui.uieditor.widgets.HUD.CP_CommsWidget.CommsWidget_IconAlert" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Dot" )

CoD.EventMessage = InheritFrom( LUI.UIElement )
CoD.EventMessage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EventMessage )
	self.id = "EventMessage"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 325 )
	self:setTopBottom( true, false, 0, 22 )
	
	local panel = CoD.DamageWidget_PanelNoBlur.new( menu, controller )
	panel:setLeftRight( true, true, 0, 1 )
	panel:setTopBottom( true, true, 0, 2 )
	panel:setRGB( 0, 0, 0 )
	panel:setAlpha( 0.2 )
	self:addElement( panel )
	self.panel = panel
	
	local icon = CoD.CommsWidget_IconAlert.new( menu, controller )
	icon:setLeftRight( true, false, 0, 21.33 )
	icon:setTopBottom( true, false, 0, 21.33 )
	icon:setRGB( 1, 0.94, 0.53 )
	icon:setZoom( 5 )
	self:addElement( icon )
	self.icon = icon
	
	local message = LUI.UIText.new()
	message:setLeftRight( true, false, 24.33, 390.33 )
	message:setTopBottom( true, false, 3.66, 19.66 )
	message:setRGB( 1, 1, 0.7 )
	message:setZoom( 5 )
	message:setTTF( "fonts/Entovo.ttf" )
	message:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	message:setShaderVector( 0, 0.1, 0, 0, 0 )
	message:setShaderVector( 1, 0, 0, 0, 0 )
	message:setShaderVector( 2, 0, 0, 0, 0 )
	message:setShaderVector( 3, 0, 0, 0, 0 )
	message:setShaderVector( 4, 0, 0, 0, 0 )
	message:setLetterSpacing( 0.4 )
	message:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	message:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	message:linkToElementModel( self, "messageText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			message:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( message )
	self.message = message
	
	local Dot1 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot1:setLeftRight( true, false, -11, -7 )
	Dot1:setTopBottom( true, false, 9, 13 )
	Dot1:setRGB( 1, 1, 1 )
	Dot1:setZoom( 5 )
	Dot1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot1:setShaderVector( 0, 0.1, 1, 0, 0 )
	Dot1:setShaderVector( 1, 0, 0, 0, 0 )
	Dot1:setShaderVector( 2, 0, 0, 0, 0 )
	Dot1:setShaderVector( 3, 0, 0, 0, 0 )
	Dot1:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot1 )
	self.Dot1 = Dot1
	
	local Dot2 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot2:setLeftRight( true, false, 330, 334 )
	Dot2:setTopBottom( true, false, 9, 13 )
	Dot2:setRGB( 1, 1, 1 )
	Dot2:setZoom( 5 )
	Dot2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot2:setShaderVector( 0, 0.1, 1, 0, 0 )
	Dot2:setShaderVector( 1, 0, 0, 0, 0 )
	Dot2:setShaderVector( 2, 0, 0, 0, 0 )
	Dot2:setShaderVector( 3, 0, 0, 0, 0 )
	Dot2:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot2 )
	self.Dot2 = Dot2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				panel:completeAnimation()
				self.panel:setLeftRight( true, true, 0, 1 )
				self.panel:setTopBottom( true, true, 0, 2 )
				self.panel:setAlpha( 0 )
				self.clipFinished( panel, {} )
				icon:completeAnimation()
				self.icon:setLeftRight( true, false, 0, 21.33 )
				self.icon:setTopBottom( true, false, 0, 21.33 )
				self.icon:setAlpha( 0 )
				self.clipFinished( icon, {} )
				message:completeAnimation()
				self.message:setLeftRight( true, false, 24.33, 390.33 )
				self.message:setTopBottom( true, false, 3.66, 19.67 )
				self.message:setRGB( 1, 1, 0.7 )
				self.message:setAlpha( 0 )
				self.clipFinished( message, {} )
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, -11, -7 )
				self.Dot1:setTopBottom( true, false, 9, 13 )
				self.Dot1:setAlpha( 0 )
				self.clipFinished( Dot1, {} )
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 330, 334 )
				self.Dot2:setTopBottom( true, false, 9, 13 )
				self.Dot2:setAlpha( 0 )
				self.clipFinished( Dot2, {} )
			end,
			Add = function ()
				self:setupElementClipCounter( 5 )
				local panelFrame2 = function ( panel, event )
					local panelFrame3 = function ( panel, event )
						local panelFrame4 = function ( panel, event )
							local panelFrame5 = function ( panel, event )
								local panelFrame6 = function ( panel, event )
									local panelFrame7 = function ( panel, event )
										local panelFrame8 = function ( panel, event )
											if not event.interrupted then
												panel:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
											end
											panel:setLeftRight( true, true, 0, 1 )
											panel:setTopBottom( true, true, 0, 2 )
											panel:setAlpha( 0.2 )
											if event.interrupted then
												self.clipFinished( panel, event )
											else
												panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											panelFrame8( panel, event )
											return 
										else
											panel:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											panel:registerEventHandler( "transition_complete_keyframe", panelFrame8 )
										end
									end
									
									if event.interrupted then
										panelFrame7( panel, event )
										return 
									else
										panel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										panel:setAlpha( 0 )
										panel:registerEventHandler( "transition_complete_keyframe", panelFrame7 )
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
								panel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								panel:setAlpha( 1 )
								panel:registerEventHandler( "transition_complete_keyframe", panelFrame5 )
							end
						end
						
						if event.interrupted then
							panelFrame4( panel, event )
							return 
						else
							panel:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							panel:setAlpha( 0 )
							panel:registerEventHandler( "transition_complete_keyframe", panelFrame4 )
						end
					end
					
					if event.interrupted then
						panelFrame3( panel, event )
						return 
					else
						panel:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						panel:setAlpha( 1 )
						panel:registerEventHandler( "transition_complete_keyframe", panelFrame3 )
					end
				end
				
				panel:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				panel:setLeftRight( true, true, 0, 1 )
				panel:setTopBottom( true, true, 0, 2 )
				panel:setAlpha( 0 )
				panel:registerEventHandler( "transition_complete_keyframe", panelFrame2 )
				local iconFrame2 = function ( icon, event )
					local iconFrame3 = function ( icon, event )
						local iconFrame4 = function ( icon, event )
							local iconFrame5 = function ( icon, event )
								local iconFrame6 = function ( icon, event )
									local iconFrame7 = function ( icon, event )
										if not event.interrupted then
											icon:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
										end
										icon:setLeftRight( true, false, 0, 21.33 )
										icon:setTopBottom( true, false, 0, 21.33 )
										icon:setAlpha( 1 )
										icon:setZoom( 5 )
										if event.interrupted then
											self.clipFinished( icon, event )
										else
											icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										iconFrame7( icon, event )
										return 
									else
										icon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										icon:registerEventHandler( "transition_complete_keyframe", iconFrame7 )
									end
								end
								
								if event.interrupted then
									iconFrame6( icon, event )
									return 
								else
									icon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									icon:setAlpha( 0 )
									icon:registerEventHandler( "transition_complete_keyframe", iconFrame6 )
								end
							end
							
							if event.interrupted then
								iconFrame5( icon, event )
								return 
							else
								icon:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								icon:setAlpha( 1 )
								icon:registerEventHandler( "transition_complete_keyframe", iconFrame5 )
							end
						end
						
						if event.interrupted then
							iconFrame4( icon, event )
							return 
						else
							icon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							icon:setAlpha( 0 )
							icon:registerEventHandler( "transition_complete_keyframe", iconFrame4 )
						end
					end
					
					if event.interrupted then
						iconFrame3( icon, event )
						return 
					else
						icon:beginAnimation( "keyframe", 189, false, true, CoD.TweenType.Back )
						icon:setAlpha( 1 )
						icon:setZoom( 5 )
						icon:registerEventHandler( "transition_complete_keyframe", iconFrame3 )
					end
				end
				
				icon:completeAnimation()
				self.icon:setLeftRight( true, false, 0, 21.33 )
				self.icon:setTopBottom( true, false, 0, 21.33 )
				self.icon:setAlpha( 0 )
				self.icon:setZoom( 20 )
				iconFrame2( icon, {} )
				local messageFrame2 = function ( message, event )
					local messageFrame3 = function ( message, event )
						local messageFrame4 = function ( message, event )
							local messageFrame5 = function ( message, event )
								local messageFrame6 = function ( message, event )
									if not event.interrupted then
										message:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									end
									message:setLeftRight( true, false, 24.33, 390.33 )
									message:setTopBottom( true, false, 3.66, 19.67 )
									message:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( message, event )
									else
										message:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									messageFrame6( message, event )
									return 
								else
									message:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									message:setAlpha( 1 )
									message:registerEventHandler( "transition_complete_keyframe", messageFrame6 )
								end
							end
							
							if event.interrupted then
								messageFrame5( message, event )
								return 
							else
								message:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								message:registerEventHandler( "transition_complete_keyframe", messageFrame5 )
							end
						end
						
						if event.interrupted then
							messageFrame4( message, event )
							return 
						else
							message:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							message:setAlpha( 0 )
							message:registerEventHandler( "transition_complete_keyframe", messageFrame4 )
						end
					end
					
					if event.interrupted then
						messageFrame3( message, event )
						return 
					else
						message:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
						message:setAlpha( 1 )
						message:registerEventHandler( "transition_complete_keyframe", messageFrame3 )
					end
				end
				
				message:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
				message:setLeftRight( true, false, 24.33, 390.33 )
				message:setTopBottom( true, false, 3.66, 19.67 )
				message:setAlpha( 0 )
				message:registerEventHandler( "transition_complete_keyframe", messageFrame2 )
				local Dot1Frame2 = function ( Dot1, event )
					local Dot1Frame3 = function ( Dot1, event )
						if not event.interrupted then
							Dot1:beginAnimation( "keyframe", 359, false, true, CoD.TweenType.Back )
						end
						Dot1:setLeftRight( true, false, -11, -7 )
						Dot1:setTopBottom( true, false, 9, 13 )
						Dot1:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( Dot1, event )
						else
							Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot1Frame3( Dot1, event )
						return 
					else
						Dot1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Dot1:setLeftRight( true, false, 31.54, 35.54 )
						Dot1:setAlpha( 1 )
						Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame3 )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 154, 158 )
				self.Dot1:setTopBottom( true, false, 9, 13 )
				self.Dot1:setAlpha( 0 )
				Dot1Frame2( Dot1, {} )
				local Dot2Frame2 = function ( Dot2, event )
					local Dot2Frame3 = function ( Dot2, event )
						if not event.interrupted then
							Dot2:beginAnimation( "keyframe", 359, false, true, CoD.TweenType.Back )
						end
						Dot2:setLeftRight( true, false, 330, 334 )
						Dot2:setTopBottom( true, false, 9, 13 )
						Dot2:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( Dot2, event )
						else
							Dot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot2Frame3( Dot2, event )
						return 
					else
						Dot2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Dot2:setLeftRight( true, false, 284.88, 288.88 )
						Dot2:setAlpha( 1 )
						Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame3 )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 155, 159 )
				self.Dot2:setTopBottom( true, false, 9, 13 )
				self.Dot2:setAlpha( 0 )
				Dot2Frame2( Dot2, {} )
			end,
			Down = function ()
				self:setupElementClipCounter( 5 )
				local panelFrame2 = function ( panel, event )
					local panelFrame3 = function ( panel, event )
						if not event.interrupted then
							panel:beginAnimation( "keyframe", 990, true, true, CoD.TweenType.Back )
						end
						panel:setLeftRight( true, true, 0, 1 )
						panel:setTopBottom( true, true, 0, 2 )
						panel:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( panel, event )
						else
							panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						panelFrame3( panel, event )
						return 
					else
						panel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						panel:setAlpha( 0.2 )
						panel:registerEventHandler( "transition_complete_keyframe", panelFrame3 )
					end
				end
				
				panel:completeAnimation()
				self.panel:setLeftRight( true, true, 0, 1 )
				self.panel:setTopBottom( true, true, -26, -24 )
				self.panel:setAlpha( 0 )
				panelFrame2( panel, {} )
				local iconFrame2 = function ( icon, event )
					local iconFrame3 = function ( icon, event )
						if not event.interrupted then
							icon:beginAnimation( "keyframe", 990, true, true, CoD.TweenType.Back )
						end
						icon:setLeftRight( true, false, 0, 21.33 )
						icon:setTopBottom( true, false, 0, 21.33 )
						icon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( icon, event )
						else
							icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						iconFrame3( icon, event )
						return 
					else
						icon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						icon:setTopBottom( true, false, -25.96, -4.63 )
						icon:setAlpha( 1 )
						icon:registerEventHandler( "transition_complete_keyframe", iconFrame3 )
					end
				end
				
				icon:completeAnimation()
				self.icon:setLeftRight( true, false, 0, 21.33 )
				self.icon:setTopBottom( true, false, -26, -4.67 )
				self.icon:setAlpha( 0 )
				iconFrame2( icon, {} )
				local messageFrame2 = function ( message, event )
					local messageFrame3 = function ( message, event )
						if not event.interrupted then
							message:beginAnimation( "keyframe", 990, true, true, CoD.TweenType.Back )
						end
						message:setLeftRight( true, false, 24.33, 390.33 )
						message:setTopBottom( true, false, 3.66, 19.67 )
						message:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( message, event )
						else
							message:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						messageFrame3( message, event )
						return 
					else
						message:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						message:setTopBottom( true, false, -22.3, -6.29 )
						message:setAlpha( 1 )
						message:registerEventHandler( "transition_complete_keyframe", messageFrame3 )
					end
				end
				
				message:completeAnimation()
				self.message:setLeftRight( true, false, 24.33, 390.33 )
				self.message:setTopBottom( true, false, -22.34, -6.33 )
				self.message:setAlpha( 0 )
				messageFrame2( message, {} )
				local Dot1Frame2 = function ( Dot1, event )
					local Dot1Frame3 = function ( Dot1, event )
						if not event.interrupted then
							Dot1:beginAnimation( "keyframe", 990, true, true, CoD.TweenType.Back )
						end
						Dot1:setLeftRight( true, false, -11, -7 )
						Dot1:setTopBottom( true, false, 9, 13 )
						Dot1:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( Dot1, event )
						else
							Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot1Frame3( Dot1, event )
						return 
					else
						Dot1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Dot1:setAlpha( 0.6 )
						Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame3 )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, -11, -7 )
				self.Dot1:setTopBottom( true, false, -17, -13 )
				self.Dot1:setAlpha( 0 )
				Dot1Frame2( Dot1, {} )
				local Dot2Frame2 = function ( Dot2, event )
					local Dot2Frame3 = function ( Dot2, event )
						if not event.interrupted then
							Dot2:beginAnimation( "keyframe", 990, true, true, CoD.TweenType.Back )
						end
						Dot2:setLeftRight( true, false, 330, 334 )
						Dot2:setTopBottom( true, false, 9, 13 )
						Dot2:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( Dot2, event )
						else
							Dot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot2Frame3( Dot2, event )
						return 
					else
						Dot2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Dot2:setAlpha( 0.6 )
						Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame3 )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 330, 334 )
				self.Dot2:setTopBottom( true, false, -18, -14 )
				self.Dot2:setAlpha( 0 )
				Dot2Frame2( Dot2, {} )
			end,
			Off = function ()
				self:setupElementClipCounter( 5 )
				local panelFrame2 = function ( panel, event )
					local panelFrame3 = function ( panel, event )
						local panelFrame4 = function ( panel, event )
							local panelFrame5 = function ( panel, event )
								local panelFrame6 = function ( panel, event )
									local panelFrame7 = function ( panel, event )
										if not event.interrupted then
											panel:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
										end
										panel:setLeftRight( true, true, 0, 1 )
										panel:setTopBottom( true, true, 0, 2 )
										panel:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( panel, event )
										else
											panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										panelFrame7( panel, event )
										return 
									else
										panel:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										panel:setAlpha( 0.52 )
										panel:registerEventHandler( "transition_complete_keyframe", panelFrame7 )
									end
								end
								
								if event.interrupted then
									panelFrame6( panel, event )
									return 
								else
									panel:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									panel:setAlpha( 0 )
									panel:registerEventHandler( "transition_complete_keyframe", panelFrame6 )
								end
							end
							
							if event.interrupted then
								panelFrame5( panel, event )
								return 
							else
								panel:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								panel:setAlpha( 0.88 )
								panel:registerEventHandler( "transition_complete_keyframe", panelFrame5 )
							end
						end
						
						if event.interrupted then
							panelFrame4( panel, event )
							return 
						else
							panel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							panel:setAlpha( 0.43 )
							panel:registerEventHandler( "transition_complete_keyframe", panelFrame4 )
						end
					end
					
					if event.interrupted then
						panelFrame3( panel, event )
						return 
					else
						panel:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						panel:setAlpha( 0.77 )
						panel:registerEventHandler( "transition_complete_keyframe", panelFrame3 )
					end
				end
				
				panel:completeAnimation()
				self.panel:setLeftRight( true, true, 0, 1 )
				self.panel:setTopBottom( true, true, 0, 2 )
				self.panel:setAlpha( 0.2 )
				panelFrame2( panel, {} )
				local iconFrame2 = function ( icon, event )
					local iconFrame3 = function ( icon, event )
						local iconFrame4 = function ( icon, event )
							local iconFrame5 = function ( icon, event )
								local iconFrame6 = function ( icon, event )
									local iconFrame7 = function ( icon, event )
										if not event.interrupted then
											icon:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										end
										icon:setLeftRight( true, false, 0, 21.33 )
										icon:setTopBottom( true, false, 0, 21.33 )
										icon:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( icon, event )
										else
											icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										iconFrame7( icon, event )
										return 
									else
										icon:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
										icon:setAlpha( 0.51 )
										icon:registerEventHandler( "transition_complete_keyframe", iconFrame7 )
									end
								end
								
								if event.interrupted then
									iconFrame6( icon, event )
									return 
								else
									icon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
									icon:setAlpha( 0 )
									icon:registerEventHandler( "transition_complete_keyframe", iconFrame6 )
								end
							end
							
							if event.interrupted then
								iconFrame5( icon, event )
								return 
							else
								icon:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								icon:setAlpha( 0.6 )
								icon:registerEventHandler( "transition_complete_keyframe", iconFrame5 )
							end
						end
						
						if event.interrupted then
							iconFrame4( icon, event )
							return 
						else
							icon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							icon:setAlpha( 0.03 )
							icon:registerEventHandler( "transition_complete_keyframe", iconFrame4 )
						end
					end
					
					if event.interrupted then
						iconFrame3( icon, event )
						return 
					else
						icon:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						icon:registerEventHandler( "transition_complete_keyframe", iconFrame3 )
					end
				end
				
				icon:completeAnimation()
				self.icon:setLeftRight( true, false, 0, 21.33 )
				self.icon:setTopBottom( true, false, 0, 21.33 )
				self.icon:setAlpha( 1 )
				iconFrame2( icon, {} )
				local messageFrame2 = function ( message, event )
					local messageFrame3 = function ( message, event )
						local messageFrame4 = function ( message, event )
							local messageFrame5 = function ( message, event )
								local messageFrame6 = function ( message, event )
									local messageFrame7 = function ( message, event )
										local messageFrame8 = function ( message, event )
											local messageFrame9 = function ( message, event )
												if not event.interrupted then
													message:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
												end
												message:setLeftRight( true, false, 24.33, 390.33 )
												message:setTopBottom( true, false, 3.66, 19.67 )
												message:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( message, event )
												else
													message:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												messageFrame9( message, event )
												return 
											else
												message:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												message:setAlpha( 1 )
												message:registerEventHandler( "transition_complete_keyframe", messageFrame9 )
											end
										end
										
										if event.interrupted then
											messageFrame8( message, event )
											return 
										else
											message:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
											message:setAlpha( 0.14 )
											message:registerEventHandler( "transition_complete_keyframe", messageFrame8 )
										end
									end
									
									if event.interrupted then
										messageFrame7( message, event )
										return 
									else
										message:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										message:setAlpha( 1 )
										message:registerEventHandler( "transition_complete_keyframe", messageFrame7 )
									end
								end
								
								if event.interrupted then
									messageFrame6( message, event )
									return 
								else
									message:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									message:setAlpha( 0.29 )
									message:registerEventHandler( "transition_complete_keyframe", messageFrame6 )
								end
							end
							
							if event.interrupted then
								messageFrame5( message, event )
								return 
							else
								message:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								message:setAlpha( 0.89 )
								message:registerEventHandler( "transition_complete_keyframe", messageFrame5 )
							end
						end
						
						if event.interrupted then
							messageFrame4( message, event )
							return 
						else
							message:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							message:setAlpha( 1 )
							message:registerEventHandler( "transition_complete_keyframe", messageFrame4 )
						end
					end
					
					if event.interrupted then
						messageFrame3( message, event )
						return 
					else
						message:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						message:setAlpha( 0.34 )
						message:registerEventHandler( "transition_complete_keyframe", messageFrame3 )
					end
				end
				
				message:completeAnimation()
				self.message:setLeftRight( true, false, 24.33, 390.33 )
				self.message:setTopBottom( true, false, 3.66, 19.67 )
				self.message:setAlpha( 1 )
				messageFrame2( message, {} )
				local Dot1Frame2 = function ( Dot1, event )
					local Dot1Frame3 = function ( Dot1, event )
						local Dot1Frame4 = function ( Dot1, event )
							if not event.interrupted then
								Dot1:beginAnimation( "keyframe", 120, true, true, CoD.TweenType.Linear )
							end
							Dot1:setLeftRight( true, false, 330, 334 )
							Dot1:setTopBottom( true, false, 9, 13 )
							Dot1:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Dot1, event )
							else
								Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot1Frame4( Dot1, event )
							return 
						else
							Dot1:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							Dot1:setLeftRight( true, false, 311.42, 315.42 )
							Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame4 )
						end
					end
					
					if event.interrupted then
						Dot1Frame3( Dot1, event )
						return 
					else
						Dot1:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Dot1:setLeftRight( true, false, 224.75, 228.75 )
						Dot1:setAlpha( 1 )
						Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame3 )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, -11, -7 )
				self.Dot1:setTopBottom( true, false, 9, 13 )
				self.Dot1:setAlpha( 0.6 )
				Dot1Frame2( Dot1, {} )
				local Dot2Frame2 = function ( Dot2, event )
					local Dot2Frame3 = function ( Dot2, event )
						local Dot2Frame4 = function ( Dot2, event )
							if not event.interrupted then
								Dot2:beginAnimation( "keyframe", 120, true, true, CoD.TweenType.Linear )
							end
							Dot2:setLeftRight( true, false, 330, 334 )
							Dot2:setTopBottom( true, false, 9, 13 )
							Dot2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Dot2, event )
							else
								Dot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot2Frame4( Dot2, event )
							return 
						else
							Dot2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame4 )
						end
					end
					
					if event.interrupted then
						Dot2Frame3( Dot2, event )
						return 
					else
						Dot2:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Dot2:setAlpha( 1 )
						Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame3 )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 330, 334 )
				self.Dot2:setTopBottom( true, false, 9, 13 )
				self.Dot2:setAlpha( 0.6 )
				Dot2Frame2( Dot2, {} )
			end
		}
	}
	self.close = function ( self )
		self.panel:close()
		self.icon:close()
		self.Dot1:close()
		self.Dot2:close()
		self.message:close()
		CoD.EventMessage.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

