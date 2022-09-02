-- 14a60582fd79971c973251e05aaa0fb4
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_HeroAbilityRingPulse = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_HeroAbilityRingPulse.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_HeroAbilityRingPulse )
	self.id = "AmmoWidget_HeroAbilityRingPulse"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 97 )
	self:setTopBottom( true, false, 0, 95 )
	
	local HeroRingPointsGainedImage = LUI.UIImage.new()
	HeroRingPointsGainedImage:setLeftRight( true, true, 0, 0 )
	HeroRingPointsGainedImage:setTopBottom( true, true, 0, 0 )
	HeroRingPointsGainedImage:setRGB( 1, 0.85, 0 )
	HeroRingPointsGainedImage:setImage( RegisterImage( "uie_img_t7_hud_cm_heroringglow" ) )
	HeroRingPointsGainedImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HeroRingPointsGainedImage )
	self.HeroRingPointsGainedImage = HeroRingPointsGainedImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				HeroRingPointsGainedImage:completeAnimation()
				self.HeroRingPointsGainedImage:setAlpha( 0 )
				self.clipFinished( HeroRingPointsGainedImage, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				HeroRingPointsGainedImage:completeAnimation()
				self.HeroRingPointsGainedImage:setAlpha( 0 )
				self.clipFinished( HeroRingPointsGainedImage, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local HeroRingPointsGainedImageFrame2 = function ( HeroRingPointsGainedImage, event )
					local HeroRingPointsGainedImageFrame3 = function ( HeroRingPointsGainedImage, event )
						local HeroRingPointsGainedImageFrame4 = function ( HeroRingPointsGainedImage, event )
							if not event.interrupted then
								HeroRingPointsGainedImage:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
							end
							HeroRingPointsGainedImage:setLeftRight( true, true, -15.32, 15.32 )
							HeroRingPointsGainedImage:setTopBottom( true, true, -15, 15 )
							HeroRingPointsGainedImage:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( HeroRingPointsGainedImage, event )
							else
								HeroRingPointsGainedImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							HeroRingPointsGainedImageFrame4( HeroRingPointsGainedImage, event )
							return 
						else
							HeroRingPointsGainedImage:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
							HeroRingPointsGainedImage:setLeftRight( true, true, -15.32, 15.32 )
							HeroRingPointsGainedImage:setTopBottom( true, true, -15, 15 )
							HeroRingPointsGainedImage:setAlpha( 0 )
							HeroRingPointsGainedImage:registerEventHandler( "transition_complete_keyframe", HeroRingPointsGainedImageFrame4 )
						end
					end
					
					if event.interrupted then
						HeroRingPointsGainedImageFrame3( HeroRingPointsGainedImage, event )
						return 
					else
						HeroRingPointsGainedImage:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						HeroRingPointsGainedImage:setLeftRight( true, true, -0.92, 0.92 )
						HeroRingPointsGainedImage:setTopBottom( true, true, -0.9, 0.9 )
						HeroRingPointsGainedImage:setAlpha( 1 )
						HeroRingPointsGainedImage:registerEventHandler( "transition_complete_keyframe", HeroRingPointsGainedImageFrame3 )
					end
				end
				
				HeroRingPointsGainedImage:completeAnimation()
				self.HeroRingPointsGainedImage:setLeftRight( true, true, 0, 0 )
				self.HeroRingPointsGainedImage:setTopBottom( true, true, 0, 0 )
				self.HeroRingPointsGainedImage:setAlpha( 0 )
				HeroRingPointsGainedImageFrame2( HeroRingPointsGainedImage, {} )

				self.nextClip = "DefaultClip"
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				HeroRingPointsGainedImage:completeAnimation()
				self.HeroRingPointsGainedImage:setAlpha( 0 )
				self.clipFinished( HeroRingPointsGainedImage, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

