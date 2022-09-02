-- 0ad9b2fb8f727f5c549e0f5e5c9980b7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Pixel" )

CoD.outofbounds_arrowswidget = InheritFrom( LUI.UIElement )
CoD.outofbounds_arrowswidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.outofbounds_arrowswidget )
	self.id = "outofbounds_arrowswidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 119 )
	self:setTopBottom( true, false, 0, 218 )
	
	local RightLargeArrow0 = LUI.UIImage.new()
	RightLargeArrow0:setLeftRight( true, false, 283, 370.19 )
	RightLargeArrow0:setTopBottom( true, false, 0, 214 )
	RightLargeArrow0:setRGB( 0.73, 0, 0 )
	RightLargeArrow0:setAlpha( 0 )
	RightLargeArrow0:setImage( RegisterImage( "uie_t7_hud_outofbounds_largearrow" ) )
	RightLargeArrow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RightLargeArrow0 )
	self.RightLargeArrow0 = RightLargeArrow0
	
	local RightLargeArrow = LUI.UIImage.new()
	RightLargeArrow:setLeftRight( true, false, 0, 87.19 )
	RightLargeArrow:setTopBottom( true, false, 0, 214 )
	RightLargeArrow:setRGB( 0.73, 0, 0 )
	RightLargeArrow:setImage( RegisterImage( "uie_t7_hud_outofbounds_largearrow" ) )
	RightLargeArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RightLargeArrow )
	self.RightLargeArrow = RightLargeArrow
	
	local RightSmallArrow0 = LUI.UIImage.new()
	RightSmallArrow0:setLeftRight( true, false, 69.97, 119 )
	RightSmallArrow0:setTopBottom( true, false, 55.89, 162.11 )
	RightSmallArrow0:setRGB( 0.73, 0, 0 )
	RightSmallArrow0:setAlpha( 0 )
	RightSmallArrow0:setImage( RegisterImage( "uie_t7_hud_outofbounds_smallarrow" ) )
	RightSmallArrow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RightSmallArrow0 )
	self.RightSmallArrow0 = RightSmallArrow0
	
	local RightSmallArrow = LUI.UIImage.new()
	RightSmallArrow:setLeftRight( true, false, 69.97, 119 )
	RightSmallArrow:setTopBottom( true, false, 55.89, 162.11 )
	RightSmallArrow:setRGB( 0.73, 0, 0 )
	RightSmallArrow:setImage( RegisterImage( "uie_t7_hud_outofbounds_smallarrow" ) )
	RightSmallArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RightSmallArrow )
	self.RightSmallArrow = RightSmallArrow
	
	local AbilityWheelPixel0 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel0:setLeftRight( false, false, -50.11, -42.11 )
	AbilityWheelPixel0:setTopBottom( false, false, -100, -92 )
	AbilityWheelPixel0.Image20:setAlpha( 0.7 )
	AbilityWheelPixel0.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel0 )
	self.AbilityWheelPixel0 = AbilityWheelPixel0
	
	local AbilityWheelPixel1 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel1:setLeftRight( false, false, -25.11, -17.11 )
	AbilityWheelPixel1:setTopBottom( false, false, -100, -92 )
	AbilityWheelPixel1.Image20:setAlpha( 0.7 )
	AbilityWheelPixel1.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel1 )
	self.AbilityWheelPixel1 = AbilityWheelPixel1
	
	local AbilityWheelPixel2 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel2:setLeftRight( false, false, -50.11, -42.11 )
	AbilityWheelPixel2:setTopBottom( false, false, 101, 109 )
	AbilityWheelPixel2.Image20:setAlpha( 0.7 )
	AbilityWheelPixel2.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel2 )
	self.AbilityWheelPixel2 = AbilityWheelPixel2
	
	local AbilityWheelPixel3 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel3:setLeftRight( false, false, -25.11, -17.11 )
	AbilityWheelPixel3:setTopBottom( false, false, 101, 109 )
	AbilityWheelPixel3.Image20:setAlpha( 0.7 )
	AbilityWheelPixel3.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel3 )
	self.AbilityWheelPixel3 = AbilityWheelPixel3
	
	local AbilityWheelPixel00 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel00:setLeftRight( false, false, 238.09, 246.09 )
	AbilityWheelPixel00:setTopBottom( false, false, -100, -92 )
	AbilityWheelPixel00.Image20:setAlpha( 0.7 )
	AbilityWheelPixel00.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel00 )
	self.AbilityWheelPixel00 = AbilityWheelPixel00
	
	local AbilityWheelPixel10 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel10:setLeftRight( false, false, 263.09, 271.09 )
	AbilityWheelPixel10:setTopBottom( false, false, -100, -92 )
	AbilityWheelPixel10.Image20:setAlpha( 0.7 )
	AbilityWheelPixel10.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel10 )
	self.AbilityWheelPixel10 = AbilityWheelPixel10
	
	local AbilityWheelPixel20 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel20:setLeftRight( false, false, 238.09, 246.09 )
	AbilityWheelPixel20:setTopBottom( false, false, 101, 109 )
	AbilityWheelPixel20.Image20:setAlpha( 0.7 )
	AbilityWheelPixel20.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel20 )
	self.AbilityWheelPixel20 = AbilityWheelPixel20
	
	local AbilityWheelPixel30 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel30:setLeftRight( false, false, 263.09, 271.09 )
	AbilityWheelPixel30:setTopBottom( false, false, 101, 109 )
	AbilityWheelPixel30.Image20:setAlpha( 0.7 )
	AbilityWheelPixel30.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel30 )
	self.AbilityWheelPixel30 = AbilityWheelPixel30
	
	local AbilityWheelPixel300 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel300:setLeftRight( false, false, 19.68, 27.68 )
	AbilityWheelPixel300:setTopBottom( false, false, 54.61, 62.61 )
	AbilityWheelPixel300.Image20:setAlpha( 0.7 )
	AbilityWheelPixel300.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel300 )
	self.AbilityWheelPixel300 = AbilityWheelPixel300
	
	local AbilityWheelPixel3000 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel3000:setLeftRight( false, false, 19.69, 27.69 )
	AbilityWheelPixel3000:setTopBottom( false, false, -60.61, -52.61 )
	AbilityWheelPixel3000.Image20:setAlpha( 0.7 )
	AbilityWheelPixel3000.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel3000 )
	self.AbilityWheelPixel3000 = AbilityWheelPixel3000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				local RightLargeArrow0Frame2 = function ( RightLargeArrow0, event )
					local RightLargeArrow0Frame3 = function ( RightLargeArrow0, event )
						if not event.interrupted then
							RightLargeArrow0:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
						end
						RightLargeArrow0:setLeftRight( true, false, 283, 370.19 )
						RightLargeArrow0:setTopBottom( true, false, 0, 214 )
						RightLargeArrow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( RightLargeArrow0, event )
						else
							RightLargeArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RightLargeArrow0Frame3( RightLargeArrow0, event )
						return 
					else
						RightLargeArrow0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						RightLargeArrow0:setAlpha( 1 )
						RightLargeArrow0:registerEventHandler( "transition_complete_keyframe", RightLargeArrow0Frame3 )
					end
				end
				
				RightLargeArrow0:completeAnimation()
				self.RightLargeArrow0:setLeftRight( true, false, 0, 87.19 )
				self.RightLargeArrow0:setTopBottom( true, false, 0, 214 )
				self.RightLargeArrow0:setAlpha( 0 )
				RightLargeArrow0Frame2( RightLargeArrow0, {} )
				local RightLargeArrowFrame2 = function ( RightLargeArrow, event )
					if not event.interrupted then
						RightLargeArrow:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
					end
					RightLargeArrow:setLeftRight( true, false, 283, 370.19 )
					RightLargeArrow:setTopBottom( true, false, 0, 214 )
					RightLargeArrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RightLargeArrow, event )
					else
						RightLargeArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RightLargeArrow:completeAnimation()
				self.RightLargeArrow:setLeftRight( true, false, 0, 87.19 )
				self.RightLargeArrow:setTopBottom( true, false, 0, 214 )
				self.RightLargeArrow:setAlpha( 1 )
				RightLargeArrowFrame2( RightLargeArrow, {} )
				local RightSmallArrowFrame2 = function ( RightSmallArrow, event )
					local RightSmallArrowFrame3 = function ( RightSmallArrow, event )
						local RightSmallArrowFrame4 = function ( RightSmallArrow, event )
							if not event.interrupted then
								RightSmallArrow:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
							end
							RightSmallArrow:setLeftRight( true, false, 265.23, 314.26 )
							RightSmallArrow:setTopBottom( true, false, 55.89, 162.11 )
							RightSmallArrow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( RightSmallArrow, event )
							else
								RightSmallArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RightSmallArrowFrame4( RightSmallArrow, event )
							return 
						else
							RightSmallArrow:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
							RightSmallArrow:setLeftRight( true, false, 134.32, 183.35 )
							RightSmallArrow:setTopBottom( true, false, 55.89, 162.11 )
							RightSmallArrow:registerEventHandler( "transition_complete_keyframe", RightSmallArrowFrame4 )
						end
					end
					
					if event.interrupted then
						RightSmallArrowFrame3( RightSmallArrow, event )
						return 
					else
						RightSmallArrow:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						RightSmallArrow:registerEventHandler( "transition_complete_keyframe", RightSmallArrowFrame3 )
					end
				end
				
				RightSmallArrow:completeAnimation()
				self.RightSmallArrow:setLeftRight( true, false, 69.97, 119 )
				self.RightSmallArrow:setTopBottom( true, false, 55.89, 162.11 )
				self.RightSmallArrow:setAlpha( 1 )
				RightSmallArrowFrame2( RightSmallArrow, {} )
				local AbilityWheelPixel0Frame2 = function ( AbilityWheelPixel0, event )
					if not event.interrupted then
						AbilityWheelPixel0:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
					end
					AbilityWheelPixel0:setLeftRight( false, false, 234.09, 242.09 )
					AbilityWheelPixel0:setTopBottom( false, false, -100, -92 )
					AbilityWheelPixel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityWheelPixel0, event )
					else
						AbilityWheelPixel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityWheelPixel0:completeAnimation()
				self.AbilityWheelPixel0:setLeftRight( false, false, -50.11, -42.11 )
				self.AbilityWheelPixel0:setTopBottom( false, false, -100, -92 )
				self.AbilityWheelPixel0:setAlpha( 1 )
				AbilityWheelPixel0Frame2( AbilityWheelPixel0, {} )
				local AbilityWheelPixel1Frame2 = function ( AbilityWheelPixel1, event )
					if not event.interrupted then
						AbilityWheelPixel1:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
					end
					AbilityWheelPixel1:setLeftRight( false, false, 259.09, 267.09 )
					AbilityWheelPixel1:setTopBottom( false, false, -100, -92 )
					AbilityWheelPixel1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityWheelPixel1, event )
					else
						AbilityWheelPixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityWheelPixel1:completeAnimation()
				self.AbilityWheelPixel1:setLeftRight( false, false, -25.11, -17.11 )
				self.AbilityWheelPixel1:setTopBottom( false, false, -100, -92 )
				self.AbilityWheelPixel1:setAlpha( 1 )
				AbilityWheelPixel1Frame2( AbilityWheelPixel1, {} )
				local AbilityWheelPixel2Frame2 = function ( AbilityWheelPixel2, event )
					if not event.interrupted then
						AbilityWheelPixel2:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
					end
					AbilityWheelPixel2:setLeftRight( false, false, 234.09, 242.09 )
					AbilityWheelPixel2:setTopBottom( false, false, 101, 109 )
					AbilityWheelPixel2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityWheelPixel2, event )
					else
						AbilityWheelPixel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityWheelPixel2:completeAnimation()
				self.AbilityWheelPixel2:setLeftRight( false, false, -50.11, -42.11 )
				self.AbilityWheelPixel2:setTopBottom( false, false, 101, 109 )
				self.AbilityWheelPixel2:setAlpha( 1 )
				AbilityWheelPixel2Frame2( AbilityWheelPixel2, {} )
				local AbilityWheelPixel3Frame2 = function ( AbilityWheelPixel3, event )
					if not event.interrupted then
						AbilityWheelPixel3:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
					end
					AbilityWheelPixel3:setLeftRight( false, false, 259.09, 267.09 )
					AbilityWheelPixel3:setTopBottom( false, false, 101, 109 )
					AbilityWheelPixel3:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityWheelPixel3, event )
					else
						AbilityWheelPixel3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityWheelPixel3:completeAnimation()
				self.AbilityWheelPixel3:setLeftRight( false, false, -25.11, -17.11 )
				self.AbilityWheelPixel3:setTopBottom( false, false, 101, 109 )
				self.AbilityWheelPixel3:setAlpha( 1 )
				AbilityWheelPixel3Frame2( AbilityWheelPixel3, {} )
				local AbilityWheelPixel00Frame2 = function ( AbilityWheelPixel00, event )
					local AbilityWheelPixel00Frame3 = function ( AbilityWheelPixel00, event )
						if not event.interrupted then
							AbilityWheelPixel00:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
						end
						AbilityWheelPixel00:setLeftRight( false, false, 238.09, 246.09 )
						AbilityWheelPixel00:setTopBottom( false, false, -100, -92 )
						AbilityWheelPixel00:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( AbilityWheelPixel00, event )
						else
							AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel00Frame3( AbilityWheelPixel00, event )
						return 
					else
						AbilityWheelPixel00:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel00:setAlpha( 1 )
						AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame3 )
					end
				end
				
				AbilityWheelPixel00:completeAnimation()
				self.AbilityWheelPixel00:setLeftRight( false, false, -50.11, -42.11 )
				self.AbilityWheelPixel00:setTopBottom( false, false, -100, -92 )
				self.AbilityWheelPixel00:setAlpha( 0 )
				AbilityWheelPixel00Frame2( AbilityWheelPixel00, {} )
				local AbilityWheelPixel10Frame2 = function ( AbilityWheelPixel10, event )
					local AbilityWheelPixel10Frame3 = function ( AbilityWheelPixel10, event )
						if not event.interrupted then
							AbilityWheelPixel10:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
						end
						AbilityWheelPixel10:setLeftRight( false, false, 263.09, 271.09 )
						AbilityWheelPixel10:setTopBottom( false, false, -100, -92 )
						AbilityWheelPixel10:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( AbilityWheelPixel10, event )
						else
							AbilityWheelPixel10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel10Frame3( AbilityWheelPixel10, event )
						return 
					else
						AbilityWheelPixel10:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel10:setAlpha( 1 )
						AbilityWheelPixel10:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel10Frame3 )
					end
				end
				
				AbilityWheelPixel10:completeAnimation()
				self.AbilityWheelPixel10:setLeftRight( false, false, -25.11, -17.11 )
				self.AbilityWheelPixel10:setTopBottom( false, false, -100, -92 )
				self.AbilityWheelPixel10:setAlpha( 0 )
				AbilityWheelPixel10Frame2( AbilityWheelPixel10, {} )
				local AbilityWheelPixel20Frame2 = function ( AbilityWheelPixel20, event )
					local AbilityWheelPixel20Frame3 = function ( AbilityWheelPixel20, event )
						if not event.interrupted then
							AbilityWheelPixel20:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
						end
						AbilityWheelPixel20:setLeftRight( false, false, 238.09, 246.09 )
						AbilityWheelPixel20:setTopBottom( false, false, 101, 109 )
						AbilityWheelPixel20:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( AbilityWheelPixel20, event )
						else
							AbilityWheelPixel20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel20Frame3( AbilityWheelPixel20, event )
						return 
					else
						AbilityWheelPixel20:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel20:setAlpha( 1 )
						AbilityWheelPixel20:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel20Frame3 )
					end
				end
				
				AbilityWheelPixel20:completeAnimation()
				self.AbilityWheelPixel20:setLeftRight( false, false, -50.11, -42.11 )
				self.AbilityWheelPixel20:setTopBottom( false, false, 101, 109 )
				self.AbilityWheelPixel20:setAlpha( 0 )
				AbilityWheelPixel20Frame2( AbilityWheelPixel20, {} )
				local AbilityWheelPixel30Frame2 = function ( AbilityWheelPixel30, event )
					local AbilityWheelPixel30Frame3 = function ( AbilityWheelPixel30, event )
						if not event.interrupted then
							AbilityWheelPixel30:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
						end
						AbilityWheelPixel30:setLeftRight( false, false, 263.09, 271.09 )
						AbilityWheelPixel30:setTopBottom( false, false, 101, 109 )
						AbilityWheelPixel30:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( AbilityWheelPixel30, event )
						else
							AbilityWheelPixel30:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel30Frame3( AbilityWheelPixel30, event )
						return 
					else
						AbilityWheelPixel30:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel30:setAlpha( 1 )
						AbilityWheelPixel30:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel30Frame3 )
					end
				end
				
				AbilityWheelPixel30:completeAnimation()
				self.AbilityWheelPixel30:setLeftRight( false, false, -25.11, -17.11 )
				self.AbilityWheelPixel30:setTopBottom( false, false, 101, 109 )
				self.AbilityWheelPixel30:setAlpha( 0 )
				AbilityWheelPixel30Frame2( AbilityWheelPixel30, {} )
				local AbilityWheelPixel300Frame2 = function ( AbilityWheelPixel300, event )
					local AbilityWheelPixel300Frame3 = function ( AbilityWheelPixel300, event )
						if not event.interrupted then
							AbilityWheelPixel300:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						end
						AbilityWheelPixel300:setLeftRight( false, false, 193.69, 201.69 )
						AbilityWheelPixel300:setTopBottom( false, false, 54.11, 62.11 )
						AbilityWheelPixel300:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( AbilityWheelPixel300, event )
						else
							AbilityWheelPixel300:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel300Frame3( AbilityWheelPixel300, event )
						return 
					else
						AbilityWheelPixel300:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel300:setLeftRight( false, false, 110.64, 118.64 )
						AbilityWheelPixel300:setTopBottom( false, false, 54.35, 62.35 )
						AbilityWheelPixel300:setAlpha( 1 )
						AbilityWheelPixel300:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel300Frame3 )
					end
				end
				
				AbilityWheelPixel300:completeAnimation()
				self.AbilityWheelPixel300:setLeftRight( false, false, 19.68, 27.68 )
				self.AbilityWheelPixel300:setTopBottom( false, false, 54.61, 62.61 )
				self.AbilityWheelPixel300:setAlpha( 0 )
				AbilityWheelPixel300Frame2( AbilityWheelPixel300, {} )
				local AbilityWheelPixel3000Frame2 = function ( AbilityWheelPixel3000, event )
					local AbilityWheelPixel3000Frame3 = function ( AbilityWheelPixel3000, event )
						if not event.interrupted then
							AbilityWheelPixel3000:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						end
						AbilityWheelPixel3000:setLeftRight( false, false, 193.69, 201.69 )
						AbilityWheelPixel3000:setTopBottom( false, false, -61.11, -53.11 )
						AbilityWheelPixel3000:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( AbilityWheelPixel3000, event )
						else
							AbilityWheelPixel3000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel3000Frame3( AbilityWheelPixel3000, event )
						return 
					else
						AbilityWheelPixel3000:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel3000:setLeftRight( false, false, 110.64, 118.64 )
						AbilityWheelPixel3000:setTopBottom( false, false, -60.88, -52.88 )
						AbilityWheelPixel3000:setAlpha( 1 )
						AbilityWheelPixel3000:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel3000Frame3 )
					end
				end
				
				AbilityWheelPixel3000:completeAnimation()
				self.AbilityWheelPixel3000:setLeftRight( false, false, 19.69, 27.69 )
				self.AbilityWheelPixel3000:setTopBottom( false, false, -60.61, -52.61 )
				self.AbilityWheelPixel3000:setAlpha( 0 )
				AbilityWheelPixel3000Frame2( AbilityWheelPixel3000, {} )

				self.nextClip = "DefaultClip"
			end
		},
		IsOutOfBounds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AbilityWheelPixel0:close()
		element.AbilityWheelPixel1:close()
		element.AbilityWheelPixel2:close()
		element.AbilityWheelPixel3:close()
		element.AbilityWheelPixel00:close()
		element.AbilityWheelPixel10:close()
		element.AbilityWheelPixel20:close()
		element.AbilityWheelPixel30:close()
		element.AbilityWheelPixel300:close()
		element.AbilityWheelPixel3000:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

