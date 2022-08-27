-- 14ece9b5c76954b3dd7d1d30eb8e21fe
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_Score.ZMScr_PlusPoints" )

CoD.ZMScr_PlusPointsContainer = InheritFrom( LUI.UIElement )
CoD.ZMScr_PlusPointsContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZMScr_PlusPointsContainer )
	self.id = "ZMScr_PlusPointsContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 66 )
	self.anyChildUsesUpdateState = true
	
	local ZMScrPlusPoints = CoD.ZMScr_PlusPoints.new( menu, controller )
	ZMScrPlusPoints:setLeftRight( true, false, 68.91, 153.91 )
	ZMScrPlusPoints:setTopBottom( true, false, 46.88, 112.63 )
	ZMScrPlusPoints.Label2:setText( Engine.Localize( "+50" ) )
	ZMScrPlusPoints.Label1:setText( Engine.Localize( "+50" ) )
	self:addElement( ZMScrPlusPoints )
	self.ZMScrPlusPoints = ZMScrPlusPoints
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Anim1 = function ()
				self:setupElementClipCounter( 1 )
				local ZMScrPlusPointsFrame2 = function ( ZMScrPlusPoints, event )
					if not event.interrupted then
						ZMScrPlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					ZMScrPlusPoints:setLeftRight( true, false, 97.5, 182.5 )
					ZMScrPlusPoints:setTopBottom( true, false, -57.19, 8.56 )
					if event.interrupted then
						self.clipFinished( ZMScrPlusPoints, event )
					else
						ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setLeftRight( true, false, 0, 85 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 0, 65.75 )
				ZMScrPlusPointsFrame2( ZMScrPlusPoints, {} )
			end,
			Anim2 = function ()
				self:setupElementClipCounter( 1 )
				local ZMScrPlusPointsFrame2 = function ( ZMScrPlusPoints, event )
					if not event.interrupted then
						ZMScrPlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					ZMScrPlusPoints:setLeftRight( true, false, 97.97, 182.97 )
					ZMScrPlusPoints:setTopBottom( true, false, -15.35, 50.4 )
					if event.interrupted then
						self.clipFinished( ZMScrPlusPoints, event )
					else
						ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setLeftRight( true, false, 0, 85 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 0, 65.75 )
				ZMScrPlusPointsFrame2( ZMScrPlusPoints, {} )
			end,
			Anim3 = function ()
				self:setupElementClipCounter( 1 )
				local ZMScrPlusPointsFrame2 = function ( ZMScrPlusPoints, event )
					if not event.interrupted then
						ZMScrPlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					ZMScrPlusPoints:setLeftRight( true, false, 77.81, 162.81 )
					ZMScrPlusPoints:setTopBottom( true, false, 44.65, 110.4 )
					if event.interrupted then
						self.clipFinished( ZMScrPlusPoints, event )
					else
						ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setLeftRight( true, false, 0, 85 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 0, 65.75 )
				ZMScrPlusPointsFrame2( ZMScrPlusPoints, {} )
			end,
			Anim4 = function ()
				self:setupElementClipCounter( 1 )
				local ZMScrPlusPointsFrame2 = function ( ZMScrPlusPoints, event )
					if not event.interrupted then
						ZMScrPlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					ZMScrPlusPoints:setLeftRight( true, false, 83.44, 168.44 )
					ZMScrPlusPoints:setTopBottom( true, false, -15.35, 50.4 )
					if event.interrupted then
						self.clipFinished( ZMScrPlusPoints, event )
					else
						ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setLeftRight( true, false, 0, 85 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 0, 65.75 )
				ZMScrPlusPointsFrame2( ZMScrPlusPoints, {} )
			end,
			Anim5 = function ()
				self:setupElementClipCounter( 1 )
				local ZMScrPlusPointsFrame2 = function ( ZMScrPlusPoints, event )
					if not event.interrupted then
						ZMScrPlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					ZMScrPlusPoints:setLeftRight( true, false, 55.78, 140.78 )
					ZMScrPlusPoints:setTopBottom( true, false, -43.48, 22.27 )
					if event.interrupted then
						self.clipFinished( ZMScrPlusPoints, event )
					else
						ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setLeftRight( true, false, 0, 85 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 0, 65.75 )
				ZMScrPlusPointsFrame2( ZMScrPlusPoints, {} )
			end,
			Anim6 = function ()
				self:setupElementClipCounter( 1 )
				local ZMScrPlusPointsFrame2 = function ( ZMScrPlusPoints, event )
					if not event.interrupted then
						ZMScrPlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					ZMScrPlusPoints:setLeftRight( true, false, 82.5, 167.5 )
					ZMScrPlusPoints:setTopBottom( true, false, 30.94, 96.69 )
					if event.interrupted then
						self.clipFinished( ZMScrPlusPoints, event )
					else
						ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setLeftRight( true, false, 0, 85 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 0, 65.75 )
				ZMScrPlusPointsFrame2( ZMScrPlusPoints, {} )
			end,
			Anim7 = function ()
				self:setupElementClipCounter( 1 )
				local ZMScrPlusPointsFrame2 = function ( ZMScrPlusPoints, event )
					if not event.interrupted then
						ZMScrPlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					ZMScrPlusPoints:setLeftRight( true, false, 84.38, 169.38 )
					ZMScrPlusPoints:setTopBottom( true, false, -38.44, 27.31 )
					if event.interrupted then
						self.clipFinished( ZMScrPlusPoints, event )
					else
						ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setLeftRight( true, false, 0, 85 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 0, 65.75 )
				ZMScrPlusPointsFrame2( ZMScrPlusPoints, {} )
			end,
			Anim8 = function ()
				self:setupElementClipCounter( 1 )
				local ZMScrPlusPointsFrame2 = function ( ZMScrPlusPoints, event )
					if not event.interrupted then
						ZMScrPlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					ZMScrPlusPoints:setLeftRight( true, false, 68.91, 153.91 )
					ZMScrPlusPoints:setTopBottom( true, false, 46.88, 112.63 )
					if event.interrupted then
						self.clipFinished( ZMScrPlusPoints, event )
					else
						ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setLeftRight( true, false, 0, 85 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 0, 65.75 )
				ZMScrPlusPointsFrame2( ZMScrPlusPoints, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZMScrPlusPoints:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

