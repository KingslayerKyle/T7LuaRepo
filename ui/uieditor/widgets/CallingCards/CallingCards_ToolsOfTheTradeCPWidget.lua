-- b8640f45ade2d9b9e5fa0e9623f24b1c
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_ToolsOfTheTradeCPWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_ToolsOfTheTradeCPWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_ToolsOfTheTradeCPWidget )
	self.id = "CallingCards_ToolsOfTheTradeCPWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_toolsofthetrade_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local backwave = LUI.UIImage.new()
	backwave:setLeftRight( true, false, 0, 408 )
	backwave:setTopBottom( true, false, 82, 118 )
	backwave:setImage( RegisterImage( "uie_t7_callingcard_toolsofthetrade_backwave" ) )
	self:addElement( backwave )
	self.backwave = backwave
	
	local smallShip = LUI.UIImage.new()
	smallShip:setLeftRight( true, false, 105, 169 )
	smallShip:setTopBottom( true, false, 59, 123 )
	smallShip:setImage( RegisterImage( "uie_t7_callingcard_toolsofthetrade_smallship" ) )
	self:addElement( smallShip )
	self.smallShip = smallShip
	
	local midShip = LUI.UIImage.new()
	midShip:setLeftRight( true, false, 1, 121 )
	midShip:setTopBottom( true, false, 36, 120 )
	midShip:setImage( RegisterImage( "uie_t7_callingcard_toolsofthetrade_medship" ) )
	self:addElement( midShip )
	self.midShip = midShip
	
	local midwave = LUI.UIImage.new()
	midwave:setLeftRight( true, false, 0, 480 )
	midwave:setTopBottom( true, false, 84, 120 )
	midwave:setImage( RegisterImage( "uie_t7_callingcard_toolsofthetrade_midwave" ) )
	self:addElement( midwave )
	self.midwave = midwave
	
	local LargeShip = LUI.UIImage.new()
	LargeShip:setLeftRight( true, false, 204, 480 )
	LargeShip:setTopBottom( true, false, -8, 112 )
	LargeShip:setImage( RegisterImage( "uie_t7_callingcard_toolsofthetrade_largeship" ) )
	self:addElement( LargeShip )
	self.LargeShip = LargeShip
	
	local frontwave = LUI.UIImage.new()
	frontwave:setLeftRight( true, false, 192, 480 )
	frontwave:setTopBottom( true, false, 84, 120 )
	frontwave:setImage( RegisterImage( "uie_t7_callingcard_toolsofthetrade_frontwave" ) )
	self:addElement( frontwave )
	self.frontwave = frontwave
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				local backwaveFrame2 = function ( backwave, event )
					local backwaveFrame3 = function ( backwave, event )
						if not event.interrupted then
							backwave:beginAnimation( "keyframe", 3560, false, false, CoD.TweenType.Linear )
						end
						backwave:setLeftRight( true, false, 0, 408 )
						backwave:setTopBottom( true, false, 82, 118 )
						backwave:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( backwave, event )
						else
							backwave:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						backwaveFrame3( backwave, event )
						return 
					else
						backwave:beginAnimation( "keyframe", 3339, false, false, CoD.TweenType.Linear )
						backwave:setLeftRight( true, false, -78, 330 )
						backwave:setTopBottom( true, false, 84, 120 )
						backwave:registerEventHandler( "transition_complete_keyframe", backwaveFrame3 )
					end
				end
				
				backwave:completeAnimation()
				self.backwave:setLeftRight( true, false, 0, 408 )
				self.backwave:setTopBottom( true, false, 82, 118 )
				self.backwave:setAlpha( 1 )
				backwaveFrame2( backwave, {} )
				local smallShipFrame2 = function ( smallShip, event )
					local smallShipFrame3 = function ( smallShip, event )
						local smallShipFrame4 = function ( smallShip, event )
							if not event.interrupted then
								smallShip:beginAnimation( "keyframe", 2190, false, false, CoD.TweenType.Linear )
							end
							smallShip:setLeftRight( true, false, 105, 169 )
							smallShip:setTopBottom( true, false, 59, 123 )
							smallShip:setAlpha( 1 )
							smallShip:setZRot( 0 )
							if event.interrupted then
								self.clipFinished( smallShip, event )
							else
								smallShip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							smallShipFrame4( smallShip, event )
							return 
						else
							smallShip:beginAnimation( "keyframe", 1370, false, false, CoD.TweenType.Linear )
							smallShip:setTopBottom( true, false, 54.69, 118.69 )
							smallShip:setZRot( -5 )
							smallShip:registerEventHandler( "transition_complete_keyframe", smallShipFrame4 )
						end
					end
					
					if event.interrupted then
						smallShipFrame3( smallShip, event )
						return 
					else
						smallShip:beginAnimation( "keyframe", 3339, false, false, CoD.TweenType.Linear )
						smallShip:setTopBottom( true, false, 52, 116 )
						smallShip:setZRot( 10 )
						smallShip:registerEventHandler( "transition_complete_keyframe", smallShipFrame3 )
					end
				end
				
				smallShip:completeAnimation()
				self.smallShip:setLeftRight( true, false, 105, 169 )
				self.smallShip:setTopBottom( true, false, 59, 123 )
				self.smallShip:setAlpha( 1 )
				self.smallShip:setZRot( 0 )
				smallShipFrame2( smallShip, {} )
				local midShipFrame2 = function ( midShip, event )
					local midShipFrame3 = function ( midShip, event )
						local midShipFrame4 = function ( midShip, event )
							local midShipFrame5 = function ( midShip, event )
								if not event.interrupted then
									midShip:beginAnimation( "keyframe", 1820, false, false, CoD.TweenType.Linear )
								end
								midShip:setLeftRight( true, false, 1, 121 )
								midShip:setTopBottom( true, false, 36, 120 )
								midShip:setZRot( 0 )
								if event.interrupted then
									self.clipFinished( midShip, event )
								else
									midShip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								midShipFrame5( midShip, event )
								return 
							else
								midShip:beginAnimation( "keyframe", 1730, false, false, CoD.TweenType.Linear )
								midShip:setLeftRight( true, false, 3, 123 )
								midShip:setTopBottom( true, false, 36, 120 )
								midShip:setZRot( 9 )
								midShip:registerEventHandler( "transition_complete_keyframe", midShipFrame5 )
							end
						end
						
						if event.interrupted then
							midShipFrame4( midShip, event )
							return 
						else
							midShip:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
							midShip:setLeftRight( true, false, 1.48, 121.48 )
							midShip:setTopBottom( true, false, 35.5, 119.5 )
							midShip:setZRot( -4 )
							midShip:registerEventHandler( "transition_complete_keyframe", midShipFrame4 )
						end
					end
					
					if event.interrupted then
						midShipFrame3( midShip, event )
						return 
					else
						midShip:beginAnimation( "keyframe", 1669, false, false, CoD.TweenType.Linear )
						midShip:setLeftRight( true, false, 0, 120 )
						midShip:setTopBottom( true, false, 35.02, 119.02 )
						midShip:setZRot( 9 )
						midShip:registerEventHandler( "transition_complete_keyframe", midShipFrame3 )
					end
				end
				
				midShip:completeAnimation()
				self.midShip:setLeftRight( true, false, 1, 121 )
				self.midShip:setTopBottom( true, false, 36, 120 )
				self.midShip:setZRot( 0 )
				midShipFrame2( midShip, {} )
				local midwaveFrame2 = function ( midwave, event )
					local midwaveFrame3 = function ( midwave, event )
						local midwaveFrame4 = function ( midwave, event )
							local midwaveFrame5 = function ( midwave, event )
								if not event.interrupted then
									midwave:beginAnimation( "keyframe", 1820, false, false, CoD.TweenType.Linear )
								end
								midwave:setLeftRight( true, false, 0, 480 )
								midwave:setTopBottom( true, false, 84, 120 )
								midwave:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( midwave, event )
								else
									midwave:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								midwaveFrame5( midwave, event )
								return 
							else
								midwave:beginAnimation( "keyframe", 1730, false, false, CoD.TweenType.Linear )
								midwave:setLeftRight( true, false, -106, 374 )
								midwave:registerEventHandler( "transition_complete_keyframe", midwaveFrame5 )
							end
						end
						
						if event.interrupted then
							midwaveFrame4( midwave, event )
							return 
						else
							midwave:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
							midwave:setLeftRight( true, false, 0, 480 )
							midwave:registerEventHandler( "transition_complete_keyframe", midwaveFrame4 )
						end
					end
					
					if event.interrupted then
						midwaveFrame3( midwave, event )
						return 
					else
						midwave:beginAnimation( "keyframe", 1669, false, false, CoD.TweenType.Linear )
						midwave:setLeftRight( true, false, -106, 374 )
						midwave:registerEventHandler( "transition_complete_keyframe", midwaveFrame3 )
					end
				end
				
				midwave:completeAnimation()
				self.midwave:setLeftRight( true, false, 0, 480 )
				self.midwave:setTopBottom( true, false, 84, 120 )
				self.midwave:setAlpha( 1 )
				midwaveFrame2( midwave, {} )
				local LargeShipFrame2 = function ( LargeShip, event )
					local LargeShipFrame3 = function ( LargeShip, event )
						local LargeShipFrame4 = function ( LargeShip, event )
							local LargeShipFrame5 = function ( LargeShip, event )
								local LargeShipFrame6 = function ( LargeShip, event )
									local LargeShipFrame7 = function ( LargeShip, event )
										local LargeShipFrame8 = function ( LargeShip, event )
											local LargeShipFrame9 = function ( LargeShip, event )
												if not event.interrupted then
													LargeShip:beginAnimation( "keyframe", 910, false, false, CoD.TweenType.Linear )
												end
												LargeShip:setLeftRight( true, false, 204, 480 )
												LargeShip:setTopBottom( true, false, -8, 112 )
												LargeShip:setZRot( 0 )
												if event.interrupted then
													self.clipFinished( LargeShip, event )
												else
													LargeShip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												LargeShipFrame9( LargeShip, event )
												return 
											else
												LargeShip:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
												LargeShip:setLeftRight( true, false, 196.78, 472.78 )
												LargeShip:setTopBottom( true, false, -2.75, 117.25 )
												LargeShip:setZRot( 2.34 )
												LargeShip:registerEventHandler( "transition_complete_keyframe", LargeShipFrame9 )
											end
										end
										
										if event.interrupted then
											LargeShipFrame8( LargeShip, event )
											return 
										else
											LargeShip:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
											LargeShip:setLeftRight( true, false, 181.78, 457.78 )
											LargeShip:setTopBottom( true, false, -4.46, 115.54 )
											LargeShip:setZRot( 1.66 )
											LargeShip:registerEventHandler( "transition_complete_keyframe", LargeShipFrame8 )
										end
									end
									
									if event.interrupted then
										LargeShipFrame7( LargeShip, event )
										return 
									else
										LargeShip:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
										LargeShip:setLeftRight( true, false, 195.78, 471.78 )
										LargeShip:setTopBottom( true, false, -2.18, 117.82 )
										LargeShip:setZRot( 1 )
										LargeShip:registerEventHandler( "transition_complete_keyframe", LargeShipFrame7 )
									end
								end
								
								if event.interrupted then
									LargeShipFrame6( LargeShip, event )
									return 
								else
									LargeShip:beginAnimation( "keyframe", 869, false, false, CoD.TweenType.Linear )
									LargeShip:setLeftRight( true, false, 192.78, 468.78 )
									LargeShip:setTopBottom( true, false, -7.93, 112.07 )
									LargeShip:setZRot( -4 )
									LargeShip:registerEventHandler( "transition_complete_keyframe", LargeShipFrame6 )
								end
							end
							
							if event.interrupted then
								LargeShipFrame5( LargeShip, event )
								return 
							else
								LargeShip:beginAnimation( "keyframe", 820, false, false, CoD.TweenType.Linear )
								LargeShip:setLeftRight( true, false, 204, 480 )
								LargeShip:setTopBottom( true, false, -6.5, 113.5 )
								LargeShip:setZRot( 2 )
								LargeShip:registerEventHandler( "transition_complete_keyframe", LargeShipFrame5 )
							end
						end
						
						if event.interrupted then
							LargeShipFrame4( LargeShip, event )
							return 
						else
							LargeShip:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Linear )
							LargeShip:setLeftRight( true, false, 192, 468 )
							LargeShip:setTopBottom( true, false, -4.59, 115.41 )
							LargeShip:setZRot( 6 )
							LargeShip:registerEventHandler( "transition_complete_keyframe", LargeShipFrame4 )
						end
					end
					
					if event.interrupted then
						LargeShipFrame3( LargeShip, event )
						return 
					else
						LargeShip:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						LargeShip:setLeftRight( true, false, 195.59, 471.59 )
						LargeShip:setTopBottom( true, false, -2.92, 117.08 )
						LargeShip:setZRot( 3.02 )
						LargeShip:registerEventHandler( "transition_complete_keyframe", LargeShipFrame3 )
					end
				end
				
				LargeShip:completeAnimation()
				self.LargeShip:setLeftRight( true, false, 204, 480 )
				self.LargeShip:setTopBottom( true, false, -8, 112 )
				self.LargeShip:setZRot( 0 )
				LargeShipFrame2( LargeShip, {} )
				local frontwaveFrame2 = function ( frontwave, event )
					local frontwaveFrame3 = function ( frontwave, event )
						local frontwaveFrame4 = function ( frontwave, event )
							local frontwaveFrame5 = function ( frontwave, event )
								local frontwaveFrame6 = function ( frontwave, event )
									local frontwaveFrame7 = function ( frontwave, event )
										local frontwaveFrame8 = function ( frontwave, event )
											local frontwaveFrame9 = function ( frontwave, event )
												if not event.interrupted then
													frontwave:beginAnimation( "keyframe", 910, false, false, CoD.TweenType.Linear )
												end
												frontwave:setLeftRight( true, false, 192, 480 )
												frontwave:setTopBottom( true, false, 84, 120 )
												if event.interrupted then
													self.clipFinished( frontwave, event )
												else
													frontwave:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												frontwaveFrame9( frontwave, event )
												return 
											else
												frontwave:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
												frontwave:setLeftRight( true, false, 229, 517 )
												frontwave:registerEventHandler( "transition_complete_keyframe", frontwaveFrame9 )
											end
										end
										
										if event.interrupted then
											frontwaveFrame8( frontwave, event )
											return 
										else
											frontwave:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
											frontwave:setLeftRight( true, false, 192, 480 )
											frontwave:registerEventHandler( "transition_complete_keyframe", frontwaveFrame8 )
										end
									end
									
									if event.interrupted then
										frontwaveFrame7( frontwave, event )
										return 
									else
										frontwave:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
										frontwave:setLeftRight( true, false, 229, 517 )
										frontwave:registerEventHandler( "transition_complete_keyframe", frontwaveFrame7 )
									end
								end
								
								if event.interrupted then
									frontwaveFrame6( frontwave, event )
									return 
								else
									frontwave:beginAnimation( "keyframe", 869, false, false, CoD.TweenType.Linear )
									frontwave:setLeftRight( true, false, 192, 480 )
									frontwave:registerEventHandler( "transition_complete_keyframe", frontwaveFrame6 )
								end
							end
							
							if event.interrupted then
								frontwaveFrame5( frontwave, event )
								return 
							else
								frontwave:beginAnimation( "keyframe", 820, false, false, CoD.TweenType.Linear )
								frontwave:setLeftRight( true, false, 229, 517 )
								frontwave:registerEventHandler( "transition_complete_keyframe", frontwaveFrame5 )
							end
						end
						
						if event.interrupted then
							frontwaveFrame4( frontwave, event )
							return 
						else
							frontwave:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Linear )
							frontwave:setLeftRight( true, false, 192, 480 )
							frontwave:registerEventHandler( "transition_complete_keyframe", frontwaveFrame4 )
						end
					end
					
					if event.interrupted then
						frontwaveFrame3( frontwave, event )
						return 
					else
						frontwave:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						frontwave:setLeftRight( true, false, 229, 517 )
						frontwave:registerEventHandler( "transition_complete_keyframe", frontwaveFrame3 )
					end
				end
				
				frontwave:completeAnimation()
				self.frontwave:setLeftRight( true, false, 192, 480 )
				self.frontwave:setTopBottom( true, false, 84, 120 )
				frontwaveFrame2( frontwave, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

