require( "ui.uieditor.widgets.HUD.IW7ScoreWidget.IW7PlusPoints" )

CoD.IW7PlusPointsContainer = InheritFrom( LUI.UIElement )
CoD.IW7PlusPointsContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IW7PlusPointsContainer )
	self.id = "IW7PlusPointsContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 66 )
	self.anyChildUsesUpdateState = true
	
	self.ZMScrPlusPoints = CoD.IW7PlusPoints.new( menu, controller )
	self.ZMScrPlusPoints:setLeftRight( true, false, 68.91, 153.91 )
	self.ZMScrPlusPoints:setTopBottom( true, false, 46.88, 112.63 )
	self.ZMScrPlusPoints.Label1:setText( Engine.Localize( "+50" ) )
	self.ZMScrPlusPoints:setScale( 0.75 )
	self:addElement( self.ZMScrPlusPoints )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Anim1 = function ()
				self:setupElementClipCounter( 1 )

				local Anim1Stage3 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local Anim1Stage2 = function ( element, event )
					if event.interrupted then
						Anim1Stage3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )

						local randomInt = math.random( 1, 40 )
						if math.random( 1, 2 ) == 1 then
							randomInt = - randomInt
						end

						element:setLeftRight( true, false, 68.91 + randomInt, 153.91 + randomInt )
						element:setTopBottom( true, false, 46.88 + 100, 112.63 + 100 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage3 )
					end
				end

				local Anim1Stage1 = function ( element, event )
					if event.interrupted then
						Anim1Stage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage2 )
					end
				end

				self.ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setAlpha( 0 )
				self.ZMScrPlusPoints:setLeftRight( true, false, 68.91, 153.91 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 46.88, 112.63 )
				Anim1Stage1( self.ZMScrPlusPoints, {} )
			end,
			Anim2 = function ()
				self:setupElementClipCounter( 1 )

				local Anim1Stage3 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local Anim1Stage2 = function ( element, event )
					if event.interrupted then
						Anim1Stage3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )

						local randomInt = math.random( 1, 40 )
						if math.random( 1, 2 ) == 1 then
							randomInt = - randomInt
						end

						element:setLeftRight( true, false, 68.91 + randomInt, 153.91 + randomInt )
						element:setTopBottom( true, false, 46.88 + 100, 112.63 + 100 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage3 )
					end
				end

				local Anim1Stage1 = function ( element, event )
					if event.interrupted then
						Anim1Stage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage2 )
					end
				end

				self.ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setAlpha( 0 )
				self.ZMScrPlusPoints:setLeftRight( true, false, 68.91, 153.91 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 46.88, 112.63 )
				Anim1Stage1( self.ZMScrPlusPoints, {} )
			end,
			Anim3 = function ()
				self:setupElementClipCounter( 1 )

				local Anim1Stage3 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local Anim1Stage2 = function ( element, event )
					if event.interrupted then
						Anim1Stage3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )

						local randomInt = math.random( 1, 40 )
						if math.random( 1, 2 ) == 1 then
							randomInt = - randomInt
						end

						element:setLeftRight( true, false, 68.91 + randomInt, 153.91 + randomInt )
						element:setTopBottom( true, false, 46.88 + 100, 112.63 + 100 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage3 )
					end
				end

				local Anim1Stage1 = function ( element, event )
					if event.interrupted then
						Anim1Stage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage2 )
					end
				end

				self.ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setAlpha( 0 )
				self.ZMScrPlusPoints:setLeftRight( true, false, 68.91, 153.91 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 46.88, 112.63 )
				Anim1Stage1( self.ZMScrPlusPoints, {} )
			end,
			Anim4 = function ()
				self:setupElementClipCounter( 1 )

				local Anim1Stage3 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local Anim1Stage2 = function ( element, event )
					if event.interrupted then
						Anim1Stage3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )

						local randomInt = math.random( 1, 40 )
						if math.random( 1, 2 ) == 1 then
							randomInt = - randomInt
						end

						element:setLeftRight( true, false, 68.91 + randomInt, 153.91 + randomInt )
						element:setTopBottom( true, false, 46.88 + 100, 112.63 + 100 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage3 )
					end
				end

				local Anim1Stage1 = function ( element, event )
					if event.interrupted then
						Anim1Stage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage2 )
					end
				end

				self.ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setAlpha( 0 )
				self.ZMScrPlusPoints:setLeftRight( true, false, 68.91, 153.91 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 46.88, 112.63 )
				Anim1Stage1( self.ZMScrPlusPoints, {} )
			end,
			Anim5 = function ()
				self:setupElementClipCounter( 1 )

				local Anim1Stage3 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local Anim1Stage2 = function ( element, event )
					if event.interrupted then
						Anim1Stage3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )

						local randomInt = math.random( 1, 40 )
						if math.random( 1, 2 ) == 1 then
							randomInt = - randomInt
						end

						element:setLeftRight( true, false, 68.91 + randomInt, 153.91 + randomInt )
						element:setTopBottom( true, false, 46.88 + 100, 112.63 + 100 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage3 )
					end
				end

				local Anim1Stage1 = function ( element, event )
					if event.interrupted then
						Anim1Stage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage2 )
					end
				end

				self.ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setAlpha( 0 )
				self.ZMScrPlusPoints:setLeftRight( true, false, 68.91, 153.91 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 46.88, 112.63 )
				Anim1Stage1( self.ZMScrPlusPoints, {} )
			end,
			Anim6 = function ()
				self:setupElementClipCounter( 1 )

				local Anim1Stage3 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local Anim1Stage2 = function ( element, event )
					if event.interrupted then
						Anim1Stage3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )

						local randomInt = math.random( 1, 40 )
						if math.random( 1, 2 ) == 1 then
							randomInt = - randomInt
						end

						element:setLeftRight( true, false, 68.91 + randomInt, 153.91 + randomInt )
						element:setTopBottom( true, false, 46.88 + 100, 112.63 + 100 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage3 )
					end
				end

				local Anim1Stage1 = function ( element, event )
					if event.interrupted then
						Anim1Stage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage2 )
					end
				end

				self.ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setAlpha( 0 )
				self.ZMScrPlusPoints:setLeftRight( true, false, 68.91, 153.91 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 46.88, 112.63 )
				Anim1Stage1( self.ZMScrPlusPoints, {} )
			end,
			Anim7 = function ()
				self:setupElementClipCounter( 1 )

				local Anim1Stage3 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local Anim1Stage2 = function ( element, event )
					if event.interrupted then
						Anim1Stage3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )

						local randomInt = math.random( 1, 40 )
						if math.random( 1, 2 ) == 1 then
							randomInt = - randomInt
						end

						element:setLeftRight( true, false, 68.91 + randomInt, 153.91 + randomInt )
						element:setTopBottom( true, false, 46.88 + 100, 112.63 + 100 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage3 )
					end
				end

				local Anim1Stage1 = function ( element, event )
					if event.interrupted then
						Anim1Stage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage2 )
					end
				end

				self.ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setAlpha( 0 )
				self.ZMScrPlusPoints:setLeftRight( true, false, 68.91, 153.91 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 46.88, 112.63 )
				Anim1Stage1( self.ZMScrPlusPoints, {} )
			end,
			Anim8 = function ()
				self:setupElementClipCounter( 1 )

				local Anim1Stage3 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local Anim1Stage2 = function ( element, event )
					if event.interrupted then
						Anim1Stage3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )

						local randomInt = math.random( 1, 40 )
						if math.random( 1, 2 ) == 1 then
							randomInt = - randomInt
						end

						element:setLeftRight( true, false, 68.91 + randomInt, 153.91 + randomInt )
						element:setTopBottom( true, false, 46.88 + 100, 112.63 + 100 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage3 )
					end
				end

				local Anim1Stage1 = function ( element, event )
					if event.interrupted then
						Anim1Stage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage2 )
					end
				end

				self.ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setAlpha( 0 )
				self.ZMScrPlusPoints:setLeftRight( true, false, 68.91, 153.91 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 46.88, 112.63 )
				Anim1Stage1( self.ZMScrPlusPoints, {} )
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
