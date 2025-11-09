require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.ClipMeterInternalBlankProto" )

CoD.ClipMeterInternalProto = InheritFrom( LUI.UIElement )
CoD.ClipMeterInternalProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ClipMeterInternalProto )
	self.id = "ClipMeterInternalProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 102 )
	self:setTopBottom( true, false, 0, 4 )
	
	local ClipMeter = CoD.ClipMeterInternalBlankProto.new( menu, controller )
	ClipMeter:setLeftRight( true, true, 0, 0 )
	ClipMeter:setTopBottom( true, true, 0, 0 )
	ClipMeter:setRGB( 0.96, 0.44, 0.01 )
	ClipMeter:setAlpha( 0 )
	self:addElement( ClipMeter )
	self.ClipMeter = ClipMeter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ClipMeter:completeAnimation()
				self.ClipMeter:setRGB( 0.4, 0.4, 0.4 )
				self.ClipMeter:setAlpha( 0 )
				self.clipFinished( ClipMeter, {} )
			end
		},
		LowAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local ClipMeterFrame2 = function ( ClipMeter, event )
					local ClipMeterFrame3 = function ( ClipMeter, event )
						local ClipMeterFrame4 = function ( ClipMeter, event )
							if not event.interrupted then
								ClipMeter:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							ClipMeter:setRGB( 0.85, 0.15, 0.15 )
							ClipMeter:setAlpha( 0 )
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
							ClipMeter:setRGB( 0.96, 0.44, 0.01 )
							ClipMeter:setAlpha( 0 )
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
		},
		NoAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ClipMeter:completeAnimation()
				self.ClipMeter:setRGB( 1, 0, 0 )
				self.ClipMeter:setAlpha( 0 )
				self.clipFinished( ClipMeter, {} )
			end
		}
	}
	self.close = function ( self )
		self.ClipMeter:close()
		CoD.ClipMeterInternalProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

