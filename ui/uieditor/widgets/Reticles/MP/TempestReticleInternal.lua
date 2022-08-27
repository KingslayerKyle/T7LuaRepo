-- febed91defc3da6f1f30961a776edbac
-- This hash is used for caching, delete to decompile the file again

CoD.TempestReticleInternal = InheritFrom( LUI.UIElement )
CoD.TempestReticleInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TempestReticleInternal )
	self.id = "TempestReticleInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 180 )
	self:setTopBottom( true, false, 0, 180 )
	
	local centerDot = LUI.UIImage.new()
	centerDot:setLeftRight( false, false, -6, 6 )
	centerDot:setTopBottom( false, false, -6, 6 )
	centerDot:setAlpha( 0.7 )
	centerDot:setScale( 1.3 )
	centerDot:setImage( RegisterImage( "uie_tempest_center_dot" ) )
	self:addElement( centerDot )
	self.centerDot = centerDot
	
	local ReticleLineBottom = LUI.UIImage.new()
	ReticleLineBottom:setLeftRight( false, false, -6, 6 )
	ReticleLineBottom:setTopBottom( false, false, -8.5, 39.5 )
	ReticleLineBottom:setAlpha( 0.8 )
	ReticleLineBottom:setImage( RegisterImage( "uie_tempest_reticle_line" ) )
	ReticleLineBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleLineBottom )
	self.ReticleLineBottom = ReticleLineBottom
	
	local ReticleLineTop = LUI.UIImage.new()
	ReticleLineTop:setLeftRight( false, false, -6, 6 )
	ReticleLineTop:setTopBottom( false, false, -38, 9 )
	ReticleLineTop:setAlpha( 0.8 )
	ReticleLineTop:setImage( RegisterImage( "uie_tempest_reticle_line" ) )
	ReticleLineTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleLineTop )
	self.ReticleLineTop = ReticleLineTop
	
	local ReticleLineRight = LUI.UIImage.new()
	ReticleLineRight:setLeftRight( false, false, -2, 36 )
	ReticleLineRight:setTopBottom( false, false, -7, 7 )
	ReticleLineRight:setAlpha( 0.8 )
	ReticleLineRight:setImage( RegisterImage( "uie_tempest_reticle_line_side" ) )
	ReticleLineRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleLineRight )
	self.ReticleLineRight = ReticleLineRight
	
	local ReticleLineLeft = LUI.UIImage.new()
	ReticleLineLeft:setLeftRight( false, false, -36, 2 )
	ReticleLineLeft:setTopBottom( false, false, -7, 7 )
	ReticleLineLeft:setAlpha( 0.8 )
	ReticleLineLeft:setImage( RegisterImage( "uie_tempest_reticle_line_side" ) )
	ReticleLineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleLineLeft )
	self.ReticleLineLeft = ReticleLineLeft
	
	local OuterLineAngleCenter = LUI.UIImage.new()
	OuterLineAngleCenter:setLeftRight( false, false, 11, 23 )
	OuterLineAngleCenter:setTopBottom( false, false, -33.5, 2.5 )
	OuterLineAngleCenter:setAlpha( 0 )
	OuterLineAngleCenter:setZRot( 45 )
	OuterLineAngleCenter:setImage( RegisterImage( "uie_tempest_reticle_charge_top_line" ) )
	OuterLineAngleCenter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	OuterLineAngleCenter:setShaderVector( 0, 0.33, 0.11, 0.77, 0.05 )
	OuterLineAngleCenter:setupNineSliceShader( 4, 4 )
	self:addElement( OuterLineAngleCenter )
	self.OuterLineAngleCenter = OuterLineAngleCenter
	
	local OuterLineRightTop = LUI.UIImage.new()
	OuterLineRightTop:setLeftRight( false, false, 0, 12 )
	OuterLineRightTop:setTopBottom( false, false, -32, -25 )
	OuterLineRightTop:setAlpha( 0 )
	OuterLineRightTop:setImage( RegisterImage( "uie_tempest_reticle_charge_top_line" ) )
	OuterLineRightTop:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	OuterLineRightTop:setShaderVector( 0, 0.33, 0.57, 0.8, 0 )
	OuterLineRightTop:setupNineSliceShader( 4, 4 )
	self:addElement( OuterLineRightTop )
	self.OuterLineRightTop = OuterLineRightTop
	
	local OuterLineAngleCenter0 = LUI.UIImage.new()
	OuterLineAngleCenter0:setLeftRight( false, false, -22, -10 )
	OuterLineAngleCenter0:setTopBottom( false, false, -33.5, 2.5 )
	OuterLineAngleCenter0:setAlpha( 0 )
	OuterLineAngleCenter0:setZRot( -45 )
	OuterLineAngleCenter0:setImage( RegisterImage( "uie_tempest_reticle_charge_top_line" ) )
	OuterLineAngleCenter0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	OuterLineAngleCenter0:setShaderVector( 0, 0.33, 0.11, 0.77, 0.05 )
	OuterLineAngleCenter0:setupNineSliceShader( 4, 4 )
	self:addElement( OuterLineAngleCenter0 )
	self.OuterLineAngleCenter0 = OuterLineAngleCenter0
	
	local OuterLineRightTopLeft2 = LUI.UIImage.new()
	OuterLineRightTopLeft2:setLeftRight( false, false, -11, 1 )
	OuterLineRightTopLeft2:setTopBottom( false, false, -32, -25 )
	OuterLineRightTopLeft2:setAlpha( 0 )
	OuterLineRightTopLeft2:setImage( RegisterImage( "uie_tempest_reticle_charge_top_line" ) )
	OuterLineRightTopLeft2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	OuterLineRightTopLeft2:setShaderVector( 0, 0.33, 0.57, 0.8, 0 )
	OuterLineRightTopLeft2:setupNineSliceShader( 4, 4 )
	self:addElement( OuterLineRightTopLeft2 )
	self.OuterLineRightTopLeft2 = OuterLineRightTopLeft2
	
	local OuterLineAngleCenter1 = LUI.UIImage.new()
	OuterLineAngleCenter1:setLeftRight( false, false, 11, 23 )
	OuterLineAngleCenter1:setTopBottom( false, false, -3, 33 )
	OuterLineAngleCenter1:setAlpha( 0 )
	OuterLineAngleCenter1:setZRot( -45 )
	OuterLineAngleCenter1:setImage( RegisterImage( "uie_tempest_reticle_charge_top_line" ) )
	OuterLineAngleCenter1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	OuterLineAngleCenter1:setShaderVector( 0, 0.33, 0.11, 0.77, 0.05 )
	OuterLineAngleCenter1:setupNineSliceShader( 4, 4 )
	self:addElement( OuterLineAngleCenter1 )
	self.OuterLineAngleCenter1 = OuterLineAngleCenter1
	
	local OuterLineRightTop1 = LUI.UIImage.new()
	OuterLineRightTop1:setLeftRight( false, false, 0, 12 )
	OuterLineRightTop1:setTopBottom( false, false, 25, 32 )
	OuterLineRightTop1:setAlpha( 0 )
	OuterLineRightTop1:setImage( RegisterImage( "uie_tempest_reticle_charge_top_line" ) )
	OuterLineRightTop1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	OuterLineRightTop1:setShaderVector( 0, 0.33, 0.57, 0.8, 0 )
	OuterLineRightTop1:setupNineSliceShader( 4, 4 )
	self:addElement( OuterLineRightTop1 )
	self.OuterLineRightTop1 = OuterLineRightTop1
	
	local OuterLineAngleCenterLL = LUI.UIImage.new()
	OuterLineAngleCenterLL:setLeftRight( false, false, -22, -10 )
	OuterLineAngleCenterLL:setTopBottom( false, false, -3, 33 )
	OuterLineAngleCenterLL:setAlpha( 0 )
	OuterLineAngleCenterLL:setZRot( 45 )
	OuterLineAngleCenterLL:setImage( RegisterImage( "uie_tempest_reticle_charge_top_line" ) )
	OuterLineAngleCenterLL:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	OuterLineAngleCenterLL:setShaderVector( 0, 0.33, 0.11, 0.77, 0.05 )
	OuterLineAngleCenterLL:setupNineSliceShader( 4, 4 )
	self:addElement( OuterLineAngleCenterLL )
	self.OuterLineAngleCenterLL = OuterLineAngleCenterLL
	
	local OuterLineLeft2 = LUI.UIImage.new()
	OuterLineLeft2:setLeftRight( false, false, -11, 1 )
	OuterLineLeft2:setTopBottom( false, false, 25, 32 )
	OuterLineLeft2:setAlpha( 0 )
	OuterLineLeft2:setImage( RegisterImage( "uie_tempest_reticle_charge_top_line" ) )
	OuterLineLeft2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	OuterLineLeft2:setShaderVector( 0, 0.33, 0.57, 0.8, 0 )
	OuterLineLeft2:setupNineSliceShader( 4, 4 )
	self:addElement( OuterLineLeft2 )
	self.OuterLineLeft2 = OuterLineLeft2
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, 27, 33 )
	Image0:setTopBottom( false, false, 0.5, 9 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_tempest_reticle_charge_top_line_side" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image0:setShaderVector( 0, 0.67, 0.47, 0.04, 0 )
	Image0:setupNineSliceShader( 4, 4 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, 27, 33 )
	Image1:setTopBottom( false, false, -8.5, 0 )
	Image1:setAlpha( 0 )
	Image1:setImage( RegisterImage( "uie_tempest_reticle_charge_top_line_side" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image1:setShaderVector( 0, 0.67, 0.47, 0.04, 0 )
	Image1:setupNineSliceShader( 4, 4 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, false, -32, -26 )
	Image2:setTopBottom( false, false, 0.25, 8.75 )
	Image2:setAlpha( 0 )
	Image2:setImage( RegisterImage( "uie_tempest_reticle_charge_top_line_side" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image2:setShaderVector( 0, 0.67, 0.47, 0.04, 0 )
	Image2:setupNineSliceShader( 4, 4 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, false, -32, -26 )
	Image3:setTopBottom( false, false, -8.5, 0 )
	Image3:setAlpha( 0 )
	Image3:setImage( RegisterImage( "uie_tempest_reticle_charge_top_line_side" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image3:setShaderVector( 0, 0.67, 0.47, 0.04, 0 )
	Image3:setupNineSliceShader( 4, 4 )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ReticleLineBottom:completeAnimation()
				self.ReticleLineBottom:setLeftRight( false, false, -6, 6 )
				self.ReticleLineBottom:setTopBottom( false, false, -8, 40 )
				self.clipFinished( ReticleLineBottom, {} )
				ReticleLineTop:completeAnimation()
				self.ReticleLineTop:setLeftRight( false, false, -6, 6 )
				self.ReticleLineTop:setTopBottom( false, false, -39, 8 )
				self.clipFinished( ReticleLineTop, {} )
				ReticleLineRight:completeAnimation()
				self.ReticleLineRight:setLeftRight( false, false, -2, 36 )
				self.ReticleLineRight:setTopBottom( false, false, -7, 7 )
				self.clipFinished( ReticleLineRight, {} )
				ReticleLineLeft:completeAnimation()
				self.ReticleLineLeft:setLeftRight( false, false, -36, 2 )
				self.ReticleLineLeft:setTopBottom( false, false, -7, 7 )
				self.clipFinished( ReticleLineLeft, {} )
			end,
			Fire = function ()
				self:setupElementClipCounter( 17 )
				centerDot:completeAnimation()
				self.centerDot:setLeftRight( false, false, -6, 6 )
				self.centerDot:setTopBottom( false, false, -6, 6 )
				self.clipFinished( centerDot, {} )
				local ReticleLineBottomFrame2 = function ( ReticleLineBottom, event )
					local ReticleLineBottomFrame3 = function ( ReticleLineBottom, event )
						local ReticleLineBottomFrame4 = function ( ReticleLineBottom, event )
							if not event.interrupted then
								ReticleLineBottom:beginAnimation( "keyframe", 189, true, false, CoD.TweenType.Back )
							end
							ReticleLineBottom:setLeftRight( false, false, -6, 6 )
							ReticleLineBottom:setTopBottom( false, false, 25, 73 )
							if event.interrupted then
								self.clipFinished( ReticleLineBottom, event )
							else
								ReticleLineBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ReticleLineBottomFrame4( ReticleLineBottom, event )
							return 
						else
							ReticleLineBottom:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							ReticleLineBottom:registerEventHandler( "transition_complete_keyframe", ReticleLineBottomFrame4 )
						end
					end
					
					if event.interrupted then
						ReticleLineBottomFrame3( ReticleLineBottom, event )
						return 
					else
						ReticleLineBottom:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						ReticleLineBottom:setTopBottom( false, false, -2, 2.5 )
						ReticleLineBottom:registerEventHandler( "transition_complete_keyframe", ReticleLineBottomFrame3 )
					end
				end
				
				ReticleLineBottom:completeAnimation()
				self.ReticleLineBottom:setLeftRight( false, false, -6, 6 )
				self.ReticleLineBottom:setTopBottom( false, false, -8, 40 )
				ReticleLineBottomFrame2( ReticleLineBottom, {} )
				local ReticleLineTopFrame2 = function ( ReticleLineTop, event )
					local ReticleLineTopFrame3 = function ( ReticleLineTop, event )
						local ReticleLineTopFrame4 = function ( ReticleLineTop, event )
							if not event.interrupted then
								ReticleLineTop:beginAnimation( "keyframe", 189, true, false, CoD.TweenType.Back )
							end
							ReticleLineTop:setLeftRight( false, false, -6, 6 )
							ReticleLineTop:setTopBottom( false, false, -72, -25 )
							if event.interrupted then
								self.clipFinished( ReticleLineTop, event )
							else
								ReticleLineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ReticleLineTopFrame4( ReticleLineTop, event )
							return 
						else
							ReticleLineTop:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							ReticleLineTop:registerEventHandler( "transition_complete_keyframe", ReticleLineTopFrame4 )
						end
					end
					
					if event.interrupted then
						ReticleLineTopFrame3( ReticleLineTop, event )
						return 
					else
						ReticleLineTop:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						ReticleLineTop:setTopBottom( false, false, -3, 3.5 )
						ReticleLineTop:registerEventHandler( "transition_complete_keyframe", ReticleLineTopFrame3 )
					end
				end
				
				ReticleLineTop:completeAnimation()
				self.ReticleLineTop:setLeftRight( false, false, -6, 6 )
				self.ReticleLineTop:setTopBottom( false, false, -39, 8 )
				ReticleLineTopFrame2( ReticleLineTop, {} )
				local ReticleLineRightFrame2 = function ( ReticleLineRight, event )
					local ReticleLineRightFrame3 = function ( ReticleLineRight, event )
						local ReticleLineRightFrame4 = function ( ReticleLineRight, event )
							if not event.interrupted then
								ReticleLineRight:beginAnimation( "keyframe", 189, true, false, CoD.TweenType.Back )
							end
							ReticleLineRight:setLeftRight( false, false, 30, 68 )
							ReticleLineRight:setTopBottom( false, false, -7, 7 )
							if event.interrupted then
								self.clipFinished( ReticleLineRight, event )
							else
								ReticleLineRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ReticleLineRightFrame4( ReticleLineRight, event )
							return 
						else
							ReticleLineRight:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							ReticleLineRight:registerEventHandler( "transition_complete_keyframe", ReticleLineRightFrame4 )
						end
					end
					
					if event.interrupted then
						ReticleLineRightFrame3( ReticleLineRight, event )
						return 
					else
						ReticleLineRight:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						ReticleLineRight:setLeftRight( false, false, -2, 2 )
						ReticleLineRight:registerEventHandler( "transition_complete_keyframe", ReticleLineRightFrame3 )
					end
				end
				
				ReticleLineRight:completeAnimation()
				self.ReticleLineRight:setLeftRight( false, false, -2, 36 )
				self.ReticleLineRight:setTopBottom( false, false, -7, 7 )
				ReticleLineRightFrame2( ReticleLineRight, {} )
				local ReticleLineLeftFrame2 = function ( ReticleLineLeft, event )
					local ReticleLineLeftFrame3 = function ( ReticleLineLeft, event )
						local ReticleLineLeftFrame4 = function ( ReticleLineLeft, event )
							if not event.interrupted then
								ReticleLineLeft:beginAnimation( "keyframe", 189, true, false, CoD.TweenType.Back )
							end
							ReticleLineLeft:setLeftRight( false, false, -67, -29 )
							ReticleLineLeft:setTopBottom( false, false, -7, 7 )
							if event.interrupted then
								self.clipFinished( ReticleLineLeft, event )
							else
								ReticleLineLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ReticleLineLeftFrame4( ReticleLineLeft, event )
							return 
						else
							ReticleLineLeft:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							ReticleLineLeft:setLeftRight( false, false, -2, 2 )
							ReticleLineLeft:registerEventHandler( "transition_complete_keyframe", ReticleLineLeftFrame4 )
						end
					end
					
					if event.interrupted then
						ReticleLineLeftFrame3( ReticleLineLeft, event )
						return 
					else
						ReticleLineLeft:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						ReticleLineLeft:setLeftRight( false, false, -2, 2 )
						ReticleLineLeft:registerEventHandler( "transition_complete_keyframe", ReticleLineLeftFrame3 )
					end
				end
				
				ReticleLineLeft:completeAnimation()
				self.ReticleLineLeft:setLeftRight( false, false, -36, 2 )
				self.ReticleLineLeft:setTopBottom( false, false, -7, 7 )
				ReticleLineLeftFrame2( ReticleLineLeft, {} )
				local f3_local4 = function ( f16_arg0, f16_arg1 )
					local f16_local0 = function ( f17_arg0, f17_arg1 )
						if not f17_arg1.interrupted then
							f17_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						f17_arg0:setLeftRight( false, false, 11, 23 )
						f17_arg0:setTopBottom( false, false, -33.5, 2.5 )
						f17_arg0:setAlpha( 1 )
						if f17_arg1.interrupted then
							self.clipFinished( f17_arg0, f17_arg1 )
						else
							f17_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f16_arg1.interrupted then
						f16_local0( f16_arg0, f16_arg1 )
						return 
					else
						f16_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f16_arg0:setAlpha( 1 )
						f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
					end
				end
				
				OuterLineAngleCenter:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				OuterLineAngleCenter:setLeftRight( false, false, 22, 34 )
				OuterLineAngleCenter:setTopBottom( false, false, -5, -5.25 )
				OuterLineAngleCenter:setAlpha( 0 )
				OuterLineAngleCenter:registerEventHandler( "transition_complete_keyframe", f3_local4 )
				local OuterLineRightTopFrame2 = function ( OuterLineRightTop, event )
					local OuterLineRightTopFrame3 = function ( OuterLineRightTop, event )
						local OuterLineRightTopFrame4 = function ( OuterLineRightTop, event )
							local OuterLineRightTopFrame5 = function ( OuterLineRightTop, event )
								if not event.interrupted then
									OuterLineRightTop:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								end
								OuterLineRightTop:setLeftRight( false, false, 0, 12 )
								OuterLineRightTop:setTopBottom( false, false, -32, -25 )
								OuterLineRightTop:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( OuterLineRightTop, event )
								else
									OuterLineRightTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								OuterLineRightTopFrame5( OuterLineRightTop, event )
								return 
							else
								OuterLineRightTop:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								OuterLineRightTop:setTopBottom( false, false, -32, -25 )
								OuterLineRightTop:registerEventHandler( "transition_complete_keyframe", OuterLineRightTopFrame5 )
							end
						end
						
						if event.interrupted then
							OuterLineRightTopFrame4( OuterLineRightTop, event )
							return 
						else
							OuterLineRightTop:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							OuterLineRightTop:setTopBottom( false, false, -26.17, -25 )
							OuterLineRightTop:setAlpha( 1 )
							OuterLineRightTop:registerEventHandler( "transition_complete_keyframe", OuterLineRightTopFrame4 )
						end
					end
					
					if event.interrupted then
						OuterLineRightTopFrame3( OuterLineRightTop, event )
						return 
					else
						OuterLineRightTop:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						OuterLineRightTop:setTopBottom( false, false, -25, -25 )
						OuterLineRightTop:setAlpha( 0 )
						OuterLineRightTop:registerEventHandler( "transition_complete_keyframe", OuterLineRightTopFrame3 )
					end
				end
				
				OuterLineRightTop:completeAnimation()
				self.OuterLineRightTop:setLeftRight( false, false, 0, 12 )
				self.OuterLineRightTop:setTopBottom( false, false, -32, -32 )
				self.OuterLineRightTop:setAlpha( 1 )
				OuterLineRightTopFrame2( OuterLineRightTop, {} )
				local f3_local6 = function ( f22_arg0, f22_arg1 )
					local f22_local0 = function ( f23_arg0, f23_arg1 )
						if not f23_arg1.interrupted then
							f23_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						f23_arg0:setLeftRight( false, false, -22, -10 )
						f23_arg0:setTopBottom( false, false, -33.5, 2.5 )
						f23_arg0:setAlpha( 1 )
						f23_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
						f23_arg0:setShaderVector( 0, 0.07, 0.19, 0.77, 0.05 )
						if f23_arg1.interrupted then
							self.clipFinished( f23_arg0, f23_arg1 )
						else
							f23_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f22_arg1.interrupted then
						f22_local0( f22_arg0, f22_arg1 )
						return 
					else
						f22_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f22_arg0:setAlpha( 1 )
						f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
					end
				end
				
				OuterLineAngleCenter0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				OuterLineAngleCenter0:setLeftRight( false, false, -33, -21 )
				OuterLineAngleCenter0:setTopBottom( false, false, -5, -4.25 )
				OuterLineAngleCenter0:setAlpha( 0 )
				OuterLineAngleCenter0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
				OuterLineAngleCenter0:setShaderVector( 0, 0.07, 0.19, 0.77, 0.05 )
				OuterLineAngleCenter0:registerEventHandler( "transition_complete_keyframe", f3_local6 )
				local OuterLineRightTopLeft2Frame2 = function ( OuterLineRightTopLeft2, event )
					local OuterLineRightTopLeft2Frame3 = function ( OuterLineRightTopLeft2, event )
						local OuterLineRightTopLeft2Frame4 = function ( OuterLineRightTopLeft2, event )
							local OuterLineRightTopLeft2Frame5 = function ( OuterLineRightTopLeft2, event )
								if not event.interrupted then
									OuterLineRightTopLeft2:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								end
								OuterLineRightTopLeft2:setLeftRight( false, false, -11, 1 )
								OuterLineRightTopLeft2:setTopBottom( false, false, -32, -25 )
								OuterLineRightTopLeft2:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( OuterLineRightTopLeft2, event )
								else
									OuterLineRightTopLeft2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								OuterLineRightTopLeft2Frame5( OuterLineRightTopLeft2, event )
								return 
							else
								OuterLineRightTopLeft2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								OuterLineRightTopLeft2:setTopBottom( false, false, -32, -25 )
								OuterLineRightTopLeft2:registerEventHandler( "transition_complete_keyframe", OuterLineRightTopLeft2Frame5 )
							end
						end
						
						if event.interrupted then
							OuterLineRightTopLeft2Frame4( OuterLineRightTopLeft2, event )
							return 
						else
							OuterLineRightTopLeft2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							OuterLineRightTopLeft2:setTopBottom( false, false, -26.17, -25 )
							OuterLineRightTopLeft2:setAlpha( 1 )
							OuterLineRightTopLeft2:registerEventHandler( "transition_complete_keyframe", OuterLineRightTopLeft2Frame4 )
						end
					end
					
					if event.interrupted then
						OuterLineRightTopLeft2Frame3( OuterLineRightTopLeft2, event )
						return 
					else
						OuterLineRightTopLeft2:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						OuterLineRightTopLeft2:setTopBottom( false, false, -25, -25 )
						OuterLineRightTopLeft2:registerEventHandler( "transition_complete_keyframe", OuterLineRightTopLeft2Frame3 )
					end
				end
				
				OuterLineRightTopLeft2:completeAnimation()
				self.OuterLineRightTopLeft2:setLeftRight( false, false, -11, 1 )
				self.OuterLineRightTopLeft2:setTopBottom( false, false, -32, -25 )
				self.OuterLineRightTopLeft2:setAlpha( 0 )
				OuterLineRightTopLeft2Frame2( OuterLineRightTopLeft2, {} )
				local f3_local8 = function ( f28_arg0, f28_arg1 )
					local f28_local0 = function ( f29_arg0, f29_arg1 )
						if not f29_arg1.interrupted then
							f29_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						f29_arg0:setLeftRight( false, false, 11, 23 )
						f29_arg0:setTopBottom( false, false, -3, 33 )
						f29_arg0:setAlpha( 1 )
						if f29_arg1.interrupted then
							self.clipFinished( f29_arg0, f29_arg1 )
						else
							f29_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f28_arg1.interrupted then
						f28_local0( f28_arg0, f28_arg1 )
						return 
					else
						f28_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f28_arg0:setAlpha( 1 )
						f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
					end
				end
				
				OuterLineAngleCenter1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				OuterLineAngleCenter1:setLeftRight( false, false, 22, 34 )
				OuterLineAngleCenter1:setTopBottom( false, false, 3.75, 5.75 )
				OuterLineAngleCenter1:setAlpha( 0 )
				OuterLineAngleCenter1:registerEventHandler( "transition_complete_keyframe", f3_local8 )
				local OuterLineRightTop1Frame2 = function ( OuterLineRightTop1, event )
					local OuterLineRightTop1Frame3 = function ( OuterLineRightTop1, event )
						local OuterLineRightTop1Frame4 = function ( OuterLineRightTop1, event )
							local OuterLineRightTop1Frame5 = function ( OuterLineRightTop1, event )
								if not event.interrupted then
									OuterLineRightTop1:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								end
								OuterLineRightTop1:setLeftRight( false, false, 0, 12 )
								OuterLineRightTop1:setTopBottom( false, false, 25, 32 )
								OuterLineRightTop1:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( OuterLineRightTop1, event )
								else
									OuterLineRightTop1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								OuterLineRightTop1Frame5( OuterLineRightTop1, event )
								return 
							else
								OuterLineRightTop1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								OuterLineRightTop1:setTopBottom( false, false, 25, 32 )
								OuterLineRightTop1:registerEventHandler( "transition_complete_keyframe", OuterLineRightTop1Frame5 )
							end
						end
						
						if event.interrupted then
							OuterLineRightTop1Frame4( OuterLineRightTop1, event )
							return 
						else
							OuterLineRightTop1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							OuterLineRightTop1:setAlpha( 1 )
							OuterLineRightTop1:registerEventHandler( "transition_complete_keyframe", OuterLineRightTop1Frame4 )
						end
					end
					
					if event.interrupted then
						OuterLineRightTop1Frame3( OuterLineRightTop1, event )
						return 
					else
						OuterLineRightTop1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						OuterLineRightTop1:registerEventHandler( "transition_complete_keyframe", OuterLineRightTop1Frame3 )
					end
				end
				
				OuterLineRightTop1:completeAnimation()
				self.OuterLineRightTop1:setLeftRight( false, false, 0, 12 )
				self.OuterLineRightTop1:setTopBottom( false, false, 25, 26 )
				self.OuterLineRightTop1:setAlpha( 0 )
				OuterLineRightTop1Frame2( OuterLineRightTop1, {} )
				local f3_local10 = function ( f34_arg0, f34_arg1 )
					local f34_local0 = function ( f35_arg0, f35_arg1 )
						if not f35_arg1.interrupted then
							f35_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						f35_arg0:setLeftRight( false, false, -22, -10 )
						f35_arg0:setTopBottom( false, false, -3, 33 )
						f35_arg0:setAlpha( 1 )
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
						f34_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f34_arg0:setAlpha( 1 )
						f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
					end
				end
				
				OuterLineAngleCenterLL:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				OuterLineAngleCenterLL:setLeftRight( false, false, -33, -21 )
				OuterLineAngleCenterLL:setTopBottom( false, false, 3.88, 4.13 )
				OuterLineAngleCenterLL:setAlpha( 0 )
				OuterLineAngleCenterLL:registerEventHandler( "transition_complete_keyframe", f3_local10 )
				local OuterLineLeft2Frame2 = function ( OuterLineLeft2, event )
					local OuterLineLeft2Frame3 = function ( OuterLineLeft2, event )
						local OuterLineLeft2Frame4 = function ( OuterLineLeft2, event )
							local OuterLineLeft2Frame5 = function ( OuterLineLeft2, event )
								if not event.interrupted then
									OuterLineLeft2:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								end
								OuterLineLeft2:setLeftRight( false, false, -11, 1 )
								OuterLineLeft2:setTopBottom( false, false, 25, 32 )
								OuterLineLeft2:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( OuterLineLeft2, event )
								else
									OuterLineLeft2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								OuterLineLeft2Frame5( OuterLineLeft2, event )
								return 
							else
								OuterLineLeft2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								OuterLineLeft2:setTopBottom( false, false, 25, 32 )
								OuterLineLeft2:registerEventHandler( "transition_complete_keyframe", OuterLineLeft2Frame5 )
							end
						end
						
						if event.interrupted then
							OuterLineLeft2Frame4( OuterLineLeft2, event )
							return 
						else
							OuterLineLeft2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							OuterLineLeft2:setTopBottom( false, false, 25, 25.5 )
							OuterLineLeft2:setAlpha( 1 )
							OuterLineLeft2:registerEventHandler( "transition_complete_keyframe", OuterLineLeft2Frame4 )
						end
					end
					
					if event.interrupted then
						OuterLineLeft2Frame3( OuterLineLeft2, event )
						return 
					else
						OuterLineLeft2:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						OuterLineLeft2:setTopBottom( false, false, 25, 25.75 )
						OuterLineLeft2:registerEventHandler( "transition_complete_keyframe", OuterLineLeft2Frame3 )
					end
				end
				
				OuterLineLeft2:completeAnimation()
				self.OuterLineLeft2:setLeftRight( false, false, -11, 1 )
				self.OuterLineLeft2:setTopBottom( false, false, 25, 32 )
				self.OuterLineLeft2:setAlpha( 0 )
				OuterLineLeft2Frame2( OuterLineLeft2, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							if not event.interrupted then
								Image0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							end
							Image0:setLeftRight( false, false, 27, 33 )
							Image0:setTopBottom( false, false, 0.5, 9 )
							Image0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image0, event )
							else
								Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Image0:setLeftRight( false, false, 27, 33 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, 33, 33 )
				self.Image0:setTopBottom( false, false, 0.5, 9 )
				self.Image0:setAlpha( 1 )
				Image0Frame2( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						local Image1Frame4 = function ( Image1, event )
							if not event.interrupted then
								Image1:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							end
							Image1:setLeftRight( false, false, 27, 33 )
							Image1:setTopBottom( false, false, -8.5, 0 )
							Image1:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image1, event )
							else
								Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image1Frame4( Image1, event )
							return 
						else
							Image1:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame4 )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Image1:setLeftRight( false, false, 27, 33 )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setLeftRight( false, false, 33, 33 )
				self.Image1:setTopBottom( false, false, -8.5, 0 )
				self.Image1:setAlpha( 1 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						local Image2Frame4 = function ( Image2, event )
							if not event.interrupted then
								Image2:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							end
							Image2:setLeftRight( false, false, -32, -26 )
							Image2:setTopBottom( false, false, 0.25, 8.75 )
							Image2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image2, event )
							else
								Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image2Frame4( Image2, event )
							return 
						else
							Image2:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame4 )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Image2:setLeftRight( false, false, -32, -26 )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setLeftRight( false, false, -32, -32 )
				self.Image2:setTopBottom( false, false, 0.25, 8.75 )
				self.Image2:setAlpha( 1 )
				Image2Frame2( Image2, {} )
				local Image3Frame2 = function ( Image3, event )
					local Image3Frame3 = function ( Image3, event )
						local Image3Frame4 = function ( Image3, event )
							if not event.interrupted then
								Image3:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							end
							Image3:setLeftRight( false, false, -32, -26 )
							Image3:setTopBottom( false, false, -8.5, 0 )
							Image3:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image3, event )
							else
								Image3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image3Frame4( Image3, event )
							return 
						else
							Image3:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame4 )
						end
					end
					
					if event.interrupted then
						Image3Frame3( Image3, event )
						return 
					else
						Image3:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Image3:setLeftRight( false, false, -32, -26 )
						Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame3 )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setLeftRight( false, false, -32, -32 )
				self.Image3:setTopBottom( false, false, -8.5, 0 )
				self.Image3:setAlpha( 1 )
				Image3Frame2( Image3, {} )
			end
		},
		Fire = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				centerDot:completeAnimation()
				self.centerDot:setLeftRight( false, false, -6, 6 )
				self.centerDot:setTopBottom( false, false, -6, 6 )
				self.centerDot:setAlpha( 0.7 )
				self.clipFinished( centerDot, {} )
				ReticleLineBottom:completeAnimation()
				self.ReticleLineBottom:setLeftRight( false, false, -6, 6 )
				self.ReticleLineBottom:setTopBottom( false, false, 25, 73 )
				self.ReticleLineBottom:setAlpha( 0.8 )
				self.clipFinished( ReticleLineBottom, {} )
				ReticleLineTop:completeAnimation()
				self.ReticleLineTop:setLeftRight( false, false, -6, 6 )
				self.ReticleLineTop:setTopBottom( false, false, -72, -25 )
				self.ReticleLineTop:setAlpha( 0.8 )
				self.clipFinished( ReticleLineTop, {} )
				ReticleLineRight:completeAnimation()
				self.ReticleLineRight:setLeftRight( false, false, 30, 68 )
				self.ReticleLineRight:setTopBottom( false, false, -7, 7 )
				self.ReticleLineRight:setAlpha( 0.8 )
				self.clipFinished( ReticleLineRight, {} )
				ReticleLineLeft:completeAnimation()
				self.ReticleLineLeft:setLeftRight( false, false, -67, -29 )
				self.ReticleLineLeft:setTopBottom( false, false, -7, 7 )
				self.ReticleLineLeft:setAlpha( 0.8 )
				self.clipFinished( ReticleLineLeft, {} )
				OuterLineAngleCenter:completeAnimation()
				self.OuterLineAngleCenter:setLeftRight( false, false, 11, 23 )
				self.OuterLineAngleCenter:setTopBottom( false, false, -33.5, 2.5 )
				self.OuterLineAngleCenter:setAlpha( 1 )
				self.clipFinished( OuterLineAngleCenter, {} )
				OuterLineAngleCenter0:completeAnimation()
				self.OuterLineAngleCenter0:setLeftRight( false, false, -22, -10 )
				self.OuterLineAngleCenter0:setTopBottom( false, false, -33.5, 2.5 )
				self.OuterLineAngleCenter0:setAlpha( 1 )
				self.clipFinished( OuterLineAngleCenter0, {} )
				OuterLineAngleCenter1:completeAnimation()
				self.OuterLineAngleCenter1:setLeftRight( false, false, 11, 23 )
				self.OuterLineAngleCenter1:setTopBottom( false, false, -3, 33 )
				self.OuterLineAngleCenter1:setAlpha( 1 )
				self.clipFinished( OuterLineAngleCenter1, {} )
				OuterLineAngleCenterLL:completeAnimation()
				self.OuterLineAngleCenterLL:setLeftRight( false, false, -22, -10 )
				self.OuterLineAngleCenterLL:setTopBottom( false, false, -3, 33 )
				self.OuterLineAngleCenterLL:setAlpha( 1 )
				self.clipFinished( OuterLineAngleCenterLL, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 9 )
				centerDot:completeAnimation()
				self.centerDot:setLeftRight( false, false, -6, 6 )
				self.centerDot:setTopBottom( false, false, -6, 6 )
				self.centerDot:setAlpha( 0.7 )
				self.clipFinished( centerDot, {} )
				local ReticleLineBottomFrame2 = function ( ReticleLineBottom, event )
					if not event.interrupted then
						ReticleLineBottom:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					ReticleLineBottom:setLeftRight( false, false, -6, 6 )
					ReticleLineBottom:setTopBottom( false, false, -8, 40 )
					ReticleLineBottom:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( ReticleLineBottom, event )
					else
						ReticleLineBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLineBottom:completeAnimation()
				self.ReticleLineBottom:setLeftRight( false, false, -6, 6 )
				self.ReticleLineBottom:setTopBottom( false, false, 25, 73 )
				self.ReticleLineBottom:setAlpha( 0.8 )
				ReticleLineBottomFrame2( ReticleLineBottom, {} )
				local ReticleLineTopFrame2 = function ( ReticleLineTop, event )
					if not event.interrupted then
						ReticleLineTop:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					ReticleLineTop:setLeftRight( false, false, -6, 6 )
					ReticleLineTop:setTopBottom( false, false, -39, 8 )
					ReticleLineTop:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( ReticleLineTop, event )
					else
						ReticleLineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLineTop:completeAnimation()
				self.ReticleLineTop:setLeftRight( false, false, -6, 6 )
				self.ReticleLineTop:setTopBottom( false, false, -72, -25 )
				self.ReticleLineTop:setAlpha( 0.8 )
				ReticleLineTopFrame2( ReticleLineTop, {} )
				local ReticleLineRightFrame2 = function ( ReticleLineRight, event )
					if not event.interrupted then
						ReticleLineRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					ReticleLineRight:setLeftRight( false, false, -2, 36 )
					ReticleLineRight:setTopBottom( false, false, -7, 7 )
					ReticleLineRight:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( ReticleLineRight, event )
					else
						ReticleLineRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLineRight:completeAnimation()
				self.ReticleLineRight:setLeftRight( false, false, 30, 68 )
				self.ReticleLineRight:setTopBottom( false, false, -7, 7 )
				self.ReticleLineRight:setAlpha( 0.8 )
				ReticleLineRightFrame2( ReticleLineRight, {} )
				local ReticleLineLeftFrame2 = function ( ReticleLineLeft, event )
					if not event.interrupted then
						ReticleLineLeft:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					ReticleLineLeft:setLeftRight( false, false, -36, 2 )
					ReticleLineLeft:setTopBottom( false, false, -7, 7 )
					ReticleLineLeft:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( ReticleLineLeft, event )
					else
						ReticleLineLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLineLeft:completeAnimation()
				self.ReticleLineLeft:setLeftRight( false, false, -67, -29 )
				self.ReticleLineLeft:setTopBottom( false, false, -7, 7 )
				self.ReticleLineLeft:setAlpha( 0.8 )
				ReticleLineLeftFrame2( ReticleLineLeft, {} )
				local OuterLineAngleCenterFrame2 = function ( OuterLineAngleCenter, event )
					if not event.interrupted then
						OuterLineAngleCenter:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OuterLineAngleCenter:setLeftRight( false, false, 11, 23 )
					OuterLineAngleCenter:setTopBottom( false, false, -33.5, 2.5 )
					OuterLineAngleCenter:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( OuterLineAngleCenter, event )
					else
						OuterLineAngleCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OuterLineAngleCenter:completeAnimation()
				self.OuterLineAngleCenter:setLeftRight( false, false, 11, 23 )
				self.OuterLineAngleCenter:setTopBottom( false, false, -33.5, 2.5 )
				self.OuterLineAngleCenter:setAlpha( 1 )
				OuterLineAngleCenterFrame2( OuterLineAngleCenter, {} )
				local OuterLineAngleCenter0Frame2 = function ( OuterLineAngleCenter0, event )
					if not event.interrupted then
						OuterLineAngleCenter0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OuterLineAngleCenter0:setLeftRight( false, false, -22, -10 )
					OuterLineAngleCenter0:setTopBottom( false, false, -33.5, 2.5 )
					OuterLineAngleCenter0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( OuterLineAngleCenter0, event )
					else
						OuterLineAngleCenter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OuterLineAngleCenter0:completeAnimation()
				self.OuterLineAngleCenter0:setLeftRight( false, false, -22, -10 )
				self.OuterLineAngleCenter0:setTopBottom( false, false, -33.5, 2.5 )
				self.OuterLineAngleCenter0:setAlpha( 1 )
				OuterLineAngleCenter0Frame2( OuterLineAngleCenter0, {} )
				local OuterLineAngleCenter1Frame2 = function ( OuterLineAngleCenter1, event )
					if not event.interrupted then
						OuterLineAngleCenter1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OuterLineAngleCenter1:setLeftRight( false, false, 11, 23 )
					OuterLineAngleCenter1:setTopBottom( false, false, -3, 33 )
					OuterLineAngleCenter1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( OuterLineAngleCenter1, event )
					else
						OuterLineAngleCenter1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OuterLineAngleCenter1:completeAnimation()
				self.OuterLineAngleCenter1:setLeftRight( false, false, 11, 23 )
				self.OuterLineAngleCenter1:setTopBottom( false, false, -3, 33 )
				self.OuterLineAngleCenter1:setAlpha( 1 )
				OuterLineAngleCenter1Frame2( OuterLineAngleCenter1, {} )
				local OuterLineAngleCenterLLFrame2 = function ( OuterLineAngleCenterLL, event )
					if not event.interrupted then
						OuterLineAngleCenterLL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OuterLineAngleCenterLL:setLeftRight( false, false, -22, -10 )
					OuterLineAngleCenterLL:setTopBottom( false, false, -3, 33 )
					OuterLineAngleCenterLL:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( OuterLineAngleCenterLL, event )
					else
						OuterLineAngleCenterLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OuterLineAngleCenterLL:completeAnimation()
				self.OuterLineAngleCenterLL:setLeftRight( false, false, -22, -10 )
				self.OuterLineAngleCenterLL:setTopBottom( false, false, -3, 33 )
				self.OuterLineAngleCenterLL:setAlpha( 1 )
				OuterLineAngleCenterLLFrame2( OuterLineAngleCenterLL, {} )
			end
		}
	}
	self:subscribeToGlobalModel( controller, "PerController", "currentWeapon.weaponDelayFiring", function ( model )
		local f62_local0 = self
		if IsModelValueEqualToEnum( controller, "currentWeapon.weaponDelayFiring", Enum.WeaponFireEvent.WEAPON_EVENT_FIRING ) then
			SetState( self, "DefaultState" )
			PlayClip( self, "Fire", controller )
		elseif IsModelValueEqualToEnum( controller, "currentWeapon.weaponDelayFiring", Enum.WeaponFireEvent.WEAPON_EVENT_FIRED ) then
			SetState( self, "Fire" )
			PlayClip( self, "DefaultState", controller )
		end
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

