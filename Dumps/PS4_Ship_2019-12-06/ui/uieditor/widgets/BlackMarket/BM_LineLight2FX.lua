require( "ui.uieditor.widgets.BlackMarket.BM_TriangleMask" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = 4
	f1_arg0.playClipTimer = LUI.UITimer.newElementTimer( 8000, false, function ( f2_arg0 )
		f1_arg0:playClip( "LineFX_0" .. math.random( 1, f1_local0 ) )
	end )
	f1_arg0:addElement( f1_arg0.playClipTimer )
	LUI.OverrideFunction_CallOriginalSecond( f1_arg0, "close", function ( element )
		element.playClipTimer:close()
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
	self:setLeftRight( true, false, 0, 312 )
	self:setTopBottom( true, false, 0, 400 )
	self.anyChildUsesUpdateState = true
	
	local LineLightFX04 = LUI.UIImage.new()
	LineLightFX04:setLeftRight( false, false, -151.5, 150.5 )
	LineLightFX04:setTopBottom( true, false, 1, 387 )
	LineLightFX04:setAlpha( 0 )
	LineLightFX04:setImage( RegisterImage( "uie_t7_blackmarket_triangleanim" ) )
	self:addElement( LineLightFX04 )
	self.LineLightFX04 = LineLightFX04
	
	local LineLightFX03 = LUI.UIImage.new()
	LineLightFX03:setLeftRight( false, false, -151.5, 150.5 )
	LineLightFX03:setTopBottom( true, false, 1, 387 )
	LineLightFX03:setAlpha( 0 )
	LineLightFX03:setImage( RegisterImage( "uie_t7_blackmarket_triangleanim" ) )
	self:addElement( LineLightFX03 )
	self.LineLightFX03 = LineLightFX03
	
	local LineLightFX02 = LUI.UIImage.new()
	LineLightFX02:setLeftRight( false, false, -151.5, 150.5 )
	LineLightFX02:setTopBottom( true, false, 1, 387 )
	LineLightFX02:setAlpha( 0 )
	LineLightFX02:setImage( RegisterImage( "uie_t7_blackmarket_triangleanim" ) )
	self:addElement( LineLightFX02 )
	self.LineLightFX02 = LineLightFX02
	
	local LineLightFX = LUI.UIImage.new()
	LineLightFX:setLeftRight( false, false, -151.5, 150.5 )
	LineLightFX:setTopBottom( true, false, 1, 387 )
	LineLightFX:setAlpha( 0 )
	LineLightFX:setImage( RegisterImage( "uie_t7_blackmarket_triangleanim" ) )
	self:addElement( LineLightFX )
	self.LineLightFX = LineLightFX
	
	local BMTriangleMask = CoD.BM_TriangleMask.new( menu, controller )
	BMTriangleMask:setLeftRight( true, false, 0, 312 )
	BMTriangleMask:setTopBottom( true, false, 178, 786 )
	BMTriangleMask:setAlpha( 0 )
	self:addElement( BMTriangleMask )
	self.BMTriangleMask = BMTriangleMask
	
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
				local BMTriangleMaskFrame2 = function ( BMTriangleMask, event )
					if not event.interrupted then
						BMTriangleMask:beginAnimation( "keyframe", 6079, false, false, CoD.TweenType.Linear )
					end
					BMTriangleMask:setLeftRight( true, false, 0, 312 )
					BMTriangleMask:setTopBottom( true, false, -344, 264 )
					BMTriangleMask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMTriangleMask, event )
					else
						BMTriangleMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTriangleMask:completeAnimation()
				self.BMTriangleMask:setLeftRight( true, false, 0, 312 )
				self.BMTriangleMask:setTopBottom( true, false, 144, 752 )
				self.BMTriangleMask:setAlpha( 1 )
				BMTriangleMaskFrame2( BMTriangleMask, {} )
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
				local BMTriangleMaskFrame2 = function ( BMTriangleMask, event )
					if not event.interrupted then
						BMTriangleMask:beginAnimation( "keyframe", 6079, false, false, CoD.TweenType.Linear )
					end
					BMTriangleMask:setLeftRight( true, false, 0, 312 )
					BMTriangleMask:setTopBottom( true, false, -344, 264 )
					BMTriangleMask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMTriangleMask, event )
					else
						BMTriangleMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTriangleMask:completeAnimation()
				self.BMTriangleMask:setLeftRight( true, false, 0, 312 )
				self.BMTriangleMask:setTopBottom( true, false, 144, 752 )
				self.BMTriangleMask:setAlpha( 1 )
				BMTriangleMaskFrame2( BMTriangleMask, {} )
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
				self.LineLightFX:setAlpha( 0 )
				self.clipFinished( LineLightFX, {} )
				local BMTriangleMaskFrame2 = function ( BMTriangleMask, event )
					if not event.interrupted then
						BMTriangleMask:beginAnimation( "keyframe", 6079, false, false, CoD.TweenType.Linear )
					end
					BMTriangleMask:setLeftRight( true, false, 0, 312 )
					BMTriangleMask:setTopBottom( true, false, -344, 264 )
					BMTriangleMask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMTriangleMask, event )
					else
						BMTriangleMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTriangleMask:completeAnimation()
				self.BMTriangleMask:setLeftRight( true, false, 0, 312 )
				self.BMTriangleMask:setTopBottom( true, false, 144, 752 )
				self.BMTriangleMask:setAlpha( 1 )
				BMTriangleMaskFrame2( BMTriangleMask, {} )
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
				local BMTriangleMaskFrame2 = function ( BMTriangleMask, event )
					if not event.interrupted then
						BMTriangleMask:beginAnimation( "keyframe", 6079, false, false, CoD.TweenType.Linear )
					end
					BMTriangleMask:setLeftRight( true, false, 0, 312 )
					BMTriangleMask:setTopBottom( true, false, -344, 264 )
					BMTriangleMask:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMTriangleMask, event )
					else
						BMTriangleMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTriangleMask:completeAnimation()
				self.BMTriangleMask:setLeftRight( true, false, 0, 312 )
				self.BMTriangleMask:setTopBottom( true, false, 144, 752 )
				self.BMTriangleMask:setAlpha( 1 )
				BMTriangleMaskFrame2( BMTriangleMask, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMTriangleMask:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

