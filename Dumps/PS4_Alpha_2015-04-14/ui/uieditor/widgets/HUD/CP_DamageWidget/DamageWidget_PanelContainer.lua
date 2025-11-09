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
	PanelEnviroHazardMeter:setRGB( 1, 1, 1 )
	PanelEnviroHazardMeter:setAlpha( 0 )
	PanelEnviroHazardMeter:setZoom( -10 )
	self:addElement( PanelEnviroHazardMeter )
	self.PanelEnviroHazardMeter = PanelEnviroHazardMeter
	
	local PanelEnviroHazardIcon = CoD.DamageWidget_Panel.new( menu, controller )
	PanelEnviroHazardIcon:setLeftRight( true, false, 31.34, 64.67 )
	PanelEnviroHazardIcon:setTopBottom( true, false, 31.33, 65 )
	PanelEnviroHazardIcon:setRGB( 1, 1, 1 )
	PanelEnviroHazardIcon:setAlpha( 0 )
	PanelEnviroHazardIcon:setZoom( -10 )
	self:addElement( PanelEnviroHazardIcon )
	self.PanelEnviroHazardIcon = PanelEnviroHazardIcon
	
	local DamageWidgetPanelOct0 = CoD.DamageWidget_PanelOct.new( menu, controller )
	DamageWidgetPanelOct0:setLeftRight( true, false, 0, 90.67 )
	DamageWidgetPanelOct0:setTopBottom( true, false, 0, 94.67 )
	DamageWidgetPanelOct0:setRGB( 1, 1, 1 )
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
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 31.33, 64.67 )
				self.PanelEnviroHazardIcon:setTopBottom( true, false, 31.33, 65 )
				self.PanelEnviroHazardIcon:setAlpha( 0 )
				self.clipFinished( PanelEnviroHazardIcon, {} )
			end,
			Hess1 = function ()
				self:setupElementClipCounter( 2 )
				local PanelEnviroHazardMeterFrame2 = function ( PanelEnviroHazardMeter, event )
					local PanelEnviroHazardMeterFrame3 = function ( PanelEnviroHazardMeter, event )
						local PanelEnviroHazardMeterFrame4 = function ( PanelEnviroHazardMeter, event )
							local PanelEnviroHazardMeterFrame5 = function ( PanelEnviroHazardMeter, event )
								local PanelEnviroHazardMeterFrame6 = function ( PanelEnviroHazardMeter, event )
									local PanelEnviroHazardMeterFrame7 = function ( PanelEnviroHazardMeter, event )
										local PanelEnviroHazardMeterFrame8 = function ( PanelEnviroHazardMeter, event )
											if not event.interrupted then
												PanelEnviroHazardMeter:beginAnimation( "keyframe", 359, true, false, CoD.TweenType.Linear )
											end
											PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 187.5 )
											PanelEnviroHazardMeter:setTopBottom( true, false, 31.33, 65 )
											PanelEnviroHazardMeter:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( PanelEnviroHazardMeter, event )
											else
												PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											PanelEnviroHazardMeterFrame8( PanelEnviroHazardMeter, event )
											return 
										else
											PanelEnviroHazardMeter:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 135.92 )
											PanelEnviroHazardMeter:setAlpha( 1 )
											PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame8 )
										end
									end
									
									if event.interrupted then
										PanelEnviroHazardMeterFrame7( PanelEnviroHazardMeter, event )
										return 
									else
										PanelEnviroHazardMeter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 129.4 )
										PanelEnviroHazardMeter:setAlpha( 0.45 )
										PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame7 )
									end
								end
								
								if event.interrupted then
									PanelEnviroHazardMeterFrame6( PanelEnviroHazardMeter, event )
									return 
								else
									PanelEnviroHazardMeter:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 128.4 )
									PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame6 )
								end
							end
							
							if event.interrupted then
								PanelEnviroHazardMeterFrame5( PanelEnviroHazardMeter, event )
								return 
							else
								PanelEnviroHazardMeter:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 126.04 )
								PanelEnviroHazardMeter:setAlpha( 0 )
								PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame5 )
							end
						end
						
						if event.interrupted then
							PanelEnviroHazardMeterFrame4( PanelEnviroHazardMeter, event )
							return 
						else
							PanelEnviroHazardMeter:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 125.06 )
							PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame4 )
						end
					end
					
					if event.interrupted then
						PanelEnviroHazardMeterFrame3( PanelEnviroHazardMeter, event )
						return 
					else
						PanelEnviroHazardMeter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 124.56 )
						PanelEnviroHazardMeter:setAlpha( 0.57 )
						PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame3 )
					end
				end
				
				PanelEnviroHazardMeter:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 124.5 )
				PanelEnviroHazardMeter:setTopBottom( true, false, 31.33, 65 )
				PanelEnviroHazardMeter:setAlpha( 0 )
				PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame2 )
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
											PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 121.67 )
											PanelEnviroHazardIcon:setTopBottom( true, false, 31.33, 65 )
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
											PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 98.36 )
											PanelEnviroHazardIcon:setAlpha( 1 )
											PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame8 )
										end
									end
									
									if event.interrupted then
										PanelEnviroHazardIconFrame7( PanelEnviroHazardIcon, event )
										return 
									else
										PanelEnviroHazardIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 96.15 )
										PanelEnviroHazardIcon:setAlpha( 0.65 )
										PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame7 )
									end
								end
								
								if event.interrupted then
									PanelEnviroHazardIconFrame6( PanelEnviroHazardIcon, event )
									return 
								else
									PanelEnviroHazardIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 95.71 )
									PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame6 )
								end
							end
							
							if event.interrupted then
								PanelEnviroHazardIconFrame5( PanelEnviroHazardIcon, event )
								return 
							else
								PanelEnviroHazardIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 94.68 )
								PanelEnviroHazardIcon:setAlpha( 0 )
								PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame5 )
							end
						end
						
						if event.interrupted then
							PanelEnviroHazardIconFrame4( PanelEnviroHazardIcon, event )
							return 
						else
							PanelEnviroHazardIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 94.43 )
							PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame4 )
						end
					end
					
					if event.interrupted then
						PanelEnviroHazardIconFrame3( PanelEnviroHazardIcon, event )
						return 
					else
						PanelEnviroHazardIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 94.03 )
						PanelEnviroHazardIcon:setAlpha( 0.6 )
						PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame3 )
					end
				end
				
				PanelEnviroHazardIcon:completeAnimation()
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 94 )
				self.PanelEnviroHazardIcon:setTopBottom( true, false, 31.33, 65 )
				self.PanelEnviroHazardIcon:setAlpha( 0 )
				PanelEnviroHazardIconFrame2( PanelEnviroHazardIcon, {} )
			end,
			Hess2 = function ()
				self:setupElementClipCounter( 2 )
				local PanelEnviroHazardMeterFrame2 = function ( PanelEnviroHazardMeter, event )
					local PanelEnviroHazardMeterFrame3 = function ( PanelEnviroHazardMeter, event )
						local PanelEnviroHazardMeterFrame4 = function ( PanelEnviroHazardMeter, event )
							local PanelEnviroHazardMeterFrame5 = function ( PanelEnviroHazardMeter, event )
								local PanelEnviroHazardMeterFrame6 = function ( PanelEnviroHazardMeter, event )
									local PanelEnviroHazardMeterFrame7 = function ( PanelEnviroHazardMeter, event )
										local PanelEnviroHazardMeterFrame8 = function ( PanelEnviroHazardMeter, event )
											if not event.interrupted then
												PanelEnviroHazardMeter:beginAnimation( "keyframe", 359, true, false, CoD.TweenType.Linear )
											end
											PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 187.5 )
											PanelEnviroHazardMeter:setTopBottom( true, false, 17.33, 79 )
											PanelEnviroHazardMeter:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( PanelEnviroHazardMeter, event )
											else
												PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											PanelEnviroHazardMeterFrame8( PanelEnviroHazardMeter, event )
											return 
										else
											PanelEnviroHazardMeter:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 135.92 )
											PanelEnviroHazardMeter:setAlpha( 1 )
											PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame8 )
										end
									end
									
									if event.interrupted then
										PanelEnviroHazardMeterFrame7( PanelEnviroHazardMeter, event )
										return 
									else
										PanelEnviroHazardMeter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 129.4 )
										PanelEnviroHazardMeter:setAlpha( 0.45 )
										PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame7 )
									end
								end
								
								if event.interrupted then
									PanelEnviroHazardMeterFrame6( PanelEnviroHazardMeter, event )
									return 
								else
									PanelEnviroHazardMeter:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 128.4 )
									PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame6 )
								end
							end
							
							if event.interrupted then
								PanelEnviroHazardMeterFrame5( PanelEnviroHazardMeter, event )
								return 
							else
								PanelEnviroHazardMeter:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 126.04 )
								PanelEnviroHazardMeter:setAlpha( 0 )
								PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame5 )
							end
						end
						
						if event.interrupted then
							PanelEnviroHazardMeterFrame4( PanelEnviroHazardMeter, event )
							return 
						else
							PanelEnviroHazardMeter:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 125.06 )
							PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame4 )
						end
					end
					
					if event.interrupted then
						PanelEnviroHazardMeterFrame3( PanelEnviroHazardMeter, event )
						return 
					else
						PanelEnviroHazardMeter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 124.56 )
						PanelEnviroHazardMeter:setAlpha( 0.57 )
						PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame3 )
					end
				end
				
				PanelEnviroHazardMeter:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 124.5 )
				PanelEnviroHazardMeter:setTopBottom( true, false, 17.33, 79 )
				PanelEnviroHazardMeter:setAlpha( 0 )
				PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame2 )
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
											PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 121.67 )
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
											PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 98.36 )
											PanelEnviroHazardIcon:setAlpha( 1 )
											PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame8 )
										end
									end
									
									if event.interrupted then
										PanelEnviroHazardIconFrame7( PanelEnviroHazardIcon, event )
										return 
									else
										PanelEnviroHazardIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 96.15 )
										PanelEnviroHazardIcon:setAlpha( 0.65 )
										PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame7 )
									end
								end
								
								if event.interrupted then
									PanelEnviroHazardIconFrame6( PanelEnviroHazardIcon, event )
									return 
								else
									PanelEnviroHazardIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 95.71 )
									PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame6 )
								end
							end
							
							if event.interrupted then
								PanelEnviroHazardIconFrame5( PanelEnviroHazardIcon, event )
								return 
							else
								PanelEnviroHazardIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 94.68 )
								PanelEnviroHazardIcon:setAlpha( 0 )
								PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame5 )
							end
						end
						
						if event.interrupted then
							PanelEnviroHazardIconFrame4( PanelEnviroHazardIcon, event )
							return 
						else
							PanelEnviroHazardIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 94.43 )
							PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame4 )
						end
					end
					
					if event.interrupted then
						PanelEnviroHazardIconFrame3( PanelEnviroHazardIcon, event )
						return 
					else
						PanelEnviroHazardIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 94.03 )
						PanelEnviroHazardIcon:setAlpha( 0.6 )
						PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame3 )
					end
				end
				
				PanelEnviroHazardIcon:completeAnimation()
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 94 )
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
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 121.67 )
				self.PanelEnviroHazardIcon:setTopBottom( true, false, 31.33, 65 )
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
				local PanelEnviroHazardIconFrame2 = function ( PanelEnviroHazardIcon, event )
					if not event.interrupted then
						PanelEnviroHazardIcon:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Back )
					end
					PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 121.67 )
					PanelEnviroHazardIcon:setTopBottom( true, false, 17.33, 79 )
					if event.interrupted then
						self.clipFinished( PanelEnviroHazardIcon, event )
					else
						PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelEnviroHazardIcon:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 121.67 )
				PanelEnviroHazardIcon:setTopBottom( true, false, 31.34, 65.01 )
				PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame2 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local PanelEnviroHazardMeterFrame2 = function ( PanelEnviroHazardMeter, event )
					local PanelEnviroHazardMeterFrame3 = function ( PanelEnviroHazardMeter, event )
						if not event.interrupted then
							PanelEnviroHazardMeter:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						end
						PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 187.5 )
						PanelEnviroHazardMeter:setTopBottom( true, false, 42.33, 53.01 )
						PanelEnviroHazardMeter:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PanelEnviroHazardMeter, event )
						else
							PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PanelEnviroHazardMeterFrame3( PanelEnviroHazardMeter, event )
						return 
					else
						PanelEnviroHazardMeter:beginAnimation( "keyframe", 240, false, true, CoD.TweenType.Linear )
						PanelEnviroHazardMeter:setTopBottom( true, false, 40.13, 55.41 )
						PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame3 )
					end
				end
				
				PanelEnviroHazardMeter:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 187.5 )
				PanelEnviroHazardMeter:setTopBottom( true, false, 31.33, 65 )
				PanelEnviroHazardMeter:setAlpha( 1 )
				PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame2 )
				local PanelEnviroHazardIconFrame2 = function ( PanelEnviroHazardIcon, event )
					local PanelEnviroHazardIconFrame3 = function ( PanelEnviroHazardIcon, event )
						if not event.interrupted then
							PanelEnviroHazardIcon:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						end
						PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 121.67 )
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
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 121.67 )
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
				self.PanelEnviroHazardMeter:setTopBottom( true, false, 17.33, 79 )
				self.PanelEnviroHazardMeter:setAlpha( 1 )
				self.clipFinished( PanelEnviroHazardMeter, {} )
				PanelEnviroHazardIcon:completeAnimation()
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 121.67 )
				self.PanelEnviroHazardIcon:setTopBottom( true, false, 17.33, 79 )
				self.PanelEnviroHazardIcon:setAlpha( 1 )
				self.clipFinished( PanelEnviroHazardIcon, {} )
			end,
			Hess1 = function ()
				self:setupElementClipCounter( 2 )
				local PanelEnviroHazardMeterFrame2 = function ( PanelEnviroHazardMeter, event )
					if not event.interrupted then
						PanelEnviroHazardMeter:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Back )
					end
					PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 187.5 )
					PanelEnviroHazardMeter:setTopBottom( true, false, 31.33, 65 )
					PanelEnviroHazardMeter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PanelEnviroHazardMeter, event )
					else
						PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelEnviroHazardMeter:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 187.5 )
				PanelEnviroHazardMeter:setTopBottom( true, false, 17.34, 79.01 )
				PanelEnviroHazardMeter:setAlpha( 1 )
				PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame2 )
				local PanelEnviroHazardIconFrame2 = function ( PanelEnviroHazardIcon, event )
					if not event.interrupted then
						PanelEnviroHazardIcon:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Back )
					end
					PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 121.67 )
					PanelEnviroHazardIcon:setTopBottom( true, false, 31.33, 65 )
					PanelEnviroHazardIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PanelEnviroHazardIcon, event )
					else
						PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelEnviroHazardIcon:completeAnimation()
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 121.67 )
				self.PanelEnviroHazardIcon:setTopBottom( true, false, 17.34, 79.01 )
				self.PanelEnviroHazardIcon:setAlpha( 1 )
				PanelEnviroHazardIconFrame2( PanelEnviroHazardIcon, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local PanelEnviroHazardMeterFrame2 = function ( PanelEnviroHazardMeter, event )
					local PanelEnviroHazardMeterFrame3 = function ( PanelEnviroHazardMeter, event )
						if not event.interrupted then
							PanelEnviroHazardMeter:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Linear )
						end
						PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 187.5 )
						PanelEnviroHazardMeter:setTopBottom( true, false, 42.33, 53.01 )
						PanelEnviroHazardMeter:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PanelEnviroHazardMeter, event )
						else
							PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PanelEnviroHazardMeterFrame3( PanelEnviroHazardMeter, event )
						return 
					else
						PanelEnviroHazardMeter:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						PanelEnviroHazardMeter:setTopBottom( true, false, 38.94, 56.53 )
						PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame3 )
					end
				end
				
				PanelEnviroHazardMeter:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				PanelEnviroHazardMeter:setLeftRight( true, false, 119.67, 187.5 )
				PanelEnviroHazardMeter:setTopBottom( true, false, 17.34, 79.01 )
				PanelEnviroHazardMeter:setAlpha( 1 )
				PanelEnviroHazardMeter:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardMeterFrame2 )
				local PanelEnviroHazardIconFrame2 = function ( PanelEnviroHazardIcon, event )
					local PanelEnviroHazardIconFrame3 = function ( PanelEnviroHazardIcon, event )
						if not event.interrupted then
							PanelEnviroHazardIcon:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Linear )
						end
						PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 121.67 )
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
						PanelEnviroHazardIcon:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						PanelEnviroHazardIcon:setTopBottom( true, false, 38.95, 56.53 )
						PanelEnviroHazardIcon:registerEventHandler( "transition_complete_keyframe", PanelEnviroHazardIconFrame3 )
					end
				end
				
				PanelEnviroHazardIcon:completeAnimation()
				self.PanelEnviroHazardIcon:setLeftRight( true, false, 88.33, 121.67 )
				self.PanelEnviroHazardIcon:setTopBottom( true, false, 17.34, 79.01 )
				self.PanelEnviroHazardIcon:setAlpha( 1 )
				PanelEnviroHazardIconFrame2( PanelEnviroHazardIcon, {} )
			end
		}
	}
	self.close = function ( self )
		self.PanelEnviroHazardMeter:close()
		self.PanelEnviroHazardIcon:close()
		self.DamageWidgetPanelOct0:close()
		CoD.DamageWidget_PanelContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

