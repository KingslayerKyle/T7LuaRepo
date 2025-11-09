CoD.ClipMeterInternalColorProto = InheritFrom( LUI.UIElement )
CoD.ClipMeterInternalColorProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ClipMeterInternalColorProto )
	self.id = "ClipMeterInternalColorProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 67 )
	self:setTopBottom( true, false, 0, 5 )
	
	local ClipMeter = LUI.UIImage.new()
	ClipMeter:setLeftRight( true, true, 0, -0.33 )
	ClipMeter:setTopBottom( true, true, 0, 0.33 )
	ClipMeter:setRGB( 0.85, 0.15, 0.15 )
	ClipMeter:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_clipline" ) )
	ClipMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ClipMeter )
	self.ClipMeter = ClipMeter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ClipMeter:completeAnimation()
				self.ClipMeter:setRGB( 0.49, 0.49, 0.49 )
				self.ClipMeter:setAlpha( 1 )
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
						local ClipMeterFrame4 = function ( ClipMeter, event )
							if not event.interrupted then
								ClipMeter:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							ClipMeter:setRGB( 0.47, 0, 0 )
							ClipMeter:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( ClipMeter, event )
							else
								ClipMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ClipMeterFrame4( ClipMeter, event )
							return 
						else
							ClipMeter:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							ClipMeter:setRGB( 0.47, 0, 0 )
							ClipMeter:registerEventHandler( "transition_complete_keyframe", ClipMeterFrame4 )
						end
					end
					
					if event.interrupted then
						ClipMeterFrame3( ClipMeter, event )
						return 
					else
						ClipMeter:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ClipMeter:registerEventHandler( "transition_complete_keyframe", ClipMeterFrame3 )
					end
				end
				
				ClipMeter:completeAnimation()
				self.ClipMeter:setRGB( 0.85, 0.15, 0.15 )
				self.ClipMeter:setAlpha( 1 )
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

