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
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 0, 720 )
	bg:setTopBottom( 0, 0, 0, 180 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_toolsofthetrade_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local backwave = LUI.UIImage.new()
	backwave:setLeftRight( 0, 0, 0, 612 )
	backwave:setTopBottom( 0, 0, 123, 177 )
	backwave:setImage( RegisterImage( "uie_t7_callingcard_toolsofthetrade_backwave" ) )
	self:addElement( backwave )
	self.backwave = backwave
	
	local smallShip = LUI.UIImage.new()
	smallShip:setLeftRight( 0, 0, 158, 254 )
	smallShip:setTopBottom( 0, 0, 88, 184 )
	smallShip:setImage( RegisterImage( "uie_t7_callingcard_toolsofthetrade_smallship" ) )
	self:addElement( smallShip )
	self.smallShip = smallShip
	
	local midShip = LUI.UIImage.new()
	midShip:setLeftRight( 0, 0, 2, 182 )
	midShip:setTopBottom( 0, 0, 54, 180 )
	midShip:setImage( RegisterImage( "uie_t7_callingcard_toolsofthetrade_medship" ) )
	self:addElement( midShip )
	self.midShip = midShip
	
	local midwave = LUI.UIImage.new()
	midwave:setLeftRight( 0, 0, 0, 720 )
	midwave:setTopBottom( 0, 0, 126, 180 )
	midwave:setImage( RegisterImage( "uie_t7_callingcard_toolsofthetrade_midwave" ) )
	self:addElement( midwave )
	self.midwave = midwave
	
	local LargeShip = LUI.UIImage.new()
	LargeShip:setLeftRight( 0, 0, 306, 720 )
	LargeShip:setTopBottom( 0, 0, -12, 168 )
	LargeShip:setImage( RegisterImage( "uie_t7_callingcard_toolsofthetrade_largeship" ) )
	self:addElement( LargeShip )
	self.LargeShip = LargeShip
	
	local frontwave = LUI.UIImage.new()
	frontwave:setLeftRight( 0, 0, 288, 720 )
	frontwave:setTopBottom( 0, 0, 126, 180 )
	frontwave:setImage( RegisterImage( "uie_t7_callingcard_toolsofthetrade_frontwave" ) )
	self:addElement( frontwave )
	self.frontwave = frontwave
	
	self.resetProperties = function ()
		backwave:completeAnimation()
		smallShip:completeAnimation()
		midwave:completeAnimation()
		midShip:completeAnimation()
		frontwave:completeAnimation()
		LargeShip:completeAnimation()
		backwave:setLeftRight( 0, 0, 0, 612 )
		backwave:setTopBottom( 0, 0, 123, 177 )
		backwave:setAlpha( 1 )
		smallShip:setLeftRight( 0, 0, 158, 254 )
		smallShip:setTopBottom( 0, 0, 88, 184 )
		smallShip:setAlpha( 1 )
		smallShip:setZRot( 0 )
		midwave:setLeftRight( 0, 0, 0, 720 )
		midwave:setTopBottom( 0, 0, 126, 180 )
		midwave:setAlpha( 1 )
		midShip:setLeftRight( 0, 0, 2, 182 )
		midShip:setTopBottom( 0, 0, 54, 180 )
		midShip:setZRot( 0 )
		frontwave:setLeftRight( 0, 0, 288, 720 )
		frontwave:setTopBottom( 0, 0, 126, 180 )
		LargeShip:setLeftRight( 0, 0, 306, 720 )
		LargeShip:setTopBottom( 0, 0, -12, 168 )
		LargeShip:setZRot( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local backwaveFrame2 = function ( backwave, event )
					local backwaveFrame3 = function ( backwave, event )
						if not event.interrupted then
							backwave:beginAnimation( "keyframe", 3560, false, false, CoD.TweenType.Linear )
						end
						backwave:setLeftRight( 0, 0, 0, 612 )
						backwave:setTopBottom( 0, 0, 123, 177 )
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
						backwave:setLeftRight( 0, 0, -117, 495 )
						backwave:setTopBottom( 0, 0, 126, 180 )
						backwave:registerEventHandler( "transition_complete_keyframe", backwaveFrame3 )
					end
				end
				
				backwave:completeAnimation()
				self.backwave:setLeftRight( 0, 0, 0, 612 )
				self.backwave:setTopBottom( 0, 0, 123, 177 )
				self.backwave:setAlpha( 1 )
				backwaveFrame2( backwave, {} )
				local smallShipFrame2 = function ( smallShip, event )
					local smallShipFrame3 = function ( smallShip, event )
						local smallShipFrame4 = function ( smallShip, event )
							if not event.interrupted then
								smallShip:beginAnimation( "keyframe", 2190, false, false, CoD.TweenType.Linear )
							end
							smallShip:setLeftRight( 0, 0, 158, 254 )
							smallShip:setTopBottom( 0, 0, 88, 184 )
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
							smallShip:setTopBottom( 0, 0, 81.85, 177.85 )
							smallShip:setZRot( -5 )
							smallShip:registerEventHandler( "transition_complete_keyframe", smallShipFrame4 )
						end
					end
					
					if event.interrupted then
						smallShipFrame3( smallShip, event )
						return 
					else
						smallShip:beginAnimation( "keyframe", 3339, false, false, CoD.TweenType.Linear )
						smallShip:setTopBottom( 0, 0, 78, 174 )
						smallShip:setZRot( 10 )
						smallShip:registerEventHandler( "transition_complete_keyframe", smallShipFrame3 )
					end
				end
				
				smallShip:completeAnimation()
				self.smallShip:setLeftRight( 0, 0, 158, 254 )
				self.smallShip:setTopBottom( 0, 0, 88, 184 )
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
								midShip:setLeftRight( 0, 0, 2, 182 )
								midShip:setTopBottom( 0, 0, 54, 180 )
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
								midShip:setLeftRight( 0, 0, 4, 184 )
								midShip:setTopBottom( 0, 0, 54, 180 )
								midShip:setZRot( 9 )
								midShip:registerEventHandler( "transition_complete_keyframe", midShipFrame5 )
							end
						end
						
						if event.interrupted then
							midShipFrame4( midShip, event )
							return 
						else
							midShip:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
							midShip:setLeftRight( 0, 0, 1.97, 181.97 )
							midShip:setTopBottom( 0, 0, 53.49, 179.49 )
							midShip:setZRot( -4 )
							midShip:registerEventHandler( "transition_complete_keyframe", midShipFrame4 )
						end
					end
					
					if event.interrupted then
						midShipFrame3( midShip, event )
						return 
					else
						midShip:beginAnimation( "keyframe", 1669, false, false, CoD.TweenType.Linear )
						midShip:setLeftRight( 0, 0, 0, 180 )
						midShip:setTopBottom( 0, 0, 53, 179 )
						midShip:setZRot( 9 )
						midShip:registerEventHandler( "transition_complete_keyframe", midShipFrame3 )
					end
				end
				
				midShip:completeAnimation()
				self.midShip:setLeftRight( 0, 0, 2, 182 )
				self.midShip:setTopBottom( 0, 0, 54, 180 )
				self.midShip:setZRot( 0 )
				midShipFrame2( midShip, {} )
				local midwaveFrame2 = function ( midwave, event )
					local midwaveFrame3 = function ( midwave, event )
						local midwaveFrame4 = function ( midwave, event )
							local midwaveFrame5 = function ( midwave, event )
								if not event.interrupted then
									midwave:beginAnimation( "keyframe", 1820, false, false, CoD.TweenType.Linear )
								end
								midwave:setLeftRight( 0, 0, 0, 720 )
								midwave:setTopBottom( 0, 0, 126, 180 )
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
								midwave:setLeftRight( 0, 0, -159, 561 )
								midwave:registerEventHandler( "transition_complete_keyframe", midwaveFrame5 )
							end
						end
						
						if event.interrupted then
							midwaveFrame4( midwave, event )
							return 
						else
							midwave:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
							midwave:setLeftRight( 0, 0, 0, 720 )
							midwave:registerEventHandler( "transition_complete_keyframe", midwaveFrame4 )
						end
					end
					
					if event.interrupted then
						midwaveFrame3( midwave, event )
						return 
					else
						midwave:beginAnimation( "keyframe", 1669, false, false, CoD.TweenType.Linear )
						midwave:setLeftRight( 0, 0, -159, 561 )
						midwave:registerEventHandler( "transition_complete_keyframe", midwaveFrame3 )
					end
				end
				
				midwave:completeAnimation()
				self.midwave:setLeftRight( 0, 0, 0, 720 )
				self.midwave:setTopBottom( 0, 0, 126, 180 )
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
												LargeShip:setLeftRight( 0, 0, 306, 720 )
												LargeShip:setTopBottom( 0, 0, -12, 168 )
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
												LargeShip:setLeftRight( 0, 0, 295, 709 )
												LargeShip:setTopBottom( 0, 0, -4, 176 )
												LargeShip:setZRot( 2 )
												LargeShip:registerEventHandler( "transition_complete_keyframe", LargeShipFrame9 )
											end
										end
										
										if event.interrupted then
											LargeShipFrame8( LargeShip, event )
											return 
										else
											LargeShip:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
											LargeShip:setLeftRight( 0, 0, 273, 687 )
											LargeShip:setTopBottom( 0, 0, -7, 173 )
											LargeShip:setZRot( 1 )
											LargeShip:registerEventHandler( "transition_complete_keyframe", LargeShipFrame8 )
										end
									end
									
									if event.interrupted then
										LargeShipFrame7( LargeShip, event )
										return 
									else
										LargeShip:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
										LargeShip:setLeftRight( 0, 0, 294, 708 )
										LargeShip:setTopBottom( 0, 0, -3, 177 )
										LargeShip:setZRot( 1 )
										LargeShip:registerEventHandler( "transition_complete_keyframe", LargeShipFrame7 )
									end
								end
								
								if event.interrupted then
									LargeShipFrame6( LargeShip, event )
									return 
								else
									LargeShip:beginAnimation( "keyframe", 869, false, false, CoD.TweenType.Linear )
									LargeShip:setLeftRight( 0, 0, 289, 703 )
									LargeShip:setTopBottom( 0, 0, -12, 168 )
									LargeShip:setZRot( -4 )
									LargeShip:registerEventHandler( "transition_complete_keyframe", LargeShipFrame6 )
								end
							end
							
							if event.interrupted then
								LargeShipFrame5( LargeShip, event )
								return 
							else
								LargeShip:beginAnimation( "keyframe", 820, false, false, CoD.TweenType.Linear )
								LargeShip:setLeftRight( 0, 0, 306, 720 )
								LargeShip:setTopBottom( 0, 0, -10, 170 )
								LargeShip:setZRot( 2 )
								LargeShip:registerEventHandler( "transition_complete_keyframe", LargeShipFrame5 )
							end
						end
						
						if event.interrupted then
							LargeShipFrame4( LargeShip, event )
							return 
						else
							LargeShip:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Linear )
							LargeShip:setLeftRight( 0, 0, 288, 702 )
							LargeShip:setTopBottom( 0, 0, -7, 173 )
							LargeShip:setZRot( 6 )
							LargeShip:registerEventHandler( "transition_complete_keyframe", LargeShipFrame4 )
						end
					end
					
					if event.interrupted then
						LargeShipFrame3( LargeShip, event )
						return 
					else
						LargeShip:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						LargeShip:setLeftRight( 0, 0, 293, 707 )
						LargeShip:setTopBottom( 0, 0, -4, 176 )
						LargeShip:setZRot( 3 )
						LargeShip:registerEventHandler( "transition_complete_keyframe", LargeShipFrame3 )
					end
				end
				
				LargeShip:completeAnimation()
				self.LargeShip:setLeftRight( 0, 0, 306, 720 )
				self.LargeShip:setTopBottom( 0, 0, -12, 168 )
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
												frontwave:setLeftRight( 0, 0, 288, 720 )
												frontwave:setTopBottom( 0, 0, 126, 180 )
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
												frontwave:setLeftRight( 0, 0, 344, 776 )
												frontwave:registerEventHandler( "transition_complete_keyframe", frontwaveFrame9 )
											end
										end
										
										if event.interrupted then
											frontwaveFrame8( frontwave, event )
											return 
										else
											frontwave:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
											frontwave:setLeftRight( 0, 0, 288, 720 )
											frontwave:registerEventHandler( "transition_complete_keyframe", frontwaveFrame8 )
										end
									end
									
									if event.interrupted then
										frontwaveFrame7( frontwave, event )
										return 
									else
										frontwave:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
										frontwave:setLeftRight( 0, 0, 344, 776 )
										frontwave:registerEventHandler( "transition_complete_keyframe", frontwaveFrame7 )
									end
								end
								
								if event.interrupted then
									frontwaveFrame6( frontwave, event )
									return 
								else
									frontwave:beginAnimation( "keyframe", 869, false, false, CoD.TweenType.Linear )
									frontwave:setLeftRight( 0, 0, 288, 720 )
									frontwave:registerEventHandler( "transition_complete_keyframe", frontwaveFrame6 )
								end
							end
							
							if event.interrupted then
								frontwaveFrame5( frontwave, event )
								return 
							else
								frontwave:beginAnimation( "keyframe", 820, false, false, CoD.TweenType.Linear )
								frontwave:setLeftRight( 0, 0, 344, 776 )
								frontwave:registerEventHandler( "transition_complete_keyframe", frontwaveFrame5 )
							end
						end
						
						if event.interrupted then
							frontwaveFrame4( frontwave, event )
							return 
						else
							frontwave:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Linear )
							frontwave:setLeftRight( 0, 0, 288, 720 )
							frontwave:registerEventHandler( "transition_complete_keyframe", frontwaveFrame4 )
						end
					end
					
					if event.interrupted then
						frontwaveFrame3( frontwave, event )
						return 
					else
						frontwave:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						frontwave:setLeftRight( 0, 0, 344, 776 )
						frontwave:registerEventHandler( "transition_complete_keyframe", frontwaveFrame3 )
					end
				end
				
				frontwave:completeAnimation()
				self.frontwave:setLeftRight( 0, 0, 288, 720 )
				self.frontwave:setTopBottom( 0, 0, 126, 180 )
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

