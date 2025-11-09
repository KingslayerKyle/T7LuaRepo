require( "ui.uieditor.widgets.CPSystems.EnemyTarget.EnemyTarget_Target" )
require( "ui.uieditor.widgets.CPSystems.EnemyTarget.EnemyTarget_ArrowAnim" )

CoD.EnemyTargetInternal = InheritFrom( LUI.UIElement )
CoD.EnemyTargetInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EnemyTargetInternal )
	self.id = "EnemyTargetInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 352 )
	self.anyChildUsesUpdateState = true
	
	local LockBlur = LUI.UIImage.new()
	LockBlur:setLeftRight( false, false, -100, 100 )
	LockBlur:setTopBottom( false, false, -100, 100 )
	LockBlur:setRGB( 0.45, 0, 0 )
	LockBlur:setZoom( 40 )
	LockBlur:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_lockblur" ) )
	LockBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LockBlur )
	self.LockBlur = LockBlur
	
	local LockGlow = LUI.UIImage.new()
	LockGlow:setLeftRight( false, false, -128, 128 )
	LockGlow:setTopBottom( false, false, -172, 172 )
	LockGlow:setRGB( 0.43, 0.43, 0.43 )
	LockGlow:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	LockGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LockGlow )
	self.LockGlow = LockGlow
	
	local LockLineRedLR = LUI.UIImage.new()
	LockLineRedLR:setLeftRight( false, false, 32, 68 )
	LockLineRedLR:setTopBottom( false, false, 53, 89 )
	LockLineRedLR:setRGB( 1, 1, 1 )
	LockLineRedLR:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_lockredline" ) )
	LockLineRedLR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LockLineRedLR )
	self.LockLineRedLR = LockLineRedLR
	
	local LockLineRedLL = LUI.UIImage.new()
	LockLineRedLL:setLeftRight( false, false, -67, -31 )
	LockLineRedLL:setTopBottom( false, false, 53, 89 )
	LockLineRedLL:setRGB( 1, 1, 1 )
	LockLineRedLL:setYRot( -180 )
	LockLineRedLL:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_lockredline" ) )
	LockLineRedLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LockLineRedLL )
	self.LockLineRedLL = LockLineRedLL
	
	local LockLineRedUR = LUI.UIImage.new()
	LockLineRedUR:setLeftRight( false, false, 32, 68 )
	LockLineRedUR:setTopBottom( false, false, -85, -49 )
	LockLineRedUR:setRGB( 1, 1, 1 )
	LockLineRedUR:setXRot( -180 )
	LockLineRedUR:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_lockredline" ) )
	LockLineRedUR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LockLineRedUR )
	self.LockLineRedUR = LockLineRedUR
	
	local LockLineRedUL = LUI.UIImage.new()
	LockLineRedUL:setLeftRight( false, false, -67, -31 )
	LockLineRedUL:setTopBottom( false, false, -85, -49 )
	LockLineRedUL:setRGB( 1, 1, 1 )
	LockLineRedUL:setXRot( -180 )
	LockLineRedUL:setYRot( -180 )
	LockLineRedUL:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_lockredline" ) )
	LockLineRedUL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LockLineRedUL )
	self.LockLineRedUL = LockLineRedUL
	
	local LockTarget = LUI.UIImage.new()
	LockTarget:setLeftRight( false, false, -50, 50 )
	LockTarget:setTopBottom( false, false, -92, 92 )
	LockTarget:setRGB( 0.58, 0, 0 )
	LockTarget:setZoom( -58 )
	LockTarget:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_locktarget" ) )
	LockTarget:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LockTarget )
	self.LockTarget = LockTarget
	
	local Target = CoD.EnemyTarget_Target.new( menu, controller )
	Target:setLeftRight( false, false, -68, 68 )
	Target:setTopBottom( false, false, -56, 56 )
	Target:setRGB( 1, 1, 1 )
	Target:setZRot( -90 )
	self:addElement( Target )
	self.Target = Target
	
	local TargetArrowL = LUI.UIImage.new()
	TargetArrowL:setLeftRight( false, false, -16, 16 )
	TargetArrowL:setTopBottom( false, false, 92, 124 )
	TargetArrowL:setRGB( 1, 1, 1 )
	TargetArrowL:setAlpha( 0 )
	TargetArrowL:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_targetarrowssmall" ) )
	TargetArrowL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TargetArrowL )
	self.TargetArrowL = TargetArrowL
	
	local TargetArrowU = LUI.UIImage.new()
	TargetArrowU:setLeftRight( false, false, -16, 16 )
	TargetArrowU:setTopBottom( false, false, -124, -92 )
	TargetArrowU:setRGB( 1, 1, 1 )
	TargetArrowU:setAlpha( 0 )
	TargetArrowU:setXRot( -180 )
	TargetArrowU:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_targetarrowssmall" ) )
	TargetArrowU:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TargetArrowU )
	self.TargetArrowU = TargetArrowU
	
	local TargetLineR = LUI.UIImage.new()
	TargetLineR:setLeftRight( false, false, -12, 12 )
	TargetLineR:setTopBottom( false, false, 33, 41 )
	TargetLineR:setRGB( 1, 1, 1 )
	TargetLineR:setZRot( -90 )
	TargetLineR:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_targetline" ) )
	TargetLineR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TargetLineR )
	self.TargetLineR = TargetLineR
	
	local TargetLineL = LUI.UIImage.new()
	TargetLineL:setLeftRight( false, false, -12, 12 )
	TargetLineL:setTopBottom( false, false, -40, -32 )
	TargetLineL:setRGB( 1, 1, 1 )
	TargetLineL:setYRot( -180 )
	TargetLineL:setZRot( 90 )
	TargetLineL:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_targetline" ) )
	TargetLineL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TargetLineL )
	self.TargetLineL = TargetLineL
	
	local EnemyTargetArrowAnim0 = CoD.EnemyTarget_ArrowAnim.new( menu, controller )
	EnemyTargetArrowAnim0:setLeftRight( false, false, 8, 68 )
	EnemyTargetArrowAnim0:setTopBottom( false, false, -25, 25 )
	EnemyTargetArrowAnim0:setRGB( 1, 1, 1 )
	EnemyTargetArrowAnim0:setZRot( -90 )
	EnemyTargetArrowAnim0:setZoom( 4 )
	EnemyTargetArrowAnim0:mergeStateConditions( {
		{
			stateName = "Null",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( EnemyTargetArrowAnim0 )
	self.EnemyTargetArrowAnim0 = EnemyTargetArrowAnim0
	
	local EnemyTargetArrowAnim1 = CoD.EnemyTarget_ArrowAnim.new( menu, controller )
	EnemyTargetArrowAnim1:setLeftRight( false, false, -68, -8 )
	EnemyTargetArrowAnim1:setTopBottom( false, false, -25, 25 )
	EnemyTargetArrowAnim1:setRGB( 1, 1, 1 )
	EnemyTargetArrowAnim1:setZRot( 90 )
	EnemyTargetArrowAnim1:setZoom( 4 )
	EnemyTargetArrowAnim1:mergeStateConditions( {
		{
			stateName = "Null",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( EnemyTargetArrowAnim1 )
	self.EnemyTargetArrowAnim1 = EnemyTargetArrowAnim1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				LockBlur:completeAnimation()
				self.LockBlur:setLeftRight( false, false, -100, 100 )
				self.LockBlur:setTopBottom( false, false, -100, 100 )
				self.LockBlur:setAlpha( 0 )
				self.clipFinished( LockBlur, {} )
				LockGlow:completeAnimation()
				self.LockGlow:setAlpha( 0 )
				self.clipFinished( LockGlow, {} )
				LockLineRedLR:completeAnimation()
				self.LockLineRedLR:setLeftRight( false, false, 10, 46 )
				self.LockLineRedLR:setTopBottom( false, false, 26, 62 )
				self.LockLineRedLR:setAlpha( 0 )
				self.clipFinished( LockLineRedLR, {} )
				LockLineRedLL:completeAnimation()
				self.LockLineRedLL:setLeftRight( false, false, -44, -8 )
				self.LockLineRedLL:setTopBottom( false, false, 26, 62 )
				self.LockLineRedLL:setAlpha( 0 )
				self.clipFinished( LockLineRedLL, {} )
				LockLineRedUR:completeAnimation()
				self.LockLineRedUR:setLeftRight( false, false, 10, 46 )
				self.LockLineRedUR:setTopBottom( false, false, -63, -27 )
				self.LockLineRedUR:setAlpha( 0 )
				self.clipFinished( LockLineRedUR, {} )
				LockLineRedUL:completeAnimation()
				self.LockLineRedUL:setLeftRight( false, false, -46, -10 )
				self.LockLineRedUL:setTopBottom( false, false, -63, -27 )
				self.LockLineRedUL:setAlpha( 0 )
				self.clipFinished( LockLineRedUL, {} )
				LockTarget:completeAnimation()
				self.LockTarget:setLeftRight( false, false, -50, 50 )
				self.LockTarget:setTopBottom( false, false, -92, 92 )
				self.LockTarget:setAlpha( 0 )
				self.clipFinished( LockTarget, {} )
				Target:completeAnimation()
				self.Target:setAlpha( 0 )
				self.Target:setZRot( 0 )
				self.clipFinished( Target, {} )
				TargetArrowL:completeAnimation()
				self.TargetArrowL:setLeftRight( false, false, -16, 16 )
				self.TargetArrowL:setTopBottom( false, false, 10, 42 )
				self.TargetArrowL:setAlpha( 0 )
				self.TargetArrowL:setZRot( 0 )
				self.clipFinished( TargetArrowL, {} )
				TargetArrowU:completeAnimation()
				self.TargetArrowU:setLeftRight( false, false, -16, 16 )
				self.TargetArrowU:setTopBottom( false, false, -43, -11 )
				self.TargetArrowU:setAlpha( 0 )
				self.clipFinished( TargetArrowU, {} )
				TargetLineR:completeAnimation()
				self.TargetLineR:setLeftRight( false, false, 101, 125 )
				self.TargetLineR:setTopBottom( false, false, -4, 4 )
				self.TargetLineR:setAlpha( 0 )
				self.TargetLineR:setZRot( 0 )
				self.clipFinished( TargetLineR, {} )
				TargetLineL:completeAnimation()
				self.TargetLineL:setLeftRight( false, false, -128, -104 )
				self.TargetLineL:setTopBottom( false, false, -4, 4 )
				self.TargetLineL:setAlpha( 0 )
				self.TargetLineL:setZRot( 0 )
				self.clipFinished( TargetLineL, {} )
				EnemyTargetArrowAnim0:completeAnimation()
				self.EnemyTargetArrowAnim0:setAlpha( 0 )
				self.clipFinished( EnemyTargetArrowAnim0, {} )
				EnemyTargetArrowAnim1:completeAnimation()
				self.EnemyTargetArrowAnim1:setAlpha( 0 )
				self.clipFinished( EnemyTargetArrowAnim1, {} )
			end,
			Target = function ()
				self:setupElementClipCounter( 14 )
				LockBlur:completeAnimation()
				self.LockBlur:setLeftRight( false, false, -100, 100 )
				self.LockBlur:setTopBottom( false, false, -100, 100 )
				self.LockBlur:setAlpha( 0 )
				self.clipFinished( LockBlur, {} )
				LockGlow:completeAnimation()
				self.LockGlow:setAlpha( 0 )
				self.clipFinished( LockGlow, {} )
				LockLineRedLR:completeAnimation()
				self.LockLineRedLR:setLeftRight( false, false, 10, 46 )
				self.LockLineRedLR:setTopBottom( false, false, 26, 62 )
				self.LockLineRedLR:setAlpha( 0 )
				self.clipFinished( LockLineRedLR, {} )
				LockLineRedLL:completeAnimation()
				self.LockLineRedLL:setLeftRight( false, false, -44, -8 )
				self.LockLineRedLL:setTopBottom( false, false, 26, 62 )
				self.LockLineRedLL:setAlpha( 0 )
				self.clipFinished( LockLineRedLL, {} )
				LockLineRedUR:completeAnimation()
				self.LockLineRedUR:setLeftRight( false, false, 10, 46 )
				self.LockLineRedUR:setTopBottom( false, false, -63, -27 )
				self.LockLineRedUR:setAlpha( 0 )
				self.clipFinished( LockLineRedUR, {} )
				LockLineRedUL:completeAnimation()
				self.LockLineRedUL:setLeftRight( false, false, -46, -10 )
				self.LockLineRedUL:setTopBottom( false, false, -63, -27 )
				self.LockLineRedUL:setAlpha( 0 )
				self.clipFinished( LockLineRedUL, {} )
				LockTarget:completeAnimation()
				self.LockTarget:setLeftRight( false, false, -50, 50 )
				self.LockTarget:setTopBottom( false, false, -92, 92 )
				self.LockTarget:setAlpha( 0 )
				self.clipFinished( LockTarget, {} )
				local TargetFrame2 = function ( Target, event )
					local TargetFrame3 = function ( Target, event )
						local TargetFrame4 = function ( Target, event )
							local TargetFrame5 = function ( Target, event )
								local TargetFrame6 = function ( Target, event )
									if not event.interrupted then
										Target:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
									end
									Target:setAlpha( 1 )
									Target:setZRot( 0 )
									if event.interrupted then
										self.clipFinished( Target, event )
									else
										Target:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									TargetFrame6( Target, event )
									return 
								else
									Target:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Bounce )
									Target:setAlpha( 0.58 )
									Target:registerEventHandler( "transition_complete_keyframe", TargetFrame6 )
								end
							end
							
							if event.interrupted then
								TargetFrame5( Target, event )
								return 
							else
								Target:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Bounce )
								Target:setAlpha( 1 )
								Target:registerEventHandler( "transition_complete_keyframe", TargetFrame5 )
							end
						end
						
						if event.interrupted then
							TargetFrame4( Target, event )
							return 
						else
							Target:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
							Target:setAlpha( 0 )
							Target:registerEventHandler( "transition_complete_keyframe", TargetFrame4 )
						end
					end
					
					if event.interrupted then
						TargetFrame3( Target, event )
						return 
					else
						Target:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
						Target:setAlpha( 0.6 )
						Target:registerEventHandler( "transition_complete_keyframe", TargetFrame3 )
					end
				end
				
				Target:completeAnimation()
				self.Target:setAlpha( 0 )
				self.Target:setZRot( 0 )
				TargetFrame2( Target, {} )
				local TargetArrowLFrame2 = function ( TargetArrowL, event )
					local TargetArrowLFrame3 = function ( TargetArrowL, event )
						local TargetArrowLFrame4 = function ( TargetArrowL, event )
							if not event.interrupted then
								TargetArrowL:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
							end
							TargetArrowL:setLeftRight( false, false, -16, 16 )
							TargetArrowL:setTopBottom( false, false, 61, 93 )
							TargetArrowL:setAlpha( 1 )
							TargetArrowL:setZRot( 0 )
							if event.interrupted then
								self.clipFinished( TargetArrowL, event )
							else
								TargetArrowL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TargetArrowLFrame4( TargetArrowL, event )
							return 
						else
							TargetArrowL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							TargetArrowL:setAlpha( 0 )
							TargetArrowL:registerEventHandler( "transition_complete_keyframe", TargetArrowLFrame4 )
						end
					end
					
					if event.interrupted then
						TargetArrowLFrame3( TargetArrowL, event )
						return 
					else
						TargetArrowL:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						TargetArrowL:setTopBottom( false, false, 61, 93 )
						TargetArrowL:setAlpha( 1 )
						TargetArrowL:registerEventHandler( "transition_complete_keyframe", TargetArrowLFrame3 )
					end
				end
				
				TargetArrowL:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
				TargetArrowL:setLeftRight( false, false, -16, 16 )
				TargetArrowL:setTopBottom( false, false, 10, 42 )
				TargetArrowL:setAlpha( 0 )
				TargetArrowL:setZRot( 0 )
				TargetArrowL:registerEventHandler( "transition_complete_keyframe", TargetArrowLFrame2 )
				local TargetArrowUFrame2 = function ( TargetArrowU, event )
					local TargetArrowUFrame3 = function ( TargetArrowU, event )
						local TargetArrowUFrame4 = function ( TargetArrowU, event )
							if not event.interrupted then
								TargetArrowU:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
							end
							TargetArrowU:setLeftRight( false, false, -16, 16 )
							TargetArrowU:setTopBottom( false, false, -97, -65 )
							TargetArrowU:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( TargetArrowU, event )
							else
								TargetArrowU:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TargetArrowUFrame4( TargetArrowU, event )
							return 
						else
							TargetArrowU:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							TargetArrowU:setAlpha( 0 )
							TargetArrowU:registerEventHandler( "transition_complete_keyframe", TargetArrowUFrame4 )
						end
					end
					
					if event.interrupted then
						TargetArrowUFrame3( TargetArrowU, event )
						return 
					else
						TargetArrowU:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						TargetArrowU:setTopBottom( false, false, -97, -65 )
						TargetArrowU:setAlpha( 1 )
						TargetArrowU:registerEventHandler( "transition_complete_keyframe", TargetArrowUFrame3 )
					end
				end
				
				TargetArrowU:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
				TargetArrowU:setLeftRight( false, false, -16, 16 )
				TargetArrowU:setTopBottom( false, false, -43, -11 )
				TargetArrowU:setAlpha( 0 )
				TargetArrowU:registerEventHandler( "transition_complete_keyframe", TargetArrowUFrame2 )
				local TargetLineRFrame2 = function ( TargetLineR, event )
					if not event.interrupted then
						TargetLineR:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
					end
					TargetLineR:setLeftRight( false, false, 61, 85 )
					TargetLineR:setTopBottom( false, false, -4, 4 )
					TargetLineR:setAlpha( 1 )
					TargetLineR:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( TargetLineR, event )
					else
						TargetLineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TargetLineR:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				TargetLineR:setLeftRight( false, false, 101, 125 )
				TargetLineR:setTopBottom( false, false, -4, 4 )
				TargetLineR:setAlpha( 0 )
				TargetLineR:setZRot( 0 )
				TargetLineR:registerEventHandler( "transition_complete_keyframe", TargetLineRFrame2 )
				local TargetLineLFrame2 = function ( TargetLineL, event )
					if not event.interrupted then
						TargetLineL:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
					end
					TargetLineL:setLeftRight( false, false, -83, -59 )
					TargetLineL:setTopBottom( false, false, -4, 4 )
					TargetLineL:setAlpha( 1 )
					TargetLineL:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( TargetLineL, event )
					else
						TargetLineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TargetLineL:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				TargetLineL:setLeftRight( false, false, -128, -104 )
				TargetLineL:setTopBottom( false, false, -4, 4 )
				TargetLineL:setAlpha( 0 )
				TargetLineL:setZRot( 0 )
				TargetLineL:registerEventHandler( "transition_complete_keyframe", TargetLineLFrame2 )
				EnemyTargetArrowAnim0:completeAnimation()
				self.EnemyTargetArrowAnim0:setAlpha( 0 )
				self.clipFinished( EnemyTargetArrowAnim0, {} )
				EnemyTargetArrowAnim1:completeAnimation()
				self.EnemyTargetArrowAnim1:setAlpha( 0 )
				self.clipFinished( EnemyTargetArrowAnim1, {} )
			end,
			Lock = function ()
				self:setupElementClipCounter( 14 )
				local LockBlurFrame2 = function ( LockBlur, event )
					if not event.interrupted then
						LockBlur:beginAnimation( "keyframe", 669, false, true, CoD.TweenType.Linear )
					end
					LockBlur:setLeftRight( false, false, -100, 100 )
					LockBlur:setTopBottom( false, false, -100, 100 )
					LockBlur:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LockBlur, event )
					else
						LockBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockBlur:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				LockBlur:setLeftRight( false, false, -100, 100 )
				LockBlur:setTopBottom( false, false, -100, 100 )
				LockBlur:setAlpha( 0 )
				LockBlur:registerEventHandler( "transition_complete_keyframe", LockBlurFrame2 )
				local LockGlowFrame2 = function ( LockGlow, event )
					if not event.interrupted then
						LockGlow:beginAnimation( "keyframe", 840, false, true, CoD.TweenType.Linear )
					end
					LockGlow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LockGlow, event )
					else
						LockGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockGlow:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				LockGlow:setAlpha( 0 )
				LockGlow:registerEventHandler( "transition_complete_keyframe", LockGlowFrame2 )
				local LockLineRedLRFrame2 = function ( LockLineRedLR, event )
					local LockLineRedLRFrame3 = function ( LockLineRedLR, event )
						local LockLineRedLRFrame4 = function ( LockLineRedLR, event )
							if not event.interrupted then
								LockLineRedLR:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							end
							LockLineRedLR:setLeftRight( false, false, 32, 68 )
							LockLineRedLR:setTopBottom( false, false, 53, 89 )
							LockLineRedLR:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( LockLineRedLR, event )
							else
								LockLineRedLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LockLineRedLRFrame4( LockLineRedLR, event )
							return 
						else
							LockLineRedLR:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
							LockLineRedLR:setAlpha( 0 )
							LockLineRedLR:registerEventHandler( "transition_complete_keyframe", LockLineRedLRFrame4 )
						end
					end
					
					if event.interrupted then
						LockLineRedLRFrame3( LockLineRedLR, event )
						return 
					else
						LockLineRedLR:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
						LockLineRedLR:setLeftRight( false, false, 32, 68 )
						LockLineRedLR:setTopBottom( false, false, 53, 89 )
						LockLineRedLR:setAlpha( 0.5 )
						LockLineRedLR:registerEventHandler( "transition_complete_keyframe", LockLineRedLRFrame3 )
					end
				end
				
				LockLineRedLR:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
				LockLineRedLR:setLeftRight( false, false, 50, 86 )
				LockLineRedLR:setTopBottom( false, false, 74, 110 )
				LockLineRedLR:setAlpha( 0 )
				LockLineRedLR:registerEventHandler( "transition_complete_keyframe", LockLineRedLRFrame2 )
				local LockLineRedLLFrame2 = function ( LockLineRedLL, event )
					local LockLineRedLLFrame3 = function ( LockLineRedLL, event )
						local LockLineRedLLFrame4 = function ( LockLineRedLL, event )
							if not event.interrupted then
								LockLineRedLL:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							end
							LockLineRedLL:setLeftRight( false, false, -67, -31 )
							LockLineRedLL:setTopBottom( false, false, 53, 89 )
							LockLineRedLL:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( LockLineRedLL, event )
							else
								LockLineRedLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LockLineRedLLFrame4( LockLineRedLL, event )
							return 
						else
							LockLineRedLL:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
							LockLineRedLL:setAlpha( 0 )
							LockLineRedLL:registerEventHandler( "transition_complete_keyframe", LockLineRedLLFrame4 )
						end
					end
					
					if event.interrupted then
						LockLineRedLLFrame3( LockLineRedLL, event )
						return 
					else
						LockLineRedLL:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
						LockLineRedLL:setLeftRight( false, false, -67, -31 )
						LockLineRedLL:setTopBottom( false, false, 53, 89 )
						LockLineRedLL:setAlpha( 0.5 )
						LockLineRedLL:registerEventHandler( "transition_complete_keyframe", LockLineRedLLFrame3 )
					end
				end
				
				LockLineRedLL:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
				LockLineRedLL:setLeftRight( false, false, -86, -50 )
				LockLineRedLL:setTopBottom( false, false, 74, 110 )
				LockLineRedLL:setAlpha( 0 )
				LockLineRedLL:registerEventHandler( "transition_complete_keyframe", LockLineRedLLFrame2 )
				local LockLineRedURFrame2 = function ( LockLineRedUR, event )
					local LockLineRedURFrame3 = function ( LockLineRedUR, event )
						local LockLineRedURFrame4 = function ( LockLineRedUR, event )
							if not event.interrupted then
								LockLineRedUR:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							end
							LockLineRedUR:setLeftRight( false, false, 32, 68 )
							LockLineRedUR:setTopBottom( false, false, -85, -49 )
							LockLineRedUR:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( LockLineRedUR, event )
							else
								LockLineRedUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LockLineRedURFrame4( LockLineRedUR, event )
							return 
						else
							LockLineRedUR:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
							LockLineRedUR:setAlpha( 0 )
							LockLineRedUR:registerEventHandler( "transition_complete_keyframe", LockLineRedURFrame4 )
						end
					end
					
					if event.interrupted then
						LockLineRedURFrame3( LockLineRedUR, event )
						return 
					else
						LockLineRedUR:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
						LockLineRedUR:setLeftRight( false, false, 32, 68 )
						LockLineRedUR:setTopBottom( false, false, -85, -49 )
						LockLineRedUR:setAlpha( 0.5 )
						LockLineRedUR:registerEventHandler( "transition_complete_keyframe", LockLineRedURFrame3 )
					end
				end
				
				LockLineRedUR:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
				LockLineRedUR:setLeftRight( false, false, 50, 86 )
				LockLineRedUR:setTopBottom( false, false, -105, -69 )
				LockLineRedUR:setAlpha( 0 )
				LockLineRedUR:registerEventHandler( "transition_complete_keyframe", LockLineRedURFrame2 )
				local LockLineRedULFrame2 = function ( LockLineRedUL, event )
					local LockLineRedULFrame3 = function ( LockLineRedUL, event )
						local LockLineRedULFrame4 = function ( LockLineRedUL, event )
							if not event.interrupted then
								LockLineRedUL:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							end
							LockLineRedUL:setLeftRight( false, false, -67, -31 )
							LockLineRedUL:setTopBottom( false, false, -85, -49 )
							LockLineRedUL:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( LockLineRedUL, event )
							else
								LockLineRedUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LockLineRedULFrame4( LockLineRedUL, event )
							return 
						else
							LockLineRedUL:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
							LockLineRedUL:setAlpha( 0 )
							LockLineRedUL:registerEventHandler( "transition_complete_keyframe", LockLineRedULFrame4 )
						end
					end
					
					if event.interrupted then
						LockLineRedULFrame3( LockLineRedUL, event )
						return 
					else
						LockLineRedUL:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
						LockLineRedUL:setLeftRight( false, false, -67, -31 )
						LockLineRedUL:setTopBottom( false, false, -85, -49 )
						LockLineRedUL:setAlpha( 0.5 )
						LockLineRedUL:registerEventHandler( "transition_complete_keyframe", LockLineRedULFrame3 )
					end
				end
				
				LockLineRedUL:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
				LockLineRedUL:setLeftRight( false, false, -88, -52 )
				LockLineRedUL:setTopBottom( false, false, -105, -69 )
				LockLineRedUL:setAlpha( 0 )
				LockLineRedUL:registerEventHandler( "transition_complete_keyframe", LockLineRedULFrame2 )
				local LockTargetFrame2 = function ( LockTarget, event )
					if not event.interrupted then
						LockTarget:beginAnimation( "keyframe", 360, false, true, CoD.TweenType.Linear )
					end
					LockTarget:setLeftRight( false, false, -50, 50 )
					LockTarget:setTopBottom( false, false, -92, 92 )
					LockTarget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LockTarget, event )
					else
						LockTarget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockTarget:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				LockTarget:setLeftRight( false, false, -50, 50 )
				LockTarget:setTopBottom( false, false, -92, 92 )
				LockTarget:setAlpha( 0 )
				LockTarget:registerEventHandler( "transition_complete_keyframe", LockTargetFrame2 )
				local TargetFrame2 = function ( Target, event )
					local TargetFrame3 = function ( Target, event )
						local TargetFrame4 = function ( Target, event )
							if not event.interrupted then
								Target:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							end
							Target:setAlpha( 1 )
							Target:setZRot( -90 )
							if event.interrupted then
								self.clipFinished( Target, event )
							else
								Target:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TargetFrame4( Target, event )
							return 
						else
							Target:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Bounce )
							Target:setAlpha( 0 )
							Target:registerEventHandler( "transition_complete_keyframe", TargetFrame4 )
						end
					end
					
					if event.interrupted then
						TargetFrame3( Target, event )
						return 
					else
						Target:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Back )
						Target:setAlpha( 0.55 )
						Target:registerEventHandler( "transition_complete_keyframe", TargetFrame3 )
					end
				end
				
				Target:completeAnimation()
				self.Target:setAlpha( 0 )
				self.Target:setZRot( -90 )
				TargetFrame2( Target, {} )
				local TargetArrowLFrame2 = function ( TargetArrowL, event )
					if not event.interrupted then
						TargetArrowL:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					TargetArrowL:setLeftRight( false, false, -16, 16 )
					TargetArrowL:setTopBottom( false, false, 92, 124 )
					TargetArrowL:setAlpha( 0 )
					TargetArrowL:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( TargetArrowL, event )
					else
						TargetArrowL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TargetArrowL:completeAnimation()
				self.TargetArrowL:setLeftRight( false, false, -16, 16 )
				self.TargetArrowL:setTopBottom( false, false, 10, 42 )
				self.TargetArrowL:setAlpha( 0 )
				self.TargetArrowL:setZRot( 0 )
				TargetArrowLFrame2( TargetArrowL, {} )
				local TargetArrowUFrame2 = function ( TargetArrowU, event )
					if not event.interrupted then
						TargetArrowU:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					TargetArrowU:setLeftRight( false, false, -16, 16 )
					TargetArrowU:setTopBottom( false, false, -124, -92 )
					TargetArrowU:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TargetArrowU, event )
					else
						TargetArrowU:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TargetArrowU:completeAnimation()
				self.TargetArrowU:setLeftRight( false, false, -16, 16 )
				self.TargetArrowU:setTopBottom( false, false, -43, -11 )
				self.TargetArrowU:setAlpha( 0 )
				TargetArrowUFrame2( TargetArrowU, {} )
				local TargetLineRFrame2 = function ( TargetLineR, event )
					if not event.interrupted then
						TargetLineR:beginAnimation( "keyframe", 330, false, true, CoD.TweenType.Back )
					end
					TargetLineR:setLeftRight( false, false, -12, 12 )
					TargetLineR:setTopBottom( false, false, 33, 41 )
					TargetLineR:setAlpha( 1 )
					TargetLineR:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( TargetLineR, event )
					else
						TargetLineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TargetLineR:completeAnimation()
				self.TargetLineR:setLeftRight( false, false, -12, 12 )
				self.TargetLineR:setTopBottom( false, false, 2, 10 )
				self.TargetLineR:setAlpha( 0 )
				self.TargetLineR:setZRot( -90 )
				TargetLineRFrame2( TargetLineR, {} )
				local TargetLineLFrame2 = function ( TargetLineL, event )
					if not event.interrupted then
						TargetLineL:beginAnimation( "keyframe", 330, false, true, CoD.TweenType.Back )
					end
					TargetLineL:setLeftRight( false, false, -12, 12 )
					TargetLineL:setTopBottom( false, false, -40, -32 )
					TargetLineL:setAlpha( 1 )
					TargetLineL:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( TargetLineL, event )
					else
						TargetLineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TargetLineL:completeAnimation()
				self.TargetLineL:setLeftRight( false, false, -12, 12 )
				self.TargetLineL:setTopBottom( false, false, -11, -3 )
				self.TargetLineL:setAlpha( 0 )
				self.TargetLineL:setZRot( 90 )
				TargetLineLFrame2( TargetLineL, {} )
				local EnemyTargetArrowAnim0Frame2 = function ( EnemyTargetArrowAnim0, event )
					local EnemyTargetArrowAnim0Frame3 = function ( EnemyTargetArrowAnim0, event )
						local EnemyTargetArrowAnim0Frame4 = function ( EnemyTargetArrowAnim0, event )
							local EnemyTargetArrowAnim0Frame5 = function ( EnemyTargetArrowAnim0, event )
								local EnemyTargetArrowAnim0Frame6 = function ( EnemyTargetArrowAnim0, event )
									local EnemyTargetArrowAnim0Frame7 = function ( EnemyTargetArrowAnim0, event )
										local EnemyTargetArrowAnim0Frame8 = function ( EnemyTargetArrowAnim0, event )
											local EnemyTargetArrowAnim0Frame9 = function ( EnemyTargetArrowAnim0, event )
												if not event.interrupted then
													EnemyTargetArrowAnim0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												end
												EnemyTargetArrowAnim0:setLeftRight( false, false, 16, 76 )
												EnemyTargetArrowAnim0:setTopBottom( false, false, -25, 25 )
												EnemyTargetArrowAnim0:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( EnemyTargetArrowAnim0, event )
												else
													EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												EnemyTargetArrowAnim0Frame9( EnemyTargetArrowAnim0, event )
												return 
											else
												EnemyTargetArrowAnim0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame9 )
											end
										end
										
										if event.interrupted then
											EnemyTargetArrowAnim0Frame8( EnemyTargetArrowAnim0, event )
											return 
										else
											EnemyTargetArrowAnim0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											EnemyTargetArrowAnim0:setAlpha( 0 )
											EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame8 )
										end
									end
									
									if event.interrupted then
										EnemyTargetArrowAnim0Frame7( EnemyTargetArrowAnim0, event )
										return 
									else
										EnemyTargetArrowAnim0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame7 )
									end
								end
								
								if event.interrupted then
									EnemyTargetArrowAnim0Frame6( EnemyTargetArrowAnim0, event )
									return 
								else
									EnemyTargetArrowAnim0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									EnemyTargetArrowAnim0:setAlpha( 1 )
									EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame6 )
								end
							end
							
							if event.interrupted then
								EnemyTargetArrowAnim0Frame5( EnemyTargetArrowAnim0, event )
								return 
							else
								EnemyTargetArrowAnim0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame5 )
							end
						end
						
						if event.interrupted then
							EnemyTargetArrowAnim0Frame4( EnemyTargetArrowAnim0, event )
							return 
						else
							EnemyTargetArrowAnim0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							EnemyTargetArrowAnim0:setAlpha( 0 )
							EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame4 )
						end
					end
					
					if event.interrupted then
						EnemyTargetArrowAnim0Frame3( EnemyTargetArrowAnim0, event )
						return 
					else
						EnemyTargetArrowAnim0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						EnemyTargetArrowAnim0:setLeftRight( false, false, 16, 76 )
						EnemyTargetArrowAnim0:setAlpha( 0.5 )
						EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame3 )
					end
				end
				
				EnemyTargetArrowAnim0:completeAnimation()
				self.EnemyTargetArrowAnim0:setLeftRight( false, false, 50, 110 )
				self.EnemyTargetArrowAnim0:setTopBottom( false, false, -25, 25 )
				self.EnemyTargetArrowAnim0:setAlpha( 0 )
				EnemyTargetArrowAnim0Frame2( EnemyTargetArrowAnim0, {} )
				local EnemyTargetArrowAnim1Frame2 = function ( EnemyTargetArrowAnim1, event )
					local EnemyTargetArrowAnim1Frame3 = function ( EnemyTargetArrowAnim1, event )
						local EnemyTargetArrowAnim1Frame4 = function ( EnemyTargetArrowAnim1, event )
							local EnemyTargetArrowAnim1Frame5 = function ( EnemyTargetArrowAnim1, event )
								local EnemyTargetArrowAnim1Frame6 = function ( EnemyTargetArrowAnim1, event )
									local EnemyTargetArrowAnim1Frame7 = function ( EnemyTargetArrowAnim1, event )
										local EnemyTargetArrowAnim1Frame8 = function ( EnemyTargetArrowAnim1, event )
											local EnemyTargetArrowAnim1Frame9 = function ( EnemyTargetArrowAnim1, event )
												if not event.interrupted then
													EnemyTargetArrowAnim1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												end
												EnemyTargetArrowAnim1:setLeftRight( false, false, -75, -15 )
												EnemyTargetArrowAnim1:setTopBottom( false, false, -25, 25 )
												EnemyTargetArrowAnim1:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( EnemyTargetArrowAnim1, event )
												else
													EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												EnemyTargetArrowAnim1Frame9( EnemyTargetArrowAnim1, event )
												return 
											else
												EnemyTargetArrowAnim1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame9 )
											end
										end
										
										if event.interrupted then
											EnemyTargetArrowAnim1Frame8( EnemyTargetArrowAnim1, event )
											return 
										else
											EnemyTargetArrowAnim1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											EnemyTargetArrowAnim1:setAlpha( 0 )
											EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame8 )
										end
									end
									
									if event.interrupted then
										EnemyTargetArrowAnim1Frame7( EnemyTargetArrowAnim1, event )
										return 
									else
										EnemyTargetArrowAnim1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame7 )
									end
								end
								
								if event.interrupted then
									EnemyTargetArrowAnim1Frame6( EnemyTargetArrowAnim1, event )
									return 
								else
									EnemyTargetArrowAnim1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									EnemyTargetArrowAnim1:setAlpha( 1 )
									EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame6 )
								end
							end
							
							if event.interrupted then
								EnemyTargetArrowAnim1Frame5( EnemyTargetArrowAnim1, event )
								return 
							else
								EnemyTargetArrowAnim1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame5 )
							end
						end
						
						if event.interrupted then
							EnemyTargetArrowAnim1Frame4( EnemyTargetArrowAnim1, event )
							return 
						else
							EnemyTargetArrowAnim1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							EnemyTargetArrowAnim1:setAlpha( 0 )
							EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame4 )
						end
					end
					
					if event.interrupted then
						EnemyTargetArrowAnim1Frame3( EnemyTargetArrowAnim1, event )
						return 
					else
						EnemyTargetArrowAnim1:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						EnemyTargetArrowAnim1:setLeftRight( false, false, -75, -15 )
						EnemyTargetArrowAnim1:setAlpha( 0.5 )
						EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame3 )
					end
				end
				
				EnemyTargetArrowAnim1:completeAnimation()
				self.EnemyTargetArrowAnim1:setLeftRight( false, false, -104, -44 )
				self.EnemyTargetArrowAnim1:setTopBottom( false, false, -25, 25 )
				self.EnemyTargetArrowAnim1:setAlpha( 0 )
				EnemyTargetArrowAnim1Frame2( EnemyTargetArrowAnim1, {} )
			end
		},
		Target = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				LockBlur:completeAnimation()
				self.LockBlur:setLeftRight( false, false, -100, 100 )
				self.LockBlur:setTopBottom( false, false, -100, 100 )
				self.LockBlur:setAlpha( 0 )
				self.clipFinished( LockBlur, {} )
				LockGlow:completeAnimation()
				self.LockGlow:setLeftRight( false, false, -128, 128 )
				self.LockGlow:setTopBottom( false, false, -172, 172 )
				self.LockGlow:setAlpha( 0 )
				self.clipFinished( LockGlow, {} )
				LockLineRedLR:completeAnimation()
				self.LockLineRedLR:setLeftRight( false, false, 10, 46 )
				self.LockLineRedLR:setTopBottom( false, false, 26, 62 )
				self.LockLineRedLR:setAlpha( 0 )
				self.clipFinished( LockLineRedLR, {} )
				LockLineRedLL:completeAnimation()
				self.LockLineRedLL:setLeftRight( false, false, -44, -8 )
				self.LockLineRedLL:setTopBottom( false, false, 26, 62 )
				self.LockLineRedLL:setAlpha( 0 )
				self.clipFinished( LockLineRedLL, {} )
				LockLineRedUR:completeAnimation()
				self.LockLineRedUR:setLeftRight( false, false, 10, 46 )
				self.LockLineRedUR:setTopBottom( false, false, -63, -27 )
				self.LockLineRedUR:setAlpha( 0 )
				self.clipFinished( LockLineRedUR, {} )
				LockLineRedUL:completeAnimation()
				self.LockLineRedUL:setLeftRight( false, false, -46, -10 )
				self.LockLineRedUL:setTopBottom( false, false, -63, -27 )
				self.LockLineRedUL:setAlpha( 0 )
				self.clipFinished( LockLineRedUL, {} )
				LockTarget:completeAnimation()
				self.LockTarget:setLeftRight( false, false, -50, 50 )
				self.LockTarget:setTopBottom( false, false, -92, 92 )
				self.LockTarget:setAlpha( 0 )
				self.clipFinished( LockTarget, {} )
				Target:completeAnimation()
				self.Target:setAlpha( 1 )
				self.Target:setZRot( 0 )
				self.clipFinished( Target, {} )
				TargetArrowL:completeAnimation()
				self.TargetArrowL:setLeftRight( false, false, -16, 16 )
				self.TargetArrowL:setTopBottom( false, false, 61, 93 )
				self.TargetArrowL:setAlpha( 1 )
				self.TargetArrowL:setZRot( 0 )
				self.clipFinished( TargetArrowL, {} )
				TargetArrowU:completeAnimation()
				self.TargetArrowU:setLeftRight( false, false, -16, 16 )
				self.TargetArrowU:setTopBottom( false, false, -97, -65 )
				self.TargetArrowU:setAlpha( 1 )
				self.clipFinished( TargetArrowU, {} )
				TargetLineR:completeAnimation()
				self.TargetLineR:setLeftRight( false, false, 61, 85 )
				self.TargetLineR:setTopBottom( false, false, -4, 4 )
				self.TargetLineR:setAlpha( 1 )
				self.TargetLineR:setZRot( 0 )
				self.clipFinished( TargetLineR, {} )
				TargetLineL:completeAnimation()
				self.TargetLineL:setLeftRight( false, false, -83, -59 )
				self.TargetLineL:setTopBottom( false, false, -4, 4 )
				self.TargetLineL:setAlpha( 1 )
				self.TargetLineL:setZRot( 0 )
				self.clipFinished( TargetLineL, {} )
				EnemyTargetArrowAnim0:completeAnimation()
				self.EnemyTargetArrowAnim0:setAlpha( 0 )
				self.clipFinished( EnemyTargetArrowAnim0, {} )
				EnemyTargetArrowAnim1:completeAnimation()
				self.EnemyTargetArrowAnim1:setAlpha( 0 )
				self.clipFinished( EnemyTargetArrowAnim1, {} )
			end,
			Lock = function ()
				self:setupElementClipCounter( 14 )
				local LockBlurFrame2 = function ( LockBlur, event )
					if not event.interrupted then
						LockBlur:beginAnimation( "keyframe", 459, false, true, CoD.TweenType.Back )
					end
					LockBlur:setLeftRight( false, false, -100, 100 )
					LockBlur:setTopBottom( false, false, -100, 100 )
					LockBlur:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LockBlur, event )
					else
						LockBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockBlur:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				LockBlur:setLeftRight( false, false, -100, 100 )
				LockBlur:setTopBottom( false, false, -100, 100 )
				LockBlur:setAlpha( 0 )
				LockBlur:registerEventHandler( "transition_complete_keyframe", LockBlurFrame2 )
				local LockGlowFrame2 = function ( LockGlow, event )
					if not event.interrupted then
						LockGlow:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
					end
					LockGlow:setLeftRight( false, false, -128, 128 )
					LockGlow:setTopBottom( false, false, -172, 172 )
					LockGlow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LockGlow, event )
					else
						LockGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockGlow:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				LockGlow:setLeftRight( false, false, -128, 128 )
				LockGlow:setTopBottom( false, false, -172, 172 )
				LockGlow:setAlpha( 0 )
				LockGlow:registerEventHandler( "transition_complete_keyframe", LockGlowFrame2 )
				local LockLineRedLRFrame2 = function ( LockLineRedLR, event )
					local LockLineRedLRFrame3 = function ( LockLineRedLR, event )
						local LockLineRedLRFrame4 = function ( LockLineRedLR, event )
							if not event.interrupted then
								LockLineRedLR:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							end
							LockLineRedLR:setLeftRight( false, false, 32, 68 )
							LockLineRedLR:setTopBottom( false, false, 53, 89 )
							LockLineRedLR:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( LockLineRedLR, event )
							else
								LockLineRedLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LockLineRedLRFrame4( LockLineRedLR, event )
							return 
						else
							LockLineRedLR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							LockLineRedLR:setAlpha( 0 )
							LockLineRedLR:registerEventHandler( "transition_complete_keyframe", LockLineRedLRFrame4 )
						end
					end
					
					if event.interrupted then
						LockLineRedLRFrame3( LockLineRedLR, event )
						return 
					else
						LockLineRedLR:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Linear )
						LockLineRedLR:setLeftRight( false, false, 32, 68 )
						LockLineRedLR:setTopBottom( false, false, 53, 89 )
						LockLineRedLR:setAlpha( 1 )
						LockLineRedLR:registerEventHandler( "transition_complete_keyframe", LockLineRedLRFrame3 )
					end
				end
				
				LockLineRedLR:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
				LockLineRedLR:setLeftRight( false, false, 71, 107 )
				LockLineRedLR:setTopBottom( false, false, 95, 131 )
				LockLineRedLR:setAlpha( 0 )
				LockLineRedLR:registerEventHandler( "transition_complete_keyframe", LockLineRedLRFrame2 )
				local LockLineRedLLFrame2 = function ( LockLineRedLL, event )
					local LockLineRedLLFrame3 = function ( LockLineRedLL, event )
						local LockLineRedLLFrame4 = function ( LockLineRedLL, event )
							if not event.interrupted then
								LockLineRedLL:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							end
							LockLineRedLL:setLeftRight( false, false, -67, -31 )
							LockLineRedLL:setTopBottom( false, false, 53, 89 )
							LockLineRedLL:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( LockLineRedLL, event )
							else
								LockLineRedLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LockLineRedLLFrame4( LockLineRedLL, event )
							return 
						else
							LockLineRedLL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							LockLineRedLL:setAlpha( 0 )
							LockLineRedLL:registerEventHandler( "transition_complete_keyframe", LockLineRedLLFrame4 )
						end
					end
					
					if event.interrupted then
						LockLineRedLLFrame3( LockLineRedLL, event )
						return 
					else
						LockLineRedLL:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Linear )
						LockLineRedLL:setLeftRight( false, false, -67, -31 )
						LockLineRedLL:setTopBottom( false, false, 53, 89 )
						LockLineRedLL:setAlpha( 1 )
						LockLineRedLL:registerEventHandler( "transition_complete_keyframe", LockLineRedLLFrame3 )
					end
				end
				
				LockLineRedLL:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
				LockLineRedLL:setLeftRight( false, false, -107, -71 )
				LockLineRedLL:setTopBottom( false, false, 95, 131 )
				LockLineRedLL:setAlpha( 0 )
				LockLineRedLL:registerEventHandler( "transition_complete_keyframe", LockLineRedLLFrame2 )
				local LockLineRedURFrame2 = function ( LockLineRedUR, event )
					local LockLineRedURFrame3 = function ( LockLineRedUR, event )
						local LockLineRedURFrame4 = function ( LockLineRedUR, event )
							if not event.interrupted then
								LockLineRedUR:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							end
							LockLineRedUR:setLeftRight( false, false, 32, 68 )
							LockLineRedUR:setTopBottom( false, false, -85, -49 )
							LockLineRedUR:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( LockLineRedUR, event )
							else
								LockLineRedUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LockLineRedURFrame4( LockLineRedUR, event )
							return 
						else
							LockLineRedUR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							LockLineRedUR:setAlpha( 0 )
							LockLineRedUR:registerEventHandler( "transition_complete_keyframe", LockLineRedURFrame4 )
						end
					end
					
					if event.interrupted then
						LockLineRedURFrame3( LockLineRedUR, event )
						return 
					else
						LockLineRedUR:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Linear )
						LockLineRedUR:setLeftRight( false, false, 32, 68 )
						LockLineRedUR:setTopBottom( false, false, -85, -49 )
						LockLineRedUR:setAlpha( 1 )
						LockLineRedUR:registerEventHandler( "transition_complete_keyframe", LockLineRedURFrame3 )
					end
				end
				
				LockLineRedUR:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
				LockLineRedUR:setLeftRight( false, false, 71, 107 )
				LockLineRedUR:setTopBottom( false, false, -126, -90 )
				LockLineRedUR:setAlpha( 0 )
				LockLineRedUR:registerEventHandler( "transition_complete_keyframe", LockLineRedURFrame2 )
				local LockLineRedULFrame2 = function ( LockLineRedUL, event )
					local LockLineRedULFrame3 = function ( LockLineRedUL, event )
						local LockLineRedULFrame4 = function ( LockLineRedUL, event )
							if not event.interrupted then
								LockLineRedUL:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							end
							LockLineRedUL:setLeftRight( false, false, -67, -31 )
							LockLineRedUL:setTopBottom( false, false, -85, -49 )
							LockLineRedUL:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( LockLineRedUL, event )
							else
								LockLineRedUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LockLineRedULFrame4( LockLineRedUL, event )
							return 
						else
							LockLineRedUL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							LockLineRedUL:setAlpha( 0 )
							LockLineRedUL:registerEventHandler( "transition_complete_keyframe", LockLineRedULFrame4 )
						end
					end
					
					if event.interrupted then
						LockLineRedULFrame3( LockLineRedUL, event )
						return 
					else
						LockLineRedUL:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Linear )
						LockLineRedUL:setLeftRight( false, false, -67, -31 )
						LockLineRedUL:setTopBottom( false, false, -85, -49 )
						LockLineRedUL:setAlpha( 1 )
						LockLineRedUL:registerEventHandler( "transition_complete_keyframe", LockLineRedULFrame3 )
					end
				end
				
				LockLineRedUL:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
				LockLineRedUL:setLeftRight( false, false, -107, -71 )
				LockLineRedUL:setTopBottom( false, false, -126, -90 )
				LockLineRedUL:setAlpha( 0 )
				LockLineRedUL:registerEventHandler( "transition_complete_keyframe", LockLineRedULFrame2 )
				local LockTargetFrame2 = function ( LockTarget, event )
					if not event.interrupted then
						LockTarget:beginAnimation( "keyframe", 469, false, true, CoD.TweenType.Linear )
					end
					LockTarget:setLeftRight( false, false, -50, 50 )
					LockTarget:setTopBottom( false, false, -92, 92 )
					LockTarget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LockTarget, event )
					else
						LockTarget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockTarget:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
				LockTarget:setLeftRight( false, false, -50, 50 )
				LockTarget:setTopBottom( false, false, -92, 92 )
				LockTarget:setAlpha( 0 )
				LockTarget:registerEventHandler( "transition_complete_keyframe", LockTargetFrame2 )
				local TargetFrame2 = function ( Target, event )
					local TargetFrame3 = function ( Target, event )
						local TargetFrame4 = function ( Target, event )
							if not event.interrupted then
								Target:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
							end
							Target:setAlpha( 1 )
							Target:setZRot( -90 )
							if event.interrupted then
								self.clipFinished( Target, event )
							else
								Target:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TargetFrame4( Target, event )
							return 
						else
							Target:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Bounce )
							Target:setAlpha( 0 )
							Target:registerEventHandler( "transition_complete_keyframe", TargetFrame4 )
						end
					end
					
					if event.interrupted then
						TargetFrame3( Target, event )
						return 
					else
						Target:beginAnimation( "keyframe", 289, true, true, CoD.TweenType.Linear )
						Target:setZRot( -90 )
						Target:registerEventHandler( "transition_complete_keyframe", TargetFrame3 )
					end
				end
				
				Target:completeAnimation()
				self.Target:setAlpha( 1 )
				self.Target:setZRot( 0 )
				TargetFrame2( Target, {} )
				local TargetArrowLFrame2 = function ( TargetArrowL, event )
					if not event.interrupted then
						TargetArrowL:beginAnimation( "keyframe", 289, false, true, CoD.TweenType.Linear )
					end
					TargetArrowL:setLeftRight( false, false, -16, 16 )
					TargetArrowL:setTopBottom( false, false, 92, 124 )
					TargetArrowL:setAlpha( 0 )
					TargetArrowL:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( TargetArrowL, event )
					else
						TargetArrowL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TargetArrowL:completeAnimation()
				self.TargetArrowL:setLeftRight( false, false, -16, 16 )
				self.TargetArrowL:setTopBottom( false, false, 61, 93 )
				self.TargetArrowL:setAlpha( 1 )
				self.TargetArrowL:setZRot( 0 )
				TargetArrowLFrame2( TargetArrowL, {} )
				local TargetArrowUFrame2 = function ( TargetArrowU, event )
					if not event.interrupted then
						TargetArrowU:beginAnimation( "keyframe", 289, false, true, CoD.TweenType.Linear )
					end
					TargetArrowU:setLeftRight( false, false, -16, 16 )
					TargetArrowU:setTopBottom( false, false, -124, -92 )
					TargetArrowU:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TargetArrowU, event )
					else
						TargetArrowU:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TargetArrowU:completeAnimation()
				self.TargetArrowU:setLeftRight( false, false, -16, 16 )
				self.TargetArrowU:setTopBottom( false, false, -97, -65 )
				self.TargetArrowU:setAlpha( 1 )
				TargetArrowUFrame2( TargetArrowU, {} )
				local TargetLineRFrame2 = function ( TargetLineR, event )
					local TargetLineRFrame3 = function ( TargetLineR, event )
						local TargetLineRFrame4 = function ( TargetLineR, event )
							if not event.interrupted then
								TargetLineR:beginAnimation( "keyframe", 150, true, true, CoD.TweenType.Linear )
							end
							TargetLineR:setLeftRight( false, false, -12, 12 )
							TargetLineR:setTopBottom( false, false, 33, 41 )
							TargetLineR:setAlpha( 1 )
							TargetLineR:setZRot( -90 )
							if event.interrupted then
								self.clipFinished( TargetLineR, event )
							else
								TargetLineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TargetLineRFrame4( TargetLineR, event )
							return 
						else
							TargetLineR:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							TargetLineR:setLeftRight( false, false, 5.54, 29.54 )
							TargetLineR:setTopBottom( false, false, 24.11, 32.11 )
							TargetLineR:setZRot( -68.38 )
							TargetLineR:registerEventHandler( "transition_complete_keyframe", TargetLineRFrame4 )
						end
					end
					
					if event.interrupted then
						TargetLineRFrame3( TargetLineR, event )
						return 
					else
						TargetLineR:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						TargetLineR:setLeftRight( false, false, 47.53, 71.53 )
						TargetLineR:setTopBottom( false, false, 2.82, 10.82 )
						TargetLineR:setAlpha( 0 )
						TargetLineR:setZRot( -16.6 )
						TargetLineR:registerEventHandler( "transition_complete_keyframe", TargetLineRFrame3 )
					end
				end
				
				TargetLineR:completeAnimation()
				self.TargetLineR:setLeftRight( false, false, 61, 85 )
				self.TargetLineR:setTopBottom( false, false, -4, 4 )
				self.TargetLineR:setAlpha( 1 )
				self.TargetLineR:setZRot( 0 )
				TargetLineRFrame2( TargetLineR, {} )
				local TargetLineLFrame2 = function ( TargetLineL, event )
					local TargetLineLFrame3 = function ( TargetLineL, event )
						local TargetLineLFrame4 = function ( TargetLineL, event )
							if not event.interrupted then
								TargetLineL:beginAnimation( "keyframe", 150, true, true, CoD.TweenType.Linear )
							end
							TargetLineL:setLeftRight( false, false, -12, 12 )
							TargetLineL:setTopBottom( false, false, -40, -32 )
							TargetLineL:setAlpha( 1 )
							TargetLineL:setZRot( 90 )
							if event.interrupted then
								self.clipFinished( TargetLineL, event )
							else
								TargetLineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TargetLineLFrame4( TargetLineL, event )
							return 
						else
							TargetLineL:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							TargetLineL:setLeftRight( false, false, -29.05, -5.05 )
							TargetLineL:setTopBottom( false, false, -31.35, -23.35 )
							TargetLineL:setZRot( 68.38 )
							TargetLineL:registerEventHandler( "transition_complete_keyframe", TargetLineLFrame4 )
						end
					end
					
					if event.interrupted then
						TargetLineLFrame3( TargetLineL, event )
						return 
					else
						TargetLineL:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						TargetLineL:setLeftRight( false, false, -69.9, -45.9 )
						TargetLineL:setTopBottom( false, false, -10.64, -2.64 )
						TargetLineL:setAlpha( 0 )
						TargetLineL:setZRot( 16.6 )
						TargetLineL:registerEventHandler( "transition_complete_keyframe", TargetLineLFrame3 )
					end
				end
				
				TargetLineL:completeAnimation()
				self.TargetLineL:setLeftRight( false, false, -83, -59 )
				self.TargetLineL:setTopBottom( false, false, -4, 4 )
				self.TargetLineL:setAlpha( 1 )
				self.TargetLineL:setZRot( 0 )
				TargetLineLFrame2( TargetLineL, {} )
				local EnemyTargetArrowAnim0Frame2 = function ( EnemyTargetArrowAnim0, event )
					local EnemyTargetArrowAnim0Frame3 = function ( EnemyTargetArrowAnim0, event )
						local EnemyTargetArrowAnim0Frame4 = function ( EnemyTargetArrowAnim0, event )
							if not event.interrupted then
								EnemyTargetArrowAnim0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							end
							EnemyTargetArrowAnim0:setLeftRight( false, false, 16, 76 )
							EnemyTargetArrowAnim0:setTopBottom( false, false, -25, 25 )
							EnemyTargetArrowAnim0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( EnemyTargetArrowAnim0, event )
							else
								EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							EnemyTargetArrowAnim0Frame4( EnemyTargetArrowAnim0, event )
							return 
						else
							EnemyTargetArrowAnim0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Bounce )
							EnemyTargetArrowAnim0:setAlpha( 0 )
							EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame4 )
						end
					end
					
					if event.interrupted then
						EnemyTargetArrowAnim0Frame3( EnemyTargetArrowAnim0, event )
						return 
					else
						EnemyTargetArrowAnim0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						EnemyTargetArrowAnim0:setLeftRight( false, false, 16, 76 )
						EnemyTargetArrowAnim0:setAlpha( 1 )
						EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame3 )
					end
				end
				
				EnemyTargetArrowAnim0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				EnemyTargetArrowAnim0:setLeftRight( false, false, 46, 106 )
				EnemyTargetArrowAnim0:setTopBottom( false, false, -25, 25 )
				EnemyTargetArrowAnim0:setAlpha( 0 )
				EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame2 )
				local EnemyTargetArrowAnim1Frame2 = function ( EnemyTargetArrowAnim1, event )
					local EnemyTargetArrowAnim1Frame3 = function ( EnemyTargetArrowAnim1, event )
						local EnemyTargetArrowAnim1Frame4 = function ( EnemyTargetArrowAnim1, event )
							if not event.interrupted then
								EnemyTargetArrowAnim1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							end
							EnemyTargetArrowAnim1:setLeftRight( false, false, -75, -15 )
							EnemyTargetArrowAnim1:setTopBottom( false, false, -25, 25 )
							EnemyTargetArrowAnim1:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( EnemyTargetArrowAnim1, event )
							else
								EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							EnemyTargetArrowAnim1Frame4( EnemyTargetArrowAnim1, event )
							return 
						else
							EnemyTargetArrowAnim1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Bounce )
							EnemyTargetArrowAnim1:setAlpha( 0 )
							EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame4 )
						end
					end
					
					if event.interrupted then
						EnemyTargetArrowAnim1Frame3( EnemyTargetArrowAnim1, event )
						return 
					else
						EnemyTargetArrowAnim1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						EnemyTargetArrowAnim1:setLeftRight( false, false, -75, -15 )
						EnemyTargetArrowAnim1:setAlpha( 1 )
						EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame3 )
					end
				end
				
				EnemyTargetArrowAnim1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				EnemyTargetArrowAnim1:setLeftRight( false, false, -104, -44 )
				EnemyTargetArrowAnim1:setTopBottom( false, false, -25, 25 )
				EnemyTargetArrowAnim1:setAlpha( 0 )
				EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame2 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 14 )
				LockBlur:completeAnimation()
				self.LockBlur:setLeftRight( false, false, -100, 100 )
				self.LockBlur:setTopBottom( false, false, -100, 100 )
				self.LockBlur:setAlpha( 0 )
				self.clipFinished( LockBlur, {} )
				LockGlow:completeAnimation()
				self.LockGlow:setLeftRight( false, false, -128, 128 )
				self.LockGlow:setTopBottom( false, false, -172, 172 )
				self.LockGlow:setAlpha( 0 )
				self.clipFinished( LockGlow, {} )
				LockLineRedLR:completeAnimation()
				self.LockLineRedLR:setLeftRight( false, false, 10, 46 )
				self.LockLineRedLR:setTopBottom( false, false, 26, 62 )
				self.LockLineRedLR:setAlpha( 0 )
				self.clipFinished( LockLineRedLR, {} )
				LockLineRedLL:completeAnimation()
				self.LockLineRedLL:setLeftRight( false, false, -44, -8 )
				self.LockLineRedLL:setTopBottom( false, false, 26, 62 )
				self.LockLineRedLL:setAlpha( 0 )
				self.clipFinished( LockLineRedLL, {} )
				LockLineRedUR:completeAnimation()
				self.LockLineRedUR:setLeftRight( false, false, 10, 46 )
				self.LockLineRedUR:setTopBottom( false, false, -63, -27 )
				self.LockLineRedUR:setAlpha( 0 )
				self.clipFinished( LockLineRedUR, {} )
				LockLineRedUL:completeAnimation()
				self.LockLineRedUL:setLeftRight( false, false, -46, -10 )
				self.LockLineRedUL:setTopBottom( false, false, -63, -27 )
				self.LockLineRedUL:setAlpha( 0 )
				self.clipFinished( LockLineRedUL, {} )
				LockTarget:completeAnimation()
				self.LockTarget:setLeftRight( false, false, -50, 50 )
				self.LockTarget:setTopBottom( false, false, -92, 92 )
				self.LockTarget:setAlpha( 0 )
				self.clipFinished( LockTarget, {} )
				local TargetFrame2 = function ( Target, event )
					local TargetFrame3 = function ( Target, event )
						local TargetFrame4 = function ( Target, event )
							local TargetFrame5 = function ( Target, event )
								local TargetFrame6 = function ( Target, event )
									local TargetFrame7 = function ( Target, event )
										if not event.interrupted then
											Target:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
										end
										Target:setAlpha( 0 )
										Target:setZRot( 0 )
										if event.interrupted then
											self.clipFinished( Target, event )
										else
											Target:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										TargetFrame7( Target, event )
										return 
									else
										Target:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
										Target:setAlpha( 0.49 )
										Target:registerEventHandler( "transition_complete_keyframe", TargetFrame7 )
									end
								end
								
								if event.interrupted then
									TargetFrame6( Target, event )
									return 
								else
									Target:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
									Target:setAlpha( 0 )
									Target:registerEventHandler( "transition_complete_keyframe", TargetFrame6 )
								end
							end
							
							if event.interrupted then
								TargetFrame5( Target, event )
								return 
							else
								Target:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Bounce )
								Target:setAlpha( 1 )
								Target:registerEventHandler( "transition_complete_keyframe", TargetFrame5 )
							end
						end
						
						if event.interrupted then
							TargetFrame4( Target, event )
							return 
						else
							Target:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Bounce )
							Target:setAlpha( 0 )
							Target:registerEventHandler( "transition_complete_keyframe", TargetFrame4 )
						end
					end
					
					if event.interrupted then
						TargetFrame3( Target, event )
						return 
					else
						Target:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						Target:registerEventHandler( "transition_complete_keyframe", TargetFrame3 )
					end
				end
				
				Target:completeAnimation()
				self.Target:setAlpha( 1 )
				self.Target:setZRot( 0 )
				TargetFrame2( Target, {} )
				local TargetArrowLFrame2 = function ( TargetArrowL, event )
					local TargetArrowLFrame3 = function ( TargetArrowL, event )
						local TargetArrowLFrame4 = function ( TargetArrowL, event )
							if not event.interrupted then
								TargetArrowL:beginAnimation( "keyframe", 519, false, true, CoD.TweenType.Linear )
							end
							TargetArrowL:setLeftRight( false, false, -16, 16 )
							TargetArrowL:setTopBottom( false, false, 10, 42 )
							TargetArrowL:setAlpha( 0 )
							TargetArrowL:setZRot( 0 )
							if event.interrupted then
								self.clipFinished( TargetArrowL, event )
							else
								TargetArrowL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TargetArrowLFrame4( TargetArrowL, event )
							return 
						else
							TargetArrowL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							TargetArrowL:setAlpha( 1 )
							TargetArrowL:registerEventHandler( "transition_complete_keyframe", TargetArrowLFrame4 )
						end
					end
					
					if event.interrupted then
						TargetArrowLFrame3( TargetArrowL, event )
						return 
					else
						TargetArrowL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
						TargetArrowL:setAlpha( 0 )
						TargetArrowL:registerEventHandler( "transition_complete_keyframe", TargetArrowLFrame3 )
					end
				end
				
				TargetArrowL:completeAnimation()
				self.TargetArrowL:setLeftRight( false, false, -16, 16 )
				self.TargetArrowL:setTopBottom( false, false, 61, 93 )
				self.TargetArrowL:setAlpha( 1 )
				self.TargetArrowL:setZRot( 0 )
				TargetArrowLFrame2( TargetArrowL, {} )
				local TargetArrowUFrame2 = function ( TargetArrowU, event )
					local TargetArrowUFrame3 = function ( TargetArrowU, event )
						local TargetArrowUFrame4 = function ( TargetArrowU, event )
							if not event.interrupted then
								TargetArrowU:beginAnimation( "keyframe", 519, false, true, CoD.TweenType.Linear )
							end
							TargetArrowU:setLeftRight( false, false, -16, 16 )
							TargetArrowU:setTopBottom( false, false, -43, -11 )
							TargetArrowU:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( TargetArrowU, event )
							else
								TargetArrowU:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TargetArrowUFrame4( TargetArrowU, event )
							return 
						else
							TargetArrowU:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							TargetArrowU:setAlpha( 1 )
							TargetArrowU:registerEventHandler( "transition_complete_keyframe", TargetArrowUFrame4 )
						end
					end
					
					if event.interrupted then
						TargetArrowUFrame3( TargetArrowU, event )
						return 
					else
						TargetArrowU:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
						TargetArrowU:setAlpha( 0 )
						TargetArrowU:registerEventHandler( "transition_complete_keyframe", TargetArrowUFrame3 )
					end
				end
				
				TargetArrowU:completeAnimation()
				self.TargetArrowU:setLeftRight( false, false, -16, 16 )
				self.TargetArrowU:setTopBottom( false, false, -97, -65 )
				self.TargetArrowU:setAlpha( 1 )
				TargetArrowUFrame2( TargetArrowU, {} )
				local TargetLineRFrame2 = function ( TargetLineR, event )
					if not event.interrupted then
						TargetLineR:beginAnimation( "keyframe", 419, false, true, CoD.TweenType.Linear )
					end
					TargetLineR:setLeftRight( false, false, 101, 125 )
					TargetLineR:setTopBottom( false, false, -4, 4 )
					TargetLineR:setAlpha( 0 )
					TargetLineR:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( TargetLineR, event )
					else
						TargetLineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TargetLineR:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
				TargetLineR:setLeftRight( false, false, 61, 85 )
				TargetLineR:setTopBottom( false, false, -4, 4 )
				TargetLineR:setAlpha( 1 )
				TargetLineR:setZRot( 0 )
				TargetLineR:registerEventHandler( "transition_complete_keyframe", TargetLineRFrame2 )
				local TargetLineLFrame2 = function ( TargetLineL, event )
					if not event.interrupted then
						TargetLineL:beginAnimation( "keyframe", 419, false, true, CoD.TweenType.Linear )
					end
					TargetLineL:setLeftRight( false, false, -128, -104 )
					TargetLineL:setTopBottom( false, false, -4, 4 )
					TargetLineL:setAlpha( 0 )
					TargetLineL:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( TargetLineL, event )
					else
						TargetLineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TargetLineL:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
				TargetLineL:setLeftRight( false, false, -83, -59 )
				TargetLineL:setTopBottom( false, false, -4, 4 )
				TargetLineL:setAlpha( 1 )
				TargetLineL:setZRot( 0 )
				TargetLineL:registerEventHandler( "transition_complete_keyframe", TargetLineLFrame2 )
				EnemyTargetArrowAnim0:completeAnimation()
				self.EnemyTargetArrowAnim0:setAlpha( 0 )
				self.clipFinished( EnemyTargetArrowAnim0, {} )
				EnemyTargetArrowAnim1:completeAnimation()
				self.EnemyTargetArrowAnim1:setAlpha( 0 )
				self.clipFinished( EnemyTargetArrowAnim1, {} )
			end
		},
		Lock = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				LockBlur:completeAnimation()
				self.LockBlur:setAlpha( 1 )
				self.clipFinished( LockBlur, {} )
				LockGlow:completeAnimation()
				self.LockGlow:setAlpha( 1 )
				self.clipFinished( LockGlow, {} )
				LockLineRedLR:completeAnimation()
				self.LockLineRedLR:setLeftRight( false, false, 32, 68 )
				self.LockLineRedLR:setTopBottom( false, false, 53, 89 )
				self.LockLineRedLR:setAlpha( 1 )
				self.clipFinished( LockLineRedLR, {} )
				LockLineRedLL:completeAnimation()
				self.LockLineRedLL:setLeftRight( false, false, -67, -31 )
				self.LockLineRedLL:setTopBottom( false, false, 53, 89 )
				self.LockLineRedLL:setAlpha( 1 )
				self.clipFinished( LockLineRedLL, {} )
				LockLineRedUR:completeAnimation()
				self.LockLineRedUR:setLeftRight( false, false, 32, 68 )
				self.LockLineRedUR:setTopBottom( false, false, -85, -49 )
				self.LockLineRedUR:setAlpha( 1 )
				self.clipFinished( LockLineRedUR, {} )
				LockLineRedUL:completeAnimation()
				self.LockLineRedUL:setLeftRight( false, false, -67, -31 )
				self.LockLineRedUL:setTopBottom( false, false, -85, -49 )
				self.LockLineRedUL:setAlpha( 1 )
				self.clipFinished( LockLineRedUL, {} )
				LockTarget:completeAnimation()
				self.LockTarget:setAlpha( 1 )
				self.clipFinished( LockTarget, {} )
				Target:completeAnimation()
				self.Target:setAlpha( 1 )
				self.Target:setZRot( -90 )
				self.clipFinished( Target, {} )
				TargetArrowL:completeAnimation()
				self.TargetArrowL:setLeftRight( false, false, -16, 16 )
				self.TargetArrowL:setTopBottom( false, false, 92, 124 )
				self.TargetArrowL:setAlpha( 0 )
				self.TargetArrowL:setZRot( 0 )
				self.clipFinished( TargetArrowL, {} )
				TargetArrowU:completeAnimation()
				self.TargetArrowU:setLeftRight( false, false, -16, 16 )
				self.TargetArrowU:setTopBottom( false, false, -124, -92 )
				self.TargetArrowU:setAlpha( 0 )
				self.clipFinished( TargetArrowU, {} )
				TargetLineR:completeAnimation()
				self.TargetLineR:setLeftRight( false, false, -12, 12 )
				self.TargetLineR:setTopBottom( false, false, 33, 41 )
				self.TargetLineR:setAlpha( 1 )
				self.TargetLineR:setZRot( -90 )
				self.clipFinished( TargetLineR, {} )
				TargetLineL:completeAnimation()
				self.TargetLineL:setLeftRight( false, false, -12, 12 )
				self.TargetLineL:setTopBottom( false, false, -40, -32 )
				self.TargetLineL:setAlpha( 1 )
				self.TargetLineL:setZRot( 90 )
				self.clipFinished( TargetLineL, {} )
				EnemyTargetArrowAnim0:completeAnimation()
				self.EnemyTargetArrowAnim0:setAlpha( 1 )
				self.clipFinished( EnemyTargetArrowAnim0, {} )
				EnemyTargetArrowAnim1:completeAnimation()
				self.EnemyTargetArrowAnim1:setAlpha( 1 )
				self.clipFinished( EnemyTargetArrowAnim1, {} )
			end,
			Target = function ()
				self:setupElementClipCounter( 14 )
				local LockBlurFrame2 = function ( LockBlur, event )
					if not event.interrupted then
						LockBlur:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
					end
					LockBlur:setLeftRight( false, false, -100, 100 )
					LockBlur:setTopBottom( false, false, -100, 100 )
					LockBlur:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LockBlur, event )
					else
						LockBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockBlur:completeAnimation()
				self.LockBlur:setLeftRight( false, false, -100, 100 )
				self.LockBlur:setTopBottom( false, false, -100, 100 )
				self.LockBlur:setAlpha( 1 )
				LockBlurFrame2( LockBlur, {} )
				local LockGlowFrame2 = function ( LockGlow, event )
					if not event.interrupted then
						LockGlow:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
					end
					LockGlow:setLeftRight( false, false, -128, 128 )
					LockGlow:setTopBottom( false, false, -172, 172 )
					LockGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LockGlow, event )
					else
						LockGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockGlow:completeAnimation()
				self.LockGlow:setLeftRight( false, false, -128, 128 )
				self.LockGlow:setTopBottom( false, false, -172, 172 )
				self.LockGlow:setAlpha( 1 )
				LockGlowFrame2( LockGlow, {} )
				local LockLineRedLRFrame2 = function ( LockLineRedLR, event )
					if not event.interrupted then
						LockLineRedLR:beginAnimation( "keyframe", 240, true, false, CoD.TweenType.Linear )
					end
					LockLineRedLR:setLeftRight( false, false, 60, 96 )
					LockLineRedLR:setTopBottom( false, false, 86, 122 )
					LockLineRedLR:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LockLineRedLR, event )
					else
						LockLineRedLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockLineRedLR:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				LockLineRedLR:setLeftRight( false, false, 32, 68 )
				LockLineRedLR:setTopBottom( false, false, 53, 89 )
				LockLineRedLR:setAlpha( 1 )
				LockLineRedLR:registerEventHandler( "transition_complete_keyframe", LockLineRedLRFrame2 )
				local LockLineRedLLFrame2 = function ( LockLineRedLL, event )
					if not event.interrupted then
						LockLineRedLL:beginAnimation( "keyframe", 240, true, false, CoD.TweenType.Linear )
					end
					LockLineRedLL:setLeftRight( false, false, -89, -53 )
					LockLineRedLL:setTopBottom( false, false, 86, 122 )
					LockLineRedLL:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LockLineRedLL, event )
					else
						LockLineRedLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockLineRedLL:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				LockLineRedLL:setLeftRight( false, false, -67, -31 )
				LockLineRedLL:setTopBottom( false, false, 53, 89 )
				LockLineRedLL:setAlpha( 1 )
				LockLineRedLL:registerEventHandler( "transition_complete_keyframe", LockLineRedLLFrame2 )
				local LockLineRedURFrame2 = function ( LockLineRedUR, event )
					if not event.interrupted then
						LockLineRedUR:beginAnimation( "keyframe", 240, true, false, CoD.TweenType.Linear )
					end
					LockLineRedUR:setLeftRight( false, false, 60, 96 )
					LockLineRedUR:setTopBottom( false, false, -118, -82 )
					LockLineRedUR:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LockLineRedUR, event )
					else
						LockLineRedUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockLineRedUR:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				LockLineRedUR:setLeftRight( false, false, 32, 68 )
				LockLineRedUR:setTopBottom( false, false, -85, -49 )
				LockLineRedUR:setAlpha( 1 )
				LockLineRedUR:registerEventHandler( "transition_complete_keyframe", LockLineRedURFrame2 )
				local LockLineRedULFrame2 = function ( LockLineRedUL, event )
					if not event.interrupted then
						LockLineRedUL:beginAnimation( "keyframe", 240, true, false, CoD.TweenType.Linear )
					end
					LockLineRedUL:setLeftRight( false, false, -91, -55 )
					LockLineRedUL:setTopBottom( false, false, -118, -82 )
					LockLineRedUL:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LockLineRedUL, event )
					else
						LockLineRedUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockLineRedUL:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				LockLineRedUL:setLeftRight( false, false, -67, -31 )
				LockLineRedUL:setTopBottom( false, false, -85, -49 )
				LockLineRedUL:setAlpha( 1 )
				LockLineRedUL:registerEventHandler( "transition_complete_keyframe", LockLineRedULFrame2 )
				local LockTargetFrame2 = function ( LockTarget, event )
					if not event.interrupted then
						LockTarget:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
					end
					LockTarget:setLeftRight( false, false, -50, 50 )
					LockTarget:setTopBottom( false, false, -92, 92 )
					LockTarget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LockTarget, event )
					else
						LockTarget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockTarget:completeAnimation()
				self.LockTarget:setLeftRight( false, false, -50, 50 )
				self.LockTarget:setTopBottom( false, false, -92, 92 )
				self.LockTarget:setAlpha( 1 )
				LockTargetFrame2( LockTarget, {} )
				local TargetFrame2 = function ( Target, event )
					local TargetFrame3 = function ( Target, event )
						local TargetFrame4 = function ( Target, event )
							local TargetFrame5 = function ( Target, event )
								local TargetFrame6 = function ( Target, event )
									local TargetFrame7 = function ( Target, event )
										local TargetFrame8 = function ( Target, event )
											if not event.interrupted then
												Target:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Bounce )
											end
											Target:setAlpha( 1 )
											Target:setZRot( 0 )
											if event.interrupted then
												self.clipFinished( Target, event )
											else
												Target:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											TargetFrame8( Target, event )
											return 
										else
											Target:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
											Target:setAlpha( 0 )
											Target:registerEventHandler( "transition_complete_keyframe", TargetFrame8 )
										end
									end
									
									if event.interrupted then
										TargetFrame7( Target, event )
										return 
									else
										Target:beginAnimation( "keyframe", 419, true, true, CoD.TweenType.Linear )
										Target:setZRot( 0 )
										Target:registerEventHandler( "transition_complete_keyframe", TargetFrame7 )
									end
								end
								
								if event.interrupted then
									TargetFrame6( Target, event )
									return 
								else
									Target:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
									Target:setAlpha( 1 )
									Target:registerEventHandler( "transition_complete_keyframe", TargetFrame6 )
								end
							end
							
							if event.interrupted then
								TargetFrame5( Target, event )
								return 
							else
								Target:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
								Target:setAlpha( 0 )
								Target:registerEventHandler( "transition_complete_keyframe", TargetFrame5 )
							end
						end
						
						if event.interrupted then
							TargetFrame4( Target, event )
							return 
						else
							Target:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
							Target:setAlpha( 1 )
							Target:registerEventHandler( "transition_complete_keyframe", TargetFrame4 )
						end
					end
					
					if event.interrupted then
						TargetFrame3( Target, event )
						return 
					else
						Target:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Bounce )
						Target:setAlpha( 0.56 )
						Target:registerEventHandler( "transition_complete_keyframe", TargetFrame3 )
					end
				end
				
				Target:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
				Target:setAlpha( 1 )
				Target:setZRot( -90 )
				Target:registerEventHandler( "transition_complete_keyframe", TargetFrame2 )
				local TargetArrowLFrame2 = function ( TargetArrowL, event )
					local TargetArrowLFrame3 = function ( TargetArrowL, event )
						local TargetArrowLFrame4 = function ( TargetArrowL, event )
							if not event.interrupted then
								TargetArrowL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							end
							TargetArrowL:setLeftRight( false, false, -16, 16 )
							TargetArrowL:setTopBottom( false, false, 61, 93 )
							TargetArrowL:setAlpha( 1 )
							TargetArrowL:setZRot( 0 )
							if event.interrupted then
								self.clipFinished( TargetArrowL, event )
							else
								TargetArrowL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TargetArrowLFrame4( TargetArrowL, event )
							return 
						else
							TargetArrowL:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Bounce )
							TargetArrowL:setAlpha( 0 )
							TargetArrowL:registerEventHandler( "transition_complete_keyframe", TargetArrowLFrame4 )
						end
					end
					
					if event.interrupted then
						TargetArrowLFrame3( TargetArrowL, event )
						return 
					else
						TargetArrowL:beginAnimation( "keyframe", 229, false, true, CoD.TweenType.Linear )
						TargetArrowL:setTopBottom( false, false, 61, 93 )
						TargetArrowL:setAlpha( 1 )
						TargetArrowL:registerEventHandler( "transition_complete_keyframe", TargetArrowLFrame3 )
					end
				end
				
				TargetArrowL:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
				TargetArrowL:setLeftRight( false, false, -16, 16 )
				TargetArrowL:setTopBottom( false, false, 92, 124 )
				TargetArrowL:setAlpha( 0 )
				TargetArrowL:setZRot( 0 )
				TargetArrowL:registerEventHandler( "transition_complete_keyframe", TargetArrowLFrame2 )
				local TargetArrowUFrame2 = function ( TargetArrowU, event )
					local TargetArrowUFrame3 = function ( TargetArrowU, event )
						local TargetArrowUFrame4 = function ( TargetArrowU, event )
							if not event.interrupted then
								TargetArrowU:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							end
							TargetArrowU:setLeftRight( false, false, -16, 16 )
							TargetArrowU:setTopBottom( false, false, -97, -65 )
							TargetArrowU:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( TargetArrowU, event )
							else
								TargetArrowU:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TargetArrowUFrame4( TargetArrowU, event )
							return 
						else
							TargetArrowU:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Bounce )
							TargetArrowU:setAlpha( 0 )
							TargetArrowU:registerEventHandler( "transition_complete_keyframe", TargetArrowUFrame4 )
						end
					end
					
					if event.interrupted then
						TargetArrowUFrame3( TargetArrowU, event )
						return 
					else
						TargetArrowU:beginAnimation( "keyframe", 229, false, true, CoD.TweenType.Linear )
						TargetArrowU:setTopBottom( false, false, -97, -65 )
						TargetArrowU:setAlpha( 1 )
						TargetArrowU:registerEventHandler( "transition_complete_keyframe", TargetArrowUFrame3 )
					end
				end
				
				TargetArrowU:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
				TargetArrowU:setLeftRight( false, false, -16, 16 )
				TargetArrowU:setTopBottom( false, false, -124, -92 )
				TargetArrowU:setAlpha( 0 )
				TargetArrowU:registerEventHandler( "transition_complete_keyframe", TargetArrowUFrame2 )
				local TargetLineRFrame2 = function ( TargetLineR, event )
					local TargetLineRFrame3 = function ( TargetLineR, event )
						local TargetLineRFrame4 = function ( TargetLineR, event )
							if not event.interrupted then
								TargetLineR:beginAnimation( "keyframe", 209, true, true, CoD.TweenType.Linear )
							end
							TargetLineR:setLeftRight( false, false, 61, 85 )
							TargetLineR:setTopBottom( false, false, -4, 4 )
							TargetLineR:setAlpha( 1 )
							TargetLineR:setZRot( 0 )
							if event.interrupted then
								self.clipFinished( TargetLineR, event )
							else
								TargetLineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TargetLineRFrame4( TargetLineR, event )
							return 
						else
							TargetLineR:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
							TargetLineR:setLeftRight( false, false, 51.42, 75.42 )
							TargetLineR:setTopBottom( false, false, 0.85, 8.85 )
							TargetLineR:setZRot( -11.81 )
							TargetLineR:registerEventHandler( "transition_complete_keyframe", TargetLineRFrame4 )
						end
					end
					
					if event.interrupted then
						TargetLineRFrame3( TargetLineR, event )
						return 
					else
						TargetLineR:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						TargetLineR:setLeftRight( false, false, 1.31, 25.31 )
						TargetLineR:setTopBottom( false, false, 26.25, 34.25 )
						TargetLineR:setAlpha( 0 )
						TargetLineR:setZRot( -73.59 )
						TargetLineR:registerEventHandler( "transition_complete_keyframe", TargetLineRFrame3 )
					end
				end
				
				TargetLineR:completeAnimation()
				self.TargetLineR:setLeftRight( false, false, -12, 12 )
				self.TargetLineR:setTopBottom( false, false, 33, 41 )
				self.TargetLineR:setAlpha( 1 )
				self.TargetLineR:setZRot( -90 )
				TargetLineRFrame2( TargetLineR, {} )
				local TargetLineLFrame2 = function ( TargetLineL, event )
					local TargetLineLFrame3 = function ( TargetLineL, event )
						local TargetLineLFrame4 = function ( TargetLineL, event )
							if not event.interrupted then
								TargetLineL:beginAnimation( "keyframe", 209, true, true, CoD.TweenType.Linear )
							end
							TargetLineL:setLeftRight( false, false, -83, -59 )
							TargetLineL:setTopBottom( false, false, -4, 4 )
							TargetLineL:setAlpha( 1 )
							TargetLineL:setZRot( 0 )
							if event.interrupted then
								self.clipFinished( TargetLineL, event )
							else
								TargetLineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TargetLineLFrame4( TargetLineL, event )
							return 
						else
							TargetLineL:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
							TargetLineL:setLeftRight( false, false, -73.69, -49.69 )
							TargetLineL:setTopBottom( false, false, -8.72, -0.72 )
							TargetLineL:setZRot( 11.81 )
							TargetLineL:registerEventHandler( "transition_complete_keyframe", TargetLineLFrame4 )
						end
					end
					
					if event.interrupted then
						TargetLineLFrame3( TargetLineL, event )
						return 
					else
						TargetLineL:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						TargetLineL:setLeftRight( false, false, -24.95, -0.95 )
						TargetLineL:setTopBottom( false, false, -33.43, -25.43 )
						TargetLineL:setAlpha( 0 )
						TargetLineL:setZRot( 73.59 )
						TargetLineL:registerEventHandler( "transition_complete_keyframe", TargetLineLFrame3 )
					end
				end
				
				TargetLineL:completeAnimation()
				self.TargetLineL:setLeftRight( false, false, -12, 12 )
				self.TargetLineL:setTopBottom( false, false, -40, -32 )
				self.TargetLineL:setAlpha( 1 )
				self.TargetLineL:setZRot( 90 )
				TargetLineLFrame2( TargetLineL, {} )
				local EnemyTargetArrowAnim0Frame2 = function ( EnemyTargetArrowAnim0, event )
					local EnemyTargetArrowAnim0Frame3 = function ( EnemyTargetArrowAnim0, event )
						local EnemyTargetArrowAnim0Frame4 = function ( EnemyTargetArrowAnim0, event )
							local EnemyTargetArrowAnim0Frame5 = function ( EnemyTargetArrowAnim0, event )
								local EnemyTargetArrowAnim0Frame6 = function ( EnemyTargetArrowAnim0, event )
									if not event.interrupted then
										EnemyTargetArrowAnim0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
									end
									EnemyTargetArrowAnim0:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( EnemyTargetArrowAnim0, event )
									else
										EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									EnemyTargetArrowAnim0Frame6( EnemyTargetArrowAnim0, event )
									return 
								else
									EnemyTargetArrowAnim0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
									EnemyTargetArrowAnim0:setAlpha( 0.55 )
									EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame6 )
								end
							end
							
							if event.interrupted then
								EnemyTargetArrowAnim0Frame5( EnemyTargetArrowAnim0, event )
								return 
							else
								EnemyTargetArrowAnim0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
								EnemyTargetArrowAnim0:setAlpha( 0 )
								EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame5 )
							end
						end
						
						if event.interrupted then
							EnemyTargetArrowAnim0Frame4( EnemyTargetArrowAnim0, event )
							return 
						else
							EnemyTargetArrowAnim0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
							EnemyTargetArrowAnim0:setAlpha( 1 )
							EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame4 )
						end
					end
					
					if event.interrupted then
						EnemyTargetArrowAnim0Frame3( EnemyTargetArrowAnim0, event )
						return 
					else
						EnemyTargetArrowAnim0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Bounce )
						EnemyTargetArrowAnim0:setAlpha( 0 )
						EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame3 )
					end
				end
				
				EnemyTargetArrowAnim0:completeAnimation()
				self.EnemyTargetArrowAnim0:setAlpha( 1 )
				EnemyTargetArrowAnim0Frame2( EnemyTargetArrowAnim0, {} )
				local EnemyTargetArrowAnim1Frame2 = function ( EnemyTargetArrowAnim1, event )
					local EnemyTargetArrowAnim1Frame3 = function ( EnemyTargetArrowAnim1, event )
						local EnemyTargetArrowAnim1Frame4 = function ( EnemyTargetArrowAnim1, event )
							local EnemyTargetArrowAnim1Frame5 = function ( EnemyTargetArrowAnim1, event )
								local EnemyTargetArrowAnim1Frame6 = function ( EnemyTargetArrowAnim1, event )
									if not event.interrupted then
										EnemyTargetArrowAnim1:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
									end
									EnemyTargetArrowAnim1:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( EnemyTargetArrowAnim1, event )
									else
										EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									EnemyTargetArrowAnim1Frame6( EnemyTargetArrowAnim1, event )
									return 
								else
									EnemyTargetArrowAnim1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
									EnemyTargetArrowAnim1:setAlpha( 0.5 )
									EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame6 )
								end
							end
							
							if event.interrupted then
								EnemyTargetArrowAnim1Frame5( EnemyTargetArrowAnim1, event )
								return 
							else
								EnemyTargetArrowAnim1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
								EnemyTargetArrowAnim1:setAlpha( 0 )
								EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame5 )
							end
						end
						
						if event.interrupted then
							EnemyTargetArrowAnim1Frame4( EnemyTargetArrowAnim1, event )
							return 
						else
							EnemyTargetArrowAnim1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
							EnemyTargetArrowAnim1:setAlpha( 1 )
							EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame4 )
						end
					end
					
					if event.interrupted then
						EnemyTargetArrowAnim1Frame3( EnemyTargetArrowAnim1, event )
						return 
					else
						EnemyTargetArrowAnim1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Bounce )
						EnemyTargetArrowAnim1:setAlpha( 0 )
						EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame3 )
					end
				end
				
				EnemyTargetArrowAnim1:completeAnimation()
				self.EnemyTargetArrowAnim1:setAlpha( 1 )
				EnemyTargetArrowAnim1Frame2( EnemyTargetArrowAnim1, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 14 )
				local LockBlurFrame2 = function ( LockBlur, event )
					if not event.interrupted then
						LockBlur:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
					end
					LockBlur:setLeftRight( false, false, -100, 100 )
					LockBlur:setTopBottom( false, false, -100, 100 )
					LockBlur:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LockBlur, event )
					else
						LockBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockBlur:completeAnimation()
				self.LockBlur:setLeftRight( false, false, -100, 100 )
				self.LockBlur:setTopBottom( false, false, -100, 100 )
				self.LockBlur:setAlpha( 1 )
				LockBlurFrame2( LockBlur, {} )
				local LockGlowFrame2 = function ( LockGlow, event )
					if not event.interrupted then
						LockGlow:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Linear )
					end
					LockGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LockGlow, event )
					else
						LockGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LockGlow:completeAnimation()
				self.LockGlow:setAlpha( 1 )
				LockGlowFrame2( LockGlow, {} )
				local LockLineRedLRFrame2 = function ( LockLineRedLR, event )
					local LockLineRedLRFrame3 = function ( LockLineRedLR, event )
						local LockLineRedLRFrame4 = function ( LockLineRedLR, event )
							local LockLineRedLRFrame5 = function ( LockLineRedLR, event )
								local LockLineRedLRFrame6 = function ( LockLineRedLR, event )
									if not event.interrupted then
										LockLineRedLR:beginAnimation( "keyframe", 210, false, true, CoD.TweenType.Linear )
									end
									LockLineRedLR:setLeftRight( false, false, 50, 86 )
									LockLineRedLR:setTopBottom( false, false, 78, 114 )
									LockLineRedLR:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( LockLineRedLR, event )
									else
										LockLineRedLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LockLineRedLRFrame6( LockLineRedLR, event )
									return 
								else
									LockLineRedLR:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									LockLineRedLR:setAlpha( 1 )
									LockLineRedLR:registerEventHandler( "transition_complete_keyframe", LockLineRedLRFrame6 )
								end
							end
							
							if event.interrupted then
								LockLineRedLRFrame5( LockLineRedLR, event )
								return 
							else
								LockLineRedLR:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
								LockLineRedLR:setAlpha( 0 )
								LockLineRedLR:registerEventHandler( "transition_complete_keyframe", LockLineRedLRFrame5 )
							end
						end
						
						if event.interrupted then
							LockLineRedLRFrame4( LockLineRedLR, event )
							return 
						else
							LockLineRedLR:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Bounce )
							LockLineRedLR:setAlpha( 1 )
							LockLineRedLR:registerEventHandler( "transition_complete_keyframe", LockLineRedLRFrame4 )
						end
					end
					
					if event.interrupted then
						LockLineRedLRFrame3( LockLineRedLR, event )
						return 
					else
						LockLineRedLR:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						LockLineRedLR:setAlpha( 0.48 )
						LockLineRedLR:registerEventHandler( "transition_complete_keyframe", LockLineRedLRFrame3 )
					end
				end
				
				LockLineRedLR:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				LockLineRedLR:setLeftRight( false, false, 32, 68 )
				LockLineRedLR:setTopBottom( false, false, 53, 89 )
				LockLineRedLR:setAlpha( 1 )
				LockLineRedLR:registerEventHandler( "transition_complete_keyframe", LockLineRedLRFrame2 )
				local LockLineRedLLFrame2 = function ( LockLineRedLL, event )
					local LockLineRedLLFrame3 = function ( LockLineRedLL, event )
						local LockLineRedLLFrame4 = function ( LockLineRedLL, event )
							local LockLineRedLLFrame5 = function ( LockLineRedLL, event )
								local LockLineRedLLFrame6 = function ( LockLineRedLL, event )
									if not event.interrupted then
										LockLineRedLL:beginAnimation( "keyframe", 210, false, true, CoD.TweenType.Linear )
									end
									LockLineRedLL:setLeftRight( false, false, -91, -55 )
									LockLineRedLL:setTopBottom( false, false, 78, 114 )
									LockLineRedLL:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( LockLineRedLL, event )
									else
										LockLineRedLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LockLineRedLLFrame6( LockLineRedLL, event )
									return 
								else
									LockLineRedLL:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									LockLineRedLL:setAlpha( 1 )
									LockLineRedLL:registerEventHandler( "transition_complete_keyframe", LockLineRedLLFrame6 )
								end
							end
							
							if event.interrupted then
								LockLineRedLLFrame5( LockLineRedLL, event )
								return 
							else
								LockLineRedLL:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
								LockLineRedLL:setAlpha( 0 )
								LockLineRedLL:registerEventHandler( "transition_complete_keyframe", LockLineRedLLFrame5 )
							end
						end
						
						if event.interrupted then
							LockLineRedLLFrame4( LockLineRedLL, event )
							return 
						else
							LockLineRedLL:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Bounce )
							LockLineRedLL:setAlpha( 1 )
							LockLineRedLL:registerEventHandler( "transition_complete_keyframe", LockLineRedLLFrame4 )
						end
					end
					
					if event.interrupted then
						LockLineRedLLFrame3( LockLineRedLL, event )
						return 
					else
						LockLineRedLL:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						LockLineRedLL:setAlpha( 0.46 )
						LockLineRedLL:registerEventHandler( "transition_complete_keyframe", LockLineRedLLFrame3 )
					end
				end
				
				LockLineRedLL:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				LockLineRedLL:setLeftRight( false, false, -67, -31 )
				LockLineRedLL:setTopBottom( false, false, 53, 89 )
				LockLineRedLL:setAlpha( 1 )
				LockLineRedLL:registerEventHandler( "transition_complete_keyframe", LockLineRedLLFrame2 )
				local LockLineRedURFrame2 = function ( LockLineRedUR, event )
					local LockLineRedURFrame3 = function ( LockLineRedUR, event )
						local LockLineRedURFrame4 = function ( LockLineRedUR, event )
							local LockLineRedURFrame5 = function ( LockLineRedUR, event )
								local LockLineRedURFrame6 = function ( LockLineRedUR, event )
									if not event.interrupted then
										LockLineRedUR:beginAnimation( "keyframe", 210, false, true, CoD.TweenType.Linear )
									end
									LockLineRedUR:setLeftRight( false, false, 50, 86 )
									LockLineRedUR:setTopBottom( false, false, -100, -64 )
									LockLineRedUR:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( LockLineRedUR, event )
									else
										LockLineRedUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LockLineRedURFrame6( LockLineRedUR, event )
									return 
								else
									LockLineRedUR:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									LockLineRedUR:setAlpha( 1 )
									LockLineRedUR:registerEventHandler( "transition_complete_keyframe", LockLineRedURFrame6 )
								end
							end
							
							if event.interrupted then
								LockLineRedURFrame5( LockLineRedUR, event )
								return 
							else
								LockLineRedUR:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
								LockLineRedUR:setAlpha( 0 )
								LockLineRedUR:registerEventHandler( "transition_complete_keyframe", LockLineRedURFrame5 )
							end
						end
						
						if event.interrupted then
							LockLineRedURFrame4( LockLineRedUR, event )
							return 
						else
							LockLineRedUR:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Bounce )
							LockLineRedUR:setAlpha( 1 )
							LockLineRedUR:registerEventHandler( "transition_complete_keyframe", LockLineRedURFrame4 )
						end
					end
					
					if event.interrupted then
						LockLineRedURFrame3( LockLineRedUR, event )
						return 
					else
						LockLineRedUR:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						LockLineRedUR:setAlpha( 0.55 )
						LockLineRedUR:registerEventHandler( "transition_complete_keyframe", LockLineRedURFrame3 )
					end
				end
				
				LockLineRedUR:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				LockLineRedUR:setLeftRight( false, false, 32, 68 )
				LockLineRedUR:setTopBottom( false, false, -85, -49 )
				LockLineRedUR:setAlpha( 1 )
				LockLineRedUR:registerEventHandler( "transition_complete_keyframe", LockLineRedURFrame2 )
				local LockLineRedULFrame2 = function ( LockLineRedUL, event )
					local LockLineRedULFrame3 = function ( LockLineRedUL, event )
						local LockLineRedULFrame4 = function ( LockLineRedUL, event )
							local LockLineRedULFrame5 = function ( LockLineRedUL, event )
								local LockLineRedULFrame6 = function ( LockLineRedUL, event )
									if not event.interrupted then
										LockLineRedUL:beginAnimation( "keyframe", 210, false, true, CoD.TweenType.Linear )
									end
									LockLineRedUL:setLeftRight( false, false, -93, -57 )
									LockLineRedUL:setTopBottom( false, false, -100, -64 )
									LockLineRedUL:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( LockLineRedUL, event )
									else
										LockLineRedUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LockLineRedULFrame6( LockLineRedUL, event )
									return 
								else
									LockLineRedUL:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									LockLineRedUL:setAlpha( 1 )
									LockLineRedUL:registerEventHandler( "transition_complete_keyframe", LockLineRedULFrame6 )
								end
							end
							
							if event.interrupted then
								LockLineRedULFrame5( LockLineRedUL, event )
								return 
							else
								LockLineRedUL:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
								LockLineRedUL:setAlpha( 0 )
								LockLineRedUL:registerEventHandler( "transition_complete_keyframe", LockLineRedULFrame5 )
							end
						end
						
						if event.interrupted then
							LockLineRedULFrame4( LockLineRedUL, event )
							return 
						else
							LockLineRedUL:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Bounce )
							LockLineRedUL:setAlpha( 1 )
							LockLineRedUL:registerEventHandler( "transition_complete_keyframe", LockLineRedULFrame4 )
						end
					end
					
					if event.interrupted then
						LockLineRedULFrame3( LockLineRedUL, event )
						return 
					else
						LockLineRedUL:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						LockLineRedUL:setAlpha( 0.48 )
						LockLineRedUL:registerEventHandler( "transition_complete_keyframe", LockLineRedULFrame3 )
					end
				end
				
				LockLineRedUL:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				LockLineRedUL:setLeftRight( false, false, -67, -31 )
				LockLineRedUL:setTopBottom( false, false, -85, -49 )
				LockLineRedUL:setAlpha( 1 )
				LockLineRedUL:registerEventHandler( "transition_complete_keyframe", LockLineRedULFrame2 )
				local LockTargetFrame2 = function ( LockTarget, event )
					local LockTargetFrame3 = function ( LockTarget, event )
						local LockTargetFrame4 = function ( LockTarget, event )
							if not event.interrupted then
								LockTarget:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
							end
							LockTarget:setLeftRight( false, false, -50, 50 )
							LockTarget:setTopBottom( false, false, -92, 92 )
							LockTarget:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( LockTarget, event )
							else
								LockTarget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LockTargetFrame4( LockTarget, event )
							return 
						else
							LockTarget:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
							LockTarget:setAlpha( 1 )
							LockTarget:registerEventHandler( "transition_complete_keyframe", LockTargetFrame4 )
						end
					end
					
					if event.interrupted then
						LockTargetFrame3( LockTarget, event )
						return 
					else
						LockTarget:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
						LockTarget:setAlpha( 0 )
						LockTarget:registerEventHandler( "transition_complete_keyframe", LockTargetFrame3 )
					end
				end
				
				LockTarget:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				LockTarget:setLeftRight( false, false, -50, 50 )
				LockTarget:setTopBottom( false, false, -92, 92 )
				LockTarget:setAlpha( 1 )
				LockTarget:registerEventHandler( "transition_complete_keyframe", LockTargetFrame2 )
				local TargetFrame2 = function ( Target, event )
					local TargetFrame3 = function ( Target, event )
						local TargetFrame4 = function ( Target, event )
							local TargetFrame5 = function ( Target, event )
								local TargetFrame6 = function ( Target, event )
									if not event.interrupted then
										Target:beginAnimation( "keyframe", 319, false, true, CoD.TweenType.Back )
									end
									Target:setAlpha( 0 )
									Target:setZRot( -90 )
									if event.interrupted then
										self.clipFinished( Target, event )
									else
										Target:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									TargetFrame6( Target, event )
									return 
								else
									Target:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
									Target:setAlpha( 1 )
									Target:registerEventHandler( "transition_complete_keyframe", TargetFrame6 )
								end
							end
							
							if event.interrupted then
								TargetFrame5( Target, event )
								return 
							else
								Target:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
								Target:setAlpha( 0 )
								Target:registerEventHandler( "transition_complete_keyframe", TargetFrame5 )
							end
						end
						
						if event.interrupted then
							TargetFrame4( Target, event )
							return 
						else
							Target:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Bounce )
							Target:setAlpha( 1 )
							Target:registerEventHandler( "transition_complete_keyframe", TargetFrame4 )
						end
					end
					
					if event.interrupted then
						TargetFrame3( Target, event )
						return 
					else
						Target:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Bounce )
						Target:setAlpha( 0.53 )
						Target:registerEventHandler( "transition_complete_keyframe", TargetFrame3 )
					end
				end
				
				Target:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				Target:setAlpha( 1 )
				Target:setZRot( -90 )
				Target:registerEventHandler( "transition_complete_keyframe", TargetFrame2 )
				local TargetArrowLFrame2 = function ( TargetArrowL, event )
					if not event.interrupted then
						TargetArrowL:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
					end
					TargetArrowL:setLeftRight( false, false, -16, 16 )
					TargetArrowL:setTopBottom( false, false, 10, 42 )
					TargetArrowL:setAlpha( 0 )
					TargetArrowL:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( TargetArrowL, event )
					else
						TargetArrowL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TargetArrowL:completeAnimation()
				self.TargetArrowL:setLeftRight( false, false, -16, 16 )
				self.TargetArrowL:setTopBottom( false, false, 92, 124 )
				self.TargetArrowL:setAlpha( 0 )
				self.TargetArrowL:setZRot( 0 )
				TargetArrowLFrame2( TargetArrowL, {} )
				local TargetArrowUFrame2 = function ( TargetArrowU, event )
					if not event.interrupted then
						TargetArrowU:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
					end
					TargetArrowU:setLeftRight( false, false, -16, 16 )
					TargetArrowU:setTopBottom( false, false, -43, -11 )
					TargetArrowU:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TargetArrowU, event )
					else
						TargetArrowU:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TargetArrowU:completeAnimation()
				self.TargetArrowU:setLeftRight( false, false, -16, 16 )
				self.TargetArrowU:setTopBottom( false, false, -124, -92 )
				self.TargetArrowU:setAlpha( 0 )
				TargetArrowUFrame2( TargetArrowU, {} )
				local TargetLineRFrame2 = function ( TargetLineR, event )
					local TargetLineRFrame3 = function ( TargetLineR, event )
						if not event.interrupted then
							TargetLineR:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Linear )
						end
						TargetLineR:setLeftRight( false, false, -12, 12 )
						TargetLineR:setTopBottom( false, false, -4, 4 )
						TargetLineR:setAlpha( 0 )
						TargetLineR:setZRot( -90 )
						if event.interrupted then
							self.clipFinished( TargetLineR, event )
						else
							TargetLineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TargetLineRFrame3( TargetLineR, event )
						return 
					else
						TargetLineR:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						TargetLineR:setTopBottom( false, false, -4, 4 )
						TargetLineR:setAlpha( 0.06 )
						TargetLineR:registerEventHandler( "transition_complete_keyframe", TargetLineRFrame3 )
					end
				end
				
				TargetLineR:completeAnimation()
				self.TargetLineR:setLeftRight( false, false, -12, 12 )
				self.TargetLineR:setTopBottom( false, false, 33, 41 )
				self.TargetLineR:setAlpha( 1 )
				self.TargetLineR:setZRot( -90 )
				TargetLineRFrame2( TargetLineR, {} )
				local TargetLineLFrame2 = function ( TargetLineL, event )
					local TargetLineLFrame3 = function ( TargetLineL, event )
						if not event.interrupted then
							TargetLineL:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Linear )
						end
						TargetLineL:setLeftRight( false, false, -12, 12 )
						TargetLineL:setTopBottom( false, false, -8, 0 )
						TargetLineL:setAlpha( 0 )
						TargetLineL:setZRot( 90 )
						if event.interrupted then
							self.clipFinished( TargetLineL, event )
						else
							TargetLineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TargetLineLFrame3( TargetLineL, event )
						return 
					else
						TargetLineL:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						TargetLineL:setTopBottom( false, false, -8, 0 )
						TargetLineL:setAlpha( 0.06 )
						TargetLineL:registerEventHandler( "transition_complete_keyframe", TargetLineLFrame3 )
					end
				end
				
				TargetLineL:completeAnimation()
				self.TargetLineL:setLeftRight( false, false, -12, 12 )
				self.TargetLineL:setTopBottom( false, false, -40, -32 )
				self.TargetLineL:setAlpha( 1 )
				self.TargetLineL:setZRot( 90 )
				TargetLineLFrame2( TargetLineL, {} )
				local EnemyTargetArrowAnim0Frame2 = function ( EnemyTargetArrowAnim0, event )
					local EnemyTargetArrowAnim0Frame3 = function ( EnemyTargetArrowAnim0, event )
						local EnemyTargetArrowAnim0Frame4 = function ( EnemyTargetArrowAnim0, event )
							local EnemyTargetArrowAnim0Frame5 = function ( EnemyTargetArrowAnim0, event )
								local EnemyTargetArrowAnim0Frame6 = function ( EnemyTargetArrowAnim0, event )
									if not event.interrupted then
										EnemyTargetArrowAnim0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									end
									EnemyTargetArrowAnim0:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( EnemyTargetArrowAnim0, event )
									else
										EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									EnemyTargetArrowAnim0Frame6( EnemyTargetArrowAnim0, event )
									return 
								else
									EnemyTargetArrowAnim0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
									EnemyTargetArrowAnim0:setAlpha( 0.5 )
									EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame6 )
								end
							end
							
							if event.interrupted then
								EnemyTargetArrowAnim0Frame5( EnemyTargetArrowAnim0, event )
								return 
							else
								EnemyTargetArrowAnim0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
								EnemyTargetArrowAnim0:setAlpha( 0 )
								EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame5 )
							end
						end
						
						if event.interrupted then
							EnemyTargetArrowAnim0Frame4( EnemyTargetArrowAnim0, event )
							return 
						else
							EnemyTargetArrowAnim0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							EnemyTargetArrowAnim0:setAlpha( 1 )
							EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame4 )
						end
					end
					
					if event.interrupted then
						EnemyTargetArrowAnim0Frame3( EnemyTargetArrowAnim0, event )
						return 
					else
						EnemyTargetArrowAnim0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
						EnemyTargetArrowAnim0:setAlpha( 0 )
						EnemyTargetArrowAnim0:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim0Frame3 )
					end
				end
				
				EnemyTargetArrowAnim0:completeAnimation()
				self.EnemyTargetArrowAnim0:setAlpha( 1 )
				EnemyTargetArrowAnim0Frame2( EnemyTargetArrowAnim0, {} )
				local EnemyTargetArrowAnim1Frame2 = function ( EnemyTargetArrowAnim1, event )
					local EnemyTargetArrowAnim1Frame3 = function ( EnemyTargetArrowAnim1, event )
						local EnemyTargetArrowAnim1Frame4 = function ( EnemyTargetArrowAnim1, event )
							local EnemyTargetArrowAnim1Frame5 = function ( EnemyTargetArrowAnim1, event )
								local EnemyTargetArrowAnim1Frame6 = function ( EnemyTargetArrowAnim1, event )
									if not event.interrupted then
										EnemyTargetArrowAnim1:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									end
									EnemyTargetArrowAnim1:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( EnemyTargetArrowAnim1, event )
									else
										EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									EnemyTargetArrowAnim1Frame6( EnemyTargetArrowAnim1, event )
									return 
								else
									EnemyTargetArrowAnim1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
									EnemyTargetArrowAnim1:setAlpha( 0.5 )
									EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame6 )
								end
							end
							
							if event.interrupted then
								EnemyTargetArrowAnim1Frame5( EnemyTargetArrowAnim1, event )
								return 
							else
								EnemyTargetArrowAnim1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
								EnemyTargetArrowAnim1:setAlpha( 0 )
								EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame5 )
							end
						end
						
						if event.interrupted then
							EnemyTargetArrowAnim1Frame4( EnemyTargetArrowAnim1, event )
							return 
						else
							EnemyTargetArrowAnim1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							EnemyTargetArrowAnim1:setAlpha( 1 )
							EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame4 )
						end
					end
					
					if event.interrupted then
						EnemyTargetArrowAnim1Frame3( EnemyTargetArrowAnim1, event )
						return 
					else
						EnemyTargetArrowAnim1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
						EnemyTargetArrowAnim1:setAlpha( 0 )
						EnemyTargetArrowAnim1:registerEventHandler( "transition_complete_keyframe", EnemyTargetArrowAnim1Frame3 )
					end
				end
				
				EnemyTargetArrowAnim1:completeAnimation()
				self.EnemyTargetArrowAnim1:setAlpha( 1 )
				EnemyTargetArrowAnim1Frame2( EnemyTargetArrowAnim1, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Target",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "targetState", Enum.EnemyTargetStates.ENEMY_TARGET_OUT_OF_RANGE )
			end
		},
		{
			stateName = "Lock",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "targetState", Enum.EnemyTargetStates.ENEMY_TARGET_LOCKED )
			end
		}
	} )
	self:linkToElementModel( self, "targetState", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "targetState"
		} )
	end )
	self.close = function ( self )
		self.Target:close()
		self.EnemyTargetArrowAnim0:close()
		self.EnemyTargetArrowAnim1:close()
		CoD.EnemyTargetInternal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

