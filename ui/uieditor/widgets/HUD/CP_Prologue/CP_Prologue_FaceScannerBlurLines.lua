-- 7bb3d666eb56b629e732ad20a94f1be7
-- This hash is used for caching, delete to decompile the file again

CoD.CP_Prologue_FaceScannerBlurLines = InheritFrom( LUI.UIElement )
CoD.CP_Prologue_FaceScannerBlurLines.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CP_Prologue_FaceScannerBlurLines )
	self.id = "CP_Prologue_FaceScannerBlurLines"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 361 )
	self:setTopBottom( true, false, 0, 361 )
	
	local CenterReticleQuadLinesBlur = LUI.UIImage.new()
	CenterReticleQuadLinesBlur:setLeftRight( false, false, -180.5, 180.5 )
	CenterReticleQuadLinesBlur:setTopBottom( false, false, -180.5, 180.5 )
	CenterReticleQuadLinesBlur:setRGB( 0.25, 0.25, 0.25 )
	CenterReticleQuadLinesBlur:setAlpha( 0.8 )
	CenterReticleQuadLinesBlur:setScale( 0.5 )
	CenterReticleQuadLinesBlur:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlecenterouterlinergb" ) )
	CenterReticleQuadLinesBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleQuadLinesBlur )
	self.CenterReticleQuadLinesBlur = CenterReticleQuadLinesBlur
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local CenterReticleQuadLinesBlurFrame2 = function ( CenterReticleQuadLinesBlur, event )
					local CenterReticleQuadLinesBlurFrame3 = function ( CenterReticleQuadLinesBlur, event )
						local CenterReticleQuadLinesBlurFrame4 = function ( CenterReticleQuadLinesBlur, event )
							local CenterReticleQuadLinesBlurFrame5 = function ( CenterReticleQuadLinesBlur, event )
								local CenterReticleQuadLinesBlurFrame6 = function ( CenterReticleQuadLinesBlur, event )
									if not event.interrupted then
										CenterReticleQuadLinesBlur:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
									end
									CenterReticleQuadLinesBlur:setAlpha( 0.8 )
									CenterReticleQuadLinesBlur:setZRot( 90 )
									if event.interrupted then
										self.clipFinished( CenterReticleQuadLinesBlur, event )
									else
										CenterReticleQuadLinesBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									CenterReticleQuadLinesBlurFrame6( CenterReticleQuadLinesBlur, event )
									return 
								else
									CenterReticleQuadLinesBlur:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
									CenterReticleQuadLinesBlur:setAlpha( 0 )
									CenterReticleQuadLinesBlur:registerEventHandler( "transition_complete_keyframe", CenterReticleQuadLinesBlurFrame6 )
								end
							end
							
							if event.interrupted then
								CenterReticleQuadLinesBlurFrame5( CenterReticleQuadLinesBlur, event )
								return 
							else
								CenterReticleQuadLinesBlur:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								CenterReticleQuadLinesBlur:setAlpha( 0.8 )
								CenterReticleQuadLinesBlur:registerEventHandler( "transition_complete_keyframe", CenterReticleQuadLinesBlurFrame5 )
							end
						end
						
						if event.interrupted then
							CenterReticleQuadLinesBlurFrame4( CenterReticleQuadLinesBlur, event )
							return 
						else
							CenterReticleQuadLinesBlur:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							CenterReticleQuadLinesBlur:setAlpha( 0 )
							CenterReticleQuadLinesBlur:registerEventHandler( "transition_complete_keyframe", CenterReticleQuadLinesBlurFrame4 )
						end
					end
					
					if event.interrupted then
						CenterReticleQuadLinesBlurFrame3( CenterReticleQuadLinesBlur, event )
						return 
					else
						CenterReticleQuadLinesBlur:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						CenterReticleQuadLinesBlur:setZRot( 90 )
						CenterReticleQuadLinesBlur:registerEventHandler( "transition_complete_keyframe", CenterReticleQuadLinesBlurFrame3 )
					end
				end
				
				CenterReticleQuadLinesBlur:completeAnimation()
				self.CenterReticleQuadLinesBlur:setAlpha( 0.8 )
				self.CenterReticleQuadLinesBlur:setZRot( 0 )
				CenterReticleQuadLinesBlurFrame2( CenterReticleQuadLinesBlur, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Scanning = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Found = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Failed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

