-- 861ecce06fd2c8549e04f0c89432e777
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.ScorePopup.MPScr_PlusPoints" )

CoD.MPScr_PlusPointsContainer = InheritFrom( LUI.UIElement )
CoD.MPScr_PlusPointsContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MPScr_PlusPointsContainer )
	self.id = "MPScr_PlusPointsContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 66 )
	self.anyChildUsesUpdateState = true
	
	local MPScr_PlusPoints = CoD.MPScr_PlusPoints.new( menu, controller )
	MPScr_PlusPoints:setLeftRight( true, false, 68.91, 153.91 )
	MPScr_PlusPoints:setTopBottom( true, false, 46.88, 112.63 )
	MPScr_PlusPoints.Label2:setText( Engine.Localize( "+50" ) )
	MPScr_PlusPoints.Label1:setText( Engine.Localize( "+50" ) )
	self:addElement( MPScr_PlusPoints )
	self.MPScr_PlusPoints = MPScr_PlusPoints
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Anim1 = function ()
				self:setupElementClipCounter( 1 )
				local MPScr_PlusPointsFrame2 = function ( MPScr_PlusPoints, event )
					if not event.interrupted then
						MPScr_PlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					MPScr_PlusPoints:setLeftRight( true, false, 97.5, 182.5 )
					MPScr_PlusPoints:setTopBottom( true, false, -57.19, 8.56 )
					if event.interrupted then
						self.clipFinished( MPScr_PlusPoints, event )
					else
						MPScr_PlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MPScr_PlusPoints:completeAnimation()
				self.MPScr_PlusPoints:setLeftRight( true, false, 0, 85 )
				self.MPScr_PlusPoints:setTopBottom( true, false, 0, 65.75 )
				MPScr_PlusPointsFrame2( MPScr_PlusPoints, {} )
			end,
			Anim2 = function ()
				self:setupElementClipCounter( 1 )
				local MPScr_PlusPointsFrame2 = function ( MPScr_PlusPoints, event )
					if not event.interrupted then
						MPScr_PlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					MPScr_PlusPoints:setLeftRight( true, false, 97.97, 182.97 )
					MPScr_PlusPoints:setTopBottom( true, false, -15.35, 50.4 )
					if event.interrupted then
						self.clipFinished( MPScr_PlusPoints, event )
					else
						MPScr_PlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MPScr_PlusPoints:completeAnimation()
				self.MPScr_PlusPoints:setLeftRight( true, false, 0, 85 )
				self.MPScr_PlusPoints:setTopBottom( true, false, 0, 65.75 )
				MPScr_PlusPointsFrame2( MPScr_PlusPoints, {} )
			end,
			Anim3 = function ()
				self:setupElementClipCounter( 1 )
				local MPScr_PlusPointsFrame2 = function ( MPScr_PlusPoints, event )
					if not event.interrupted then
						MPScr_PlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					MPScr_PlusPoints:setLeftRight( true, false, 77.81, 162.81 )
					MPScr_PlusPoints:setTopBottom( true, false, 44.65, 110.4 )
					if event.interrupted then
						self.clipFinished( MPScr_PlusPoints, event )
					else
						MPScr_PlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MPScr_PlusPoints:completeAnimation()
				self.MPScr_PlusPoints:setLeftRight( true, false, 0, 85 )
				self.MPScr_PlusPoints:setTopBottom( true, false, 0, 65.75 )
				MPScr_PlusPointsFrame2( MPScr_PlusPoints, {} )
			end,
			Anim4 = function ()
				self:setupElementClipCounter( 1 )
				local MPScr_PlusPointsFrame2 = function ( MPScr_PlusPoints, event )
					if not event.interrupted then
						MPScr_PlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					MPScr_PlusPoints:setLeftRight( true, false, 83.44, 168.44 )
					MPScr_PlusPoints:setTopBottom( true, false, -15.35, 50.4 )
					if event.interrupted then
						self.clipFinished( MPScr_PlusPoints, event )
					else
						MPScr_PlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MPScr_PlusPoints:completeAnimation()
				self.MPScr_PlusPoints:setLeftRight( true, false, 0, 85 )
				self.MPScr_PlusPoints:setTopBottom( true, false, 0, 65.75 )
				MPScr_PlusPointsFrame2( MPScr_PlusPoints, {} )
			end,
			Anim5 = function ()
				self:setupElementClipCounter( 1 )
				local MPScr_PlusPointsFrame2 = function ( MPScr_PlusPoints, event )
					if not event.interrupted then
						MPScr_PlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					MPScr_PlusPoints:setLeftRight( true, false, 55.78, 140.78 )
					MPScr_PlusPoints:setTopBottom( true, false, -43.48, 22.27 )
					if event.interrupted then
						self.clipFinished( MPScr_PlusPoints, event )
					else
						MPScr_PlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MPScr_PlusPoints:completeAnimation()
				self.MPScr_PlusPoints:setLeftRight( true, false, 0, 85 )
				self.MPScr_PlusPoints:setTopBottom( true, false, 0, 65.75 )
				MPScr_PlusPointsFrame2( MPScr_PlusPoints, {} )
			end,
			Anim6 = function ()
				self:setupElementClipCounter( 1 )
				local MPScr_PlusPointsFrame2 = function ( MPScr_PlusPoints, event )
					if not event.interrupted then
						MPScr_PlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					MPScr_PlusPoints:setLeftRight( true, false, 82.5, 167.5 )
					MPScr_PlusPoints:setTopBottom( true, false, 30.94, 96.69 )
					if event.interrupted then
						self.clipFinished( MPScr_PlusPoints, event )
					else
						MPScr_PlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MPScr_PlusPoints:completeAnimation()
				self.MPScr_PlusPoints:setLeftRight( true, false, 0, 85 )
				self.MPScr_PlusPoints:setTopBottom( true, false, 0, 65.75 )
				MPScr_PlusPointsFrame2( MPScr_PlusPoints, {} )
			end,
			Anim7 = function ()
				self:setupElementClipCounter( 1 )
				local MPScr_PlusPointsFrame2 = function ( MPScr_PlusPoints, event )
					if not event.interrupted then
						MPScr_PlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					MPScr_PlusPoints:setLeftRight( true, false, 84.38, 169.38 )
					MPScr_PlusPoints:setTopBottom( true, false, -38.44, 27.31 )
					if event.interrupted then
						self.clipFinished( MPScr_PlusPoints, event )
					else
						MPScr_PlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MPScr_PlusPoints:completeAnimation()
				self.MPScr_PlusPoints:setLeftRight( true, false, 0, 85 )
				self.MPScr_PlusPoints:setTopBottom( true, false, 0, 65.75 )
				MPScr_PlusPointsFrame2( MPScr_PlusPoints, {} )
			end,
			Anim8 = function ()
				self:setupElementClipCounter( 1 )
				local MPScr_PlusPointsFrame2 = function ( MPScr_PlusPoints, event )
					if not event.interrupted then
						MPScr_PlusPoints:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					MPScr_PlusPoints:setLeftRight( true, false, 68.91, 153.91 )
					MPScr_PlusPoints:setTopBottom( true, false, 46.88, 112.63 )
					if event.interrupted then
						self.clipFinished( MPScr_PlusPoints, event )
					else
						MPScr_PlusPoints:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MPScr_PlusPoints:completeAnimation()
				self.MPScr_PlusPoints:setLeftRight( true, false, 0, 85 )
				self.MPScr_PlusPoints:setTopBottom( true, false, 0, 65.75 )
				MPScr_PlusPointsFrame2( MPScr_PlusPoints, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MPScr_PlusPoints:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

