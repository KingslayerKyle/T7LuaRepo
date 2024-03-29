require( "ui.uieditor.widgets.HUD.H1ScoreWidget.H1PlusPoints" )

CoD.H1PlusPointsContainer = InheritFrom( LUI.UIElement )
CoD.H1PlusPointsContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.H1PlusPointsContainer )
	self.id = "H1PlusPointsContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 66 )
	self.anyChildUsesUpdateState = true
	
	self.ZMScrPlusPoints = CoD.H1PlusPoints.new( menu, controller )
	self.ZMScrPlusPoints:setLeftRight( true, false, 75, 710 )
	self.ZMScrPlusPoints:setTopBottom( false, true, -60, -15 )
	self.ZMScrPlusPoints.Label1:setText( Engine.Localize( "+50" ) )
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

						local randomIntLR = math.random( 40, 80 )
						local randomIntTB = math.random( -20, 20 )

						element:setLeftRight( true, false, 75 + randomIntLR, 710 + randomIntLR )
						element:setTopBottom( false, true, -60 - randomIntTB, -15 - randomIntTB )

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
				self.ZMScrPlusPoints:setLeftRight( true, false, 75, 710 )
				self.ZMScrPlusPoints:setTopBottom( false, true, -60, -15 )
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

						local randomIntLR = math.random( 40, 80 )
						local randomIntTB = math.random( -20, 20 )

						element:setLeftRight( true, false, 75 + randomIntLR, 710 + randomIntLR )
						element:setTopBottom( false, true, -60 - randomIntTB, -15 - randomIntTB )

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
				self.ZMScrPlusPoints:setLeftRight( true, false, 75, 710 )
				self.ZMScrPlusPoints:setTopBottom( false, true, -60, -15 )
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

						local randomIntLR = math.random( 40, 80 )
						local randomIntTB = math.random( -20, 20 )

						element:setLeftRight( true, false, 75 + randomIntLR, 710 + randomIntLR )
						element:setTopBottom( false, true, -60 - randomIntTB, -15 - randomIntTB )

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
				self.ZMScrPlusPoints:setLeftRight( true, false, 75, 710 )
				self.ZMScrPlusPoints:setTopBottom( false, true, -60, -15 )
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

						local randomIntLR = math.random( 40, 80 )
						local randomIntTB = math.random( -20, 20 )

						element:setLeftRight( true, false, 75 + randomIntLR, 710 + randomIntLR )
						element:setTopBottom( false, true, -60 - randomIntTB, -15 - randomIntTB )

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
				self.ZMScrPlusPoints:setLeftRight( true, false, 75, 710 )
				self.ZMScrPlusPoints:setTopBottom( false, true, -60, -15 )
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

						local randomIntLR = math.random( 40, 80 )
						local randomIntTB = math.random( -20, 20 )

						element:setLeftRight( true, false, 75 + randomIntLR, 710 + randomIntLR )
						element:setTopBottom( false, true, -60 - randomIntTB, -15 - randomIntTB )

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
				self.ZMScrPlusPoints:setLeftRight( true, false, 75, 710 )
				self.ZMScrPlusPoints:setTopBottom( false, true, -60, -15 )
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

						local randomIntLR = math.random( 40, 80 )
						local randomIntTB = math.random( -20, 20 )

						element:setLeftRight( true, false, 75 + randomIntLR, 710 + randomIntLR )
						element:setTopBottom( false, true, -60 - randomIntTB, -15 - randomIntTB )

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
				self.ZMScrPlusPoints:setLeftRight( true, false, 75, 710 )
				self.ZMScrPlusPoints:setTopBottom( false, true, -60, -15 )
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

						local randomIntLR = math.random( 40, 80 )
						local randomIntTB = math.random( -20, 20 )

						element:setLeftRight( true, false, 75 + randomIntLR, 710 + randomIntLR )
						element:setTopBottom( false, true, -60 - randomIntTB, -15 - randomIntTB )

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
				self.ZMScrPlusPoints:setLeftRight( true, false, 75, 710 )
				self.ZMScrPlusPoints:setTopBottom( false, true, -60, -15 )
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

						local randomIntLR = math.random( 40, 80 )
						local randomIntTB = math.random( -20, 20 )

						element:setLeftRight( true, false, 75 + randomIntLR, 710 + randomIntLR )
						element:setTopBottom( false, true, -60 - randomIntTB, -15 - randomIntTB )

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
				self.ZMScrPlusPoints:setLeftRight( true, false, 75, 710 )
				self.ZMScrPlusPoints:setTopBottom( false, true, -60, -15 )
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
