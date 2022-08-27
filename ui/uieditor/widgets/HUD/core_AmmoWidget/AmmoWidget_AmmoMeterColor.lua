-- 0744fad772d6b4354b2d9911097eabf7
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_AmmoMeterColor = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_AmmoMeterColor.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_AmmoMeterColor )
	self.id = "AmmoWidget_AmmoMeterColor"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 51 )
	self:setTopBottom( true, false, 0, 5 )
	
	local ClipMeter = LUI.UIImage.new()
	ClipMeter:setLeftRight( true, true, 0, -0.33 )
	ClipMeter:setTopBottom( true, true, 0, -0.34 )
	ClipMeter:setRGB( 1, 0, 0 )
	ClipMeter:setAlpha( 0.5 )
	ClipMeter:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ammoline" ) )
	self:addElement( ClipMeter )
	self.ClipMeter = ClipMeter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ClipMeter:completeAnimation()
				self.ClipMeter:setRGB( 0.49, 0.49, 0.49 )
				self.ClipMeter:setAlpha( 0 )
				self.clipFinished( ClipMeter, {} )
			end
		},
		HeroWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ClipMeter:completeAnimation()
				self.ClipMeter:setRGB( 1, 0.85, 0 )
				self.ClipMeter:setAlpha( 1 )
				self.clipFinished( ClipMeter, {} )
			end
		},
		NoAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local ClipMeterFrame2 = function ( ClipMeter, event )
					local ClipMeterFrame3 = function ( ClipMeter, event )
						if not event.interrupted then
							ClipMeter:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						end
						ClipMeter:setRGB( 1, 0, 0 )
						ClipMeter:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( ClipMeter, event )
						else
							ClipMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ClipMeterFrame3( ClipMeter, event )
						return 
					else
						ClipMeter:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ClipMeter:setAlpha( 0.4 )
						ClipMeter:registerEventHandler( "transition_complete_keyframe", ClipMeterFrame3 )
					end
				end
				
				ClipMeter:completeAnimation()
				self.ClipMeter:setRGB( 1, 0, 0 )
				self.ClipMeter:setAlpha( 0.5 )
				ClipMeterFrame2( ClipMeter, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

