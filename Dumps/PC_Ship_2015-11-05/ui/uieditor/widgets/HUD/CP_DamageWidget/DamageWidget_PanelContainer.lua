require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Panel" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_PanelOct" )

CoD.DamageWidget_PanelContainer = InheritFrom( LUI.UIElement )
CoD.DamageWidget_PanelContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_PanelContainer )
	self.id = "DamageWidget_PanelContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 188 )
	self:setTopBottom( true, false, 0, 95 )
	
	local PanelEnviroHazardMeter = CoD.DamageWidget_Panel.new( menu, controller )
	PanelEnviroHazardMeter:setLeftRight( true, false, 11.42, 79.25 )
	PanelEnviroHazardMeter:setTopBottom( true, false, 31.33, 65 )
	PanelEnviroHazardMeter:setAlpha( 0 )
	PanelEnviroHazardMeter:setZoom( -10 )
	self:addElement( PanelEnviroHazardMeter )
	self.PanelEnviroHazardMeter = PanelEnviroHazardMeter
	
	local PanelEnviroHazardIcon = CoD.DamageWidget_Panel.new( menu, controller )
	PanelEnviroHazardIcon:setLeftRight( true, false, 31.34, 64.67 )
	PanelEnviroHazardIcon:setTopBottom( true, false, 31.33, 65 )
	PanelEnviroHazardIcon:setAlpha( 0 )
	PanelEnviroHazardIcon:setZoom( -10 )
	self:addElement( PanelEnviroHazardIcon )
	self.PanelEnviroHazardIcon = PanelEnviroHazardIcon
	
	local DamageWidgetPanelOct0 = CoD.DamageWidget_PanelOct.new( menu, controller )
	DamageWidgetPanelOct0:setLeftRight( true, false, 0, 95 )
	DamageWidgetPanelOct0:setTopBottom( true, false, 0, 94.67 )
	DamageWidgetPanelOct0:setZoom( -10 )
	self:addElement( DamageWidgetPanelOct0 )
	self.DamageWidgetPanelOct0 = DamageWidgetPanelOct0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelEnviroHazardMeter:completeAnimation()
				self.PanelEnviroHazardMeter:setLeftRight( true, false, 11.42, 79.25 )
				self.PanelEnviroHazardMeter:setTopBottom( true, false, 31.33, 65 )
				self.PanelEnviroHazardMeter:setAlpha( 0 )
				self.clipFinished( PanelEnviroHazardMeter, {} )
				PanelEnviroHazardIcon:completeAnimation()
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 31.34, 64.67 )
				self.PanelEnviroHazardIcon:setTopBottom( true, false, 31.33, 65 )
				self.PanelEnviroHazardIcon:setAlpha( 0 )
				self.clipFinished( PanelEnviroHazardIcon, {} )
			end,
			Hess1 = function ()
				self:setupElementClipCounter( 2 )
				local f3_local0 = function ( f4_arg0, f4_arg1 )
					local f4_local0 = function ( f5_arg0, f5_arg1 )
						local f5_local0 = function ( f6_arg0, f6_arg1 )
							local f6_local0 = function ( f7_arg0, f7_arg1 )
								local f7_local0 = function ( f8_arg0, f8_arg1 )
									local f8_local0 = function ( f9_arg0, f9_arg1 )
										local f9_local0 = function ( f10_arg0, f10_arg1 )
											if not f10_arg1.interrupted then
												f10_arg0:beginAnimation( "keyframe", 359, true, false, CoD.TweenType.Linear )
											end
											f10_arg0:setLeftRight( true, false, 119.67, 187.5 )
											f10_arg0:setTopBottom( true, false, 31.33, 65 )
											f10_arg0:setAlpha( 1 )
											if f10_arg1.interrupted then
												self.clipFinished( f10_arg0, f10_arg1 )
											else
												f10_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f9_arg1.interrupted then
											f9_local0( f9_arg0, f9_arg1 )
											return 
										else
											f9_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											f9_arg0:setLeftRight( true, false, 119.67, 135.92 )
											f9_arg0:setAlpha( 1 )
											f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
										end
									end
									
									if f8_arg1.interrupted then
										f8_local0( f8_arg0, f8_arg1 )
										return 
									else
										f8_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f8_arg0:setLeftRight( true, false, 119.67, 129.4 )
										f8_arg0:setAlpha( 0.45 )
										f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
									end
								end
								
								if f7_arg1.interrupted then
									f7_local0( f7_arg0, f7_arg1 )
									return 
								else
									f7_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									f7_arg0:setLeftRight( true, false, 119.67, 128.4 )
									f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
								end
							end
							
							if f6_arg1.interrupted then
								f6_local0( f6_arg0, f6_arg1 )
								return 
							else
								f6_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								f6_arg0:setLeftRight( true, false, 119.67, 126.04 )
								f6_arg0:setAlpha( 0 )
								f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
							end
						end
						
						if f5_arg1.interrupted then
							f5_local0( f5_arg0, f5_arg1 )
							return 
						else
							f5_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f5_arg0:setLeftRight( true, false, 119.67, 125.06 )
							f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
						end
					end
					
					if f4_arg1.interrupted then
						f4_local0( f4_arg0, f4_arg1 )
						return 
					else
						f4_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f4_arg0:setLeftRight( true, false, 119.67, 124.56 )
						f4_arg0:setAlpha( 0.57 )
						f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
					end
				end
				
				PanelEnviroHazardMeter:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 124.5 )
				PanelEnviroHazardMeter:setTopBottom( true, false, 31.33, 65 )
				PanelEnviroHazardMeter:setAlpha( 0 )
				PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", f3_local0 )
				local PanelEnviroHazardIconFrame2 = function ( PanelEnviroHazardIcon, event )
					local PanelEnviroHazardIconFrame3 = function ( PanelEnviroHazardIcon, event )
						local PanelEnviroHazardIconFrame4 = function ( PanelEnviroHazardIcon, event )
							local PanelEnviroHazardIconFrame5 = function ( PanelEnviroHazardIcon, event )
								local PanelEnviroHazardIconFrame6 = function ( PanelEnviroHazardIcon, event )
									local PanelEnviroHazardIconFrame7 = function ( PanelEnviroHazardIcon, event )
										local PanelEnviroHazardIconFrame8 = function ( PanelEnviroHazardIcon, event )
											if not event.interrupted then
												PanelEnviroHazardIcon:beginAnimation( "keyframe", 370, true, false, CoD.TweenType.Linear )
											end
											PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 121.67 )
											PanelEnviroHazardIcon:setTopBottom( true, false, 31.34, 65.01 )
											PanelEnviroHazardIcon:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( PanelEnviroHazardIcon, event )
											else
												PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											PanelEnviroHazardIconFrame8( PanelEnviroHazardIcon, event )
											return 
										else
											PanelEnviroHazardIcon:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 98.36 )
											PanelEnviroHazardIcon:setAlpha( 1 )
											PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame8 )
										end
									end
									
									if event.interrupted then
										PanelEnviroHazardIconFrame7( PanelEnviroHazardIcon, event )
										return 
									else
										PanelEnviroHazardIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 96.15 )
										PanelEnviroHazardIcon:setAlpha( 0.65 )
										PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame7 )
									end
								end
								
								if event.interrupted then
									PanelEnviroHazardIconFrame6( PanelEnviroHazardIcon, event )
									return 
								else
									PanelEnviroHazardIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 95.71 )
									PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame6 )
								end
							end
							
							if event.interrupted then
								PanelEnviroHazardIconFrame5( PanelEnviroHazardIcon, event )
								return 
							else
								PanelEnviroHazardIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 94.68 )
								PanelEnviroHazardIcon:setAlpha( 0 )
								PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame5 )
							end
						end
						
						if event.interrupted then
							PanelEnviroHazardIconFrame4( PanelEnviroHazardIcon, event )
							return 
						else
							PanelEnviroHazardIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 94.43 )
							PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame4 )
						end
					end
					
					if event.interrupted then
						PanelEnviroHazardIconFrame3( PanelEnviroHazardIcon, event )
						return 
					else
						PanelEnviroHazardIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 94.03 )
						PanelEnviroHazardIcon:setAlpha( 0.6 )
						PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame3 )
					end
				end
				
				PanelEnviroHazardIcon:completeAnimation()
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 94 )
				self.PanelEnviroHazardIcon:setTopBottom( true, false, 31.34, 65.01 )
				self.PanelEnviroHazardIcon:setAlpha( 0 )
				PanelEnviroHazardIconFrame2( PanelEnviroHazardIcon, {} )
			end,
			Hess2 = function ()
				self:setupElementClipCounter( 2 )
				local f18_local0 = function ( f19_arg0, f19_arg1 )
					local f19_local0 = function ( f20_arg0, f20_arg1 )
						local f20_local0 = function ( f21_arg0, f21_arg1 )
							local f21_local0 = function ( f22_arg0, f22_arg1 )
								local f22_local0 = function ( f23_arg0, f23_arg1 )
									local f23_local0 = function ( f24_arg0, f24_arg1 )
										local f24_local0 = function ( f25_arg0, f25_arg1 )
											if not f25_arg1.interrupted then
												f25_arg0:beginAnimation( "keyframe", 359, true, false, CoD.TweenType.Linear )
											end
											f25_arg0:setLeftRight( true, false, 119.67, 187.5 )
											f25_arg0:setTopBottom( true, false, 17.33, 79 )
											f25_arg0:setAlpha( 1 )
											if f25_arg1.interrupted then
												self.clipFinished( f25_arg0, f25_arg1 )
											else
												f25_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f24_arg1.interrupted then
											f24_local0( f24_arg0, f24_arg1 )
											return 
										else
											f24_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											f24_arg0:setLeftRight( true, false, 119.67, 135.92 )
											f24_arg0:setAlpha( 1 )
											f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
										end
									end
									
									if f23_arg1.interrupted then
										f23_local0( f23_arg0, f23_arg1 )
										return 
									else
										f23_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f23_arg0:setLeftRight( true, false, 119.67, 129.4 )
										f23_arg0:setAlpha( 0.45 )
										f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
									end
								end
								
								if f22_arg1.interrupted then
									f22_local0( f22_arg0, f22_arg1 )
									return 
								else
									f22_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									f22_arg0:setLeftRight( true, false, 119.67, 128.4 )
									f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
								end
							end
							
							if f21_arg1.interrupted then
								f21_local0( f21_arg0, f21_arg1 )
								return 
							else
								f21_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								f21_arg0:setLeftRight( true, false, 119.67, 126.04 )
								f21_arg0:setAlpha( 0 )
								f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
							end
						end
						
						if f20_arg1.interrupted then
							f20_local0( f20_arg0, f20_arg1 )
							return 
						else
							f20_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f20_arg0:setLeftRight( true, false, 119.67, 125.06 )
							f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
						end
					end
					
					if f19_arg1.interrupted then
						f19_local0( f19_arg0, f19_arg1 )
						return 
					else
						f19_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f19_arg0:setLeftRight( true, false, 119.67, 124.56 )
						f19_arg0:setAlpha( 0.57 )
						f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
					end
				end
				
				PanelEnviroHazardMeter:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 124.5 )
				PanelEnviroHazardMeter:setTopBottom( true, false, 17.33, 79 )
				PanelEnviroHazardMeter:setAlpha( 0 )
				PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", f18_local0 )
				local PanelEnviroHazardIconFrame2 = function ( PanelEnviroHazardIcon, event )
					local PanelEnviroHazardIconFrame3 = function ( PanelEnviroHazardIcon, event )
						local PanelEnviroHazardIconFrame4 = function ( PanelEnviroHazardIcon, event )
							local PanelEnviroHazardIconFrame5 = function ( PanelEnviroHazardIcon, event )
								local PanelEnviroHazardIconFrame6 = function ( PanelEnviroHazardIcon, event )
									local PanelEnviroHazardIconFrame7 = function ( PanelEnviroHazardIcon, event )
										local PanelEnviroHazardIconFrame8 = function ( PanelEnviroHazardIcon, event )
											if not event.interrupted then
												PanelEnviroHazardIcon:beginAnimation( "keyframe", 370, true, false, CoD.TweenType.Linear )
											end
											PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 121.67 )
											PanelEnviroHazardIcon:setTopBottom( true, false, 17.33, 79 )
											PanelEnviroHazardIcon:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( PanelEnviroHazardIcon, event )
											else
												PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											PanelEnviroHazardIconFrame8( PanelEnviroHazardIcon, event )
											return 
										else
											PanelEnviroHazardIcon:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 98.36 )
											PanelEnviroHazardIcon:setAlpha( 1 )
											PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame8 )
										end
									end
									
									if event.interrupted then
										PanelEnviroHazardIconFrame7( PanelEnviroHazardIcon, event )
										return 
									else
										PanelEnviroHazardIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 96.15 )
										PanelEnviroHazardIcon:setAlpha( 0.65 )
										PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame7 )
									end
								end
								
								if event.interrupted then
									PanelEnviroHazardIconFrame6( PanelEnviroHazardIcon, event )
									return 
								else
									PanelEnviroHazardIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 95.71 )
									PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame6 )
								end
							end
							
							if event.interrupted then
								PanelEnviroHazardIconFrame5( PanelEnviroHazardIcon, event )
								return 
							else
								PanelEnviroHazardIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 94.68 )
								PanelEnviroHazardIcon:setAlpha( 0 )
								PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame5 )
							end
						end
						
						if event.interrupted then
							PanelEnviroHazardIconFrame4( PanelEnviroHazardIcon, event )
							return 
						else
							PanelEnviroHazardIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 94.43 )
							PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame4 )
						end
					end
					
					if event.interrupted then
						PanelEnviroHazardIconFrame3( PanelEnviroHazardIcon, event )
						return 
					else
						PanelEnviroHazardIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 94.03 )
						PanelEnviroHazardIcon:setAlpha( 0.6 )
						PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame3 )
					end
				end
				
				PanelEnviroHazardIcon:completeAnimation()
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 94 )
				self.PanelEnviroHazardIcon:setTopBottom( true, false, 17.33, 79 )
				self.PanelEnviroHazardIcon:setAlpha( 0 )
				PanelEnviroHazardIconFrame2( PanelEnviroHazardIcon, {} )
			end
		},
		Hess1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelEnviroHazardMeter:completeAnimation()
				self.PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 187.5 )
				self.PanelEnviroHazardMeter:setTopBottom( true, false, 31.33, 65 )
				self.PanelEnviroHazardMeter:setAlpha( 1 )
				self.clipFinished( PanelEnviroHazardMeter, {} )
				PanelEnviroHazardIcon:completeAnimation()
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 121.67 )
				self.PanelEnviroHazardIcon:setTopBottom( true, false, 31.34, 65.01 )
				self.PanelEnviroHazardIcon:setAlpha( 1 )
				self.clipFinished( PanelEnviroHazardIcon, {} )
			end,
			Hess2 = function ()
				self:setupElementClipCounter( 2 )
				local PanelEnviroHazardMeterFrame2 = function ( PanelEnviroHazardMeter, event )
					if not event.interrupted then
						PanelEnviroHazardMeter:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Back )
					end
					PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 187.5 )
					PanelEnviroHazardMeter:setTopBottom( true, false, 17.33, 79 )
					if event.interrupted then
						self.clipFinished( PanelEnviroHazardMeter, event )
					else
						PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelEnviroHazardMeter:completeAnimation()
				self.PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 187.5 )
				self.PanelEnviroHazardMeter:setTopBottom( true, false, 31.33, 65 )
				PanelEnviroHazardMeterFrame2( PanelEnviroHazardMeter, {} )
				local f34_local1 = function ( f36_arg0, f36_arg1 )
					if not f36_arg1.interrupted then
						f36_arg0:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Back )
					end
					f36_arg0:setLeftRight( true, false, 88.34, 121.67 )
					f36_arg0:setTopBottom( true, false, 17.33, 79 )
					if f36_arg1.interrupted then
						self.clipFinished( f36_arg0, f36_arg1 )
					else
						f36_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelEnviroHazardIcon:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 121.67 )
				PanelEnviroHazardIcon:setTopBottom( true, false, 31.34, 65.01 )
				PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", f34_local1 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local f37_local0 = function ( f38_arg0, f38_arg1 )
					local f38_local0 = function ( f39_arg0, f39_arg1 )
						if not f39_arg1.interrupted then
							f39_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						end
						f39_arg0:setLeftRight( true, false, 119.67, 187.5 )
						f39_arg0:setTopBottom( true, false, 42.33, 53.01 )
						f39_arg0:setAlpha( 0 )
						if f39_arg1.interrupted then
							self.clipFinished( f39_arg0, f39_arg1 )
						else
							f39_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f38_arg1.interrupted then
						f38_local0( f38_arg0, f38_arg1 )
						return 
					else
						f38_arg0:beginAnimation( "keyframe", 240, false, true, CoD.TweenType.Linear )
						f38_arg0:setTopBottom( true, false, 40.13, 55.41 )
						f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 )
					end
				end
				
				PanelEnviroHazardMeter:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 187.5 )
				PanelEnviroHazardMeter:setTopBottom( true, false, 31.33, 65 )
				PanelEnviroHazardMeter:setAlpha( 1 )
				PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", f37_local0 )
				local PanelEnviroHazardIconFrame2 = function ( PanelEnviroHazardIcon, event )
					local PanelEnviroHazardIconFrame3 = function ( PanelEnviroHazardIcon, event )
						if not event.interrupted then
							PanelEnviroHazardIcon:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						end
						PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 121.67 )
						PanelEnviroHazardIcon:setTopBottom( true, false, 42.33, 53.01 )
						PanelEnviroHazardIcon:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PanelEnviroHazardIcon, event )
						else
							PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PanelEnviroHazardIconFrame3( PanelEnviroHazardIcon, event )
						return 
					else
						PanelEnviroHazardIcon:beginAnimation( "keyframe", 239, false, true, CoD.TweenType.Linear )
						PanelEnviroHazardIcon:setTopBottom( true, false, 40.13, 55.41 )
						PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame3 )
					end
				end
				
				PanelEnviroHazardIcon:completeAnimation()
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 121.67 )
				self.PanelEnviroHazardIcon:setTopBottom( true, false, 31.34, 65.01 )
				self.PanelEnviroHazardIcon:setAlpha( 1 )
				PanelEnviroHazardIconFrame2( PanelEnviroHazardIcon, {} )
			end
		},
		Hess2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelEnviroHazardMeter:completeAnimation()
				self.PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 187.5 )
				self.PanelEnviroHazardMeter:setTopBottom( true, false, 17.34, 79.01 )
				self.PanelEnviroHazardMeter:setAlpha( 1 )
				self.clipFinished( PanelEnviroHazardMeter, {} )
				PanelEnviroHazardIcon:completeAnimation()
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 121.67 )
				self.PanelEnviroHazardIcon:setTopBottom( true, false, 17.34, 79.01 )
				self.PanelEnviroHazardIcon:setAlpha( 1 )
				self.clipFinished( PanelEnviroHazardIcon, {} )
			end,
			Hess1 = function ()
				self:setupElementClipCounter( 2 )
				local f43_local0 = function ( f44_arg0, f44_arg1 )
					if not f44_arg1.interrupted then
						f44_arg0:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Back )
					end
					f44_arg0:setLeftRight( true, false, 119.67, 187.5 )
					f44_arg0:setTopBottom( true, false, 31.33, 65 )
					f44_arg0:setAlpha( 1 )
					if f44_arg1.interrupted then
						self.clipFinished( f44_arg0, f44_arg1 )
					else
						f44_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelEnviroHazardMeter:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 187.5 )
				PanelEnviroHazardMeter:setTopBottom( true, false, 17.34, 79.01 )
				PanelEnviroHazardMeter:setAlpha( 1 )
				PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", f43_local0 )
				local PanelEnviroHazardIconFrame2 = function ( PanelEnviroHazardIcon, event )
					if not event.interrupted then
						PanelEnviroHazardIcon:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Back )
					end
					PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 121.67 )
					PanelEnviroHazardIcon:setTopBottom( true, false, 31.33, 65 )
					PanelEnviroHazardIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PanelEnviroHazardIcon, event )
					else
						PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelEnviroHazardIcon:completeAnimation()
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 121.67 )
				self.PanelEnviroHazardIcon:setTopBottom( true, false, 17.34, 79.01 )
				self.PanelEnviroHazardIcon:setAlpha( 1 )
				PanelEnviroHazardIconFrame2( PanelEnviroHazardIcon, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local f46_local0 = function ( f47_arg0, f47_arg1 )
					local f47_local0 = function ( f48_arg0, f48_arg1 )
						if not f48_arg1.interrupted then
							f48_arg0:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Linear )
						end
						f48_arg0:setLeftRight( true, false, 119.67, 187.5 )
						f48_arg0:setTopBottom( true, false, 42.33, 53.01 )
						f48_arg0:setAlpha( 0 )
						if f48_arg1.interrupted then
							self.clipFinished( f48_arg0, f48_arg1 )
						else
							f48_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f47_arg1.interrupted then
						f47_local0( f47_arg0, f47_arg1 )
						return 
					else
						f47_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						f47_arg0:setTopBottom( true, false, 38.94, 56.53 )
						f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
					end
				end
				
				PanelEnviroHazardMeter:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 187.5 )
				PanelEnviroHazardMeter:setTopBottom( true, false, 17.34, 79.01 )
				PanelEnviroHazardMeter:setAlpha( 1 )
				PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", f46_local0 )
				local PanelEnviroHazardIconFrame2 = function ( PanelEnviroHazardIcon, event )
					local PanelEnviroHazardIconFrame3 = function ( PanelEnviroHazardIcon, event )
						if not event.interrupted then
							PanelEnviroHazardIcon:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Linear )
						end
						PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 121.67 )
						PanelEnviroHazardIcon:setTopBottom( true, false, 42.34, 53.01 )
						PanelEnviroHazardIcon:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PanelEnviroHazardIcon, event )
						else
							PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PanelEnviroHazardIconFrame3( PanelEnviroHazardIcon, event )
						return 
					else
						PanelEnviroHazardIcon:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						PanelEnviroHazardIcon:setTopBottom( true, false, 38.95, 56.53 )
						PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame3 )
					end
				end
				
				PanelEnviroHazardIcon:completeAnimation()
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 88.34, 121.67 )
				self.PanelEnviroHazardIcon:setTopBottom( true, false, 17.34, 79.01 )
				self.PanelEnviroHazardIcon:setAlpha( 1 )
				PanelEnviroHazardIconFrame2( PanelEnviroHazardIcon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelEnviroHazardMeter:close()
		element.PanelEnviroHazardIcon:close()
		element.DamageWidgetPanelOct0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

