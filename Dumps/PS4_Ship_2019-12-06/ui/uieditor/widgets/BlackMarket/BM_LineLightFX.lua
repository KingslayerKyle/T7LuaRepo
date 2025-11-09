local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = 4
	f1_arg0.playClipTimer = LUI.UITimer.newElementTimer( 7000, false, function ( f2_arg0 )
		f1_arg0:playClip( "LineFX_0" .. math.random( 1, f1_local0 ) )
	end )
	f1_arg0:addElement( f1_arg0.playClipTimer )
	LUI.OverrideFunction_CallOriginalSecond( f1_arg0, "close", function ( element )
		element.playClipTimer:close()
	end )
end

CoD.BM_LineLightFX = InheritFrom( LUI.UIElement )
CoD.BM_LineLightFX.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_LineLightFX )
	self.id = "BM_LineLightFX"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 304 )
	self:setTopBottom( true, false, 0, 384 )
	
	local LineLightFX04 = LUI.UIImage.new()
	LineLightFX04:setLeftRight( false, false, -154.44, 152 )
	LineLightFX04:setTopBottom( true, false, -0.5, 389 )
	LineLightFX04:setAlpha( 0 )
	LineLightFX04:setImage( RegisterImage( "uie_t7_blackmarket_lineanim_line4" ) )
	self:addElement( LineLightFX04 )
	self.LineLightFX04 = LineLightFX04
	
	local LineLightFX03 = LUI.UIImage.new()
	LineLightFX03:setLeftRight( false, false, -154.44, 152 )
	LineLightFX03:setTopBottom( true, false, -0.5, 389 )
	LineLightFX03:setAlpha( 0 )
	LineLightFX03:setImage( RegisterImage( "uie_t7_blackmarket_lineanim_line3" ) )
	self:addElement( LineLightFX03 )
	self.LineLightFX03 = LineLightFX03
	
	local LineLightFX02 = LUI.UIImage.new()
	LineLightFX02:setLeftRight( false, false, -154.44, 154 )
	LineLightFX02:setTopBottom( true, false, -0.5, 389 )
	LineLightFX02:setAlpha( 0 )
	LineLightFX02:setImage( RegisterImage( "uie_t7_blackmarket_lineanim_line2" ) )
	self:addElement( LineLightFX02 )
	self.LineLightFX02 = LineLightFX02
	
	local LineLightFX = LUI.UIImage.new()
	LineLightFX:setLeftRight( false, false, -154.44, 152 )
	LineLightFX:setTopBottom( true, false, -0.5, 389 )
	LineLightFX:setAlpha( 0 )
	LineLightFX:setImage( RegisterImage( "uie_t7_blackmarket_lineanim_line1" ) )
	self:addElement( LineLightFX )
	self.LineLightFX = LineLightFX
	
	local Mask = LUI.UIImage.new()
	Mask:setLeftRight( true, true, -4.44, 0 )
	Mask:setTopBottom( true, true, 0, 413.54 )
	Mask:setRGB( 0, 0, 0 )
	Mask:setAlpha( 0 )
	Mask:setImage( RegisterImage( "uie_t7_blackmarket_lineanim_mask" ) )
	self:addElement( Mask )
	self.Mask = Mask
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			LineFX_01 = function ()
				self:setupElementClipCounter( 5 )
				LineLightFX04:completeAnimation()
				self.LineLightFX04:setAlpha( 0 )
				self.clipFinished( LineLightFX04, {} )
				LineLightFX03:completeAnimation()
				self.LineLightFX03:setAlpha( 0 )
				self.clipFinished( LineLightFX03, {} )
				LineLightFX02:completeAnimation()
				self.LineLightFX02:setAlpha( 0 )
				self.clipFinished( LineLightFX02, {} )
				LineLightFX:completeAnimation()
				self.LineLightFX:setAlpha( 1 )
				self.clipFinished( LineLightFX, {} )
				local MaskFrame2 = function ( Mask, event )
					if not event.interrupted then
						Mask:beginAnimation( "keyframe", 6019, false, false, CoD.TweenType.Linear )
					end
					Mask:setLeftRight( true, true, -29, 25.87 )
					Mask:setTopBottom( true, true, -458.77, 27 )
					Mask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Mask, event )
					else
						Mask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Mask:completeAnimation()
				self.Mask:setLeftRight( true, true, -29, 25.88 )
				self.Mask:setTopBottom( true, true, -23, 436.63 )
				self.Mask:setAlpha( 1 )
				MaskFrame2( Mask, {} )
			end,
			LineFX_02 = function ()
				self:setupElementClipCounter( 5 )
				LineLightFX04:completeAnimation()
				self.LineLightFX04:setAlpha( 0 )
				self.clipFinished( LineLightFX04, {} )
				LineLightFX03:completeAnimation()
				self.LineLightFX03:setAlpha( 0 )
				self.clipFinished( LineLightFX03, {} )
				LineLightFX02:completeAnimation()
				self.LineLightFX02:setAlpha( 1 )
				self.clipFinished( LineLightFX02, {} )
				LineLightFX:completeAnimation()
				self.LineLightFX:setAlpha( 0 )
				self.clipFinished( LineLightFX, {} )
				local MaskFrame2 = function ( Mask, event )
					if not event.interrupted then
						Mask:beginAnimation( "keyframe", 6019, false, false, CoD.TweenType.Linear )
					end
					Mask:setLeftRight( true, true, -29, 25.87 )
					Mask:setTopBottom( true, true, -458.77, 27 )
					Mask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Mask, event )
					else
						Mask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Mask:completeAnimation()
				self.Mask:setLeftRight( true, true, -29, 25.88 )
				self.Mask:setTopBottom( true, true, -23, 436.63 )
				self.Mask:setAlpha( 1 )
				MaskFrame2( Mask, {} )
			end,
			LineFX_03 = function ()
				self:setupElementClipCounter( 5 )
				LineLightFX04:completeAnimation()
				self.LineLightFX04:setAlpha( 0 )
				self.clipFinished( LineLightFX04, {} )
				LineLightFX03:completeAnimation()
				self.LineLightFX03:setAlpha( 1 )
				self.clipFinished( LineLightFX03, {} )
				LineLightFX02:completeAnimation()
				self.LineLightFX02:setAlpha( 0 )
				self.clipFinished( LineLightFX02, {} )
				LineLightFX:completeAnimation()
				self.LineLightFX:setAlpha( 1 )
				self.clipFinished( LineLightFX, {} )
				local MaskFrame2 = function ( Mask, event )
					if not event.interrupted then
						Mask:beginAnimation( "keyframe", 6000, false, false, CoD.TweenType.Linear )
					end
					Mask:setLeftRight( true, true, -29, 25.87 )
					Mask:setTopBottom( true, true, -458.77, 27 )
					Mask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Mask, event )
					else
						Mask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Mask:completeAnimation()
				self.Mask:setLeftRight( true, true, -29, 25.88 )
				self.Mask:setTopBottom( true, true, -23, 436.63 )
				self.Mask:setAlpha( 1 )
				MaskFrame2( Mask, {} )
			end,
			LineFX_04 = function ()
				self:setupElementClipCounter( 5 )
				LineLightFX04:completeAnimation()
				self.LineLightFX04:setAlpha( 1 )
				self.clipFinished( LineLightFX04, {} )
				LineLightFX03:completeAnimation()
				self.LineLightFX03:setAlpha( 0 )
				self.clipFinished( LineLightFX03, {} )
				LineLightFX02:completeAnimation()
				self.LineLightFX02:setAlpha( 0 )
				self.clipFinished( LineLightFX02, {} )
				LineLightFX:completeAnimation()
				self.LineLightFX:setAlpha( 0 )
				self.clipFinished( LineLightFX, {} )
				local MaskFrame2 = function ( Mask, event )
					if not event.interrupted then
						Mask:beginAnimation( "keyframe", 6039, false, false, CoD.TweenType.Linear )
					end
					Mask:setLeftRight( true, true, -29, 25.87 )
					Mask:setTopBottom( true, true, -458.77, 27 )
					Mask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Mask, event )
					else
						Mask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Mask:completeAnimation()
				self.Mask:setLeftRight( true, true, -29, 25.88 )
				self.Mask:setTopBottom( true, true, -23, 436.63 )
				self.Mask:setAlpha( 1 )
				MaskFrame2( Mask, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

