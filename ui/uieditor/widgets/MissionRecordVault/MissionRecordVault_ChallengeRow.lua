-- 416867969c66d4d28e5a11ec7e5ef171
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CAC.cac_FocusBarContainer" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesDifficulty" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesAccuracy" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesAirVehicleDestroy" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesBullshark" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesCybernetics" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesDefend" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesDifficulty" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesExplosion" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesFind" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesGrenade" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesGroundVehicleDestroy" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesHeavyWeapon" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesKills" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesMelee" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesScore" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesStealth" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesTime" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesTraversal" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesTrickShot" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesUntouched" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesWeapon" )

local PostLoadFunc = function ( self, controller, menu )
	self.MissionRecordVaultAccolade:linkToElementModel( self, nil, false, function ( model )
		if model then
			local f2_local0 = Engine.GetModelValue( Engine.GetModel( model, "challengeWidget" ) )
			local f2_local1 = CoD
			local f2_local2 = "MissionRecordVault_Accolades"
			f2_local1 = f2_local1["MissionRecordVault_Accolades" .. f2_local0].new( menu, controller )
			f2_local1:setLeftRight( REG3:getLocalLeftRight() )
			f2_local1:setTopBottom( REG3:getLocalTopBottom() )
			f2_local1:setModel( model, controller )
			f2_local1:addElementBefore( REG3 )
			self.MissionRecordVaultAccolade = f2_local1
			REG3:close()
		end
	end )
end

