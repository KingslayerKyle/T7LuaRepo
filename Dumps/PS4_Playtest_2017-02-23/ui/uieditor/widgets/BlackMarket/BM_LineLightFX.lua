local PostLoadFunc = function ( self, controller )
	local maxLineFX = 4
	local delay = 7000
	self.playClipTimer = LUI.UITimer.newElementTimer( delay, false, function ( event )
		local clipToPlay = math.random( 1, maxLineFX )
		self:playClip( "LineFX_0" .. clipToPlay )
	end )
	self:addElement( self.playClipTimer )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.playClipTimer:close()
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
	self:setLeftRight( 0, 0, 0, 456 )
	self:setTopBottom( 0, 0, 0, 576 )
	
	local LineLightFX04 = LUI.UIImage.new()
	LineLightFX04:setLeftRight( 0.5, 0.5, -232, 228 )
	LineLightFX04:setTopBottom( 0, 0, -1, 583 )
	LineLightFX04:setAlpha( 0 )
	LineLightFX04:setImage( RegisterImage( "uie_t7_blackmarket_lineanim_line4" ) )
	self:addElement( LineLightFX04 )
	self.LineLightFX04 = LineLightFX04
	
	local LineLightFX03 = LUI.UIImage.new()
	LineLightFX03:setLeftRight( 0.5, 0.5, -232, 228 )
	LineLightFX03:setTopBottom( 0, 0, -1, 583 )
	LineLightFX03:setAlpha( 0 )
	LineLightFX03:setImage( RegisterImage( "uie_t7_blackmarket_lineanim_line3" ) )
	self:addElement( LineLightFX03 )
	self.LineLightFX03 = LineLightFX03
	
	local LineLightFX02 = LUI.UIImage.new()
	LineLightFX02:setLeftRight( 0.5, 0.5, -232, 231 )
	LineLightFX02:setTopBottom( 0, 0, -1, 583 )
	LineLightFX02:setAlpha( 0 )
	LineLightFX02:setImage( RegisterImage( "uie_t7_blackmarket_lineanim_line2" ) )
	self:addElement( LineLightFX02 )
	self.LineLightFX02 = LineLightFX02
	
	local LineLightFX = LUI.UIImage.new()
	LineLightFX:setLeftRight( 0.5, 0.5, -232, 228 )
	LineLightFX:setTopBottom( 0, 0, -1, 583 )
	LineLightFX:setAlpha( 0 )
	LineLightFX:setImage( RegisterImage( "uie_t7_blackmarket_lineanim_line1" ) )
	self:addElement( LineLightFX )
	self.LineLightFX = LineLightFX
	
	local Mask = LUI.UIImage.new()
	Mask:setLeftRight( 0, 1, -6, 0 )
	Mask:setTopBottom( 0, 1, 0, 620 )
	Mask:setRGB( 0, 0, 0 )
	Mask:setAlpha( 0 )
	Mask:setImage( RegisterImage( "uie_t7_blackmarket_lineanim_mask" ) )
	self:addElement( Mask )
	self.Mask = Mask
	
	self.resetProperties = function ()
		LineLightFX:completeAnimation()
		Mask:completeAnimation()
		LineLightFX02:completeAnimation()
		LineLightFX03:completeAnimation()
		LineLightFX04:completeAnimation()
		LineLightFX:setAlpha( 0 )
		Mask:setLeftRight( 0, 1, -6, 0 )
		Mask:setTopBottom( 0, 1, 0, 620 )
		Mask:setAlpha( 0 )
		LineLightFX02:setAlpha( 0 )
		LineLightFX03:setAlpha( 0 )
		LineLightFX04:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LineFX_01 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LineLightFX:completeAnimation()
				self.LineLightFX:setAlpha( 1 )
				self.clipFinished( LineLightFX, {} )
				local MaskFrame2 = function ( Mask, event )
					if not event.interrupted then
						Mask:beginAnimation( "keyframe", 6019, false, false, CoD.TweenType.Linear )
					end
					Mask:setLeftRight( 0, 1, -43, 39 )
					Mask:setTopBottom( 0, 1, -688, 40 )
					Mask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Mask, event )
					else
						Mask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Mask:completeAnimation()
				self.Mask:setLeftRight( 0, 1, -43, 39 )
				self.Mask:setTopBottom( 0, 1, -35, 655 )
				self.Mask:setAlpha( 1 )
				MaskFrame2( Mask, {} )
			end,
			LineFX_02 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LineLightFX02:completeAnimation()
				self.LineLightFX02:setAlpha( 1 )
				self.clipFinished( LineLightFX02, {} )
				local MaskFrame2 = function ( Mask, event )
					if not event.interrupted then
						Mask:beginAnimation( "keyframe", 6019, false, false, CoD.TweenType.Linear )
					end
					Mask:setLeftRight( 0, 1, -43, 39 )
					Mask:setTopBottom( 0, 1, -688, 40 )
					Mask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Mask, event )
					else
						Mask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Mask:completeAnimation()
				self.Mask:setLeftRight( 0, 1, -43, 39 )
				self.Mask:setTopBottom( 0, 1, -35, 655 )
				self.Mask:setAlpha( 1 )
				MaskFrame2( Mask, {} )
			end,
			LineFX_03 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LineLightFX03:completeAnimation()
				self.LineLightFX03:setAlpha( 1 )
				self.clipFinished( LineLightFX03, {} )
				LineLightFX:completeAnimation()
				self.LineLightFX:setAlpha( 1 )
				self.clipFinished( LineLightFX, {} )
				local MaskFrame2 = function ( Mask, event )
					if not event.interrupted then
						Mask:beginAnimation( "keyframe", 6000, false, false, CoD.TweenType.Linear )
					end
					Mask:setLeftRight( 0, 1, -43, 39 )
					Mask:setTopBottom( 0, 1, -688, 40 )
					Mask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Mask, event )
					else
						Mask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Mask:completeAnimation()
				self.Mask:setLeftRight( 0, 1, -43, 39 )
				self.Mask:setTopBottom( 0, 1, -35, 655 )
				self.Mask:setAlpha( 1 )
				MaskFrame2( Mask, {} )
			end,
			LineFX_04 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LineLightFX04:completeAnimation()
				self.LineLightFX04:setAlpha( 1 )
				self.clipFinished( LineLightFX04, {} )
				local MaskFrame2 = function ( Mask, event )
					if not event.interrupted then
						Mask:beginAnimation( "keyframe", 6039, false, false, CoD.TweenType.Linear )
					end
					Mask:setLeftRight( 0, 1, -43, 39 )
					Mask:setTopBottom( 0, 1, -688, 40 )
					Mask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Mask, event )
					else
						Mask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Mask:completeAnimation()
				self.Mask:setLeftRight( 0, 1, -43, 39 )
				self.Mask:setTopBottom( 0, 1, -35, 655 )
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

