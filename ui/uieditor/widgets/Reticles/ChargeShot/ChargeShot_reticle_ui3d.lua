-- 290fa7ab0ad595393bf26681d349026c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.ChargeShot.ChargeShot_SmallCenter" )
require( "ui.uieditor.widgets.Reticles.ChargeShot.ChargeShot_CenterReticle" )
require( "ui.uieditor.widgets.Reticles.ChargeShot.ChargerShot_top_Arrow" )
require( "ui.uieditor.widgets.Reticles.ChargeShot.ChargerShot_Moving_Arrow" )
require( "ui.uieditor.widgets.Reticles.ChargeShot.ChargerShot_Reticle_Side" )
require( "ui.uieditor.widgets.Reticles.ChargeShot.ChargerShot_Active_Center" )
require( "ui.uieditor.widgets.Reticles.ChargeShot.ChargerShot_ActiveLock" )
require( "ui.uieditor.widgets.Reticles.ChargeShot.ChargerShot_4corner_line" )
require( "ui.uieditor.widgets.Reticles.ChargeShot.ChargerShot_4corner_Bracket" )
require( "ui.uieditor.widgets.Reticles.ChargeShot.ChargerShot_Brackets" )

CoD.ChargeShot_reticle_ui3d = InheritFrom( LUI.UIElement )
CoD.ChargeShot_reticle_ui3d.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChargeShot_reticle_ui3d )
	self.id = "ChargeShot_reticle_ui3d"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 600 )
	self.anyChildUsesUpdateState = true
	
	local ChargeShotSmallCenter0 = CoD.ChargeShot_SmallCenter.new( menu, controller )
	ChargeShotSmallCenter0:setLeftRight( false, false, -72.74, 18.54 )
	ChargeShotSmallCenter0:setTopBottom( false, false, -43.33, 47.96 )
	ChargeShotSmallCenter0:setRGB( 0.29, 0.69, 0.95 )
	self:addElement( ChargeShotSmallCenter0 )
	self.ChargeShotSmallCenter0 = ChargeShotSmallCenter0
	
	local ChargeShotSmallCenter1 = CoD.ChargeShot_SmallCenter.new( menu, controller )
	ChargeShotSmallCenter1:setLeftRight( false, false, -21.52, 69.77 )
	ChargeShotSmallCenter1:setTopBottom( false, false, -43.33, 47.96 )
	ChargeShotSmallCenter1:setRGB( 0.29, 0.69, 0.95 )
	ChargeShotSmallCenter1:setYRot( 180 )
	self:addElement( ChargeShotSmallCenter1 )
	self.ChargeShotSmallCenter1 = ChargeShotSmallCenter1
	
	local ChargeShotCenterReticle = CoD.ChargeShot_CenterReticle.new( menu, controller )
	ChargeShotCenterReticle:setLeftRight( false, false, -45, 40.66 )
	ChargeShotCenterReticle:setTopBottom( false, false, -40.33, 45.33 )
	ChargeShotCenterReticle:setRGB( 0.29, 0.69, 0.95 )
	self:addElement( ChargeShotCenterReticle )
	self.ChargeShotCenterReticle = ChargeShotCenterReticle
	
	local ChargerShottopArrow1 = CoD.ChargerShot_top_Arrow.new( menu, controller )
	ChargerShottopArrow1:setLeftRight( false, false, -23.91, 22.27 )
	ChargerShottopArrow1:setTopBottom( false, false, -269.6, -157.04 )
	self:addElement( ChargerShottopArrow1 )
	self.ChargerShottopArrow1 = ChargerShottopArrow1
	
	local ChargerShottopArrow2 = CoD.ChargerShot_top_Arrow.new( menu, controller )
	ChargerShottopArrow2:setLeftRight( false, false, -23.67, 21.33 )
	ChargerShottopArrow2:setTopBottom( false, false, 162.83, 272.52 )
	ChargerShottopArrow2:setXRot( 180 )
	self:addElement( ChargerShottopArrow2 )
	self.ChargerShottopArrow2 = ChargerShottopArrow2
	
	local ChargerShotMovingArrow1 = CoD.ChargerShot_Moving_Arrow.new( menu, controller )
	ChargerShotMovingArrow1:setLeftRight( false, false, -189.79, -130.79 )
	ChargerShotMovingArrow1:setTopBottom( false, false, -26.04, 32.96 )
	self:addElement( ChargerShotMovingArrow1 )
	self.ChargerShotMovingArrow1 = ChargerShotMovingArrow1
	
	local ChargerShotMovingArrow2 = CoD.ChargerShot_Moving_Arrow.new( menu, controller )
	ChargerShotMovingArrow2:setLeftRight( false, false, 129.5, 185.54 )
	ChargerShotMovingArrow2:setTopBottom( false, false, -25.52, 30.52 )
	ChargerShotMovingArrow2:setYRot( 180 )
	self:addElement( ChargerShotMovingArrow2 )
	self.ChargerShotMovingArrow2 = ChargerShotMovingArrow2
	
	local ChargerShotReticleSide1 = CoD.ChargerShot_Reticle_Side.new( menu, controller )
	ChargerShotReticleSide1:setLeftRight( false, false, -308, -224 )
	ChargerShotReticleSide1:setTopBottom( false, false, -40.33, 43.67 )
	self:addElement( ChargerShotReticleSide1 )
	self.ChargerShotReticleSide1 = ChargerShotReticleSide1
	
	local ChargerShotReticleSide2 = CoD.ChargerShot_Reticle_Side.new( menu, controller )
	ChargerShotReticleSide2:setLeftRight( false, false, 223.71, 307.71 )
	ChargerShotReticleSide2:setTopBottom( false, false, -40.33, 43.67 )
	ChargerShotReticleSide2:setYRot( 180 )
	self:addElement( ChargerShotReticleSide2 )
	self.ChargerShotReticleSide2 = ChargerShotReticleSide2
	
	local ChargerShotActiveCenter = CoD.ChargerShot_Active_Center.new( menu, controller )
	ChargerShotActiveCenter:setLeftRight( false, false, -38.63, 34.37 )
	ChargerShotActiveCenter:setTopBottom( false, false, -35.17, 37.83 )
	ChargerShotActiveCenter:setAlpha( 0 )
	self:addElement( ChargerShotActiveCenter )
	self.ChargerShotActiveCenter = ChargerShotActiveCenter
	
	local ChargerShotActiveLock0 = CoD.ChargerShot_ActiveLock.new( menu, controller )
	ChargerShotActiveLock0:setLeftRight( false, false, 24.2, 169.27 )
	ChargerShotActiveLock0:setTopBottom( false, false, -169.71, -21.38 )
	ChargerShotActiveLock0:setRGB( 0.29, 0.69, 0.95 )
	ChargerShotActiveLock0:setAlpha( 0 )
	ChargerShotActiveLock0:setYRot( 180 )
	self:addElement( ChargerShotActiveLock0 )
	self.ChargerShotActiveLock0 = ChargerShotActiveLock0
	
	local ChargerShotActiveLock3 = CoD.ChargerShot_ActiveLock.new( menu, controller )
	ChargerShotActiveLock3:setLeftRight( false, false, -172.79, -23.67 )
	ChargerShotActiveLock3:setTopBottom( false, false, -170.44, -21.32 )
	ChargerShotActiveLock3:setRGB( 0.29, 0.69, 0.95 )
	ChargerShotActiveLock3:setAlpha( 0 )
	self:addElement( ChargerShotActiveLock3 )
	self.ChargerShotActiveLock3 = ChargerShotActiveLock3
	
	local ChargerShotActiveLock10 = CoD.ChargerShot_ActiveLock.new( menu, controller )
	ChargerShotActiveLock10:setLeftRight( false, false, -172.79, -23.67 )
	ChargerShotActiveLock10:setTopBottom( false, false, 24.22, 173.33 )
	ChargerShotActiveLock10:setRGB( 0.29, 0.69, 0.95 )
	ChargerShotActiveLock10:setAlpha( 0 )
	ChargerShotActiveLock10:setXRot( 180 )
	self:addElement( ChargerShotActiveLock10 )
	self.ChargerShotActiveLock10 = ChargerShotActiveLock10
	
	local ChargerShotActiveLock20 = CoD.ChargerShot_ActiveLock.new( menu, controller )
	ChargerShotActiveLock20:setLeftRight( false, false, 22.27, 169.27 )
	ChargerShotActiveLock20:setTopBottom( false, false, 22.98, 169.98 )
	ChargerShotActiveLock20:setRGB( 0.29, 0.69, 0.95 )
	ChargerShotActiveLock20:setAlpha( 0 )
	ChargerShotActiveLock20:setXRot( 180 )
	ChargerShotActiveLock20:setYRot( 180 )
	self:addElement( ChargerShotActiveLock20 )
	self.ChargerShotActiveLock20 = ChargerShotActiveLock20
	
	local ChargerShot4cornerline = CoD.ChargerShot_4corner_line.new( menu, controller )
	ChargerShot4cornerline:setLeftRight( false, false, -151.29, 142.5 )
	ChargerShot4cornerline:setTopBottom( false, false, -146.88, 150.5 )
	self:addElement( ChargerShot4cornerline )
	self.ChargerShot4cornerline = ChargerShot4cornerline
	
	local ChargerShot4cornerBracket0 = CoD.ChargerShot_4corner_Bracket.new( menu, controller )
	ChargerShot4cornerBracket0:setLeftRight( false, false, -209.23, 204.54 )
	ChargerShot4cornerBracket0:setTopBottom( false, false, -197.94, 202.71 )
	ChargerShot4cornerBracket0:setRGB( 0.06, 0.51, 0.8 )
	ChargerShot4cornerBracket0:setScale( 1.1 )
	self:addElement( ChargerShot4cornerBracket0 )
	self.ChargerShot4cornerBracket0 = ChargerShot4cornerBracket0
	
	local ChargerShotBrackets = CoD.ChargerShot_Brackets.new( menu, controller )
	ChargerShotBrackets:setLeftRight( true, true, -105.67, 101.71 )
	ChargerShotBrackets:setTopBottom( false, false, -288.32, 293.52 )
	ChargerShotBrackets:setAlpha( 0 )
	self:addElement( ChargerShotBrackets )
	self.ChargerShotBrackets = ChargerShotBrackets
	
	local ChargeShotCenterReticle0 = CoD.ChargeShot_CenterReticle.new( menu, controller )
	ChargeShotCenterReticle0:setLeftRight( false, false, -45, 40.66 )
	ChargeShotCenterReticle0:setTopBottom( false, false, -40.33, 45.33 )
	ChargeShotCenterReticle0:setRGB( 1, 0, 0 )
	ChargeShotCenterReticle0:setAlpha( 0 )
	self:addElement( ChargeShotCenterReticle0 )
	self.ChargeShotCenterReticle0 = ChargeShotCenterReticle0
	
	local ChargeShotSmallCenter10 = CoD.ChargeShot_SmallCenter.new( menu, controller )
	ChargeShotSmallCenter10:setLeftRight( false, false, -21.52, 69.77 )
	ChargeShotSmallCenter10:setTopBottom( false, false, -43.33, 47.96 )
	ChargeShotSmallCenter10:setRGB( 1, 0, 0 )
	ChargeShotSmallCenter10:setAlpha( 0 )
	ChargeShotSmallCenter10:setYRot( 180 )
	self:addElement( ChargeShotSmallCenter10 )
	self.ChargeShotSmallCenter10 = ChargeShotSmallCenter10
	
	local ChargeShotSmallCenter00 = CoD.ChargeShot_SmallCenter.new( menu, controller )
	ChargeShotSmallCenter00:setLeftRight( false, false, -72.74, 18.54 )
	ChargeShotSmallCenter00:setTopBottom( false, false, -43.33, 47.96 )
	ChargeShotSmallCenter00:setRGB( 1, 0, 0 )
	ChargeShotSmallCenter00:setAlpha( 0 )
	self:addElement( ChargeShotSmallCenter00 )
	self.ChargeShotSmallCenter00 = ChargeShotSmallCenter00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Fire = function ()
				self:setupElementClipCounter( 18 )
				local ChargeShotSmallCenter0Frame2 = function ( ChargeShotSmallCenter0, event )
					local ChargeShotSmallCenter0Frame3 = function ( ChargeShotSmallCenter0, event )
						local ChargeShotSmallCenter0Frame4 = function ( ChargeShotSmallCenter0, event )
							local ChargeShotSmallCenter0Frame5 = function ( ChargeShotSmallCenter0, event )
								local ChargeShotSmallCenter0Frame6 = function ( ChargeShotSmallCenter0, event )
									local ChargeShotSmallCenter0Frame7 = function ( ChargeShotSmallCenter0, event )
										local ChargeShotSmallCenter0Frame8 = function ( ChargeShotSmallCenter0, event )
											local ChargeShotSmallCenter0Frame9 = function ( ChargeShotSmallCenter0, event )
												if not event.interrupted then
													ChargeShotSmallCenter0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												end
												ChargeShotSmallCenter0:setRGB( 0.29, 0.69, 0.95 )
												ChargeShotSmallCenter0:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( ChargeShotSmallCenter0, event )
												else
													ChargeShotSmallCenter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												ChargeShotSmallCenter0Frame9( ChargeShotSmallCenter0, event )
												return 
											else
												ChargeShotSmallCenter0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												ChargeShotSmallCenter0:setRGB( 0.29, 0.69, 0.95 )
												ChargeShotSmallCenter0:setAlpha( 1 )
												ChargeShotSmallCenter0:registerEventHandler( "transition_complete_keyframe", ChargeShotSmallCenter0Frame9 )
											end
										end
										
										if event.interrupted then
											ChargeShotSmallCenter0Frame8( ChargeShotSmallCenter0, event )
											return 
										else
											ChargeShotSmallCenter0:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
											ChargeShotSmallCenter0:setRGB( 1, 1, 1 )
											ChargeShotSmallCenter0:registerEventHandler( "transition_complete_keyframe", ChargeShotSmallCenter0Frame8 )
										end
									end
									
									if event.interrupted then
										ChargeShotSmallCenter0Frame7( ChargeShotSmallCenter0, event )
										return 
									else
										ChargeShotSmallCenter0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
										ChargeShotSmallCenter0:setRGB( 1, 0, 0 )
										ChargeShotSmallCenter0:registerEventHandler( "transition_complete_keyframe", ChargeShotSmallCenter0Frame7 )
									end
								end
								
								if event.interrupted then
									ChargeShotSmallCenter0Frame6( ChargeShotSmallCenter0, event )
									return 
								else
									ChargeShotSmallCenter0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									ChargeShotSmallCenter0:setRGB( 1, 1, 1 )
									ChargeShotSmallCenter0:registerEventHandler( "transition_complete_keyframe", ChargeShotSmallCenter0Frame6 )
								end
							end
							
							if event.interrupted then
								ChargeShotSmallCenter0Frame5( ChargeShotSmallCenter0, event )
								return 
							else
								ChargeShotSmallCenter0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								ChargeShotSmallCenter0:setRGB( 0.65, 0.85, 0.97 )
								ChargeShotSmallCenter0:setAlpha( 0 )
								ChargeShotSmallCenter0:registerEventHandler( "transition_complete_keyframe", ChargeShotSmallCenter0Frame5 )
							end
						end
						
						if event.interrupted then
							ChargeShotSmallCenter0Frame4( ChargeShotSmallCenter0, event )
							return 
						else
							ChargeShotSmallCenter0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							ChargeShotSmallCenter0:registerEventHandler( "transition_complete_keyframe", ChargeShotSmallCenter0Frame4 )
						end
					end
					
					if event.interrupted then
						ChargeShotSmallCenter0Frame3( ChargeShotSmallCenter0, event )
						return 
					else
						ChargeShotSmallCenter0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ChargeShotSmallCenter0:registerEventHandler( "transition_complete_keyframe", ChargeShotSmallCenter0Frame3 )
					end
				end
				
				ChargeShotSmallCenter0:completeAnimation()
				self.ChargeShotSmallCenter0:setRGB( 0.29, 0.69, 0.95 )
				self.ChargeShotSmallCenter0:setAlpha( 1 )
				ChargeShotSmallCenter0Frame2( ChargeShotSmallCenter0, {} )
				local ChargeShotSmallCenter1Frame2 = function ( ChargeShotSmallCenter1, event )
					local ChargeShotSmallCenter1Frame3 = function ( ChargeShotSmallCenter1, event )
						local ChargeShotSmallCenter1Frame4 = function ( ChargeShotSmallCenter1, event )
							local ChargeShotSmallCenter1Frame5 = function ( ChargeShotSmallCenter1, event )
								local ChargeShotSmallCenter1Frame6 = function ( ChargeShotSmallCenter1, event )
									local ChargeShotSmallCenter1Frame7 = function ( ChargeShotSmallCenter1, event )
										if not event.interrupted then
											ChargeShotSmallCenter1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
										end
										ChargeShotSmallCenter1:setRGB( 0.29, 0.69, 0.95 )
										ChargeShotSmallCenter1:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( ChargeShotSmallCenter1, event )
										else
											ChargeShotSmallCenter1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ChargeShotSmallCenter1Frame7( ChargeShotSmallCenter1, event )
										return 
									else
										ChargeShotSmallCenter1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										ChargeShotSmallCenter1:setRGB( 0.29, 0.69, 0.95 )
										ChargeShotSmallCenter1:setAlpha( 1 )
										ChargeShotSmallCenter1:registerEventHandler( "transition_complete_keyframe", ChargeShotSmallCenter1Frame7 )
									end
								end
								
								if event.interrupted then
									ChargeShotSmallCenter1Frame6( ChargeShotSmallCenter1, event )
									return 
								else
									ChargeShotSmallCenter1:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
									ChargeShotSmallCenter1:setRGB( 1, 1, 1 )
									ChargeShotSmallCenter1:registerEventHandler( "transition_complete_keyframe", ChargeShotSmallCenter1Frame6 )
								end
							end
							
							if event.interrupted then
								ChargeShotSmallCenter1Frame5( ChargeShotSmallCenter1, event )
								return 
							else
								ChargeShotSmallCenter1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								ChargeShotSmallCenter1:setRGB( 1, 0, 0 )
								ChargeShotSmallCenter1:registerEventHandler( "transition_complete_keyframe", ChargeShotSmallCenter1Frame5 )
							end
						end
						
						if event.interrupted then
							ChargeShotSmallCenter1Frame4( ChargeShotSmallCenter1, event )
							return 
						else
							ChargeShotSmallCenter1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							ChargeShotSmallCenter1:setRGB( 1, 1, 1 )
							ChargeShotSmallCenter1:setAlpha( 0 )
							ChargeShotSmallCenter1:registerEventHandler( "transition_complete_keyframe", ChargeShotSmallCenter1Frame4 )
						end
					end
					
					if event.interrupted then
						ChargeShotSmallCenter1Frame3( ChargeShotSmallCenter1, event )
						return 
					else
						ChargeShotSmallCenter1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						ChargeShotSmallCenter1:registerEventHandler( "transition_complete_keyframe", ChargeShotSmallCenter1Frame3 )
					end
				end
				
				ChargeShotSmallCenter1:completeAnimation()
				self.ChargeShotSmallCenter1:setRGB( 0.29, 0.69, 0.95 )
				self.ChargeShotSmallCenter1:setAlpha( 1 )
				ChargeShotSmallCenter1Frame2( ChargeShotSmallCenter1, {} )
				local ChargeShotCenterReticleFrame2 = function ( ChargeShotCenterReticle, event )
					local ChargeShotCenterReticleFrame3 = function ( ChargeShotCenterReticle, event )
						local ChargeShotCenterReticleFrame4 = function ( ChargeShotCenterReticle, event )
							local ChargeShotCenterReticleFrame5 = function ( ChargeShotCenterReticle, event )
								local ChargeShotCenterReticleFrame6 = function ( ChargeShotCenterReticle, event )
									local ChargeShotCenterReticleFrame7 = function ( ChargeShotCenterReticle, event )
										if not event.interrupted then
											ChargeShotCenterReticle:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
										end
										ChargeShotCenterReticle:setRGB( 0.29, 0.69, 0.95 )
										ChargeShotCenterReticle:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( ChargeShotCenterReticle, event )
										else
											ChargeShotCenterReticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ChargeShotCenterReticleFrame7( ChargeShotCenterReticle, event )
										return 
									else
										ChargeShotCenterReticle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										ChargeShotCenterReticle:setRGB( 0.29, 0.69, 0.95 )
										ChargeShotCenterReticle:setAlpha( 1 )
										ChargeShotCenterReticle:registerEventHandler( "transition_complete_keyframe", ChargeShotCenterReticleFrame7 )
									end
								end
								
								if event.interrupted then
									ChargeShotCenterReticleFrame6( ChargeShotCenterReticle, event )
									return 
								else
									ChargeShotCenterReticle:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
									ChargeShotCenterReticle:setRGB( 0.31, 0.7, 0.95 )
									ChargeShotCenterReticle:registerEventHandler( "transition_complete_keyframe", ChargeShotCenterReticleFrame6 )
								end
							end
							
							if event.interrupted then
								ChargeShotCenterReticleFrame5( ChargeShotCenterReticle, event )
								return 
							else
								ChargeShotCenterReticle:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								ChargeShotCenterReticle:setRGB( 1, 1, 1 )
								ChargeShotCenterReticle:registerEventHandler( "transition_complete_keyframe", ChargeShotCenterReticleFrame5 )
							end
						end
						
						if event.interrupted then
							ChargeShotCenterReticleFrame4( ChargeShotCenterReticle, event )
							return 
						else
							ChargeShotCenterReticle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							ChargeShotCenterReticle:setRGB( 0.37, 0.72, 0.95 )
							ChargeShotCenterReticle:setAlpha( 0 )
							ChargeShotCenterReticle:registerEventHandler( "transition_complete_keyframe", ChargeShotCenterReticleFrame4 )
						end
					end
					
					if event.interrupted then
						ChargeShotCenterReticleFrame3( ChargeShotCenterReticle, event )
						return 
					else
						ChargeShotCenterReticle:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						ChargeShotCenterReticle:registerEventHandler( "transition_complete_keyframe", ChargeShotCenterReticleFrame3 )
					end
				end
				
				ChargeShotCenterReticle:completeAnimation()
				self.ChargeShotCenterReticle:setRGB( 0.29, 0.69, 0.95 )
				self.ChargeShotCenterReticle:setAlpha( 1 )
				ChargeShotCenterReticleFrame2( ChargeShotCenterReticle, {} )
				ChargerShottopArrow1:completeAnimation()
				self.ChargerShottopArrow1:setAlpha( 1 )
				self.clipFinished( ChargerShottopArrow1, {} )
				ChargerShottopArrow2:completeAnimation()
				self.ChargerShottopArrow2:setAlpha( 1 )
				self.clipFinished( ChargerShottopArrow2, {} )
				local ChargerShotMovingArrow1Frame2 = function ( ChargerShotMovingArrow1, event )
					local ChargerShotMovingArrow1Frame3 = function ( ChargerShotMovingArrow1, event )
						local ChargerShotMovingArrow1Frame4 = function ( ChargerShotMovingArrow1, event )
							local ChargerShotMovingArrow1Frame5 = function ( ChargerShotMovingArrow1, event )
								local ChargerShotMovingArrow1Frame6 = function ( ChargerShotMovingArrow1, event )
									if not event.interrupted then
										ChargerShotMovingArrow1:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Linear )
									end
									ChargerShotMovingArrow1:setLeftRight( false, false, -188.74, -129.74 )
									ChargerShotMovingArrow1:setTopBottom( false, false, -26.04, 32.96 )
									ChargerShotMovingArrow1:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( ChargerShotMovingArrow1, event )
									else
										ChargerShotMovingArrow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ChargerShotMovingArrow1Frame6( ChargerShotMovingArrow1, event )
									return 
								else
									ChargerShotMovingArrow1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
									ChargerShotMovingArrow1:setLeftRight( false, false, -128, -69 )
									ChargerShotMovingArrow1:registerEventHandler( "transition_complete_keyframe", ChargerShotMovingArrow1Frame6 )
								end
							end
							
							if event.interrupted then
								ChargerShotMovingArrow1Frame5( ChargerShotMovingArrow1, event )
								return 
							else
								ChargerShotMovingArrow1:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
								ChargerShotMovingArrow1:setLeftRight( false, false, -97.63, -38.63 )
								ChargerShotMovingArrow1:registerEventHandler( "transition_complete_keyframe", ChargerShotMovingArrow1Frame5 )
							end
						end
						
						if event.interrupted then
							ChargerShotMovingArrow1Frame4( ChargerShotMovingArrow1, event )
							return 
						else
							ChargerShotMovingArrow1:beginAnimation( "keyframe", 210, false, true, CoD.TweenType.Linear )
							ChargerShotMovingArrow1:setLeftRight( false, false, -97.63, -38.63 )
							ChargerShotMovingArrow1:registerEventHandler( "transition_complete_keyframe", ChargerShotMovingArrow1Frame4 )
						end
					end
					
					if event.interrupted then
						ChargerShotMovingArrow1Frame3( ChargerShotMovingArrow1, event )
						return 
					else
						ChargerShotMovingArrow1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ChargerShotMovingArrow1:registerEventHandler( "transition_complete_keyframe", ChargerShotMovingArrow1Frame3 )
					end
				end
				
				ChargerShotMovingArrow1:completeAnimation()
				self.ChargerShotMovingArrow1:setLeftRight( false, false, -189.79, -130.79 )
				self.ChargerShotMovingArrow1:setTopBottom( false, false, -26.04, 32.96 )
				self.ChargerShotMovingArrow1:setAlpha( 1 )
				ChargerShotMovingArrow1Frame2( ChargerShotMovingArrow1, {} )
				local ChargerShotMovingArrow2Frame2 = function ( ChargerShotMovingArrow2, event )
					local ChargerShotMovingArrow2Frame3 = function ( ChargerShotMovingArrow2, event )
						local ChargerShotMovingArrow2Frame4 = function ( ChargerShotMovingArrow2, event )
							local ChargerShotMovingArrow2Frame5 = function ( ChargerShotMovingArrow2, event )
								local ChargerShotMovingArrow2Frame6 = function ( ChargerShotMovingArrow2, event )
									if not event.interrupted then
										ChargerShotMovingArrow2:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Linear )
									end
									ChargerShotMovingArrow2:setLeftRight( false, false, 131.06, 187.1 )
									ChargerShotMovingArrow2:setTopBottom( false, false, -25.52, 30.52 )
									ChargerShotMovingArrow2:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( ChargerShotMovingArrow2, event )
									else
										ChargerShotMovingArrow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ChargerShotMovingArrow2Frame6( ChargerShotMovingArrow2, event )
									return 
								else
									ChargerShotMovingArrow2:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
									ChargerShotMovingArrow2:setLeftRight( false, false, 66.6, 122.64 )
									ChargerShotMovingArrow2:registerEventHandler( "transition_complete_keyframe", ChargerShotMovingArrow2Frame6 )
								end
							end
							
							if event.interrupted then
								ChargerShotMovingArrow2Frame5( ChargerShotMovingArrow2, event )
								return 
							else
								ChargerShotMovingArrow2:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
								ChargerShotMovingArrow2:setLeftRight( false, false, 34.37, 90.41 )
								ChargerShotMovingArrow2:registerEventHandler( "transition_complete_keyframe", ChargerShotMovingArrow2Frame5 )
							end
						end
						
						if event.interrupted then
							ChargerShotMovingArrow2Frame4( ChargerShotMovingArrow2, event )
							return 
						else
							ChargerShotMovingArrow2:beginAnimation( "keyframe", 210, false, true, CoD.TweenType.Linear )
							ChargerShotMovingArrow2:setLeftRight( false, false, 34.37, 90.41 )
							ChargerShotMovingArrow2:registerEventHandler( "transition_complete_keyframe", ChargerShotMovingArrow2Frame4 )
						end
					end
					
					if event.interrupted then
						ChargerShotMovingArrow2Frame3( ChargerShotMovingArrow2, event )
						return 
					else
						ChargerShotMovingArrow2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ChargerShotMovingArrow2:registerEventHandler( "transition_complete_keyframe", ChargerShotMovingArrow2Frame3 )
					end
				end
				
				ChargerShotMovingArrow2:completeAnimation()
				self.ChargerShotMovingArrow2:setLeftRight( false, false, 129.5, 185.54 )
				self.ChargerShotMovingArrow2:setTopBottom( false, false, -25.52, 30.52 )
				self.ChargerShotMovingArrow2:setAlpha( 1 )
				ChargerShotMovingArrow2Frame2( ChargerShotMovingArrow2, {} )
				ChargerShotReticleSide1:completeAnimation()
				self.ChargerShotReticleSide1:setAlpha( 1 )
				self.clipFinished( ChargerShotReticleSide1, {} )
				ChargerShotReticleSide2:completeAnimation()
				self.ChargerShotReticleSide2:setAlpha( 1 )
				self.clipFinished( ChargerShotReticleSide2, {} )
				local ChargerShotActiveLock0Frame2 = function ( ChargerShotActiveLock0, event )
					local ChargerShotActiveLock0Frame3 = function ( ChargerShotActiveLock0, event )
						local ChargerShotActiveLock0Frame4 = function ( ChargerShotActiveLock0, event )
							if not event.interrupted then
								ChargerShotActiveLock0:beginAnimation( "keyframe", 189, true, true, CoD.TweenType.Bounce )
							end
							ChargerShotActiveLock0:setLeftRight( false, false, 29.2, 199.01 )
							ChargerShotActiveLock0:setTopBottom( false, false, -197.12, -23.5 )
							ChargerShotActiveLock0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ChargerShotActiveLock0, event )
							else
								ChargerShotActiveLock0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ChargerShotActiveLock0Frame4( ChargerShotActiveLock0, event )
							return 
						else
							ChargerShotActiveLock0:beginAnimation( "keyframe", 440, true, false, CoD.TweenType.Bounce )
							ChargerShotActiveLock0:setAlpha( 0.25 )
							ChargerShotActiveLock0:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock0Frame4 )
						end
					end
					
					if event.interrupted then
						ChargerShotActiveLock0Frame3( ChargerShotActiveLock0, event )
						return 
					else
						ChargerShotActiveLock0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						ChargerShotActiveLock0:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock0Frame3 )
					end
				end
				
				ChargerShotActiveLock0:completeAnimation()
				self.ChargerShotActiveLock0:setLeftRight( false, false, 29.2, 199.01 )
				self.ChargerShotActiveLock0:setTopBottom( false, false, -197.12, -23.5 )
				self.ChargerShotActiveLock0:setAlpha( 0 )
				ChargerShotActiveLock0Frame2( ChargerShotActiveLock0, {} )
				local ChargerShotActiveLock3Frame2 = function ( ChargerShotActiveLock3, event )
					local ChargerShotActiveLock3Frame3 = function ( ChargerShotActiveLock3, event )
						local ChargerShotActiveLock3Frame4 = function ( ChargerShotActiveLock3, event )
							if not event.interrupted then
								ChargerShotActiveLock3:beginAnimation( "keyframe", 189, true, true, CoD.TweenType.Bounce )
							end
							ChargerShotActiveLock3:setLeftRight( false, false, -199.79, -24.91 )
							ChargerShotActiveLock3:setTopBottom( false, false, -199.18, -21.32 )
							ChargerShotActiveLock3:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ChargerShotActiveLock3, event )
							else
								ChargerShotActiveLock3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ChargerShotActiveLock3Frame4( ChargerShotActiveLock3, event )
							return 
						else
							ChargerShotActiveLock3:beginAnimation( "keyframe", 440, true, false, CoD.TweenType.Bounce )
							ChargerShotActiveLock3:setAlpha( 0.25 )
							ChargerShotActiveLock3:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock3Frame4 )
						end
					end
					
					if event.interrupted then
						ChargerShotActiveLock3Frame3( ChargerShotActiveLock3, event )
						return 
					else
						ChargerShotActiveLock3:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						ChargerShotActiveLock3:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock3Frame3 )
					end
				end
				
				ChargerShotActiveLock3:completeAnimation()
				self.ChargerShotActiveLock3:setLeftRight( false, false, -199.79, -24.91 )
				self.ChargerShotActiveLock3:setTopBottom( false, false, -199.18, -21.32 )
				self.ChargerShotActiveLock3:setAlpha( 0 )
				ChargerShotActiveLock3Frame2( ChargerShotActiveLock3, {} )
				local ChargerShotActiveLock10Frame2 = function ( ChargerShotActiveLock10, event )
					local ChargerShotActiveLock10Frame3 = function ( ChargerShotActiveLock10, event )
						local ChargerShotActiveLock10Frame4 = function ( ChargerShotActiveLock10, event )
							if not event.interrupted then
								ChargerShotActiveLock10:beginAnimation( "keyframe", 189, true, true, CoD.TweenType.Bounce )
							end
							ChargerShotActiveLock10:setLeftRight( false, false, -198.74, -23.91 )
							ChargerShotActiveLock10:setTopBottom( false, false, 27.3, 202.13 )
							ChargerShotActiveLock10:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ChargerShotActiveLock10, event )
							else
								ChargerShotActiveLock10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ChargerShotActiveLock10Frame4( ChargerShotActiveLock10, event )
							return 
						else
							ChargerShotActiveLock10:beginAnimation( "keyframe", 440, true, false, CoD.TweenType.Bounce )
							ChargerShotActiveLock10:setAlpha( 0.25 )
							ChargerShotActiveLock10:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock10Frame4 )
						end
					end
					
					if event.interrupted then
						ChargerShotActiveLock10Frame3( ChargerShotActiveLock10, event )
						return 
					else
						ChargerShotActiveLock10:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						ChargerShotActiveLock10:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock10Frame3 )
					end
				end
				
				ChargerShotActiveLock10:completeAnimation()
				self.ChargerShotActiveLock10:setLeftRight( false, false, -198.74, -23.91 )
				self.ChargerShotActiveLock10:setTopBottom( false, false, 27.3, 202.13 )
				self.ChargerShotActiveLock10:setAlpha( 0 )
				ChargerShotActiveLock10Frame2( ChargerShotActiveLock10, {} )
				local ChargerShotActiveLock20Frame2 = function ( ChargerShotActiveLock20, event )
					local ChargerShotActiveLock20Frame3 = function ( ChargerShotActiveLock20, event )
						local ChargerShotActiveLock20Frame4 = function ( ChargerShotActiveLock20, event )
							if not event.interrupted then
								ChargerShotActiveLock20:beginAnimation( "keyframe", 189, true, true, CoD.TweenType.Bounce )
							end
							ChargerShotActiveLock20:setLeftRight( false, false, 28.37, 199.01 )
							ChargerShotActiveLock20:setTopBottom( false, false, 28.3, 198.94 )
							ChargerShotActiveLock20:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ChargerShotActiveLock20, event )
							else
								ChargerShotActiveLock20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ChargerShotActiveLock20Frame4( ChargerShotActiveLock20, event )
							return 
						else
							ChargerShotActiveLock20:beginAnimation( "keyframe", 440, true, false, CoD.TweenType.Bounce )
							ChargerShotActiveLock20:setAlpha( 0.25 )
							ChargerShotActiveLock20:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock20Frame4 )
						end
					end
					
					if event.interrupted then
						ChargerShotActiveLock20Frame3( ChargerShotActiveLock20, event )
						return 
					else
						ChargerShotActiveLock20:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						ChargerShotActiveLock20:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock20Frame3 )
					end
				end
				
				ChargerShotActiveLock20:completeAnimation()
				self.ChargerShotActiveLock20:setLeftRight( false, false, 28.37, 199.01 )
				self.ChargerShotActiveLock20:setTopBottom( false, false, 28.3, 198.94 )
				self.ChargerShotActiveLock20:setAlpha( 0 )
				ChargerShotActiveLock20Frame2( ChargerShotActiveLock20, {} )
				local ChargerShot4cornerlineFrame2 = function ( ChargerShot4cornerline, event )
					local ChargerShot4cornerlineFrame3 = function ( ChargerShot4cornerline, event )
						local ChargerShot4cornerlineFrame4 = function ( ChargerShot4cornerline, event )
							local ChargerShot4cornerlineFrame5 = function ( ChargerShot4cornerline, event )
								local ChargerShot4cornerlineFrame6 = function ( ChargerShot4cornerline, event )
									if not event.interrupted then
										ChargerShot4cornerline:beginAnimation( "keyframe", 399, true, true, CoD.TweenType.Bounce )
									end
									ChargerShot4cornerline:setAlpha( 1 )
									ChargerShot4cornerline:setScale( 1 )
									if event.interrupted then
										self.clipFinished( ChargerShot4cornerline, event )
									else
										ChargerShot4cornerline:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ChargerShot4cornerlineFrame6( ChargerShot4cornerline, event )
									return 
								else
									ChargerShot4cornerline:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
									ChargerShot4cornerline:registerEventHandler( "transition_complete_keyframe", ChargerShot4cornerlineFrame6 )
								end
							end
							
							if event.interrupted then
								ChargerShot4cornerlineFrame5( ChargerShot4cornerline, event )
								return 
							else
								ChargerShot4cornerline:beginAnimation( "keyframe", 90, true, true, CoD.TweenType.Bounce )
								ChargerShot4cornerline:setScale( 0.4 )
								ChargerShot4cornerline:registerEventHandler( "transition_complete_keyframe", ChargerShot4cornerlineFrame5 )
							end
						end
						
						if event.interrupted then
							ChargerShot4cornerlineFrame4( ChargerShot4cornerline, event )
							return 
						else
							ChargerShot4cornerline:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							ChargerShot4cornerline:setScale( 0.7 )
							ChargerShot4cornerline:registerEventHandler( "transition_complete_keyframe", ChargerShot4cornerlineFrame4 )
						end
					end
					
					if event.interrupted then
						ChargerShot4cornerlineFrame3( ChargerShot4cornerline, event )
						return 
					else
						ChargerShot4cornerline:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						ChargerShot4cornerline:setScale( 0.9 )
						ChargerShot4cornerline:registerEventHandler( "transition_complete_keyframe", ChargerShot4cornerlineFrame3 )
					end
				end
				
				ChargerShot4cornerline:completeAnimation()
				self.ChargerShot4cornerline:setAlpha( 1 )
				self.ChargerShot4cornerline:setScale( 1 )
				ChargerShot4cornerlineFrame2( ChargerShot4cornerline, {} )
				local ChargerShot4cornerBracket0Frame2 = function ( ChargerShot4cornerBracket0, event )
					local ChargerShot4cornerBracket0Frame3 = function ( ChargerShot4cornerBracket0, event )
						local ChargerShot4cornerBracket0Frame4 = function ( ChargerShot4cornerBracket0, event )
							local ChargerShot4cornerBracket0Frame5 = function ( ChargerShot4cornerBracket0, event )
								local ChargerShot4cornerBracket0Frame6 = function ( ChargerShot4cornerBracket0, event )
									if not event.interrupted then
										ChargerShot4cornerBracket0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
									end
									ChargerShot4cornerBracket0:setLeftRight( false, false, -209.06, 204.71 )
									ChargerShot4cornerBracket0:setTopBottom( false, false, -198.01, 202.64 )
									ChargerShot4cornerBracket0:setAlpha( 1 )
									ChargerShot4cornerBracket0:setScale( 1.1 )
									if event.interrupted then
										self.clipFinished( ChargerShot4cornerBracket0, event )
									else
										ChargerShot4cornerBracket0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ChargerShot4cornerBracket0Frame6( ChargerShot4cornerBracket0, event )
									return 
								else
									ChargerShot4cornerBracket0:beginAnimation( "keyframe", 399, true, true, CoD.TweenType.Linear )
									ChargerShot4cornerBracket0:setScale( 1.1 )
									ChargerShot4cornerBracket0:registerEventHandler( "transition_complete_keyframe", ChargerShot4cornerBracket0Frame6 )
								end
							end
							
							if event.interrupted then
								ChargerShot4cornerBracket0Frame5( ChargerShot4cornerBracket0, event )
								return 
							else
								ChargerShot4cornerBracket0:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
								ChargerShot4cornerBracket0:registerEventHandler( "transition_complete_keyframe", ChargerShot4cornerBracket0Frame5 )
							end
						end
						
						if event.interrupted then
							ChargerShot4cornerBracket0Frame4( ChargerShot4cornerBracket0, event )
							return 
						else
							ChargerShot4cornerBracket0:beginAnimation( "keyframe", 90, true, true, CoD.TweenType.Linear )
							ChargerShot4cornerBracket0:setScale( 0.8 )
							ChargerShot4cornerBracket0:registerEventHandler( "transition_complete_keyframe", ChargerShot4cornerBracket0Frame4 )
						end
					end
					
					if event.interrupted then
						ChargerShot4cornerBracket0Frame3( ChargerShot4cornerBracket0, event )
						return 
					else
						ChargerShot4cornerBracket0:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
						ChargerShot4cornerBracket0:setScale( 1 )
						ChargerShot4cornerBracket0:registerEventHandler( "transition_complete_keyframe", ChargerShot4cornerBracket0Frame3 )
					end
				end
				
				ChargerShot4cornerBracket0:completeAnimation()
				self.ChargerShot4cornerBracket0:setLeftRight( false, false, -209.06, 204.71 )
				self.ChargerShot4cornerBracket0:setTopBottom( false, false, -198.01, 202.64 )
				self.ChargerShot4cornerBracket0:setAlpha( 1 )
				self.ChargerShot4cornerBracket0:setScale( 1.1 )
				ChargerShot4cornerBracket0Frame2( ChargerShot4cornerBracket0, {} )
				local f3_local11 = function ( f56_arg0, f56_arg1 )
					local f56_local0 = function ( f57_arg0, f57_arg1 )
						local f57_local0 = function ( f58_arg0, f58_arg1 )
							if not f58_arg1.interrupted then
								f58_arg0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
							end
							f58_arg0:setRGB( 1, 0, 0 )
							f58_arg0:setAlpha( 0 )
							if f58_arg1.interrupted then
								self.clipFinished( f58_arg0, f58_arg1 )
							else
								f58_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f57_arg1.interrupted then
							f57_local0( f57_arg0, f57_arg1 )
							return 
						else
							f57_arg0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
							f57_arg0:registerEventHandler( "transition_complete_keyframe", f57_local0 )
						end
					end
					
					if f56_arg1.interrupted then
						f56_local0( f56_arg0, f56_arg1 )
						return 
					else
						f56_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f56_arg0:setAlpha( 1 )
						f56_arg0:registerEventHandler( "transition_complete_keyframe", f56_local0 )
					end
				end
				
				ChargeShotCenterReticle0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				ChargeShotCenterReticle0:setRGB( 1, 0, 0 )
				ChargeShotCenterReticle0:setAlpha( 0 )
				ChargeShotCenterReticle0:registerEventHandler( "transition_complete_keyframe", f3_local11 )
				local f3_local12 = function ( f59_arg0, f59_arg1 )
					local f59_local0 = function ( f60_arg0, f60_arg1 )
						local f60_local0 = function ( f61_arg0, f61_arg1 )
							if not f61_arg1.interrupted then
								f61_arg0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
							end
							f61_arg0:setRGB( 1, 0, 0 )
							f61_arg0:setAlpha( 0 )
							if f61_arg1.interrupted then
								self.clipFinished( f61_arg0, f61_arg1 )
							else
								f61_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f60_arg1.interrupted then
							f60_local0( f60_arg0, f60_arg1 )
							return 
						else
							f60_arg0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
							f60_arg0:registerEventHandler( "transition_complete_keyframe", f60_local0 )
						end
					end
					
					if f59_arg1.interrupted then
						f59_local0( f59_arg0, f59_arg1 )
						return 
					else
						f59_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f59_arg0:setAlpha( 1 )
						f59_arg0:registerEventHandler( "transition_complete_keyframe", f59_local0 )
					end
				end
				
				ChargeShotSmallCenter10:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				ChargeShotSmallCenter10:setRGB( 1, 0, 0 )
				ChargeShotSmallCenter10:setAlpha( 0 )
				ChargeShotSmallCenter10:registerEventHandler( "transition_complete_keyframe", f3_local12 )
				local f3_local13 = function ( f62_arg0, f62_arg1 )
					local f62_local0 = function ( f63_arg0, f63_arg1 )
						local f63_local0 = function ( f64_arg0, f64_arg1 )
							if not f64_arg1.interrupted then
								f64_arg0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
							end
							f64_arg0:setRGB( 1, 0, 0 )
							f64_arg0:setAlpha( 0 )
							if f64_arg1.interrupted then
								self.clipFinished( f64_arg0, f64_arg1 )
							else
								f64_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f63_arg1.interrupted then
							f63_local0( f63_arg0, f63_arg1 )
							return 
						else
							f63_arg0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
							f63_arg0:registerEventHandler( "transition_complete_keyframe", f63_local0 )
						end
					end
					
					if f62_arg1.interrupted then
						f62_local0( f62_arg0, f62_arg1 )
						return 
					else
						f62_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f62_arg0:setAlpha( 1 )
						f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
					end
				end
				
				ChargeShotSmallCenter00:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				ChargeShotSmallCenter00:setRGB( 1, 0, 0 )
				ChargeShotSmallCenter00:setAlpha( 0 )
				ChargeShotSmallCenter00:registerEventHandler( "transition_complete_keyframe", f3_local13 )
			end,
			Cancel = function ()
				self:setupElementClipCounter( 14 )
				ChargeShotSmallCenter0:completeAnimation()
				self.ChargeShotSmallCenter0:setRGB( 0.29, 0.69, 0.95 )
				self.clipFinished( ChargeShotSmallCenter0, {} )
				ChargeShotSmallCenter1:completeAnimation()
				self.ChargeShotSmallCenter1:setRGB( 0.29, 0.69, 0.95 )
				self.clipFinished( ChargeShotSmallCenter1, {} )
				ChargeShotCenterReticle:completeAnimation()
				self.ChargeShotCenterReticle:setRGB( 0.29, 0.69, 0.95 )
				self.ChargeShotCenterReticle:setAlpha( 1 )
				self.clipFinished( ChargeShotCenterReticle, {} )
				local ChargerShotMovingArrow1Frame2 = function ( ChargerShotMovingArrow1, event )
					local ChargerShotMovingArrow1Frame3 = function ( ChargerShotMovingArrow1, event )
						if not event.interrupted then
							ChargerShotMovingArrow1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						end
						ChargerShotMovingArrow1:setLeftRight( false, false, -189.79, -130.79 )
						ChargerShotMovingArrow1:setTopBottom( false, false, -26.04, 32.96 )
						ChargerShotMovingArrow1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ChargerShotMovingArrow1, event )
						else
							ChargerShotMovingArrow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ChargerShotMovingArrow1Frame3( ChargerShotMovingArrow1, event )
						return 
					else
						ChargerShotMovingArrow1:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						ChargerShotMovingArrow1:setLeftRight( false, false, -189.79, -130.79 )
						ChargerShotMovingArrow1:registerEventHandler( "transition_complete_keyframe", ChargerShotMovingArrow1Frame3 )
					end
				end
				
				ChargerShotMovingArrow1:completeAnimation()
				self.ChargerShotMovingArrow1:setLeftRight( false, false, -131.74, -72.74 )
				self.ChargerShotMovingArrow1:setTopBottom( false, false, -26.04, 32.96 )
				self.ChargerShotMovingArrow1:setAlpha( 1 )
				ChargerShotMovingArrow1Frame2( ChargerShotMovingArrow1, {} )
				local ChargerShotMovingArrow2Frame2 = function ( ChargerShotMovingArrow2, event )
					local ChargerShotMovingArrow2Frame3 = function ( ChargerShotMovingArrow2, event )
						if not event.interrupted then
							ChargerShotMovingArrow2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						end
						ChargerShotMovingArrow2:setLeftRight( false, false, 129.5, 185.54 )
						ChargerShotMovingArrow2:setTopBottom( false, false, -25.52, 30.52 )
						ChargerShotMovingArrow2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ChargerShotMovingArrow2, event )
						else
							ChargerShotMovingArrow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ChargerShotMovingArrow2Frame3( ChargerShotMovingArrow2, event )
						return 
					else
						ChargerShotMovingArrow2:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						ChargerShotMovingArrow2:setLeftRight( false, false, 129.5, 185.54 )
						ChargerShotMovingArrow2:registerEventHandler( "transition_complete_keyframe", ChargerShotMovingArrow2Frame3 )
					end
				end
				
				ChargerShotMovingArrow2:completeAnimation()
				self.ChargerShotMovingArrow2:setLeftRight( false, false, 68.06, 124.1 )
				self.ChargerShotMovingArrow2:setTopBottom( false, false, -25.52, 30.52 )
				self.ChargerShotMovingArrow2:setAlpha( 1 )
				ChargerShotMovingArrow2Frame2( ChargerShotMovingArrow2, {} )
				local ChargerShotActiveLock0Frame2 = function ( ChargerShotActiveLock0, event )
					local ChargerShotActiveLock0Frame3 = function ( ChargerShotActiveLock0, event )
						local ChargerShotActiveLock0Frame4 = function ( ChargerShotActiveLock0, event )
							if not event.interrupted then
								ChargerShotActiveLock0:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							end
							ChargerShotActiveLock0:setLeftRight( false, false, 29.2, 199.01 )
							ChargerShotActiveLock0:setTopBottom( false, false, -197.12, -23.5 )
							ChargerShotActiveLock0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ChargerShotActiveLock0, event )
							else
								ChargerShotActiveLock0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ChargerShotActiveLock0Frame4( ChargerShotActiveLock0, event )
							return 
						else
							ChargerShotActiveLock0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
							ChargerShotActiveLock0:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock0Frame4 )
						end
					end
					
					if event.interrupted then
						ChargerShotActiveLock0Frame3( ChargerShotActiveLock0, event )
						return 
					else
						ChargerShotActiveLock0:beginAnimation( "keyframe", 50, true, true, CoD.TweenType.Bounce )
						ChargerShotActiveLock0:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock0Frame3 )
					end
				end
				
				ChargerShotActiveLock0:completeAnimation()
				self.ChargerShotActiveLock0:setLeftRight( false, false, 29.2, 199.01 )
				self.ChargerShotActiveLock0:setTopBottom( false, false, -197.12, -23.5 )
				self.ChargerShotActiveLock0:setAlpha( 0 )
				ChargerShotActiveLock0Frame2( ChargerShotActiveLock0, {} )
				local ChargerShotActiveLock3Frame2 = function ( ChargerShotActiveLock3, event )
					local ChargerShotActiveLock3Frame3 = function ( ChargerShotActiveLock3, event )
						local ChargerShotActiveLock3Frame4 = function ( ChargerShotActiveLock3, event )
							local ChargerShotActiveLock3Frame5 = function ( ChargerShotActiveLock3, event )
								local ChargerShotActiveLock3Frame6 = function ( ChargerShotActiveLock3, event )
									local ChargerShotActiveLock3Frame7 = function ( ChargerShotActiveLock3, event )
										if not event.interrupted then
											ChargerShotActiveLock3:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
										end
										ChargerShotActiveLock3:setLeftRight( false, false, -199.79, -24.91 )
										ChargerShotActiveLock3:setTopBottom( false, false, -199.18, -21.32 )
										ChargerShotActiveLock3:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( ChargerShotActiveLock3, event )
										else
											ChargerShotActiveLock3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ChargerShotActiveLock3Frame7( ChargerShotActiveLock3, event )
										return 
									else
										ChargerShotActiveLock3:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
										ChargerShotActiveLock3:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock3Frame7 )
									end
								end
								
								if event.interrupted then
									ChargerShotActiveLock3Frame6( ChargerShotActiveLock3, event )
									return 
								else
									ChargerShotActiveLock3:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									ChargerShotActiveLock3:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock3Frame6 )
								end
							end
							
							if event.interrupted then
								ChargerShotActiveLock3Frame5( ChargerShotActiveLock3, event )
								return 
							else
								ChargerShotActiveLock3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ChargerShotActiveLock3:setAlpha( 0 )
								ChargerShotActiveLock3:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock3Frame5 )
							end
						end
						
						if event.interrupted then
							ChargerShotActiveLock3Frame4( ChargerShotActiveLock3, event )
							return 
						else
							ChargerShotActiveLock3:beginAnimation( "keyframe", 0, true, true, CoD.TweenType.Bounce )
							ChargerShotActiveLock3:setAlpha( 1 )
							ChargerShotActiveLock3:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock3Frame4 )
						end
					end
					
					if event.interrupted then
						ChargerShotActiveLock3Frame3( ChargerShotActiveLock3, event )
						return 
					else
						ChargerShotActiveLock3:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						ChargerShotActiveLock3:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock3Frame3 )
					end
				end
				
				ChargerShotActiveLock3:completeAnimation()
				self.ChargerShotActiveLock3:setLeftRight( false, false, -199.79, -24.91 )
				self.ChargerShotActiveLock3:setTopBottom( false, false, -199.18, -21.32 )
				self.ChargerShotActiveLock3:setAlpha( 0 )
				ChargerShotActiveLock3Frame2( ChargerShotActiveLock3, {} )
				local ChargerShotActiveLock10Frame2 = function ( ChargerShotActiveLock10, event )
					local ChargerShotActiveLock10Frame3 = function ( ChargerShotActiveLock10, event )
						local ChargerShotActiveLock10Frame4 = function ( ChargerShotActiveLock10, event )
							local ChargerShotActiveLock10Frame5 = function ( ChargerShotActiveLock10, event )
								local ChargerShotActiveLock10Frame6 = function ( ChargerShotActiveLock10, event )
									local ChargerShotActiveLock10Frame7 = function ( ChargerShotActiveLock10, event )
										if not event.interrupted then
											ChargerShotActiveLock10:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
										end
										ChargerShotActiveLock10:setLeftRight( false, false, -198.74, -23.91 )
										ChargerShotActiveLock10:setTopBottom( false, false, 27.3, 202.13 )
										ChargerShotActiveLock10:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( ChargerShotActiveLock10, event )
										else
											ChargerShotActiveLock10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ChargerShotActiveLock10Frame7( ChargerShotActiveLock10, event )
										return 
									else
										ChargerShotActiveLock10:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
										ChargerShotActiveLock10:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock10Frame7 )
									end
								end
								
								if event.interrupted then
									ChargerShotActiveLock10Frame6( ChargerShotActiveLock10, event )
									return 
								else
									ChargerShotActiveLock10:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									ChargerShotActiveLock10:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock10Frame6 )
								end
							end
							
							if event.interrupted then
								ChargerShotActiveLock10Frame5( ChargerShotActiveLock10, event )
								return 
							else
								ChargerShotActiveLock10:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ChargerShotActiveLock10:setAlpha( 0 )
								ChargerShotActiveLock10:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock10Frame5 )
							end
						end
						
						if event.interrupted then
							ChargerShotActiveLock10Frame4( ChargerShotActiveLock10, event )
							return 
						else
							ChargerShotActiveLock10:beginAnimation( "keyframe", 0, true, true, CoD.TweenType.Bounce )
							ChargerShotActiveLock10:setAlpha( 1 )
							ChargerShotActiveLock10:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock10Frame4 )
						end
					end
					
					if event.interrupted then
						ChargerShotActiveLock10Frame3( ChargerShotActiveLock10, event )
						return 
					else
						ChargerShotActiveLock10:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						ChargerShotActiveLock10:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock10Frame3 )
					end
				end
				
				ChargerShotActiveLock10:completeAnimation()
				self.ChargerShotActiveLock10:setLeftRight( false, false, -198.74, -23.91 )
				self.ChargerShotActiveLock10:setTopBottom( false, false, 27.3, 202.13 )
				self.ChargerShotActiveLock10:setAlpha( 0 )
				ChargerShotActiveLock10Frame2( ChargerShotActiveLock10, {} )
				local ChargerShotActiveLock20Frame2 = function ( ChargerShotActiveLock20, event )
					local ChargerShotActiveLock20Frame3 = function ( ChargerShotActiveLock20, event )
						local ChargerShotActiveLock20Frame4 = function ( ChargerShotActiveLock20, event )
							local ChargerShotActiveLock20Frame5 = function ( ChargerShotActiveLock20, event )
								local ChargerShotActiveLock20Frame6 = function ( ChargerShotActiveLock20, event )
									local ChargerShotActiveLock20Frame7 = function ( ChargerShotActiveLock20, event )
										if not event.interrupted then
											ChargerShotActiveLock20:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
										end
										ChargerShotActiveLock20:setLeftRight( false, false, 28.37, 199.01 )
										ChargerShotActiveLock20:setTopBottom( false, false, 28.3, 198.94 )
										ChargerShotActiveLock20:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( ChargerShotActiveLock20, event )
										else
											ChargerShotActiveLock20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ChargerShotActiveLock20Frame7( ChargerShotActiveLock20, event )
										return 
									else
										ChargerShotActiveLock20:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
										ChargerShotActiveLock20:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock20Frame7 )
									end
								end
								
								if event.interrupted then
									ChargerShotActiveLock20Frame6( ChargerShotActiveLock20, event )
									return 
								else
									ChargerShotActiveLock20:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									ChargerShotActiveLock20:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock20Frame6 )
								end
							end
							
							if event.interrupted then
								ChargerShotActiveLock20Frame5( ChargerShotActiveLock20, event )
								return 
							else
								ChargerShotActiveLock20:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ChargerShotActiveLock20:setAlpha( 0 )
								ChargerShotActiveLock20:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock20Frame5 )
							end
						end
						
						if event.interrupted then
							ChargerShotActiveLock20Frame4( ChargerShotActiveLock20, event )
							return 
						else
							ChargerShotActiveLock20:beginAnimation( "keyframe", 0, true, true, CoD.TweenType.Bounce )
							ChargerShotActiveLock20:setAlpha( 1 )
							ChargerShotActiveLock20:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock20Frame4 )
						end
					end
					
					if event.interrupted then
						ChargerShotActiveLock20Frame3( ChargerShotActiveLock20, event )
						return 
					else
						ChargerShotActiveLock20:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						ChargerShotActiveLock20:registerEventHandler( "transition_complete_keyframe", ChargerShotActiveLock20Frame3 )
					end
				end
				
				ChargerShotActiveLock20:completeAnimation()
				self.ChargerShotActiveLock20:setLeftRight( false, false, 28.37, 199.01 )
				self.ChargerShotActiveLock20:setTopBottom( false, false, 28.3, 198.94 )
				self.ChargerShotActiveLock20:setAlpha( 0 )
				ChargerShotActiveLock20Frame2( ChargerShotActiveLock20, {} )
				local ChargerShot4cornerlineFrame2 = function ( ChargerShot4cornerline, event )
					local ChargerShot4cornerlineFrame3 = function ( ChargerShot4cornerline, event )
						local ChargerShot4cornerlineFrame4 = function ( ChargerShot4cornerline, event )
							if not event.interrupted then
								ChargerShot4cornerline:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							ChargerShot4cornerline:setAlpha( 1 )
							ChargerShot4cornerline:setScale( 1 )
							if event.interrupted then
								self.clipFinished( ChargerShot4cornerline, event )
							else
								ChargerShot4cornerline:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ChargerShot4cornerlineFrame4( ChargerShot4cornerline, event )
							return 
						else
							ChargerShot4cornerline:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							ChargerShot4cornerline:setScale( 0.9 )
							ChargerShot4cornerline:registerEventHandler( "transition_complete_keyframe", ChargerShot4cornerlineFrame4 )
						end
					end
					
					if event.interrupted then
						ChargerShot4cornerlineFrame3( ChargerShot4cornerline, event )
						return 
					else
						ChargerShot4cornerline:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ChargerShot4cornerline:setScale( 0.7 )
						ChargerShot4cornerline:registerEventHandler( "transition_complete_keyframe", ChargerShot4cornerlineFrame3 )
					end
				end
				
				ChargerShot4cornerline:completeAnimation()
				self.ChargerShot4cornerline:setAlpha( 1 )
				self.ChargerShot4cornerline:setScale( 0.4 )
				ChargerShot4cornerlineFrame2( ChargerShot4cornerline, {} )
				local ChargerShot4cornerBracket0Frame2 = function ( ChargerShot4cornerBracket0, event )
					local ChargerShot4cornerBracket0Frame3 = function ( ChargerShot4cornerBracket0, event )
						local ChargerShot4cornerBracket0Frame4 = function ( ChargerShot4cornerBracket0, event )
							local ChargerShot4cornerBracket0Frame5 = function ( ChargerShot4cornerBracket0, event )
								if not event.interrupted then
									ChargerShot4cornerBracket0:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
								end
								ChargerShot4cornerBracket0:setAlpha( 1 )
								ChargerShot4cornerBracket0:setScale( 1.1 )
								if event.interrupted then
									self.clipFinished( ChargerShot4cornerBracket0, event )
								else
									ChargerShot4cornerBracket0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ChargerShot4cornerBracket0Frame5( ChargerShot4cornerBracket0, event )
								return 
							else
								ChargerShot4cornerBracket0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								ChargerShot4cornerBracket0:setScale( 1 )
								ChargerShot4cornerBracket0:registerEventHandler( "transition_complete_keyframe", ChargerShot4cornerBracket0Frame5 )
							end
						end
						
						if event.interrupted then
							ChargerShot4cornerBracket0Frame4( ChargerShot4cornerBracket0, event )
							return 
						else
							ChargerShot4cornerBracket0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							ChargerShot4cornerBracket0:setScale( 0.9 )
							ChargerShot4cornerBracket0:registerEventHandler( "transition_complete_keyframe", ChargerShot4cornerBracket0Frame4 )
						end
					end
					
					if event.interrupted then
						ChargerShot4cornerBracket0Frame3( ChargerShot4cornerBracket0, event )
						return 
					else
						ChargerShot4cornerBracket0:beginAnimation( "keyframe", 50, true, true, CoD.TweenType.Linear )
						ChargerShot4cornerBracket0:registerEventHandler( "transition_complete_keyframe", ChargerShot4cornerBracket0Frame3 )
					end
				end
				
				ChargerShot4cornerBracket0:completeAnimation()
				self.ChargerShot4cornerBracket0:setAlpha( 1 )
				self.ChargerShot4cornerBracket0:setScale( 0.8 )
				ChargerShot4cornerBracket0Frame2( ChargerShot4cornerBracket0, {} )
				ChargeShotCenterReticle0:completeAnimation()
				self.ChargeShotCenterReticle0:setAlpha( 0 )
				self.clipFinished( ChargeShotCenterReticle0, {} )
				ChargeShotSmallCenter10:completeAnimation()
				self.ChargeShotSmallCenter10:setRGB( 1, 1, 1 )
				self.ChargeShotSmallCenter10:setAlpha( 0 )
				self.clipFinished( ChargeShotSmallCenter10, {} )
				ChargeShotSmallCenter00:completeAnimation()
				self.ChargeShotSmallCenter00:setRGB( 1, 1, 1 )
				self.ChargeShotSmallCenter00:setAlpha( 0 )
				self.clipFinished( ChargeShotSmallCenter00, {} )
			end
		}
	}
	self:linkToElementModel( self, "weaponDelayFiring", true, function ( model )
		local f98_local0 = self
		if IsModelParameterValueEnum( model, Enum.WeaponFireEvent.WEAPON_EVENT_FIRING ) then
			PlayClip( self, "Fire", controller )
		elseif IsModelParameterValueEnum( model, Enum.WeaponFireEvent.WEAPON_EVENT_CANCELLED ) then
			PlayClip( self, "Cancel", controller )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChargeShotSmallCenter0:close()
		element.ChargeShotSmallCenter1:close()
		element.ChargeShotCenterReticle:close()
		element.ChargerShottopArrow1:close()
		element.ChargerShottopArrow2:close()
		element.ChargerShotMovingArrow1:close()
		element.ChargerShotMovingArrow2:close()
		element.ChargerShotReticleSide1:close()
		element.ChargerShotReticleSide2:close()
		element.ChargerShotActiveCenter:close()
		element.ChargerShotActiveLock0:close()
		element.ChargerShotActiveLock3:close()
		element.ChargerShotActiveLock10:close()
		element.ChargerShotActiveLock20:close()
		element.ChargerShot4cornerline:close()
		element.ChargerShot4cornerBracket0:close()
		element.ChargerShotBrackets:close()
		element.ChargeShotCenterReticle0:close()
		element.ChargeShotSmallCenter10:close()
		element.ChargeShotSmallCenter00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

