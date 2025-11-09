require( "ui.uieditor.widgets.CPLevels.RamsesStation.WoundedSoldiers.woundedSoldier_Panel" )
require( "ui.uieditor.widgets.CPLevels.RamsesStation.WoundedSoldiers.woundedSoldier_EKG" )
require( "ui.uieditor.widgets.CPLevels.RamsesStation.WoundedSoldiers.woundedSoldier_TextTitle" )
require( "ui.uieditor.widgets.CPLevels.RamsesStation.WoundedSoldiers.woundedSoldier_BPM" )
require( "ui.uieditor.widgets.CPLevels.RamsesStation.WoundedSoldiers.woundedSoldier_BP" )
require( "ui.uieditor.widgets.CPLevels.RamsesStation.WoundedSoldiers.woundedSoldier_DangerLines" )

local PostLoadFunc = function ( self, controller, menu )
	self.SetWaypointState = function ()
		
	end
	
end

CoD.woundedSoldierWidget = InheritFrom( LUI.UIElement )
CoD.woundedSoldierWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.woundedSoldierWidget )
	self.id = "woundedSoldierWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 160 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.woundedSoldier_Panel.new( menu, controller )
	Panel:setLeftRight( true, false, 0, 150 )
	Panel:setTopBottom( true, false, 6.34, 128 )
	Panel:setRGB( 0.89, 0.92, 0.95 )
	Panel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	Panel:setShaderVector( 0, 40, 10, 0, 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local LineR = LUI.UIImage.new()
	LineR:setLeftRight( true, false, 57, 126.33 )
	LineR:setTopBottom( true, false, 37, 127.67 )
	LineR:setRGB( 1, 1, 1 )
	LineR:setAlpha( 0 )
	LineR:setZoom( -4 )
	LineR:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_line" ) )
	LineR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineR )
	self.LineR = LineR
	
	local LineL = LUI.UIImage.new()
	LineL:setLeftRight( true, false, 24, 93.33 )
	LineL:setTopBottom( true, false, 37, 127.67 )
	LineL:setRGB( 1, 1, 1 )
	LineL:setAlpha( 0 )
	LineL:setYRot( -180 )
	LineL:setZoom( -4 )
	LineL:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_line" ) )
	LineL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineL )
	self.LineL = LineL
	
	local Pixel1 = LUI.UIImage.new()
	Pixel1:setLeftRight( true, false, 14.67, 25.34 )
	Pixel1:setTopBottom( true, false, 18, 28.67 )
	Pixel1:setRGB( 1, 1, 1 )
	Pixel1:setZoom( -2 )
	Pixel1:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_pixel" ) )
	Pixel1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel1 )
	self.Pixel1 = Pixel1
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( true, false, 126.67, 137.34 )
	Pixel2:setTopBottom( true, false, 18, 28.67 )
	Pixel2:setRGB( 1, 1, 1 )
	Pixel2:setZoom( -2 )
	Pixel2:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_pixel" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local Pixel3 = LUI.UIImage.new()
	Pixel3:setLeftRight( true, false, 6.67, 17.34 )
	Pixel3:setTopBottom( true, false, 106, 116.67 )
	Pixel3:setRGB( 1, 1, 1 )
	Pixel3:setZoom( -2 )
	Pixel3:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_pixel" ) )
	Pixel3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel3 )
	self.Pixel3 = Pixel3
	
	local Pixel4 = LUI.UIImage.new()
	Pixel4:setLeftRight( true, false, 135.67, 146.34 )
	Pixel4:setTopBottom( true, false, 106, 116.67 )
	Pixel4:setRGB( 1, 1, 1 )
	Pixel4:setZoom( -2 )
	Pixel4:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_pixel" ) )
	Pixel4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel4 )
	self.Pixel4 = Pixel4
	
	local Pixel5 = LUI.UIImage.new()
	Pixel5:setLeftRight( true, false, 70.67, 81.34 )
	Pixel5:setTopBottom( true, false, 148, 158.67 )
	Pixel5:setRGB( 1, 1, 1 )
	Pixel5:setZoom( -2 )
	Pixel5:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_pixel" ) )
	Pixel5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel5 )
	self.Pixel5 = Pixel5
	
	local ArrowD = LUI.UIImage.new()
	ArrowD:setLeftRight( true, false, 65, 86.33 )
	ArrowD:setTopBottom( true, false, 128, 146.67 )
	ArrowD:setRGB( 1, 1, 1 )
	ArrowD:setAlpha( 0.5 )
	ArrowD:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_arrowd" ) )
	ArrowD:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowD )
	self.ArrowD = ArrowD
	
	local ArrowT = LUI.UIImage.new()
	ArrowT:setLeftRight( true, false, 67.67, 83.67 )
	ArrowT:setTopBottom( true, false, 1, 11.67 )
	ArrowT:setRGB( 1, 1, 1 )
	ArrowT:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_arrowt" ) )
	ArrowT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowT )
	self.ArrowT = ArrowT
	
	local EKG = CoD.woundedSoldier_EKG.new( menu, controller )
	EKG:setLeftRight( true, false, -23.84, 169.25 )
	EKG:setTopBottom( true, false, 33, 99.67 )
	EKG:setRGB( 1, 1, 1 )
	EKG:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	EKG.EKGCritical:setRGB( 0, 0, 0 )
	EKG.EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
	EKG.EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
	EKG.EKGStable:setRGB( 0.84, 0.86, 0.92 )
	EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 3, 0.6 )
	EKG.EKGStable:setShaderVector( 1, 1, 2.2, -0.32, 0 )
	EKG.EKG2:setRGB( 0.36, 0.41, 0.52 )
	EKG.EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
	EKG.EKG3:setRGB( 0.37, 0.42, 0.54 )
	EKG.EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
	EKG.EKGBlur:setAlpha( 0 )
	EKG.EKG4:setRGB( 0.11, 0.15, 0.26 )
	EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
	self:addElement( EKG )
	self.EKG = EKG
	
	local TextTitle = CoD.woundedSoldier_TextTitle.new( menu, controller )
	TextTitle:setLeftRight( false, false, -45.67, 48.33 )
	TextTitle:setTopBottom( false, false, -69, -42.33 )
	TextTitle:setRGB( 1, 1, 1 )
	TextTitle:setZoom( 3 )
	TextTitle.TextLabel:setText( Engine.Localize( "STABLE" ) )
	self:addElement( TextTitle )
	self.TextTitle = TextTitle
	
	local BPM = CoD.woundedSoldier_BPM.new( menu, controller )
	BPM:setLeftRight( false, false, -47.67, -13 )
	BPM:setTopBottom( false, true, -75, -40.33 )
	BPM:setRGB( 1, 1, 1 )
	BPM:setAlpha( 0.97 )
	BPM:setZoom( 2 )
	BPM.HeartContainer:setRGB( 1, 1, 1 )
	BPM.TextLabel:setRGB( 1, 1, 1 )
	BPM.TextLabel:setText( Engine.Localize( "85" ) )
	self:addElement( BPM )
	self.BPM = BPM
	
	local BP = CoD.woundedSoldier_BP.new( menu, controller )
	BP:setLeftRight( false, false, -8.33, 50 )
	BP:setTopBottom( false, true, -65.67, -49.67 )
	BP:setRGB( 1, 1, 1 )
	BP.BP1text:setText( Engine.Localize( "115" ) )
	BP.BP2text:setText( Engine.Localize( "82" ) )
	self:addElement( BP )
	self.BP = BP
	
	local Critical2 = LUI.UIImage.new()
	Critical2:setLeftRight( true, false, 18, 135.33 )
	Critical2:setTopBottom( true, false, 52, 80 )
	Critical2:setRGB( 1, 1, 1 )
	Critical2:setAlpha( 0 )
	Critical2:setZoom( 4 )
	Critical2:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_critical" ) )
	Critical2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Critical2 )
	self.Critical2 = Critical2
	
	local Critical = LUI.UIImage.new()
	Critical:setLeftRight( true, false, 18, 135.33 )
	Critical:setTopBottom( true, false, 52, 80 )
	Critical:setRGB( 1, 1, 1 )
	Critical:setAlpha( 0 )
	Critical:setZoom( 4 )
	Critical:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_criticalshift" ) )
	Critical:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Critical )
	self.Critical = Critical
	
	local DangerMessage = CoD.woundedSoldier_DangerLines.new( menu, controller )
	DangerMessage:setLeftRight( true, false, 21.33, 96 )
	DangerMessage:setTopBottom( true, false, 90, 116.67 )
	DangerMessage:setRGB( 1, 1, 1 )
	DangerMessage:setAlpha( 0 )
	DangerMessage:setZoom( 2 )
	DangerMessage:linkToElementModel( self, nil, false, function ( model )
		DangerMessage:setModel( model, controller )
	end )
	self:addElement( DangerMessage )
	self.DangerMessage = DangerMessage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				LineR:completeAnimation()
				self.LineR:setRGB( 1, 1, 1 )
				self.LineR:setAlpha( 0 )
				self.clipFinished( LineR, {} )
				LineL:completeAnimation()
				self.LineL:setRGB( 1, 1, 1 )
				self.LineL:setAlpha( 0 )
				self.clipFinished( LineL, {} )
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( true, false, 69.67, 80.33 )
				self.Pixel1:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel1:setAlpha( 0 )
				self.clipFinished( Pixel1, {} )
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( true, false, 71, 81.67 )
				self.Pixel2:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel2:setAlpha( 0 )
				self.clipFinished( Pixel2, {} )
				Pixel3:completeAnimation()
				self.Pixel3:setLeftRight( true, false, 69.67, 80.33 )
				self.Pixel3:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel3:setAlpha( 0 )
				self.clipFinished( Pixel3, {} )
				Pixel4:completeAnimation()
				self.Pixel4:setLeftRight( true, false, 71, 81.67 )
				self.Pixel4:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel4:setAlpha( 0 )
				self.clipFinished( Pixel4, {} )
				Pixel5:completeAnimation()
				self.Pixel5:setLeftRight( true, false, 71, 81.67 )
				self.Pixel5:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel5:setAlpha( 0 )
				self.clipFinished( Pixel5, {} )
				ArrowD:completeAnimation()
				self.ArrowD:setRGB( 1, 1, 1 )
				self.ArrowD:setAlpha( 0 )
				self.clipFinished( ArrowD, {} )
				ArrowT:completeAnimation()
				self.ArrowT:setAlpha( 0 )
				self.clipFinished( ArrowT, {} )
				EKG:completeAnimation()
				self.EKG:setAlpha( 0 )
				self.EKG:setZoom( -12 )
				self.clipFinished( EKG, {} )
				TextTitle:completeAnimation()
				self.TextTitle:setAlpha( 0 )
				self.TextTitle:setZoom( -20 )
				self.clipFinished( TextTitle, {} )
				BPM:completeAnimation()
				self.BPM:setAlpha( 0 )
				self.clipFinished( BPM, {} )
				BP:completeAnimation()
				self.BP:setAlpha( 0 )
				self.clipFinished( BP, {} )
				Critical:completeAnimation()
				self.Critical:setAlpha( 0 )
				self.clipFinished( Critical, {} )
				DangerMessage:completeAnimation()
				self.DangerMessage:setAlpha( 0 )
				self.clipFinished( DangerMessage, {} )
			end,
			Stable = function ()
				self:setupElementClipCounter( 17 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
					end
					Panel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				PanelFrame2( Panel, {} )
				local LineRFrame2 = function ( LineR, event )
					local LineRFrame3 = function ( LineR, event )
						local LineRFrame4 = function ( LineR, event )
							local LineRFrame5 = function ( LineR, event )
								local LineRFrame6 = function ( LineR, event )
									local LineRFrame7 = function ( LineR, event )
										if not event.interrupted then
											LineR:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
										end
										LineR:setLeftRight( true, false, 57, 126.33 )
										LineR:setTopBottom( true, false, 37, 127.67 )
										LineR:setRGB( 1, 1, 1 )
										LineR:setAlpha( 0.2 )
										LineR:setZRot( 0 )
										LineR:setZoom( -4 )
										if event.interrupted then
											self.clipFinished( LineR, event )
										else
											LineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										LineRFrame7( LineR, event )
										return 
									else
										LineR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										LineR:setAlpha( 1 )
										LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame7 )
									end
								end
								
								if event.interrupted then
									LineRFrame6( LineR, event )
									return 
								else
									LineR:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame6 )
								end
							end
							
							if event.interrupted then
								LineRFrame5( LineR, event )
								return 
							else
								LineR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								LineR:setAlpha( 0 )
								LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame5 )
							end
						end
						
						if event.interrupted then
							LineRFrame4( LineR, event )
							return 
						else
							LineR:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame4 )
						end
					end
					
					if event.interrupted then
						LineRFrame3( LineR, event )
						return 
					else
						LineR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						LineR:setAlpha( 0.5 )
						LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame3 )
					end
				end
				
				LineR:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
				LineR:setLeftRight( true, false, 57, 126.33 )
				LineR:setTopBottom( true, false, 37, 127.67 )
				LineR:setRGB( 1, 1, 1 )
				LineR:setAlpha( 0 )
				LineR:setZRot( 0 )
				LineR:setZoom( -4 )
				LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame2 )
				local LineLFrame2 = function ( LineL, event )
					local LineLFrame3 = function ( LineL, event )
						local LineLFrame4 = function ( LineL, event )
							local LineLFrame5 = function ( LineL, event )
								local LineLFrame6 = function ( LineL, event )
									local LineLFrame7 = function ( LineL, event )
										if not event.interrupted then
											LineL:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
										end
										LineL:setLeftRight( true, false, 24, 93.33 )
										LineL:setTopBottom( true, false, 37, 127.67 )
										LineL:setRGB( 1, 1, 1 )
										LineL:setAlpha( 0.2 )
										LineL:setZRot( 0 )
										LineL:setZoom( -4 )
										if event.interrupted then
											self.clipFinished( LineL, event )
										else
											LineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										LineLFrame7( LineL, event )
										return 
									else
										LineL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										LineL:setAlpha( 1 )
										LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame7 )
									end
								end
								
								if event.interrupted then
									LineLFrame6( LineL, event )
									return 
								else
									LineL:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame6 )
								end
							end
							
							if event.interrupted then
								LineLFrame5( LineL, event )
								return 
							else
								LineL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								LineL:setAlpha( 0 )
								LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame5 )
							end
						end
						
						if event.interrupted then
							LineLFrame4( LineL, event )
							return 
						else
							LineL:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame4 )
						end
					end
					
					if event.interrupted then
						LineLFrame3( LineL, event )
						return 
					else
						LineL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						LineL:setAlpha( 0.5 )
						LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame3 )
					end
				end
				
				LineL:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
				LineL:setLeftRight( true, false, 24, 93.33 )
				LineL:setTopBottom( true, false, 37, 127.67 )
				LineL:setRGB( 1, 1, 1 )
				LineL:setAlpha( 0 )
				LineL:setZRot( 0 )
				LineL:setZoom( -4 )
				LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame2 )
				local Pixel1Frame2 = function ( Pixel1, event )
					local Pixel1Frame3 = function ( Pixel1, event )
						if not event.interrupted then
							Pixel1:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel1:setLeftRight( true, false, 14.66, 25.33 )
						Pixel1:setTopBottom( true, false, 18, 28.67 )
						Pixel1:setAlpha( 1 )
						Pixel1:setZoom( -2 )
						if event.interrupted then
							self.clipFinished( Pixel1, event )
						else
							Pixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel1Frame3( Pixel1, event )
						return 
					else
						Pixel1:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Back )
						Pixel1:setLeftRight( true, false, 70.88, 81.55 )
						Pixel1:setTopBottom( true, false, 20.57, 31.24 )
						Pixel1:setAlpha( 1 )
						Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame3 )
					end
				end
				
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( true, false, 69.67, 80.34 )
				self.Pixel1:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel1:setAlpha( 0 )
				self.Pixel1:setZoom( -2 )
				Pixel1Frame2( Pixel1, {} )
				local Pixel2Frame2 = function ( Pixel2, event )
					local Pixel2Frame3 = function ( Pixel2, event )
						if not event.interrupted then
							Pixel2:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel2:setLeftRight( true, false, 126.67, 137.34 )
						Pixel2:setTopBottom( true, false, 18, 28.67 )
						Pixel2:setAlpha( 1 )
						Pixel2:setZoom( -2 )
						if event.interrupted then
							self.clipFinished( Pixel2, event )
						else
							Pixel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel2Frame3( Pixel2, event )
						return 
					else
						Pixel2:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Back )
						Pixel2:setLeftRight( true, false, 70.88, 81.55 )
						Pixel2:setTopBottom( true, false, 20.57, 31.24 )
						Pixel2:setAlpha( 1 )
						Pixel2:registerEventHandler( "transition_complete_keyframe", Pixel2Frame3 )
					end
				end
				
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( true, false, 71, 81.67 )
				self.Pixel2:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel2:setAlpha( 0 )
				self.Pixel2:setZoom( -2 )
				Pixel2Frame2( Pixel2, {} )
				local Pixel3Frame2 = function ( Pixel3, event )
					local Pixel3Frame3 = function ( Pixel3, event )
						if not event.interrupted then
							Pixel3:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel3:setLeftRight( true, false, 6.66, 17.33 )
						Pixel3:setTopBottom( true, false, 106, 116.67 )
						Pixel3:setAlpha( 1 )
						Pixel3:setZoom( -2 )
						if event.interrupted then
							self.clipFinished( Pixel3, event )
						else
							Pixel3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel3Frame3( Pixel3, event )
						return 
					else
						Pixel3:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Back )
						Pixel3:setLeftRight( true, false, 69.66, 80.33 )
						Pixel3:setTopBottom( true, false, 109.37, 120.04 )
						Pixel3:setAlpha( 1 )
						Pixel3:registerEventHandler( "transition_complete_keyframe", Pixel3Frame3 )
					end
				end
				
				Pixel3:completeAnimation()
				self.Pixel3:setLeftRight( true, false, 69.67, 80.34 )
				self.Pixel3:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel3:setAlpha( 0 )
				self.Pixel3:setZoom( -2 )
				Pixel3Frame2( Pixel3, {} )
				local Pixel4Frame2 = function ( Pixel4, event )
					local Pixel4Frame3 = function ( Pixel4, event )
						if not event.interrupted then
							Pixel4:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel4:setLeftRight( true, false, 135.66, 146.34 )
						Pixel4:setTopBottom( true, false, 106, 116.67 )
						Pixel4:setAlpha( 1 )
						Pixel4:setZoom( -2 )
						if event.interrupted then
							self.clipFinished( Pixel4, event )
						else
							Pixel4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel4Frame3( Pixel4, event )
						return 
					else
						Pixel4:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						Pixel4:setAlpha( 1 )
						Pixel4:registerEventHandler( "transition_complete_keyframe", Pixel4Frame3 )
					end
				end
				
				Pixel4:completeAnimation()
				self.Pixel4:setLeftRight( true, false, 70.88, 81.55 )
				self.Pixel4:setTopBottom( true, false, 109.37, 120.04 )
				self.Pixel4:setAlpha( 0 )
				self.Pixel4:setZoom( -2 )
				Pixel4Frame2( Pixel4, {} )
				local Pixel5Frame2 = function ( Pixel5, event )
					local Pixel5Frame3 = function ( Pixel5, event )
						if not event.interrupted then
							Pixel5:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel5:setLeftRight( true, false, 70.67, 81.33 )
						Pixel5:setTopBottom( true, false, 148, 158.67 )
						Pixel5:setAlpha( 1 )
						Pixel5:setZoom( -2 )
						if event.interrupted then
							self.clipFinished( Pixel5, event )
						else
							Pixel5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel5Frame3( Pixel5, event )
						return 
					else
						Pixel5:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Back )
						Pixel5:setLeftRight( true, false, 70.88, 81.55 )
						Pixel5:setTopBottom( true, false, 141.07, 151.74 )
						Pixel5:setAlpha( 1 )
						Pixel5:registerEventHandler( "transition_complete_keyframe", Pixel5Frame3 )
					end
				end
				
				Pixel5:completeAnimation()
				self.Pixel5:setLeftRight( true, false, 71, 81.67 )
				self.Pixel5:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel5:setAlpha( 0 )
				self.Pixel5:setZoom( -2 )
				Pixel5Frame2( Pixel5, {} )
				local ArrowDFrame2 = function ( ArrowD, event )
					local ArrowDFrame3 = function ( ArrowD, event )
						local ArrowDFrame4 = function ( ArrowD, event )
							local ArrowDFrame5 = function ( ArrowD, event )
								local ArrowDFrame6 = function ( ArrowD, event )
									local ArrowDFrame7 = function ( ArrowD, event )
										if not event.interrupted then
											ArrowD:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										end
										ArrowD:setLeftRight( true, false, 65, 86.33 )
										ArrowD:setTopBottom( true, false, 128, 146.67 )
										ArrowD:setRGB( 1, 1, 1 )
										ArrowD:setAlpha( 1 )
										ArrowD:setXRot( 0 )
										ArrowD:setZoom( 0 )
										if event.interrupted then
											self.clipFinished( ArrowD, event )
										else
											ArrowD:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ArrowDFrame7( ArrowD, event )
										return 
									else
										ArrowD:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										ArrowD:setAlpha( 1 )
										ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame7 )
									end
								end
								
								if event.interrupted then
									ArrowDFrame6( ArrowD, event )
									return 
								else
									ArrowD:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowDFrame5( ArrowD, event )
								return 
							else
								ArrowD:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ArrowD:setAlpha( 0 )
								ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowDFrame4( ArrowD, event )
							return 
						else
							ArrowD:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowDFrame3( ArrowD, event )
						return 
					else
						ArrowD:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ArrowD:setAlpha( 0.5 )
						ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame3 )
					end
				end
				
				ArrowD:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
				ArrowD:setLeftRight( true, false, 65, 86.33 )
				ArrowD:setTopBottom( true, false, 128, 146.67 )
				ArrowD:setRGB( 1, 1, 1 )
				ArrowD:setAlpha( 0 )
				ArrowD:setXRot( 0 )
				ArrowD:setZoom( 0 )
				ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame2 )
				local ArrowTFrame2 = function ( ArrowT, event )
					local ArrowTFrame3 = function ( ArrowT, event )
						local ArrowTFrame4 = function ( ArrowT, event )
							local ArrowTFrame5 = function ( ArrowT, event )
								local ArrowTFrame6 = function ( ArrowT, event )
									local ArrowTFrame7 = function ( ArrowT, event )
										if not event.interrupted then
											ArrowT:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
										end
										ArrowT:setLeftRight( true, false, 67.67, 83.67 )
										ArrowT:setTopBottom( true, false, 1, 11.67 )
										ArrowT:setRGB( 1, 1, 1 )
										ArrowT:setAlpha( 1 )
										ArrowT:setXRot( 0 )
										ArrowT:setYRot( 0 )
										ArrowT:setZoom( 0 )
										if event.interrupted then
											self.clipFinished( ArrowT, event )
										else
											ArrowT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ArrowTFrame7( ArrowT, event )
										return 
									else
										ArrowT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										ArrowT:setAlpha( 1 )
										ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame7 )
									end
								end
								
								if event.interrupted then
									ArrowTFrame6( ArrowT, event )
									return 
								else
									ArrowT:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowTFrame5( ArrowT, event )
								return 
							else
								ArrowT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ArrowT:setAlpha( 0 )
								ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowTFrame4( ArrowT, event )
							return 
						else
							ArrowT:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowTFrame3( ArrowT, event )
						return 
					else
						ArrowT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						ArrowT:setAlpha( 0.5 )
						ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame3 )
					end
				end
				
				ArrowT:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				ArrowT:setLeftRight( true, false, 67.67, 83.67 )
				ArrowT:setTopBottom( true, false, 1, 11.67 )
				ArrowT:setRGB( 1, 1, 1 )
				ArrowT:setAlpha( 0 )
				ArrowT:setXRot( 0 )
				ArrowT:setYRot( 0 )
				ArrowT:setZoom( 0 )
				ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame2 )
				local EKGFrame2 = function ( EKG, event )
					local EKGFrame3 = function ( EKG, event )
						local EKGFrame4 = function ( EKG, event )
							local EKGFrame5 = function ( EKG, event )
								local EKGFrame6 = function ( EKG, event )
									local EKGFrame7 = function ( EKG, event )
										if not event.interrupted then
											EKG:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
											EKG.EKGCritical:beginAnimation( "subkeyframe", 349, false, false, CoD.TweenType.Linear )
											EKG.EKGStable:beginAnimation( "subkeyframe", 349, false, false, CoD.TweenType.Linear )
											EKG.EKG2:beginAnimation( "subkeyframe", 349, false, false, CoD.TweenType.Linear )
											EKG.EKG3:beginAnimation( "subkeyframe", 349, false, false, CoD.TweenType.Linear )
											EKG.EKGBlur:beginAnimation( "subkeyframe", 349, false, false, CoD.TweenType.Linear )
											EKG.EKG4:beginAnimation( "subkeyframe", 349, false, false, CoD.TweenType.Linear )
										end
										EKG:setAlpha( 1 )
										EKG:setZoom( 0 )
										EKG.EKGCritical:setRGB( 0, 0, 0 )
										EKG.EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
										EKG.EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
										EKG.EKGStable:setRGB( 0.84, 0.86, 0.92 )
										EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 3, 0.6 )
										EKG.EKGStable:setShaderVector( 1, 1, 2.2, -0.32, 0 )
										EKG.EKG2:setRGB( 0.36, 0.41, 0.52 )
										EKG.EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
										EKG.EKG3:setRGB( 0.37, 0.42, 0.54 )
										EKG.EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
										EKG.EKGBlur:setAlpha( 0 )
										EKG.EKG4:setRGB( 0.11, 0.15, 0.26 )
										EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
										if event.interrupted then
											self.clipFinished( EKG, event )
										else
											EKG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										EKGFrame7( EKG, event )
										return 
									else
										EKG:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										EKG:setAlpha( 1 )
										EKG:setZoom( 0 )
										EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame7 )
									end
								end
								
								if event.interrupted then
									EKGFrame6( EKG, event )
									return 
								else
									EKG:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									EKG:setAlpha( 0.1 )
									EKG:setZoom( -1.2 )
									EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame6 )
								end
							end
							
							if event.interrupted then
								EKGFrame5( EKG, event )
								return 
							else
								EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								EKG:setAlpha( 0 )
								EKG:setZoom( -4.8 )
								EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame5 )
							end
						end
						
						if event.interrupted then
							EKGFrame4( EKG, event )
							return 
						else
							EKG:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							EKG:setZoom( -6 )
							EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame4 )
						end
					end
					
					if event.interrupted then
						EKGFrame3( EKG, event )
						return 
					else
						EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						EKG:setAlpha( 0.5 )
						EKG:setZoom( -10.8 )
						EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame3 )
					end
				end
				
				EKG:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
				EKG.EKGCritical:beginAnimation( "subkeyframe", 439, false, false, CoD.TweenType.Linear )
				EKG.EKGStable:beginAnimation( "subkeyframe", 439, false, false, CoD.TweenType.Linear )
				EKG.EKG2:beginAnimation( "subkeyframe", 439, false, false, CoD.TweenType.Linear )
				EKG.EKG3:beginAnimation( "subkeyframe", 439, false, false, CoD.TweenType.Linear )
				EKG.EKGBlur:beginAnimation( "subkeyframe", 439, false, false, CoD.TweenType.Linear )
				EKG.EKG4:beginAnimation( "subkeyframe", 439, false, false, CoD.TweenType.Linear )
				EKG:setAlpha( 0 )
				EKG:setZoom( -12 )
				EKG.EKGCritical:setRGB( 0, 0, 0 )
				EKG.EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
				EKG.EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
				EKG.EKGStable:setRGB( 0.84, 0.86, 0.92 )
				EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 3, 0.6 )
				EKG.EKGStable:setShaderVector( 1, 1, 2.2, -0.32, 0 )
				EKG.EKG2:setRGB( 0.36, 0.41, 0.52 )
				EKG.EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
				EKG.EKG3:setRGB( 0.37, 0.42, 0.54 )
				EKG.EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
				EKG.EKGBlur:setAlpha( 0 )
				EKG.EKG4:setRGB( 0.11, 0.15, 0.26 )
				EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
				EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame2 )
				local TextTitleFrame2 = function ( TextTitle, event )
					local TextTitleFrame3 = function ( TextTitle, event )
						local TextTitleFrame4 = function ( TextTitle, event )
							local TextTitleFrame5 = function ( TextTitle, event )
								local TextTitleFrame6 = function ( TextTitle, event )
									local TextTitleFrame7 = function ( TextTitle, event )
										local TextTitleFrame8 = function ( TextTitle, event )
											local TextTitleFrame9 = function ( TextTitle, event )
												if not event.interrupted then
													TextTitle:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
													TextTitle.TextLabel:beginAnimation( "subkeyframe", 260, false, false, CoD.TweenType.Linear )
												end
												TextTitle:setRGB( 1, 1, 1 )
												TextTitle:setAlpha( 1 )
												TextTitle:setZoom( 3 )
												TextTitle.TextLabel:setText( Engine.Localize( "STABLE" ) )
												if event.interrupted then
													self.clipFinished( TextTitle, event )
												else
													TextTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												TextTitleFrame9( TextTitle, event )
												return 
											else
												TextTitle:beginAnimation( "keyframe", 169, false, true, CoD.TweenType.Back )
												TextTitle:setZoom( 3 )
												TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame9 )
											end
										end
										
										if event.interrupted then
											TextTitleFrame8( TextTitle, event )
											return 
										else
											TextTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											TextTitle:setAlpha( 1 )
											TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame8 )
										end
									end
									
									if event.interrupted then
										TextTitleFrame7( TextTitle, event )
										return 
									else
										TextTitle:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										TextTitle:setAlpha( 0.1 )
										TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame7 )
									end
								end
								
								if event.interrupted then
									TextTitleFrame6( TextTitle, event )
									return 
								else
									TextTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									TextTitle:setAlpha( 0 )
									TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame6 )
								end
							end
							
							if event.interrupted then
								TextTitleFrame5( TextTitle, event )
								return 
							else
								TextTitle:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame5 )
							end
						end
						
						if event.interrupted then
							TextTitleFrame4( TextTitle, event )
							return 
						else
							TextTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							TextTitle:setAlpha( 0.5 )
							TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame4 )
						end
					end
					
					if event.interrupted then
						TextTitleFrame3( TextTitle, event )
						return 
					else
						TextTitle:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame3 )
					end
				end
				
				TextTitle:completeAnimation()
				TextTitle.TextLabel:completeAnimation()
				self.TextTitle:setRGB( 1, 1, 1 )
				self.TextTitle:setAlpha( 0 )
				self.TextTitle:setZoom( -20 )
				self.TextTitle.TextLabel:setText( Engine.Localize( "STABLE" ) )
				TextTitleFrame2( TextTitle, {} )
				local BPMFrame2 = function ( BPM, event )
					local BPMFrame3 = function ( BPM, event )
						local BPMFrame4 = function ( BPM, event )
							local BPMFrame5 = function ( BPM, event )
								local BPMFrame6 = function ( BPM, event )
									local BPMFrame7 = function ( BPM, event )
										if not event.interrupted then
											BPM:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
											BPM.HeartContainer:beginAnimation( "subkeyframe", 179, false, false, CoD.TweenType.Linear )
											BPM.TextLabel:beginAnimation( "subkeyframe", 179, false, false, CoD.TweenType.Linear )
										end
										BPM:setLeftRight( false, false, -47.67, -13 )
										BPM:setTopBottom( false, true, -75, -40.33 )
										BPM:setAlpha( 1 )
										BPM:setZoom( 2 )
										BPM.HeartContainer:setRGB( 1, 1, 1 )
										BPM.TextLabel:setRGB( 1, 1, 1 )
										BPM.TextLabel:setText( Engine.Localize( "85" ) )
										if event.interrupted then
											self.clipFinished( BPM, event )
										else
											BPM:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										BPMFrame7( BPM, event )
										return 
									else
										BPM:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										BPM:setAlpha( 0.5 )
										BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame7 )
									end
								end
								
								if event.interrupted then
									BPMFrame6( BPM, event )
									return 
								else
									BPM:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									BPM:setAlpha( 1 )
									BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame6 )
								end
							end
							
							if event.interrupted then
								BPMFrame5( BPM, event )
								return 
							else
								BPM:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								BPM:setAlpha( 0 )
								BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame5 )
							end
						end
						
						if event.interrupted then
							BPMFrame4( BPM, event )
							return 
						else
							BPM:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame4 )
						end
					end
					
					if event.interrupted then
						BPMFrame3( BPM, event )
						return 
					else
						BPM:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						BPM:setAlpha( 0.5 )
						BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame3 )
					end
				end
				
				BPM:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				BPM.HeartContainer:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
				BPM.TextLabel:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
				BPM:setLeftRight( false, false, -47.67, -13 )
				BPM:setTopBottom( false, true, -75, -40.33 )
				BPM:setAlpha( 0 )
				BPM:setZoom( 2 )
				BPM.HeartContainer:setRGB( 1, 1, 1 )
				BPM.TextLabel:setRGB( 1, 1, 1 )
				BPM.TextLabel:setText( Engine.Localize( "85" ) )
				BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame2 )
				local BPFrame2 = function ( BP, event )
					local BPFrame3 = function ( BP, event )
						local BPFrame4 = function ( BP, event )
							local BPFrame5 = function ( BP, event )
								local BPFrame6 = function ( BP, event )
									local BPFrame7 = function ( BP, event )
										if not event.interrupted then
											BP:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
											BP.BP1text:beginAnimation( "subkeyframe", 89, false, false, CoD.TweenType.Linear )
											BP.BP2text:beginAnimation( "subkeyframe", 89, false, false, CoD.TweenType.Linear )
										end
										BP:setLeftRight( false, false, -8.33, 50 )
										BP:setTopBottom( false, true, -65.67, -49.67 )
										BP:setAlpha( 1 )
										BP:setZoom( 0 )
										BP.BP1text:setText( Engine.Localize( "115" ) )
										BP.BP2text:setText( Engine.Localize( "82" ) )
										if event.interrupted then
											self.clipFinished( BP, event )
										else
											BP:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										BPFrame7( BP, event )
										return 
									else
										BP:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										BP:setAlpha( 1 )
										BP:registerEventHandler( "transition_complete_keyframe", BPFrame7 )
									end
								end
								
								if event.interrupted then
									BPFrame6( BP, event )
									return 
								else
									BP:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									BP:registerEventHandler( "transition_complete_keyframe", BPFrame6 )
								end
							end
							
							if event.interrupted then
								BPFrame5( BP, event )
								return 
							else
								BP:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								BP:setAlpha( 0 )
								BP:registerEventHandler( "transition_complete_keyframe", BPFrame5 )
							end
						end
						
						if event.interrupted then
							BPFrame4( BP, event )
							return 
						else
							BP:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							BP:registerEventHandler( "transition_complete_keyframe", BPFrame4 )
						end
					end
					
					if event.interrupted then
						BPFrame3( BP, event )
						return 
					else
						BP:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						BP:setAlpha( 0.5 )
						BP:registerEventHandler( "transition_complete_keyframe", BPFrame3 )
					end
				end
				
				BP:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
				BP.BP1text:beginAnimation( "subkeyframe", 660, false, false, CoD.TweenType.Linear )
				BP.BP2text:beginAnimation( "subkeyframe", 660, false, false, CoD.TweenType.Linear )
				BP:setLeftRight( false, false, -8.33, 50 )
				BP:setTopBottom( false, true, -65.67, -49.67 )
				BP:setAlpha( 0 )
				BP:setZoom( 0 )
				BP.BP1text:setText( Engine.Localize( "115" ) )
				BP.BP2text:setText( Engine.Localize( "82" ) )
				BP:registerEventHandler( "transition_complete_keyframe", BPFrame2 )
				Critical2:completeAnimation()
				self.Critical2:setAlpha( 0 )
				self.clipFinished( Critical2, {} )
				Critical:completeAnimation()
				self.Critical:setAlpha( 0 )
				self.clipFinished( Critical, {} )
				local DangerMessageFrame2 = function ( DangerMessage, event )
					if not event.interrupted then
						DangerMessage:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					DangerMessage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DangerMessage, event )
					else
						DangerMessage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DangerMessage:completeAnimation()
				self.DangerMessage:setAlpha( 0 )
				DangerMessageFrame2( DangerMessage, {} )
			end,
			Critical = function ()
				self:setupElementClipCounter( 17 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
					end
					Panel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				PanelFrame2( Panel, {} )
				local LineRFrame2 = function ( LineR, event )
					local LineRFrame3 = function ( LineR, event )
						local LineRFrame4 = function ( LineR, event )
							local LineRFrame5 = function ( LineR, event )
								local LineRFrame6 = function ( LineR, event )
									if not event.interrupted then
										LineR:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									LineR:setLeftRight( true, false, 47, 116.33 )
									LineR:setTopBottom( true, false, 32, 122.67 )
									LineR:setRGB( 1, 0, 0 )
									LineR:setAlpha( 0.7 )
									LineR:setZRot( -10 )
									LineR:setZoom( -4 )
									if event.interrupted then
										self.clipFinished( LineR, event )
									else
										LineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LineRFrame6( LineR, event )
									return 
								else
									LineR:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									LineR:setRGB( 1, 0.08, 0.08 )
									LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame6 )
								end
							end
							
							if event.interrupted then
								LineRFrame5( LineR, event )
								return 
							else
								LineR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								LineR:setRGB( 1, 0.42, 0.42 )
								LineR:setAlpha( 0 )
								LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame5 )
							end
						end
						
						if event.interrupted then
							LineRFrame4( LineR, event )
							return 
						else
							LineR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							LineR:setRGB( 1, 0.5, 0.5 )
							LineR:setAlpha( 0.54 )
							LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame4 )
						end
					end
					
					if event.interrupted then
						LineRFrame3( LineR, event )
						return 
					else
						LineR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						LineR:setRGB( 1, 0.92, 0.92 )
						LineR:setAlpha( 0.5 )
						LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame3 )
					end
				end
				
				LineR:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				LineR:setLeftRight( true, false, 47, 116.33 )
				LineR:setTopBottom( true, false, 32, 122.67 )
				LineR:setRGB( 1, 1, 1 )
				LineR:setAlpha( 0 )
				LineR:setZRot( -10 )
				LineR:setZoom( -4 )
				LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame2 )
				local LineLFrame2 = function ( LineL, event )
					local LineLFrame3 = function ( LineL, event )
						local LineLFrame4 = function ( LineL, event )
							local LineLFrame5 = function ( LineL, event )
								local LineLFrame6 = function ( LineL, event )
									if not event.interrupted then
										LineL:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									LineL:setLeftRight( true, false, 34, 103.33 )
									LineL:setTopBottom( true, false, 32, 122.67 )
									LineL:setRGB( 1, 0, 0 )
									LineL:setAlpha( 0.7 )
									LineL:setZRot( -10 )
									LineL:setZoom( -4 )
									if event.interrupted then
										self.clipFinished( LineL, event )
									else
										LineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LineLFrame6( LineL, event )
									return 
								else
									LineL:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									LineL:setRGB( 1, 0.08, 0.08 )
									LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame6 )
								end
							end
							
							if event.interrupted then
								LineLFrame5( LineL, event )
								return 
							else
								LineL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								LineL:setRGB( 1, 0.42, 0.42 )
								LineL:setAlpha( 0 )
								LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame5 )
							end
						end
						
						if event.interrupted then
							LineLFrame4( LineL, event )
							return 
						else
							LineL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							LineL:setRGB( 1, 0.5, 0.5 )
							LineL:setAlpha( 0.54 )
							LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame4 )
						end
					end
					
					if event.interrupted then
						LineLFrame3( LineL, event )
						return 
					else
						LineL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						LineL:setRGB( 1, 0.92, 0.92 )
						LineL:setAlpha( 0.5 )
						LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame3 )
					end
				end
				
				LineL:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
				LineL:setLeftRight( true, false, 34, 103.33 )
				LineL:setTopBottom( true, false, 32, 122.67 )
				LineL:setRGB( 1, 1, 1 )
				LineL:setAlpha( 0 )
				LineL:setZRot( -10 )
				LineL:setZoom( -4 )
				LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame2 )
				local Pixel1Frame2 = function ( Pixel1, event )
					local Pixel1Frame3 = function ( Pixel1, event )
						if not event.interrupted then
							Pixel1:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel1:setLeftRight( true, false, 14.66, 25.33 )
						Pixel1:setTopBottom( true, false, 18, 28.67 )
						Pixel1:setAlpha( 1 )
						Pixel1:setZRot( 0 )
						Pixel1:setZoom( -2 )
						if event.interrupted then
							self.clipFinished( Pixel1, event )
						else
							Pixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel1Frame3( Pixel1, event )
						return 
					else
						Pixel1:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Back )
						Pixel1:setTopBottom( true, false, 20.57, 31.24 )
						Pixel1:setAlpha( 1.3 )
						Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame3 )
					end
				end
				
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( true, false, 69.67, 80.34 )
				self.Pixel1:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel1:setAlpha( 0 )
				self.Pixel1:setZRot( 0 )
				self.Pixel1:setZoom( -2 )
				Pixel1Frame2( Pixel1, {} )
				local Pixel2Frame2 = function ( Pixel2, event )
					local Pixel2Frame3 = function ( Pixel2, event )
						if not event.interrupted then
							Pixel2:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel2:setLeftRight( true, false, 126.67, 137.34 )
						Pixel2:setTopBottom( true, false, 18, 28.67 )
						Pixel2:setAlpha( 1 )
						Pixel2:setZoom( -2 )
						if event.interrupted then
							self.clipFinished( Pixel2, event )
						else
							Pixel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel2Frame3( Pixel2, event )
						return 
					else
						Pixel2:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Back )
						Pixel2:setLeftRight( true, false, 71.33, 82 )
						Pixel2:setTopBottom( true, false, 20.57, 31.24 )
						Pixel2:setAlpha( 1.3 )
						Pixel2:registerEventHandler( "transition_complete_keyframe", Pixel2Frame3 )
					end
				end
				
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( true, false, 71, 81.67 )
				self.Pixel2:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel2:setAlpha( 0 )
				self.Pixel2:setZoom( -2 )
				Pixel2Frame2( Pixel2, {} )
				local Pixel3Frame2 = function ( Pixel3, event )
					local Pixel3Frame3 = function ( Pixel3, event )
						if not event.interrupted then
							Pixel3:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel3:setLeftRight( true, false, 6.66, 17.33 )
						Pixel3:setTopBottom( true, false, 106, 116.67 )
						Pixel3:setAlpha( 1 )
						Pixel3:setZoom( -2 )
						if event.interrupted then
							self.clipFinished( Pixel3, event )
						else
							Pixel3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel3Frame3( Pixel3, event )
						return 
					else
						Pixel3:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Back )
						Pixel3:setLeftRight( true, false, 70.88, 81.55 )
						Pixel3:setTopBottom( true, false, 111.37, 122.04 )
						Pixel3:setAlpha( 1.3 )
						Pixel3:registerEventHandler( "transition_complete_keyframe", Pixel3Frame3 )
					end
				end
				
				Pixel3:completeAnimation()
				self.Pixel3:setLeftRight( true, false, 69.67, 80.34 )
				self.Pixel3:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel3:setAlpha( 0 )
				self.Pixel3:setZoom( -2 )
				Pixel3Frame2( Pixel3, {} )
				local Pixel4Frame2 = function ( Pixel4, event )
					local Pixel4Frame3 = function ( Pixel4, event )
						if not event.interrupted then
							Pixel4:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel4:setLeftRight( true, false, 135.66, 146.34 )
						Pixel4:setTopBottom( true, false, 106, 116.67 )
						Pixel4:setAlpha( 1 )
						Pixel4:setZoom( -2 )
						if event.interrupted then
							self.clipFinished( Pixel4, event )
						else
							Pixel4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel4Frame3( Pixel4, event )
						return 
					else
						Pixel4:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Back )
						Pixel4:setLeftRight( true, false, 71.33, 82 )
						Pixel4:setTopBottom( true, false, 111.37, 122.04 )
						Pixel4:setAlpha( 1.3 )
						Pixel4:registerEventHandler( "transition_complete_keyframe", Pixel4Frame3 )
					end
				end
				
				Pixel4:completeAnimation()
				self.Pixel4:setLeftRight( true, false, 71, 81.67 )
				self.Pixel4:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel4:setAlpha( 0 )
				self.Pixel4:setZoom( -2 )
				Pixel4Frame2( Pixel4, {} )
				local Pixel5Frame2 = function ( Pixel5, event )
					local Pixel5Frame3 = function ( Pixel5, event )
						if not event.interrupted then
							Pixel5:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel5:setLeftRight( true, false, 70.67, 81.33 )
						Pixel5:setTopBottom( true, false, 148, 158.67 )
						Pixel5:setAlpha( 1 )
						Pixel5:setZoom( -2 )
						if event.interrupted then
							self.clipFinished( Pixel5, event )
						else
							Pixel5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel5Frame3( Pixel5, event )
						return 
					else
						Pixel5:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Back )
						Pixel5:setLeftRight( true, false, 70.88, 81.55 )
						Pixel5:setTopBottom( true, false, 141.07, 151.74 )
						Pixel5:setAlpha( 1.3 )
						Pixel5:registerEventHandler( "transition_complete_keyframe", Pixel5Frame3 )
					end
				end
				
				Pixel5:completeAnimation()
				self.Pixel5:setLeftRight( true, false, 71, 81.67 )
				self.Pixel5:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel5:setAlpha( 0 )
				self.Pixel5:setZoom( -2 )
				Pixel5Frame2( Pixel5, {} )
				local ArrowDFrame2 = function ( ArrowD, event )
					local ArrowDFrame3 = function ( ArrowD, event )
						local ArrowDFrame4 = function ( ArrowD, event )
							local ArrowDFrame5 = function ( ArrowD, event )
								local ArrowDFrame6 = function ( ArrowD, event )
									if not event.interrupted then
										ArrowD:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									ArrowD:setLeftRight( true, false, 65, 86.33 )
									ArrowD:setTopBottom( true, false, 128, 146.67 )
									ArrowD:setRGB( 1, 0, 0 )
									ArrowD:setAlpha( 1 )
									ArrowD:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( ArrowD, event )
									else
										ArrowD:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ArrowDFrame6( ArrowD, event )
									return 
								else
									ArrowD:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									ArrowD:setRGB( 1, 0.09, 0.09 )
									ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowDFrame5( ArrowD, event )
								return 
							else
								ArrowD:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ArrowD:setRGB( 1, 0.45, 0.45 )
								ArrowD:setAlpha( 0 )
								ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowDFrame4( ArrowD, event )
							return 
						else
							ArrowD:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							ArrowD:setRGB( 1, 0.55, 0.55 )
							ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowDFrame3( ArrowD, event )
						return 
					else
						ArrowD:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ArrowD:setRGB( 1, 0.91, 0.91 )
						ArrowD:setAlpha( 0.5 )
						ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame3 )
					end
				end
				
				ArrowD:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
				ArrowD:setLeftRight( true, false, 65, 86.33 )
				ArrowD:setTopBottom( true, false, 128, 146.67 )
				ArrowD:setRGB( 1, 1, 1 )
				ArrowD:setAlpha( 0 )
				ArrowD:setZoom( 0 )
				ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame2 )
				local ArrowTFrame2 = function ( ArrowT, event )
					local ArrowTFrame3 = function ( ArrowT, event )
						local ArrowTFrame4 = function ( ArrowT, event )
							local ArrowTFrame5 = function ( ArrowT, event )
								local ArrowTFrame6 = function ( ArrowT, event )
									if not event.interrupted then
										ArrowT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									ArrowT:setLeftRight( true, false, 67.67, 83.67 )
									ArrowT:setTopBottom( true, false, 26.67, 37.33 )
									ArrowT:setAlpha( 1 )
									ArrowT:setXRot( -180 )
									ArrowT:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( ArrowT, event )
									else
										ArrowT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ArrowTFrame6( ArrowT, event )
									return 
								else
									ArrowT:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowTFrame5( ArrowT, event )
								return 
							else
								ArrowT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ArrowT:setAlpha( 0 )
								ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowTFrame4( ArrowT, event )
							return 
						else
							ArrowT:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowTFrame3( ArrowT, event )
						return 
					else
						ArrowT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ArrowT:setAlpha( 0.5 )
						ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame3 )
					end
				end
				
				ArrowT:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
				ArrowT:setLeftRight( true, false, 67.67, 83.67 )
				ArrowT:setTopBottom( true, false, 26.67, 37.33 )
				ArrowT:setAlpha( 0 )
				ArrowT:setXRot( -180 )
				ArrowT:setZoom( 0 )
				ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame2 )
				local EKGFrame2 = function ( EKG, event )
					local EKGFrame3 = function ( EKG, event )
						local EKGFrame4 = function ( EKG, event )
							local EKGFrame5 = function ( EKG, event )
								local EKGFrame6 = function ( EKG, event )
									if not event.interrupted then
										EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKGCritical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKGStable:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKG2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKG3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKGBlur:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKG4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									EKG:setAlpha( 1 )
									EKG:setZoom( 0 )
									EKG.EKGCritical:setRGB( 1, 0, 0.08 )
									EKG.EKGCritical:setShaderVector( 0, 2, 10.21, 4, 0.97 )
									EKG.EKGCritical:setShaderVector( 1, 0.18, 1, 0.05, 0 )
									EKG.EKGStable:setRGB( 1, 0.06, 0 )
									EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 4, 0.6 )
									EKG.EKGStable:setShaderVector( 1, 1.01, 4, -0.32, 0 )
									EKG.EKG2:setRGB( 0.75, 0, 0 )
									EKG.EKG2:setShaderVector( 1, 0.3, 0, 0, 0 )
									EKG.EKG3:setRGB( 1, 0, 0 )
									EKG.EKG3:setShaderVector( 1, 0.2, 0, 0, 0 )
									EKG.EKGBlur:setAlpha( 1 )
									EKG.EKG4:setRGB( 0.54, 0, 0 )
									EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
									if event.interrupted then
										self.clipFinished( EKG, event )
									else
										EKG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									EKGFrame6( EKG, event )
									return 
								else
									EKG:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									EKG:setZoom( -0.92 )
									EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame6 )
								end
							end
							
							if event.interrupted then
								EKGFrame5( EKG, event )
								return 
							else
								EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								EKG:setAlpha( 0 )
								EKG:setZoom( -5.54 )
								EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame5 )
							end
						end
						
						if event.interrupted then
							EKGFrame4( EKG, event )
							return 
						else
							EKG:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							EKG:setZoom( -6.46 )
							EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame4 )
						end
					end
					
					if event.interrupted then
						EKGFrame3( EKG, event )
						return 
					else
						EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						EKG:setAlpha( 0.5 )
						EKG:setZoom( -11.08 )
						EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame3 )
					end
				end
				
				EKG:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
				EKG.EKGCritical:beginAnimation( "subkeyframe", 379, false, false, CoD.TweenType.Linear )
				EKG.EKGStable:beginAnimation( "subkeyframe", 379, false, false, CoD.TweenType.Linear )
				EKG.EKG2:beginAnimation( "subkeyframe", 379, false, false, CoD.TweenType.Linear )
				EKG.EKG3:beginAnimation( "subkeyframe", 379, false, false, CoD.TweenType.Linear )
				EKG.EKGBlur:beginAnimation( "subkeyframe", 379, false, false, CoD.TweenType.Linear )
				EKG.EKG4:beginAnimation( "subkeyframe", 379, false, false, CoD.TweenType.Linear )
				EKG:setAlpha( 0 )
				EKG:setZoom( -12 )
				EKG.EKGCritical:setRGB( 1, 0, 0.08 )
				EKG.EKGCritical:setShaderVector( 0, 2, 10.21, 4, 0.97 )
				EKG.EKGCritical:setShaderVector( 1, 0.18, 1, 0.05, 0 )
				EKG.EKGStable:setRGB( 1, 0.06, 0 )
				EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 4, 0.6 )
				EKG.EKGStable:setShaderVector( 1, 1.01, 4, -0.32, 0 )
				EKG.EKG2:setRGB( 0.75, 0, 0 )
				EKG.EKG2:setShaderVector( 1, 0.3, 0, 0, 0 )
				EKG.EKG3:setRGB( 1, 0, 0 )
				EKG.EKG3:setShaderVector( 1, 0.2, 0, 0, 0 )
				EKG.EKGBlur:setAlpha( 1 )
				EKG.EKG4:setRGB( 0.54, 0, 0 )
				EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
				EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame2 )
				TextTitle:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
				TextTitle:setAlpha( 0 )
				TextTitle:setZoom( 3 )
				TextTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local BPMFrame2 = function ( BPM, event )
					local BPMFrame3 = function ( BPM, event )
						local BPMFrame4 = function ( BPM, event )
							local BPMFrame5 = function ( BPM, event )
								local BPMFrame6 = function ( BPM, event )
									if not event.interrupted then
										BPM:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										BPM.HeartContainer:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										BPM.TextLabel:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									end
									BPM:setLeftRight( false, false, 18.33, 53 )
									BPM:setTopBottom( false, true, -75, -40.33 )
									BPM:setAlpha( 1 )
									BPM.HeartContainer:setRGB( 1, 0, 0 )
									BPM.TextLabel:setRGB( 1, 1, 1 )
									BPM.TextLabel:setText( Engine.Localize( "176" ) )
									if event.interrupted then
										self.clipFinished( BPM, event )
									else
										BPM:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									BPMFrame6( BPM, event )
									return 
								else
									BPM:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame6 )
								end
							end
							
							if event.interrupted then
								BPMFrame5( BPM, event )
								return 
							else
								BPM:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								BPM:setAlpha( 0 )
								BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame5 )
							end
						end
						
						if event.interrupted then
							BPMFrame4( BPM, event )
							return 
						else
							BPM:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame4 )
						end
					end
					
					if event.interrupted then
						BPMFrame3( BPM, event )
						return 
					else
						BPM:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						BPM:setAlpha( 0.5 )
						BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame3 )
					end
				end
				
				BPM:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
				BPM.HeartContainer:beginAnimation( "subkeyframe", 550, false, false, CoD.TweenType.Linear )
				BPM.TextLabel:beginAnimation( "subkeyframe", 550, false, false, CoD.TweenType.Linear )
				BPM:setLeftRight( false, false, 18.33, 53 )
				BPM:setTopBottom( false, true, -75, -40.33 )
				BPM:setAlpha( 0 )
				BPM.HeartContainer:setRGB( 1, 0, 0 )
				BPM.TextLabel:setRGB( 1, 1, 1 )
				BPM.TextLabel:setText( Engine.Localize( "176" ) )
				BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame2 )
				local BPFrame2 = function ( BP, event )
					if not event.interrupted then
						BP:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
					end
					BP:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BP, event )
					else
						BP:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BP:completeAnimation()
				self.BP:setAlpha( 0 )
				BPFrame2( BP, {} )
				Critical2:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
				Critical2:setLeftRight( true, false, 18, 135.33 )
				Critical2:setTopBottom( true, false, 52, 80 )
				Critical2:setAlpha( 0 )
				Critical2:setZoom( 4 )
				Critical2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local CriticalFrame2 = function ( Critical, event )
					if not event.interrupted then
						Critical:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
					end
					Critical:setLeftRight( true, false, 18, 135.33 )
					Critical:setTopBottom( true, false, 52, 80 )
					Critical:setAlpha( 0 )
					Critical:setZoom( 4 )
					if event.interrupted then
						self.clipFinished( Critical, event )
					else
						Critical:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Critical:completeAnimation()
				self.Critical:setLeftRight( true, false, 18, 135.33 )
				self.Critical:setTopBottom( true, false, 52, 80 )
				self.Critical:setAlpha( 0 )
				self.Critical:setZoom( 4 )
				CriticalFrame2( Critical, {} )
				local DangerMessageFrame2 = function ( DangerMessage, event )
					local DangerMessageFrame3 = function ( DangerMessage, event )
						local DangerMessageFrame4 = function ( DangerMessage, event )
							local DangerMessageFrame5 = function ( DangerMessage, event )
								local DangerMessageFrame6 = function ( DangerMessage, event )
									if not event.interrupted then
										DangerMessage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									DangerMessage:setLeftRight( true, false, 21.33, 96 )
									DangerMessage:setTopBottom( true, false, 90, 116.67 )
									DangerMessage:setAlpha( 1 )
									DangerMessage:setZoom( 2 )
									if event.interrupted then
										self.clipFinished( DangerMessage, event )
									else
										DangerMessage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									DangerMessageFrame6( DangerMessage, event )
									return 
								else
									DangerMessage:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									DangerMessage:registerEventHandler( "transition_complete_keyframe", DangerMessageFrame6 )
								end
							end
							
							if event.interrupted then
								DangerMessageFrame5( DangerMessage, event )
								return 
							else
								DangerMessage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								DangerMessage:setAlpha( 0 )
								DangerMessage:registerEventHandler( "transition_complete_keyframe", DangerMessageFrame5 )
							end
						end
						
						if event.interrupted then
							DangerMessageFrame4( DangerMessage, event )
							return 
						else
							DangerMessage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							DangerMessage:registerEventHandler( "transition_complete_keyframe", DangerMessageFrame4 )
						end
					end
					
					if event.interrupted then
						DangerMessageFrame3( DangerMessage, event )
						return 
					else
						DangerMessage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						DangerMessage:setAlpha( 0.5 )
						DangerMessage:registerEventHandler( "transition_complete_keyframe", DangerMessageFrame3 )
					end
				end
				
				DangerMessage:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
				DangerMessage:setLeftRight( true, false, 21.33, 96 )
				DangerMessage:setTopBottom( true, false, 90, 116.67 )
				DangerMessage:setAlpha( 0 )
				DangerMessage:setZoom( 2 )
				DangerMessage:registerEventHandler( "transition_complete_keyframe", DangerMessageFrame2 )
			end,
			Serious = function ()
				self:setupElementClipCounter( 17 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 939, false, false, CoD.TweenType.Linear )
					end
					Panel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				PanelFrame2( Panel, {} )
				local LineRFrame2 = function ( LineR, event )
					local LineRFrame3 = function ( LineR, event )
						local LineRFrame4 = function ( LineR, event )
							local LineRFrame5 = function ( LineR, event )
								local LineRFrame6 = function ( LineR, event )
									if not event.interrupted then
										LineR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									LineR:setLeftRight( true, false, 57, 126.33 )
									LineR:setTopBottom( true, false, 37, 127.67 )
									LineR:setRGB( 1, 1, 1 )
									LineR:setAlpha( 0.2 )
									LineR:setZRot( 0 )
									LineR:setZoom( -4 )
									if event.interrupted then
										self.clipFinished( LineR, event )
									else
										LineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LineRFrame6( LineR, event )
									return 
								else
									LineR:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame6 )
								end
							end
							
							if event.interrupted then
								LineRFrame5( LineR, event )
								return 
							else
								LineR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								LineR:setAlpha( 0 )
								LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame5 )
							end
						end
						
						if event.interrupted then
							LineRFrame4( LineR, event )
							return 
						else
							LineR:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame4 )
						end
					end
					
					if event.interrupted then
						LineRFrame3( LineR, event )
						return 
					else
						LineR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						LineR:setAlpha( 0.5 )
						LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame3 )
					end
				end
				
				LineR:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
				LineR:setLeftRight( true, false, 57, 126.33 )
				LineR:setTopBottom( true, false, 37, 127.67 )
				LineR:setRGB( 1, 1, 1 )
				LineR:setAlpha( 0 )
				LineR:setZRot( 0 )
				LineR:setZoom( -4 )
				LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame2 )
				local LineLFrame2 = function ( LineL, event )
					local LineLFrame3 = function ( LineL, event )
						local LineLFrame4 = function ( LineL, event )
							local LineLFrame5 = function ( LineL, event )
								local LineLFrame6 = function ( LineL, event )
									if not event.interrupted then
										LineL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									LineL:setLeftRight( true, false, 24, 93.33 )
									LineL:setTopBottom( true, false, 37, 127.67 )
									LineL:setRGB( 1, 1, 1 )
									LineL:setAlpha( 0.2 )
									LineL:setZRot( 0 )
									LineL:setZoom( -4 )
									if event.interrupted then
										self.clipFinished( LineL, event )
									else
										LineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LineLFrame6( LineL, event )
									return 
								else
									LineL:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame6 )
								end
							end
							
							if event.interrupted then
								LineLFrame5( LineL, event )
								return 
							else
								LineL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								LineL:setAlpha( 0 )
								LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame5 )
							end
						end
						
						if event.interrupted then
							LineLFrame4( LineL, event )
							return 
						else
							LineL:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame4 )
						end
					end
					
					if event.interrupted then
						LineLFrame3( LineL, event )
						return 
					else
						LineL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						LineL:setAlpha( 0.5 )
						LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame3 )
					end
				end
				
				LineL:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Linear )
				LineL:setLeftRight( true, false, 24, 93.33 )
				LineL:setTopBottom( true, false, 37, 127.67 )
				LineL:setRGB( 1, 1, 1 )
				LineL:setAlpha( 0 )
				LineL:setZRot( 0 )
				LineL:setZoom( -4 )
				LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame2 )
				local Pixel1Frame2 = function ( Pixel1, event )
					local Pixel1Frame3 = function ( Pixel1, event )
						if not event.interrupted then
							Pixel1:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel1:setLeftRight( true, false, 14.66, 25.33 )
						Pixel1:setTopBottom( true, false, 18, 28.67 )
						Pixel1:setAlpha( 1 )
						Pixel1:setZoom( -2 )
						if event.interrupted then
							self.clipFinished( Pixel1, event )
						else
							Pixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel1Frame3( Pixel1, event )
						return 
					else
						Pixel1:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Back )
						Pixel1:setLeftRight( true, false, 71.33, 82.01 )
						Pixel1:setTopBottom( true, false, 22.33, 33 )
						Pixel1:setAlpha( 1.3 )
						Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame3 )
					end
				end
				
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( true, false, 69.67, 80.34 )
				self.Pixel1:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel1:setAlpha( 0 )
				self.Pixel1:setZoom( -2 )
				Pixel1Frame2( Pixel1, {} )
				local Pixel2Frame2 = function ( Pixel2, event )
					local Pixel2Frame3 = function ( Pixel2, event )
						if not event.interrupted then
							Pixel2:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel2:setLeftRight( true, false, 126.67, 137.34 )
						Pixel2:setTopBottom( true, false, 18, 28.67 )
						Pixel2:setAlpha( 1 )
						Pixel2:setZoom( -2 )
						if event.interrupted then
							self.clipFinished( Pixel2, event )
						else
							Pixel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel2Frame3( Pixel2, event )
						return 
					else
						Pixel2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						Pixel2:setLeftRight( true, false, 71.33, 82 )
						Pixel2:setTopBottom( true, false, 22.33, 33 )
						Pixel2:setAlpha( 1.3 )
						Pixel2:registerEventHandler( "transition_complete_keyframe", Pixel2Frame3 )
					end
				end
				
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( true, false, 71, 81.67 )
				self.Pixel2:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel2:setAlpha( 0 )
				self.Pixel2:setZoom( -2 )
				Pixel2Frame2( Pixel2, {} )
				local Pixel3Frame2 = function ( Pixel3, event )
					local Pixel3Frame3 = function ( Pixel3, event )
						if not event.interrupted then
							Pixel3:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel3:setLeftRight( true, false, 6.66, 17.33 )
						Pixel3:setTopBottom( true, false, 106, 116.67 )
						Pixel3:setAlpha( 1 )
						Pixel3:setZoom( -2 )
						if event.interrupted then
							self.clipFinished( Pixel3, event )
						else
							Pixel3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel3Frame3( Pixel3, event )
						return 
					else
						Pixel3:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Back )
						Pixel3:setLeftRight( true, false, 70.88, 81.55 )
						Pixel3:setTopBottom( true, false, 103.34, 114.01 )
						Pixel3:setAlpha( 1.3 )
						Pixel3:registerEventHandler( "transition_complete_keyframe", Pixel3Frame3 )
					end
				end
				
				Pixel3:completeAnimation()
				self.Pixel3:setLeftRight( true, false, 69.67, 80.34 )
				self.Pixel3:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel3:setAlpha( 0 )
				self.Pixel3:setZoom( -2 )
				Pixel3Frame2( Pixel3, {} )
				local Pixel4Frame2 = function ( Pixel4, event )
					local Pixel4Frame3 = function ( Pixel4, event )
						if not event.interrupted then
							Pixel4:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel4:setLeftRight( true, false, 135.66, 146.34 )
						Pixel4:setTopBottom( true, false, 106, 116.67 )
						Pixel4:setAlpha( 1 )
						Pixel4:setZoom( -2 )
						if event.interrupted then
							self.clipFinished( Pixel4, event )
						else
							Pixel4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel4Frame3( Pixel4, event )
						return 
					else
						Pixel4:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Back )
						Pixel4:setLeftRight( true, false, 71.33, 82 )
						Pixel4:setTopBottom( true, false, 103.34, 114.01 )
						Pixel4:setAlpha( 1.3 )
						Pixel4:registerEventHandler( "transition_complete_keyframe", Pixel4Frame3 )
					end
				end
				
				Pixel4:completeAnimation()
				self.Pixel4:setLeftRight( true, false, 71, 81.67 )
				self.Pixel4:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel4:setAlpha( 0 )
				self.Pixel4:setZoom( -2 )
				Pixel4Frame2( Pixel4, {} )
				local Pixel5Frame2 = function ( Pixel5, event )
					local Pixel5Frame3 = function ( Pixel5, event )
						if not event.interrupted then
							Pixel5:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel5:setLeftRight( true, false, 70.67, 81.33 )
						Pixel5:setTopBottom( true, false, 148, 158.67 )
						Pixel5:setAlpha( 1 )
						Pixel5:setZoom( -2 )
						if event.interrupted then
							self.clipFinished( Pixel5, event )
						else
							Pixel5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel5Frame3( Pixel5, event )
						return 
					else
						Pixel5:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Back )
						Pixel5:setLeftRight( true, false, 70.88, 81.55 )
						Pixel5:setTopBottom( true, false, 141.07, 151.74 )
						Pixel5:setAlpha( 1.3 )
						Pixel5:registerEventHandler( "transition_complete_keyframe", Pixel5Frame3 )
					end
				end
				
				Pixel5:completeAnimation()
				self.Pixel5:setLeftRight( true, false, 71, 81.67 )
				self.Pixel5:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel5:setAlpha( 0 )
				self.Pixel5:setZoom( -2 )
				Pixel5Frame2( Pixel5, {} )
				local ArrowDFrame2 = function ( ArrowD, event )
					local ArrowDFrame3 = function ( ArrowD, event )
						local ArrowDFrame4 = function ( ArrowD, event )
							local ArrowDFrame5 = function ( ArrowD, event )
								local ArrowDFrame6 = function ( ArrowD, event )
									if not event.interrupted then
										ArrowD:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									ArrowD:setLeftRight( true, false, 65, 86.33 )
									ArrowD:setTopBottom( true, false, 128, 146.67 )
									ArrowD:setRGB( 1, 1, 1 )
									ArrowD:setAlpha( 1 )
									ArrowD:setXRot( 0 )
									ArrowD:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( ArrowD, event )
									else
										ArrowD:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ArrowDFrame6( ArrowD, event )
									return 
								else
									ArrowD:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowDFrame5( ArrowD, event )
								return 
							else
								ArrowD:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ArrowD:setAlpha( 0 )
								ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowDFrame4( ArrowD, event )
							return 
						else
							ArrowD:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowDFrame3( ArrowD, event )
						return 
					else
						ArrowD:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ArrowD:setAlpha( 0.5 )
						ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame3 )
					end
				end
				
				ArrowD:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
				ArrowD:setLeftRight( true, false, 65, 86.33 )
				ArrowD:setTopBottom( true, false, 128, 146.67 )
				ArrowD:setRGB( 1, 1, 1 )
				ArrowD:setAlpha( 0 )
				ArrowD:setXRot( 0 )
				ArrowD:setZoom( 0 )
				ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame2 )
				local ArrowTFrame2 = function ( ArrowT, event )
					local ArrowTFrame3 = function ( ArrowT, event )
						local ArrowTFrame4 = function ( ArrowT, event )
							local ArrowTFrame5 = function ( ArrowT, event )
								local ArrowTFrame6 = function ( ArrowT, event )
									if not event.interrupted then
										ArrowT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									ArrowT:setLeftRight( true, false, 67.67, 83.67 )
									ArrowT:setTopBottom( true, false, 1, 11.67 )
									ArrowT:setRGB( 1, 1, 1 )
									ArrowT:setAlpha( 1 )
									ArrowT:setXRot( 0 )
									ArrowT:setYRot( 0 )
									ArrowT:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( ArrowT, event )
									else
										ArrowT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ArrowTFrame6( ArrowT, event )
									return 
								else
									ArrowT:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowTFrame5( ArrowT, event )
								return 
							else
								ArrowT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ArrowT:setAlpha( 0 )
								ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowTFrame4( ArrowT, event )
							return 
						else
							ArrowT:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowTFrame3( ArrowT, event )
						return 
					else
						ArrowT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						ArrowT:setAlpha( 0.5 )
						ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame3 )
					end
				end
				
				ArrowT:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				ArrowT:setLeftRight( true, false, 67.67, 83.67 )
				ArrowT:setTopBottom( true, false, 1, 11.67 )
				ArrowT:setRGB( 1, 1, 1 )
				ArrowT:setAlpha( 0 )
				ArrowT:setXRot( 0 )
				ArrowT:setYRot( 0 )
				ArrowT:setZoom( 0 )
				ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame2 )
				local EKGFrame2 = function ( EKG, event )
					local EKGFrame3 = function ( EKG, event )
						local EKGFrame4 = function ( EKG, event )
							local EKGFrame5 = function ( EKG, event )
								local EKGFrame6 = function ( EKG, event )
									if not event.interrupted then
										EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKGCritical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKGStable:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKG2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKG3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKGBlur:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKG4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									EKG:setAlpha( 1 )
									EKG:setZoom( 0 )
									EKG.EKGCritical:setRGB( 0, 0, 0 )
									EKG.EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
									EKG.EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
									EKG.EKGStable:setRGB( 1, 0.48, 0 )
									EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 6, 0.6 )
									EKG.EKGStable:setShaderVector( 1, 1, 2.2, -0.32, 0 )
									EKG.EKG2:setRGB( 0.42, 0.1, 0 )
									EKG.EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
									EKG.EKG3:setRGB( 0.53, 0.09, 0 )
									EKG.EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
									EKG.EKGBlur:setAlpha( 0 )
									EKG.EKG4:setRGB( 0.11, 0.15, 0.26 )
									EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
									if event.interrupted then
										self.clipFinished( EKG, event )
									else
										EKG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									EKGFrame6( EKG, event )
									return 
								else
									EKG:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									EKG:setZoom( -0.92 )
									EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame6 )
								end
							end
							
							if event.interrupted then
								EKGFrame5( EKG, event )
								return 
							else
								EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								EKG:setAlpha( 0 )
								EKG:setZoom( -5.54 )
								EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame5 )
							end
						end
						
						if event.interrupted then
							EKGFrame4( EKG, event )
							return 
						else
							EKG:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							EKG:setZoom( -6.46 )
							EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame4 )
						end
					end
					
					if event.interrupted then
						EKGFrame3( EKG, event )
						return 
					else
						EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						EKG:setAlpha( 0.5 )
						EKG:setZoom( -11.08 )
						EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame3 )
					end
				end
				
				EKG:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
				EKG.EKGCritical:beginAnimation( "subkeyframe", 430, false, false, CoD.TweenType.Linear )
				EKG.EKGStable:beginAnimation( "subkeyframe", 430, false, false, CoD.TweenType.Linear )
				EKG.EKG2:beginAnimation( "subkeyframe", 430, false, false, CoD.TweenType.Linear )
				EKG.EKG3:beginAnimation( "subkeyframe", 430, false, false, CoD.TweenType.Linear )
				EKG.EKGBlur:beginAnimation( "subkeyframe", 430, false, false, CoD.TweenType.Linear )
				EKG.EKG4:beginAnimation( "subkeyframe", 430, false, false, CoD.TweenType.Linear )
				EKG:setAlpha( 0 )
				EKG:setZoom( -12 )
				EKG.EKGCritical:setRGB( 0, 0, 0 )
				EKG.EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
				EKG.EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
				EKG.EKGStable:setRGB( 1, 0.48, 0 )
				EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 6, 0.6 )
				EKG.EKGStable:setShaderVector( 1, 1, 2.2, -0.32, 0 )
				EKG.EKG2:setRGB( 0.42, 0.1, 0 )
				EKG.EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
				EKG.EKG3:setRGB( 0.53, 0.09, 0 )
				EKG.EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
				EKG.EKGBlur:setAlpha( 0 )
				EKG.EKG4:setRGB( 0.11, 0.15, 0.26 )
				EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
				EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame2 )
				local TextTitleFrame2 = function ( TextTitle, event )
					local TextTitleFrame3 = function ( TextTitle, event )
						local TextTitleFrame4 = function ( TextTitle, event )
							local TextTitleFrame5 = function ( TextTitle, event )
								local TextTitleFrame6 = function ( TextTitle, event )
									if not event.interrupted then
										TextTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										TextTitle.TextLabel:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									TextTitle:setRGB( 1, 1, 1 )
									TextTitle:setAlpha( 1 )
									TextTitle:setZoom( 3 )
									TextTitle.TextLabel:setText( Engine.Localize( "SERIOUS" ) )
									if event.interrupted then
										self.clipFinished( TextTitle, event )
									else
										TextTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									TextTitleFrame6( TextTitle, event )
									return 
								else
									TextTitle:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									TextTitle:setZoom( 1.23 )
									TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame6 )
								end
							end
							
							if event.interrupted then
								TextTitleFrame5( TextTitle, event )
								return 
							else
								TextTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								TextTitle:setAlpha( 0 )
								TextTitle:setZoom( -7.62 )
								TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame5 )
							end
						end
						
						if event.interrupted then
							TextTitleFrame4( TextTitle, event )
							return 
						else
							TextTitle:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							TextTitle:setZoom( -9.38 )
							TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame4 )
						end
					end
					
					if event.interrupted then
						TextTitleFrame3( TextTitle, event )
						return 
					else
						TextTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						TextTitle:setAlpha( 0.5 )
						TextTitle:setZoom( -18.23 )
						TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame3 )
					end
				end
				
				TextTitle:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				TextTitle.TextLabel:beginAnimation( "subkeyframe", 280, false, false, CoD.TweenType.Linear )
				TextTitle:setRGB( 1, 1, 1 )
				TextTitle:setAlpha( 0 )
				TextTitle:setZoom( -20 )
				TextTitle.TextLabel:setText( Engine.Localize( "SERIOUS" ) )
				TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame2 )
				local BPMFrame2 = function ( BPM, event )
					local BPMFrame3 = function ( BPM, event )
						local BPMFrame4 = function ( BPM, event )
							local BPMFrame5 = function ( BPM, event )
								local BPMFrame6 = function ( BPM, event )
									if not event.interrupted then
										BPM:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										BPM.HeartContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										BPM.TextLabel:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									BPM:setLeftRight( false, false, -47.67, -13 )
									BPM:setTopBottom( false, true, -75, -40.33 )
									BPM:setAlpha( 1 )
									BPM:setZoom( 2 )
									BPM.HeartContainer:setRGB( 1, 1, 1 )
									BPM.TextLabel:setRGB( 1, 1, 1 )
									BPM.TextLabel:setText( Engine.Localize( "154" ) )
									if event.interrupted then
										self.clipFinished( BPM, event )
									else
										BPM:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									BPMFrame6( BPM, event )
									return 
								else
									BPM:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame6 )
								end
							end
							
							if event.interrupted then
								BPMFrame5( BPM, event )
								return 
							else
								BPM:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								BPM:setAlpha( 0 )
								BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame5 )
							end
						end
						
						if event.interrupted then
							BPMFrame4( BPM, event )
							return 
						else
							BPM:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame4 )
						end
					end
					
					if event.interrupted then
						BPMFrame3( BPM, event )
						return 
					else
						BPM:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						BPM:setAlpha( 0.5 )
						BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame3 )
					end
				end
				
				BPM:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
				BPM.HeartContainer:beginAnimation( "subkeyframe", 529, false, false, CoD.TweenType.Linear )
				BPM.TextLabel:beginAnimation( "subkeyframe", 529, false, false, CoD.TweenType.Linear )
				BPM:setLeftRight( false, false, -47.67, -13 )
				BPM:setTopBottom( false, true, -75, -40.33 )
				BPM:setAlpha( 0 )
				BPM:setZoom( 2 )
				BPM.HeartContainer:setRGB( 1, 1, 1 )
				BPM.TextLabel:setRGB( 1, 1, 1 )
				BPM.TextLabel:setText( Engine.Localize( "154" ) )
				BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame2 )
				local BPFrame2 = function ( BP, event )
					local BPFrame3 = function ( BP, event )
						local BPFrame4 = function ( BP, event )
							local BPFrame5 = function ( BP, event )
								local BPFrame6 = function ( BP, event )
									if not event.interrupted then
										BP:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										BP.BP1text:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										BP.BP2text:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									BP:setLeftRight( false, false, -8.33, 50 )
									BP:setTopBottom( false, true, -65.67, -49.67 )
									BP:setAlpha( 1 )
									BP:setZoom( 0 )
									BP.BP1text:setText( Engine.Localize( "80" ) )
									BP.BP2text:setText( Engine.Localize( "59" ) )
									if event.interrupted then
										self.clipFinished( BP, event )
									else
										BP:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									BPFrame6( BP, event )
									return 
								else
									BP:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									BP:registerEventHandler( "transition_complete_keyframe", BPFrame6 )
								end
							end
							
							if event.interrupted then
								BPFrame5( BP, event )
								return 
							else
								BP:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								BP:setAlpha( 0 )
								BP:registerEventHandler( "transition_complete_keyframe", BPFrame5 )
							end
						end
						
						if event.interrupted then
							BPFrame4( BP, event )
							return 
						else
							BP:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							BP:registerEventHandler( "transition_complete_keyframe", BPFrame4 )
						end
					end
					
					if event.interrupted then
						BPFrame3( BP, event )
						return 
					else
						BP:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						BP:setAlpha( 0.5 )
						BP:registerEventHandler( "transition_complete_keyframe", BPFrame3 )
					end
				end
				
				BP:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
				BP.BP1text:beginAnimation( "subkeyframe", 610, false, false, CoD.TweenType.Linear )
				BP.BP2text:beginAnimation( "subkeyframe", 610, false, false, CoD.TweenType.Linear )
				BP:setLeftRight( false, false, -8.33, 50 )
				BP:setTopBottom( false, true, -65.67, -49.67 )
				BP:setAlpha( 0 )
				BP:setZoom( 0 )
				BP.BP1text:setText( Engine.Localize( "80" ) )
				BP.BP2text:setText( Engine.Localize( "59" ) )
				BP:registerEventHandler( "transition_complete_keyframe", BPFrame2 )
				Critical2:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
				Critical2:setAlpha( 0 )
				Critical2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local CriticalFrame2 = function ( Critical, event )
					if not event.interrupted then
						Critical:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
					end
					Critical:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Critical, event )
					else
						Critical:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Critical:completeAnimation()
				self.Critical:setAlpha( 0 )
				CriticalFrame2( Critical, {} )
				local DangerMessageFrame2 = function ( DangerMessage, event )
					if not event.interrupted then
						DangerMessage:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
					end
					DangerMessage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DangerMessage, event )
					else
						DangerMessage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DangerMessage:completeAnimation()
				self.DangerMessage:setAlpha( 0 )
				DangerMessageFrame2( DangerMessage, {} )
			end
		},
		Stable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				self.clipFinished( Panel, {} )
				LineR:completeAnimation()
				self.LineR:setLeftRight( true, false, 57, 126.33 )
				self.LineR:setTopBottom( true, false, 37, 127.67 )
				self.LineR:setRGB( 1, 1, 1 )
				self.LineR:setAlpha( 0.2 )
				self.LineR:setZRot( 0 )
				self.LineR:setZoom( -4 )
				self.clipFinished( LineR, {} )
				LineL:completeAnimation()
				self.LineL:setLeftRight( true, false, 24, 93.33 )
				self.LineL:setTopBottom( true, false, 37, 127.67 )
				self.LineL:setRGB( 1, 1, 1 )
				self.LineL:setAlpha( 0.2 )
				self.LineL:setZRot( 0 )
				self.LineL:setZoom( -4 )
				self.clipFinished( LineL, {} )
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( true, false, 14.66, 25.33 )
				self.Pixel1:setTopBottom( true, false, 18, 28.67 )
				self.Pixel1:setAlpha( 1 )
				self.Pixel1:setZoom( -2 )
				self.clipFinished( Pixel1, {} )
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( true, false, 126.67, 137.34 )
				self.Pixel2:setTopBottom( true, false, 18, 28.67 )
				self.Pixel2:setAlpha( 1 )
				self.Pixel2:setZoom( -2 )
				self.clipFinished( Pixel2, {} )
				Pixel3:completeAnimation()
				self.Pixel3:setLeftRight( true, false, 6.66, 17.33 )
				self.Pixel3:setTopBottom( true, false, 106, 116.67 )
				self.Pixel3:setAlpha( 1 )
				self.Pixel3:setZoom( -2 )
				self.clipFinished( Pixel3, {} )
				Pixel4:completeAnimation()
				self.Pixel4:setLeftRight( true, false, 135.66, 146.34 )
				self.Pixel4:setTopBottom( true, false, 106, 116.67 )
				self.Pixel4:setAlpha( 1 )
				self.Pixel4:setZoom( -2 )
				self.clipFinished( Pixel4, {} )
				Pixel5:completeAnimation()
				self.Pixel5:setLeftRight( true, false, 70.67, 81.33 )
				self.Pixel5:setTopBottom( true, false, 148, 158.67 )
				self.Pixel5:setAlpha( 1 )
				self.Pixel5:setZoom( -2 )
				self.clipFinished( Pixel5, {} )
				ArrowD:completeAnimation()
				self.ArrowD:setLeftRight( true, false, 65, 86.33 )
				self.ArrowD:setTopBottom( true, false, 128, 146.67 )
				self.ArrowD:setRGB( 1, 1, 1 )
				self.ArrowD:setAlpha( 1 )
				self.ArrowD:setXRot( 0 )
				self.ArrowD:setZoom( 0 )
				self.clipFinished( ArrowD, {} )
				ArrowT:completeAnimation()
				self.ArrowT:setLeftRight( true, false, 67.67, 83.67 )
				self.ArrowT:setTopBottom( true, false, 1, 11.67 )
				self.ArrowT:setRGB( 1, 1, 1 )
				self.ArrowT:setAlpha( 1 )
				self.ArrowT:setXRot( 0 )
				self.ArrowT:setYRot( 0 )
				self.ArrowT:setZoom( 0 )
				self.clipFinished( ArrowT, {} )
				EKG:completeAnimation()
				EKG.EKGCritical:completeAnimation()
				EKG.EKGStable:completeAnimation()
				EKG.EKG2:completeAnimation()
				EKG.EKG3:completeAnimation()
				EKG.EKGBlur:completeAnimation()
				EKG.EKG4:completeAnimation()
				self.EKG:setAlpha( 1 )
				self.EKG:setZoom( 0 )
				self.EKG.EKGCritical:setRGB( 0, 0, 0 )
				self.EKG.EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
				self.EKG.EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
				self.EKG.EKGStable:setRGB( 0.84, 0.86, 0.92 )
				self.EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 3, 0.6 )
				self.EKG.EKGStable:setShaderVector( 1, 1, 2.2, -0.32, 0 )
				self.EKG.EKG2:setRGB( 0.36, 0.41, 0.52 )
				self.EKG.EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
				self.EKG.EKG3:setRGB( 0.37, 0.42, 0.54 )
				self.EKG.EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
				self.EKG.EKGBlur:setAlpha( 0 )
				self.EKG.EKG4:setRGB( 0.11, 0.15, 0.26 )
				self.EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
				self.clipFinished( EKG, {} )
				TextTitle:completeAnimation()
				TextTitle.TextLabel:completeAnimation()
				self.TextTitle:setRGB( 1, 1, 1 )
				self.TextTitle:setAlpha( 1 )
				self.TextTitle:setZoom( 3 )
				self.TextTitle.TextLabel:setText( Engine.Localize( "STABLE" ) )
				self.clipFinished( TextTitle, {} )
				local BPMFrame2 = function ( BPM, event )
					local BPMFrame3 = function ( BPM, event )
						local BPMFrame4 = function ( BPM, event )
							local BPMFrame5 = function ( BPM, event )
								local BPMFrame6 = function ( BPM, event )
									local BPMFrame7 = function ( BPM, event )
										local BPMFrame8 = function ( BPM, event )
											if not event.interrupted then
												BPM:beginAnimation( "keyframe", 3439, false, false, CoD.TweenType.Linear )
												BPM.HeartContainer:beginAnimation( "subkeyframe", 3439, false, false, CoD.TweenType.Linear )
												BPM.TextLabel:beginAnimation( "subkeyframe", 3439, false, false, CoD.TweenType.Linear )
											end
											BPM:setLeftRight( false, false, -47.67, -13 )
											BPM:setTopBottom( false, true, -75, -40.33 )
											BPM:setAlpha( 1 )
											BPM:setZoom( 2 )
											BPM.HeartContainer:setRGB( 1, 1, 1 )
											BPM.TextLabel:setRGB( 1, 1, 1 )
											BPM.TextLabel:setText( Engine.Localize( "85" ) )
											if event.interrupted then
												self.clipFinished( BPM, event )
											else
												BPM:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											BPMFrame8( BPM, event )
											return 
										else
											BPM:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											BPM.TextLabel:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
											BPM.TextLabel:setText( Engine.Localize( "85" ) )
											BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame8 )
										end
									end
									
									if event.interrupted then
										BPMFrame7( BPM, event )
										return 
									else
										BPM:beginAnimation( "keyframe", 6340, false, false, CoD.TweenType.Linear )
										BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame7 )
									end
								end
								
								if event.interrupted then
									BPMFrame6( BPM, event )
									return 
								else
									BPM:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									BPM.TextLabel:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
									BPM.TextLabel:setText( Engine.Localize( "84" ) )
									BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame6 )
								end
							end
							
							if event.interrupted then
								BPMFrame5( BPM, event )
								return 
							else
								BPM:beginAnimation( "keyframe", 5630, false, false, CoD.TweenType.Linear )
								BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame5 )
							end
						end
						
						if event.interrupted then
							BPMFrame4( BPM, event )
							return 
						else
							BPM:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							BPM.TextLabel:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
							BPM.TextLabel:setText( Engine.Localize( "83" ) )
							BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame4 )
						end
					end
					
					if event.interrupted then
						BPMFrame3( BPM, event )
						return 
					else
						BPM:beginAnimation( "keyframe", 2640, false, false, CoD.TweenType.Linear )
						BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame3 )
					end
				end
				
				BPM:completeAnimation()
				BPM.HeartContainer:completeAnimation()
				BPM.TextLabel:completeAnimation()
				self.BPM:setLeftRight( false, false, -47.67, -13 )
				self.BPM:setTopBottom( false, true, -75, -40.33 )
				self.BPM:setAlpha( 1 )
				self.BPM:setZoom( 2 )
				self.BPM.HeartContainer:setRGB( 1, 1, 1 )
				self.BPM.TextLabel:setRGB( 1, 1, 1 )
				self.BPM.TextLabel:setText( Engine.Localize( "85" ) )
				BPMFrame2( BPM, {} )
				local BPFrame2 = function ( BP, event )
					local BPFrame3 = function ( BP, event )
						local BPFrame4 = function ( BP, event )
							local BPFrame5 = function ( BP, event )
								local BPFrame6 = function ( BP, event )
									local BPFrame7 = function ( BP, event )
										local BPFrame8 = function ( BP, event )
											local BPFrame9 = function ( BP, event )
												local BPFrame10 = function ( BP, event )
													local BPFrame11 = function ( BP, event )
														local BPFrame12 = function ( BP, event )
															local BPFrame13 = function ( BP, event )
																if not event.interrupted then
																	BP:beginAnimation( "keyframe", 1060, false, false, CoD.TweenType.Linear )
																	BP.BP1text:beginAnimation( "subkeyframe", 1060, false, false, CoD.TweenType.Linear )
																	BP.BP2text:beginAnimation( "subkeyframe", 1060, false, false, CoD.TweenType.Linear )
																end
																BP:setLeftRight( false, false, -8.33, 50 )
																BP:setTopBottom( false, true, -65.67, -49.67 )
																BP:setAlpha( 1 )
																BP:setZoom( 0 )
																BP.BP1text:setText( Engine.Localize( "115" ) )
																BP.BP2text:setText( Engine.Localize( "81" ) )
																if event.interrupted then
																	self.clipFinished( BP, event )
																else
																	BP:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																BPFrame13( BP, event )
																return 
															else
																BP:beginAnimation( "keyframe", 1899, false, false, CoD.TweenType.Linear )
																BP.BP1text:beginAnimation( "subkeyframe", 1899, false, false, CoD.TweenType.Linear )
																BP.BP1text:setText( Engine.Localize( "114" ) )
																BP:registerEventHandler( "transition_complete_keyframe", BPFrame13 )
															end
														end
														
														if event.interrupted then
															BPFrame12( BP, event )
															return 
														else
															BP:beginAnimation( "keyframe", 4220, false, false, CoD.TweenType.Linear )
															BP:registerEventHandler( "transition_complete_keyframe", BPFrame12 )
														end
													end
													
													if event.interrupted then
														BPFrame11( BP, event )
														return 
													else
														BP:beginAnimation( "keyframe", 2309, false, false, CoD.TweenType.Linear )
														BP.BP1text:beginAnimation( "subkeyframe", 2309, false, false, CoD.TweenType.Linear )
														BP.BP1text:setText( Engine.Localize( "113" ) )
														BP:registerEventHandler( "transition_complete_keyframe", BPFrame11 )
													end
												end
												
												if event.interrupted then
													BPFrame10( BP, event )
													return 
												else
													BP:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													BP.BP2text:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
													BP.BP2text:setText( Engine.Localize( "81" ) )
													BP:registerEventHandler( "transition_complete_keyframe", BPFrame10 )
												end
											end
											
											if event.interrupted then
												BPFrame9( BP, event )
												return 
											else
												BP:beginAnimation( "keyframe", 949, false, false, CoD.TweenType.Linear )
												BP:registerEventHandler( "transition_complete_keyframe", BPFrame9 )
											end
										end
										
										if event.interrupted then
											BPFrame8( BP, event )
											return 
										else
											BP:beginAnimation( "keyframe", 2080, false, false, CoD.TweenType.Linear )
											BP.BP1text:beginAnimation( "subkeyframe", 2080, false, false, CoD.TweenType.Linear )
											BP.BP1text:setText( Engine.Localize( "114" ) )
											BP:registerEventHandler( "transition_complete_keyframe", BPFrame8 )
										end
									end
									
									if event.interrupted then
										BPFrame7( BP, event )
										return 
									else
										BP:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
										BP.BP1text:beginAnimation( "subkeyframe", 1009, false, false, CoD.TweenType.Linear )
										BP.BP1text:setText( Engine.Localize( "115" ) )
										BP:registerEventHandler( "transition_complete_keyframe", BPFrame7 )
									end
								end
								
								if event.interrupted then
									BPFrame6( BP, event )
									return 
								else
									BP:beginAnimation( "keyframe", 2289, false, false, CoD.TweenType.Linear )
									BP.BP1text:beginAnimation( "subkeyframe", 2289, false, false, CoD.TweenType.Linear )
									BP.BP1text:setText( Engine.Localize( "116" ) )
									BP:registerEventHandler( "transition_complete_keyframe", BPFrame6 )
								end
							end
							
							if event.interrupted then
								BPFrame5( BP, event )
								return 
							else
								BP:beginAnimation( "keyframe", 840, false, false, CoD.TweenType.Linear )
								BP.BP1text:beginAnimation( "subkeyframe", 840, false, false, CoD.TweenType.Linear )
								BP.BP1text:setText( Engine.Localize( "117" ) )
								BP:registerEventHandler( "transition_complete_keyframe", BPFrame5 )
							end
						end
						
						if event.interrupted then
							BPFrame4( BP, event )
							return 
						else
							BP:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							BP.BP1text:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
							BP.BP1text:setText( Engine.Localize( "116" ) )
							BP:registerEventHandler( "transition_complete_keyframe", BPFrame4 )
						end
					end
					
					if event.interrupted then
						BPFrame3( BP, event )
						return 
					else
						BP:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
						BP:registerEventHandler( "transition_complete_keyframe", BPFrame3 )
					end
				end
				
				BP:completeAnimation()
				BP.BP1text:completeAnimation()
				BP.BP2text:completeAnimation()
				self.BP:setLeftRight( false, false, -8.33, 50 )
				self.BP:setTopBottom( false, true, -65.67, -49.67 )
				self.BP:setAlpha( 1 )
				self.BP:setZoom( 0 )
				self.BP.BP1text:setText( Engine.Localize( "115" ) )
				self.BP.BP2text:setText( Engine.Localize( "82" ) )
				BPFrame2( BP, {} )
				Critical2:completeAnimation()
				self.Critical2:setAlpha( 0 )
				self.clipFinished( Critical2, {} )
				Critical:completeAnimation()
				self.Critical:setAlpha( 0 )
				self.clipFinished( Critical, {} )
				DangerMessage:completeAnimation()
				self.DangerMessage:setAlpha( 0 )
				self.clipFinished( DangerMessage, {} )
				self.nextClip = "DefaultClip"
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 17 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
					end
					Panel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				PanelFrame2( Panel, {} )
				local LineRFrame2 = function ( LineR, event )
					local LineRFrame3 = function ( LineR, event )
						local LineRFrame4 = function ( LineR, event )
							local LineRFrame5 = function ( LineR, event )
								local LineRFrame6 = function ( LineR, event )
									if not event.interrupted then
										LineR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									LineR:setLeftRight( true, false, 57, 126.33 )
									LineR:setTopBottom( true, false, 37, 127.67 )
									LineR:setRGB( 1, 1, 1 )
									LineR:setAlpha( 0 )
									LineR:setZRot( 0 )
									LineR:setZoom( -4 )
									if event.interrupted then
										self.clipFinished( LineR, event )
									else
										LineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LineRFrame6( LineR, event )
									return 
								else
									LineR:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame6 )
								end
							end
							
							if event.interrupted then
								LineRFrame5( LineR, event )
								return 
							else
								LineR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								LineR:setAlpha( 0.5 )
								LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame5 )
							end
						end
						
						if event.interrupted then
							LineRFrame4( LineR, event )
							return 
						else
							LineR:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame4 )
						end
					end
					
					if event.interrupted then
						LineRFrame3( LineR, event )
						return 
					else
						LineR:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						LineR:setAlpha( 0 )
						LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame3 )
					end
				end
				
				LineR:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
				LineR:setLeftRight( true, false, 57, 126.33 )
				LineR:setTopBottom( true, false, 37, 127.67 )
				LineR:setRGB( 1, 1, 1 )
				LineR:setAlpha( 0.2 )
				LineR:setZRot( 0 )
				LineR:setZoom( -4 )
				LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame2 )
				local LineLFrame2 = function ( LineL, event )
					local LineLFrame3 = function ( LineL, event )
						local LineLFrame4 = function ( LineL, event )
							local LineLFrame5 = function ( LineL, event )
								local LineLFrame6 = function ( LineL, event )
									if not event.interrupted then
										LineL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									LineL:setLeftRight( true, false, 24, 93.33 )
									LineL:setTopBottom( true, false, 37, 127.67 )
									LineL:setRGB( 1, 1, 1 )
									LineL:setAlpha( 0 )
									LineL:setZRot( 0 )
									LineL:setZoom( -4 )
									if event.interrupted then
										self.clipFinished( LineL, event )
									else
										LineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LineLFrame6( LineL, event )
									return 
								else
									LineL:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame6 )
								end
							end
							
							if event.interrupted then
								LineLFrame5( LineL, event )
								return 
							else
								LineL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								LineL:setAlpha( 0.5 )
								LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame5 )
							end
						end
						
						if event.interrupted then
							LineLFrame4( LineL, event )
							return 
						else
							LineL:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame4 )
						end
					end
					
					if event.interrupted then
						LineLFrame3( LineL, event )
						return 
					else
						LineL:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						LineL:setAlpha( 0 )
						LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame3 )
					end
				end
				
				LineL:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
				LineL:setLeftRight( true, false, 24, 93.33 )
				LineL:setTopBottom( true, false, 37, 127.67 )
				LineL:setRGB( 1, 1, 1 )
				LineL:setAlpha( 0.2 )
				LineL:setZRot( 0 )
				LineL:setZoom( -4 )
				LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame2 )
				local Pixel1Frame2 = function ( Pixel1, event )
					if not event.interrupted then
						Pixel1:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Linear )
					end
					Pixel1:setLeftRight( true, false, 69.67, 80.33 )
					Pixel1:setTopBottom( true, false, 137.34, 148.01 )
					Pixel1:setAlpha( 0 )
					Pixel1:setZoom( -2 )
					if event.interrupted then
						self.clipFinished( Pixel1, event )
					else
						Pixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel1:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Pixel1:setLeftRight( true, false, 14.67, 25.34 )
				Pixel1:setTopBottom( true, false, 18, 28.67 )
				Pixel1:setAlpha( 1 )
				Pixel1:setZoom( -2 )
				Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame2 )
				local Pixel2Frame2 = function ( Pixel2, event )
					if not event.interrupted then
						Pixel2:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Linear )
					end
					Pixel2:setLeftRight( true, false, 71, 81.67 )
					Pixel2:setTopBottom( true, false, 137.34, 148.01 )
					Pixel2:setAlpha( 0 )
					Pixel2:setZoom( -2 )
					if event.interrupted then
						self.clipFinished( Pixel2, event )
					else
						Pixel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel2:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Pixel2:setLeftRight( true, false, 126.67, 137.34 )
				Pixel2:setTopBottom( true, false, 18, 28.67 )
				Pixel2:setAlpha( 1 )
				Pixel2:setZoom( -2 )
				Pixel2:registerEventHandler( "transition_complete_keyframe", Pixel2Frame2 )
				local Pixel3Frame2 = function ( Pixel3, event )
					if not event.interrupted then
						Pixel3:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Linear )
					end
					Pixel3:setLeftRight( true, false, 69.67, 80.33 )
					Pixel3:setTopBottom( true, false, 137.34, 148.01 )
					Pixel3:setAlpha( 0 )
					Pixel3:setZoom( -2 )
					if event.interrupted then
						self.clipFinished( Pixel3, event )
					else
						Pixel3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel3:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Pixel3:setLeftRight( true, false, 6.67, 17.34 )
				Pixel3:setTopBottom( true, false, 106, 116.67 )
				Pixel3:setAlpha( 1 )
				Pixel3:setZoom( -2 )
				Pixel3:registerEventHandler( "transition_complete_keyframe", Pixel3Frame2 )
				local Pixel4Frame2 = function ( Pixel4, event )
					if not event.interrupted then
						Pixel4:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Linear )
					end
					Pixel4:setLeftRight( true, false, 71, 81.67 )
					Pixel4:setTopBottom( true, false, 137.34, 148.01 )
					Pixel4:setAlpha( 0 )
					Pixel4:setZoom( -2 )
					if event.interrupted then
						self.clipFinished( Pixel4, event )
					else
						Pixel4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel4:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Pixel4:setLeftRight( true, false, 135.67, 146.34 )
				Pixel4:setTopBottom( true, false, 106, 116.67 )
				Pixel4:setAlpha( 1 )
				Pixel4:setZoom( -2 )
				Pixel4:registerEventHandler( "transition_complete_keyframe", Pixel4Frame2 )
				local Pixel5Frame2 = function ( Pixel5, event )
					if not event.interrupted then
						Pixel5:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Linear )
					end
					Pixel5:setLeftRight( true, false, 71, 81.67 )
					Pixel5:setTopBottom( true, false, 137.34, 148.01 )
					Pixel5:setAlpha( 0 )
					Pixel5:setZoom( -2 )
					if event.interrupted then
						self.clipFinished( Pixel5, event )
					else
						Pixel5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel5:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Pixel5:setLeftRight( true, false, 70.67, 81.34 )
				Pixel5:setTopBottom( true, false, 148, 158.67 )
				Pixel5:setAlpha( 1 )
				Pixel5:setZoom( -2 )
				Pixel5:registerEventHandler( "transition_complete_keyframe", Pixel5Frame2 )
				local ArrowDFrame2 = function ( ArrowD, event )
					local ArrowDFrame3 = function ( ArrowD, event )
						local ArrowDFrame4 = function ( ArrowD, event )
							local ArrowDFrame5 = function ( ArrowD, event )
								local ArrowDFrame6 = function ( ArrowD, event )
									if not event.interrupted then
										ArrowD:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									ArrowD:setLeftRight( true, false, 65, 86.33 )
									ArrowD:setTopBottom( true, false, 128, 146.67 )
									ArrowD:setRGB( 1, 1, 1 )
									ArrowD:setAlpha( 0 )
									ArrowD:setXRot( 0 )
									ArrowD:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( ArrowD, event )
									else
										ArrowD:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ArrowDFrame6( ArrowD, event )
									return 
								else
									ArrowD:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowDFrame5( ArrowD, event )
								return 
							else
								ArrowD:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								ArrowD:setAlpha( 0.5 )
								ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowDFrame4( ArrowD, event )
							return 
						else
							ArrowD:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowDFrame3( ArrowD, event )
						return 
					else
						ArrowD:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ArrowD:setAlpha( 0 )
						ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame3 )
					end
				end
				
				ArrowD:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
				ArrowD:setLeftRight( true, false, 65, 86.33 )
				ArrowD:setTopBottom( true, false, 128, 146.67 )
				ArrowD:setRGB( 1, 1, 1 )
				ArrowD:setAlpha( 1 )
				ArrowD:setXRot( 0 )
				ArrowD:setZoom( 0 )
				ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame2 )
				local ArrowTFrame2 = function ( ArrowT, event )
					local ArrowTFrame3 = function ( ArrowT, event )
						local ArrowTFrame4 = function ( ArrowT, event )
							local ArrowTFrame5 = function ( ArrowT, event )
								local ArrowTFrame6 = function ( ArrowT, event )
									if not event.interrupted then
										ArrowT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									ArrowT:setLeftRight( true, false, 67.67, 83.67 )
									ArrowT:setTopBottom( true, false, 1, 11.67 )
									ArrowT:setRGB( 1, 1, 1 )
									ArrowT:setAlpha( 0 )
									ArrowT:setXRot( 0 )
									ArrowT:setYRot( 0 )
									ArrowT:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( ArrowT, event )
									else
										ArrowT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ArrowTFrame6( ArrowT, event )
									return 
								else
									ArrowT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowTFrame5( ArrowT, event )
								return 
							else
								ArrowT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								ArrowT:setAlpha( 0.5 )
								ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowTFrame4( ArrowT, event )
							return 
						else
							ArrowT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowTFrame3( ArrowT, event )
						return 
					else
						ArrowT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ArrowT:setAlpha( 0 )
						ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame3 )
					end
				end
				
				ArrowT:completeAnimation()
				self.ArrowT:setLeftRight( true, false, 67.67, 83.67 )
				self.ArrowT:setTopBottom( true, false, 1, 11.67 )
				self.ArrowT:setRGB( 1, 1, 1 )
				self.ArrowT:setAlpha( 1 )
				self.ArrowT:setXRot( 0 )
				self.ArrowT:setYRot( 0 )
				self.ArrowT:setZoom( 0 )
				ArrowTFrame2( ArrowT, {} )
				local EKGFrame2 = function ( EKG, event )
					local EKGFrame3 = function ( EKG, event )
						local EKGFrame4 = function ( EKG, event )
							local EKGFrame5 = function ( EKG, event )
								local EKGFrame6 = function ( EKG, event )
									if not event.interrupted then
										EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKGCritical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKGStable:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKG2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKG3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKGBlur:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EKG.EKG4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									EKG:setAlpha( 0 )
									EKG:setZoom( -12 )
									EKG.EKGCritical:setRGB( 0, 0, 0 )
									EKG.EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
									EKG.EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
									EKG.EKGStable:setRGB( 0.84, 0.86, 0.92 )
									EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 3, 0.6 )
									EKG.EKGStable:setShaderVector( 1, 1, 2.2, -0.32, 0 )
									EKG.EKG2:setRGB( 0.36, 0.41, 0.52 )
									EKG.EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
									EKG.EKG3:setRGB( 0.37, 0.42, 0.54 )
									EKG.EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
									EKG.EKGBlur:setAlpha( 0 )
									EKG.EKG4:setRGB( 0.11, 0.15, 0.26 )
									EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
									if event.interrupted then
										self.clipFinished( EKG, event )
									else
										EKG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									EKGFrame6( EKG, event )
									return 
								else
									EKG:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									EKG:setZoom( -10.91 )
									EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame6 )
								end
							end
							
							if event.interrupted then
								EKGFrame5( EKG, event )
								return 
							else
								EKG:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								EKG:setAlpha( 0.5 )
								EKG:setZoom( -7.64 )
								EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame5 )
							end
						end
						
						if event.interrupted then
							EKGFrame4( EKG, event )
							return 
						else
							EKG:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							EKG:setZoom( -6.55 )
							EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame4 )
						end
					end
					
					if event.interrupted then
						EKGFrame3( EKG, event )
						return 
					else
						EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						EKG:setAlpha( 0 )
						EKG:setZoom( -1.09 )
						EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame3 )
					end
				end
				
				EKG:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
				EKG.EKGCritical:beginAnimation( "subkeyframe", 180, false, false, CoD.TweenType.Linear )
				EKG.EKGStable:beginAnimation( "subkeyframe", 180, false, false, CoD.TweenType.Linear )
				EKG.EKG2:beginAnimation( "subkeyframe", 180, false, false, CoD.TweenType.Linear )
				EKG.EKG3:beginAnimation( "subkeyframe", 180, false, false, CoD.TweenType.Linear )
				EKG.EKGBlur:beginAnimation( "subkeyframe", 180, false, false, CoD.TweenType.Linear )
				EKG.EKG4:beginAnimation( "subkeyframe", 180, false, false, CoD.TweenType.Linear )
				EKG:setAlpha( 1 )
				EKG:setZoom( 0 )
				EKG.EKGCritical:setRGB( 0, 0, 0 )
				EKG.EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
				EKG.EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
				EKG.EKGStable:setRGB( 0.84, 0.86, 0.92 )
				EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 3, 0.6 )
				EKG.EKGStable:setShaderVector( 1, 1, 2.2, -0.32, 0 )
				EKG.EKG2:setRGB( 0.36, 0.41, 0.52 )
				EKG.EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
				EKG.EKG3:setRGB( 0.37, 0.42, 0.54 )
				EKG.EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
				EKG.EKGBlur:setAlpha( 0 )
				EKG.EKG4:setRGB( 0.11, 0.15, 0.26 )
				EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
				EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame2 )
				local TextTitleFrame2 = function ( TextTitle, event )
					local TextTitleFrame3 = function ( TextTitle, event )
						local TextTitleFrame4 = function ( TextTitle, event )
							local TextTitleFrame5 = function ( TextTitle, event )
								local TextTitleFrame6 = function ( TextTitle, event )
									if not event.interrupted then
										TextTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										TextTitle.TextLabel:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									TextTitle:setRGB( 1, 1, 1 )
									TextTitle:setAlpha( 0 )
									TextTitle:setZoom( -20 )
									TextTitle.TextLabel:setText( Engine.Localize( "STABLE" ) )
									if event.interrupted then
										self.clipFinished( TextTitle, event )
									else
										TextTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									TextTitleFrame6( TextTitle, event )
									return 
								else
									TextTitle:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									TextTitle:setZoom( -17.91 )
									TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame6 )
								end
							end
							
							if event.interrupted then
								TextTitleFrame5( TextTitle, event )
								return 
							else
								TextTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								TextTitle:setAlpha( 0.5 )
								TextTitle:setZoom( -9.55 )
								TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame5 )
							end
						end
						
						if event.interrupted then
							TextTitleFrame4( TextTitle, event )
							return 
						else
							TextTitle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							TextTitle:setZoom( -7.45 )
							TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame4 )
						end
					end
					
					if event.interrupted then
						TextTitleFrame3( TextTitle, event )
						return 
					else
						TextTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						TextTitle:setAlpha( 0 )
						TextTitle:setZoom( 0.91 )
						TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame3 )
					end
				end
				
				TextTitle:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				TextTitle.TextLabel:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
				TextTitle:setRGB( 1, 1, 1 )
				TextTitle:setAlpha( 1 )
				TextTitle:setZoom( 3 )
				TextTitle.TextLabel:setText( Engine.Localize( "STABLE" ) )
				TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame2 )
				local BPMFrame2 = function ( BPM, event )
					local BPMFrame3 = function ( BPM, event )
						local BPMFrame4 = function ( BPM, event )
							local BPMFrame5 = function ( BPM, event )
								local BPMFrame6 = function ( BPM, event )
									if not event.interrupted then
										BPM:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										BPM.HeartContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										BPM.TextLabel:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									BPM:setLeftRight( false, false, -47.67, -13 )
									BPM:setTopBottom( false, true, -75, -40.33 )
									BPM:setAlpha( 0 )
									BPM:setZoom( 2 )
									BPM.HeartContainer:setRGB( 1, 1, 1 )
									BPM.TextLabel:setRGB( 1, 1, 1 )
									BPM.TextLabel:setText( Engine.Localize( "85" ) )
									if event.interrupted then
										self.clipFinished( BPM, event )
									else
										BPM:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									BPMFrame6( BPM, event )
									return 
								else
									BPM:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame6 )
								end
							end
							
							if event.interrupted then
								BPMFrame5( BPM, event )
								return 
							else
								BPM:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								BPM:setAlpha( 0.5 )
								BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame5 )
							end
						end
						
						if event.interrupted then
							BPMFrame4( BPM, event )
							return 
						else
							BPM:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame4 )
						end
					end
					
					if event.interrupted then
						BPMFrame3( BPM, event )
						return 
					else
						BPM:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						BPM:setAlpha( 0 )
						BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame3 )
					end
				end
				
				BPM:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				BPM.HeartContainer:beginAnimation( "subkeyframe", 280, false, false, CoD.TweenType.Linear )
				BPM.TextLabel:beginAnimation( "subkeyframe", 280, false, false, CoD.TweenType.Linear )
				BPM:setLeftRight( false, false, -47.67, -13 )
				BPM:setTopBottom( false, true, -75, -40.33 )
				BPM:setAlpha( 1 )
				BPM:setZoom( 2 )
				BPM.HeartContainer:setRGB( 1, 1, 1 )
				BPM.TextLabel:setRGB( 1, 1, 1 )
				BPM.TextLabel:setText( Engine.Localize( "85" ) )
				BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame2 )
				local BPFrame2 = function ( BP, event )
					local BPFrame3 = function ( BP, event )
						local BPFrame4 = function ( BP, event )
							local BPFrame5 = function ( BP, event )
								local BPFrame6 = function ( BP, event )
									if not event.interrupted then
										BP:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										BP.BP1text:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										BP.BP2text:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									BP:setLeftRight( false, false, -8.33, 50 )
									BP:setTopBottom( false, true, -65.67, -49.67 )
									BP:setAlpha( 0 )
									BP:setZoom( 0 )
									BP.BP1text:setText( Engine.Localize( "115" ) )
									BP.BP2text:setText( Engine.Localize( "82" ) )
									if event.interrupted then
										self.clipFinished( BP, event )
									else
										BP:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									BPFrame6( BP, event )
									return 
								else
									BP:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									BP:registerEventHandler( "transition_complete_keyframe", BPFrame6 )
								end
							end
							
							if event.interrupted then
								BPFrame5( BP, event )
								return 
							else
								BP:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								BP:setAlpha( 0.5 )
								BP:registerEventHandler( "transition_complete_keyframe", BPFrame5 )
							end
						end
						
						if event.interrupted then
							BPFrame4( BP, event )
							return 
						else
							BP:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							BP:registerEventHandler( "transition_complete_keyframe", BPFrame4 )
						end
					end
					
					if event.interrupted then
						BPFrame3( BP, event )
						return 
					else
						BP:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						BP:setAlpha( 0 )
						BP:registerEventHandler( "transition_complete_keyframe", BPFrame3 )
					end
				end
				
				BP:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
				BP.BP1text:beginAnimation( "subkeyframe", 360, false, false, CoD.TweenType.Linear )
				BP.BP2text:beginAnimation( "subkeyframe", 360, false, false, CoD.TweenType.Linear )
				BP:setLeftRight( false, false, -8.33, 50 )
				BP:setTopBottom( false, true, -65.67, -49.67 )
				BP:setAlpha( 1 )
				BP:setZoom( 0 )
				BP.BP1text:setText( Engine.Localize( "115" ) )
				BP.BP2text:setText( Engine.Localize( "82" ) )
				BP:registerEventHandler( "transition_complete_keyframe", BPFrame2 )
				Critical2:completeAnimation()
				self.Critical2:setAlpha( 0 )
				self.clipFinished( Critical2, {} )
				local CriticalFrame2 = function ( Critical, event )
					if not event.interrupted then
						Critical:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					Critical:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Critical, event )
					else
						Critical:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Critical:completeAnimation()
				self.Critical:setAlpha( 0 )
				CriticalFrame2( Critical, {} )
				local DangerMessageFrame2 = function ( DangerMessage, event )
					if not event.interrupted then
						DangerMessage:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					DangerMessage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DangerMessage, event )
					else
						DangerMessage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DangerMessage:completeAnimation()
				self.DangerMessage:setAlpha( 0 )
				DangerMessageFrame2( DangerMessage, {} )
			end
		},
		Serious = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				self.clipFinished( Panel, {} )
				LineR:completeAnimation()
				self.LineR:setLeftRight( true, false, 57, 126.33 )
				self.LineR:setTopBottom( true, false, 37, 127.67 )
				self.LineR:setRGB( 1, 1, 1 )
				self.LineR:setAlpha( 0.2 )
				self.LineR:setZRot( 0 )
				self.LineR:setZoom( -4 )
				self.clipFinished( LineR, {} )
				LineL:completeAnimation()
				self.LineL:setLeftRight( true, false, 24, 93.33 )
				self.LineL:setTopBottom( true, false, 37, 127.67 )
				self.LineL:setRGB( 1, 1, 1 )
				self.LineL:setAlpha( 0.2 )
				self.LineL:setZRot( 0 )
				self.LineL:setZoom( -4 )
				self.clipFinished( LineL, {} )
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( true, false, 14.66, 25.33 )
				self.Pixel1:setTopBottom( true, false, 18, 28.67 )
				self.Pixel1:setAlpha( 1 )
				self.Pixel1:setZoom( -2 )
				self.clipFinished( Pixel1, {} )
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( true, false, 126.67, 137.34 )
				self.Pixel2:setTopBottom( true, false, 18, 28.67 )
				self.Pixel2:setAlpha( 1 )
				self.Pixel2:setZoom( -2 )
				self.clipFinished( Pixel2, {} )
				Pixel3:completeAnimation()
				self.Pixel3:setLeftRight( true, false, 6.66, 17.33 )
				self.Pixel3:setTopBottom( true, false, 106, 116.67 )
				self.Pixel3:setAlpha( 1 )
				self.Pixel3:setZoom( -2 )
				self.clipFinished( Pixel3, {} )
				Pixel4:completeAnimation()
				self.Pixel4:setLeftRight( true, false, 135.66, 146.34 )
				self.Pixel4:setTopBottom( true, false, 106, 116.67 )
				self.Pixel4:setAlpha( 1 )
				self.Pixel4:setZoom( -2 )
				self.clipFinished( Pixel4, {} )
				Pixel5:completeAnimation()
				self.Pixel5:setLeftRight( true, false, 70.67, 81.33 )
				self.Pixel5:setTopBottom( true, false, 148, 158.67 )
				self.Pixel5:setAlpha( 1 )
				self.Pixel5:setZoom( -2 )
				self.clipFinished( Pixel5, {} )
				ArrowD:completeAnimation()
				self.ArrowD:setLeftRight( true, false, 65, 86.33 )
				self.ArrowD:setTopBottom( true, false, 128, 146.67 )
				self.ArrowD:setRGB( 1, 1, 1 )
				self.ArrowD:setAlpha( 1 )
				self.ArrowD:setXRot( 0 )
				self.ArrowD:setZoom( 0 )
				self.clipFinished( ArrowD, {} )
				ArrowT:completeAnimation()
				self.ArrowT:setLeftRight( true, false, 67.67, 83.67 )
				self.ArrowT:setTopBottom( true, false, 1, 11.67 )
				self.ArrowT:setRGB( 1, 1, 1 )
				self.ArrowT:setAlpha( 1 )
				self.ArrowT:setXRot( 0 )
				self.ArrowT:setYRot( 0 )
				self.ArrowT:setZoom( 0 )
				self.clipFinished( ArrowT, {} )
				EKG:completeAnimation()
				EKG.EKGCritical:completeAnimation()
				EKG.EKGStable:completeAnimation()
				EKG.EKG2:completeAnimation()
				EKG.EKG3:completeAnimation()
				EKG.EKGBlur:completeAnimation()
				EKG.EKG4:completeAnimation()
				self.EKG:setAlpha( 1 )
				self.EKG:setZoom( 0 )
				self.EKG.EKGCritical:setRGB( 0, 0, 0 )
				self.EKG.EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
				self.EKG.EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
				self.EKG.EKGStable:setRGB( 1, 0.48, 0 )
				self.EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 6, 0.6 )
				self.EKG.EKGStable:setShaderVector( 1, 1, 2.2, -0.32, 0 )
				self.EKG.EKG2:setRGB( 0.42, 0.1, 0 )
				self.EKG.EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
				self.EKG.EKG3:setRGB( 0.53, 0.09, 0 )
				self.EKG.EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
				self.EKG.EKGBlur:setAlpha( 0 )
				self.EKG.EKG4:setRGB( 0.11, 0.15, 0.26 )
				self.EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
				self.clipFinished( EKG, {} )
				TextTitle:completeAnimation()
				TextTitle.TextLabel:completeAnimation()
				self.TextTitle:setRGB( 1, 1, 1 )
				self.TextTitle:setAlpha( 1 )
				self.TextTitle:setZoom( 3 )
				self.TextTitle.TextLabel:setText( Engine.Localize( "SERIOUS" ) )
				self.clipFinished( TextTitle, {} )
				local BPMFrame2 = function ( BPM, event )
					local BPMFrame3 = function ( BPM, event )
						local BPMFrame4 = function ( BPM, event )
							local BPMFrame5 = function ( BPM, event )
								local BPMFrame6 = function ( BPM, event )
									local BPMFrame7 = function ( BPM, event )
										local BPMFrame8 = function ( BPM, event )
											local BPMFrame9 = function ( BPM, event )
												local BPMFrame10 = function ( BPM, event )
													local BPMFrame11 = function ( BPM, event )
														local BPMFrame12 = function ( BPM, event )
															local BPMFrame13 = function ( BPM, event )
																local BPMFrame14 = function ( BPM, event )
																	local BPMFrame15 = function ( BPM, event )
																		local BPMFrame16 = function ( BPM, event )
																			local BPMFrame17 = function ( BPM, event )
																				local BPMFrame18 = function ( BPM, event )
																					local BPMFrame19 = function ( BPM, event )
																						local BPMFrame20 = function ( BPM, event )
																							local BPMFrame21 = function ( BPM, event )
																								local BPMFrame22 = function ( BPM, event )
																									local BPMFrame23 = function ( BPM, event )
																										local BPMFrame24 = function ( BPM, event )
																											local BPMFrame25 = function ( BPM, event )
																												local BPMFrame26 = function ( BPM, event )
																													local BPMFrame27 = function ( BPM, event )
																														if not event.interrupted then
																															BPM:beginAnimation( "keyframe", 530, false, false, CoD.TweenType.Linear )
																															BPM.HeartContainer:beginAnimation( "subkeyframe", 530, false, false, CoD.TweenType.Linear )
																															BPM.TextLabel:beginAnimation( "subkeyframe", 530, false, false, CoD.TweenType.Linear )
																														end
																														BPM:setLeftRight( false, false, -47.67, -13 )
																														BPM:setTopBottom( false, true, -75, -40.33 )
																														BPM:setAlpha( 1 )
																														BPM:setZoom( 2 )
																														BPM.HeartContainer:setRGB( 1, 1, 1 )
																														BPM.TextLabel:setRGB( 1, 1, 1 )
																														BPM.TextLabel:setText( Engine.Localize( "152" ) )
																														if event.interrupted then
																															self.clipFinished( BPM, event )
																														else
																															BPM:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																														end
																													end
																													
																													if event.interrupted then
																														BPMFrame27( BPM, event )
																														return 
																													else
																														BPM:beginAnimation( "keyframe", 729, false, false, CoD.TweenType.Linear )
																														BPM.TextLabel:beginAnimation( "subkeyframe", 729, false, false, CoD.TweenType.Linear )
																														BPM.TextLabel:setText( Engine.Localize( "152" ) )
																														BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													BPMFrame26( BPM, event )
																													return 
																												else
																													BPM:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
																													BPM.TextLabel:beginAnimation( "subkeyframe", 560, false, false, CoD.TweenType.Linear )
																													BPM.TextLabel:setText( Engine.Localize( "145" ) )
																													BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												BPMFrame25( BPM, event )
																												return 
																											else
																												BPM:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
																												BPM.TextLabel:beginAnimation( "subkeyframe", 779, false, false, CoD.TweenType.Linear )
																												BPM.TextLabel:setText( Engine.Localize( "144" ) )
																												BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											BPMFrame24( BPM, event )
																											return 
																										else
																											BPM:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
																											BPM.TextLabel:beginAnimation( "subkeyframe", 529, false, false, CoD.TweenType.Linear )
																											BPM.TextLabel:setText( Engine.Localize( "147" ) )
																											BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										BPMFrame23( BPM, event )
																										return 
																									else
																										BPM:beginAnimation( "keyframe", 739, false, false, CoD.TweenType.Linear )
																										BPM.TextLabel:beginAnimation( "subkeyframe", 739, false, false, CoD.TweenType.Linear )
																										BPM.TextLabel:setText( Engine.Localize( "149" ) )
																										BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									BPMFrame22( BPM, event )
																									return 
																								else
																									BPM:beginAnimation( "keyframe", 530, false, false, CoD.TweenType.Linear )
																									BPM.TextLabel:beginAnimation( "subkeyframe", 530, false, false, CoD.TweenType.Linear )
																									BPM.TextLabel:setText( Engine.Localize( "154" ) )
																									BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								BPMFrame21( BPM, event )
																								return 
																							else
																								BPM:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
																								BPM.TextLabel:beginAnimation( "subkeyframe", 469, false, false, CoD.TweenType.Linear )
																								BPM.TextLabel:setText( Engine.Localize( "155" ) )
																								BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							BPMFrame20( BPM, event )
																							return 
																						else
																							BPM:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
																							BPM.TextLabel:beginAnimation( "subkeyframe", 539, false, false, CoD.TweenType.Linear )
																							BPM.TextLabel:setText( Engine.Localize( "156" ) )
																							BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						BPMFrame19( BPM, event )
																						return 
																					else
																						BPM:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
																						BPM.TextLabel:beginAnimation( "subkeyframe", 550, false, false, CoD.TweenType.Linear )
																						BPM.TextLabel:setText( Engine.Localize( "157" ) )
																						BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					BPMFrame18( BPM, event )
																					return 
																				else
																					BPM:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
																					BPM.TextLabel:beginAnimation( "subkeyframe", 509, false, false, CoD.TweenType.Linear )
																					BPM.TextLabel:setText( Engine.Localize( "158" ) )
																					BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				BPMFrame17( BPM, event )
																				return 
																			else
																				BPM:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
																				BPM.TextLabel:beginAnimation( "subkeyframe", 349, false, false, CoD.TweenType.Linear )
																				BPM.TextLabel:setText( Engine.Localize( "159" ) )
																				BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			BPMFrame16( BPM, event )
																			return 
																		else
																			BPM:beginAnimation( "keyframe", 390, false, false, CoD.TweenType.Linear )
																			BPM.TextLabel:beginAnimation( "subkeyframe", 390, false, false, CoD.TweenType.Linear )
																			BPM.TextLabel:setText( Engine.Localize( "160" ) )
																			BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		BPMFrame15( BPM, event )
																		return 
																	else
																		BPM:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
																		BPM.TextLabel:beginAnimation( "subkeyframe", 279, false, false, CoD.TweenType.Linear )
																		BPM.TextLabel:setText( Engine.Localize( "161" ) )
																		BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame15 )
																	end
																end
																
																if event.interrupted then
																	BPMFrame14( BPM, event )
																	return 
																else
																	BPM:beginAnimation( "keyframe", 700, false, false, CoD.TweenType.Linear )
																	BPM.TextLabel:beginAnimation( "subkeyframe", 700, false, false, CoD.TweenType.Linear )
																	BPM.TextLabel:setText( Engine.Localize( "162" ) )
																	BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame14 )
																end
															end
															
															if event.interrupted then
																BPMFrame13( BPM, event )
																return 
															else
																BPM:beginAnimation( "keyframe", 1489, false, false, CoD.TweenType.Linear )
																BPM.TextLabel:beginAnimation( "subkeyframe", 1489, false, false, CoD.TweenType.Linear )
																BPM.TextLabel:setText( Engine.Localize( "163" ) )
																BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame13 )
															end
														end
														
														if event.interrupted then
															BPMFrame12( BPM, event )
															return 
														else
															BPM:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
															BPM.TextLabel:beginAnimation( "subkeyframe", 720, false, false, CoD.TweenType.Linear )
															BPM.TextLabel:setText( Engine.Localize( "162" ) )
															BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame12 )
														end
													end
													
													if event.interrupted then
														BPMFrame11( BPM, event )
														return 
													else
														BPM:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
														BPM.TextLabel:beginAnimation( "subkeyframe", 490, false, false, CoD.TweenType.Linear )
														BPM.TextLabel:setText( Engine.Localize( "161" ) )
														BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame11 )
													end
												end
												
												if event.interrupted then
													BPMFrame10( BPM, event )
													return 
												else
													BPM:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
													BPM.TextLabel:beginAnimation( "subkeyframe", 279, false, false, CoD.TweenType.Linear )
													BPM.TextLabel:setText( Engine.Localize( "160" ) )
													BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame10 )
												end
											end
											
											if event.interrupted then
												BPMFrame9( BPM, event )
												return 
											else
												BPM:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
												BPM.TextLabel:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Linear )
												BPM.TextLabel:setText( Engine.Localize( "159" ) )
												BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame9 )
											end
										end
										
										if event.interrupted then
											BPMFrame8( BPM, event )
											return 
										else
											BPM:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
											BPM.TextLabel:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Linear )
											BPM.TextLabel:setText( Engine.Localize( "158" ) )
											BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame8 )
										end
									end
									
									if event.interrupted then
										BPMFrame7( BPM, event )
										return 
									else
										BPM:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
										BPM.TextLabel:beginAnimation( "subkeyframe", 310, false, false, CoD.TweenType.Linear )
										BPM.TextLabel:setText( Engine.Localize( "157" ) )
										BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame7 )
									end
								end
								
								if event.interrupted then
									BPMFrame6( BPM, event )
									return 
								else
									BPM:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
									BPM.TextLabel:beginAnimation( "subkeyframe", 589, false, false, CoD.TweenType.Linear )
									BPM.TextLabel:setText( Engine.Localize( "156" ) )
									BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame6 )
								end
							end
							
							if event.interrupted then
								BPMFrame5( BPM, event )
								return 
							else
								BPM:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
								BPM.TextLabel:beginAnimation( "subkeyframe", 300, false, false, CoD.TweenType.Linear )
								BPM.TextLabel:setText( Engine.Localize( "155" ) )
								BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame5 )
							end
						end
						
						if event.interrupted then
							BPMFrame4( BPM, event )
							return 
						else
							BPM:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
							BPM.TextLabel:beginAnimation( "subkeyframe", 420, false, false, CoD.TweenType.Linear )
							BPM.TextLabel:setText( Engine.Localize( "154" ) )
							BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame4 )
						end
					end
					
					if event.interrupted then
						BPMFrame3( BPM, event )
						return 
					else
						BPM:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						BPM.TextLabel:beginAnimation( "subkeyframe", 370, false, false, CoD.TweenType.Linear )
						BPM.TextLabel:setText( Engine.Localize( "153" ) )
						BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame3 )
					end
				end
				
				BPM:completeAnimation()
				BPM.HeartContainer:completeAnimation()
				BPM.TextLabel:completeAnimation()
				self.BPM:setLeftRight( false, false, -47.67, -13 )
				self.BPM:setTopBottom( false, true, -75, -40.33 )
				self.BPM:setAlpha( 1 )
				self.BPM:setZoom( 2 )
				self.BPM.HeartContainer:setRGB( 1, 1, 1 )
				self.BPM.TextLabel:setRGB( 1, 1, 1 )
				self.BPM.TextLabel:setText( Engine.Localize( "154" ) )
				BPMFrame2( BPM, {} )
				local BPFrame2 = function ( BP, event )
					local BPFrame3 = function ( BP, event )
						local BPFrame4 = function ( BP, event )
							local BPFrame5 = function ( BP, event )
								local BPFrame6 = function ( BP, event )
									local BPFrame7 = function ( BP, event )
										local BPFrame8 = function ( BP, event )
											local BPFrame9 = function ( BP, event )
												local BPFrame10 = function ( BP, event )
													local BPFrame11 = function ( BP, event )
														local BPFrame12 = function ( BP, event )
															local BPFrame13 = function ( BP, event )
																if not event.interrupted then
																	BP:beginAnimation( "keyframe", 1639, false, false, CoD.TweenType.Linear )
																	BP.BP1text:beginAnimation( "subkeyframe", 1639, false, false, CoD.TweenType.Linear )
																	BP.BP2text:beginAnimation( "subkeyframe", 1639, false, false, CoD.TweenType.Linear )
																end
																BP:setLeftRight( false, false, -8.33, 50 )
																BP:setTopBottom( false, true, -65.67, -49.67 )
																BP:setAlpha( 1 )
																BP:setZoom( 0 )
																BP.BP1text:setText( Engine.Localize( "81" ) )
																BP.BP2text:setText( Engine.Localize( "59" ) )
																if event.interrupted then
																	self.clipFinished( BP, event )
																else
																	BP:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																BPFrame13( BP, event )
																return 
															else
																BP:beginAnimation( "keyframe", 2090, false, false, CoD.TweenType.Linear )
																BP.BP2text:beginAnimation( "subkeyframe", 2090, false, false, CoD.TweenType.Linear )
																BP.BP2text:setText( Engine.Localize( "59" ) )
																BP:registerEventHandler( "transition_complete_keyframe", BPFrame13 )
															end
														end
														
														if event.interrupted then
															BPFrame12( BP, event )
															return 
														else
															BP:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
															BP.BP1text:beginAnimation( "subkeyframe", 529, false, false, CoD.TweenType.Linear )
															BP.BP1text:setText( Engine.Localize( "82" ) )
															BP:registerEventHandler( "transition_complete_keyframe", BPFrame12 )
														end
													end
													
													if event.interrupted then
														BPFrame11( BP, event )
														return 
													else
														BP:beginAnimation( "keyframe", 690, false, false, CoD.TweenType.Linear )
														BP.BP2text:beginAnimation( "subkeyframe", 690, false, false, CoD.TweenType.Linear )
														BP.BP2text:setText( Engine.Localize( "58" ) )
														BP:registerEventHandler( "transition_complete_keyframe", BPFrame11 )
													end
												end
												
												if event.interrupted then
													BPFrame10( BP, event )
													return 
												else
													BP:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Linear )
													BP.BP1text:beginAnimation( "subkeyframe", 769, false, false, CoD.TweenType.Linear )
													BP.BP1text:setText( Engine.Localize( "81" ) )
													BP:registerEventHandler( "transition_complete_keyframe", BPFrame10 )
												end
											end
											
											if event.interrupted then
												BPFrame9( BP, event )
												return 
											else
												BP:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
												BP.BP2text:beginAnimation( "subkeyframe", 440, false, false, CoD.TweenType.Linear )
												BP.BP2text:setText( Engine.Localize( "57" ) )
												BP:registerEventHandler( "transition_complete_keyframe", BPFrame9 )
											end
										end
										
										if event.interrupted then
											BPFrame8( BP, event )
											return 
										else
											BP:beginAnimation( "keyframe", 1579, false, false, CoD.TweenType.Linear )
											BP.BP1text:beginAnimation( "subkeyframe", 1579, false, false, CoD.TweenType.Linear )
											BP.BP1text:setText( Engine.Localize( "80" ) )
											BP:registerEventHandler( "transition_complete_keyframe", BPFrame8 )
										end
									end
									
									if event.interrupted then
										BPFrame7( BP, event )
										return 
									else
										BP:beginAnimation( "keyframe", 1920, false, false, CoD.TweenType.Linear )
										BP.BP1text:beginAnimation( "subkeyframe", 1920, false, false, CoD.TweenType.Linear )
										BP.BP1text:setText( Engine.Localize( "79" ) )
										BP:registerEventHandler( "transition_complete_keyframe", BPFrame7 )
									end
								end
								
								if event.interrupted then
									BPFrame6( BP, event )
									return 
								else
									BP:beginAnimation( "keyframe", 959, false, false, CoD.TweenType.Linear )
									BP.BP2text:beginAnimation( "subkeyframe", 959, false, false, CoD.TweenType.Linear )
									BP.BP2text:setText( Engine.Localize( "58" ) )
									BP:registerEventHandler( "transition_complete_keyframe", BPFrame6 )
								end
							end
							
							if event.interrupted then
								BPFrame5( BP, event )
								return 
							else
								BP:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
								BP:registerEventHandler( "transition_complete_keyframe", BPFrame5 )
							end
						end
						
						if event.interrupted then
							BPFrame4( BP, event )
							return 
						else
							BP:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
							BP.BP1text:beginAnimation( "subkeyframe", 339, false, false, CoD.TweenType.Linear )
							BP.BP1text:setText( Engine.Localize( "82" ) )
							BP:registerEventHandler( "transition_complete_keyframe", BPFrame4 )
						end
					end
					
					if event.interrupted then
						BPFrame3( BP, event )
						return 
					else
						BP:beginAnimation( "keyframe", 930, false, false, CoD.TweenType.Linear )
						BP.BP1text:beginAnimation( "subkeyframe", 930, false, false, CoD.TweenType.Linear )
						BP.BP1text:setText( Engine.Localize( "81" ) )
						BP:registerEventHandler( "transition_complete_keyframe", BPFrame3 )
					end
				end
				
				BP:completeAnimation()
				BP.BP1text:completeAnimation()
				BP.BP2text:completeAnimation()
				self.BP:setLeftRight( false, false, -8.33, 50 )
				self.BP:setTopBottom( false, true, -65.67, -49.67 )
				self.BP:setAlpha( 1 )
				self.BP:setZoom( 0 )
				self.BP.BP1text:setText( Engine.Localize( "80" ) )
				self.BP.BP2text:setText( Engine.Localize( "59" ) )
				BPFrame2( BP, {} )
				Critical2:completeAnimation()
				self.Critical2:setAlpha( 0 )
				self.clipFinished( Critical2, {} )
				Critical:completeAnimation()
				self.Critical:setAlpha( 0 )
				self.clipFinished( Critical, {} )
				DangerMessage:completeAnimation()
				self.DangerMessage:setAlpha( 0 )
				self.clipFinished( DangerMessage, {} )
				self.nextClip = "DefaultClip"
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 17 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
					end
					Panel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				PanelFrame2( Panel, {} )
				local LineRFrame2 = function ( LineR, event )
					local LineRFrame3 = function ( LineR, event )
						local LineRFrame4 = function ( LineR, event )
							local LineRFrame5 = function ( LineR, event )
								local LineRFrame6 = function ( LineR, event )
									if not event.interrupted then
										LineR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									LineR:setLeftRight( true, false, 57, 126.33 )
									LineR:setTopBottom( true, false, 37, 127.67 )
									LineR:setRGB( 1, 1, 1 )
									LineR:setAlpha( 0 )
									LineR:setZRot( 0 )
									LineR:setZoom( -4 )
									if event.interrupted then
										self.clipFinished( LineR, event )
									else
										LineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LineRFrame6( LineR, event )
									return 
								else
									LineR:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame6 )
								end
							end
							
							if event.interrupted then
								LineRFrame5( LineR, event )
								return 
							else
								LineR:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								LineR:setAlpha( 0.5 )
								LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame5 )
							end
						end
						
						if event.interrupted then
							LineRFrame4( LineR, event )
							return 
						else
							LineR:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame4 )
						end
					end
					
					if event.interrupted then
						LineRFrame3( LineR, event )
						return 
					else
						LineR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						LineR:setAlpha( 0 )
						LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame3 )
					end
				end
				
				LineR:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				LineR:setLeftRight( true, false, 57, 126.33 )
				LineR:setTopBottom( true, false, 37, 127.67 )
				LineR:setRGB( 1, 1, 1 )
				LineR:setAlpha( 0.2 )
				LineR:setZRot( 0 )
				LineR:setZoom( -4 )
				LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame2 )
				local LineLFrame2 = function ( LineL, event )
					local LineLFrame3 = function ( LineL, event )
						local LineLFrame4 = function ( LineL, event )
							local LineLFrame5 = function ( LineL, event )
								local LineLFrame6 = function ( LineL, event )
									if not event.interrupted then
										LineL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									LineL:setLeftRight( true, false, 24, 93.33 )
									LineL:setTopBottom( true, false, 37, 127.67 )
									LineL:setRGB( 1, 1, 1 )
									LineL:setAlpha( 0 )
									LineL:setZRot( 0 )
									LineL:setZoom( -4 )
									if event.interrupted then
										self.clipFinished( LineL, event )
									else
										LineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LineLFrame6( LineL, event )
									return 
								else
									LineL:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame6 )
								end
							end
							
							if event.interrupted then
								LineLFrame5( LineL, event )
								return 
							else
								LineL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								LineL:setAlpha( 0.5 )
								LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame5 )
							end
						end
						
						if event.interrupted then
							LineLFrame4( LineL, event )
							return 
						else
							LineL:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame4 )
						end
					end
					
					if event.interrupted then
						LineLFrame3( LineL, event )
						return 
					else
						LineL:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						LineL:setAlpha( 0 )
						LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame3 )
					end
				end
				
				LineL:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
				LineL:setLeftRight( true, false, 24, 93.33 )
				LineL:setTopBottom( true, false, 37, 127.67 )
				LineL:setRGB( 1, 1, 1 )
				LineL:setAlpha( 0.2 )
				LineL:setZRot( 0 )
				LineL:setZoom( -4 )
				LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame2 )
				local Pixel1Frame2 = function ( Pixel1, event )
					if not event.interrupted then
						Pixel1:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
					end
					Pixel1:setLeftRight( true, false, 69.67, 80.33 )
					Pixel1:setTopBottom( true, false, 137.34, 148.01 )
					Pixel1:setAlpha( 0 )
					Pixel1:setZoom( -2 )
					if event.interrupted then
						self.clipFinished( Pixel1, event )
					else
						Pixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel1:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
				Pixel1:setLeftRight( true, false, 14.67, 25.34 )
				Pixel1:setTopBottom( true, false, 18, 28.67 )
				Pixel1:setAlpha( 1 )
				Pixel1:setZoom( -2 )
				Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame2 )
				local Pixel2Frame2 = function ( Pixel2, event )
					if not event.interrupted then
						Pixel2:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
					end
					Pixel2:setLeftRight( true, false, 71, 81.67 )
					Pixel2:setTopBottom( true, false, 137.34, 148.01 )
					Pixel2:setAlpha( 0 )
					Pixel2:setZoom( -2 )
					if event.interrupted then
						self.clipFinished( Pixel2, event )
					else
						Pixel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel2:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
				Pixel2:setLeftRight( true, false, 126.67, 137.34 )
				Pixel2:setTopBottom( true, false, 18, 28.67 )
				Pixel2:setAlpha( 1 )
				Pixel2:setZoom( -2 )
				Pixel2:registerEventHandler( "transition_complete_keyframe", Pixel2Frame2 )
				local Pixel3Frame2 = function ( Pixel3, event )
					if not event.interrupted then
						Pixel3:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
					end
					Pixel3:setLeftRight( true, false, 69.67, 80.33 )
					Pixel3:setTopBottom( true, false, 137.34, 148.01 )
					Pixel3:setAlpha( 0 )
					Pixel3:setZoom( -2 )
					if event.interrupted then
						self.clipFinished( Pixel3, event )
					else
						Pixel3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel3:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
				Pixel3:setLeftRight( true, false, 6.67, 17.34 )
				Pixel3:setTopBottom( true, false, 106, 116.67 )
				Pixel3:setAlpha( 1 )
				Pixel3:setZoom( -2 )
				Pixel3:registerEventHandler( "transition_complete_keyframe", Pixel3Frame2 )
				local Pixel4Frame2 = function ( Pixel4, event )
					if not event.interrupted then
						Pixel4:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
					end
					Pixel4:setLeftRight( true, false, 71, 81.67 )
					Pixel4:setTopBottom( true, false, 137.34, 148.01 )
					Pixel4:setAlpha( 0 )
					Pixel4:setZoom( -2 )
					if event.interrupted then
						self.clipFinished( Pixel4, event )
					else
						Pixel4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel4:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
				Pixel4:setLeftRight( true, false, 135.67, 146.34 )
				Pixel4:setTopBottom( true, false, 106, 116.67 )
				Pixel4:setAlpha( 1 )
				Pixel4:setZoom( -2 )
				Pixel4:registerEventHandler( "transition_complete_keyframe", Pixel4Frame2 )
				local Pixel5Frame2 = function ( Pixel5, event )
					if not event.interrupted then
						Pixel5:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
					end
					Pixel5:setLeftRight( true, false, 71, 81.67 )
					Pixel5:setTopBottom( true, false, 137.34, 148.01 )
					Pixel5:setAlpha( 0 )
					Pixel5:setZoom( -2 )
					if event.interrupted then
						self.clipFinished( Pixel5, event )
					else
						Pixel5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel5:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
				Pixel5:setLeftRight( true, false, 70.67, 81.34 )
				Pixel5:setTopBottom( true, false, 148, 158.67 )
				Pixel5:setAlpha( 1 )
				Pixel5:setZoom( -2 )
				Pixel5:registerEventHandler( "transition_complete_keyframe", Pixel5Frame2 )
				local ArrowDFrame2 = function ( ArrowD, event )
					local ArrowDFrame3 = function ( ArrowD, event )
						local ArrowDFrame4 = function ( ArrowD, event )
							local ArrowDFrame5 = function ( ArrowD, event )
								local ArrowDFrame6 = function ( ArrowD, event )
									if not event.interrupted then
										ArrowD:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									ArrowD:setLeftRight( true, false, 65, 86.33 )
									ArrowD:setTopBottom( true, false, 128, 146.67 )
									ArrowD:setRGB( 1, 1, 1 )
									ArrowD:setAlpha( 0 )
									ArrowD:setXRot( 0 )
									ArrowD:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( ArrowD, event )
									else
										ArrowD:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ArrowDFrame6( ArrowD, event )
									return 
								else
									ArrowD:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowDFrame5( ArrowD, event )
								return 
							else
								ArrowD:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ArrowD:setAlpha( 0.5 )
								ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowDFrame4( ArrowD, event )
							return 
						else
							ArrowD:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowDFrame3( ArrowD, event )
						return 
					else
						ArrowD:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ArrowD:setAlpha( 0 )
						ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame3 )
					end
				end
				
				ArrowD:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				ArrowD:setLeftRight( true, false, 65, 86.33 )
				ArrowD:setTopBottom( true, false, 128, 146.67 )
				ArrowD:setRGB( 1, 1, 1 )
				ArrowD:setAlpha( 1 )
				ArrowD:setXRot( 0 )
				ArrowD:setZoom( 0 )
				ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame2 )
				local ArrowTFrame2 = function ( ArrowT, event )
					local ArrowTFrame3 = function ( ArrowT, event )
						local ArrowTFrame4 = function ( ArrowT, event )
							local ArrowTFrame5 = function ( ArrowT, event )
								local ArrowTFrame6 = function ( ArrowT, event )
									if not event.interrupted then
										ArrowT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									ArrowT:setLeftRight( true, false, 67.67, 83.67 )
									ArrowT:setTopBottom( true, false, 1, 11.67 )
									ArrowT:setRGB( 1, 1, 1 )
									ArrowT:setAlpha( 0 )
									ArrowT:setXRot( 0 )
									ArrowT:setYRot( 0 )
									ArrowT:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( ArrowT, event )
									else
										ArrowT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ArrowTFrame6( ArrowT, event )
									return 
								else
									ArrowT:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowTFrame5( ArrowT, event )
								return 
							else
								ArrowT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								ArrowT:setAlpha( 0.5 )
								ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowTFrame4( ArrowT, event )
							return 
						else
							ArrowT:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowTFrame3( ArrowT, event )
						return 
					else
						ArrowT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ArrowT:setAlpha( 0 )
						ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame3 )
					end
				end
				
				ArrowT:completeAnimation()
				self.ArrowT:setLeftRight( true, false, 67.67, 83.67 )
				self.ArrowT:setTopBottom( true, false, 1, 11.67 )
				self.ArrowT:setRGB( 1, 1, 1 )
				self.ArrowT:setAlpha( 1 )
				self.ArrowT:setXRot( 0 )
				self.ArrowT:setYRot( 0 )
				self.ArrowT:setZoom( 0 )
				ArrowTFrame2( ArrowT, {} )
				local EKGFrame2 = function ( EKG, event )
					local EKGFrame3 = function ( EKG, event )
						local EKGFrame4 = function ( EKG, event )
							local EKGFrame5 = function ( EKG, event )
								local EKGFrame6 = function ( EKG, event )
									if not event.interrupted then
										EKG:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										EKG.EKGCritical:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										EKG.EKGStable:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										EKG.EKG2:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										EKG.EKG3:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										EKG.EKGBlur:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										EKG.EKG4:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									end
									EKG:setAlpha( 0 )
									EKG:setZoom( -12 )
									EKG.EKGCritical:setRGB( 0, 0, 0 )
									EKG.EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
									EKG.EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
									EKG.EKGStable:setRGB( 1, 0.48, 0 )
									EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 6, 0.6 )
									EKG.EKGStable:setShaderVector( 1, 1, 2.2, -0.32, 0 )
									EKG.EKG2:setRGB( 0.42, 0.1, 0 )
									EKG.EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
									EKG.EKG3:setRGB( 0.53, 0.09, 0 )
									EKG.EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
									EKG.EKGBlur:setAlpha( 0 )
									EKG.EKG4:setRGB( 0.11, 0.15, 0.26 )
									EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
									if event.interrupted then
										self.clipFinished( EKG, event )
									else
										EKG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									EKGFrame6( EKG, event )
									return 
								else
									EKG:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									EKG:setZoom( -10.91 )
									EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame6 )
								end
							end
							
							if event.interrupted then
								EKGFrame5( EKG, event )
								return 
							else
								EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								EKG:setAlpha( 0.5 )
								EKG:setZoom( -6.55 )
								EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame5 )
							end
						end
						
						if event.interrupted then
							EKGFrame4( EKG, event )
							return 
						else
							EKG:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							EKG:setZoom( -5.45 )
							EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame4 )
						end
					end
					
					if event.interrupted then
						EKGFrame3( EKG, event )
						return 
					else
						EKG:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						EKG:setAlpha( 0 )
						EKG:setZoom( -1.09 )
						EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame3 )
					end
				end
				
				EKG:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				EKG.EKGCritical:beginAnimation( "subkeyframe", 219, false, false, CoD.TweenType.Linear )
				EKG.EKGStable:beginAnimation( "subkeyframe", 219, false, false, CoD.TweenType.Linear )
				EKG.EKG2:beginAnimation( "subkeyframe", 219, false, false, CoD.TweenType.Linear )
				EKG.EKG3:beginAnimation( "subkeyframe", 219, false, false, CoD.TweenType.Linear )
				EKG.EKGBlur:beginAnimation( "subkeyframe", 219, false, false, CoD.TweenType.Linear )
				EKG.EKG4:beginAnimation( "subkeyframe", 219, false, false, CoD.TweenType.Linear )
				EKG:setAlpha( 1 )
				EKG:setZoom( 0 )
				EKG.EKGCritical:setRGB( 0, 0, 0 )
				EKG.EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
				EKG.EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
				EKG.EKGStable:setRGB( 1, 0.48, 0 )
				EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 6, 0.6 )
				EKG.EKGStable:setShaderVector( 1, 1, 2.2, -0.32, 0 )
				EKG.EKG2:setRGB( 0.42, 0.1, 0 )
				EKG.EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
				EKG.EKG3:setRGB( 0.53, 0.09, 0 )
				EKG.EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
				EKG.EKGBlur:setAlpha( 0 )
				EKG.EKG4:setRGB( 0.11, 0.15, 0.26 )
				EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
				EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame2 )
				local TextTitleFrame2 = function ( TextTitle, event )
					local TextTitleFrame3 = function ( TextTitle, event )
						local TextTitleFrame4 = function ( TextTitle, event )
							local TextTitleFrame5 = function ( TextTitle, event )
								local TextTitleFrame6 = function ( TextTitle, event )
									if not event.interrupted then
										TextTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										TextTitle.TextLabel:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									end
									TextTitle:setRGB( 1, 1, 1 )
									TextTitle:setAlpha( 0 )
									TextTitle:setZoom( -20 )
									TextTitle.TextLabel:setText( Engine.Localize( "SERIOUS" ) )
									if event.interrupted then
										self.clipFinished( TextTitle, event )
									else
										TextTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									TextTitleFrame6( TextTitle, event )
									return 
								else
									TextTitle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									TextTitle:setZoom( -17.91 )
									TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame6 )
								end
							end
							
							if event.interrupted then
								TextTitleFrame5( TextTitle, event )
								return 
							else
								TextTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								TextTitle:setAlpha( 0.5 )
								TextTitle:setZoom( -9.55 )
								TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame5 )
							end
						end
						
						if event.interrupted then
							TextTitleFrame4( TextTitle, event )
							return 
						else
							TextTitle:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							TextTitle:setZoom( -7.45 )
							TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame4 )
						end
					end
					
					if event.interrupted then
						TextTitleFrame3( TextTitle, event )
						return 
					else
						TextTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						TextTitle:setAlpha( 0 )
						TextTitle:setZoom( 0.91 )
						TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame3 )
					end
				end
				
				TextTitle:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				TextTitle.TextLabel:beginAnimation( "subkeyframe", 119, false, false, CoD.TweenType.Linear )
				TextTitle:setRGB( 1, 1, 1 )
				TextTitle:setAlpha( 1 )
				TextTitle:setZoom( 3 )
				TextTitle.TextLabel:setText( Engine.Localize( "SERIOUS" ) )
				TextTitle:registerEventHandler( "transition_complete_keyframe", TextTitleFrame2 )
				local BPMFrame2 = function ( BPM, event )
					local BPMFrame3 = function ( BPM, event )
						local BPMFrame4 = function ( BPM, event )
							local BPMFrame5 = function ( BPM, event )
								local BPMFrame6 = function ( BPM, event )
									if not event.interrupted then
										BPM:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										BPM.HeartContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										BPM.TextLabel:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									BPM:setLeftRight( false, false, -47.67, -13 )
									BPM:setTopBottom( false, true, -75, -40.33 )
									BPM:setAlpha( 0 )
									BPM:setZoom( 2 )
									BPM.HeartContainer:setRGB( 1, 1, 1 )
									BPM.TextLabel:setRGB( 1, 1, 1 )
									BPM.TextLabel:setText( Engine.Localize( "154" ) )
									if event.interrupted then
										self.clipFinished( BPM, event )
									else
										BPM:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									BPMFrame6( BPM, event )
									return 
								else
									BPM:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame6 )
								end
							end
							
							if event.interrupted then
								BPMFrame5( BPM, event )
								return 
							else
								BPM:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								BPM:setAlpha( 0.5 )
								BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame5 )
							end
						end
						
						if event.interrupted then
							BPMFrame4( BPM, event )
							return 
						else
							BPM:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame4 )
						end
					end
					
					if event.interrupted then
						BPMFrame3( BPM, event )
						return 
					else
						BPM:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						BPM:setAlpha( 0 )
						BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame3 )
					end
				end
				
				BPM:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
				BPM.HeartContainer:beginAnimation( "subkeyframe", 319, false, false, CoD.TweenType.Linear )
				BPM.TextLabel:beginAnimation( "subkeyframe", 319, false, false, CoD.TweenType.Linear )
				BPM:setLeftRight( false, false, -47.67, -13 )
				BPM:setTopBottom( false, true, -75, -40.33 )
				BPM:setAlpha( 1 )
				BPM:setZoom( 2 )
				BPM.HeartContainer:setRGB( 1, 1, 1 )
				BPM.TextLabel:setRGB( 1, 1, 1 )
				BPM.TextLabel:setText( Engine.Localize( "154" ) )
				BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame2 )
				local BPFrame2 = function ( BP, event )
					local BPFrame3 = function ( BP, event )
						local BPFrame4 = function ( BP, event )
							local BPFrame5 = function ( BP, event )
								local BPFrame6 = function ( BP, event )
									if not event.interrupted then
										BP:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										BP.BP1text:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										BP.BP2text:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									BP:setLeftRight( false, false, -8.33, 50 )
									BP:setTopBottom( false, true, -65.67, -49.67 )
									BP:setAlpha( 0 )
									BP:setZoom( 0 )
									BP.BP1text:setText( Engine.Localize( "80" ) )
									BP.BP2text:setText( Engine.Localize( "59" ) )
									if event.interrupted then
										self.clipFinished( BP, event )
									else
										BP:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									BPFrame6( BP, event )
									return 
								else
									BP:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									BP:registerEventHandler( "transition_complete_keyframe", BPFrame6 )
								end
							end
							
							if event.interrupted then
								BPFrame5( BP, event )
								return 
							else
								BP:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								BP:setAlpha( 0.5 )
								BP:registerEventHandler( "transition_complete_keyframe", BPFrame5 )
							end
						end
						
						if event.interrupted then
							BPFrame4( BP, event )
							return 
						else
							BP:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							BP:registerEventHandler( "transition_complete_keyframe", BPFrame4 )
						end
					end
					
					if event.interrupted then
						BPFrame3( BP, event )
						return 
					else
						BP:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						BP:setAlpha( 0 )
						BP:registerEventHandler( "transition_complete_keyframe", BPFrame3 )
					end
				end
				
				BP:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
				BP.BP1text:beginAnimation( "subkeyframe", 409, false, false, CoD.TweenType.Linear )
				BP.BP2text:beginAnimation( "subkeyframe", 409, false, false, CoD.TweenType.Linear )
				BP:setLeftRight( false, false, -8.33, 50 )
				BP:setTopBottom( false, true, -65.67, -49.67 )
				BP:setAlpha( 1 )
				BP:setZoom( 0 )
				BP.BP1text:setText( Engine.Localize( "80" ) )
				BP.BP2text:setText( Engine.Localize( "59" ) )
				BP:registerEventHandler( "transition_complete_keyframe", BPFrame2 )
				Critical2:completeAnimation()
				self.Critical2:setAlpha( 0 )
				self.clipFinished( Critical2, {} )
				local CriticalFrame2 = function ( Critical, event )
					if not event.interrupted then
						Critical:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
					end
					Critical:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Critical, event )
					else
						Critical:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Critical:completeAnimation()
				self.Critical:setAlpha( 0 )
				CriticalFrame2( Critical, {} )
				local DangerMessageFrame2 = function ( DangerMessage, event )
					if not event.interrupted then
						DangerMessage:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
					end
					DangerMessage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DangerMessage, event )
					else
						DangerMessage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DangerMessage:completeAnimation()
				self.DangerMessage:setAlpha( 0 )
				DangerMessageFrame2( DangerMessage, {} )
			end
		},
		Critical = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				self.clipFinished( Panel, {} )
				LineR:completeAnimation()
				self.LineR:setLeftRight( true, false, 47, 116.33 )
				self.LineR:setTopBottom( true, false, 32, 122.67 )
				self.LineR:setRGB( 1, 0, 0 )
				self.LineR:setAlpha( 0.7 )
				self.LineR:setZRot( -10 )
				self.LineR:setZoom( -4 )
				self.clipFinished( LineR, {} )
				LineL:completeAnimation()
				self.LineL:setLeftRight( true, false, 34, 103.33 )
				self.LineL:setTopBottom( true, false, 32, 122.67 )
				self.LineL:setRGB( 1, 0, 0 )
				self.LineL:setAlpha( 0.7 )
				self.LineL:setZRot( -10 )
				self.LineL:setZoom( -4 )
				self.clipFinished( LineL, {} )
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( true, false, 14.66, 25.33 )
				self.Pixel1:setTopBottom( true, false, 18, 28.67 )
				self.Pixel1:setAlpha( 1 )
				self.Pixel1:setZRot( 0 )
				self.Pixel1:setZoom( -2 )
				self.clipFinished( Pixel1, {} )
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( true, false, 126.67, 137.34 )
				self.Pixel2:setTopBottom( true, false, 18, 28.67 )
				self.Pixel2:setAlpha( 1 )
				self.Pixel2:setZoom( -2 )
				self.clipFinished( Pixel2, {} )
				Pixel3:completeAnimation()
				self.Pixel3:setLeftRight( true, false, 6.66, 17.33 )
				self.Pixel3:setTopBottom( true, false, 106, 116.67 )
				self.Pixel3:setAlpha( 1 )
				self.Pixel3:setZoom( -2 )
				self.clipFinished( Pixel3, {} )
				Pixel4:completeAnimation()
				self.Pixel4:setLeftRight( true, false, 135.66, 146.34 )
				self.Pixel4:setTopBottom( true, false, 106, 116.67 )
				self.Pixel4:setAlpha( 1 )
				self.Pixel4:setZoom( -2 )
				self.clipFinished( Pixel4, {} )
				Pixel5:completeAnimation()
				self.Pixel5:setLeftRight( true, false, 70.67, 81.33 )
				self.Pixel5:setTopBottom( true, false, 148, 158.67 )
				self.Pixel5:setAlpha( 1 )
				self.Pixel5:setZoom( -2 )
				self.clipFinished( Pixel5, {} )
				ArrowD:completeAnimation()
				self.ArrowD:setLeftRight( true, false, 65, 86.33 )
				self.ArrowD:setTopBottom( true, false, 128, 146.67 )
				self.ArrowD:setRGB( 1, 0, 0 )
				self.ArrowD:setAlpha( 1 )
				self.ArrowD:setZoom( 0 )
				self.clipFinished( ArrowD, {} )
				ArrowT:completeAnimation()
				self.ArrowT:setLeftRight( true, false, 67.67, 83.67 )
				self.ArrowT:setTopBottom( true, false, 26.67, 37.33 )
				self.ArrowT:setAlpha( 1 )
				self.ArrowT:setXRot( -180 )
				self.ArrowT:setZoom( 0 )
				self.clipFinished( ArrowT, {} )
				local EKGFrame2 = function ( EKG, event )
					local EKGFrame3 = function ( EKG, event )
						local EKGFrame4 = function ( EKG, event )
							local EKGFrame5 = function ( EKG, event )
								local EKGFrame6 = function ( EKG, event )
									local EKGFrame7 = function ( EKG, event )
										local EKGFrame8 = function ( EKG, event )
											local EKGFrame9 = function ( EKG, event )
												local EKGFrame10 = function ( EKG, event )
													if not event.interrupted then
														EKG:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
														EKG.EKGCritical:beginAnimation( "subkeyframe", 379, false, false, CoD.TweenType.Linear )
														EKG.EKGStable:beginAnimation( "subkeyframe", 379, false, false, CoD.TweenType.Linear )
														EKG.EKG2:beginAnimation( "subkeyframe", 379, false, false, CoD.TweenType.Linear )
														EKG.EKG3:beginAnimation( "subkeyframe", 379, false, false, CoD.TweenType.Linear )
														EKG.EKGBlur:beginAnimation( "subkeyframe", 379, false, false, CoD.TweenType.Linear )
														EKG.EKG4:beginAnimation( "subkeyframe", 379, false, false, CoD.TweenType.Linear )
													end
													EKG:setAlpha( 1 )
													EKG:setZoom( 0 )
													EKG.EKGCritical:setRGB( 1, 0, 0.08 )
													EKG.EKGCritical:setShaderVector( 0, 2, 10.21, 4, 0.97 )
													EKG.EKGCritical:setShaderVector( 1, 0.18, 1, 0.05, 0 )
													EKG.EKGStable:setRGB( 1, 0.06, 0 )
													EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 4, 0.6 )
													EKG.EKGStable:setShaderVector( 1, 1.01, 4, -0.32, 0 )
													EKG.EKG2:setRGB( 0.75, 0, 0 )
													EKG.EKG2:setShaderVector( 1, 0.3, 0, 0, 0 )
													EKG.EKG3:setRGB( 1, 0, 0 )
													EKG.EKG3:setShaderVector( 1, 0.2, 0, 0, 0 )
													EKG.EKGBlur:setAlpha( 1 )
													EKG.EKG4:setRGB( 0.54, 0, 0 )
													EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
													if event.interrupted then
														self.clipFinished( EKG, event )
													else
														EKG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													EKGFrame10( EKG, event )
													return 
												else
													EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													EKG:setAlpha( 1 )
													EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame10 )
												end
											end
											
											if event.interrupted then
												EKGFrame9( EKG, event )
												return 
											else
												EKG:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame9 )
											end
										end
										
										if event.interrupted then
											EKGFrame8( EKG, event )
											return 
										else
											EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											EKG:setAlpha( 0 )
											EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame8 )
										end
									end
									
									if event.interrupted then
										EKGFrame7( EKG, event )
										return 
									else
										EKG:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame7 )
									end
								end
								
								if event.interrupted then
									EKGFrame6( EKG, event )
									return 
								else
									EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									EKG:setAlpha( 0.5 )
									EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame6 )
								end
							end
							
							if event.interrupted then
								EKGFrame5( EKG, event )
								return 
							else
								EKG:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
								EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame5 )
							end
						end
						
						if event.interrupted then
							EKGFrame4( EKG, event )
							return 
						else
							EKG:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							EKG:setAlpha( 0 )
							EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame4 )
						end
					end
					
					if event.interrupted then
						EKGFrame3( EKG, event )
						return 
					else
						EKG:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame3 )
					end
				end
				
				EKG:completeAnimation()
				EKG.EKGCritical:completeAnimation()
				EKG.EKGStable:completeAnimation()
				EKG.EKG2:completeAnimation()
				EKG.EKG3:completeAnimation()
				EKG.EKGBlur:completeAnimation()
				EKG.EKG4:completeAnimation()
				self.EKG:setAlpha( 1 )
				self.EKG:setZoom( 0 )
				self.EKG.EKGCritical:setRGB( 1, 0, 0.08 )
				self.EKG.EKGCritical:setShaderVector( 0, 2, 10.21, 4, 0.97 )
				self.EKG.EKGCritical:setShaderVector( 1, 0.18, 1, 0.05, 0 )
				self.EKG.EKGStable:setRGB( 1, 0.06, 0 )
				self.EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 4, 0.6 )
				self.EKG.EKGStable:setShaderVector( 1, 1.01, 4, -0.32, 0 )
				self.EKG.EKG2:setRGB( 0.75, 0, 0 )
				self.EKG.EKG2:setShaderVector( 1, 0.3, 0, 0, 0 )
				self.EKG.EKG3:setRGB( 1, 0, 0 )
				self.EKG.EKG3:setShaderVector( 1, 0.2, 0, 0, 0 )
				self.EKG.EKGBlur:setAlpha( 1 )
				self.EKG.EKG4:setRGB( 0.54, 0, 0 )
				self.EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
				EKGFrame2( EKG, {} )
				TextTitle:completeAnimation()
				self.TextTitle:setAlpha( 0 )
				self.TextTitle:setZoom( 3 )
				self.clipFinished( TextTitle, {} )
				local BPMFrame2 = function ( BPM, event )
					local BPMFrame3 = function ( BPM, event )
						local BPMFrame4 = function ( BPM, event )
							local BPMFrame5 = function ( BPM, event )
								local BPMFrame6 = function ( BPM, event )
									local BPMFrame7 = function ( BPM, event )
										local BPMFrame8 = function ( BPM, event )
											local BPMFrame9 = function ( BPM, event )
												local BPMFrame10 = function ( BPM, event )
													local BPMFrame11 = function ( BPM, event )
														local BPMFrame12 = function ( BPM, event )
															local BPMFrame13 = function ( BPM, event )
																local BPMFrame14 = function ( BPM, event )
																	local BPMFrame15 = function ( BPM, event )
																		local BPMFrame16 = function ( BPM, event )
																			local BPMFrame17 = function ( BPM, event )
																				local BPMFrame18 = function ( BPM, event )
																					local BPMFrame19 = function ( BPM, event )
																						local BPMFrame20 = function ( BPM, event )
																							if not event.interrupted then
																								BPM:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																								BPM.HeartContainer:beginAnimation( "subkeyframe", 49, false, false, CoD.TweenType.Linear )
																								BPM.TextLabel:beginAnimation( "subkeyframe", 49, false, false, CoD.TweenType.Linear )
																							end
																							BPM:setLeftRight( false, false, 18.33, 53 )
																							BPM:setTopBottom( false, true, -75, -40.33 )
																							BPM:setAlpha( 1 )
																							BPM.HeartContainer:setRGB( 1, 0, 0 )
																							BPM.TextLabel:setRGB( 1, 1, 1 )
																							BPM.TextLabel:setText( Engine.Localize( "172" ) )
																							if event.interrupted then
																								self.clipFinished( BPM, event )
																							else
																								BPM:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																							end
																						end
																						
																						if event.interrupted then
																							BPMFrame20( BPM, event )
																							return 
																						else
																							BPM:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																							BPM.TextLabel:beginAnimation( "subkeyframe", 90, false, false, CoD.TweenType.Linear )
																							BPM.TextLabel:setText( Engine.Localize( "187" ) )
																							BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						BPMFrame19( BPM, event )
																						return 
																					else
																						BPM:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
																						BPM.TextLabel:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Linear )
																						BPM.TextLabel:setText( Engine.Localize( "189" ) )
																						BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					BPMFrame18( BPM, event )
																					return 
																				else
																					BPM:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																					BPM.TextLabel:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																					BPM.TextLabel:setText( Engine.Localize( "191" ) )
																					BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				BPMFrame17( BPM, event )
																				return 
																			else
																				BPM:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
																				BPM.TextLabel:beginAnimation( "subkeyframe", 179, false, false, CoD.TweenType.Linear )
																				BPM.TextLabel:setText( Engine.Localize( "168" ) )
																				BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			BPMFrame16( BPM, event )
																			return 
																		else
																			BPM:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			BPM.TextLabel:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																			BPM.TextLabel:setText( Engine.Localize( "185" ) )
																			BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		BPMFrame15( BPM, event )
																		return 
																	else
																		BPM:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																		BPM.TextLabel:beginAnimation( "subkeyframe", 80, false, false, CoD.TweenType.Linear )
																		BPM.TextLabel:setText( Engine.Localize( "186" ) )
																		BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame15 )
																	end
																end
																
																if event.interrupted then
																	BPMFrame14( BPM, event )
																	return 
																else
																	BPM:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																	BPM.TextLabel:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
																	BPM.TextLabel:setText( Engine.Localize( "184" ) )
																	BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame14 )
																end
															end
															
															if event.interrupted then
																BPMFrame13( BPM, event )
																return 
															else
																BPM:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																BPM.TextLabel:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																BPM.TextLabel:setText( Engine.Localize( "181" ) )
																BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame13 )
															end
														end
														
														if event.interrupted then
															BPMFrame12( BPM, event )
															return 
														else
															BPM:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
															BPM.TextLabel:beginAnimation( "subkeyframe", 210, false, false, CoD.TweenType.Linear )
															BPM.TextLabel:setText( Engine.Localize( "179" ) )
															BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame12 )
														end
													end
													
													if event.interrupted then
														BPMFrame11( BPM, event )
														return 
													else
														BPM:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														BPM.TextLabel:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
														BPM.TextLabel:setText( Engine.Localize( "190" ) )
														BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame11 )
													end
												end
												
												if event.interrupted then
													BPMFrame10( BPM, event )
													return 
												else
													BPM:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
													BPM.TextLabel:beginAnimation( "subkeyframe", 410, false, false, CoD.TweenType.Linear )
													BPM.TextLabel:setText( Engine.Localize( "189" ) )
													BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame10 )
												end
											end
											
											if event.interrupted then
												BPMFrame9( BPM, event )
												return 
											else
												BPM:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												BPM.TextLabel:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
												BPM.TextLabel:setText( Engine.Localize( "186" ) )
												BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame9 )
											end
										end
										
										if event.interrupted then
											BPMFrame8( BPM, event )
											return 
										else
											BPM:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
											BPM.TextLabel:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
											BPM.TextLabel:setText( Engine.Localize( "185" ) )
											BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame8 )
										end
									end
									
									if event.interrupted then
										BPMFrame7( BPM, event )
										return 
									else
										BPM:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										BPM.TextLabel:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
										BPM.TextLabel:setText( Engine.Localize( "184" ) )
										BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame7 )
									end
								end
								
								if event.interrupted then
									BPMFrame6( BPM, event )
									return 
								else
									BPM:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									BPM.TextLabel:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									BPM.TextLabel:setText( Engine.Localize( "183" ) )
									BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame6 )
								end
							end
							
							if event.interrupted then
								BPMFrame5( BPM, event )
								return 
							else
								BPM:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame5 )
							end
						end
						
						if event.interrupted then
							BPMFrame4( BPM, event )
							return 
						else
							BPM:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							BPM.TextLabel:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							BPM.TextLabel:setText( Engine.Localize( "172" ) )
							BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame4 )
						end
					end
					
					if event.interrupted then
						BPMFrame3( BPM, event )
						return 
					else
						BPM:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame3 )
					end
				end
				
				BPM:completeAnimation()
				BPM.HeartContainer:completeAnimation()
				BPM.TextLabel:completeAnimation()
				self.BPM:setLeftRight( false, false, 18.33, 53 )
				self.BPM:setTopBottom( false, true, -75, -40.33 )
				self.BPM:setAlpha( 1 )
				self.BPM.HeartContainer:setRGB( 1, 0, 0 )
				self.BPM.TextLabel:setRGB( 1, 1, 1 )
				self.BPM.TextLabel:setText( Engine.Localize( "176" ) )
				BPMFrame2( BPM, {} )
				BP:completeAnimation()
				self.BP:setAlpha( 0 )
				self.clipFinished( BP, {} )
				local Critical2Frame2 = function ( Critical2, event )
					local Critical2Frame3 = function ( Critical2, event )
						local Critical2Frame4 = function ( Critical2, event )
							local Critical2Frame5 = function ( Critical2, event )
								local Critical2Frame6 = function ( Critical2, event )
									local Critical2Frame7 = function ( Critical2, event )
										local Critical2Frame8 = function ( Critical2, event )
											local Critical2Frame9 = function ( Critical2, event )
												if not event.interrupted then
													Critical2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
												end
												Critical2:setLeftRight( true, false, 18, 135.33 )
												Critical2:setTopBottom( true, false, 52, 80 )
												Critical2:setAlpha( 0 )
												Critical2:setZoom( 4 )
												if event.interrupted then
													self.clipFinished( Critical2, event )
												else
													Critical2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Critical2Frame9( Critical2, event )
												return 
											else
												Critical2:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
												Critical2:registerEventHandler( "transition_complete_keyframe", Critical2Frame9 )
											end
										end
										
										if event.interrupted then
											Critical2Frame8( Critical2, event )
											return 
										else
											Critical2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Critical2:setAlpha( 1 )
											Critical2:registerEventHandler( "transition_complete_keyframe", Critical2Frame8 )
										end
									end
									
									if event.interrupted then
										Critical2Frame7( Critical2, event )
										return 
									else
										Critical2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										Critical2:registerEventHandler( "transition_complete_keyframe", Critical2Frame7 )
									end
								end
								
								if event.interrupted then
									Critical2Frame6( Critical2, event )
									return 
								else
									Critical2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									Critical2:registerEventHandler( "transition_complete_keyframe", Critical2Frame6 )
								end
							end
							
							if event.interrupted then
								Critical2Frame5( Critical2, event )
								return 
							else
								Critical2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Critical2:setAlpha( 0 )
								Critical2:registerEventHandler( "transition_complete_keyframe", Critical2Frame5 )
							end
						end
						
						if event.interrupted then
							Critical2Frame4( Critical2, event )
							return 
						else
							Critical2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Critical2:setAlpha( 1 )
							Critical2:registerEventHandler( "transition_complete_keyframe", Critical2Frame4 )
						end
					end
					
					if event.interrupted then
						Critical2Frame3( Critical2, event )
						return 
					else
						Critical2:beginAnimation( "keyframe", 1070, false, false, CoD.TweenType.Linear )
						Critical2:registerEventHandler( "transition_complete_keyframe", Critical2Frame3 )
					end
				end
				
				Critical2:completeAnimation()
				self.Critical2:setLeftRight( true, false, 18, 135.33 )
				self.Critical2:setTopBottom( true, false, 52, 80 )
				self.Critical2:setAlpha( 0 )
				self.Critical2:setZoom( 4 )
				Critical2Frame2( Critical2, {} )
				local CriticalFrame2 = function ( Critical, event )
					local CriticalFrame3 = function ( Critical, event )
						local CriticalFrame4 = function ( Critical, event )
							local CriticalFrame5 = function ( Critical, event )
								local CriticalFrame6 = function ( Critical, event )
									local CriticalFrame7 = function ( Critical, event )
										local CriticalFrame8 = function ( Critical, event )
											local CriticalFrame9 = function ( Critical, event )
												if not event.interrupted then
													Critical:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												end
												Critical:setLeftRight( true, false, 18, 135.33 )
												Critical:setTopBottom( true, false, 52, 80 )
												Critical:setAlpha( 0 )
												Critical:setZoom( 4 )
												if event.interrupted then
													self.clipFinished( Critical, event )
												else
													Critical:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												CriticalFrame9( Critical, event )
												return 
											else
												Critical:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												Critical:registerEventHandler( "transition_complete_keyframe", CriticalFrame9 )
											end
										end
										
										if event.interrupted then
											CriticalFrame8( Critical, event )
											return 
										else
											Critical:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Critical:setAlpha( 1 )
											Critical:registerEventHandler( "transition_complete_keyframe", CriticalFrame8 )
										end
									end
									
									if event.interrupted then
										CriticalFrame7( Critical, event )
										return 
									else
										Critical:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										Critical:registerEventHandler( "transition_complete_keyframe", CriticalFrame7 )
									end
								end
								
								if event.interrupted then
									CriticalFrame6( Critical, event )
									return 
								else
									Critical:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Critical:setAlpha( 0 )
									Critical:registerEventHandler( "transition_complete_keyframe", CriticalFrame6 )
								end
							end
							
							if event.interrupted then
								CriticalFrame5( Critical, event )
								return 
							else
								Critical:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Critical:registerEventHandler( "transition_complete_keyframe", CriticalFrame5 )
							end
						end
						
						if event.interrupted then
							CriticalFrame4( Critical, event )
							return 
						else
							Critical:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Critical:setAlpha( 1 )
							Critical:registerEventHandler( "transition_complete_keyframe", CriticalFrame4 )
						end
					end
					
					if event.interrupted then
						CriticalFrame3( Critical, event )
						return 
					else
						Critical:beginAnimation( "keyframe", 1039, false, false, CoD.TweenType.Linear )
						Critical:registerEventHandler( "transition_complete_keyframe", CriticalFrame3 )
					end
				end
				
				Critical:completeAnimation()
				self.Critical:setLeftRight( true, false, 18, 135.33 )
				self.Critical:setTopBottom( true, false, 52, 80 )
				self.Critical:setAlpha( 0 )
				self.Critical:setZoom( 4 )
				CriticalFrame2( Critical, {} )
				DangerMessage:completeAnimation()
				self.DangerMessage:setLeftRight( true, false, 21.33, 96 )
				self.DangerMessage:setTopBottom( true, false, 90, 116.67 )
				self.DangerMessage:setAlpha( 1 )
				self.DangerMessage:setZoom( 2 )
				self.clipFinished( DangerMessage, {} )
				self.nextClip = "DefaultClip"
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 17 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
					end
					Panel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				PanelFrame2( Panel, {} )
				local LineRFrame2 = function ( LineR, event )
					local LineRFrame3 = function ( LineR, event )
						local LineRFrame4 = function ( LineR, event )
							local LineRFrame5 = function ( LineR, event )
								local LineRFrame6 = function ( LineR, event )
									if not event.interrupted then
										LineR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									LineR:setLeftRight( true, false, 47, 116.33 )
									LineR:setTopBottom( true, false, 32, 122.67 )
									LineR:setRGB( 1, 1, 1 )
									LineR:setAlpha( 0 )
									LineR:setZRot( -10 )
									LineR:setZoom( -4 )
									if event.interrupted then
										self.clipFinished( LineR, event )
									else
										LineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LineRFrame6( LineR, event )
									return 
								else
									LineR:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									LineR:setRGB( 1, 0.91, 0.91 )
									LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame6 )
								end
							end
							
							if event.interrupted then
								LineRFrame5( LineR, event )
								return 
							else
								LineR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								LineR:setRGB( 1, 0.55, 0.55 )
								LineR:setAlpha( 0.5 )
								LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame5 )
							end
						end
						
						if event.interrupted then
							LineRFrame4( LineR, event )
							return 
						else
							LineR:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							LineR:setRGB( 1, 0.45, 0.45 )
							LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame4 )
						end
					end
					
					if event.interrupted then
						LineRFrame3( LineR, event )
						return 
					else
						LineR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						LineR:setRGB( 1, 0.09, 0.09 )
						LineR:setAlpha( 0 )
						LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame3 )
					end
				end
				
				LineR:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
				LineR:setLeftRight( true, false, 47, 116.33 )
				LineR:setTopBottom( true, false, 32, 122.67 )
				LineR:setRGB( 1, 0, 0 )
				LineR:setAlpha( 0.7 )
				LineR:setZRot( -10 )
				LineR:setZoom( -4 )
				LineR:registerEventHandler( "transition_complete_keyframe", LineRFrame2 )
				local LineLFrame2 = function ( LineL, event )
					local LineLFrame3 = function ( LineL, event )
						local LineLFrame4 = function ( LineL, event )
							local LineLFrame5 = function ( LineL, event )
								local LineLFrame6 = function ( LineL, event )
									if not event.interrupted then
										LineL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									LineL:setLeftRight( true, false, 34, 103.33 )
									LineL:setTopBottom( true, false, 32, 122.67 )
									LineL:setRGB( 1, 1, 1 )
									LineL:setAlpha( 0 )
									LineL:setZRot( -10 )
									LineL:setZoom( -4 )
									if event.interrupted then
										self.clipFinished( LineL, event )
									else
										LineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LineLFrame6( LineL, event )
									return 
								else
									LineL:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									LineL:setRGB( 1, 0.91, 0.91 )
									LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame6 )
								end
							end
							
							if event.interrupted then
								LineLFrame5( LineL, event )
								return 
							else
								LineL:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								LineL:setRGB( 1, 0.55, 0.55 )
								LineL:setAlpha( 0.5 )
								LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame5 )
							end
						end
						
						if event.interrupted then
							LineLFrame4( LineL, event )
							return 
						else
							LineL:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							LineL:setRGB( 1, 0.45, 0.45 )
							LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame4 )
						end
					end
					
					if event.interrupted then
						LineLFrame3( LineL, event )
						return 
					else
						LineL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						LineL:setRGB( 1, 0.09, 0.09 )
						LineL:setAlpha( 0 )
						LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame3 )
					end
				end
				
				LineL:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
				LineL:setLeftRight( true, false, 34, 103.33 )
				LineL:setTopBottom( true, false, 32, 122.67 )
				LineL:setRGB( 1, 0, 0 )
				LineL:setAlpha( 0.7 )
				LineL:setZRot( -10 )
				LineL:setZoom( -4 )
				LineL:registerEventHandler( "transition_complete_keyframe", LineLFrame2 )
				local Pixel1Frame2 = function ( Pixel1, event )
					if not event.interrupted then
						Pixel1:beginAnimation( "keyframe", 180, false, true, CoD.TweenType.Linear )
					end
					Pixel1:setLeftRight( true, false, 69.67, 80.33 )
					Pixel1:setTopBottom( true, false, 137.34, 148.01 )
					Pixel1:setAlpha( 0 )
					Pixel1:setZRot( 0 )
					Pixel1:setZoom( -2 )
					if event.interrupted then
						self.clipFinished( Pixel1, event )
					else
						Pixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel1:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
				Pixel1:setLeftRight( true, false, 14.67, 25.34 )
				Pixel1:setTopBottom( true, false, 18, 28.67 )
				Pixel1:setAlpha( 1 )
				Pixel1:setZRot( 0 )
				Pixel1:setZoom( -2 )
				Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame2 )
				local Pixel2Frame2 = function ( Pixel2, event )
					if not event.interrupted then
						Pixel2:beginAnimation( "keyframe", 180, false, true, CoD.TweenType.Linear )
					end
					Pixel2:setLeftRight( true, false, 71, 81.67 )
					Pixel2:setTopBottom( true, false, 137.34, 148.01 )
					Pixel2:setAlpha( 0 )
					Pixel2:setZoom( -2 )
					if event.interrupted then
						self.clipFinished( Pixel2, event )
					else
						Pixel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel2:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
				Pixel2:setLeftRight( true, false, 126.67, 137.34 )
				Pixel2:setTopBottom( true, false, 18, 28.67 )
				Pixel2:setAlpha( 1 )
				Pixel2:setZoom( -2 )
				Pixel2:registerEventHandler( "transition_complete_keyframe", Pixel2Frame2 )
				local Pixel3Frame2 = function ( Pixel3, event )
					if not event.interrupted then
						Pixel3:beginAnimation( "keyframe", 180, false, true, CoD.TweenType.Linear )
					end
					Pixel3:setLeftRight( true, false, 69.67, 80.33 )
					Pixel3:setTopBottom( true, false, 137.34, 148.01 )
					Pixel3:setAlpha( 0 )
					Pixel3:setZoom( -2 )
					if event.interrupted then
						self.clipFinished( Pixel3, event )
					else
						Pixel3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel3:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
				Pixel3:setLeftRight( true, false, 6.67, 17.34 )
				Pixel3:setTopBottom( true, false, 106, 116.67 )
				Pixel3:setAlpha( 1 )
				Pixel3:setZoom( -2 )
				Pixel3:registerEventHandler( "transition_complete_keyframe", Pixel3Frame2 )
				local Pixel4Frame2 = function ( Pixel4, event )
					if not event.interrupted then
						Pixel4:beginAnimation( "keyframe", 180, false, true, CoD.TweenType.Linear )
					end
					Pixel4:setLeftRight( true, false, 71, 81.67 )
					Pixel4:setTopBottom( true, false, 137.34, 148.01 )
					Pixel4:setAlpha( 0 )
					Pixel4:setZoom( -2 )
					if event.interrupted then
						self.clipFinished( Pixel4, event )
					else
						Pixel4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel4:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
				Pixel4:setLeftRight( true, false, 135.67, 146.34 )
				Pixel4:setTopBottom( true, false, 106, 116.67 )
				Pixel4:setAlpha( 1 )
				Pixel4:setZoom( -2 )
				Pixel4:registerEventHandler( "transition_complete_keyframe", Pixel4Frame2 )
				local Pixel5Frame2 = function ( Pixel5, event )
					if not event.interrupted then
						Pixel5:beginAnimation( "keyframe", 180, false, true, CoD.TweenType.Linear )
					end
					Pixel5:setLeftRight( true, false, 71, 81.67 )
					Pixel5:setTopBottom( true, false, 137.34, 148.01 )
					Pixel5:setAlpha( 0 )
					Pixel5:setZoom( -2 )
					if event.interrupted then
						self.clipFinished( Pixel5, event )
					else
						Pixel5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel5:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
				Pixel5:setLeftRight( true, false, 70.67, 81.34 )
				Pixel5:setTopBottom( true, false, 148, 158.67 )
				Pixel5:setAlpha( 1 )
				Pixel5:setZoom( -2 )
				Pixel5:registerEventHandler( "transition_complete_keyframe", Pixel5Frame2 )
				local ArrowDFrame2 = function ( ArrowD, event )
					local ArrowDFrame3 = function ( ArrowD, event )
						local ArrowDFrame4 = function ( ArrowD, event )
							local ArrowDFrame5 = function ( ArrowD, event )
								local ArrowDFrame6 = function ( ArrowD, event )
									if not event.interrupted then
										ArrowD:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									ArrowD:setLeftRight( true, false, 65, 86.33 )
									ArrowD:setTopBottom( true, false, 128, 146.67 )
									ArrowD:setRGB( 1, 1, 1 )
									ArrowD:setAlpha( 0 )
									ArrowD:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( ArrowD, event )
									else
										ArrowD:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ArrowDFrame6( ArrowD, event )
									return 
								else
									ArrowD:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									ArrowD:setRGB( 1, 0.9, 0.9 )
									ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowDFrame5( ArrowD, event )
								return 
							else
								ArrowD:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ArrowD:setRGB( 1, 0.5, 0.5 )
								ArrowD:setAlpha( 0.5 )
								ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowDFrame4( ArrowD, event )
							return 
						else
							ArrowD:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							ArrowD:setRGB( 1, 0.4, 0.4 )
							ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowDFrame3( ArrowD, event )
						return 
					else
						ArrowD:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						ArrowD:setRGB( 1, 0.1, 0.1 )
						ArrowD:setAlpha( 0 )
						ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame3 )
					end
				end
				
				ArrowD:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
				ArrowD:setLeftRight( true, false, 65, 86.33 )
				ArrowD:setTopBottom( true, false, 128, 146.67 )
				ArrowD:setRGB( 1, 0, 0 )
				ArrowD:setAlpha( 1 )
				ArrowD:setZoom( 0 )
				ArrowD:registerEventHandler( "transition_complete_keyframe", ArrowDFrame2 )
				local ArrowTFrame2 = function ( ArrowT, event )
					local ArrowTFrame3 = function ( ArrowT, event )
						local ArrowTFrame4 = function ( ArrowT, event )
							local ArrowTFrame5 = function ( ArrowT, event )
								local ArrowTFrame6 = function ( ArrowT, event )
									if not event.interrupted then
										ArrowT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									ArrowT:setLeftRight( true, false, 67.67, 83.67 )
									ArrowT:setTopBottom( true, false, 26.67, 37.33 )
									ArrowT:setAlpha( 0 )
									ArrowT:setXRot( -180 )
									ArrowT:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( ArrowT, event )
									else
										ArrowT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ArrowTFrame6( ArrowT, event )
									return 
								else
									ArrowT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowTFrame5( ArrowT, event )
								return 
							else
								ArrowT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ArrowT:setAlpha( 0.5 )
								ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowTFrame4( ArrowT, event )
							return 
						else
							ArrowT:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowTFrame3( ArrowT, event )
						return 
					else
						ArrowT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ArrowT:setAlpha( 0 )
						ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame3 )
					end
				end
				
				ArrowT:completeAnimation()
				self.ArrowT:setLeftRight( true, false, 67.67, 83.67 )
				self.ArrowT:setTopBottom( true, false, 26.67, 37.33 )
				self.ArrowT:setAlpha( 1 )
				self.ArrowT:setXRot( -180 )
				self.ArrowT:setZoom( 0 )
				ArrowTFrame2( ArrowT, {} )
				local EKGFrame2 = function ( EKG, event )
					local EKGFrame3 = function ( EKG, event )
						local EKGFrame4 = function ( EKG, event )
							local EKGFrame5 = function ( EKG, event )
								local EKGFrame6 = function ( EKG, event )
									if not event.interrupted then
										EKG:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										EKG.EKGCritical:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										EKG.EKGStable:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										EKG.EKG2:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										EKG.EKG3:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										EKG.EKGBlur:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										EKG.EKG4:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									end
									EKG:setAlpha( 0 )
									EKG:setZoom( -12 )
									EKG.EKGCritical:setRGB( 1, 0, 0.08 )
									EKG.EKGCritical:setShaderVector( 0, 2, 10.21, 4, 0.97 )
									EKG.EKGCritical:setShaderVector( 1, 0.18, 1, 0.05, 0 )
									EKG.EKGStable:setRGB( 1, 0.06, 0 )
									EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 4, 0.6 )
									EKG.EKGStable:setShaderVector( 1, 1.01, 4, -0.32, 0 )
									EKG.EKG2:setRGB( 0.75, 0, 0 )
									EKG.EKG2:setShaderVector( 1, 0.3, 0, 0, 0 )
									EKG.EKG3:setRGB( 1, 0, 0 )
									EKG.EKG3:setShaderVector( 1, 0.2, 0, 0, 0 )
									EKG.EKGBlur:setAlpha( 1 )
									EKG.EKG4:setRGB( 0.54, 0, 0 )
									EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
									if event.interrupted then
										self.clipFinished( EKG, event )
									else
										EKG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									EKGFrame6( EKG, event )
									return 
								else
									EKG:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									EKG:setZoom( -11.08 )
									EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame6 )
								end
							end
							
							if event.interrupted then
								EKGFrame5( EKG, event )
								return 
							else
								EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								EKG:setAlpha( 0.5 )
								EKG:setZoom( -6.46 )
								EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame5 )
							end
						end
						
						if event.interrupted then
							EKGFrame4( EKG, event )
							return 
						else
							EKG:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							EKG:setZoom( -5.54 )
							EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame4 )
						end
					end
					
					if event.interrupted then
						EKGFrame3( EKG, event )
						return 
					else
						EKG:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						EKG:setAlpha( 0 )
						EKG:setZoom( -0.92 )
						EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame3 )
					end
				end
				
				EKG:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				EKG.EKGCritical:beginAnimation( "subkeyframe", 119, false, false, CoD.TweenType.Linear )
				EKG.EKGStable:beginAnimation( "subkeyframe", 119, false, false, CoD.TweenType.Linear )
				EKG.EKG2:beginAnimation( "subkeyframe", 119, false, false, CoD.TweenType.Linear )
				EKG.EKG3:beginAnimation( "subkeyframe", 119, false, false, CoD.TweenType.Linear )
				EKG.EKGBlur:beginAnimation( "subkeyframe", 119, false, false, CoD.TweenType.Linear )
				EKG.EKG4:beginAnimation( "subkeyframe", 119, false, false, CoD.TweenType.Linear )
				EKG:setAlpha( 1 )
				EKG:setZoom( 0 )
				EKG.EKGCritical:setRGB( 1, 0, 0.08 )
				EKG.EKGCritical:setShaderVector( 0, 2, 10.21, 4, 0.97 )
				EKG.EKGCritical:setShaderVector( 1, 0.18, 1, 0.05, 0 )
				EKG.EKGStable:setRGB( 1, 0.06, 0 )
				EKG.EKGStable:setShaderVector( 0, 1.33, 7.57, 4, 0.6 )
				EKG.EKGStable:setShaderVector( 1, 1.01, 4, -0.32, 0 )
				EKG.EKG2:setRGB( 0.75, 0, 0 )
				EKG.EKG2:setShaderVector( 1, 0.3, 0, 0, 0 )
				EKG.EKG3:setRGB( 1, 0, 0 )
				EKG.EKG3:setShaderVector( 1, 0.2, 0, 0, 0 )
				EKG.EKGBlur:setAlpha( 1 )
				EKG.EKG4:setRGB( 0.54, 0, 0 )
				EKG.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
				EKG:registerEventHandler( "transition_complete_keyframe", EKGFrame2 )
				local TextTitleFrame2 = function ( TextTitle, event )
					if not event.interrupted then
						TextTitle:beginAnimation( "keyframe", 910, false, false, CoD.TweenType.Linear )
					end
					TextTitle:setAlpha( 0 )
					TextTitle:setZoom( -20 )
					if event.interrupted then
						self.clipFinished( TextTitle, event )
					else
						TextTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextTitle:completeAnimation()
				self.TextTitle:setAlpha( 0 )
				self.TextTitle:setZoom( 3 )
				TextTitleFrame2( TextTitle, {} )
				local BPMFrame2 = function ( BPM, event )
					local BPMFrame3 = function ( BPM, event )
						local BPMFrame4 = function ( BPM, event )
							local BPMFrame5 = function ( BPM, event )
								local BPMFrame6 = function ( BPM, event )
									if not event.interrupted then
										BPM:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										BPM.HeartContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										BPM.TextLabel:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									BPM:setLeftRight( false, false, 18.33, 53 )
									BPM:setTopBottom( false, true, -75, -40.33 )
									BPM:setAlpha( 0 )
									BPM.HeartContainer:setRGB( 1, 0, 0 )
									BPM.TextLabel:setRGB( 1, 1, 1 )
									BPM.TextLabel:setText( Engine.Localize( "176" ) )
									if event.interrupted then
										self.clipFinished( BPM, event )
									else
										BPM:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									BPMFrame6( BPM, event )
									return 
								else
									BPM:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame6 )
								end
							end
							
							if event.interrupted then
								BPMFrame5( BPM, event )
								return 
							else
								BPM:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								BPM:setAlpha( 0.5 )
								BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame5 )
							end
						end
						
						if event.interrupted then
							BPMFrame4( BPM, event )
							return 
						else
							BPM:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame4 )
						end
					end
					
					if event.interrupted then
						BPMFrame3( BPM, event )
						return 
					else
						BPM:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						BPM:setAlpha( 0 )
						BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame3 )
					end
				end
				
				BPM:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
				BPM.HeartContainer:beginAnimation( "subkeyframe", 349, false, false, CoD.TweenType.Linear )
				BPM.TextLabel:beginAnimation( "subkeyframe", 349, false, false, CoD.TweenType.Linear )
				BPM:setLeftRight( false, false, 18.33, 53 )
				BPM:setTopBottom( false, true, -75, -40.33 )
				BPM:setAlpha( 1 )
				BPM.HeartContainer:setRGB( 1, 0, 0 )
				BPM.TextLabel:setRGB( 1, 1, 1 )
				BPM.TextLabel:setText( Engine.Localize( "176" ) )
				BPM:registerEventHandler( "transition_complete_keyframe", BPMFrame2 )
				local BPFrame2 = function ( BP, event )
					if not event.interrupted then
						BP:beginAnimation( "keyframe", 910, false, false, CoD.TweenType.Linear )
					end
					BP:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BP, event )
					else
						BP:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BP:completeAnimation()
				self.BP:setAlpha( 0 )
				BPFrame2( BP, {} )
				Critical2:completeAnimation()
				self.Critical2:setLeftRight( true, false, 18, 135.33 )
				self.Critical2:setTopBottom( true, false, 52, 80 )
				self.Critical2:setAlpha( 0 )
				self.Critical2:setZoom( 4 )
				self.clipFinished( Critical2, {} )
				local CriticalFrame2 = function ( Critical, event )
					if not event.interrupted then
						Critical:beginAnimation( "keyframe", 910, false, false, CoD.TweenType.Linear )
					end
					Critical:setLeftRight( true, false, 18, 135.33 )
					Critical:setTopBottom( true, false, 52, 80 )
					Critical:setAlpha( 0 )
					Critical:setZoom( 4 )
					if event.interrupted then
						self.clipFinished( Critical, event )
					else
						Critical:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Critical:completeAnimation()
				self.Critical:setLeftRight( true, false, 18, 135.33 )
				self.Critical:setTopBottom( true, false, 52, 80 )
				self.Critical:setAlpha( 0 )
				self.Critical:setZoom( 4 )
				CriticalFrame2( Critical, {} )
				local DangerMessageFrame2 = function ( DangerMessage, event )
					local DangerMessageFrame3 = function ( DangerMessage, event )
						local DangerMessageFrame4 = function ( DangerMessage, event )
							local DangerMessageFrame5 = function ( DangerMessage, event )
								local DangerMessageFrame6 = function ( DangerMessage, event )
									if not event.interrupted then
										DangerMessage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									DangerMessage:setLeftRight( true, false, 21.33, 96 )
									DangerMessage:setTopBottom( true, false, 90, 116.67 )
									DangerMessage:setAlpha( 0 )
									DangerMessage:setZoom( 2 )
									if event.interrupted then
										self.clipFinished( DangerMessage, event )
									else
										DangerMessage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									DangerMessageFrame6( DangerMessage, event )
									return 
								else
									DangerMessage:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									DangerMessage:registerEventHandler( "transition_complete_keyframe", DangerMessageFrame6 )
								end
							end
							
							if event.interrupted then
								DangerMessageFrame5( DangerMessage, event )
								return 
							else
								DangerMessage:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								DangerMessage:setAlpha( 0.5 )
								DangerMessage:registerEventHandler( "transition_complete_keyframe", DangerMessageFrame5 )
							end
						end
						
						if event.interrupted then
							DangerMessageFrame4( DangerMessage, event )
							return 
						else
							DangerMessage:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							DangerMessage:registerEventHandler( "transition_complete_keyframe", DangerMessageFrame4 )
						end
					end
					
					if event.interrupted then
						DangerMessageFrame3( DangerMessage, event )
						return 
					else
						DangerMessage:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						DangerMessage:setAlpha( 0 )
						DangerMessage:registerEventHandler( "transition_complete_keyframe", DangerMessageFrame3 )
					end
				end
				
				DangerMessage:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				DangerMessage:setLeftRight( true, false, 21.33, 96 )
				DangerMessage:setTopBottom( true, false, 90, 116.67 )
				DangerMessage:setAlpha( 1 )
				DangerMessage:setZoom( 2 )
				DangerMessage:registerEventHandler( "transition_complete_keyframe", DangerMessageFrame2 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Stable",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "woundType", Enum.WoundedSoldierType.WOUNDED_SOLDIER_TYPE_MINOR ) and IsSelfModelValueEqualToEnum( element, controller, "view_state", Enum.WaypointState.WAYPOINT_STATE_LINE_OF_SIGHT )
			end
		},
		{
			stateName = "Serious",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "woundType", Enum.WoundedSoldierType.WOUNDED_SOLDIER_TYPE_SEVERE ) and IsSelfModelValueEqualToEnum( element, controller, "view_state", Enum.WaypointState.WAYPOINT_STATE_LINE_OF_SIGHT )
			end
		},
		{
			stateName = "Critical",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "woundType", Enum.WoundedSoldierType.WOUNDED_SOLDIER_TYPE_CRITICAL ) and IsSelfModelValueEqualToEnum( element, controller, "view_state", Enum.WaypointState.WAYPOINT_STATE_LINE_OF_SIGHT )
			end
		}
	} )
	self:linkToElementModel( self, "woundType", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "woundType"
		} )
	end )
	self:linkToElementModel( self, "view_state", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "view_state"
		} )
	end )
	self.close = function ( self )
		self.Panel:close()
		self.EKG:close()
		self.TextTitle:close()
		self.BPM:close()
		self.BP:close()
		self.DangerMessage:close()
		CoD.woundedSoldierWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

