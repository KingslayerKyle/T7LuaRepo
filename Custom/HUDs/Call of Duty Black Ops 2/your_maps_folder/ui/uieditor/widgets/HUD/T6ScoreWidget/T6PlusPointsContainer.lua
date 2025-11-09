require( "ui.uieditor.widgets.HUD.T6ScoreWidget.T6PlusPoints" )

CoD.T6PlusPointsContainer = InheritFrom( LUI.UIElement )
CoD.T6PlusPointsContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T6PlusPointsContainer )
	self.id = "T6PlusPointsContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	self.ZMScrPlusPoints = CoD.T6PlusPoints.new( menu, controller )
	self.ZMScrPlusPoints:setLeftRight( true, true, 0, 0 )
	self.ZMScrPlusPoints:setTopBottom( true, true, 0, 0 )
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
						element:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
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
						element:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )

						local randomIntLR = math.random( 10, 75 )
						local randomIntTB = math.random( 5, 15 )

						if math.random( 1, 2 ) == 1 then
							randomIntTB = -math.abs( randomIntTB )
						end

						element:setLeftRight( true, true, -randomIntLR, -randomIntLR )
						element:setTopBottom( true, true, -randomIntTB, -randomIntTB )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage3 )
					end
				end

				local Anim1Stage1 = function ( element, event )
					if event.interrupted then
						Anim1Stage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage2 )
					end
				end

				self.ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setAlpha( 0 )
				self.ZMScrPlusPoints:setLeftRight( true, true, 0, 0 )
				self.ZMScrPlusPoints:setTopBottom( true, true, 0, 0 )
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
