require( "ui.uieditor.widgets.HUD.T4ScoreWidget.T4PlusPoints" )

CoD.T4PlusPointsContainer = InheritFrom( LUI.UIElement )
CoD.T4PlusPointsContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T4PlusPointsContainer )
	self.id = "T4PlusPointsContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	self.ZMScrPlusPoints = CoD.T4PlusPoints.new( menu, controller )
	self.ZMScrPlusPoints:setLeftRight( false, true, -230, 0 )
	self.ZMScrPlusPoints:setTopBottom( false, true, -125, 0 )
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
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						local randomIntLR = math.random( 40, 80 )
						local randomIntTB = math.random( -20, 20 )

						element:setLeftRight( false, true, -230 - randomIntLR, 0 - randomIntLR )
						element:setTopBottom( false, true, -125 - randomIntTB, 0 - randomIntTB )

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
				self.ZMScrPlusPoints:setLeftRight( false, true, -230, 0 )
				self.ZMScrPlusPoints:setTopBottom( false, true, -125, 0 )
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