CoD.MissionRecordVault_ChallengeRow = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_ChallengeRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_ChallengeRow )
	self.id = "MissionRecordVault_ChallengeRow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 162 )
	self:setTopBottom( true, false, 0, 117 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	BoxButtonLrgInactiveStroke:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveStroke:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveStroke:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveStroke )
	self.BoxButtonLrgInactiveStroke = BoxButtonLrgInactiveStroke
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = LUI.UIImage.new()
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setAlpha( 0 )
	BoxButtonLrgInactive:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivefull" ) )
	BoxButtonLrgInactive:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactive:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local yellowstar = LUI.UIImage.new()
	yellowstar:setLeftRight( true, false, 126, 160 )
	yellowstar:setTopBottom( true, false, -1, 33 )
	yellowstar:setAlpha( 0 )
	yellowstar:setImage( RegisterImage( "uie_t7_menu_aar_yellowstar" ) )
	self:addElement( yellowstar )
	self.yellowstar = yellowstar
	
	local Name = LUI.UIText.new()
	Name:setLeftRight( true, true, 9, -8 )
	Name:setTopBottom( true, false, 93, 111 )
	Name:setTTF( "fonts/default.ttf" )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Name:linkToElementModel( self, "challengeName", true, function ( model )
		local challengeName = Engine.GetModelValue( model )
		if challengeName then
			Name:setText( Engine.Localize( challengeName ) )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -4, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, 0, 4 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	FocusBorder:setLeftRight( true, true, 0, 0 )
	FocusBorder:setTopBottom( true, true, -0.5, 0 )
	FocusBorder:setRGB( 1, 0.3, 0 )
	FocusBorder:setAlpha( 0 )
	self:addElement( FocusBorder )
	self.FocusBorder = FocusBorder
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( true, true, -5, 4 )
	glitch:setTopBottom( true, false, -9.75, 3.75 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( true, true, -5, 4 )
	glitch2:setTopBottom( false, true, -5, 10 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local FocusWhiteT = CoD.cac_FocusBarContainer.new( menu, controller )
	FocusWhiteT:setLeftRight( true, true, -2, 2 )
	FocusWhiteT:setTopBottom( true, false, -4, 0 )
	FocusWhiteT:setAlpha( 0 )
	FocusWhiteT:setZoom( 1 )
	self:addElement( FocusWhiteT )
	self.FocusWhiteT = FocusWhiteT
	
	local FocusWhiteB = CoD.cac_FocusBarContainer.new( menu, controller )
	FocusWhiteB:setLeftRight( true, true, -2, 2 )
	FocusWhiteB:setTopBottom( false, true, 0, 4 )
	FocusWhiteB:setAlpha( 0 )
	FocusWhiteB:setZoom( 1 )
	self:addElement( FocusWhiteB )
	self.FocusWhiteB = FocusWhiteB
	
	local MissionRecordVaultAccolade = CoD.MissionRecordVault_AccoladesDifficulty.new( menu, controller )
	MissionRecordVaultAccolade:setLeftRight( false, false, -50, 50 )
	MissionRecordVaultAccolade:setTopBottom( true, false, -1, 99 )
	self:addElement( MissionRecordVaultAccolade )
	self.MissionRecordVaultAccolade = MissionRecordVaultAccolade
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BoxButtonLrgInactiveStroke:completeAnimation()
				self.BoxButtonLrgInactiveStroke:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveStroke, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				yellowstar:completeAnimation()
				self.yellowstar:setAlpha( 1 )
				self.clipFinished( yellowstar, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )

				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )

				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )

				FocusWhiteT:completeAnimation()
				self.FocusWhiteT:setAlpha( 0 )
				self.clipFinished( FocusWhiteT, {} )

				FocusWhiteB:completeAnimation()
				self.FocusWhiteB:setAlpha( 0 )
				self.clipFinished( FocusWhiteB, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )

				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.57 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.21 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.66 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										if not event.interrupted then
											glitch:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch, event )
										else
											glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 1 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 0 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 1 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										if not event.interrupted then
											glitch2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch2, event )
										else
											glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 1 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 0 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 1 )
				glitch2Frame2( glitch2, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 11 )

				BoxButtonLrgInactiveStroke:completeAnimation()
				self.BoxButtonLrgInactiveStroke:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveStroke, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )

				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )

				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )

				FocusWhiteT:completeAnimation()
				self.FocusWhiteT:setAlpha( 0 )
				self.clipFinished( FocusWhiteT, {} )

				FocusWhiteB:completeAnimation()
				self.FocusWhiteB:setAlpha( 0 )
				self.clipFinished( FocusWhiteB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 6 )

				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarT:setAlpha( 0.35 )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.57 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.35 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarB:setAlpha( 0.21 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.66 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.21 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										local glitchFrame8 = function ( glitch, event )
											if not event.interrupted then
												glitch:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch, event )
											else
												glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitchFrame8( glitch, event )
											return 
										else
											glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch:setAlpha( 0.4 )
											glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame8 )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 0 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 1 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										local glitch2Frame8 = function ( glitch2, event )
											if not event.interrupted then
												glitch2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch2, event )
											else
												glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitch2Frame8( glitch2, event )
											return 
										else
											glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch2:setAlpha( 0.57 )
											glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame8 )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 0 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 1 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end
		},
		Incomplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BoxButtonLrgInactiveStroke:completeAnimation()
				self.BoxButtonLrgInactiveStroke:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveStroke, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				yellowstar:completeAnimation()
				self.yellowstar:setAlpha( 0 )
				self.clipFinished( yellowstar, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )

				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )

				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )

				FocusWhiteT:completeAnimation()
				self.FocusWhiteT:setAlpha( 0 )
				self.clipFinished( FocusWhiteT, {} )

				FocusWhiteB:completeAnimation()
				self.FocusWhiteB:setAlpha( 0 )
				self.clipFinished( FocusWhiteB, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )

				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.57 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.21 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.66 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										if not event.interrupted then
											glitch:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch, event )
										else
											glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 1 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 0 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 1 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										if not event.interrupted then
											glitch2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch2, event )
										else
											glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 1 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 0 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 1 )
				glitch2Frame2( glitch2, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 11 )

				BoxButtonLrgInactiveStroke:completeAnimation()
				self.BoxButtonLrgInactiveStroke:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveStroke, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )

				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )

				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )

				FocusWhiteT:completeAnimation()
				self.FocusWhiteT:setAlpha( 0 )
				self.clipFinished( FocusWhiteT, {} )

				FocusWhiteB:completeAnimation()
				self.FocusWhiteB:setAlpha( 0 )
				self.clipFinished( FocusWhiteB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 6 )

				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarT:setAlpha( 0.35 )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.57 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.35 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarB:setAlpha( 0.21 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.66 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.21 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										local glitchFrame8 = function ( glitch, event )
											if not event.interrupted then
												glitch:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch, event )
											else
												glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitchFrame8( glitch, event )
											return 
										else
											glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch:setAlpha( 0.4 )
											glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame8 )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 0 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 1 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										local glitch2Frame8 = function ( glitch2, event )
											if not event.interrupted then
												glitch2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch2, event )
											else
												glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitch2Frame8( glitch2, event )
											return 
										else
											glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch2:setAlpha( 0.57 )
											glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame8 )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 0 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 1 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Incomplete",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "completed" )
			end
		}
	} )
	self:linkToElementModel( self, "completed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completed"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveStroke:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.FocusBorder:close()
		element.FocusWhiteT:close()
		element.FocusWhiteB:close()
		element.MissionRecordVaultAccolade:close()
		element.Name:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

