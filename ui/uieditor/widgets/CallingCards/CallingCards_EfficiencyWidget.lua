-- cff7555a7f974300ddbe00c25665cb76
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_EfficiencyWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_EfficiencyWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_EfficiencyWidget )
	self.id = "CallingCards_EfficiencyWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local BGDark = LUI.UIImage.new()
	BGDark:setLeftRight( true, false, 0, 480 )
	BGDark:setTopBottom( true, false, 0, 120 )
	BGDark:setImage( RegisterImage( "uie_t7_callingcard_efficiency_bgdark" ) )
	self:addElement( BGDark )
	self.BGDark = BGDark
	
	local BGLight = LUI.UIImage.new()
	BGLight:setLeftRight( true, false, 0, 480 )
	BGLight:setTopBottom( true, false, 0, 120 )
	BGLight:setImage( RegisterImage( "uie_t7_callingcard_efficiency_bglight" ) )
	self:addElement( BGLight )
	self.BGLight = BGLight
	
	local Smoke1 = LUI.UIImage.new()
	Smoke1:setLeftRight( true, false, 89.16, 269.16 )
	Smoke1:setTopBottom( true, false, -44.18, 75.82 )
	Smoke1:setImage( RegisterImage( "uie_t7_callingcard_efficiency_smoke1" ) )
	Smoke1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Smoke1 )
	self.Smoke1 = Smoke1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 188, 284 )
	Image0:setTopBottom( true, false, -30.19, 89.82 )
	Image0:setImage( RegisterImage( "uie_t7_callingcard_efficiency_smoke2" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, -81, 39 )
	Image1:setTopBottom( true, false, -128.19, -44.18 )
	Image1:setImage( RegisterImage( "uie_t7_callingcard_efficiency_smoke3" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local GlowOrangeOver0 = LUI.UIImage.new()
	GlowOrangeOver0:setLeftRight( true, false, 257, 273.62 )
	GlowOrangeOver0:setTopBottom( true, false, 41.82, 82.89 )
	GlowOrangeOver0:setRGB( 1, 0.08, 0 )
	GlowOrangeOver0:setAlpha( 0.6 )
	GlowOrangeOver0:setZRot( 90 )
	GlowOrangeOver0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver0 )
	self.GlowOrangeOver0 = GlowOrangeOver0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local BGLightFrame2 = function ( BGLight, event )
					local BGLightFrame3 = function ( BGLight, event )
						local BGLightFrame4 = function ( BGLight, event )
							local BGLightFrame5 = function ( BGLight, event )
								if not event.interrupted then
									BGLight:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
								end
								BGLight:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( BGLight, event )
								else
									BGLight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BGLightFrame5( BGLight, event )
								return 
							else
								BGLight:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
								BGLight:setAlpha( 0 )
								BGLight:registerEventHandler( "transition_complete_keyframe", BGLightFrame5 )
							end
						end
						
						if event.interrupted then
							BGLightFrame4( BGLight, event )
							return 
						else
							BGLight:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							BGLight:setAlpha( 1 )
							BGLight:registerEventHandler( "transition_complete_keyframe", BGLightFrame4 )
						end
					end
					
					if event.interrupted then
						BGLightFrame3( BGLight, event )
						return 
					else
						BGLight:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						BGLight:setAlpha( 0 )
						BGLight:registerEventHandler( "transition_complete_keyframe", BGLightFrame3 )
					end
				end
				
				BGLight:completeAnimation()
				self.BGLight:setAlpha( 1 )
				BGLightFrame2( BGLight, {} )
				local Smoke1Frame2 = function ( Smoke1, event )
					local Smoke1Frame3 = function ( Smoke1, event )
						local Smoke1Frame4 = function ( Smoke1, event )
							local Smoke1Frame5 = function ( Smoke1, event )
								local Smoke1Frame6 = function ( Smoke1, event )
									if not event.interrupted then
										Smoke1:beginAnimation( "keyframe", 369, false, false, CoD.TweenType.Linear )
									end
									Smoke1:setLeftRight( true, false, 93.61, 273.62 )
									Smoke1:setTopBottom( true, false, -44.18, 75.82 )
									Smoke1:setAlpha( 0 )
									Smoke1:setZRot( 0 )
									Smoke1:setScale( 1 )
									if event.interrupted then
										self.clipFinished( Smoke1, event )
									else
										Smoke1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Smoke1Frame6( Smoke1, event )
									return 
								else
									Smoke1:beginAnimation( "keyframe", 1420, false, false, CoD.TweenType.Linear )
									Smoke1:setLeftRight( true, false, 89.16, 269.16 )
									Smoke1:setTopBottom( true, false, -44.18, 75.82 )
									Smoke1:setZRot( 0 )
									Smoke1:setScale( 1 )
									Smoke1:registerEventHandler( "transition_complete_keyframe", Smoke1Frame6 )
								end
							end
							
							if event.interrupted then
								Smoke1Frame5( Smoke1, event )
								return 
							else
								Smoke1:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								Smoke1:setLeftRight( true, false, -21.81, 158.19 )
								Smoke1:setTopBottom( true, false, -137.7, -17.7 )
								Smoke1:setAlpha( 0 )
								Smoke1:setZRot( -27.71 )
								Smoke1:setScale( 1.43 )
								Smoke1:registerEventHandler( "transition_complete_keyframe", Smoke1Frame5 )
							end
						end
						
						if event.interrupted then
							Smoke1Frame4( Smoke1, event )
							return 
						else
							Smoke1:beginAnimation( "keyframe", 1379, false, false, CoD.TweenType.Linear )
							Smoke1:setLeftRight( true, false, -39, 141 )
							Smoke1:setTopBottom( true, false, -152.19, -32.19 )
							Smoke1:setAlpha( 0.8 )
							Smoke1:setZRot( -32 )
							Smoke1:setScale( 1.5 )
							Smoke1:registerEventHandler( "transition_complete_keyframe", Smoke1Frame4 )
						end
					end
					
					if event.interrupted then
						Smoke1Frame3( Smoke1, event )
						return 
					else
						Smoke1:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						Smoke1:setLeftRight( true, false, 89.16, 269.16 )
						Smoke1:setAlpha( 0.41 )
						Smoke1:setZRot( -10.03 )
						Smoke1:setScale( 1.16 )
						Smoke1:registerEventHandler( "transition_complete_keyframe", Smoke1Frame3 )
					end
				end
				
				Smoke1:completeAnimation()
				self.Smoke1:setLeftRight( true, false, 93.61, 273.62 )
				self.Smoke1:setTopBottom( true, false, -44.18, 75.82 )
				self.Smoke1:setAlpha( 0 )
				self.Smoke1:setZRot( 0 )
				self.Smoke1:setScale( 1 )
				Smoke1Frame2( Smoke1, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								if not event.interrupted then
									Image0:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
								end
								Image0:setLeftRight( true, false, 8.6, 104.6 )
								Image0:setTopBottom( true, false, -120, 0 )
								Image0:setAlpha( 0 )
								Image0:setScale( 1.9 )
								if event.interrupted then
									self.clipFinished( Image0, event )
								else
									Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 1930, false, false, CoD.TweenType.Linear )
								Image0:setLeftRight( true, false, 8.6, 104.6 )
								Image0:setTopBottom( true, false, -120, 0 )
								Image0:setScale( 1.9 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
							Image0:setLeftRight( true, false, 166.7, 262.7 )
							Image0:setTopBottom( true, false, -40.85, 79.15 )
							Image0:setAlpha( 0.45 )
							Image0:setScale( 1.11 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 1440, false, false, CoD.TweenType.Linear )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 188, 284 )
				self.Image0:setTopBottom( true, false, -30.19, 89.82 )
				self.Image0:setAlpha( 0 )
				self.Image0:setScale( 1 )
				Image0Frame2( Image0, {} )
				local f2_local3 = function ( f16_arg0, f16_arg1 )
					local f16_local0 = function ( f17_arg0, f17_arg1 )
						local f17_local0 = function ( f18_arg0, f18_arg1 )
							if not f18_arg1.interrupted then
								f18_arg0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
							end
							f18_arg0:setLeftRight( true, false, 110, 230 )
							f18_arg0:setTopBottom( true, false, -77.11, 6.89 )
							f18_arg0:setAlpha( 0 )
							if f18_arg1.interrupted then
								self.clipFinished( f18_arg0, f18_arg1 )
							else
								f18_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f17_arg1.interrupted then
							f17_local0( f17_arg0, f17_arg1 )
							return 
						else
							f17_arg0:beginAnimation( "keyframe", 1150, false, false, CoD.TweenType.Linear )
							f17_arg0:setLeftRight( true, false, 131.51, 251.51 )
							f17_arg0:setTopBottom( true, false, -53.76, 30.24 )
							f17_arg0:setAlpha( 0.67 )
							f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
						end
					end
					
					if f16_arg1.interrupted then
						f16_local0( f16_arg0, f16_arg1 )
						return 
					else
						f16_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
						f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
					end
				end
				
				Image1:beginAnimation( "keyframe", 2309, false, false, CoD.TweenType.Linear )
				Image1:setLeftRight( true, false, 180, 300 )
				Image1:setTopBottom( true, false, -1.11, 82.89 )
				Image1:setAlpha( 0 )
				Image1:registerEventHandler( "transition_complete_keyframe", f2_local3 )
				local GlowOrangeOver0Frame2 = function ( GlowOrangeOver0, event )
					local GlowOrangeOver0Frame3 = function ( GlowOrangeOver0, event )
						local GlowOrangeOver0Frame4 = function ( GlowOrangeOver0, event )
							local GlowOrangeOver0Frame5 = function ( GlowOrangeOver0, event )
								local GlowOrangeOver0Frame6 = function ( GlowOrangeOver0, event )
									if not event.interrupted then
										GlowOrangeOver0:beginAnimation( "keyframe", 2349, false, false, CoD.TweenType.Linear )
									end
									GlowOrangeOver0:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( GlowOrangeOver0, event )
									else
										GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowOrangeOver0Frame6( GlowOrangeOver0, event )
									return 
								else
									GlowOrangeOver0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
									GlowOrangeOver0:setAlpha( 0.55 )
									GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOver0Frame5( GlowOrangeOver0, event )
								return 
							else
								GlowOrangeOver0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								GlowOrangeOver0:setAlpha( 0.18 )
								GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOver0Frame4( GlowOrangeOver0, event )
							return 
						else
							GlowOrangeOver0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							GlowOrangeOver0:setAlpha( 0.41 )
							GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOver0Frame3( GlowOrangeOver0, event )
						return 
					else
						GlowOrangeOver0:beginAnimation( "keyframe", 1419, false, false, CoD.TweenType.Linear )
						GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame3 )
					end
				end
				
				GlowOrangeOver0:completeAnimation()
				self.GlowOrangeOver0:setAlpha( 0 )
				GlowOrangeOver0Frame2( GlowOrangeOver0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

