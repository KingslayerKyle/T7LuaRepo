-- 30628b184d35d98e7c944a0a20b35afa
-- This hash is used for caching, delete to decompile the file again

CoD.SpikeLuancherSpikeCounter_Meter2 = InheritFrom( LUI.UIElement )
CoD.SpikeLuancherSpikeCounter_Meter2.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SpikeLuancherSpikeCounter_Meter2 )
	self.id = "SpikeLuancherSpikeCounter_Meter2"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 168 )
	self:setTopBottom( true, false, 0, 88 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 0, 168 )
	Image:setTopBottom( true, false, 0, 88 )
	Image:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelaunchercounter_meter2" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image )
	self.Image = Image
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end
		},
		Blasting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local ImageFrame2 = function ( Image, event )
					local ImageFrame3 = function ( Image, event )
						local ImageFrame4 = function ( Image, event )
							local ImageFrame5 = function ( Image, event )
								if not event.interrupted then
									Image:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								end
								Image:setAlpha( 0.5 )
								if event.interrupted then
									self.clipFinished( Image, event )
								else
									Image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ImageFrame5( Image, event )
								return 
							else
								Image:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Image:registerEventHandler( "transition_complete_keyframe", ImageFrame5 )
							end
						end
						
						if event.interrupted then
							ImageFrame4( Image, event )
							return 
						else
							Image:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							Image:setAlpha( 0.5 )
							Image:registerEventHandler( "transition_complete_keyframe", ImageFrame4 )
						end
					end
					
					if event.interrupted then
						ImageFrame3( Image, event )
						return 
					else
						Image:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						Image:registerEventHandler( "transition_complete_keyframe", ImageFrame3 )
					end
				end
				
				Image:completeAnimation()
				self.Image:setAlpha( 1 )
				ImageFrame2( Image, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Image:completeAnimation()
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

