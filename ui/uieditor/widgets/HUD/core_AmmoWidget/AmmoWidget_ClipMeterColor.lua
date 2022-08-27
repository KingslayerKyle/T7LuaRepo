-- 241688e667e9f6c69d1d7a67e7678d4f
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_ClipMeterColor = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_ClipMeterColor.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_ClipMeterColor )
	self.id = "AmmoWidget_ClipMeterColor"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 67 )
	self:setTopBottom( true, false, 0, 6 )
	
	local ImgMeter = LUI.UIImage.new()
	ImgMeter:setLeftRight( true, true, 0, 0 )
	ImgMeter:setTopBottom( true, true, 352, 350.67 )
	ImgMeter:setRGB( 1, 0, 0 )
	ImgMeter:setAlpha( 0.5 )
	ImgMeter:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_clipline" ) )
	self:addElement( ImgMeter )
	self.ImgMeter = ImgMeter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ImgMeter:completeAnimation()
				self.ImgMeter:setAlpha( 0 )
				self.clipFinished( ImgMeter, {} )
			end
		},
		LowAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local ImgMeterFrame2 = function ( ImgMeter, event )
					local ImgMeterFrame3 = function ( ImgMeter, event )
						local ImgMeterFrame4 = function ( ImgMeter, event )
							if not event.interrupted then
								ImgMeter:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							ImgMeter:setRGB( 0, 0, 0 )
							ImgMeter:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( ImgMeter, event )
							else
								ImgMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ImgMeterFrame4( ImgMeter, event )
							return 
						else
							ImgMeter:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							ImgMeter:setRGB( 0, 0, 0 )
							ImgMeter:registerEventHandler( "transition_complete_keyframe", ImgMeterFrame4 )
						end
					end
					
					if event.interrupted then
						ImgMeterFrame3( ImgMeter, event )
						return 
					else
						ImgMeter:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ImgMeter:registerEventHandler( "transition_complete_keyframe", ImgMeterFrame3 )
					end
				end
				
				ImgMeter:completeAnimation()
				self.ImgMeter:setRGB( 1, 0, 0.17 )
				self.ImgMeter:setAlpha( 1 )
				ImgMeterFrame2( ImgMeter, {} )
				self.nextClip = "DefaultClip"
			end
		},
		NoAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local ImgMeterFrame2 = function ( ImgMeter, event )
					local ImgMeterFrame3 = function ( ImgMeter, event )
						if not event.interrupted then
							ImgMeter:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						end
						ImgMeter:setRGB( 1, 0, 0 )
						ImgMeter:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( ImgMeter, event )
						else
							ImgMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ImgMeterFrame3( ImgMeter, event )
						return 
					else
						ImgMeter:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ImgMeter:setAlpha( 0.4 )
						ImgMeter:registerEventHandler( "transition_complete_keyframe", ImgMeterFrame3 )
					end
				end
				
				ImgMeter:completeAnimation()
				self.ImgMeter:setRGB( 1, 0, 0 )
				self.ImgMeter:setAlpha( 0.5 )
				ImgMeterFrame2( ImgMeter, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

