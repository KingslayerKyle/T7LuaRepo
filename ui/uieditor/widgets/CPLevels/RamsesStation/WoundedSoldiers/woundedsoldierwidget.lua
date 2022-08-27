-- 07b8ccbd553ac03fc1f42a8791094d95
-- This hash is used for caching, delete to decompile the file again

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
	Panel.Image1:setShaderVector( 0, 20, 20, 0, 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local LineR = LUI.UIImage.new()
	LineR:setLeftRight( true, false, 57, 126.33 )
	LineR:setTopBottom( true, false, 37, 127.67 )
	LineR:setAlpha( 0 )
	LineR:setZoom( -4 )
	LineR:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_line" ) )
	LineR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineR )
	self.LineR = LineR
	
	local LineL = LUI.UIImage.new()
	LineL:setLeftRight( true, false, 24, 93.33 )
	LineL:setTopBottom( true, false, 37, 127.67 )
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
	Pixel1:setZoom( -2 )
	Pixel1:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_pixel" ) )
	Pixel1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel1 )
	self.Pixel1 = Pixel1
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( true, false, 126.67, 137.34 )
	Pixel2:setTopBottom( true, false, 18, 28.67 )
	Pixel2:setZoom( -2 )
	Pixel2:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_pixel" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local Pixel3 = LUI.UIImage.new()
	Pixel3:setLeftRight( true, false, 6.67, 17.34 )
	Pixel3:setTopBottom( true, false, 106, 116.67 )
	Pixel3:setZoom( -2 )
	Pixel3:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_pixel" ) )
	Pixel3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel3 )
	self.Pixel3 = Pixel3
	
	local Pixel4 = LUI.UIImage.new()
	Pixel4:setLeftRight( true, false, 135.67, 146.34 )
	Pixel4:setTopBottom( true, false, 106, 116.67 )
	Pixel4:setZoom( -2 )
	Pixel4:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_pixel" ) )
	Pixel4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel4 )
	self.Pixel4 = Pixel4
	
	local Pixel5 = LUI.UIImage.new()
	Pixel5:setLeftRight( true, false, 70.67, 81.34 )
	Pixel5:setTopBottom( true, false, 148, 158.67 )
	Pixel5:setZoom( -2 )
	Pixel5:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_pixel" ) )
	Pixel5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel5 )
	self.Pixel5 = Pixel5
	
	local ArrowD = LUI.UIImage.new()
	ArrowD:setLeftRight( true, false, 65, 86.33 )
	ArrowD:setTopBottom( true, false, 128, 146.67 )
	ArrowD:setAlpha( 0.5 )
	ArrowD:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_arrowd" ) )
	ArrowD:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowD )
	self.ArrowD = ArrowD
	
	local ArrowT = LUI.UIImage.new()
	ArrowT:setLeftRight( true, false, 67.67, 83.67 )
	ArrowT:setTopBottom( true, false, 1, 11.67 )
	ArrowT:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_arrowt" ) )
	ArrowT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowT )
	self.ArrowT = ArrowT
	
	local EKG = CoD.woundedSoldier_EKG.new( menu, controller )
	EKG:setLeftRight( true, false, -23.84, 169.25 )
	EKG:setTopBottom( true, false, 33, 99.67 )
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
	TextTitle:setZoom( 3 )
	TextTitle.TextLabel:setText( Engine.Localize( "STABLE" ) )
	self:addElement( TextTitle )
	self.TextTitle = TextTitle
	
	local BPM = CoD.woundedSoldier_BPM.new( menu, controller )
	BPM:setLeftRight( false, false, -47.67, -13 )
	BPM:setTopBottom( false, true, -75, -40.33 )
	BPM:setAlpha( 0.97 )
	BPM:setZoom( 2 )
	BPM.TextLabel:setText( Engine.Localize( "85" ) )
	self:addElement( BPM )
	self.BPM = BPM
	
	local BP = CoD.woundedSoldier_BP.new( menu, controller )
	BP:setLeftRight( false, false, -8.33, 50 )
	BP:setTopBottom( false, true, -65.67, -49.67 )
	BP.BP1text:setText( Engine.Localize( "115" ) )
	BP.BP2text:setText( Engine.Localize( "82" ) )
	self:addElement( BP )
	self.BP = BP
	
	local Critical2 = LUI.UIImage.new()
	Critical2:setLeftRight( true, false, 18, 135.33 )
	Critical2:setTopBottom( true, false, 52, 80 )
	Critical2:setAlpha( 0 )
	Critical2:setZoom( 4 )
	Critical2:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_critical" ) )
	Critical2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Critical2 )
	self.Critical2 = Critical2
	
	local Critical = LUI.UIImage.new()
	Critical:setLeftRight( true, false, 18, 135.33 )
	Critical:setTopBottom( true, false, 52, 80 )
	Critical:setAlpha( 0 )
	Critical:setZoom( 4 )
	Critical:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_criticalshift" ) )
	Critical:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Critical )
	self.Critical = Critical
	
	local DangerMessage = CoD.woundedSoldier_DangerLines.new( menu, controller )
	DangerMessage:setLeftRight( true, false, 21.33, 96 )
	DangerMessage:setTopBottom( true, false, 90, 116.67 )
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
				self.Pixel1:setLeftRight( true, false, 69.67, 80.34 )
				self.Pixel1:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel1:setAlpha( 0 )
				self.clipFinished( Pixel1, {} )
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( true, false, 71, 81.67 )
				self.Pixel2:setTopBottom( true, false, 137.34, 148.01 )
				self.Pixel2:setAlpha( 0 )
				self.clipFinished( Pixel2, {} )
				Pixel3:completeAnimation()
				self.Pixel3:setLeftRight( true, false, 69.67, 80.34 )
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
				local f6_local1 = function ( f8_arg0, f8_arg1 )
					local f8_local0 = function ( f9_arg0, f9_arg1 )
						local f9_local0 = function ( f10_arg0, f10_arg1 )
							local f10_local0 = function ( f11_arg0, f11_arg1 )
								local f11_local0 = function ( f12_arg0, f12_arg1 )
									local f12_local0 = function ( f13_arg0, f13_arg1 )
										if not f13_arg1.interrupted then
											f13_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
										end
										f13_arg0:setLeftRight( true, false, 57, 126.33 )
										f13_arg0:setTopBottom( true, false, 37, 127.67 )
										f13_arg0:setRGB( 1, 1, 1 )
										f13_arg0:setAlpha( 0.2 )
										f13_arg0:setZRot( 0 )
										f13_arg0:setZoom( -4 )
										if f13_arg1.interrupted then
											self.clipFinished( f13_arg0, f13_arg1 )
										else
											f13_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f12_arg1.interrupted then
										f12_local0( f12_arg0, f12_arg1 )
										return 
									else
										f12_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f12_arg0:setAlpha( 1 )
										f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
									end
								end
								
								if f11_arg1.interrupted then
									f11_local0( f11_arg0, f11_arg1 )
									return 
								else
									f11_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
								end
							end
							
							if f10_arg1.interrupted then
								f10_local0( f10_arg0, f10_arg1 )
								return 
							else
								f10_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f10_arg0:setAlpha( 0 )
								f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
							end
						end
						
						if f9_arg1.interrupted then
							f9_local0( f9_arg0, f9_arg1 )
							return 
						else
							f9_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
						end
					end
					
					if f8_arg1.interrupted then
						f8_local0( f8_arg0, f8_arg1 )
						return 
					else
						f8_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f8_arg0:setAlpha( 0.5 )
						f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
					end
				end
				
				LineR:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
				LineR:setLeftRight( true, false, 57, 126.33 )
				LineR:setTopBottom( true, false, 37, 127.67 )
				LineR:setRGB( 1, 1, 1 )
				LineR:setAlpha( 0 )
				LineR:setZRot( 0 )
				LineR:setZoom( -4 )
				LineR:registerEventHandler( "transition_complete_keyframe", f6_local1 )
				local f6_local2 = function ( f14_arg0, f14_arg1 )
					local f14_local0 = function ( f15_arg0, f15_arg1 )
						local f15_local0 = function ( f16_arg0, f16_arg1 )
							local f16_local0 = function ( f17_arg0, f17_arg1 )
								local f17_local0 = function ( f18_arg0, f18_arg1 )
									local f18_local0 = function ( f19_arg0, f19_arg1 )
										if not f19_arg1.interrupted then
											f19_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
										end
										f19_arg0:setLeftRight( true, false, 24, 93.33 )
										f19_arg0:setTopBottom( true, false, 37, 127.67 )
										f19_arg0:setRGB( 1, 1, 1 )
										f19_arg0:setAlpha( 0.2 )
										f19_arg0:setZRot( 0 )
										f19_arg0:setZoom( -4 )
										if f19_arg1.interrupted then
											self.clipFinished( f19_arg0, f19_arg1 )
										else
											f19_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f18_arg1.interrupted then
										f18_local0( f18_arg0, f18_arg1 )
										return 
									else
										f18_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f18_arg0:setAlpha( 1 )
										f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
									end
								end
								
								if f17_arg1.interrupted then
									f17_local0( f17_arg0, f17_arg1 )
									return 
								else
									f17_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
								end
							end
							
							if f16_arg1.interrupted then
								f16_local0( f16_arg0, f16_arg1 )
								return 
							else
								f16_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f16_arg0:setAlpha( 0 )
								f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
							end
						end
						
						if f15_arg1.interrupted then
							f15_local0( f15_arg0, f15_arg1 )
							return 
						else
							f15_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
						end
					end
					
					if f14_arg1.interrupted then
						f14_local0( f14_arg0, f14_arg1 )
						return 
					else
						f14_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f14_arg0:setAlpha( 0.5 )
						f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
					end
				end
				
				LineL:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
				LineL:setLeftRight( true, false, 24, 93.33 )
				LineL:setTopBottom( true, false, 37, 127.67 )
				LineL:setRGB( 1, 1, 1 )
				LineL:setAlpha( 0 )
				LineL:setZRot( 0 )
				LineL:setZoom( -4 )
				LineL:registerEventHandler( "transition_complete_keyframe", f6_local2 )
				local Pixel1Frame2 = function ( Pixel1, event )
					local Pixel1Frame3 = function ( Pixel1, event )
						if not event.interrupted then
							Pixel1:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel1:setLeftRight( true, false, 14.67, 25.34 )
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
						Pixel3:setLeftRight( true, false, 6.67, 17.34 )
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
						Pixel4:setLeftRight( true, false, 135.67, 146.34 )
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
						Pixel5:setLeftRight( true, false, 70.67, 81.34 )
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
				local f6_local8 = function ( f30_arg0, f30_arg1 )
					local f30_local0 = function ( f31_arg0, f31_arg1 )
						local f31_local0 = function ( f32_arg0, f32_arg1 )
							local f32_local0 = function ( f33_arg0, f33_arg1 )
								local f33_local0 = function ( f34_arg0, f34_arg1 )
									local f34_local0 = function ( f35_arg0, f35_arg1 )
										if not f35_arg1.interrupted then
											f35_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										end
										f35_arg0:setLeftRight( true, false, 65, 86.33 )
										f35_arg0:setTopBottom( true, false, 128, 146.67 )
										f35_arg0:setRGB( 1, 1, 1 )
										f35_arg0:setAlpha( 1 )
										f35_arg0:setXRot( 0 )
										f35_arg0:setZoom( 0 )
										if f35_arg1.interrupted then
											self.clipFinished( f35_arg0, f35_arg1 )
										else
											f35_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f34_arg1.interrupted then
										f34_local0( f34_arg0, f34_arg1 )
										return 
									else
										f34_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f34_arg0:setAlpha( 1 )
										f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
									end
								end
								
								if f33_arg1.interrupted then
									f33_local0( f33_arg0, f33_arg1 )
									return 
								else
									f33_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
								end
							end
							
							if f32_arg1.interrupted then
								f32_local0( f32_arg0, f32_arg1 )
								return 
							else
								f32_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f32_arg0:setAlpha( 0 )
								f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
							end
						end
						
						if f31_arg1.interrupted then
							f31_local0( f31_arg0, f31_arg1 )
							return 
						else
							f31_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
						end
					end
					
					if f30_arg1.interrupted then
						f30_local0( f30_arg0, f30_arg1 )
						return 
					else
						f30_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f30_arg0:setAlpha( 0.5 )
						f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
					end
				end
				
				ArrowD:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
				ArrowD:setLeftRight( true, false, 65, 86.33 )
				ArrowD:setTopBottom( true, false, 128, 146.67 )
				ArrowD:setRGB( 1, 1, 1 )
				ArrowD:setAlpha( 0 )
				ArrowD:setXRot( 0 )
				ArrowD:setZoom( 0 )
				ArrowD:registerEventHandler( "transition_complete_keyframe", f6_local8 )
				local f6_local9 = function ( f36_arg0, f36_arg1 )
					local f36_local0 = function ( f37_arg0, f37_arg1 )
						local f37_local0 = function ( f38_arg0, f38_arg1 )
							local f38_local0 = function ( f39_arg0, f39_arg1 )
								local f39_local0 = function ( f40_arg0, f40_arg1 )
									local f40_local0 = function ( f41_arg0, f41_arg1 )
										if not f41_arg1.interrupted then
											f41_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
										end
										f41_arg0:setLeftRight( true, false, 67.67, 83.67 )
										f41_arg0:setTopBottom( true, false, 1, 11.67 )
										f41_arg0:setRGB( 1, 1, 1 )
										f41_arg0:setAlpha( 1 )
										f41_arg0:setXRot( 0 )
										f41_arg0:setYRot( 0 )
										f41_arg0:setZoom( 0 )
										if f41_arg1.interrupted then
											self.clipFinished( f41_arg0, f41_arg1 )
										else
											f41_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f40_arg1.interrupted then
										f40_local0( f40_arg0, f40_arg1 )
										return 
									else
										f40_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f40_arg0:setAlpha( 1 )
										f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
									end
								end
								
								if f39_arg1.interrupted then
									f39_local0( f39_arg0, f39_arg1 )
									return 
								else
									f39_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
								end
							end
							
							if f38_arg1.interrupted then
								f38_local0( f38_arg0, f38_arg1 )
								return 
							else
								f38_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f38_arg0:setAlpha( 0 )
								f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 )
							end
						end
						
						if f37_arg1.interrupted then
							f37_local0( f37_arg0, f37_arg1 )
							return 
						else
							f37_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
						end
					end
					
					if f36_arg1.interrupted then
						f36_local0( f36_arg0, f36_arg1 )
						return 
					else
						f36_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f36_arg0:setAlpha( 0.5 )
						f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
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
				ArrowT:registerEventHandler( "transition_complete_keyframe", f6_local9 )
				local f6_local10 = function ( f42_arg0, f42_arg1 )
					local f42_local0 = function ( f43_arg0, f43_arg1 )
						local f43_local0 = function ( f44_arg0, f44_arg1 )
							local f44_local0 = function ( f45_arg0, f45_arg1 )
								local f45_local0 = function ( f46_arg0, f46_arg1 )
									local f46_local0 = function ( f47_arg0, f47_arg1 )
										if not f47_arg1.interrupted then
											f47_arg0:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
											f47_arg0.EKGCritical:beginAnimation( "subkeyframe", 349, false, false, CoD.TweenType.Linear )
											f47_arg0.EKGStable:beginAnimation( "subkeyframe", 349, false, false, CoD.TweenType.Linear )
											f47_arg0.EKG2:beginAnimation( "subkeyframe", 349, false, false, CoD.TweenType.Linear )
											f47_arg0.EKG3:beginAnimation( "subkeyframe", 349, false, false, CoD.TweenType.Linear )
											f47_arg0.EKGBlur:beginAnimation( "subkeyframe", 349, false, false, CoD.TweenType.Linear )
											f47_arg0.EKG4:beginAnimation( "subkeyframe", 349, false, false, CoD.TweenType.Linear )
										end
										f47_arg0:setAlpha( 1 )
										f47_arg0:setZoom( 0 )
										f47_arg0.EKGCritical:setRGB( 0, 0, 0 )
										f47_arg0.EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
										f47_arg0.EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
										f47_arg0.EKGStable:setRGB( 0.84, 0.86, 0.92 )
										f47_arg0.EKGStable:setShaderVector( 0, 1.33, 7.57, 3, 0.6 )
										f47_arg0.EKGStable:setShaderVector( 1, 1, 2.2, -0.32, 0 )
										f47_arg0.EKG2:setRGB( 0.36, 0.41, 0.52 )
										f47_arg0.EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
										f47_arg0.EKG3:setRGB( 0.37, 0.42, 0.54 )
										f47_arg0.EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
										f47_arg0.EKGBlur:setAlpha( 0 )
										f47_arg0.EKG4:setRGB( 0.11, 0.15, 0.26 )
										f47_arg0.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
										if f47_arg1.interrupted then
											self.clipFinished( f47_arg0, f47_arg1 )
										else
											f47_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f46_arg1.interrupted then
										f46_local0( f46_arg0, f46_arg1 )
										return 
									else
										f46_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f46_arg0:setAlpha( 1 )
										f46_arg0:setZoom( 0 )
										f46_arg0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
									end
								end
								
								if f45_arg1.interrupted then
									f45_local0( f45_arg0, f45_arg1 )
									return 
								else
									f45_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									f45_arg0:setAlpha( 0.1 )
									f45_arg0:setZoom( -1.2 )
									f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
								end
							end
							
							if f44_arg1.interrupted then
								f44_local0( f44_arg0, f44_arg1 )
								return 
							else
								f44_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f44_arg0:setAlpha( 0 )
								f44_arg0:setZoom( -4.8 )
								f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
							end
						end
						
						if f43_arg1.interrupted then
							f43_local0( f43_arg0, f43_arg1 )
							return 
						else
							f43_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							f43_arg0:setZoom( -6 )
							f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
						end
					end
					
					if f42_arg1.interrupted then
						f42_local0( f42_arg0, f42_arg1 )
						return 
					else
						f42_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f42_arg0:setAlpha( 0.5 )
						f42_arg0:setZoom( -10.8 )
						f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 )
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
				EKG:registerEventHandler( "transition_complete_keyframe", f6_local10 )
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
				local f6_local12 = function ( f56_arg0, f56_arg1 )
					local f56_local0 = function ( f57_arg0, f57_arg1 )
						local f57_local0 = function ( f58_arg0, f58_arg1 )
							local f58_local0 = function ( f59_arg0, f59_arg1 )
								local f59_local0 = function ( f60_arg0, f60_arg1 )
									local f60_local0 = function ( f61_arg0, f61_arg1 )
										if not f61_arg1.interrupted then
											f61_arg0:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
											f61_arg0.HeartContainer:beginAnimation( "subkeyframe", 179, false, false, CoD.TweenType.Linear )
											f61_arg0.TextLabel:beginAnimation( "subkeyframe", 179, false, false, CoD.TweenType.Linear )
										end
										f61_arg0:setLeftRight( false, false, -47.67, -13 )
										f61_arg0:setTopBottom( false, true, -75, -40.33 )
										f61_arg0:setAlpha( 1 )
										f61_arg0:setZoom( 2 )
										f61_arg0.HeartContainer:setRGB( 1, 1, 1 )
										f61_arg0.TextLabel:setRGB( 1, 1, 1 )
										f61_arg0.TextLabel:setText( Engine.Localize( "85" ) )
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
										f60_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f60_arg0:setAlpha( 0.5 )
										f60_arg0:registerEventHandler( "transition_complete_keyframe", f60_local0 )
									end
								end
								
								if f59_arg1.interrupted then
									f59_local0( f59_arg0, f59_arg1 )
									return 
								else
									f59_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									f59_arg0:setAlpha( 1 )
									f59_arg0:registerEventHandler( "transition_complete_keyframe", f59_local0 )
								end
							end
							
							if f58_arg1.interrupted then
								f58_local0( f58_arg0, f58_arg1 )
								return 
							else
								f58_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f58_arg0:setAlpha( 0 )
								f58_arg0:registerEventHandler( "transition_complete_keyframe", f58_local0 )
							end
						end
						
						if f57_arg1.interrupted then
							f57_local0( f57_arg0, f57_arg1 )
							return 
						else
							f57_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							f57_arg0:registerEventHandler( "transition_complete_keyframe", f57_local0 )
						end
					end
					
					if f56_arg1.interrupted then
						f56_local0( f56_arg0, f56_arg1 )
						return 
					else
						f56_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f56_arg0:setAlpha( 0.5 )
						f56_arg0:registerEventHandler( "transition_complete_keyframe", f56_local0 )
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
				BPM:registerEventHandler( "transition_complete_keyframe", f6_local12 )
				local f6_local13 = function ( f62_arg0, f62_arg1 )
					local f62_local0 = function ( f63_arg0, f63_arg1 )
						local f63_local0 = function ( f64_arg0, f64_arg1 )
							local f64_local0 = function ( f65_arg0, f65_arg1 )
								local f65_local0 = function ( f66_arg0, f66_arg1 )
									local f66_local0 = function ( f67_arg0, f67_arg1 )
										if not f67_arg1.interrupted then
											f67_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
											f67_arg0.BP1text:beginAnimation( "subkeyframe", 89, false, false, CoD.TweenType.Linear )
											f67_arg0.BP2text:beginAnimation( "subkeyframe", 89, false, false, CoD.TweenType.Linear )
										end
										f67_arg0:setLeftRight( false, false, -8.33, 50 )
										f67_arg0:setTopBottom( false, true, -65.67, -49.67 )
										f67_arg0:setAlpha( 1 )
										f67_arg0:setZoom( 0 )
										f67_arg0.BP1text:setText( Engine.Localize( "115" ) )
										f67_arg0.BP2text:setText( Engine.Localize( "82" ) )
										if f67_arg1.interrupted then
											self.clipFinished( f67_arg0, f67_arg1 )
										else
											f67_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f66_arg1.interrupted then
										f66_local0( f66_arg0, f66_arg1 )
										return 
									else
										f66_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f66_arg0:setAlpha( 1 )
										f66_arg0:registerEventHandler( "transition_complete_keyframe", f66_local0 )
									end
								end
								
								if f65_arg1.interrupted then
									f65_local0( f65_arg0, f65_arg1 )
									return 
								else
									f65_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									f65_arg0:registerEventHandler( "transition_complete_keyframe", f65_local0 )
								end
							end
							
							if f64_arg1.interrupted then
								f64_local0( f64_arg0, f64_arg1 )
								return 
							else
								f64_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f64_arg0:setAlpha( 0 )
								f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
							end
						end
						
						if f63_arg1.interrupted then
							f63_local0( f63_arg0, f63_arg1 )
							return 
						else
							f63_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f63_arg0:registerEventHandler( "transition_complete_keyframe", f63_local0 )
						end
					end
					
					if f62_arg1.interrupted then
						f62_local0( f62_arg0, f62_arg1 )
						return 
					else
						f62_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f62_arg0:setAlpha( 0.5 )
						f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
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
				BP:registerEventHandler( "transition_complete_keyframe", f6_local13 )
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
				local f69_local1 = function ( f71_arg0, f71_arg1 )
					local f71_local0 = function ( f72_arg0, f72_arg1 )
						local f72_local0 = function ( f73_arg0, f73_arg1 )
							local f73_local0 = function ( f74_arg0, f74_arg1 )
								local f74_local0 = function ( f75_arg0, f75_arg1 )
									if not f75_arg1.interrupted then
										f75_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									f75_arg0:setLeftRight( true, false, 47, 116.33 )
									f75_arg0:setTopBottom( true, false, 32, 122.67 )
									f75_arg0:setRGB( 1, 0, 0 )
									f75_arg0:setAlpha( 0.7 )
									f75_arg0:setZRot( -10 )
									f75_arg0:setZoom( -4 )
									if f75_arg1.interrupted then
										self.clipFinished( f75_arg0, f75_arg1 )
									else
										f75_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f74_arg1.interrupted then
									f74_local0( f74_arg0, f74_arg1 )
									return 
								else
									f74_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									f74_arg0:setRGB( 1, 0.08, 0.08 )
									f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
								end
							end
							
							if f73_arg1.interrupted then
								f73_local0( f73_arg0, f73_arg1 )
								return 
							else
								f73_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f73_arg0:setRGB( 1, 0.42, 0.42 )
								f73_arg0:setAlpha( 0 )
								f73_arg0:registerEventHandler( "transition_complete_keyframe", f73_local0 )
							end
						end
						
						if f72_arg1.interrupted then
							f72_local0( f72_arg0, f72_arg1 )
							return 
						else
							f72_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							f72_arg0:setRGB( 1, 0.5, 0.5 )
							f72_arg0:setAlpha( 0.54 )
							f72_arg0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
						end
					end
					
					if f71_arg1.interrupted then
						f71_local0( f71_arg0, f71_arg1 )
						return 
					else
						f71_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f71_arg0:setRGB( 1, 0.92, 0.92 )
						f71_arg0:setAlpha( 0.5 )
						f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
					end
				end
				
				LineR:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				LineR:setLeftRight( true, false, 47, 116.33 )
				LineR:setTopBottom( true, false, 32, 122.67 )
				LineR:setRGB( 1, 1, 1 )
				LineR:setAlpha( 0 )
				LineR:setZRot( -10 )
				LineR:setZoom( -4 )
				LineR:registerEventHandler( "transition_complete_keyframe", f69_local1 )
				local f69_local2 = function ( f76_arg0, f76_arg1 )
					local f76_local0 = function ( f77_arg0, f77_arg1 )
						local f77_local0 = function ( f78_arg0, f78_arg1 )
							local f78_local0 = function ( f79_arg0, f79_arg1 )
								local f79_local0 = function ( f80_arg0, f80_arg1 )
									if not f80_arg1.interrupted then
										f80_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									f80_arg0:setLeftRight( true, false, 34, 103.33 )
									f80_arg0:setTopBottom( true, false, 32, 122.67 )
									f80_arg0:setRGB( 1, 0, 0 )
									f80_arg0:setAlpha( 0.7 )
									f80_arg0:setZRot( -10 )
									f80_arg0:setZoom( -4 )
									if f80_arg1.interrupted then
										self.clipFinished( f80_arg0, f80_arg1 )
									else
										f80_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f79_arg1.interrupted then
									f79_local0( f79_arg0, f79_arg1 )
									return 
								else
									f79_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									f79_arg0:setRGB( 1, 0.08, 0.08 )
									f79_arg0:registerEventHandler( "transition_complete_keyframe", f79_local0 )
								end
							end
							
							if f78_arg1.interrupted then
								f78_local0( f78_arg0, f78_arg1 )
								return 
							else
								f78_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f78_arg0:setRGB( 1, 0.42, 0.42 )
								f78_arg0:setAlpha( 0 )
								f78_arg0:registerEventHandler( "transition_complete_keyframe", f78_local0 )
							end
						end
						
						if f77_arg1.interrupted then
							f77_local0( f77_arg0, f77_arg1 )
							return 
						else
							f77_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							f77_arg0:setRGB( 1, 0.5, 0.5 )
							f77_arg0:setAlpha( 0.54 )
							f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
						end
					end
					
					if f76_arg1.interrupted then
						f76_local0( f76_arg0, f76_arg1 )
						return 
					else
						f76_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f76_arg0:setRGB( 1, 0.92, 0.92 )
						f76_arg0:setAlpha( 0.5 )
						f76_arg0:registerEventHandler( "transition_complete_keyframe", f76_local0 )
					end
				end
				
				LineL:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
				LineL:setLeftRight( true, false, 34, 103.33 )
				LineL:setTopBottom( true, false, 32, 122.67 )
				LineL:setRGB( 1, 1, 1 )
				LineL:setAlpha( 0 )
				LineL:setZRot( -10 )
				LineL:setZoom( -4 )
				LineL:registerEventHandler( "transition_complete_keyframe", f69_local2 )
				local Pixel1Frame2 = function ( Pixel1, event )
					local Pixel1Frame3 = function ( Pixel1, event )
						if not event.interrupted then
							Pixel1:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel1:setLeftRight( true, false, 14.67, 25.34 )
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
						Pixel1:setLeftRight( true, false, 69.67, 80.34 )
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
						Pixel3:setLeftRight( true, false, 6.67, 17.34 )
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
						Pixel4:setLeftRight( true, false, 135.67, 146.34 )
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
						Pixel5:setLeftRight( true, false, 70.67, 81.34 )
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
				local f69_local8 = function ( f91_arg0, f91_arg1 )
					local f91_local0 = function ( f92_arg0, f92_arg1 )
						local f92_local0 = function ( f93_arg0, f93_arg1 )
							local f93_local0 = function ( f94_arg0, f94_arg1 )
								local f94_local0 = function ( f95_arg0, f95_arg1 )
									if not f95_arg1.interrupted then
										f95_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f95_arg0:setLeftRight( true, false, 65, 86.33 )
									f95_arg0:setTopBottom( true, false, 128, 146.67 )
									f95_arg0:setRGB( 1, 0, 0 )
									f95_arg0:setAlpha( 1 )
									f95_arg0:setZoom( 0 )
									if f95_arg1.interrupted then
										self.clipFinished( f95_arg0, f95_arg1 )
									else
										f95_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f94_arg1.interrupted then
									f94_local0( f94_arg0, f94_arg1 )
									return 
								else
									f94_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f94_arg0:setRGB( 1, 0.09, 0.09 )
									f94_arg0:registerEventHandler( "transition_complete_keyframe", f94_local0 )
								end
							end
							
							if f93_arg1.interrupted then
								f93_local0( f93_arg0, f93_arg1 )
								return 
							else
								f93_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f93_arg0:setRGB( 1, 0.45, 0.45 )
								f93_arg0:setAlpha( 0 )
								f93_arg0:registerEventHandler( "transition_complete_keyframe", f93_local0 )
							end
						end
						
						if f92_arg1.interrupted then
							f92_local0( f92_arg0, f92_arg1 )
							return 
						else
							f92_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							f92_arg0:setRGB( 1, 0.55, 0.55 )
							f92_arg0:registerEventHandler( "transition_complete_keyframe", f92_local0 )
						end
					end
					
					if f91_arg1.interrupted then
						f91_local0( f91_arg0, f91_arg1 )
						return 
					else
						f91_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f91_arg0:setRGB( 1, 0.91, 0.91 )
						f91_arg0:setAlpha( 0.5 )
						f91_arg0:registerEventHandler( "transition_complete_keyframe", f91_local0 )
					end
				end
				
				ArrowD:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
				ArrowD:setLeftRight( true, false, 65, 86.33 )
				ArrowD:setTopBottom( true, false, 128, 146.67 )
				ArrowD:setRGB( 1, 1, 1 )
				ArrowD:setAlpha( 0 )
				ArrowD:setZoom( 0 )
				ArrowD:registerEventHandler( "transition_complete_keyframe", f69_local8 )
				local f69_local9 = function ( f96_arg0, f96_arg1 )
					local f96_local0 = function ( f97_arg0, f97_arg1 )
						local f97_local0 = function ( f98_arg0, f98_arg1 )
							local f98_local0 = function ( f99_arg0, f99_arg1 )
								local f99_local0 = function ( f100_arg0, f100_arg1 )
									if not f100_arg1.interrupted then
										f100_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f100_arg0:setLeftRight( true, false, 67.67, 83.67 )
									f100_arg0:setTopBottom( true, false, 26.67, 37.34 )
									f100_arg0:setAlpha( 1 )
									f100_arg0:setXRot( -180 )
									f100_arg0:setZoom( 0 )
									if f100_arg1.interrupted then
										self.clipFinished( f100_arg0, f100_arg1 )
									else
										f100_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f99_arg1.interrupted then
									f99_local0( f99_arg0, f99_arg1 )
									return 
								else
									f99_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f99_arg0:registerEventHandler( "transition_complete_keyframe", f99_local0 )
								end
							end
							
							if f98_arg1.interrupted then
								f98_local0( f98_arg0, f98_arg1 )
								return 
							else
								f98_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f98_arg0:setAlpha( 0 )
								f98_arg0:registerEventHandler( "transition_complete_keyframe", f98_local0 )
							end
						end
						
						if f97_arg1.interrupted then
							f97_local0( f97_arg0, f97_arg1 )
							return 
						else
							f97_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f97_arg0:registerEventHandler( "transition_complete_keyframe", f97_local0 )
						end
					end
					
					if f96_arg1.interrupted then
						f96_local0( f96_arg0, f96_arg1 )
						return 
					else
						f96_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f96_arg0:setAlpha( 0.5 )
						f96_arg0:registerEventHandler( "transition_complete_keyframe", f96_local0 )
					end
				end
				
				ArrowT:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
				ArrowT:setLeftRight( true, false, 67.67, 83.67 )
				ArrowT:setTopBottom( true, false, 26.67, 37.34 )
				ArrowT:setAlpha( 0 )
				ArrowT:setXRot( -180 )
				ArrowT:setZoom( 0 )
				ArrowT:registerEventHandler( "transition_complete_keyframe", f69_local9 )
				local f69_local10 = function ( f101_arg0, f101_arg1 )
					local f101_local0 = function ( f102_arg0, f102_arg1 )
						local f102_local0 = function ( f103_arg0, f103_arg1 )
							local f103_local0 = function ( f104_arg0, f104_arg1 )
								local f104_local0 = function ( f105_arg0, f105_arg1 )
									if not f105_arg1.interrupted then
										f105_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f105_arg0.EKGCritical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f105_arg0.EKGStable:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f105_arg0.EKG2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f105_arg0.EKG3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f105_arg0.EKGBlur:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f105_arg0.EKG4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f105_arg0:setAlpha( 1 )
									f105_arg0:setZoom( 0 )
									f105_arg0.EKGCritical:setRGB( 1, 0, 0.08 )
									f105_arg0.EKGCritical:setShaderVector( 0, 2, 10.21, 4, 0.97 )
									f105_arg0.EKGCritical:setShaderVector( 1, 0.18, 1, 0.05, 0 )
									f105_arg0.EKGStable:setRGB( 1, 0.06, 0 )
									f105_arg0.EKGStable:setShaderVector( 0, 1.33, 7.57, 4, 0.6 )
									f105_arg0.EKGStable:setShaderVector( 1, 1.01, 4, -0.32, 0 )
									f105_arg0.EKG2:setRGB( 0.75, 0, 0 )
									f105_arg0.EKG2:setShaderVector( 1, 0.3, 0, 0, 0 )
									f105_arg0.EKG3:setRGB( 1, 0, 0 )
									f105_arg0.EKG3:setShaderVector( 1, 0.2, 0, 0, 0 )
									f105_arg0.EKGBlur:setAlpha( 1 )
									f105_arg0.EKG4:setRGB( 0.54, 0, 0 )
									f105_arg0.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
									if f105_arg1.interrupted then
										self.clipFinished( f105_arg0, f105_arg1 )
									else
										f105_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f104_arg1.interrupted then
									f104_local0( f104_arg0, f104_arg1 )
									return 
								else
									f104_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									f104_arg0:setZoom( -0.92 )
									f104_arg0:registerEventHandler( "transition_complete_keyframe", f104_local0 )
								end
							end
							
							if f103_arg1.interrupted then
								f103_local0( f103_arg0, f103_arg1 )
								return 
							else
								f103_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f103_arg0:setAlpha( 0 )
								f103_arg0:setZoom( -5.54 )
								f103_arg0:registerEventHandler( "transition_complete_keyframe", f103_local0 )
							end
						end
						
						if f102_arg1.interrupted then
							f102_local0( f102_arg0, f102_arg1 )
							return 
						else
							f102_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							f102_arg0:setZoom( -6.46 )
							f102_arg0:registerEventHandler( "transition_complete_keyframe", f102_local0 )
						end
					end
					
					if f101_arg1.interrupted then
						f101_local0( f101_arg0, f101_arg1 )
						return 
					else
						f101_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f101_arg0:setAlpha( 0.5 )
						f101_arg0:setZoom( -11.08 )
						f101_arg0:registerEventHandler( "transition_complete_keyframe", f101_local0 )
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
				EKG:registerEventHandler( "transition_complete_keyframe", f69_local10 )
				TextTitle:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
				TextTitle:setAlpha( 0 )
				TextTitle:setZoom( 3 )
				TextTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local f69_local11 = function ( f106_arg0, f106_arg1 )
					local f106_local0 = function ( f107_arg0, f107_arg1 )
						local f107_local0 = function ( f108_arg0, f108_arg1 )
							local f108_local0 = function ( f109_arg0, f109_arg1 )
								local f109_local0 = function ( f110_arg0, f110_arg1 )
									if not f110_arg1.interrupted then
										f110_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f110_arg0.HeartContainer:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										f110_arg0.TextLabel:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									end
									f110_arg0:setLeftRight( false, false, 18.33, 53 )
									f110_arg0:setTopBottom( false, true, -75, -40.33 )
									f110_arg0:setAlpha( 1 )
									f110_arg0.HeartContainer:setRGB( 1, 0, 0 )
									f110_arg0.TextLabel:setRGB( 1, 1, 1 )
									f110_arg0.TextLabel:setText( Engine.Localize( "176" ) )
									if f110_arg1.interrupted then
										self.clipFinished( f110_arg0, f110_arg1 )
									else
										f110_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f109_arg1.interrupted then
									f109_local0( f109_arg0, f109_arg1 )
									return 
								else
									f109_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									f109_arg0:registerEventHandler( "transition_complete_keyframe", f109_local0 )
								end
							end
							
							if f108_arg1.interrupted then
								f108_local0( f108_arg0, f108_arg1 )
								return 
							else
								f108_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f108_arg0:setAlpha( 0 )
								f108_arg0:registerEventHandler( "transition_complete_keyframe", f108_local0 )
							end
						end
						
						if f107_arg1.interrupted then
							f107_local0( f107_arg0, f107_arg1 )
							return 
						else
							f107_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							f107_arg0:registerEventHandler( "transition_complete_keyframe", f107_local0 )
						end
					end
					
					if f106_arg1.interrupted then
						f106_local0( f106_arg0, f106_arg1 )
						return 
					else
						f106_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f106_arg0:setAlpha( 0.5 )
						f106_arg0:registerEventHandler( "transition_complete_keyframe", f106_local0 )
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
				BPM:registerEventHandler( "transition_complete_keyframe", f69_local11 )
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
				local f69_local14 = function ( f113_arg0, f113_arg1 )
					local f113_local0 = function ( f114_arg0, f114_arg1 )
						local f114_local0 = function ( f115_arg0, f115_arg1 )
							local f115_local0 = function ( f116_arg0, f116_arg1 )
								local f116_local0 = function ( f117_arg0, f117_arg1 )
									if not f117_arg1.interrupted then
										f117_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f117_arg0:setLeftRight( true, false, 21.33, 96 )
									f117_arg0:setTopBottom( true, false, 90, 116.67 )
									f117_arg0:setAlpha( 1 )
									f117_arg0:setZoom( 2 )
									if f117_arg1.interrupted then
										self.clipFinished( f117_arg0, f117_arg1 )
									else
										f117_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f116_arg1.interrupted then
									f116_local0( f116_arg0, f116_arg1 )
									return 
								else
									f116_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									f116_arg0:registerEventHandler( "transition_complete_keyframe", f116_local0 )
								end
							end
							
							if f115_arg1.interrupted then
								f115_local0( f115_arg0, f115_arg1 )
								return 
							else
								f115_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f115_arg0:setAlpha( 0 )
								f115_arg0:registerEventHandler( "transition_complete_keyframe", f115_local0 )
							end
						end
						
						if f114_arg1.interrupted then
							f114_local0( f114_arg0, f114_arg1 )
							return 
						else
							f114_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							f114_arg0:registerEventHandler( "transition_complete_keyframe", f114_local0 )
						end
					end
					
					if f113_arg1.interrupted then
						f113_local0( f113_arg0, f113_arg1 )
						return 
					else
						f113_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f113_arg0:setAlpha( 0.5 )
						f113_arg0:registerEventHandler( "transition_complete_keyframe", f113_local0 )
					end
				end
				
				DangerMessage:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
				DangerMessage:setLeftRight( true, false, 21.33, 96 )
				DangerMessage:setTopBottom( true, false, 90, 116.67 )
				DangerMessage:setAlpha( 0 )
				DangerMessage:setZoom( 2 )
				DangerMessage:registerEventHandler( "transition_complete_keyframe", f69_local14 )
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
				local f118_local1 = function ( f120_arg0, f120_arg1 )
					local f120_local0 = function ( f121_arg0, f121_arg1 )
						local f121_local0 = function ( f122_arg0, f122_arg1 )
							local f122_local0 = function ( f123_arg0, f123_arg1 )
								local f123_local0 = function ( f124_arg0, f124_arg1 )
									if not f124_arg1.interrupted then
										f124_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f124_arg0:setLeftRight( true, false, 57, 126.33 )
									f124_arg0:setTopBottom( true, false, 37, 127.67 )
									f124_arg0:setRGB( 1, 1, 1 )
									f124_arg0:setAlpha( 0.2 )
									f124_arg0:setZRot( 0 )
									f124_arg0:setZoom( -4 )
									if f124_arg1.interrupted then
										self.clipFinished( f124_arg0, f124_arg1 )
									else
										f124_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f123_arg1.interrupted then
									f123_local0( f123_arg0, f123_arg1 )
									return 
								else
									f123_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f123_arg0:registerEventHandler( "transition_complete_keyframe", f123_local0 )
								end
							end
							
							if f122_arg1.interrupted then
								f122_local0( f122_arg0, f122_arg1 )
								return 
							else
								f122_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f122_arg0:setAlpha( 0 )
								f122_arg0:registerEventHandler( "transition_complete_keyframe", f122_local0 )
							end
						end
						
						if f121_arg1.interrupted then
							f121_local0( f121_arg0, f121_arg1 )
							return 
						else
							f121_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f121_arg0:registerEventHandler( "transition_complete_keyframe", f121_local0 )
						end
					end
					
					if f120_arg1.interrupted then
						f120_local0( f120_arg0, f120_arg1 )
						return 
					else
						f120_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f120_arg0:setAlpha( 0.5 )
						f120_arg0:registerEventHandler( "transition_complete_keyframe", f120_local0 )
					end
				end
				
				LineR:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
				LineR:setLeftRight( true, false, 57, 126.33 )
				LineR:setTopBottom( true, false, 37, 127.67 )
				LineR:setRGB( 1, 1, 1 )
				LineR:setAlpha( 0 )
				LineR:setZRot( 0 )
				LineR:setZoom( -4 )
				LineR:registerEventHandler( "transition_complete_keyframe", f118_local1 )
				local f118_local2 = function ( f125_arg0, f125_arg1 )
					local f125_local0 = function ( f126_arg0, f126_arg1 )
						local f126_local0 = function ( f127_arg0, f127_arg1 )
							local f127_local0 = function ( f128_arg0, f128_arg1 )
								local f128_local0 = function ( f129_arg0, f129_arg1 )
									if not f129_arg1.interrupted then
										f129_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f129_arg0:setLeftRight( true, false, 24, 93.33 )
									f129_arg0:setTopBottom( true, false, 37, 127.67 )
									f129_arg0:setRGB( 1, 1, 1 )
									f129_arg0:setAlpha( 0.2 )
									f129_arg0:setZRot( 0 )
									f129_arg0:setZoom( -4 )
									if f129_arg1.interrupted then
										self.clipFinished( f129_arg0, f129_arg1 )
									else
										f129_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f128_arg1.interrupted then
									f128_local0( f128_arg0, f128_arg1 )
									return 
								else
									f128_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f128_arg0:registerEventHandler( "transition_complete_keyframe", f128_local0 )
								end
							end
							
							if f127_arg1.interrupted then
								f127_local0( f127_arg0, f127_arg1 )
								return 
							else
								f127_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f127_arg0:setAlpha( 0 )
								f127_arg0:registerEventHandler( "transition_complete_keyframe", f127_local0 )
							end
						end
						
						if f126_arg1.interrupted then
							f126_local0( f126_arg0, f126_arg1 )
							return 
						else
							f126_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f126_arg0:registerEventHandler( "transition_complete_keyframe", f126_local0 )
						end
					end
					
					if f125_arg1.interrupted then
						f125_local0( f125_arg0, f125_arg1 )
						return 
					else
						f125_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f125_arg0:setAlpha( 0.5 )
						f125_arg0:registerEventHandler( "transition_complete_keyframe", f125_local0 )
					end
				end
				
				LineL:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Linear )
				LineL:setLeftRight( true, false, 24, 93.33 )
				LineL:setTopBottom( true, false, 37, 127.67 )
				LineL:setRGB( 1, 1, 1 )
				LineL:setAlpha( 0 )
				LineL:setZRot( 0 )
				LineL:setZoom( -4 )
				LineL:registerEventHandler( "transition_complete_keyframe", f118_local2 )
				local Pixel1Frame2 = function ( Pixel1, event )
					local Pixel1Frame3 = function ( Pixel1, event )
						if not event.interrupted then
							Pixel1:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
						end
						Pixel1:setLeftRight( true, false, 14.67, 25.34 )
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
						Pixel3:setLeftRight( true, false, 6.67, 17.34 )
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
						Pixel4:setLeftRight( true, false, 135.67, 146.34 )
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
						Pixel5:setLeftRight( true, false, 70.67, 81.34 )
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
				local f118_local8 = function ( f140_arg0, f140_arg1 )
					local f140_local0 = function ( f141_arg0, f141_arg1 )
						local f141_local0 = function ( f142_arg0, f142_arg1 )
							local f142_local0 = function ( f143_arg0, f143_arg1 )
								local f143_local0 = function ( f144_arg0, f144_arg1 )
									if not f144_arg1.interrupted then
										f144_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f144_arg0:setLeftRight( true, false, 65, 86.33 )
									f144_arg0:setTopBottom( true, false, 128, 146.67 )
									f144_arg0:setRGB( 1, 1, 1 )
									f144_arg0:setAlpha( 1 )
									f144_arg0:setXRot( 0 )
									f144_arg0:setZoom( 0 )
									if f144_arg1.interrupted then
										self.clipFinished( f144_arg0, f144_arg1 )
									else
										f144_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f143_arg1.interrupted then
									f143_local0( f143_arg0, f143_arg1 )
									return 
								else
									f143_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									f143_arg0:registerEventHandler( "transition_complete_keyframe", f143_local0 )
								end
							end
							
							if f142_arg1.interrupted then
								f142_local0( f142_arg0, f142_arg1 )
								return 
							else
								f142_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f142_arg0:setAlpha( 0 )
								f142_arg0:registerEventHandler( "transition_complete_keyframe", f142_local0 )
							end
						end
						
						if f141_arg1.interrupted then
							f141_local0( f141_arg0, f141_arg1 )
							return 
						else
							f141_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f141_arg0:registerEventHandler( "transition_complete_keyframe", f141_local0 )
						end
					end
					
					if f140_arg1.interrupted then
						f140_local0( f140_arg0, f140_arg1 )
						return 
					else
						f140_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f140_arg0:setAlpha( 0.5 )
						f140_arg0:registerEventHandler( "transition_complete_keyframe", f140_local0 )
					end
				end
				
				ArrowD:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
				ArrowD:setLeftRight( true, false, 65, 86.33 )
				ArrowD:setTopBottom( true, false, 128, 146.67 )
				ArrowD:setRGB( 1, 1, 1 )
				ArrowD:setAlpha( 0 )
				ArrowD:setXRot( 0 )
				ArrowD:setZoom( 0 )
				ArrowD:registerEventHandler( "transition_complete_keyframe", f118_local8 )
				local f118_local9 = function ( f145_arg0, f145_arg1 )
					local f145_local0 = function ( f146_arg0, f146_arg1 )
						local f146_local0 = function ( f147_arg0, f147_arg1 )
							local f147_local0 = function ( f148_arg0, f148_arg1 )
								local f148_local0 = function ( f149_arg0, f149_arg1 )
									if not f149_arg1.interrupted then
										f149_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f149_arg0:setLeftRight( true, false, 67.67, 83.67 )
									f149_arg0:setTopBottom( true, false, 1, 11.67 )
									f149_arg0:setRGB( 1, 1, 1 )
									f149_arg0:setAlpha( 1 )
									f149_arg0:setXRot( 0 )
									f149_arg0:setYRot( 0 )
									f149_arg0:setZoom( 0 )
									if f149_arg1.interrupted then
										self.clipFinished( f149_arg0, f149_arg1 )
									else
										f149_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f148_arg1.interrupted then
									f148_local0( f148_arg0, f148_arg1 )
									return 
								else
									f148_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f148_arg0:registerEventHandler( "transition_complete_keyframe", f148_local0 )
								end
							end
							
							if f147_arg1.interrupted then
								f147_local0( f147_arg0, f147_arg1 )
								return 
							else
								f147_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f147_arg0:setAlpha( 0 )
								f147_arg0:registerEventHandler( "transition_complete_keyframe", f147_local0 )
							end
						end
						
						if f146_arg1.interrupted then
							f146_local0( f146_arg0, f146_arg1 )
							return 
						else
							f146_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f146_arg0:registerEventHandler( "transition_complete_keyframe", f146_local0 )
						end
					end
					
					if f145_arg1.interrupted then
						f145_local0( f145_arg0, f145_arg1 )
						return 
					else
						f145_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f145_arg0:setAlpha( 0.5 )
						f145_arg0:registerEventHandler( "transition_complete_keyframe", f145_local0 )
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
				ArrowT:registerEventHandler( "transition_complete_keyframe", f118_local9 )
				local f118_local10 = function ( f150_arg0, f150_arg1 )
					local f150_local0 = function ( f151_arg0, f151_arg1 )
						local f151_local0 = function ( f152_arg0, f152_arg1 )
							local f152_local0 = function ( f153_arg0, f153_arg1 )
								local f153_local0 = function ( f154_arg0, f154_arg1 )
									if not f154_arg1.interrupted then
										f154_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f154_arg0.EKGCritical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f154_arg0.EKGStable:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f154_arg0.EKG2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f154_arg0.EKG3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f154_arg0.EKGBlur:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f154_arg0.EKG4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f154_arg0:setAlpha( 1 )
									f154_arg0:setZoom( 0 )
									f154_arg0.EKGCritical:setRGB( 0, 0, 0 )
									f154_arg0.EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
									f154_arg0.EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
									f154_arg0.EKGStable:setRGB( 1, 0.48, 0 )
									f154_arg0.EKGStable:setShaderVector( 0, 1.33, 7.57, 6, 0.6 )
									f154_arg0.EKGStable:setShaderVector( 1, 1, 2.2, -0.32, 0 )
									f154_arg0.EKG2:setRGB( 0.42, 0.1, 0 )
									f154_arg0.EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
									f154_arg0.EKG3:setRGB( 0.53, 0.09, 0 )
									f154_arg0.EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
									f154_arg0.EKGBlur:setAlpha( 0 )
									f154_arg0.EKG4:setRGB( 0.11, 0.15, 0.26 )
									f154_arg0.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
									if f154_arg1.interrupted then
										self.clipFinished( f154_arg0, f154_arg1 )
									else
										f154_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f153_arg1.interrupted then
									f153_local0( f153_arg0, f153_arg1 )
									return 
								else
									f153_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									f153_arg0:setZoom( -0.92 )
									f153_arg0:registerEventHandler( "transition_complete_keyframe", f153_local0 )
								end
							end
							
							if f152_arg1.interrupted then
								f152_local0( f152_arg0, f152_arg1 )
								return 
							else
								f152_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f152_arg0:setAlpha( 0 )
								f152_arg0:setZoom( -5.54 )
								f152_arg0:registerEventHandler( "transition_complete_keyframe", f152_local0 )
							end
						end
						
						if f151_arg1.interrupted then
							f151_local0( f151_arg0, f151_arg1 )
							return 
						else
							f151_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							f151_arg0:setZoom( -6.46 )
							f151_arg0:registerEventHandler( "transition_complete_keyframe", f151_local0 )
						end
					end
					
					if f150_arg1.interrupted then
						f150_local0( f150_arg0, f150_arg1 )
						return 
					else
						f150_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f150_arg0:setAlpha( 0.5 )
						f150_arg0:setZoom( -11.08 )
						f150_arg0:registerEventHandler( "transition_complete_keyframe", f150_local0 )
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
				EKG:registerEventHandler( "transition_complete_keyframe", f118_local10 )
				local f118_local11 = function ( f155_arg0, f155_arg1 )
					local f155_local0 = function ( f156_arg0, f156_arg1 )
						local f156_local0 = function ( f157_arg0, f157_arg1 )
							local f157_local0 = function ( f158_arg0, f158_arg1 )
								local f158_local0 = function ( f159_arg0, f159_arg1 )
									if not f159_arg1.interrupted then
										f159_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f159_arg0.TextLabel:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f159_arg0:setRGB( 1, 1, 1 )
									f159_arg0:setAlpha( 1 )
									f159_arg0:setZoom( 3 )
									f159_arg0.TextLabel:setText( Engine.Localize( "SERIOUS" ) )
									if f159_arg1.interrupted then
										self.clipFinished( f159_arg0, f159_arg1 )
									else
										f159_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f158_arg1.interrupted then
									f158_local0( f158_arg0, f158_arg1 )
									return 
								else
									f158_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									f158_arg0:setZoom( 1.23 )
									f158_arg0:registerEventHandler( "transition_complete_keyframe", f158_local0 )
								end
							end
							
							if f157_arg1.interrupted then
								f157_local0( f157_arg0, f157_arg1 )
								return 
							else
								f157_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f157_arg0:setAlpha( 0 )
								f157_arg0:setZoom( -7.62 )
								f157_arg0:registerEventHandler( "transition_complete_keyframe", f157_local0 )
							end
						end
						
						if f156_arg1.interrupted then
							f156_local0( f156_arg0, f156_arg1 )
							return 
						else
							f156_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							f156_arg0:setZoom( -9.38 )
							f156_arg0:registerEventHandler( "transition_complete_keyframe", f156_local0 )
						end
					end
					
					if f155_arg1.interrupted then
						f155_local0( f155_arg0, f155_arg1 )
						return 
					else
						f155_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f155_arg0:setAlpha( 0.5 )
						f155_arg0:setZoom( -18.23 )
						f155_arg0:registerEventHandler( "transition_complete_keyframe", f155_local0 )
					end
				end
				
				TextTitle:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				TextTitle.TextLabel:beginAnimation( "subkeyframe", 280, false, false, CoD.TweenType.Linear )
				TextTitle:setRGB( 1, 1, 1 )
				TextTitle:setAlpha( 0 )
				TextTitle:setZoom( -20 )
				TextTitle.TextLabel:setText( Engine.Localize( "SERIOUS" ) )
				TextTitle:registerEventHandler( "transition_complete_keyframe", f118_local11 )
				local f118_local12 = function ( f160_arg0, f160_arg1 )
					local f160_local0 = function ( f161_arg0, f161_arg1 )
						local f161_local0 = function ( f162_arg0, f162_arg1 )
							local f162_local0 = function ( f163_arg0, f163_arg1 )
								local f163_local0 = function ( f164_arg0, f164_arg1 )
									if not f164_arg1.interrupted then
										f164_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f164_arg0.HeartContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f164_arg0.TextLabel:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f164_arg0:setLeftRight( false, false, -47.67, -13 )
									f164_arg0:setTopBottom( false, true, -75, -40.33 )
									f164_arg0:setAlpha( 1 )
									f164_arg0:setZoom( 2 )
									f164_arg0.HeartContainer:setRGB( 1, 1, 1 )
									f164_arg0.TextLabel:setRGB( 1, 1, 1 )
									f164_arg0.TextLabel:setText( Engine.Localize( "154" ) )
									if f164_arg1.interrupted then
										self.clipFinished( f164_arg0, f164_arg1 )
									else
										f164_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f163_arg1.interrupted then
									f163_local0( f163_arg0, f163_arg1 )
									return 
								else
									f163_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f163_arg0:registerEventHandler( "transition_complete_keyframe", f163_local0 )
								end
							end
							
							if f162_arg1.interrupted then
								f162_local0( f162_arg0, f162_arg1 )
								return 
							else
								f162_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f162_arg0:setAlpha( 0 )
								f162_arg0:registerEventHandler( "transition_complete_keyframe", f162_local0 )
							end
						end
						
						if f161_arg1.interrupted then
							f161_local0( f161_arg0, f161_arg1 )
							return 
						else
							f161_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f161_arg0:registerEventHandler( "transition_complete_keyframe", f161_local0 )
						end
					end
					
					if f160_arg1.interrupted then
						f160_local0( f160_arg0, f160_arg1 )
						return 
					else
						f160_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f160_arg0:setAlpha( 0.5 )
						f160_arg0:registerEventHandler( "transition_complete_keyframe", f160_local0 )
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
				BPM:registerEventHandler( "transition_complete_keyframe", f118_local12 )
				local f118_local13 = function ( f165_arg0, f165_arg1 )
					local f165_local0 = function ( f166_arg0, f166_arg1 )
						local f166_local0 = function ( f167_arg0, f167_arg1 )
							local f167_local0 = function ( f168_arg0, f168_arg1 )
								local f168_local0 = function ( f169_arg0, f169_arg1 )
									if not f169_arg1.interrupted then
										f169_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f169_arg0.BP1text:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f169_arg0.BP2text:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f169_arg0:setLeftRight( false, false, -8.33, 50 )
									f169_arg0:setTopBottom( false, true, -65.67, -49.67 )
									f169_arg0:setAlpha( 1 )
									f169_arg0:setZoom( 0 )
									f169_arg0.BP1text:setText( Engine.Localize( "80" ) )
									f169_arg0.BP2text:setText( Engine.Localize( "59" ) )
									if f169_arg1.interrupted then
										self.clipFinished( f169_arg0, f169_arg1 )
									else
										f169_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f168_arg1.interrupted then
									f168_local0( f168_arg0, f168_arg1 )
									return 
								else
									f168_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									f168_arg0:registerEventHandler( "transition_complete_keyframe", f168_local0 )
								end
							end
							
							if f167_arg1.interrupted then
								f167_local0( f167_arg0, f167_arg1 )
								return 
							else
								f167_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f167_arg0:setAlpha( 0 )
								f167_arg0:registerEventHandler( "transition_complete_keyframe", f167_local0 )
							end
						end
						
						if f166_arg1.interrupted then
							f166_local0( f166_arg0, f166_arg1 )
							return 
						else
							f166_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f166_arg0:registerEventHandler( "transition_complete_keyframe", f166_local0 )
						end
					end
					
					if f165_arg1.interrupted then
						f165_local0( f165_arg0, f165_arg1 )
						return 
					else
						f165_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f165_arg0:setAlpha( 0.5 )
						f165_arg0:registerEventHandler( "transition_complete_keyframe", f165_local0 )
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
				BP:registerEventHandler( "transition_complete_keyframe", f118_local13 )
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
				self.Pixel1:setLeftRight( true, false, 14.67, 25.34 )
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
				self.Pixel3:setLeftRight( true, false, 6.67, 17.34 )
				self.Pixel3:setTopBottom( true, false, 106, 116.67 )
				self.Pixel3:setAlpha( 1 )
				self.Pixel3:setZoom( -2 )
				self.clipFinished( Pixel3, {} )
				Pixel4:completeAnimation()
				self.Pixel4:setLeftRight( true, false, 135.67, 146.34 )
				self.Pixel4:setTopBottom( true, false, 106, 116.67 )
				self.Pixel4:setAlpha( 1 )
				self.Pixel4:setZoom( -2 )
				self.clipFinished( Pixel4, {} )
				Pixel5:completeAnimation()
				self.Pixel5:setLeftRight( true, false, 70.67, 81.34 )
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
				local f192_local1 = function ( f194_arg0, f194_arg1 )
					local f194_local0 = function ( f195_arg0, f195_arg1 )
						local f195_local0 = function ( f196_arg0, f196_arg1 )
							local f196_local0 = function ( f197_arg0, f197_arg1 )
								local f197_local0 = function ( f198_arg0, f198_arg1 )
									if not f198_arg1.interrupted then
										f198_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f198_arg0:setLeftRight( true, false, 57, 126.33 )
									f198_arg0:setTopBottom( true, false, 37, 127.67 )
									f198_arg0:setRGB( 1, 1, 1 )
									f198_arg0:setAlpha( 0 )
									f198_arg0:setZRot( 0 )
									f198_arg0:setZoom( -4 )
									if f198_arg1.interrupted then
										self.clipFinished( f198_arg0, f198_arg1 )
									else
										f198_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f197_arg1.interrupted then
									f197_local0( f197_arg0, f197_arg1 )
									return 
								else
									f197_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									f197_arg0:registerEventHandler( "transition_complete_keyframe", f197_local0 )
								end
							end
							
							if f196_arg1.interrupted then
								f196_local0( f196_arg0, f196_arg1 )
								return 
							else
								f196_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f196_arg0:setAlpha( 0.5 )
								f196_arg0:registerEventHandler( "transition_complete_keyframe", f196_local0 )
							end
						end
						
						if f195_arg1.interrupted then
							f195_local0( f195_arg0, f195_arg1 )
							return 
						else
							f195_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f195_arg0:registerEventHandler( "transition_complete_keyframe", f195_local0 )
						end
					end
					
					if f194_arg1.interrupted then
						f194_local0( f194_arg0, f194_arg1 )
						return 
					else
						f194_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f194_arg0:setAlpha( 0 )
						f194_arg0:registerEventHandler( "transition_complete_keyframe", f194_local0 )
					end
				end
				
				LineR:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
				LineR:setLeftRight( true, false, 57, 126.33 )
				LineR:setTopBottom( true, false, 37, 127.67 )
				LineR:setRGB( 1, 1, 1 )
				LineR:setAlpha( 0.2 )
				LineR:setZRot( 0 )
				LineR:setZoom( -4 )
				LineR:registerEventHandler( "transition_complete_keyframe", f192_local1 )
				local f192_local2 = function ( f199_arg0, f199_arg1 )
					local f199_local0 = function ( f200_arg0, f200_arg1 )
						local f200_local0 = function ( f201_arg0, f201_arg1 )
							local f201_local0 = function ( f202_arg0, f202_arg1 )
								local f202_local0 = function ( f203_arg0, f203_arg1 )
									if not f203_arg1.interrupted then
										f203_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f203_arg0:setLeftRight( true, false, 24, 93.33 )
									f203_arg0:setTopBottom( true, false, 37, 127.67 )
									f203_arg0:setRGB( 1, 1, 1 )
									f203_arg0:setAlpha( 0 )
									f203_arg0:setZRot( 0 )
									f203_arg0:setZoom( -4 )
									if f203_arg1.interrupted then
										self.clipFinished( f203_arg0, f203_arg1 )
									else
										f203_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f202_arg1.interrupted then
									f202_local0( f202_arg0, f202_arg1 )
									return 
								else
									f202_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									f202_arg0:registerEventHandler( "transition_complete_keyframe", f202_local0 )
								end
							end
							
							if f201_arg1.interrupted then
								f201_local0( f201_arg0, f201_arg1 )
								return 
							else
								f201_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f201_arg0:setAlpha( 0.5 )
								f201_arg0:registerEventHandler( "transition_complete_keyframe", f201_local0 )
							end
						end
						
						if f200_arg1.interrupted then
							f200_local0( f200_arg0, f200_arg1 )
							return 
						else
							f200_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f200_arg0:registerEventHandler( "transition_complete_keyframe", f200_local0 )
						end
					end
					
					if f199_arg1.interrupted then
						f199_local0( f199_arg0, f199_arg1 )
						return 
					else
						f199_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f199_arg0:setAlpha( 0 )
						f199_arg0:registerEventHandler( "transition_complete_keyframe", f199_local0 )
					end
				end
				
				LineL:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
				LineL:setLeftRight( true, false, 24, 93.33 )
				LineL:setTopBottom( true, false, 37, 127.67 )
				LineL:setRGB( 1, 1, 1 )
				LineL:setAlpha( 0.2 )
				LineL:setZRot( 0 )
				LineL:setZoom( -4 )
				LineL:registerEventHandler( "transition_complete_keyframe", f192_local2 )
				local f192_local3 = function ( f204_arg0, f204_arg1 )
					if not f204_arg1.interrupted then
						f204_arg0:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Linear )
					end
					f204_arg0:setLeftRight( true, false, 69.67, 80.34 )
					f204_arg0:setTopBottom( true, false, 137.34, 148.01 )
					f204_arg0:setAlpha( 0 )
					f204_arg0:setZoom( -2 )
					if f204_arg1.interrupted then
						self.clipFinished( f204_arg0, f204_arg1 )
					else
						f204_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel1:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Pixel1:setLeftRight( true, false, 14.67, 25.34 )
				Pixel1:setTopBottom( true, false, 18, 28.67 )
				Pixel1:setAlpha( 1 )
				Pixel1:setZoom( -2 )
				Pixel1:registerEventHandler( "transition_complete_keyframe", f192_local3 )
				local f192_local4 = function ( f205_arg0, f205_arg1 )
					if not f205_arg1.interrupted then
						f205_arg0:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Linear )
					end
					f205_arg0:setLeftRight( true, false, 71, 81.67 )
					f205_arg0:setTopBottom( true, false, 137.34, 148.01 )
					f205_arg0:setAlpha( 0 )
					f205_arg0:setZoom( -2 )
					if f205_arg1.interrupted then
						self.clipFinished( f205_arg0, f205_arg1 )
					else
						f205_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel2:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Pixel2:setLeftRight( true, false, 126.67, 137.34 )
				Pixel2:setTopBottom( true, false, 18, 28.67 )
				Pixel2:setAlpha( 1 )
				Pixel2:setZoom( -2 )
				Pixel2:registerEventHandler( "transition_complete_keyframe", f192_local4 )
				local f192_local5 = function ( f206_arg0, f206_arg1 )
					if not f206_arg1.interrupted then
						f206_arg0:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Linear )
					end
					f206_arg0:setLeftRight( true, false, 69.67, 80.34 )
					f206_arg0:setTopBottom( true, false, 137.34, 148.01 )
					f206_arg0:setAlpha( 0 )
					f206_arg0:setZoom( -2 )
					if f206_arg1.interrupted then
						self.clipFinished( f206_arg0, f206_arg1 )
					else
						f206_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel3:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Pixel3:setLeftRight( true, false, 6.67, 17.34 )
				Pixel3:setTopBottom( true, false, 106, 116.67 )
				Pixel3:setAlpha( 1 )
				Pixel3:setZoom( -2 )
				Pixel3:registerEventHandler( "transition_complete_keyframe", f192_local5 )
				local f192_local6 = function ( f207_arg0, f207_arg1 )
					if not f207_arg1.interrupted then
						f207_arg0:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Linear )
					end
					f207_arg0:setLeftRight( true, false, 71, 81.67 )
					f207_arg0:setTopBottom( true, false, 137.34, 148.01 )
					f207_arg0:setAlpha( 0 )
					f207_arg0:setZoom( -2 )
					if f207_arg1.interrupted then
						self.clipFinished( f207_arg0, f207_arg1 )
					else
						f207_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel4:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Pixel4:setLeftRight( true, false, 135.67, 146.34 )
				Pixel4:setTopBottom( true, false, 106, 116.67 )
				Pixel4:setAlpha( 1 )
				Pixel4:setZoom( -2 )
				Pixel4:registerEventHandler( "transition_complete_keyframe", f192_local6 )
				local f192_local7 = function ( f208_arg0, f208_arg1 )
					if not f208_arg1.interrupted then
						f208_arg0:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Linear )
					end
					f208_arg0:setLeftRight( true, false, 71, 81.67 )
					f208_arg0:setTopBottom( true, false, 137.34, 148.01 )
					f208_arg0:setAlpha( 0 )
					f208_arg0:setZoom( -2 )
					if f208_arg1.interrupted then
						self.clipFinished( f208_arg0, f208_arg1 )
					else
						f208_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel5:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				Pixel5:setLeftRight( true, false, 70.67, 81.34 )
				Pixel5:setTopBottom( true, false, 148, 158.67 )
				Pixel5:setAlpha( 1 )
				Pixel5:setZoom( -2 )
				Pixel5:registerEventHandler( "transition_complete_keyframe", f192_local7 )
				local f192_local8 = function ( f209_arg0, f209_arg1 )
					local f209_local0 = function ( f210_arg0, f210_arg1 )
						local f210_local0 = function ( f211_arg0, f211_arg1 )
							local f211_local0 = function ( f212_arg0, f212_arg1 )
								local f212_local0 = function ( f213_arg0, f213_arg1 )
									if not f213_arg1.interrupted then
										f213_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									f213_arg0:setLeftRight( true, false, 65, 86.33 )
									f213_arg0:setTopBottom( true, false, 128, 146.67 )
									f213_arg0:setRGB( 1, 1, 1 )
									f213_arg0:setAlpha( 0 )
									f213_arg0:setXRot( 0 )
									f213_arg0:setZoom( 0 )
									if f213_arg1.interrupted then
										self.clipFinished( f213_arg0, f213_arg1 )
									else
										f213_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f212_arg1.interrupted then
									f212_local0( f212_arg0, f212_arg1 )
									return 
								else
									f212_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									f212_arg0:registerEventHandler( "transition_complete_keyframe", f212_local0 )
								end
							end
							
							if f211_arg1.interrupted then
								f211_local0( f211_arg0, f211_arg1 )
								return 
							else
								f211_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f211_arg0:setAlpha( 0.5 )
								f211_arg0:registerEventHandler( "transition_complete_keyframe", f211_local0 )
							end
						end
						
						if f210_arg1.interrupted then
							f210_local0( f210_arg0, f210_arg1 )
							return 
						else
							f210_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f210_arg0:registerEventHandler( "transition_complete_keyframe", f210_local0 )
						end
					end
					
					if f209_arg1.interrupted then
						f209_local0( f209_arg0, f209_arg1 )
						return 
					else
						f209_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f209_arg0:setAlpha( 0 )
						f209_arg0:registerEventHandler( "transition_complete_keyframe", f209_local0 )
					end
				end
				
				ArrowD:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
				ArrowD:setLeftRight( true, false, 65, 86.33 )
				ArrowD:setTopBottom( true, false, 128, 146.67 )
				ArrowD:setRGB( 1, 1, 1 )
				ArrowD:setAlpha( 1 )
				ArrowD:setXRot( 0 )
				ArrowD:setZoom( 0 )
				ArrowD:registerEventHandler( "transition_complete_keyframe", f192_local8 )
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
				local f192_local10 = function ( f219_arg0, f219_arg1 )
					local f219_local0 = function ( f220_arg0, f220_arg1 )
						local f220_local0 = function ( f221_arg0, f221_arg1 )
							local f221_local0 = function ( f222_arg0, f222_arg1 )
								local f222_local0 = function ( f223_arg0, f223_arg1 )
									if not f223_arg1.interrupted then
										f223_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f223_arg0.EKGCritical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f223_arg0.EKGStable:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f223_arg0.EKG2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f223_arg0.EKG3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f223_arg0.EKGBlur:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f223_arg0.EKG4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f223_arg0:setAlpha( 0 )
									f223_arg0:setZoom( -12 )
									f223_arg0.EKGCritical:setRGB( 0, 0, 0 )
									f223_arg0.EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
									f223_arg0.EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
									f223_arg0.EKGStable:setRGB( 0.84, 0.86, 0.92 )
									f223_arg0.EKGStable:setShaderVector( 0, 1.33, 7.57, 3, 0.6 )
									f223_arg0.EKGStable:setShaderVector( 1, 1, 2.2, -0.32, 0 )
									f223_arg0.EKG2:setRGB( 0.36, 0.41, 0.52 )
									f223_arg0.EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
									f223_arg0.EKG3:setRGB( 0.37, 0.42, 0.54 )
									f223_arg0.EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
									f223_arg0.EKGBlur:setAlpha( 0 )
									f223_arg0.EKG4:setRGB( 0.11, 0.15, 0.26 )
									f223_arg0.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
									if f223_arg1.interrupted then
										self.clipFinished( f223_arg0, f223_arg1 )
									else
										f223_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f222_arg1.interrupted then
									f222_local0( f222_arg0, f222_arg1 )
									return 
								else
									f222_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									f222_arg0:setZoom( -10.91 )
									f222_arg0:registerEventHandler( "transition_complete_keyframe", f222_local0 )
								end
							end
							
							if f221_arg1.interrupted then
								f221_local0( f221_arg0, f221_arg1 )
								return 
							else
								f221_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f221_arg0:setAlpha( 0.5 )
								f221_arg0:setZoom( -7.64 )
								f221_arg0:registerEventHandler( "transition_complete_keyframe", f221_local0 )
							end
						end
						
						if f220_arg1.interrupted then
							f220_local0( f220_arg0, f220_arg1 )
							return 
						else
							f220_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							f220_arg0:setZoom( -6.55 )
							f220_arg0:registerEventHandler( "transition_complete_keyframe", f220_local0 )
						end
					end
					
					if f219_arg1.interrupted then
						f219_local0( f219_arg0, f219_arg1 )
						return 
					else
						f219_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f219_arg0:setAlpha( 0 )
						f219_arg0:setZoom( -1.09 )
						f219_arg0:registerEventHandler( "transition_complete_keyframe", f219_local0 )
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
				EKG:registerEventHandler( "transition_complete_keyframe", f192_local10 )
				local f192_local11 = function ( f224_arg0, f224_arg1 )
					local f224_local0 = function ( f225_arg0, f225_arg1 )
						local f225_local0 = function ( f226_arg0, f226_arg1 )
							local f226_local0 = function ( f227_arg0, f227_arg1 )
								local f227_local0 = function ( f228_arg0, f228_arg1 )
									if not f228_arg1.interrupted then
										f228_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f228_arg0.TextLabel:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f228_arg0:setRGB( 1, 1, 1 )
									f228_arg0:setAlpha( 0 )
									f228_arg0:setZoom( -20 )
									f228_arg0.TextLabel:setText( Engine.Localize( "STABLE" ) )
									if f228_arg1.interrupted then
										self.clipFinished( f228_arg0, f228_arg1 )
									else
										f228_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f227_arg1.interrupted then
									f227_local0( f227_arg0, f227_arg1 )
									return 
								else
									f227_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f227_arg0:setZoom( -17.91 )
									f227_arg0:registerEventHandler( "transition_complete_keyframe", f227_local0 )
								end
							end
							
							if f226_arg1.interrupted then
								f226_local0( f226_arg0, f226_arg1 )
								return 
							else
								f226_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f226_arg0:setAlpha( 0.5 )
								f226_arg0:setZoom( -9.55 )
								f226_arg0:registerEventHandler( "transition_complete_keyframe", f226_local0 )
							end
						end
						
						if f225_arg1.interrupted then
							f225_local0( f225_arg0, f225_arg1 )
							return 
						else
							f225_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							f225_arg0:setZoom( -7.45 )
							f225_arg0:registerEventHandler( "transition_complete_keyframe", f225_local0 )
						end
					end
					
					if f224_arg1.interrupted then
						f224_local0( f224_arg0, f224_arg1 )
						return 
					else
						f224_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f224_arg0:setAlpha( 0 )
						f224_arg0:setZoom( 0.91 )
						f224_arg0:registerEventHandler( "transition_complete_keyframe", f224_local0 )
					end
				end
				
				TextTitle:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				TextTitle.TextLabel:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
				TextTitle:setRGB( 1, 1, 1 )
				TextTitle:setAlpha( 1 )
				TextTitle:setZoom( 3 )
				TextTitle.TextLabel:setText( Engine.Localize( "STABLE" ) )
				TextTitle:registerEventHandler( "transition_complete_keyframe", f192_local11 )
				local f192_local12 = function ( f229_arg0, f229_arg1 )
					local f229_local0 = function ( f230_arg0, f230_arg1 )
						local f230_local0 = function ( f231_arg0, f231_arg1 )
							local f231_local0 = function ( f232_arg0, f232_arg1 )
								local f232_local0 = function ( f233_arg0, f233_arg1 )
									if not f233_arg1.interrupted then
										f233_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f233_arg0.HeartContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f233_arg0.TextLabel:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f233_arg0:setLeftRight( false, false, -47.67, -13 )
									f233_arg0:setTopBottom( false, true, -75, -40.33 )
									f233_arg0:setAlpha( 0 )
									f233_arg0:setZoom( 2 )
									f233_arg0.HeartContainer:setRGB( 1, 1, 1 )
									f233_arg0.TextLabel:setRGB( 1, 1, 1 )
									f233_arg0.TextLabel:setText( Engine.Localize( "85" ) )
									if f233_arg1.interrupted then
										self.clipFinished( f233_arg0, f233_arg1 )
									else
										f233_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f232_arg1.interrupted then
									f232_local0( f232_arg0, f232_arg1 )
									return 
								else
									f232_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									f232_arg0:registerEventHandler( "transition_complete_keyframe", f232_local0 )
								end
							end
							
							if f231_arg1.interrupted then
								f231_local0( f231_arg0, f231_arg1 )
								return 
							else
								f231_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f231_arg0:setAlpha( 0.5 )
								f231_arg0:registerEventHandler( "transition_complete_keyframe", f231_local0 )
							end
						end
						
						if f230_arg1.interrupted then
							f230_local0( f230_arg0, f230_arg1 )
							return 
						else
							f230_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f230_arg0:registerEventHandler( "transition_complete_keyframe", f230_local0 )
						end
					end
					
					if f229_arg1.interrupted then
						f229_local0( f229_arg0, f229_arg1 )
						return 
					else
						f229_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f229_arg0:setAlpha( 0 )
						f229_arg0:registerEventHandler( "transition_complete_keyframe", f229_local0 )
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
				BPM:registerEventHandler( "transition_complete_keyframe", f192_local12 )
				local f192_local13 = function ( f234_arg0, f234_arg1 )
					local f234_local0 = function ( f235_arg0, f235_arg1 )
						local f235_local0 = function ( f236_arg0, f236_arg1 )
							local f236_local0 = function ( f237_arg0, f237_arg1 )
								local f237_local0 = function ( f238_arg0, f238_arg1 )
									if not f238_arg1.interrupted then
										f238_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f238_arg0.BP1text:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f238_arg0.BP2text:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f238_arg0:setLeftRight( false, false, -8.33, 50 )
									f238_arg0:setTopBottom( false, true, -65.67, -49.67 )
									f238_arg0:setAlpha( 0 )
									f238_arg0:setZoom( 0 )
									f238_arg0.BP1text:setText( Engine.Localize( "115" ) )
									f238_arg0.BP2text:setText( Engine.Localize( "82" ) )
									if f238_arg1.interrupted then
										self.clipFinished( f238_arg0, f238_arg1 )
									else
										f238_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f237_arg1.interrupted then
									f237_local0( f237_arg0, f237_arg1 )
									return 
								else
									f237_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									f237_arg0:registerEventHandler( "transition_complete_keyframe", f237_local0 )
								end
							end
							
							if f236_arg1.interrupted then
								f236_local0( f236_arg0, f236_arg1 )
								return 
							else
								f236_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f236_arg0:setAlpha( 0.5 )
								f236_arg0:registerEventHandler( "transition_complete_keyframe", f236_local0 )
							end
						end
						
						if f235_arg1.interrupted then
							f235_local0( f235_arg0, f235_arg1 )
							return 
						else
							f235_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f235_arg0:registerEventHandler( "transition_complete_keyframe", f235_local0 )
						end
					end
					
					if f234_arg1.interrupted then
						f234_local0( f234_arg0, f234_arg1 )
						return 
					else
						f234_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f234_arg0:setAlpha( 0 )
						f234_arg0:registerEventHandler( "transition_complete_keyframe", f234_local0 )
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
				BP:registerEventHandler( "transition_complete_keyframe", f192_local13 )
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
				self.Pixel1:setLeftRight( true, false, 14.67, 25.34 )
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
				self.Pixel3:setLeftRight( true, false, 6.67, 17.34 )
				self.Pixel3:setTopBottom( true, false, 106, 116.67 )
				self.Pixel3:setAlpha( 1 )
				self.Pixel3:setZoom( -2 )
				self.clipFinished( Pixel3, {} )
				Pixel4:completeAnimation()
				self.Pixel4:setLeftRight( true, false, 135.67, 146.34 )
				self.Pixel4:setTopBottom( true, false, 106, 116.67 )
				self.Pixel4:setAlpha( 1 )
				self.Pixel4:setZoom( -2 )
				self.clipFinished( Pixel4, {} )
				Pixel5:completeAnimation()
				self.Pixel5:setLeftRight( true, false, 70.67, 81.34 )
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
				local f280_local1 = function ( f282_arg0, f282_arg1 )
					local f282_local0 = function ( f283_arg0, f283_arg1 )
						local f283_local0 = function ( f284_arg0, f284_arg1 )
							local f284_local0 = function ( f285_arg0, f285_arg1 )
								local f285_local0 = function ( f286_arg0, f286_arg1 )
									if not f286_arg1.interrupted then
										f286_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f286_arg0:setLeftRight( true, false, 57, 126.33 )
									f286_arg0:setTopBottom( true, false, 37, 127.67 )
									f286_arg0:setRGB( 1, 1, 1 )
									f286_arg0:setAlpha( 0 )
									f286_arg0:setZRot( 0 )
									f286_arg0:setZoom( -4 )
									if f286_arg1.interrupted then
										self.clipFinished( f286_arg0, f286_arg1 )
									else
										f286_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f285_arg1.interrupted then
									f285_local0( f285_arg0, f285_arg1 )
									return 
								else
									f285_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									f285_arg0:registerEventHandler( "transition_complete_keyframe", f285_local0 )
								end
							end
							
							if f284_arg1.interrupted then
								f284_local0( f284_arg0, f284_arg1 )
								return 
							else
								f284_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f284_arg0:setAlpha( 0.5 )
								f284_arg0:registerEventHandler( "transition_complete_keyframe", f284_local0 )
							end
						end
						
						if f283_arg1.interrupted then
							f283_local0( f283_arg0, f283_arg1 )
							return 
						else
							f283_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f283_arg0:registerEventHandler( "transition_complete_keyframe", f283_local0 )
						end
					end
					
					if f282_arg1.interrupted then
						f282_local0( f282_arg0, f282_arg1 )
						return 
					else
						f282_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f282_arg0:setAlpha( 0 )
						f282_arg0:registerEventHandler( "transition_complete_keyframe", f282_local0 )
					end
				end
				
				LineR:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				LineR:setLeftRight( true, false, 57, 126.33 )
				LineR:setTopBottom( true, false, 37, 127.67 )
				LineR:setRGB( 1, 1, 1 )
				LineR:setAlpha( 0.2 )
				LineR:setZRot( 0 )
				LineR:setZoom( -4 )
				LineR:registerEventHandler( "transition_complete_keyframe", f280_local1 )
				local f280_local2 = function ( f287_arg0, f287_arg1 )
					local f287_local0 = function ( f288_arg0, f288_arg1 )
						local f288_local0 = function ( f289_arg0, f289_arg1 )
							local f289_local0 = function ( f290_arg0, f290_arg1 )
								local f290_local0 = function ( f291_arg0, f291_arg1 )
									if not f291_arg1.interrupted then
										f291_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f291_arg0:setLeftRight( true, false, 24, 93.33 )
									f291_arg0:setTopBottom( true, false, 37, 127.67 )
									f291_arg0:setRGB( 1, 1, 1 )
									f291_arg0:setAlpha( 0 )
									f291_arg0:setZRot( 0 )
									f291_arg0:setZoom( -4 )
									if f291_arg1.interrupted then
										self.clipFinished( f291_arg0, f291_arg1 )
									else
										f291_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f290_arg1.interrupted then
									f290_local0( f290_arg0, f290_arg1 )
									return 
								else
									f290_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									f290_arg0:registerEventHandler( "transition_complete_keyframe", f290_local0 )
								end
							end
							
							if f289_arg1.interrupted then
								f289_local0( f289_arg0, f289_arg1 )
								return 
							else
								f289_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f289_arg0:setAlpha( 0.5 )
								f289_arg0:registerEventHandler( "transition_complete_keyframe", f289_local0 )
							end
						end
						
						if f288_arg1.interrupted then
							f288_local0( f288_arg0, f288_arg1 )
							return 
						else
							f288_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f288_arg0:registerEventHandler( "transition_complete_keyframe", f288_local0 )
						end
					end
					
					if f287_arg1.interrupted then
						f287_local0( f287_arg0, f287_arg1 )
						return 
					else
						f287_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f287_arg0:setAlpha( 0 )
						f287_arg0:registerEventHandler( "transition_complete_keyframe", f287_local0 )
					end
				end
				
				LineL:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
				LineL:setLeftRight( true, false, 24, 93.33 )
				LineL:setTopBottom( true, false, 37, 127.67 )
				LineL:setRGB( 1, 1, 1 )
				LineL:setAlpha( 0.2 )
				LineL:setZRot( 0 )
				LineL:setZoom( -4 )
				LineL:registerEventHandler( "transition_complete_keyframe", f280_local2 )
				local f280_local3 = function ( f292_arg0, f292_arg1 )
					if not f292_arg1.interrupted then
						f292_arg0:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
					end
					f292_arg0:setLeftRight( true, false, 69.67, 80.34 )
					f292_arg0:setTopBottom( true, false, 137.34, 148.01 )
					f292_arg0:setAlpha( 0 )
					f292_arg0:setZoom( -2 )
					if f292_arg1.interrupted then
						self.clipFinished( f292_arg0, f292_arg1 )
					else
						f292_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel1:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
				Pixel1:setLeftRight( true, false, 14.67, 25.34 )
				Pixel1:setTopBottom( true, false, 18, 28.67 )
				Pixel1:setAlpha( 1 )
				Pixel1:setZoom( -2 )
				Pixel1:registerEventHandler( "transition_complete_keyframe", f280_local3 )
				local f280_local4 = function ( f293_arg0, f293_arg1 )
					if not f293_arg1.interrupted then
						f293_arg0:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
					end
					f293_arg0:setLeftRight( true, false, 71, 81.67 )
					f293_arg0:setTopBottom( true, false, 137.34, 148.01 )
					f293_arg0:setAlpha( 0 )
					f293_arg0:setZoom( -2 )
					if f293_arg1.interrupted then
						self.clipFinished( f293_arg0, f293_arg1 )
					else
						f293_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel2:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
				Pixel2:setLeftRight( true, false, 126.67, 137.34 )
				Pixel2:setTopBottom( true, false, 18, 28.67 )
				Pixel2:setAlpha( 1 )
				Pixel2:setZoom( -2 )
				Pixel2:registerEventHandler( "transition_complete_keyframe", f280_local4 )
				local f280_local5 = function ( f294_arg0, f294_arg1 )
					if not f294_arg1.interrupted then
						f294_arg0:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
					end
					f294_arg0:setLeftRight( true, false, 69.67, 80.34 )
					f294_arg0:setTopBottom( true, false, 137.34, 148.01 )
					f294_arg0:setAlpha( 0 )
					f294_arg0:setZoom( -2 )
					if f294_arg1.interrupted then
						self.clipFinished( f294_arg0, f294_arg1 )
					else
						f294_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel3:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
				Pixel3:setLeftRight( true, false, 6.67, 17.34 )
				Pixel3:setTopBottom( true, false, 106, 116.67 )
				Pixel3:setAlpha( 1 )
				Pixel3:setZoom( -2 )
				Pixel3:registerEventHandler( "transition_complete_keyframe", f280_local5 )
				local f280_local6 = function ( f295_arg0, f295_arg1 )
					if not f295_arg1.interrupted then
						f295_arg0:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
					end
					f295_arg0:setLeftRight( true, false, 71, 81.67 )
					f295_arg0:setTopBottom( true, false, 137.34, 148.01 )
					f295_arg0:setAlpha( 0 )
					f295_arg0:setZoom( -2 )
					if f295_arg1.interrupted then
						self.clipFinished( f295_arg0, f295_arg1 )
					else
						f295_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel4:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
				Pixel4:setLeftRight( true, false, 135.67, 146.34 )
				Pixel4:setTopBottom( true, false, 106, 116.67 )
				Pixel4:setAlpha( 1 )
				Pixel4:setZoom( -2 )
				Pixel4:registerEventHandler( "transition_complete_keyframe", f280_local6 )
				local f280_local7 = function ( f296_arg0, f296_arg1 )
					if not f296_arg1.interrupted then
						f296_arg0:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
					end
					f296_arg0:setLeftRight( true, false, 71, 81.67 )
					f296_arg0:setTopBottom( true, false, 137.34, 148.01 )
					f296_arg0:setAlpha( 0 )
					f296_arg0:setZoom( -2 )
					if f296_arg1.interrupted then
						self.clipFinished( f296_arg0, f296_arg1 )
					else
						f296_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel5:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
				Pixel5:setLeftRight( true, false, 70.67, 81.34 )
				Pixel5:setTopBottom( true, false, 148, 158.67 )
				Pixel5:setAlpha( 1 )
				Pixel5:setZoom( -2 )
				Pixel5:registerEventHandler( "transition_complete_keyframe", f280_local7 )
				local f280_local8 = function ( f297_arg0, f297_arg1 )
					local f297_local0 = function ( f298_arg0, f298_arg1 )
						local f298_local0 = function ( f299_arg0, f299_arg1 )
							local f299_local0 = function ( f300_arg0, f300_arg1 )
								local f300_local0 = function ( f301_arg0, f301_arg1 )
									if not f301_arg1.interrupted then
										f301_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f301_arg0:setLeftRight( true, false, 65, 86.33 )
									f301_arg0:setTopBottom( true, false, 128, 146.67 )
									f301_arg0:setRGB( 1, 1, 1 )
									f301_arg0:setAlpha( 0 )
									f301_arg0:setXRot( 0 )
									f301_arg0:setZoom( 0 )
									if f301_arg1.interrupted then
										self.clipFinished( f301_arg0, f301_arg1 )
									else
										f301_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f300_arg1.interrupted then
									f300_local0( f300_arg0, f300_arg1 )
									return 
								else
									f300_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									f300_arg0:registerEventHandler( "transition_complete_keyframe", f300_local0 )
								end
							end
							
							if f299_arg1.interrupted then
								f299_local0( f299_arg0, f299_arg1 )
								return 
							else
								f299_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f299_arg0:setAlpha( 0.5 )
								f299_arg0:registerEventHandler( "transition_complete_keyframe", f299_local0 )
							end
						end
						
						if f298_arg1.interrupted then
							f298_local0( f298_arg0, f298_arg1 )
							return 
						else
							f298_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f298_arg0:registerEventHandler( "transition_complete_keyframe", f298_local0 )
						end
					end
					
					if f297_arg1.interrupted then
						f297_local0( f297_arg0, f297_arg1 )
						return 
					else
						f297_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f297_arg0:setAlpha( 0 )
						f297_arg0:registerEventHandler( "transition_complete_keyframe", f297_local0 )
					end
				end
				
				ArrowD:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				ArrowD:setLeftRight( true, false, 65, 86.33 )
				ArrowD:setTopBottom( true, false, 128, 146.67 )
				ArrowD:setRGB( 1, 1, 1 )
				ArrowD:setAlpha( 1 )
				ArrowD:setXRot( 0 )
				ArrowD:setZoom( 0 )
				ArrowD:registerEventHandler( "transition_complete_keyframe", f280_local8 )
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
				local f280_local10 = function ( f307_arg0, f307_arg1 )
					local f307_local0 = function ( f308_arg0, f308_arg1 )
						local f308_local0 = function ( f309_arg0, f309_arg1 )
							local f309_local0 = function ( f310_arg0, f310_arg1 )
								local f310_local0 = function ( f311_arg0, f311_arg1 )
									if not f311_arg1.interrupted then
										f311_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f311_arg0.EKGCritical:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										f311_arg0.EKGStable:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										f311_arg0.EKG2:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										f311_arg0.EKG3:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										f311_arg0.EKGBlur:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										f311_arg0.EKG4:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									end
									f311_arg0:setAlpha( 0 )
									f311_arg0:setZoom( -12 )
									f311_arg0.EKGCritical:setRGB( 0, 0, 0 )
									f311_arg0.EKGCritical:setShaderVector( 0, 6.33, 10.21, 1, 0.97 )
									f311_arg0.EKGCritical:setShaderVector( 1, 0.18, 3.48, 0.05, 0 )
									f311_arg0.EKGStable:setRGB( 1, 0.48, 0 )
									f311_arg0.EKGStable:setShaderVector( 0, 1.33, 7.57, 6, 0.6 )
									f311_arg0.EKGStable:setShaderVector( 1, 1, 2.2, -0.32, 0 )
									f311_arg0.EKG2:setRGB( 0.42, 0.1, 0 )
									f311_arg0.EKG2:setShaderVector( 1, 0.1, 0, 0, 0 )
									f311_arg0.EKG3:setRGB( 0.53, 0.09, 0 )
									f311_arg0.EKG3:setShaderVector( 1, 0.05, 0, 0, 0 )
									f311_arg0.EKGBlur:setAlpha( 0 )
									f311_arg0.EKG4:setRGB( 0.11, 0.15, 0.26 )
									f311_arg0.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
									if f311_arg1.interrupted then
										self.clipFinished( f311_arg0, f311_arg1 )
									else
										f311_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f310_arg1.interrupted then
									f310_local0( f310_arg0, f310_arg1 )
									return 
								else
									f310_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									f310_arg0:setZoom( -10.91 )
									f310_arg0:registerEventHandler( "transition_complete_keyframe", f310_local0 )
								end
							end
							
							if f309_arg1.interrupted then
								f309_local0( f309_arg0, f309_arg1 )
								return 
							else
								f309_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f309_arg0:setAlpha( 0.5 )
								f309_arg0:setZoom( -6.55 )
								f309_arg0:registerEventHandler( "transition_complete_keyframe", f309_local0 )
							end
						end
						
						if f308_arg1.interrupted then
							f308_local0( f308_arg0, f308_arg1 )
							return 
						else
							f308_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							f308_arg0:setZoom( -5.45 )
							f308_arg0:registerEventHandler( "transition_complete_keyframe", f308_local0 )
						end
					end
					
					if f307_arg1.interrupted then
						f307_local0( f307_arg0, f307_arg1 )
						return 
					else
						f307_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f307_arg0:setAlpha( 0 )
						f307_arg0:setZoom( -1.09 )
						f307_arg0:registerEventHandler( "transition_complete_keyframe", f307_local0 )
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
				EKG:registerEventHandler( "transition_complete_keyframe", f280_local10 )
				local f280_local11 = function ( f312_arg0, f312_arg1 )
					local f312_local0 = function ( f313_arg0, f313_arg1 )
						local f313_local0 = function ( f314_arg0, f314_arg1 )
							local f314_local0 = function ( f315_arg0, f315_arg1 )
								local f315_local0 = function ( f316_arg0, f316_arg1 )
									if not f316_arg1.interrupted then
										f316_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f316_arg0.TextLabel:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									end
									f316_arg0:setRGB( 1, 1, 1 )
									f316_arg0:setAlpha( 0 )
									f316_arg0:setZoom( -20 )
									f316_arg0.TextLabel:setText( Engine.Localize( "SERIOUS" ) )
									if f316_arg1.interrupted then
										self.clipFinished( f316_arg0, f316_arg1 )
									else
										f316_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f315_arg1.interrupted then
									f315_local0( f315_arg0, f315_arg1 )
									return 
								else
									f315_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									f315_arg0:setZoom( -17.91 )
									f315_arg0:registerEventHandler( "transition_complete_keyframe", f315_local0 )
								end
							end
							
							if f314_arg1.interrupted then
								f314_local0( f314_arg0, f314_arg1 )
								return 
							else
								f314_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f314_arg0:setAlpha( 0.5 )
								f314_arg0:setZoom( -9.55 )
								f314_arg0:registerEventHandler( "transition_complete_keyframe", f314_local0 )
							end
						end
						
						if f313_arg1.interrupted then
							f313_local0( f313_arg0, f313_arg1 )
							return 
						else
							f313_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							f313_arg0:setZoom( -7.45 )
							f313_arg0:registerEventHandler( "transition_complete_keyframe", f313_local0 )
						end
					end
					
					if f312_arg1.interrupted then
						f312_local0( f312_arg0, f312_arg1 )
						return 
					else
						f312_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f312_arg0:setAlpha( 0 )
						f312_arg0:setZoom( 0.91 )
						f312_arg0:registerEventHandler( "transition_complete_keyframe", f312_local0 )
					end
				end
				
				TextTitle:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				TextTitle.TextLabel:beginAnimation( "subkeyframe", 119, false, false, CoD.TweenType.Linear )
				TextTitle:setRGB( 1, 1, 1 )
				TextTitle:setAlpha( 1 )
				TextTitle:setZoom( 3 )
				TextTitle.TextLabel:setText( Engine.Localize( "SERIOUS" ) )
				TextTitle:registerEventHandler( "transition_complete_keyframe", f280_local11 )
				local f280_local12 = function ( f317_arg0, f317_arg1 )
					local f317_local0 = function ( f318_arg0, f318_arg1 )
						local f318_local0 = function ( f319_arg0, f319_arg1 )
							local f319_local0 = function ( f320_arg0, f320_arg1 )
								local f320_local0 = function ( f321_arg0, f321_arg1 )
									if not f321_arg1.interrupted then
										f321_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f321_arg0.HeartContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f321_arg0.TextLabel:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f321_arg0:setLeftRight( false, false, -47.67, -13 )
									f321_arg0:setTopBottom( false, true, -75, -40.33 )
									f321_arg0:setAlpha( 0 )
									f321_arg0:setZoom( 2 )
									f321_arg0.HeartContainer:setRGB( 1, 1, 1 )
									f321_arg0.TextLabel:setRGB( 1, 1, 1 )
									f321_arg0.TextLabel:setText( Engine.Localize( "154" ) )
									if f321_arg1.interrupted then
										self.clipFinished( f321_arg0, f321_arg1 )
									else
										f321_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f320_arg1.interrupted then
									f320_local0( f320_arg0, f320_arg1 )
									return 
								else
									f320_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									f320_arg0:registerEventHandler( "transition_complete_keyframe", f320_local0 )
								end
							end
							
							if f319_arg1.interrupted then
								f319_local0( f319_arg0, f319_arg1 )
								return 
							else
								f319_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f319_arg0:setAlpha( 0.5 )
								f319_arg0:registerEventHandler( "transition_complete_keyframe", f319_local0 )
							end
						end
						
						if f318_arg1.interrupted then
							f318_local0( f318_arg0, f318_arg1 )
							return 
						else
							f318_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f318_arg0:registerEventHandler( "transition_complete_keyframe", f318_local0 )
						end
					end
					
					if f317_arg1.interrupted then
						f317_local0( f317_arg0, f317_arg1 )
						return 
					else
						f317_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f317_arg0:setAlpha( 0 )
						f317_arg0:registerEventHandler( "transition_complete_keyframe", f317_local0 )
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
				BPM:registerEventHandler( "transition_complete_keyframe", f280_local12 )
				local f280_local13 = function ( f322_arg0, f322_arg1 )
					local f322_local0 = function ( f323_arg0, f323_arg1 )
						local f323_local0 = function ( f324_arg0, f324_arg1 )
							local f324_local0 = function ( f325_arg0, f325_arg1 )
								local f325_local0 = function ( f326_arg0, f326_arg1 )
									if not f326_arg1.interrupted then
										f326_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f326_arg0.BP1text:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f326_arg0.BP2text:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f326_arg0:setLeftRight( false, false, -8.33, 50 )
									f326_arg0:setTopBottom( false, true, -65.67, -49.67 )
									f326_arg0:setAlpha( 0 )
									f326_arg0:setZoom( 0 )
									f326_arg0.BP1text:setText( Engine.Localize( "80" ) )
									f326_arg0.BP2text:setText( Engine.Localize( "59" ) )
									if f326_arg1.interrupted then
										self.clipFinished( f326_arg0, f326_arg1 )
									else
										f326_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f325_arg1.interrupted then
									f325_local0( f325_arg0, f325_arg1 )
									return 
								else
									f325_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									f325_arg0:registerEventHandler( "transition_complete_keyframe", f325_local0 )
								end
							end
							
							if f324_arg1.interrupted then
								f324_local0( f324_arg0, f324_arg1 )
								return 
							else
								f324_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f324_arg0:setAlpha( 0.5 )
								f324_arg0:registerEventHandler( "transition_complete_keyframe", f324_local0 )
							end
						end
						
						if f323_arg1.interrupted then
							f323_local0( f323_arg0, f323_arg1 )
							return 
						else
							f323_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f323_arg0:registerEventHandler( "transition_complete_keyframe", f323_local0 )
						end
					end
					
					if f322_arg1.interrupted then
						f322_local0( f322_arg0, f322_arg1 )
						return 
					else
						f322_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f322_arg0:setAlpha( 0 )
						f322_arg0:registerEventHandler( "transition_complete_keyframe", f322_local0 )
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
				BP:registerEventHandler( "transition_complete_keyframe", f280_local13 )
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
				self.Pixel1:setLeftRight( true, false, 14.67, 25.34 )
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
				self.Pixel3:setLeftRight( true, false, 6.67, 17.34 )
				self.Pixel3:setTopBottom( true, false, 106, 116.67 )
				self.Pixel3:setAlpha( 1 )
				self.Pixel3:setZoom( -2 )
				self.clipFinished( Pixel3, {} )
				Pixel4:completeAnimation()
				self.Pixel4:setLeftRight( true, false, 135.67, 146.34 )
				self.Pixel4:setTopBottom( true, false, 106, 116.67 )
				self.Pixel4:setAlpha( 1 )
				self.Pixel4:setZoom( -2 )
				self.clipFinished( Pixel4, {} )
				Pixel5:completeAnimation()
				self.Pixel5:setLeftRight( true, false, 70.67, 81.34 )
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
				self.ArrowT:setTopBottom( true, false, 26.67, 37.34 )
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
				local f374_local1 = function ( f376_arg0, f376_arg1 )
					local f376_local0 = function ( f377_arg0, f377_arg1 )
						local f377_local0 = function ( f378_arg0, f378_arg1 )
							local f378_local0 = function ( f379_arg0, f379_arg1 )
								local f379_local0 = function ( f380_arg0, f380_arg1 )
									if not f380_arg1.interrupted then
										f380_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f380_arg0:setLeftRight( true, false, 47, 116.33 )
									f380_arg0:setTopBottom( true, false, 32, 122.67 )
									f380_arg0:setRGB( 1, 1, 1 )
									f380_arg0:setAlpha( 0 )
									f380_arg0:setZRot( -10 )
									f380_arg0:setZoom( -4 )
									if f380_arg1.interrupted then
										self.clipFinished( f380_arg0, f380_arg1 )
									else
										f380_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f379_arg1.interrupted then
									f379_local0( f379_arg0, f379_arg1 )
									return 
								else
									f379_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f379_arg0:setRGB( 1, 0.91, 0.91 )
									f379_arg0:registerEventHandler( "transition_complete_keyframe", f379_local0 )
								end
							end
							
							if f378_arg1.interrupted then
								f378_local0( f378_arg0, f378_arg1 )
								return 
							else
								f378_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f378_arg0:setRGB( 1, 0.55, 0.55 )
								f378_arg0:setAlpha( 0.5 )
								f378_arg0:registerEventHandler( "transition_complete_keyframe", f378_local0 )
							end
						end
						
						if f377_arg1.interrupted then
							f377_local0( f377_arg0, f377_arg1 )
							return 
						else
							f377_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							f377_arg0:setRGB( 1, 0.45, 0.45 )
							f377_arg0:registerEventHandler( "transition_complete_keyframe", f377_local0 )
						end
					end
					
					if f376_arg1.interrupted then
						f376_local0( f376_arg0, f376_arg1 )
						return 
					else
						f376_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f376_arg0:setRGB( 1, 0.09, 0.09 )
						f376_arg0:setAlpha( 0 )
						f376_arg0:registerEventHandler( "transition_complete_keyframe", f376_local0 )
					end
				end
				
				LineR:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
				LineR:setLeftRight( true, false, 47, 116.33 )
				LineR:setTopBottom( true, false, 32, 122.67 )
				LineR:setRGB( 1, 0, 0 )
				LineR:setAlpha( 0.7 )
				LineR:setZRot( -10 )
				LineR:setZoom( -4 )
				LineR:registerEventHandler( "transition_complete_keyframe", f374_local1 )
				local f374_local2 = function ( f381_arg0, f381_arg1 )
					local f381_local0 = function ( f382_arg0, f382_arg1 )
						local f382_local0 = function ( f383_arg0, f383_arg1 )
							local f383_local0 = function ( f384_arg0, f384_arg1 )
								local f384_local0 = function ( f385_arg0, f385_arg1 )
									if not f385_arg1.interrupted then
										f385_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f385_arg0:setLeftRight( true, false, 34, 103.33 )
									f385_arg0:setTopBottom( true, false, 32, 122.67 )
									f385_arg0:setRGB( 1, 1, 1 )
									f385_arg0:setAlpha( 0 )
									f385_arg0:setZRot( -10 )
									f385_arg0:setZoom( -4 )
									if f385_arg1.interrupted then
										self.clipFinished( f385_arg0, f385_arg1 )
									else
										f385_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f384_arg1.interrupted then
									f384_local0( f384_arg0, f384_arg1 )
									return 
								else
									f384_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									f384_arg0:setRGB( 1, 0.91, 0.91 )
									f384_arg0:registerEventHandler( "transition_complete_keyframe", f384_local0 )
								end
							end
							
							if f383_arg1.interrupted then
								f383_local0( f383_arg0, f383_arg1 )
								return 
							else
								f383_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f383_arg0:setRGB( 1, 0.55, 0.55 )
								f383_arg0:setAlpha( 0.5 )
								f383_arg0:registerEventHandler( "transition_complete_keyframe", f383_local0 )
							end
						end
						
						if f382_arg1.interrupted then
							f382_local0( f382_arg0, f382_arg1 )
							return 
						else
							f382_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							f382_arg0:setRGB( 1, 0.45, 0.45 )
							f382_arg0:registerEventHandler( "transition_complete_keyframe", f382_local0 )
						end
					end
					
					if f381_arg1.interrupted then
						f381_local0( f381_arg0, f381_arg1 )
						return 
					else
						f381_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f381_arg0:setRGB( 1, 0.09, 0.09 )
						f381_arg0:setAlpha( 0 )
						f381_arg0:registerEventHandler( "transition_complete_keyframe", f381_local0 )
					end
				end
				
				LineL:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
				LineL:setLeftRight( true, false, 34, 103.33 )
				LineL:setTopBottom( true, false, 32, 122.67 )
				LineL:setRGB( 1, 0, 0 )
				LineL:setAlpha( 0.7 )
				LineL:setZRot( -10 )
				LineL:setZoom( -4 )
				LineL:registerEventHandler( "transition_complete_keyframe", f374_local2 )
				local f374_local3 = function ( f386_arg0, f386_arg1 )
					if not f386_arg1.interrupted then
						f386_arg0:beginAnimation( "keyframe", 180, false, true, CoD.TweenType.Linear )
					end
					f386_arg0:setLeftRight( true, false, 69.67, 80.34 )
					f386_arg0:setTopBottom( true, false, 137.34, 148.01 )
					f386_arg0:setAlpha( 0 )
					f386_arg0:setZRot( 0 )
					f386_arg0:setZoom( -2 )
					if f386_arg1.interrupted then
						self.clipFinished( f386_arg0, f386_arg1 )
					else
						f386_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel1:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
				Pixel1:setLeftRight( true, false, 14.67, 25.34 )
				Pixel1:setTopBottom( true, false, 18, 28.67 )
				Pixel1:setAlpha( 1 )
				Pixel1:setZRot( 0 )
				Pixel1:setZoom( -2 )
				Pixel1:registerEventHandler( "transition_complete_keyframe", f374_local3 )
				local f374_local4 = function ( f387_arg0, f387_arg1 )
					if not f387_arg1.interrupted then
						f387_arg0:beginAnimation( "keyframe", 180, false, true, CoD.TweenType.Linear )
					end
					f387_arg0:setLeftRight( true, false, 71, 81.67 )
					f387_arg0:setTopBottom( true, false, 137.34, 148.01 )
					f387_arg0:setAlpha( 0 )
					f387_arg0:setZoom( -2 )
					if f387_arg1.interrupted then
						self.clipFinished( f387_arg0, f387_arg1 )
					else
						f387_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel2:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
				Pixel2:setLeftRight( true, false, 126.67, 137.34 )
				Pixel2:setTopBottom( true, false, 18, 28.67 )
				Pixel2:setAlpha( 1 )
				Pixel2:setZoom( -2 )
				Pixel2:registerEventHandler( "transition_complete_keyframe", f374_local4 )
				local f374_local5 = function ( f388_arg0, f388_arg1 )
					if not f388_arg1.interrupted then
						f388_arg0:beginAnimation( "keyframe", 180, false, true, CoD.TweenType.Linear )
					end
					f388_arg0:setLeftRight( true, false, 69.67, 80.34 )
					f388_arg0:setTopBottom( true, false, 137.34, 148.01 )
					f388_arg0:setAlpha( 0 )
					f388_arg0:setZoom( -2 )
					if f388_arg1.interrupted then
						self.clipFinished( f388_arg0, f388_arg1 )
					else
						f388_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel3:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
				Pixel3:setLeftRight( true, false, 6.67, 17.34 )
				Pixel3:setTopBottom( true, false, 106, 116.67 )
				Pixel3:setAlpha( 1 )
				Pixel3:setZoom( -2 )
				Pixel3:registerEventHandler( "transition_complete_keyframe", f374_local5 )
				local f374_local6 = function ( f389_arg0, f389_arg1 )
					if not f389_arg1.interrupted then
						f389_arg0:beginAnimation( "keyframe", 180, false, true, CoD.TweenType.Linear )
					end
					f389_arg0:setLeftRight( true, false, 71, 81.67 )
					f389_arg0:setTopBottom( true, false, 137.34, 148.01 )
					f389_arg0:setAlpha( 0 )
					f389_arg0:setZoom( -2 )
					if f389_arg1.interrupted then
						self.clipFinished( f389_arg0, f389_arg1 )
					else
						f389_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel4:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
				Pixel4:setLeftRight( true, false, 135.67, 146.34 )
				Pixel4:setTopBottom( true, false, 106, 116.67 )
				Pixel4:setAlpha( 1 )
				Pixel4:setZoom( -2 )
				Pixel4:registerEventHandler( "transition_complete_keyframe", f374_local6 )
				local f374_local7 = function ( f390_arg0, f390_arg1 )
					if not f390_arg1.interrupted then
						f390_arg0:beginAnimation( "keyframe", 180, false, true, CoD.TweenType.Linear )
					end
					f390_arg0:setLeftRight( true, false, 71, 81.67 )
					f390_arg0:setTopBottom( true, false, 137.34, 148.01 )
					f390_arg0:setAlpha( 0 )
					f390_arg0:setZoom( -2 )
					if f390_arg1.interrupted then
						self.clipFinished( f390_arg0, f390_arg1 )
					else
						f390_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel5:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
				Pixel5:setLeftRight( true, false, 70.67, 81.34 )
				Pixel5:setTopBottom( true, false, 148, 158.67 )
				Pixel5:setAlpha( 1 )
				Pixel5:setZoom( -2 )
				Pixel5:registerEventHandler( "transition_complete_keyframe", f374_local7 )
				local f374_local8 = function ( f391_arg0, f391_arg1 )
					local f391_local0 = function ( f392_arg0, f392_arg1 )
						local f392_local0 = function ( f393_arg0, f393_arg1 )
							local f393_local0 = function ( f394_arg0, f394_arg1 )
								local f394_local0 = function ( f395_arg0, f395_arg1 )
									if not f395_arg1.interrupted then
										f395_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f395_arg0:setLeftRight( true, false, 65, 86.33 )
									f395_arg0:setTopBottom( true, false, 128, 146.67 )
									f395_arg0:setRGB( 1, 1, 1 )
									f395_arg0:setAlpha( 0 )
									f395_arg0:setZoom( 0 )
									if f395_arg1.interrupted then
										self.clipFinished( f395_arg0, f395_arg1 )
									else
										f395_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f394_arg1.interrupted then
									f394_local0( f394_arg0, f394_arg1 )
									return 
								else
									f394_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f394_arg0:setRGB( 1, 0.9, 0.9 )
									f394_arg0:registerEventHandler( "transition_complete_keyframe", f394_local0 )
								end
							end
							
							if f393_arg1.interrupted then
								f393_local0( f393_arg0, f393_arg1 )
								return 
							else
								f393_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f393_arg0:setRGB( 1, 0.5, 0.5 )
								f393_arg0:setAlpha( 0.5 )
								f393_arg0:registerEventHandler( "transition_complete_keyframe", f393_local0 )
							end
						end
						
						if f392_arg1.interrupted then
							f392_local0( f392_arg0, f392_arg1 )
							return 
						else
							f392_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f392_arg0:setRGB( 1, 0.4, 0.4 )
							f392_arg0:registerEventHandler( "transition_complete_keyframe", f392_local0 )
						end
					end
					
					if f391_arg1.interrupted then
						f391_local0( f391_arg0, f391_arg1 )
						return 
					else
						f391_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f391_arg0:setRGB( 1, 0.1, 0.1 )
						f391_arg0:setAlpha( 0 )
						f391_arg0:registerEventHandler( "transition_complete_keyframe", f391_local0 )
					end
				end
				
				ArrowD:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
				ArrowD:setLeftRight( true, false, 65, 86.33 )
				ArrowD:setTopBottom( true, false, 128, 146.67 )
				ArrowD:setRGB( 1, 0, 0 )
				ArrowD:setAlpha( 1 )
				ArrowD:setZoom( 0 )
				ArrowD:registerEventHandler( "transition_complete_keyframe", f374_local8 )
				local ArrowTFrame2 = function ( ArrowT, event )
					local ArrowTFrame3 = function ( ArrowT, event )
						local ArrowTFrame4 = function ( ArrowT, event )
							local ArrowTFrame5 = function ( ArrowT, event )
								local ArrowTFrame6 = function ( ArrowT, event )
									if not event.interrupted then
										ArrowT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									ArrowT:setLeftRight( true, false, 67.67, 83.67 )
									ArrowT:setTopBottom( true, false, 26.67, 37.34 )
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
				self.ArrowT:setTopBottom( true, false, 26.67, 37.34 )
				self.ArrowT:setAlpha( 1 )
				self.ArrowT:setXRot( -180 )
				self.ArrowT:setZoom( 0 )
				ArrowTFrame2( ArrowT, {} )
				local f374_local10 = function ( f401_arg0, f401_arg1 )
					local f401_local0 = function ( f402_arg0, f402_arg1 )
						local f402_local0 = function ( f403_arg0, f403_arg1 )
							local f403_local0 = function ( f404_arg0, f404_arg1 )
								local f404_local0 = function ( f405_arg0, f405_arg1 )
									if not f405_arg1.interrupted then
										f405_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f405_arg0.EKGCritical:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										f405_arg0.EKGStable:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										f405_arg0.EKG2:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										f405_arg0.EKG3:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										f405_arg0.EKGBlur:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										f405_arg0.EKG4:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									end
									f405_arg0:setAlpha( 0 )
									f405_arg0:setZoom( -12 )
									f405_arg0.EKGCritical:setRGB( 1, 0, 0.08 )
									f405_arg0.EKGCritical:setShaderVector( 0, 2, 10.21, 4, 0.97 )
									f405_arg0.EKGCritical:setShaderVector( 1, 0.18, 1, 0.05, 0 )
									f405_arg0.EKGStable:setRGB( 1, 0.06, 0 )
									f405_arg0.EKGStable:setShaderVector( 0, 1.33, 7.57, 4, 0.6 )
									f405_arg0.EKGStable:setShaderVector( 1, 1.01, 4, -0.32, 0 )
									f405_arg0.EKG2:setRGB( 0.75, 0, 0 )
									f405_arg0.EKG2:setShaderVector( 1, 0.3, 0, 0, 0 )
									f405_arg0.EKG3:setRGB( 1, 0, 0 )
									f405_arg0.EKG3:setShaderVector( 1, 0.2, 0, 0, 0 )
									f405_arg0.EKGBlur:setAlpha( 1 )
									f405_arg0.EKG4:setRGB( 0.54, 0, 0 )
									f405_arg0.EKG4:setShaderVector( 1, 0.05, 0, 0, 0 )
									if f405_arg1.interrupted then
										self.clipFinished( f405_arg0, f405_arg1 )
									else
										f405_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f404_arg1.interrupted then
									f404_local0( f404_arg0, f404_arg1 )
									return 
								else
									f404_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									f404_arg0:setZoom( -11.08 )
									f404_arg0:registerEventHandler( "transition_complete_keyframe", f404_local0 )
								end
							end
							
							if f403_arg1.interrupted then
								f403_local0( f403_arg0, f403_arg1 )
								return 
							else
								f403_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f403_arg0:setAlpha( 0.5 )
								f403_arg0:setZoom( -6.46 )
								f403_arg0:registerEventHandler( "transition_complete_keyframe", f403_local0 )
							end
						end
						
						if f402_arg1.interrupted then
							f402_local0( f402_arg0, f402_arg1 )
							return 
						else
							f402_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							f402_arg0:setZoom( -5.54 )
							f402_arg0:registerEventHandler( "transition_complete_keyframe", f402_local0 )
						end
					end
					
					if f401_arg1.interrupted then
						f401_local0( f401_arg0, f401_arg1 )
						return 
					else
						f401_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f401_arg0:setAlpha( 0 )
						f401_arg0:setZoom( -0.92 )
						f401_arg0:registerEventHandler( "transition_complete_keyframe", f401_local0 )
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
				EKG:registerEventHandler( "transition_complete_keyframe", f374_local10 )
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
				local f374_local12 = function ( f407_arg0, f407_arg1 )
					local f407_local0 = function ( f408_arg0, f408_arg1 )
						local f408_local0 = function ( f409_arg0, f409_arg1 )
							local f409_local0 = function ( f410_arg0, f410_arg1 )
								local f410_local0 = function ( f411_arg0, f411_arg1 )
									if not f411_arg1.interrupted then
										f411_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f411_arg0.HeartContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										f411_arg0.TextLabel:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f411_arg0:setLeftRight( false, false, 18.33, 53 )
									f411_arg0:setTopBottom( false, true, -75, -40.33 )
									f411_arg0:setAlpha( 0 )
									f411_arg0.HeartContainer:setRGB( 1, 0, 0 )
									f411_arg0.TextLabel:setRGB( 1, 1, 1 )
									f411_arg0.TextLabel:setText( Engine.Localize( "176" ) )
									if f411_arg1.interrupted then
										self.clipFinished( f411_arg0, f411_arg1 )
									else
										f411_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f410_arg1.interrupted then
									f410_local0( f410_arg0, f410_arg1 )
									return 
								else
									f410_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									f410_arg0:registerEventHandler( "transition_complete_keyframe", f410_local0 )
								end
							end
							
							if f409_arg1.interrupted then
								f409_local0( f409_arg0, f409_arg1 )
								return 
							else
								f409_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f409_arg0:setAlpha( 0.5 )
								f409_arg0:registerEventHandler( "transition_complete_keyframe", f409_local0 )
							end
						end
						
						if f408_arg1.interrupted then
							f408_local0( f408_arg0, f408_arg1 )
							return 
						else
							f408_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f408_arg0:registerEventHandler( "transition_complete_keyframe", f408_local0 )
						end
					end
					
					if f407_arg1.interrupted then
						f407_local0( f407_arg0, f407_arg1 )
						return 
					else
						f407_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f407_arg0:setAlpha( 0 )
						f407_arg0:registerEventHandler( "transition_complete_keyframe", f407_local0 )
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
				BPM:registerEventHandler( "transition_complete_keyframe", f374_local12 )
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
				local f374_local15 = function ( f414_arg0, f414_arg1 )
					local f414_local0 = function ( f415_arg0, f415_arg1 )
						local f415_local0 = function ( f416_arg0, f416_arg1 )
							local f416_local0 = function ( f417_arg0, f417_arg1 )
								local f417_local0 = function ( f418_arg0, f418_arg1 )
									if not f418_arg1.interrupted then
										f418_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f418_arg0:setLeftRight( true, false, 21.33, 96 )
									f418_arg0:setTopBottom( true, false, 90, 116.67 )
									f418_arg0:setAlpha( 0 )
									f418_arg0:setZoom( 2 )
									if f418_arg1.interrupted then
										self.clipFinished( f418_arg0, f418_arg1 )
									else
										f418_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f417_arg1.interrupted then
									f417_local0( f417_arg0, f417_arg1 )
									return 
								else
									f417_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									f417_arg0:registerEventHandler( "transition_complete_keyframe", f417_local0 )
								end
							end
							
							if f416_arg1.interrupted then
								f416_local0( f416_arg0, f416_arg1 )
								return 
							else
								f416_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f416_arg0:setAlpha( 0.5 )
								f416_arg0:registerEventHandler( "transition_complete_keyframe", f416_local0 )
							end
						end
						
						if f415_arg1.interrupted then
							f415_local0( f415_arg0, f415_arg1 )
							return 
						else
							f415_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							f415_arg0:registerEventHandler( "transition_complete_keyframe", f415_local0 )
						end
					end
					
					if f414_arg1.interrupted then
						f414_local0( f414_arg0, f414_arg1 )
						return 
					else
						f414_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f414_arg0:setAlpha( 0 )
						f414_arg0:registerEventHandler( "transition_complete_keyframe", f414_local0 )
					end
				end
				
				DangerMessage:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				DangerMessage:setLeftRight( true, false, 21.33, 96 )
				DangerMessage:setTopBottom( true, false, 90, 116.67 )
				DangerMessage:setAlpha( 1 )
				DangerMessage:setZoom( 2 )
				DangerMessage:registerEventHandler( "transition_complete_keyframe", f374_local15 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.EKG:close()
		element.TextTitle:close()
		element.BPM:close()
		element.BP:close()
		element.DangerMessage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

