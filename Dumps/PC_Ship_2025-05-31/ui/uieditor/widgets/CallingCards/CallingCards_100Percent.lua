CoD.CallingCards_100Percent = InheritFrom( LUI.UIElement )
CoD.CallingCards_100Percent.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_100Percent )
	self.id = "CallingCards_100Percent"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local BLACK = LUI.UIImage.new()
	BLACK:setLeftRight( true, false, 0, 480 )
	BLACK:setTopBottom( true, false, 0, 120 )
	BLACK:setRGB( 0, 0, 0 )
	self:addElement( BLACK )
	self.BLACK = BLACK
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_100_base" ) )
	self:addElement( bg )
	self.bg = bg
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, 144.3, 465.7 )
	GlowOrangeOver:setTopBottom( true, false, -56, 343.19 )
	GlowOrangeOver:setRGB( 1, 0.56, 0 )
	GlowOrangeOver:setZRot( -84 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local GlowOrangeOver0 = LUI.UIImage.new()
	GlowOrangeOver0:setLeftRight( true, false, 144.3, 465.7 )
	GlowOrangeOver0:setTopBottom( true, false, -56, 343.19 )
	GlowOrangeOver0:setRGB( 1, 0.56, 0 )
	GlowOrangeOver0:setAlpha( 0 )
	GlowOrangeOver0:setZRot( -84 )
	GlowOrangeOver0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver0 )
	self.GlowOrangeOver0 = GlowOrangeOver0
	
	local block = LUI.UIImage.new()
	block:setLeftRight( true, false, 198, 405.5 )
	block:setTopBottom( true, false, -50.96, 201 )
	block:setAlpha( 0 )
	block:setZRot( 7 )
	block:setImage( RegisterImage( "uie_t7_callingcard_100_block" ) )
	self:addElement( block )
	self.block = block
	
	local ember2 = LUI.UIImage.new()
	ember2:setLeftRight( true, false, 387.5, 399.5 )
	ember2:setTopBottom( true, false, 27, 39 )
	ember2:setImage( RegisterImage( "uie_t7_callingcard_100_chip1" ) )
	self:addElement( ember2 )
	self.ember2 = ember2
	
	local ember1 = LUI.UIImage.new()
	ember1:setLeftRight( true, false, 188, 224 )
	ember1:setTopBottom( true, false, 28, 64 )
	ember1:setImage( RegisterImage( "uie_t7_callingcard_100_chip2" ) )
	self:addElement( ember1 )
	self.ember1 = ember1
	
	local ember = LUI.UIImage.new()
	ember:setLeftRight( true, false, -41.98, 507.98 )
	ember:setTopBottom( true, false, -56, 192 )
	ember:setImage( RegisterImage( "uie_t7_callingcard_100_ember" ) )
	ember:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	ember:setShaderVector( 0, 1, 1, 0, 0 )
	ember:setShaderVector( 1, 0, 0.3, 0, 0 )
	self:addElement( ember )
	self.ember = ember
	
	local bottom = LUI.UIImage.new()
	bottom:setLeftRight( true, false, 197, 425 )
	bottom:setTopBottom( true, false, 80, 200 )
	bottom:setZRot( 7 )
	bottom:setImage( RegisterImage( "uie_t7_callingcard_100_stone_bottom" ) )
	self:addElement( bottom )
	self.bottom = bottom
	
	local left = LUI.UIImage.new()
	left:setLeftRight( true, false, 180, 348 )
	left:setTopBottom( true, false, -26, 118 )
	left:setZRot( 7 )
	left:setImage( RegisterImage( "uie_t7_callingcard_100_stone_left" ) )
	self:addElement( left )
	self.left = left
	
	local right = LUI.UIImage.new()
	right:setLeftRight( true, false, 320, 416 )
	right:setTopBottom( true, false, 16, 124 )
	right:setZRot( 7 )
	right:setImage( RegisterImage( "uie_t7_callingcard_100_stone_right" ) )
	self:addElement( right )
	self.right = right
	
	local top = LUI.UIImage.new()
	top:setLeftRight( true, false, 203, 407 )
	top:setTopBottom( true, false, -56, 88 )
	top:setZRot( 7 )
	top:setImage( RegisterImage( "uie_t7_callingcard_100_stone_top" ) )
	self:addElement( top )
	self.top = top
	
	local gold4right = LUI.UIImage.new()
	gold4right:setLeftRight( true, false, 325, 372 )
	gold4right:setTopBottom( true, false, 70, 130 )
	gold4right:setYRot( 180 )
	gold4right:setZRot( 18 )
	gold4right:setScale( 0.7 )
	gold4right:setImage( RegisterImage( "uie_t7_callingcard_100_gold" ) )
	self:addElement( gold4right )
	self.gold4right = gold4right
	
	local gold3right = LUI.UIImage.new()
	gold3right:setLeftRight( true, false, 337.5, 384.5 )
	gold3right:setTopBottom( true, false, 42, 102 )
	gold3right:setYRot( 180 )
	gold3right:setZRot( 2 )
	gold3right:setScale( 0.8 )
	gold3right:setImage( RegisterImage( "uie_t7_callingcard_100_gold" ) )
	self:addElement( gold3right )
	self.gold3right = gold3right
	
	local gold2right = LUI.UIImage.new()
	gold2right:setLeftRight( true, false, 334.5, 381.5 )
	gold2right:setTopBottom( true, false, -14, 46 )
	gold2right:setYRot( 180 )
	gold2right:setZRot( 4 )
	gold2right:setScale( 0.9 )
	gold2right:setImage( RegisterImage( "uie_t7_callingcard_100_gold" ) )
	self:addElement( gold2right )
	self.gold2right = gold2right
	
	local gold1right = LUI.UIImage.new()
	gold1right:setLeftRight( true, false, 338.5, 385.5 )
	gold1right:setTopBottom( true, false, 11, 71 )
	gold1right:setYRot( 180 )
	gold1right:setZRot( -7 )
	gold1right:setImage( RegisterImage( "uie_t7_callingcard_100_gold" ) )
	self:addElement( gold1right )
	self.gold1right = gold1right
	
	local gold4left = LUI.UIImage.new()
	gold4left:setLeftRight( true, false, 241, 288 )
	gold4left:setTopBottom( true, false, 82, 142 )
	gold4left:setZRot( 30 )
	gold4left:setScale( 0.6 )
	gold4left:setImage( RegisterImage( "uie_t7_callingcard_100_gold" ) )
	self:addElement( gold4left )
	self.gold4left = gold4left
	
	local gold3left = LUI.UIImage.new()
	gold3left:setLeftRight( true, false, 220.5, 267.5 )
	gold3left:setTopBottom( true, false, 58, 118 )
	gold3left:setZRot( 14 )
	gold3left:setScale( 0.8 )
	gold3left:setImage( RegisterImage( "uie_t7_callingcard_100_gold" ) )
	self:addElement( gold3left )
	self.gold3left = gold3left
	
	local gold2left = LUI.UIImage.new()
	gold2left:setLeftRight( true, false, 211.5, 258.5 )
	gold2left:setTopBottom( true, false, 2, 62 )
	gold2left:setZRot( 19 )
	gold2left:setScale( 0.9 )
	gold2left:setImage( RegisterImage( "uie_t7_callingcard_100_gold" ) )
	self:addElement( gold2left )
	self.gold2left = gold2left
	
	local gold1left = LUI.UIImage.new()
	gold1left:setLeftRight( true, false, 212.5, 259.5 )
	gold1left:setTopBottom( true, false, 27, 87 )
	gold1left:setZRot( 7 )
	gold1left:setImage( RegisterImage( "uie_t7_callingcard_100_gold" ) )
	self:addElement( gold1left )
	self.gold1left = gold1left
	
	local Number0 = LUI.UIImage.new()
	Number0:setLeftRight( true, false, 277, 325 )
	Number0:setTopBottom( true, false, 38, 102 )
	Number0:setZRot( 7 )
	Number0:setScale( 0.8 )
	Number0:setImage( RegisterImage( "uie_t7_callingcard_100_number0" ) )
	self:addElement( Number0 )
	self.Number0 = Number0
	
	local Number0b = LUI.UIImage.new()
	Number0b:setLeftRight( true, false, 306, 354 )
	Number0b:setTopBottom( true, false, 34, 98 )
	Number0b:setZRot( 7 )
	Number0b:setScale( 0.8 )
	Number0b:setImage( RegisterImage( "uie_t7_callingcard_100_number0" ) )
	self:addElement( Number0b )
	self.Number0b = Number0b
	
	local Number1 = LUI.UIImage.new()
	Number1:setLeftRight( true, false, 250, 298 )
	Number1:setTopBottom( true, false, 44, 108 )
	Number1:setZRot( 7 )
	Number1:setScale( 0.8 )
	Number1:setImage( RegisterImage( "uie_t7_callingcard_100_number1" ) )
	self:addElement( Number1 )
	self.Number1 = Number1
	
	local star1 = LUI.UIImage.new()
	star1:setLeftRight( true, false, 251.5, 335.5 )
	star1:setTopBottom( true, false, -32, 52 )
	star1:setZRot( 7 )
	star1:setImage( RegisterImage( "uie_t7_callingcard_100_gold_star" ) )
	self:addElement( star1 )
	self.star1 = star1
	
	local fist = LUI.UIImage.new()
	fist:setLeftRight( true, false, 516.98, 780.98 )
	fist:setTopBottom( true, false, -22, 98 )
	fist:setImage( RegisterImage( "uie_t7_callingcard_100_arm" ) )
	self:addElement( fist )
	self.fist = fist
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 283.5, 404.5 )
	Glow:setTopBottom( true, false, -28, 152 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_callingcard_100_ovalblur" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 25 )
				local bgFrame2 = function ( bg, event )
					local bgFrame3 = function ( bg, event )
						local bgFrame4 = function ( bg, event )
							if not event.interrupted then
								bg:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
							end
							bg:setAlpha( 0.5 )
							if event.interrupted then
								self.clipFinished( bg, event )
							else
								bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bgFrame4( bg, event )
							return 
						else
							bg:beginAnimation( "keyframe", 2490, false, false, CoD.TweenType.Linear )
							bg:registerEventHandler( "transition_complete_keyframe", bgFrame4 )
						end
					end
					
					if event.interrupted then
						bgFrame3( bg, event )
						return 
					else
						bg:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
						bg:setAlpha( 1 )
						bg:registerEventHandler( "transition_complete_keyframe", bgFrame3 )
					end
				end
				
				bg:completeAnimation()
				self.bg:setAlpha( 0.5 )
				bgFrame2( bg, {} )
				local f2_local1 = function ( f6_arg0, f6_arg1 )
					local f6_local0 = function ( f7_arg0, f7_arg1 )
						local f7_local0 = function ( f8_arg0, f8_arg1 )
							local f8_local0 = function ( f9_arg0, f9_arg1 )
								if not f9_arg1.interrupted then
									f9_arg0:beginAnimation( "keyframe", 700, false, false, CoD.TweenType.Linear )
								end
								f9_arg0:setAlpha( 0 )
								if f9_arg1.interrupted then
									self.clipFinished( f9_arg0, f9_arg1 )
								else
									f9_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f8_arg1.interrupted then
								f8_local0( f8_arg0, f8_arg1 )
								return 
							else
								f8_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								f8_arg0:setAlpha( 0 )
								f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
							end
						end
						
						if f7_arg1.interrupted then
							f7_local0( f7_arg0, f7_arg1 )
							return 
						else
							f7_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							f7_arg0:setAlpha( 0.71 )
							f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
						end
					end
					
					if f6_arg1.interrupted then
						f6_local0( f6_arg0, f6_arg1 )
						return 
					else
						f6_arg0:beginAnimation( "keyframe", 1729, false, false, CoD.TweenType.Linear )
						f6_arg0:setAlpha( 1 )
						f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
					end
				end
				
				GlowOrangeOver:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
				GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f2_local1 )
				local GlowOrangeOver0Frame2 = function ( GlowOrangeOver0, event )
					local GlowOrangeOver0Frame3 = function ( GlowOrangeOver0, event )
						local GlowOrangeOver0Frame4 = function ( GlowOrangeOver0, event )
							if not event.interrupted then
								GlowOrangeOver0:beginAnimation( "keyframe", 669, false, false, CoD.TweenType.Linear )
							end
							GlowOrangeOver0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( GlowOrangeOver0, event )
							else
								GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowOrangeOver0Frame4( GlowOrangeOver0, event )
							return 
						else
							GlowOrangeOver0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
							GlowOrangeOver0:setAlpha( 1 )
							GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOver0Frame3( GlowOrangeOver0, event )
						return 
					else
						GlowOrangeOver0:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
						GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame3 )
					end
				end
				
				GlowOrangeOver0:completeAnimation()
				self.GlowOrangeOver0:setAlpha( 0 )
				GlowOrangeOver0Frame2( GlowOrangeOver0, {} )
				local blockFrame2 = function ( block, event )
					local blockFrame3 = function ( block, event )
						local blockFrame4 = function ( block, event )
							if not event.interrupted then
								block:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							end
							block:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( block, event )
							else
								block:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							blockFrame4( block, event )
							return 
						else
							block:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
							block:registerEventHandler( "transition_complete_keyframe", blockFrame4 )
						end
					end
					
					if event.interrupted then
						blockFrame3( block, event )
						return 
					else
						block:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						block:setAlpha( 1 )
						block:registerEventHandler( "transition_complete_keyframe", blockFrame3 )
					end
				end
				
				block:completeAnimation()
				self.block:setAlpha( 0 )
				blockFrame2( block, {} )
				local ember2Frame2 = function ( ember2, event )
					local ember2Frame3 = function ( ember2, event )
						local ember2Frame4 = function ( ember2, event )
							local ember2Frame5 = function ( ember2, event )
								if not event.interrupted then
									ember2:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Linear )
								end
								ember2:setLeftRight( true, false, 413.5, 425.5 )
								ember2:setTopBottom( true, false, -12, 0 )
								ember2:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( ember2, event )
								else
									ember2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ember2Frame5( ember2, event )
								return 
							else
								ember2:beginAnimation( "keyframe", 1619, false, false, CoD.TweenType.Linear )
								ember2:registerEventHandler( "transition_complete_keyframe", ember2Frame5 )
							end
						end
						
						if event.interrupted then
							ember2Frame4( ember2, event )
							return 
						else
							ember2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							ember2:setAlpha( 1 )
							ember2:registerEventHandler( "transition_complete_keyframe", ember2Frame4 )
						end
					end
					
					if event.interrupted then
						ember2Frame3( ember2, event )
						return 
					else
						ember2:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
						ember2:registerEventHandler( "transition_complete_keyframe", ember2Frame3 )
					end
				end
				
				ember2:completeAnimation()
				self.ember2:setLeftRight( true, false, 387.5, 399.5 )
				self.ember2:setTopBottom( true, false, 27, 39 )
				self.ember2:setAlpha( 0 )
				ember2Frame2( ember2, {} )
				local ember1Frame2 = function ( ember1, event )
					local ember1Frame3 = function ( ember1, event )
						local ember1Frame4 = function ( ember1, event )
							local ember1Frame5 = function ( ember1, event )
								if not event.interrupted then
									ember1:beginAnimation( "keyframe", 900, false, false, CoD.TweenType.Linear )
								end
								ember1:setLeftRight( true, false, -36, 0 )
								ember1:setTopBottom( true, false, -10.69, 25.31 )
								ember1:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( ember1, event )
								else
									ember1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ember1Frame5( ember1, event )
								return 
							else
								ember1:beginAnimation( "keyframe", 1599, false, false, CoD.TweenType.Linear )
								ember1:registerEventHandler( "transition_complete_keyframe", ember1Frame5 )
							end
						end
						
						if event.interrupted then
							ember1Frame4( ember1, event )
							return 
						else
							ember1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							ember1:setAlpha( 1 )
							ember1:registerEventHandler( "transition_complete_keyframe", ember1Frame4 )
						end
					end
					
					if event.interrupted then
						ember1Frame3( ember1, event )
						return 
					else
						ember1:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
						ember1:registerEventHandler( "transition_complete_keyframe", ember1Frame3 )
					end
				end
				
				ember1:completeAnimation()
				self.ember1:setLeftRight( true, false, 188, 224 )
				self.ember1:setTopBottom( true, false, 28, 64 )
				self.ember1:setAlpha( 0 )
				ember1Frame2( ember1, {} )
				local f2_local6 = function ( f24_arg0, f24_arg1 )
					if not f24_arg1.interrupted then
						f24_arg0:beginAnimation( "keyframe", 2650, false, false, CoD.TweenType.Linear )
					end
					f24_arg0:setAlpha( 1 )
					if f24_arg1.interrupted then
						self.clipFinished( f24_arg0, f24_arg1 )
					else
						f24_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ember:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
				ember:setAlpha( 1 )
				ember:registerEventHandler( "transition_complete_keyframe", f2_local6 )
				local bottomFrame2 = function ( bottom, event )
					local bottomFrame3 = function ( bottom, event )
						local bottomFrame4 = function ( bottom, event )
							local bottomFrame5 = function ( bottom, event )
								local bottomFrame6 = function ( bottom, event )
									if not event.interrupted then
										bottom:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
									end
									bottom:setLeftRight( true, false, 160, 388 )
									bottom:setTopBottom( true, false, 152, 272 )
									bottom:setAlpha( 1 )
									bottom:setZRot( 54 )
									bottom:setScale( 1 )
									if event.interrupted then
										self.clipFinished( bottom, event )
									else
										bottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									bottomFrame6( bottom, event )
									return 
								else
									bottom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									bottom:setLeftRight( true, false, 198, 426 )
									bottom:setTopBottom( true, false, 85.6, 205.6 )
									bottom:setZRot( 14.34 )
									bottom:registerEventHandler( "transition_complete_keyframe", bottomFrame6 )
								end
							end
							
							if event.interrupted then
								bottomFrame5( bottom, event )
								return 
							else
								bottom:beginAnimation( "keyframe", 1649, false, false, CoD.TweenType.Linear )
								bottom:registerEventHandler( "transition_complete_keyframe", bottomFrame5 )
							end
						end
						
						if event.interrupted then
							bottomFrame4( bottom, event )
							return 
						else
							bottom:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							bottom:setAlpha( 1 )
							bottom:registerEventHandler( "transition_complete_keyframe", bottomFrame4 )
						end
					end
					
					if event.interrupted then
						bottomFrame3( bottom, event )
						return 
					else
						bottom:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						bottom:registerEventHandler( "transition_complete_keyframe", bottomFrame3 )
					end
				end
				
				bottom:completeAnimation()
				self.bottom:setLeftRight( true, false, 197, 425 )
				self.bottom:setTopBottom( true, false, 80, 200 )
				self.bottom:setAlpha( 0 )
				self.bottom:setZRot( 7 )
				self.bottom:setScale( 1 )
				bottomFrame2( bottom, {} )
				local leftFrame2 = function ( left, event )
					local leftFrame3 = function ( left, event )
						local leftFrame4 = function ( left, event )
							local leftFrame5 = function ( left, event )
								local leftFrame6 = function ( left, event )
									if not event.interrupted then
										left:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
									end
									left:setLeftRight( true, false, 0, 168 )
									left:setTopBottom( true, false, 88, 232 )
									left:setAlpha( 1 )
									left:setZRot( 36 )
									left:setScale( 1.3 )
									if event.interrupted then
										self.clipFinished( left, event )
									else
										left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									leftFrame6( left, event )
									return 
								else
									left:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									left:setLeftRight( true, false, 170, 338 )
									left:setZRot( 10 )
									left:setScale( 1.03 )
									left:registerEventHandler( "transition_complete_keyframe", leftFrame6 )
								end
							end
							
							if event.interrupted then
								leftFrame5( left, event )
								return 
							else
								left:beginAnimation( "keyframe", 1649, false, false, CoD.TweenType.Linear )
								left:registerEventHandler( "transition_complete_keyframe", leftFrame5 )
							end
						end
						
						if event.interrupted then
							leftFrame4( left, event )
							return 
						else
							left:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							left:setAlpha( 1 )
							left:registerEventHandler( "transition_complete_keyframe", leftFrame4 )
						end
					end
					
					if event.interrupted then
						leftFrame3( left, event )
						return 
					else
						left:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						left:registerEventHandler( "transition_complete_keyframe", leftFrame3 )
					end
				end
				
				left:completeAnimation()
				self.left:setLeftRight( true, false, 180, 348 )
				self.left:setTopBottom( true, false, -26, 118 )
				self.left:setAlpha( 0 )
				self.left:setZRot( 7 )
				self.left:setScale( 1 )
				leftFrame2( left, {} )
				local rightFrame2 = function ( right, event )
					local rightFrame3 = function ( right, event )
						local rightFrame4 = function ( right, event )
							local rightFrame5 = function ( right, event )
								local rightFrame6 = function ( right, event )
									if not event.interrupted then
										right:beginAnimation( "keyframe", 959, false, false, CoD.TweenType.Linear )
									end
									right:setLeftRight( true, false, 274, 370 )
									right:setTopBottom( true, false, -88, 20 )
									right:setAlpha( 1 )
									right:setZRot( 57 )
									right:setScale( 1 )
									if event.interrupted then
										self.clipFinished( right, event )
									else
										right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									rightFrame6( right, event )
									return 
								else
									right:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									right:setLeftRight( true, false, 324, 420 )
									right:setZRot( 11.72 )
									right:registerEventHandler( "transition_complete_keyframe", rightFrame6 )
								end
							end
							
							if event.interrupted then
								rightFrame5( right, event )
								return 
							else
								right:beginAnimation( "keyframe", 1649, false, false, CoD.TweenType.Linear )
								right:registerEventHandler( "transition_complete_keyframe", rightFrame5 )
							end
						end
						
						if event.interrupted then
							rightFrame4( right, event )
							return 
						else
							right:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							right:setAlpha( 1 )
							right:registerEventHandler( "transition_complete_keyframe", rightFrame4 )
						end
					end
					
					if event.interrupted then
						rightFrame3( right, event )
						return 
					else
						right:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						right:registerEventHandler( "transition_complete_keyframe", rightFrame3 )
					end
				end
				
				right:completeAnimation()
				self.right:setLeftRight( true, false, 320, 416 )
				self.right:setTopBottom( true, false, 16, 124 )
				self.right:setAlpha( 0 )
				self.right:setZRot( 7 )
				self.right:setScale( 1 )
				rightFrame2( right, {} )
				local topFrame2 = function ( top, event )
					local topFrame3 = function ( top, event )
						local topFrame4 = function ( top, event )
							local topFrame5 = function ( top, event )
								local topFrame6 = function ( top, event )
									if not event.interrupted then
										top:beginAnimation( "keyframe", 619, false, false, CoD.TweenType.Linear )
									end
									top:setLeftRight( true, false, 121, 325 )
									top:setTopBottom( true, false, -124, 20 )
									top:setAlpha( 1 )
									top:setZRot( 27 )
									if event.interrupted then
										self.clipFinished( top, event )
									else
										top:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									topFrame6( top, event )
									return 
								else
									top:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									top:setLeftRight( true, false, 202, 406 )
									top:setTopBottom( true, false, -61, 83 )
									top:setZRot( 9.78 )
									top:registerEventHandler( "transition_complete_keyframe", topFrame6 )
								end
							end
							
							if event.interrupted then
								topFrame5( top, event )
								return 
							else
								top:beginAnimation( "keyframe", 1649, false, false, CoD.TweenType.Linear )
								top:registerEventHandler( "transition_complete_keyframe", topFrame5 )
							end
						end
						
						if event.interrupted then
							topFrame4( top, event )
							return 
						else
							top:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							top:setAlpha( 1 )
							top:registerEventHandler( "transition_complete_keyframe", topFrame4 )
						end
					end
					
					if event.interrupted then
						topFrame3( top, event )
						return 
					else
						top:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						top:registerEventHandler( "transition_complete_keyframe", topFrame3 )
					end
				end
				
				top:completeAnimation()
				self.top:setLeftRight( true, false, 203, 407 )
				self.top:setTopBottom( true, false, -56, 88 )
				self.top:setAlpha( 0 )
				self.top:setZRot( 7 )
				topFrame2( top, {} )
				local gold4rightFrame2 = function ( gold4right, event )
					local gold4rightFrame3 = function ( gold4right, event )
						local gold4rightFrame4 = function ( gold4right, event )
							local gold4rightFrame5 = function ( gold4right, event )
								local gold4rightFrame6 = function ( gold4right, event )
									local gold4rightFrame7 = function ( gold4right, event )
										local gold4rightFrame8 = function ( gold4right, event )
											if not event.interrupted then
												gold4right:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
											end
											gold4right:setLeftRight( true, false, 260, 307 )
											gold4right:setTopBottom( true, false, 107, 167 )
											gold4right:setAlpha( 1 )
											gold4right:setZRot( -136 )
											gold4right:setZoom( 0 )
											gold4right:setScale( 0.7 )
											if event.interrupted then
												self.clipFinished( gold4right, event )
											else
												gold4right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											gold4rightFrame8( gold4right, event )
											return 
										else
											gold4right:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
											gold4right:setLeftRight( true, false, 260, 307 )
											gold4right:setTopBottom( true, false, 107, 167 )
											gold4right:registerEventHandler( "transition_complete_keyframe", gold4rightFrame8 )
										end
									end
									
									if event.interrupted then
										gold4rightFrame7( gold4right, event )
										return 
									else
										gold4right:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										gold4right:setLeftRight( true, false, 331, 378 )
										gold4right:setTopBottom( true, false, 72, 132 )
										gold4right:registerEventHandler( "transition_complete_keyframe", gold4rightFrame7 )
									end
								end
								
								if event.interrupted then
									gold4rightFrame6( gold4right, event )
									return 
								else
									gold4right:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									gold4right:registerEventHandler( "transition_complete_keyframe", gold4rightFrame6 )
								end
							end
							
							if event.interrupted then
								gold4rightFrame5( gold4right, event )
								return 
							else
								gold4right:beginAnimation( "keyframe", 1639, false, false, CoD.TweenType.Linear )
								gold4right:setLeftRight( true, false, 338, 385 )
								gold4right:setTopBottom( true, false, 67, 127 )
								gold4right:registerEventHandler( "transition_complete_keyframe", gold4rightFrame5 )
							end
						end
						
						if event.interrupted then
							gold4rightFrame4( gold4right, event )
							return 
						else
							gold4right:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							gold4right:setAlpha( 1 )
							gold4right:registerEventHandler( "transition_complete_keyframe", gold4rightFrame4 )
						end
					end
					
					if event.interrupted then
						gold4rightFrame3( gold4right, event )
						return 
					else
						gold4right:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						gold4right:registerEventHandler( "transition_complete_keyframe", gold4rightFrame3 )
					end
				end
				
				gold4right:completeAnimation()
				self.gold4right:setLeftRight( true, false, 325, 372 )
				self.gold4right:setTopBottom( true, false, 70, 130 )
				self.gold4right:setAlpha( 0 )
				self.gold4right:setZRot( 18 )
				self.gold4right:setZoom( 0 )
				self.gold4right:setScale( 0.7 )
				gold4rightFrame2( gold4right, {} )
				local gold3rightFrame2 = function ( gold3right, event )
					local gold3rightFrame3 = function ( gold3right, event )
						local gold3rightFrame4 = function ( gold3right, event )
							local gold3rightFrame5 = function ( gold3right, event )
								local gold3rightFrame6 = function ( gold3right, event )
									local gold3rightFrame7 = function ( gold3right, event )
										if not event.interrupted then
											gold3right:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
										end
										gold3right:setLeftRight( true, false, 234, 281 )
										gold3right:setTopBottom( true, false, 113, 173 )
										gold3right:setAlpha( 1 )
										gold3right:setZRot( -76 )
										gold3right:setZoom( 0 )
										gold3right:setScale( 0.9 )
										if event.interrupted then
											self.clipFinished( gold3right, event )
										else
											gold3right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										gold3rightFrame7( gold3right, event )
										return 
									else
										gold3right:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
										gold3right:setLeftRight( true, false, 234, 281 )
										gold3right:setTopBottom( true, false, 113, 173 )
										gold3right:setZRot( -64.86 )
										gold3right:registerEventHandler( "transition_complete_keyframe", gold3rightFrame7 )
									end
								end
								
								if event.interrupted then
									gold3rightFrame6( gold3right, event )
									return 
								else
									gold3right:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									gold3right:setLeftRight( true, false, 340.5, 387.5 )
									gold3right:registerEventHandler( "transition_complete_keyframe", gold3rightFrame6 )
								end
							end
							
							if event.interrupted then
								gold3rightFrame5( gold3right, event )
								return 
							else
								gold3right:beginAnimation( "keyframe", 1639, false, false, CoD.TweenType.Linear )
								gold3right:setLeftRight( true, false, 348.5, 395.5 )
								gold3right:setTopBottom( true, false, 39, 99 )
								gold3right:setScale( 0.9 )
								gold3right:registerEventHandler( "transition_complete_keyframe", gold3rightFrame5 )
							end
						end
						
						if event.interrupted then
							gold3rightFrame4( gold3right, event )
							return 
						else
							gold3right:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							gold3right:setAlpha( 1 )
							gold3right:registerEventHandler( "transition_complete_keyframe", gold3rightFrame4 )
						end
					end
					
					if event.interrupted then
						gold3rightFrame3( gold3right, event )
						return 
					else
						gold3right:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						gold3right:registerEventHandler( "transition_complete_keyframe", gold3rightFrame3 )
					end
				end
				
				gold3right:completeAnimation()
				self.gold3right:setLeftRight( true, false, 337.5, 384.5 )
				self.gold3right:setTopBottom( true, false, 42, 102 )
				self.gold3right:setAlpha( 0 )
				self.gold3right:setZRot( 2 )
				self.gold3right:setZoom( 0 )
				self.gold3right:setScale( 0.8 )
				gold3rightFrame2( gold3right, {} )
				local gold2rightFrame2 = function ( gold2right, event )
					local gold2rightFrame3 = function ( gold2right, event )
						local gold2rightFrame4 = function ( gold2right, event )
							local gold2rightFrame5 = function ( gold2right, event )
								local gold2rightFrame6 = function ( gold2right, event )
									local gold2rightFrame7 = function ( gold2right, event )
										if not event.interrupted then
											gold2right:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										gold2right:setLeftRight( true, false, 365.22, 412.22 )
										gold2right:setTopBottom( true, false, -56, 4 )
										gold2right:setAlpha( 1 )
										gold2right:setZRot( 4 )
										gold2right:setZoom( 0 )
										gold2right:setScale( 1 )
										if event.interrupted then
											self.clipFinished( gold2right, event )
										else
											gold2right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										gold2rightFrame7( gold2right, event )
										return 
									else
										gold2right:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
										gold2right:setLeftRight( true, false, 363.19, 410.19 )
										gold2right:setTopBottom( true, false, -51.88, 8.12 )
										gold2right:registerEventHandler( "transition_complete_keyframe", gold2rightFrame7 )
									end
								end
								
								if event.interrupted then
									gold2rightFrame6( gold2right, event )
									return 
								else
									gold2right:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									gold2right:setLeftRight( true, false, 348, 395 )
									gold2right:registerEventHandler( "transition_complete_keyframe", gold2rightFrame6 )
								end
							end
							
							if event.interrupted then
								gold2rightFrame5( gold2right, event )
								return 
							else
								gold2right:beginAnimation( "keyframe", 1689, false, false, CoD.TweenType.Linear )
								gold2right:setLeftRight( true, false, 346.55, 393.55 )
								gold2right:setTopBottom( true, false, -21, 39 )
								gold2right:setScale( 1 )
								gold2right:registerEventHandler( "transition_complete_keyframe", gold2rightFrame5 )
							end
						end
						
						if event.interrupted then
							gold2rightFrame4( gold2right, event )
							return 
						else
							gold2right:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							gold2right:setAlpha( 1 )
							gold2right:registerEventHandler( "transition_complete_keyframe", gold2rightFrame4 )
						end
					end
					
					if event.interrupted then
						gold2rightFrame3( gold2right, event )
						return 
					else
						gold2right:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						gold2right:registerEventHandler( "transition_complete_keyframe", gold2rightFrame3 )
					end
				end
				
				gold2right:completeAnimation()
				self.gold2right:setLeftRight( true, false, 334.5, 381.5 )
				self.gold2right:setTopBottom( true, false, -14, 46 )
				self.gold2right:setAlpha( 0 )
				self.gold2right:setZRot( 4 )
				self.gold2right:setZoom( 0 )
				self.gold2right:setScale( 0.9 )
				gold2rightFrame2( gold2right, {} )
				local gold1rightFrame2 = function ( gold1right, event )
					local gold1rightFrame3 = function ( gold1right, event )
						local gold1rightFrame4 = function ( gold1right, event )
							local gold1rightFrame5 = function ( gold1right, event )
								local gold1rightFrame6 = function ( gold1right, event )
									local gold1rightFrame7 = function ( gold1right, event )
										if not event.interrupted then
											gold1right:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
										end
										gold1right:setLeftRight( true, false, 293.5, 340.5 )
										gold1right:setTopBottom( true, false, -52, 8 )
										gold1right:setAlpha( 1 )
										gold1right:setZRot( 70 )
										gold1right:setZoom( 0 )
										gold1right:setScale( 1.1 )
										if event.interrupted then
											self.clipFinished( gold1right, event )
										else
											gold1right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										gold1rightFrame7( gold1right, event )
										return 
									else
										gold1right:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										gold1right:setLeftRight( true, false, 344, 391 )
										gold1right:setTopBottom( true, false, 4, 64 )
										gold1right:registerEventHandler( "transition_complete_keyframe", gold1rightFrame7 )
									end
								end
								
								if event.interrupted then
									gold1rightFrame6( gold1right, event )
									return 
								else
									gold1right:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									gold1right:registerEventHandler( "transition_complete_keyframe", gold1rightFrame6 )
								end
							end
							
							if event.interrupted then
								gold1rightFrame5( gold1right, event )
								return 
							else
								gold1right:beginAnimation( "keyframe", 1639, false, false, CoD.TweenType.Linear )
								gold1right:setLeftRight( true, false, 350.77, 397.77 )
								gold1right:setTopBottom( true, false, 6, 66 )
								gold1right:setScale( 1.1 )
								gold1right:registerEventHandler( "transition_complete_keyframe", gold1rightFrame5 )
							end
						end
						
						if event.interrupted then
							gold1rightFrame4( gold1right, event )
							return 
						else
							gold1right:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							gold1right:setAlpha( 1 )
							gold1right:registerEventHandler( "transition_complete_keyframe", gold1rightFrame4 )
						end
					end
					
					if event.interrupted then
						gold1rightFrame3( gold1right, event )
						return 
					else
						gold1right:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						gold1right:registerEventHandler( "transition_complete_keyframe", gold1rightFrame3 )
					end
				end
				
				gold1right:completeAnimation()
				self.gold1right:setLeftRight( true, false, 338.5, 385.5 )
				self.gold1right:setTopBottom( true, false, 11, 71 )
				self.gold1right:setAlpha( 0 )
				self.gold1right:setZRot( -7 )
				self.gold1right:setZoom( 0 )
				self.gold1right:setScale( 1 )
				gold1rightFrame2( gold1right, {} )
				local gold4leftFrame2 = function ( gold4left, event )
					local gold4leftFrame3 = function ( gold4left, event )
						local gold4leftFrame4 = function ( gold4left, event )
							local gold4leftFrame5 = function ( gold4left, event )
								if not event.interrupted then
									gold4left:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
								end
								gold4left:setLeftRight( true, false, 207.5, 254.5 )
								gold4left:setTopBottom( true, false, 101, 161 )
								gold4left:setAlpha( 1 )
								gold4left:setZRot( 66 )
								gold4left:setZoom( 0 )
								if event.interrupted then
									self.clipFinished( gold4left, event )
								else
									gold4left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								gold4leftFrame5( gold4left, event )
								return 
							else
								gold4left:beginAnimation( "keyframe", 1709, false, false, CoD.TweenType.Linear )
								gold4left:setLeftRight( true, false, 247.5, 294.5 )
								gold4left:setTopBottom( true, false, 76, 136 )
								gold4left:registerEventHandler( "transition_complete_keyframe", gold4leftFrame5 )
							end
						end
						
						if event.interrupted then
							gold4leftFrame4( gold4left, event )
							return 
						else
							gold4left:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							gold4left:setAlpha( 1 )
							gold4left:registerEventHandler( "transition_complete_keyframe", gold4leftFrame4 )
						end
					end
					
					if event.interrupted then
						gold4leftFrame3( gold4left, event )
						return 
					else
						gold4left:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						gold4left:registerEventHandler( "transition_complete_keyframe", gold4leftFrame3 )
					end
				end
				
				gold4left:completeAnimation()
				self.gold4left:setLeftRight( true, false, 241, 288 )
				self.gold4left:setTopBottom( true, false, 82, 142 )
				self.gold4left:setAlpha( 0 )
				self.gold4left:setZRot( 30 )
				self.gold4left:setZoom( 0 )
				gold4leftFrame2( gold4left, {} )
				local gold3leftFrame2 = function ( gold3left, event )
					local gold3leftFrame3 = function ( gold3left, event )
						local gold3leftFrame4 = function ( gold3left, event )
							local gold3leftFrame5 = function ( gold3left, event )
								local gold3leftFrame6 = function ( gold3left, event )
									if not event.interrupted then
										gold3left:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
									end
									gold3left:setLeftRight( true, false, 8.3, 55.3 )
									gold3left:setTopBottom( true, false, 137, 197 )
									gold3left:setAlpha( 1 )
									gold3left:setZRot( 76 )
									gold3left:setZoom( 0 )
									gold3left:setScale( 0.9 )
									if event.interrupted then
										self.clipFinished( gold3left, event )
									else
										gold3left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									gold3leftFrame6( gold3left, event )
									return 
								else
									gold3left:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									gold3left:registerEventHandler( "transition_complete_keyframe", gold3leftFrame6 )
								end
							end
							
							if event.interrupted then
								gold3leftFrame5( gold3left, event )
								return 
							else
								gold3left:beginAnimation( "keyframe", 1709, false, false, CoD.TweenType.Linear )
								gold3left:setLeftRight( true, false, 224.5, 271.5 )
								gold3left:setTopBottom( true, false, 50, 110 )
								gold3left:setScale( 0.9 )
								gold3left:registerEventHandler( "transition_complete_keyframe", gold3leftFrame5 )
							end
						end
						
						if event.interrupted then
							gold3leftFrame4( gold3left, event )
							return 
						else
							gold3left:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							gold3left:setAlpha( 1 )
							gold3left:registerEventHandler( "transition_complete_keyframe", gold3leftFrame4 )
						end
					end
					
					if event.interrupted then
						gold3leftFrame3( gold3left, event )
						return 
					else
						gold3left:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						gold3left:registerEventHandler( "transition_complete_keyframe", gold3leftFrame3 )
					end
				end
				
				gold3left:completeAnimation()
				self.gold3left:setLeftRight( true, false, 220.5, 267.5 )
				self.gold3left:setTopBottom( true, false, 58, 118 )
				self.gold3left:setAlpha( 0 )
				self.gold3left:setZRot( 14 )
				self.gold3left:setZoom( 0 )
				self.gold3left:setScale( 0.8 )
				gold3leftFrame2( gold3left, {} )
				local gold2leftFrame2 = function ( gold2left, event )
					local gold2leftFrame3 = function ( gold2left, event )
						local gold2leftFrame4 = function ( gold2left, event )
							local gold2leftFrame5 = function ( gold2left, event )
								local gold2leftFrame6 = function ( gold2left, event )
									if not event.interrupted then
										gold2left:beginAnimation( "keyframe", 619, false, false, CoD.TweenType.Linear )
									end
									gold2left:setLeftRight( true, false, 186, 233 )
									gold2left:setTopBottom( true, false, -68, -8 )
									gold2left:setAlpha( 1 )
									gold2left:setZRot( -25 )
									gold2left:setZoom( 1 )
									gold2left:setScale( 1.1 )
									if event.interrupted then
										self.clipFinished( gold2left, event )
									else
										gold2left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									gold2leftFrame6( gold2left, event )
									return 
								else
									gold2left:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
									gold2left:registerEventHandler( "transition_complete_keyframe", gold2leftFrame6 )
								end
							end
							
							if event.interrupted then
								gold2leftFrame5( gold2left, event )
								return 
							else
								gold2left:beginAnimation( "keyframe", 1709, false, false, CoD.TweenType.Linear )
								gold2left:setLeftRight( true, false, 220.5, 267.5 )
								gold2left:setTopBottom( true, false, -13, 47 )
								gold2left:setZoom( 1 )
								gold2left:setScale( 1.1 )
								gold2left:registerEventHandler( "transition_complete_keyframe", gold2leftFrame5 )
							end
						end
						
						if event.interrupted then
							gold2leftFrame4( gold2left, event )
							return 
						else
							gold2left:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							gold2left:setAlpha( 1 )
							gold2left:registerEventHandler( "transition_complete_keyframe", gold2leftFrame4 )
						end
					end
					
					if event.interrupted then
						gold2leftFrame3( gold2left, event )
						return 
					else
						gold2left:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						gold2left:registerEventHandler( "transition_complete_keyframe", gold2leftFrame3 )
					end
				end
				
				gold2left:completeAnimation()
				self.gold2left:setLeftRight( true, false, 211.5, 258.5 )
				self.gold2left:setTopBottom( true, false, 2, 62 )
				self.gold2left:setAlpha( 0 )
				self.gold2left:setZRot( 19 )
				self.gold2left:setZoom( 0 )
				self.gold2left:setScale( 0.9 )
				gold2leftFrame2( gold2left, {} )
				local gold1leftFrame2 = function ( gold1left, event )
					local gold1leftFrame3 = function ( gold1left, event )
						local gold1leftFrame4 = function ( gold1left, event )
							local gold1leftFrame5 = function ( gold1left, event )
								local gold1leftFrame6 = function ( gold1left, event )
									local gold1leftFrame7 = function ( gold1left, event )
										if not event.interrupted then
											gold1left:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
										end
										gold1left:setLeftRight( true, false, 74, 121 )
										gold1left:setTopBottom( true, false, -50, 10 )
										gold1left:setAlpha( 1 )
										gold1left:setZRot( 51 )
										gold1left:setZoom( 0 )
										gold1left:setScale( 2.5 )
										if event.interrupted then
											self.clipFinished( gold1left, event )
										else
											gold1left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										gold1leftFrame7( gold1left, event )
										return 
									else
										gold1left:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
										gold1left:setLeftRight( true, false, 177.59, 224.59 )
										gold1left:setTopBottom( true, false, -1.84, 58.16 )
										gold1left:setZRot( 19.57 )
										gold1left:setScale( 1.57 )
										gold1left:registerEventHandler( "transition_complete_keyframe", gold1leftFrame7 )
									end
								end
								
								if event.interrupted then
									gold1leftFrame6( gold1left, event )
									return 
								else
									gold1left:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									gold1left:registerEventHandler( "transition_complete_keyframe", gold1leftFrame6 )
								end
							end
							
							if event.interrupted then
								gold1leftFrame5( gold1left, event )
								return 
							else
								gold1left:beginAnimation( "keyframe", 1709, false, false, CoD.TweenType.Linear )
								gold1left:setLeftRight( true, false, 216.5, 263.5 )
								gold1left:setTopBottom( true, false, 16, 76 )
								gold1left:setScale( 1.2 )
								gold1left:registerEventHandler( "transition_complete_keyframe", gold1leftFrame5 )
							end
						end
						
						if event.interrupted then
							gold1leftFrame4( gold1left, event )
							return 
						else
							gold1left:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							gold1left:setAlpha( 1 )
							gold1left:registerEventHandler( "transition_complete_keyframe", gold1leftFrame4 )
						end
					end
					
					if event.interrupted then
						gold1leftFrame3( gold1left, event )
						return 
					else
						gold1left:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						gold1left:registerEventHandler( "transition_complete_keyframe", gold1leftFrame3 )
					end
				end
				
				gold1left:completeAnimation()
				self.gold1left:setLeftRight( true, false, 212.5, 259.5 )
				self.gold1left:setTopBottom( true, false, 27, 87 )
				self.gold1left:setAlpha( 0 )
				self.gold1left:setZRot( 7 )
				self.gold1left:setZoom( 0 )
				self.gold1left:setScale( 1 )
				gold1leftFrame2( gold1left, {} )
				local Number0Frame2 = function ( Number0, event )
					local Number0Frame3 = function ( Number0, event )
						local Number0Frame4 = function ( Number0, event )
							local Number0Frame5 = function ( Number0, event )
								local Number0Frame6 = function ( Number0, event )
									local Number0Frame7 = function ( Number0, event )
										if not event.interrupted then
											Number0:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
										end
										Number0:setLeftRight( true, false, 139.11, 187.11 )
										Number0:setTopBottom( true, false, -64, 0 )
										Number0:setAlpha( 1 )
										Number0:setXRot( 100 )
										Number0:setYRot( 0 )
										Number0:setZRot( -150 )
										Number0:setScale( 1.1 )
										if event.interrupted then
											self.clipFinished( Number0, event )
										else
											Number0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Number0Frame7( Number0, event )
										return 
									else
										Number0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Number0:setLeftRight( true, false, 276.02, 324.02 )
										Number0:setTopBottom( true, false, 34.72, 98.72 )
										Number0:setZRot( -4 )
										Number0:registerEventHandler( "transition_complete_keyframe", Number0Frame7 )
									end
								end
								
								if event.interrupted then
									Number0Frame6( Number0, event )
									return 
								else
									Number0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
									Number0:setLeftRight( true, false, 276.68, 324.68 )
									Number0:setTopBottom( true, false, 34.62, 98.62 )
									Number0:registerEventHandler( "transition_complete_keyframe", Number0Frame6 )
								end
							end
							
							if event.interrupted then
								Number0Frame5( Number0, event )
								return 
							else
								Number0:beginAnimation( "keyframe", 1639, false, false, CoD.TweenType.Linear )
								Number0:setLeftRight( true, false, 281, 329 )
								Number0:setTopBottom( true, false, 34, 98 )
								Number0:registerEventHandler( "transition_complete_keyframe", Number0Frame5 )
							end
						end
						
						if event.interrupted then
							Number0Frame4( Number0, event )
							return 
						else
							Number0:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							Number0:setAlpha( 1 )
							Number0:registerEventHandler( "transition_complete_keyframe", Number0Frame4 )
						end
					end
					
					if event.interrupted then
						Number0Frame3( Number0, event )
						return 
					else
						Number0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						Number0:registerEventHandler( "transition_complete_keyframe", Number0Frame3 )
					end
				end
				
				Number0:completeAnimation()
				self.Number0:setLeftRight( true, false, 277, 325 )
				self.Number0:setTopBottom( true, false, 38, 102 )
				self.Number0:setAlpha( 0 )
				self.Number0:setXRot( 0 )
				self.Number0:setYRot( 0 )
				self.Number0:setZRot( 7 )
				self.Number0:setScale( 0.8 )
				Number0Frame2( Number0, {} )
				local Number0bFrame2 = function ( Number0b, event )
					local Number0bFrame3 = function ( Number0b, event )
						local Number0bFrame4 = function ( Number0b, event )
							local Number0bFrame5 = function ( Number0b, event )
								local Number0bFrame6 = function ( Number0b, event )
									local Number0bFrame7 = function ( Number0b, event )
										if not event.interrupted then
											Number0b:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
										end
										Number0b:setLeftRight( true, false, 192, 240 )
										Number0b:setTopBottom( true, false, 111, 175 )
										Number0b:setAlpha( 1 )
										Number0b:setXRot( -54 )
										Number0b:setZRot( 71 )
										Number0b:setScale( 0.8 )
										if event.interrupted then
											self.clipFinished( Number0b, event )
										else
											Number0b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Number0bFrame7( Number0b, event )
										return 
									else
										Number0b:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										Number0b:setLeftRight( true, false, 300.02, 348.02 )
										Number0b:setTopBottom( true, false, 34.72, 98.72 )
										Number0b:setXRot( -3.38 )
										Number0b:setZRot( 17 )
										Number0b:registerEventHandler( "transition_complete_keyframe", Number0bFrame7 )
									end
								end
								
								if event.interrupted then
									Number0bFrame6( Number0b, event )
									return 
								else
									Number0b:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
									Number0b:registerEventHandler( "transition_complete_keyframe", Number0bFrame6 )
								end
							end
							
							if event.interrupted then
								Number0bFrame5( Number0b, event )
								return 
							else
								Number0b:beginAnimation( "keyframe", 1639, false, false, CoD.TweenType.Linear )
								Number0b:setLeftRight( true, false, 310, 358 )
								Number0b:setTopBottom( true, false, 30, 94 )
								Number0b:registerEventHandler( "transition_complete_keyframe", Number0bFrame5 )
							end
						end
						
						if event.interrupted then
							Number0bFrame4( Number0b, event )
							return 
						else
							Number0b:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							Number0b:setAlpha( 1 )
							Number0b:registerEventHandler( "transition_complete_keyframe", Number0bFrame4 )
						end
					end
					
					if event.interrupted then
						Number0bFrame3( Number0b, event )
						return 
					else
						Number0b:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						Number0b:registerEventHandler( "transition_complete_keyframe", Number0bFrame3 )
					end
				end
				
				Number0b:completeAnimation()
				self.Number0b:setLeftRight( true, false, 306, 354 )
				self.Number0b:setTopBottom( true, false, 34, 98 )
				self.Number0b:setAlpha( 0 )
				self.Number0b:setXRot( 0 )
				self.Number0b:setZRot( 7 )
				self.Number0b:setScale( 0.8 )
				Number0bFrame2( Number0b, {} )
				local Number1Frame2 = function ( Number1, event )
					local Number1Frame3 = function ( Number1, event )
						local Number1Frame4 = function ( Number1, event )
							local Number1Frame5 = function ( Number1, event )
								local Number1Frame6 = function ( Number1, event )
									if not event.interrupted then
										Number1:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
									end
									Number1:setLeftRight( true, false, 166.94, 214.94 )
									Number1:setTopBottom( true, false, 118.78, 182.78 )
									Number1:setAlpha( 1 )
									Number1:setZRot( 141 )
									Number1:setScale( 0.8 )
									if event.interrupted then
										self.clipFinished( Number1, event )
									else
										Number1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Number1Frame6( Number1, event )
									return 
								else
									Number1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Number1:setLeftRight( true, false, 250.5, 298.5 )
									Number1:setTopBottom( true, false, 44, 108 )
									Number1:setZRot( 13.7 )
									Number1:registerEventHandler( "transition_complete_keyframe", Number1Frame6 )
								end
							end
							
							if event.interrupted then
								Number1Frame5( Number1, event )
								return 
							else
								Number1:beginAnimation( "keyframe", 1770, false, false, CoD.TweenType.Linear )
								Number1:setLeftRight( true, false, 255.5, 303.5 )
								Number1:setTopBottom( true, false, 37, 101 )
								Number1:registerEventHandler( "transition_complete_keyframe", Number1Frame5 )
							end
						end
						
						if event.interrupted then
							Number1Frame4( Number1, event )
							return 
						else
							Number1:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							Number1:setAlpha( 1 )
							Number1:registerEventHandler( "transition_complete_keyframe", Number1Frame4 )
						end
					end
					
					if event.interrupted then
						Number1Frame3( Number1, event )
						return 
					else
						Number1:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						Number1:registerEventHandler( "transition_complete_keyframe", Number1Frame3 )
					end
				end
				
				Number1:completeAnimation()
				self.Number1:setLeftRight( true, false, 252.5, 300.5 )
				self.Number1:setTopBottom( true, false, 42, 106 )
				self.Number1:setAlpha( 0 )
				self.Number1:setZRot( 7 )
				self.Number1:setScale( 0.8 )
				Number1Frame2( Number1, {} )
				local star1Frame2 = function ( star1, event )
					local star1Frame3 = function ( star1, event )
						local star1Frame4 = function ( star1, event )
							local star1Frame5 = function ( star1, event )
								local star1Frame6 = function ( star1, event )
									if not event.interrupted then
										star1:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
									end
									star1:setLeftRight( true, false, 226, 310 )
									star1:setTopBottom( true, false, -86, -2 )
									star1:setAlpha( 1 )
									star1:setZRot( -70 )
									star1:setZoom( 0 )
									star1:setScale( 1.4 )
									if event.interrupted then
										self.clipFinished( star1, event )
									else
										star1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									star1Frame6( star1, event )
									return 
								else
									star1:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
									star1:registerEventHandler( "transition_complete_keyframe", star1Frame6 )
								end
							end
							
							if event.interrupted then
								star1Frame5( star1, event )
								return 
							else
								star1:beginAnimation( "keyframe", 1639, false, false, CoD.TweenType.Linear )
								star1:setLeftRight( true, false, 256.5, 340.5 )
								star1:setTopBottom( true, false, -43, 41 )
								star1:setScale( 1.1 )
								star1:registerEventHandler( "transition_complete_keyframe", star1Frame5 )
							end
						end
						
						if event.interrupted then
							star1Frame4( star1, event )
							return 
						else
							star1:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							star1:setAlpha( 1 )
							star1:registerEventHandler( "transition_complete_keyframe", star1Frame4 )
						end
					end
					
					if event.interrupted then
						star1Frame3( star1, event )
						return 
					else
						star1:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						star1:registerEventHandler( "transition_complete_keyframe", star1Frame3 )
					end
				end
				
				star1:completeAnimation()
				self.star1:setLeftRight( true, false, 251.5, 335.5 )
				self.star1:setTopBottom( true, false, -32, 52 )
				self.star1:setAlpha( 0 )
				self.star1:setZRot( 7 )
				self.star1:setZoom( 0 )
				self.star1:setScale( 1 )
				star1Frame2( star1, {} )
				local f2_local23 = function ( f112_arg0, f112_arg1 )
					local f112_local0 = function ( f113_arg0, f113_arg1 )
						local f113_local0 = function ( f114_arg0, f114_arg1 )
							local f114_local0 = function ( f115_arg0, f115_arg1 )
								local f115_local0 = function ( f116_arg0, f116_arg1 )
									if not f116_arg1.interrupted then
										f116_arg0:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
									end
									f116_arg0:setLeftRight( true, false, 516.98, 780.98 )
									f116_arg0:setTopBottom( true, false, -22, 98 )
									f116_arg0:setAlpha( 0 )
									f116_arg0:setZRot( 0 )
									if f116_arg1.interrupted then
										self.clipFinished( f116_arg0, f116_arg1 )
									else
										f116_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f115_arg1.interrupted then
									f115_local0( f115_arg0, f115_arg1 )
									return 
								else
									f115_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									f115_arg0:setLeftRight( true, false, 220.5, 484.5 )
									f115_arg0:setTopBottom( true, false, 154, 274 )
									f115_arg0:setAlpha( 0 )
									f115_arg0:setZRot( 11 )
									f115_arg0:registerEventHandler( "transition_complete_keyframe", f115_local0 )
								end
							end
							
							if f114_arg1.interrupted then
								f114_local0( f114_arg0, f114_arg1 )
								return 
							else
								f114_arg0:beginAnimation( "keyframe", 979, false, false, CoD.TweenType.Linear )
								f114_arg0:setLeftRight( true, false, 227.51, 491.51 )
								f114_arg0:setTopBottom( true, false, 144.65, 264.65 )
								f114_arg0:setZRot( 10.6 )
								f114_arg0:registerEventHandler( "transition_complete_keyframe", f114_local0 )
							end
						end
						
						if f113_arg1.interrupted then
							f113_local0( f113_arg0, f113_arg1 )
							return 
						else
							f113_arg0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
							f113_arg0:setLeftRight( true, false, 342, 606 )
							f113_arg0:setTopBottom( true, false, -8, 112 )
							f113_arg0:setZRot( 4 )
							f113_arg0:registerEventHandler( "transition_complete_keyframe", f113_local0 )
						end
					end
					
					if f112_arg1.interrupted then
						f112_local0( f112_arg0, f112_arg1 )
						return 
					else
						f112_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f112_arg0:setLeftRight( true, false, 474.3, 738.3 )
						f112_arg0:setTopBottom( true, false, -18.59, 101.41 )
						f112_arg0:setAlpha( 1 )
						f112_arg0:setZRot( 0.98 )
						f112_arg0:registerEventHandler( "transition_complete_keyframe", f112_local0 )
					end
				end
				
				fist:beginAnimation( "keyframe", 2230, false, false, CoD.TweenType.Linear )
				fist:setLeftRight( true, false, 516.98, 780.98 )
				fist:setTopBottom( true, false, -22, 98 )
				fist:setAlpha( 0 )
				fist:setZRot( 0 )
				fist:registerEventHandler( "transition_complete_keyframe", f2_local23 )
				local f2_local24 = function ( f117_arg0, f117_arg1 )
					local f117_local0 = function ( f118_arg0, f118_arg1 )
						local f118_local0 = function ( f119_arg0, f119_arg1 )
							local f119_local0 = function ( f120_arg0, f120_arg1 )
								if not f120_arg1.interrupted then
									f120_arg0:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
								end
								f120_arg0:setAlpha( 0 )
								if f120_arg1.interrupted then
									self.clipFinished( f120_arg0, f120_arg1 )
								else
									f120_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f119_arg1.interrupted then
								f119_local0( f119_arg0, f119_arg1 )
								return 
							else
								f119_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								f119_arg0:registerEventHandler( "transition_complete_keyframe", f119_local0 )
							end
						end
						
						if f118_arg1.interrupted then
							f118_local0( f118_arg0, f118_arg1 )
							return 
						else
							f118_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							f118_arg0:setAlpha( 1 )
							f118_arg0:registerEventHandler( "transition_complete_keyframe", f118_local0 )
						end
					end
					
					if f117_arg1.interrupted then
						f117_local0( f117_arg0, f117_arg1 )
						return 
					else
						f117_arg0:beginAnimation( "keyframe", 1709, false, false, CoD.TweenType.Linear )
						f117_arg0:registerEventHandler( "transition_complete_keyframe", f117_local0 )
					end
				end
				
				Glow:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
				Glow:setAlpha( 0 )
				Glow:registerEventHandler( "transition_complete_keyframe", f2_local24 )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

