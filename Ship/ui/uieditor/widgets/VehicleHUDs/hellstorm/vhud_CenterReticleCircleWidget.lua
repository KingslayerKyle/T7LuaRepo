-- bcf5451f8dcb0c6f38407b4aeb6e6110
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_CenterReticleCircleWidget = InheritFrom( LUI.UIElement )
CoD.vhud_CenterReticleCircleWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.vhud_CenterReticleCircleWidget )
	self.id = "vhud_CenterReticleCircleWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 68 )
	self:setTopBottom( true, false, 0, 68 )
	
	local CenterReticle = LUI.UIImage.new()
	CenterReticle:setLeftRight( false, false, -34, 34 )
	CenterReticle:setTopBottom( false, false, -34, 34 )
	CenterReticle:setRGB( 1, 0, 0 )
	CenterReticle:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_centerreticle" ) )
	CenterReticle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticle )
	self.CenterReticle = CenterReticle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local CenterReticleFrame2 = function ( CenterReticle, event )
					local CenterReticleFrame3 = function ( CenterReticle, event )
						local CenterReticleFrame4 = function ( CenterReticle, event )
							local CenterReticleFrame5 = function ( CenterReticle, event )
								local CenterReticleFrame6 = function ( CenterReticle, event )
									local CenterReticleFrame7 = function ( CenterReticle, event )
										local CenterReticleFrame8 = function ( CenterReticle, event )
											local CenterReticleFrame9 = function ( CenterReticle, event )
												if not event.interrupted then
													CenterReticle:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
												end
												CenterReticle:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( CenterReticle, event )
												else
													CenterReticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												CenterReticleFrame9( CenterReticle, event )
												return 
											else
												CenterReticle:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												CenterReticle:setAlpha( 0.1 )
												CenterReticle:registerEventHandler( "transition_complete_keyframe", CenterReticleFrame9 )
											end
										end
										
										if event.interrupted then
											CenterReticleFrame8( CenterReticle, event )
											return 
										else
											CenterReticle:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
											CenterReticle:setAlpha( 1 )
											CenterReticle:registerEventHandler( "transition_complete_keyframe", CenterReticleFrame8 )
										end
									end
									
									if event.interrupted then
										CenterReticleFrame7( CenterReticle, event )
										return 
									else
										CenterReticle:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
										CenterReticle:setAlpha( 0.1 )
										CenterReticle:registerEventHandler( "transition_complete_keyframe", CenterReticleFrame7 )
									end
								end
								
								if event.interrupted then
									CenterReticleFrame6( CenterReticle, event )
									return 
								else
									CenterReticle:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
									CenterReticle:setAlpha( 1 )
									CenterReticle:registerEventHandler( "transition_complete_keyframe", CenterReticleFrame6 )
								end
							end
							
							if event.interrupted then
								CenterReticleFrame5( CenterReticle, event )
								return 
							else
								CenterReticle:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								CenterReticle:setAlpha( 0.08 )
								CenterReticle:registerEventHandler( "transition_complete_keyframe", CenterReticleFrame5 )
							end
						end
						
						if event.interrupted then
							CenterReticleFrame4( CenterReticle, event )
							return 
						else
							CenterReticle:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							CenterReticle:setAlpha( 1 )
							CenterReticle:registerEventHandler( "transition_complete_keyframe", CenterReticleFrame4 )
						end
					end
					
					if event.interrupted then
						CenterReticleFrame3( CenterReticle, event )
						return 
					else
						CenterReticle:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						CenterReticle:setAlpha( 0.11 )
						CenterReticle:registerEventHandler( "transition_complete_keyframe", CenterReticleFrame3 )
					end
				end
				
				CenterReticle:completeAnimation()
				self.CenterReticle:setAlpha( 1 )
				CenterReticleFrame2( CenterReticle, {} )

				self.nextClip = "DefaultClip"
			end
		},
		LowAltitude = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				CenterReticle:completeAnimation()
				self.CenterReticle:setLeftRight( false, false, -35.5, 32.5 )
				self.CenterReticle:setTopBottom( false, false, -34.5, 33.5 )
				self.clipFinished( CenterReticle, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end,
			LowAltitude_Slow = function ()
				self:setupElementClipCounter( 0 )
			end,
			LowAltitude_Boost = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		LowAltitude_Slow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end,
			LowAltitude = function ()
				self:setupElementClipCounter( 0 )
			end,
			LowAltitude_Boost = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		LowAltitude_Boost = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end,
			LowAltitude = function ()
				self:setupElementClipCounter( 0 )
			end,
			LowAltitude_Slow = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		MediumAltitude = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				CenterReticle:completeAnimation()
				self.CenterReticle:setLeftRight( false, false, -35.5, 32.5 )
				self.CenterReticle:setTopBottom( false, false, -34.5, 33.5 )
				self.clipFinished( CenterReticle, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end,
			LowAltitude = function ()
				self:setupElementClipCounter( 1 )

				CenterReticle:completeAnimation()
				self.CenterReticle:setLeftRight( false, false, -35.5, 32.5 )
				self.CenterReticle:setTopBottom( false, false, -34.5, 33.5 )
				self.clipFinished( CenterReticle, {} )
			end,
			MediumAltitude_Boost = function ()
				self:setupElementClipCounter( 0 )
			end,
			MediumAltitude_Slow = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		MediumAltitude_Slow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end,
			LowAltitude_Slow = function ()
				self:setupElementClipCounter( 0 )
			end,
			MediumAltitude = function ()
				self:setupElementClipCounter( 0 )
			end,
			MediumAltitude_Boost = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		MediumAltitude_Boost = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end,
			LowAltitude_Boost = function ()
				self:setupElementClipCounter( 0 )
			end,
			MediumAltitude = function ()
				self:setupElementClipCounter( 0 )
			end,
			MediumAltitude_Slow = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		HighAltitude = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				CenterReticle:completeAnimation()
				self.CenterReticle:setLeftRight( false, false, -35.5, 32.5 )
				self.CenterReticle:setTopBottom( false, false, -34.5, 33.5 )
				self.clipFinished( CenterReticle, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end,
			MediumAltitude = function ()
				self:setupElementClipCounter( 1 )

				CenterReticle:completeAnimation()
				self.CenterReticle:setLeftRight( false, false, -35.5, 32.5 )
				self.CenterReticle:setTopBottom( false, false, -34.5, 33.5 )
				self.clipFinished( CenterReticle, {} )
			end,
			HighAltitude_Boost = function ()
				self:setupElementClipCounter( 0 )
			end,
			HighAltitude_Slow = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		HighAltitude_Slow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end,
			MediumAltitude_Slow = function ()
				self:setupElementClipCounter( 0 )
			end,
			HighAltitude = function ()
				self:setupElementClipCounter( 0 )
			end,
			HighAltitude_Boost = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		HighAltitude_Boost = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end,
			MediumAltitude_Boost = function ()
				self:setupElementClipCounter( 0 )
			end,
			HighAltitude = function ()
				self:setupElementClipCounter( 0 )
			end,
			HighAltitude_Slow = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
