require( "ui.uieditor.widgets.BlackMarket.BM_TriangleMask" )

local PostLoadFunc = function ( self, controller )
	local maxLineFX = 4
	local delay = 8000
	self.playClipTimer = LUI.UITimer.newElementTimer( delay, false, function ( event )
		local clipToPlay = math.random( 1, maxLineFX )
		self:playClip( "LineFX_0" .. clipToPlay )
	end )
	self:addElement( self.playClipTimer )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.playClipTimer:close()
	end )
end

CoD.BM_LineLight2FX = InheritFrom( LUI.UIElement )
CoD.BM_LineLight2FX.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_LineLight2FX )
	self.id = "BM_LineLight2FX"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 468 )
	self:setTopBottom( 0, 0, 0, 600 )
	
	local LineLightFX04 = LUI.UIImage.new()
	LineLightFX04:setLeftRight( 0.5, 0.5, -227, 226 )
	LineLightFX04:setTopBottom( 0, 0, 2, 581 )
	LineLightFX04:setAlpha( 0 )
	LineLightFX04:setImage( RegisterImage( "uie_t7_blackmarket_triangleanim" ) )
	self:addElement( LineLightFX04 )
	self.LineLightFX04 = LineLightFX04
	
	local LineLightFX03 = LUI.UIImage.new()
	LineLightFX03:setLeftRight( 0.5, 0.5, -227, 226 )
	LineLightFX03:setTopBottom( 0, 0, 2, 581 )
	LineLightFX03:setAlpha( 0 )
	LineLightFX03:setImage( RegisterImage( "uie_t7_blackmarket_triangleanim" ) )
	self:addElement( LineLightFX03 )
	self.LineLightFX03 = LineLightFX03
	
	local LineLightFX02 = LUI.UIImage.new()
	LineLightFX02:setLeftRight( 0.5, 0.5, -227, 226 )
	LineLightFX02:setTopBottom( 0, 0, 2, 581 )
	LineLightFX02:setAlpha( 0 )
	LineLightFX02:setImage( RegisterImage( "uie_t7_blackmarket_triangleanim" ) )
	self:addElement( LineLightFX02 )
	self.LineLightFX02 = LineLightFX02
	
	local LineLightFX = LUI.UIImage.new()
	LineLightFX:setLeftRight( 0.5, 0.5, -227, 226 )
	LineLightFX:setTopBottom( 0, 0, 2, 581 )
	LineLightFX:setAlpha( 0 )
	LineLightFX:setImage( RegisterImage( "uie_t7_blackmarket_triangleanim" ) )
	self:addElement( LineLightFX )
	self.LineLightFX = LineLightFX
	
	local BMTriangleMask = CoD.BM_TriangleMask.new( menu, controller )
	BMTriangleMask:setLeftRight( 0, 0, 0, 468 )
	BMTriangleMask:setTopBottom( 0, 0, 267, 1179 )
	BMTriangleMask:setAlpha( 0 )
	self:addElement( BMTriangleMask )
	self.BMTriangleMask = BMTriangleMask
	
	self.resetProperties = function ()
		LineLightFX:completeAnimation()
		BMTriangleMask:completeAnimation()
		LineLightFX02:completeAnimation()
		LineLightFX03:completeAnimation()
		LineLightFX04:completeAnimation()
		LineLightFX:setAlpha( 0 )
		BMTriangleMask:setLeftRight( 0, 0, 0, 468 )
		BMTriangleMask:setTopBottom( 0, 0, 267, 1179 )
		BMTriangleMask:setAlpha( 0 )
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
				local BMTriangleMaskFrame2 = function ( BMTriangleMask, event )
					if not event.interrupted then
						BMTriangleMask:beginAnimation( "keyframe", 6079, false, false, CoD.TweenType.Linear )
					end
					BMTriangleMask:setLeftRight( 0, 0, 0, 468 )
					BMTriangleMask:setTopBottom( 0, 0, -516, 396 )
					BMTriangleMask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMTriangleMask, event )
					else
						BMTriangleMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTriangleMask:completeAnimation()
				self.BMTriangleMask:setLeftRight( 0, 0, 0, 468 )
				self.BMTriangleMask:setTopBottom( 0, 0, 216, 1128 )
				self.BMTriangleMask:setAlpha( 1 )
				BMTriangleMaskFrame2( BMTriangleMask, {} )
			end,
			LineFX_02 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LineLightFX02:completeAnimation()
				self.LineLightFX02:setAlpha( 1 )
				self.clipFinished( LineLightFX02, {} )
				local BMTriangleMaskFrame2 = function ( BMTriangleMask, event )
					if not event.interrupted then
						BMTriangleMask:beginAnimation( "keyframe", 6079, false, false, CoD.TweenType.Linear )
					end
					BMTriangleMask:setLeftRight( 0, 0, 0, 468 )
					BMTriangleMask:setTopBottom( 0, 0, -516, 396 )
					BMTriangleMask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMTriangleMask, event )
					else
						BMTriangleMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTriangleMask:completeAnimation()
				self.BMTriangleMask:setLeftRight( 0, 0, 0, 468 )
				self.BMTriangleMask:setTopBottom( 0, 0, 216, 1128 )
				self.BMTriangleMask:setAlpha( 1 )
				BMTriangleMaskFrame2( BMTriangleMask, {} )
			end,
			LineFX_03 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LineLightFX03:completeAnimation()
				self.LineLightFX03:setAlpha( 1 )
				self.clipFinished( LineLightFX03, {} )
				local BMTriangleMaskFrame2 = function ( BMTriangleMask, event )
					if not event.interrupted then
						BMTriangleMask:beginAnimation( "keyframe", 6079, false, false, CoD.TweenType.Linear )
					end
					BMTriangleMask:setLeftRight( 0, 0, 0, 468 )
					BMTriangleMask:setTopBottom( 0, 0, -516, 396 )
					BMTriangleMask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMTriangleMask, event )
					else
						BMTriangleMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTriangleMask:completeAnimation()
				self.BMTriangleMask:setLeftRight( 0, 0, 0, 468 )
				self.BMTriangleMask:setTopBottom( 0, 0, 216, 1128 )
				self.BMTriangleMask:setAlpha( 1 )
				BMTriangleMaskFrame2( BMTriangleMask, {} )
			end,
			LineFX_04 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LineLightFX04:completeAnimation()
				self.LineLightFX04:setAlpha( 1 )
				self.clipFinished( LineLightFX04, {} )
				local BMTriangleMaskFrame2 = function ( BMTriangleMask, event )
					if not event.interrupted then
						BMTriangleMask:beginAnimation( "keyframe", 6079, false, false, CoD.TweenType.Linear )
					end
					BMTriangleMask:setLeftRight( 0, 0, 0, 468 )
					BMTriangleMask:setTopBottom( 0, 0, -516, 396 )
					BMTriangleMask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMTriangleMask, event )
					else
						BMTriangleMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTriangleMask:completeAnimation()
				self.BMTriangleMask:setLeftRight( 0, 0, 0, 468 )
				self.BMTriangleMask:setTopBottom( 0, 0, 216, 1128 )
				self.BMTriangleMask:setAlpha( 1 )
				BMTriangleMaskFrame2( BMTriangleMask, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BMTriangleMask:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

