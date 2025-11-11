CoD.freeCursorCursor = InheritFrom( LUI.UIElement )
CoD.freeCursorCursor.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.freeCursorCursor )
	self.id = "freeCursorCursor"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 140 )
	self:setTopBottom( 0, 0, 0, 140 )
	
	local blk = LUI.UIImage.new()
	blk:setLeftRight( 0, 0, 35, 105 )
	blk:setTopBottom( 0, 0, 35, 105 )
	blk:setAlpha( 0.3 )
	blk:setImage( RegisterImage( "uie_menu_cursor_base_blk" ) )
	self:addElement( blk )
	self.blk = blk
	
	local arrowLeft = LUI.UIImage.new()
	arrowLeft:setLeftRight( 0, 0, 33, 45 )
	arrowLeft:setTopBottom( 0, 0, 63, 75 )
	arrowLeft:setImage( RegisterImage( "uie_menu_cursor_arrow" ) )
	self:addElement( arrowLeft )
	self.arrowLeft = arrowLeft
	
	local arrowRight = LUI.UIImage.new()
	arrowRight:setLeftRight( 0, 0, 95, 107 )
	arrowRight:setTopBottom( 0, 0, 63, 75 )
	arrowRight:setYRot( 180 )
	arrowRight:setImage( RegisterImage( "uie_menu_cursor_arrow" ) )
	self:addElement( arrowRight )
	self.arrowRight = arrowRight
	
	local centerCross = LUI.UIImage.new()
	centerCross:setLeftRight( 0, 0, 65, 77 )
	centerCross:setTopBottom( 0, 0, 63, 75 )
	centerCross:setImage( RegisterImage( "uie_menu_cursor_centercross" ) )
	self:addElement( centerCross )
	self.centerCross = centerCross
	
	local centerLine = LUI.UIImage.new()
	centerLine:setLeftRight( 0, 0, 65, 76 )
	centerLine:setTopBottom( 0, 0, 63, 75 )
	centerLine:setImage( RegisterImage( "uie_menu_cursor_centerline" ) )
	centerLine:setupNineSliceShader( 6, 6 )
	self:addElement( centerLine )
	self.centerLine = centerLine
	
	local centerLineAnimate = LUI.UIImage.new()
	centerLineAnimate:setLeftRight( 0, 0, 65, 76 )
	centerLineAnimate:setTopBottom( 0, 0, 63, 75 )
	centerLineAnimate:setImage( RegisterImage( "uie_menu_cursor_centerline" ) )
	centerLineAnimate:setupNineSliceShader( 6, 6 )
	self:addElement( centerLineAnimate )
	self.centerLineAnimate = centerLineAnimate
	
	local sideBracketLeft = LUI.UIImage.new()
	sideBracketLeft:setLeftRight( 0, 0, 40, 64 )
	sideBracketLeft:setTopBottom( 0, 0, 39, 99 )
	sideBracketLeft:setImage( RegisterImage( "uie_menu_cursor_sidebracket" ) )
	self:addElement( sideBracketLeft )
	self.sideBracketLeft = sideBracketLeft
	
	local sideBracketRight = LUI.UIImage.new()
	sideBracketRight:setLeftRight( 0, 0, 76, 100 )
	sideBracketRight:setTopBottom( 0, 0, 39, 99 )
	sideBracketRight:setYRot( 180 )
	sideBracketRight:setImage( RegisterImage( "uie_menu_cursor_sidebracket" ) )
	self:addElement( sideBracketRight )
	self.sideBracketRight = sideBracketRight
	
	local topBracket = LUI.UIImage.new()
	topBracket:setLeftRight( 0, 0, 52, 88 )
	topBracket:setTopBottom( 0, 0, 36, 48 )
	topBracket:setAlpha( 0.5 )
	topBracket:setImage( RegisterImage( "uie_menu_cursor_topbracket" ) )
	self:addElement( topBracket )
	self.topBracket = topBracket
	
	local bottomBracket = LUI.UIImage.new()
	bottomBracket:setLeftRight( 0, 0, 52, 88 )
	bottomBracket:setTopBottom( 0, 0, 90, 102 )
	bottomBracket:setAlpha( 0.5 )
	bottomBracket:setXRot( 180 )
	bottomBracket:setImage( RegisterImage( "uie_menu_cursor_topbracket" ) )
	self:addElement( bottomBracket )
	self.bottomBracket = bottomBracket
	
	local centerCrossGlow = LUI.UIImage.new()
	centerCrossGlow:setLeftRight( 0, 0, 47, 95 )
	centerCrossGlow:setTopBottom( 0, 0, 45, 93 )
	centerCrossGlow:setImage( RegisterImage( "uie_menu_cursor_centercross_glow" ) )
	self:addElement( centerCrossGlow )
	self.centerCrossGlow = centerCrossGlow
	
	local arrowLeftGlow = LUI.UIImage.new()
	arrowLeftGlow:setLeftRight( 0, 0, 19, 67 )
	arrowLeftGlow:setTopBottom( 0, 0, 45, 93 )
	arrowLeftGlow:setImage( RegisterImage( "uie_menu_cursor_arrow_glow" ) )
	self:addElement( arrowLeftGlow )
	self.arrowLeftGlow = arrowLeftGlow
	
	local arrowRightGlow = LUI.UIImage.new()
	arrowRightGlow:setLeftRight( 0, 0, 73, 121 )
	arrowRightGlow:setTopBottom( 0, 0, 45, 93 )
	arrowRightGlow:setYRot( 180 )
	arrowRightGlow:setImage( RegisterImage( "uie_menu_cursor_arrow_glow" ) )
	self:addElement( arrowRightGlow )
	self.arrowRightGlow = arrowRightGlow
	
	local topBracketGlow = LUI.UIImage.new()
	topBracketGlow:setLeftRight( 0, 0, 34, 106 )
	topBracketGlow:setTopBottom( 0, 0, 20, 68 )
	topBracketGlow:setImage( RegisterImage( "uie_menu_cursor_topbracket_glow" ) )
	self:addElement( topBracketGlow )
	self.topBracketGlow = topBracketGlow
	
	local bottomBracketGlow = LUI.UIImage.new()
	bottomBracketGlow:setLeftRight( 0, 0, 34, 106 )
	bottomBracketGlow:setTopBottom( 0, 0, 70, 118 )
	bottomBracketGlow:setXRot( 180 )
	bottomBracketGlow:setImage( RegisterImage( "uie_menu_cursor_topbracket_glow" ) )
	self:addElement( bottomBracketGlow )
	self.bottomBracketGlow = bottomBracketGlow
	
	self.resetProperties = function ()
		bottomBracketGlow:completeAnimation()
		topBracketGlow:completeAnimation()
		arrowRightGlow:completeAnimation()
		arrowLeftGlow:completeAnimation()
		centerCrossGlow:completeAnimation()
		centerCross:completeAnimation()
		topBracket:completeAnimation()
		bottomBracket:completeAnimation()
		arrowRight:completeAnimation()
		arrowLeft:completeAnimation()
		centerLineAnimate:completeAnimation()
		centerLine:completeAnimation()
		sideBracketRight:completeAnimation()
		sideBracketLeft:completeAnimation()
		bottomBracketGlow:setAlpha( 1 )
		topBracketGlow:setAlpha( 1 )
		arrowRightGlow:setAlpha( 1 )
		arrowLeftGlow:setAlpha( 1 )
		centerCrossGlow:setAlpha( 1 )
		centerCross:setAlpha( 1 )
		topBracket:setLeftRight( 0, 0, 52, 88 )
		topBracket:setTopBottom( 0, 0, 36, 48 )
		topBracket:setAlpha( 0.5 )
		bottomBracket:setLeftRight( 0, 0, 52, 88 )
		bottomBracket:setTopBottom( 0, 0, 90, 102 )
		bottomBracket:setAlpha( 0.5 )
		arrowRight:setLeftRight( 0, 0, 95, 107 )
		arrowRight:setTopBottom( 0, 0, 63, 75 )
		arrowRight:setAlpha( 1 )
		arrowLeft:setLeftRight( 0, 0, 33, 45 )
		arrowLeft:setTopBottom( 0, 0, 63, 75 )
		arrowLeft:setAlpha( 1 )
		centerLineAnimate:setLeftRight( 0, 0, 65, 76 )
		centerLineAnimate:setTopBottom( 0, 0, 63, 75 )
		centerLineAnimate:setAlpha( 1 )
		centerLine:setAlpha( 1 )
		sideBracketRight:setAlpha( 1 )
		sideBracketLeft:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				arrowLeft:completeAnimation()
				self.arrowLeft:setLeftRight( 0, 0, 58, 70 )
				self.arrowLeft:setTopBottom( 0, 0, 63, 75 )
				self.arrowLeft:setAlpha( 0.1 )
				self.clipFinished( arrowLeft, {} )
				arrowRight:completeAnimation()
				self.arrowRight:setLeftRight( 0, 0, 70, 82 )
				self.arrowRight:setTopBottom( 0, 0, 63, 75 )
				self.arrowRight:setAlpha( 0.1 )
				self.clipFinished( arrowRight, {} )
				centerCross:completeAnimation()
				self.centerCross:setAlpha( 0 )
				self.clipFinished( centerCross, {} )
				centerLineAnimate:completeAnimation()
				self.centerLineAnimate:setAlpha( 0 )
				self.clipFinished( centerLineAnimate, {} )
				topBracket:completeAnimation()
				self.topBracket:setLeftRight( 0, 0, 52, 88 )
				self.topBracket:setTopBottom( 0, 0, 48, 60 )
				self.topBracket:setAlpha( 0.1 )
				self.clipFinished( topBracket, {} )
				bottomBracket:completeAnimation()
				self.bottomBracket:setLeftRight( 0, 0, 52, 88 )
				self.bottomBracket:setTopBottom( 0, 0, 78, 90 )
				self.bottomBracket:setAlpha( 0.1 )
				self.clipFinished( bottomBracket, {} )
				centerCrossGlow:completeAnimation()
				self.centerCrossGlow:setAlpha( 0 )
				self.clipFinished( centerCrossGlow, {} )
				arrowLeftGlow:completeAnimation()
				self.arrowLeftGlow:setAlpha( 0 )
				self.clipFinished( arrowLeftGlow, {} )
				arrowRightGlow:completeAnimation()
				self.arrowRightGlow:setAlpha( 0 )
				self.clipFinished( arrowRightGlow, {} )
				topBracketGlow:completeAnimation()
				self.topBracketGlow:setAlpha( 0 )
				self.clipFinished( topBracketGlow, {} )
				bottomBracketGlow:completeAnimation()
				self.bottomBracketGlow:setAlpha( 0 )
				self.clipFinished( bottomBracketGlow, {} )
			end,
			HasFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				local arrowLeftFrame2 = function ( arrowLeft, event )
					if not event.interrupted then
						arrowLeft:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					arrowLeft:setLeftRight( 0, 0, 36, 48 )
					arrowLeft:setTopBottom( 0, 0, 63, 75 )
					arrowLeft:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( arrowLeft, event )
					else
						arrowLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrowLeft:completeAnimation()
				self.arrowLeft:setLeftRight( 0, 0, 58, 70 )
				self.arrowLeft:setTopBottom( 0, 0, 63, 75 )
				self.arrowLeft:setAlpha( 0.1 )
				arrowLeftFrame2( arrowLeft, {} )
				local arrowRightFrame2 = function ( arrowRight, event )
					if not event.interrupted then
						arrowRight:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					arrowRight:setLeftRight( 0, 0, 92, 104 )
					arrowRight:setTopBottom( 0, 0, 63, 75 )
					arrowRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( arrowRight, event )
					else
						arrowRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrowRight:completeAnimation()
				self.arrowRight:setLeftRight( 0, 0, 70, 82 )
				self.arrowRight:setTopBottom( 0, 0, 63, 75 )
				self.arrowRight:setAlpha( 0.1 )
				arrowRightFrame2( arrowRight, {} )
				local centerCrossFrame2 = function ( centerCross, event )
					if not event.interrupted then
						centerCross:beginAnimation( "keyframe", 219, false, true, CoD.TweenType.Linear )
					end
					centerCross:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( centerCross, event )
					else
						centerCross:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				centerCross:completeAnimation()
				self.centerCross:setAlpha( 0 )
				centerCrossFrame2( centerCross, {} )
				local centerLineFrame2 = function ( centerLine, event )
					if not event.interrupted then
						centerLine:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					centerLine:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( centerLine, event )
					else
						centerLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				centerLine:completeAnimation()
				self.centerLine:setAlpha( 1 )
				centerLineFrame2( centerLine, {} )
				local centerLineAnimateFrame2 = function ( centerLineAnimate, event )
					if not event.interrupted then
						centerLineAnimate:beginAnimation( "keyframe", 219, true, false, CoD.TweenType.Linear )
					end
					centerLineAnimate:setLeftRight( 0, 0, 43, 97 )
					centerLineAnimate:setTopBottom( 0, 0, 63, 75 )
					centerLineAnimate:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( centerLineAnimate, event )
					else
						centerLineAnimate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				centerLineAnimate:completeAnimation()
				self.centerLineAnimate:setLeftRight( 0, 0, 64, 77 )
				self.centerLineAnimate:setTopBottom( 0, 0, 63, 75 )
				self.centerLineAnimate:setAlpha( 0.3 )
				centerLineAnimateFrame2( centerLineAnimate, {} )
				local topBracketFrame2 = function ( topBracket, event )
					if not event.interrupted then
						topBracket:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					topBracket:setLeftRight( 0, 0, 52, 88 )
					topBracket:setTopBottom( 0, 0, 40, 52 )
					topBracket:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( topBracket, event )
					else
						topBracket:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				topBracket:completeAnimation()
				self.topBracket:setLeftRight( 0, 0, 52, 88 )
				self.topBracket:setTopBottom( 0, 0, 48, 60 )
				self.topBracket:setAlpha( 0.1 )
				topBracketFrame2( topBracket, {} )
				local bottomBracketFrame2 = function ( bottomBracket, event )
					if not event.interrupted then
						bottomBracket:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					bottomBracket:setLeftRight( 0, 0, 52, 88 )
					bottomBracket:setTopBottom( 0, 0, 86, 98 )
					bottomBracket:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( bottomBracket, event )
					else
						bottomBracket:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bottomBracket:completeAnimation()
				self.bottomBracket:setLeftRight( 0, 0, 52, 88 )
				self.bottomBracket:setTopBottom( 0, 0, 78, 90 )
				self.bottomBracket:setAlpha( 0.1 )
				bottomBracketFrame2( bottomBracket, {} )
				local centerCrossGlowFrame2 = function ( centerCrossGlow, event )
					local centerCrossGlowFrame3 = function ( centerCrossGlow, event )
						if not event.interrupted then
							centerCrossGlow:beginAnimation( "keyframe", 480, true, false, CoD.TweenType.Back )
						end
						centerCrossGlow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( centerCrossGlow, event )
						else
							centerCrossGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						centerCrossGlowFrame3( centerCrossGlow, event )
						return 
					else
						centerCrossGlow:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						centerCrossGlow:registerEventHandler( "transition_complete_keyframe", centerCrossGlowFrame3 )
					end
				end
				
				centerCrossGlow:completeAnimation()
				self.centerCrossGlow:setAlpha( 0 )
				centerCrossGlowFrame2( centerCrossGlow, {} )
				local arrowLeftGlowFrame2 = function ( arrowLeftGlow, event )
					local arrowLeftGlowFrame3 = function ( arrowLeftGlow, event )
						if not event.interrupted then
							arrowLeftGlow:beginAnimation( "keyframe", 480, true, false, CoD.TweenType.Back )
						end
						arrowLeftGlow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( arrowLeftGlow, event )
						else
							arrowLeftGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						arrowLeftGlowFrame3( arrowLeftGlow, event )
						return 
					else
						arrowLeftGlow:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						arrowLeftGlow:registerEventHandler( "transition_complete_keyframe", arrowLeftGlowFrame3 )
					end
				end
				
				arrowLeftGlow:completeAnimation()
				self.arrowLeftGlow:setAlpha( 0 )
				arrowLeftGlowFrame2( arrowLeftGlow, {} )
				local arrowRightGlowFrame2 = function ( arrowRightGlow, event )
					local arrowRightGlowFrame3 = function ( arrowRightGlow, event )
						if not event.interrupted then
							arrowRightGlow:beginAnimation( "keyframe", 480, true, false, CoD.TweenType.Back )
						end
						arrowRightGlow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( arrowRightGlow, event )
						else
							arrowRightGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						arrowRightGlowFrame3( arrowRightGlow, event )
						return 
					else
						arrowRightGlow:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						arrowRightGlow:registerEventHandler( "transition_complete_keyframe", arrowRightGlowFrame3 )
					end
				end
				
				arrowRightGlow:completeAnimation()
				self.arrowRightGlow:setAlpha( 0 )
				arrowRightGlowFrame2( arrowRightGlow, {} )
				local topBracketGlowFrame2 = function ( topBracketGlow, event )
					local topBracketGlowFrame3 = function ( topBracketGlow, event )
						if not event.interrupted then
							topBracketGlow:beginAnimation( "keyframe", 480, true, false, CoD.TweenType.Back )
						end
						topBracketGlow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( topBracketGlow, event )
						else
							topBracketGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						topBracketGlowFrame3( topBracketGlow, event )
						return 
					else
						topBracketGlow:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						topBracketGlow:registerEventHandler( "transition_complete_keyframe", topBracketGlowFrame3 )
					end
				end
				
				topBracketGlow:completeAnimation()
				self.topBracketGlow:setAlpha( 0 )
				topBracketGlowFrame2( topBracketGlow, {} )
				local bottomBracketGlowFrame2 = function ( bottomBracketGlow, event )
					local bottomBracketGlowFrame3 = function ( bottomBracketGlow, event )
						if not event.interrupted then
							bottomBracketGlow:beginAnimation( "keyframe", 480, true, false, CoD.TweenType.Back )
						end
						bottomBracketGlow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( bottomBracketGlow, event )
						else
							bottomBracketGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						bottomBracketGlowFrame3( bottomBracketGlow, event )
						return 
					else
						bottomBracketGlow:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						bottomBracketGlow:registerEventHandler( "transition_complete_keyframe", bottomBracketGlowFrame3 )
					end
				end
				
				bottomBracketGlow:completeAnimation()
				self.bottomBracketGlow:setAlpha( 0 )
				bottomBracketGlowFrame2( bottomBracketGlow, {} )
			end
		},
		HasFocus = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				centerLine:completeAnimation()
				self.centerLine:setAlpha( 0 )
				self.clipFinished( centerLine, {} )
				centerLineAnimate:completeAnimation()
				self.centerLineAnimate:setLeftRight( 0, 0, 43, 97 )
				self.centerLineAnimate:setTopBottom( 0, 0, 63, 75 )
				self.clipFinished( centerLineAnimate, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
				local arrowLeftFrame2 = function ( arrowLeft, event )
					if not event.interrupted then
						arrowLeft:beginAnimation( "keyframe", 219, true, false, CoD.TweenType.Linear )
					end
					arrowLeft:setLeftRight( 0, 0, 58, 70 )
					arrowLeft:setTopBottom( 0, 0, 63, 75 )
					arrowLeft:setAlpha( 0.1 )
					if event.interrupted then
						self.clipFinished( arrowLeft, event )
					else
						arrowLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrowLeft:completeAnimation()
				self.arrowLeft:setLeftRight( 0, 0, 36, 48 )
				self.arrowLeft:setTopBottom( 0, 0, 63, 75 )
				self.arrowLeft:setAlpha( 1 )
				arrowLeftFrame2( arrowLeft, {} )
				local arrowRightFrame2 = function ( arrowRight, event )
					if not event.interrupted then
						arrowRight:beginAnimation( "keyframe", 219, true, false, CoD.TweenType.Linear )
					end
					arrowRight:setLeftRight( 0, 0, 70, 82 )
					arrowRight:setTopBottom( 0, 0, 63, 75 )
					arrowRight:setAlpha( 0.1 )
					if event.interrupted then
						self.clipFinished( arrowRight, event )
					else
						arrowRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrowRight:completeAnimation()
				self.arrowRight:setLeftRight( 0, 0, 92, 104 )
				self.arrowRight:setTopBottom( 0, 0, 63, 75 )
				self.arrowRight:setAlpha( 1 )
				arrowRightFrame2( arrowRight, {} )
				local centerCrossFrame2 = function ( centerCross, event )
					if not event.interrupted then
						centerCross:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					centerCross:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( centerCross, event )
					else
						centerCross:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				centerCross:completeAnimation()
				self.centerCross:setAlpha( 1 )
				centerCrossFrame2( centerCross, {} )
				local centerLineFrame2 = function ( centerLine, event )
					if not event.interrupted then
						centerLine:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					centerLine:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( centerLine, event )
					else
						centerLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				centerLine:completeAnimation()
				self.centerLine:setAlpha( 0 )
				centerLineFrame2( centerLine, {} )
				local centerLineAnimateFrame2 = function ( centerLineAnimate, event )
					if not event.interrupted then
						centerLineAnimate:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					centerLineAnimate:setLeftRight( 0, 0, 64, 77 )
					centerLineAnimate:setTopBottom( 0, 0, 63, 75 )
					centerLineAnimate:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( centerLineAnimate, event )
					else
						centerLineAnimate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				centerLineAnimate:completeAnimation()
				self.centerLineAnimate:setLeftRight( 0, 0, 43, 97 )
				self.centerLineAnimate:setTopBottom( 0, 0, 63, 75 )
				self.centerLineAnimate:setAlpha( 0.3 )
				centerLineAnimateFrame2( centerLineAnimate, {} )
				sideBracketLeft:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				sideBracketLeft:setAlpha( 1 )
				sideBracketLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				sideBracketRight:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				sideBracketRight:setAlpha( 1 )
				sideBracketRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local topBracketFrame2 = function ( topBracket, event )
					if not event.interrupted then
						topBracket:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					topBracket:setLeftRight( 0, 0, 52, 88 )
					topBracket:setTopBottom( 0, 0, 48, 60 )
					topBracket:setAlpha( 0.1 )
					if event.interrupted then
						self.clipFinished( topBracket, event )
					else
						topBracket:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				topBracket:completeAnimation()
				self.topBracket:setLeftRight( 0, 0, 52, 88 )
				self.topBracket:setTopBottom( 0, 0, 40, 52 )
				self.topBracket:setAlpha( 1 )
				topBracketFrame2( topBracket, {} )
				local bottomBracketFrame2 = function ( bottomBracket, event )
					if not event.interrupted then
						bottomBracket:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					bottomBracket:setLeftRight( 0, 0, 52, 88 )
					bottomBracket:setTopBottom( 0, 0, 78, 90 )
					bottomBracket:setAlpha( 0.1 )
					if event.interrupted then
						self.clipFinished( bottomBracket, event )
					else
						bottomBracket:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bottomBracket:completeAnimation()
				self.bottomBracket:setLeftRight( 0, 0, 52, 88 )
				self.bottomBracket:setTopBottom( 0, 0, 86, 98 )
				self.bottomBracket:setAlpha( 1 )
				bottomBracketFrame2( bottomBracket, {} )
				local centerCrossGlowFrame2 = function ( centerCrossGlow, event )
					if not event.interrupted then
						centerCrossGlow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					centerCrossGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( centerCrossGlow, event )
					else
						centerCrossGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				centerCrossGlow:completeAnimation()
				self.centerCrossGlow:setAlpha( 1 )
				centerCrossGlowFrame2( centerCrossGlow, {} )
				local arrowLeftGlowFrame2 = function ( arrowLeftGlow, event )
					if not event.interrupted then
						arrowLeftGlow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					arrowLeftGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( arrowLeftGlow, event )
					else
						arrowLeftGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrowLeftGlow:completeAnimation()
				self.arrowLeftGlow:setAlpha( 1 )
				arrowLeftGlowFrame2( arrowLeftGlow, {} )
				local arrowRightGlowFrame2 = function ( arrowRightGlow, event )
					if not event.interrupted then
						arrowRightGlow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					arrowRightGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( arrowRightGlow, event )
					else
						arrowRightGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrowRightGlow:completeAnimation()
				self.arrowRightGlow:setAlpha( 1 )
				arrowRightGlowFrame2( arrowRightGlow, {} )
				local topBracketGlowFrame2 = function ( topBracketGlow, event )
					if not event.interrupted then
						topBracketGlow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					topBracketGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( topBracketGlow, event )
					else
						topBracketGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				topBracketGlow:completeAnimation()
				self.topBracketGlow:setAlpha( 1 )
				topBracketGlowFrame2( topBracketGlow, {} )
				local bottomBracketGlowFrame2 = function ( bottomBracketGlow, event )
					if not event.interrupted then
						bottomBracketGlow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					bottomBracketGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( bottomBracketGlow, event )
					else
						bottomBracketGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bottomBracketGlow:completeAnimation()
				self.bottomBracketGlow:setAlpha( 1 )
				bottomBracketGlowFrame2( bottomBracketGlow, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HasFocus",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "hasFocus" )
			end
		}
	} )
	self:linkToElementModel( self, "hasFocus", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hasFocus"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

