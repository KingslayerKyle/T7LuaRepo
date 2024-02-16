-- df27efbbe95373bd5d25a37eec7894f1
-- This hash is used for caching, delete to decompile the file again

CoD.DamageWidget_IconEnviroHazardMeterBottom = InheritFrom( LUI.UIElement )
CoD.DamageWidget_IconEnviroHazardMeterBottom.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_IconEnviroHazardMeterBottom )
	self.id = "DamageWidget_IconEnviroHazardMeterBottom"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 53 )
	self:setTopBottom( true, false, 0, 24 )
	
	local ImgMeterEnvBack = LUI.UIImage.new()
	ImgMeterEnvBack:setLeftRight( false, false, -26.5, 26.83 )
	ImgMeterEnvBack:setTopBottom( false, false, -12, 12 )
	ImgMeterEnvBack:setRGB( 0.79, 0.88, 0 )
	ImgMeterEnvBack:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_hess_meterback" ) )
	ImgMeterEnvBack:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( ImgMeterEnvBack )
	self.ImgMeterEnvBack = ImgMeterEnvBack
	
	local ImgMeterEnvFill = LUI.UIImage.new()
	ImgMeterEnvFill:setLeftRight( false, false, -24.5, 24.83 )
	ImgMeterEnvFill:setTopBottom( false, false, -10, 10 )
	ImgMeterEnvFill:setRGB( 0.79, 0.88, 0 )
	ImgMeterEnvFill:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_hess_meterfill" ) )
	ImgMeterEnvFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_angled_wipe_normal" ) )
	ImgMeterEnvFill:setShaderVector( 0, 1, 0, 0, 0 )
	ImgMeterEnvFill:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( ImgMeterEnvFill )
	self.ImgMeterEnvFill = ImgMeterEnvFill
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 128, 151 )
	Image0:setTopBottom( true, false, 5, 19 )
	Image0:setRGB( 0.92, 0.07, 0.07 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 178.5, 201.5 )
	Image1:setTopBottom( true, false, 5, 19 )
	Image1:setRGB( 0.79, 0.88, 0 )
	Image1:setAlpha( 0 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				ImgMeterEnvBack:completeAnimation()
				self.ImgMeterEnvBack:setRGB( 0.79, 0.88, 0 )
				self.clipFinished( ImgMeterEnvBack, {} )

				ImgMeterEnvFill:completeAnimation()
				self.ImgMeterEnvFill:setRGB( 0.79, 0.88, 0 )
				self.ImgMeterEnvFill:setAlpha( 1 )
				self.clipFinished( ImgMeterEnvFill, {} )
			end
		},
		Critical = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				ImgMeterEnvBack:completeAnimation()
				self.ImgMeterEnvBack:setRGB( 1, 0, 0 )
				self.clipFinished( ImgMeterEnvBack, {} )
				local ImgMeterEnvFillFrame2 = function ( ImgMeterEnvFill, event )
					local ImgMeterEnvFillFrame3 = function ( ImgMeterEnvFill, event )
						local ImgMeterEnvFillFrame4 = function ( ImgMeterEnvFill, event )
							local ImgMeterEnvFillFrame5 = function ( ImgMeterEnvFill, event )
								local ImgMeterEnvFillFrame6 = function ( ImgMeterEnvFill, event )
									local ImgMeterEnvFillFrame7 = function ( ImgMeterEnvFill, event )
										local ImgMeterEnvFillFrame8 = function ( ImgMeterEnvFill, event )
											if not event.interrupted then
												ImgMeterEnvFill:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
											end
											ImgMeterEnvFill:setRGB( 0.88, 0.1, 0 )
											ImgMeterEnvFill:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( ImgMeterEnvFill, event )
											else
												ImgMeterEnvFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											ImgMeterEnvFillFrame8( ImgMeterEnvFill, event )
											return 
										else
											ImgMeterEnvFill:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											ImgMeterEnvFill:setAlpha( 1 )
											ImgMeterEnvFill:registerEventHandler( "transition_complete_keyframe", ImgMeterEnvFillFrame8 )
										end
									end
									
									if event.interrupted then
										ImgMeterEnvFillFrame7( ImgMeterEnvFill, event )
										return 
									else
										ImgMeterEnvFill:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
										ImgMeterEnvFill:setAlpha( 0.15 )
										ImgMeterEnvFill:registerEventHandler( "transition_complete_keyframe", ImgMeterEnvFillFrame7 )
									end
								end
								
								if event.interrupted then
									ImgMeterEnvFillFrame6( ImgMeterEnvFill, event )
									return 
								else
									ImgMeterEnvFill:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									ImgMeterEnvFill:registerEventHandler( "transition_complete_keyframe", ImgMeterEnvFillFrame6 )
								end
							end
							
							if event.interrupted then
								ImgMeterEnvFillFrame5( ImgMeterEnvFill, event )
								return 
							else
								ImgMeterEnvFill:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								ImgMeterEnvFill:setAlpha( 0.65 )
								ImgMeterEnvFill:registerEventHandler( "transition_complete_keyframe", ImgMeterEnvFillFrame5 )
							end
						end
						
						if event.interrupted then
							ImgMeterEnvFillFrame4( ImgMeterEnvFill, event )
							return 
						else
							ImgMeterEnvFill:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							ImgMeterEnvFill:registerEventHandler( "transition_complete_keyframe", ImgMeterEnvFillFrame4 )
						end
					end
					
					if event.interrupted then
						ImgMeterEnvFillFrame3( ImgMeterEnvFill, event )
						return 
					else
						ImgMeterEnvFill:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ImgMeterEnvFill:setAlpha( 0.15 )
						ImgMeterEnvFill:registerEventHandler( "transition_complete_keyframe", ImgMeterEnvFillFrame3 )
					end
				end
				
				ImgMeterEnvFill:completeAnimation()
				self.ImgMeterEnvFill:setRGB( 0.88, 0.1, 0 )
				self.ImgMeterEnvFill:setAlpha( 1 )
				ImgMeterEnvFillFrame2( ImgMeterEnvFill, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
