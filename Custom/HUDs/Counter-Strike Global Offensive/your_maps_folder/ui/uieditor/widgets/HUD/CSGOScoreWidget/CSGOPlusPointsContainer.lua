require( "ui.uieditor.widgets.HUD.CSGOScoreWidget.CSGOPlusPoints" )

CoD.CSGOPlusPointsContainer = InheritFrom( LUI.UIElement )
CoD.CSGOPlusPointsContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CSGOPlusPointsContainer )
	self.id = "CSGOPlusPointsContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 66 )
	self.anyChildUsesUpdateState = true
	
	self.ZMScrPlusPoints = CoD.CSGOPlusPoints.new( menu, controller )
	self.ZMScrPlusPoints:setLeftRight( true, false, 68.91, 153.91 )
	self.ZMScrPlusPoints:setTopBottom( true, false, 46.88, 112.63 )
	self.ZMScrPlusPoints.Label1:setText( Engine.Localize( "+50" ) )
	self:addElement( self.ZMScrPlusPoints )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Anim1 = function ()
				self:setupElementClipCounter( 1 )

				local CSGOPlusPointsAnimationStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local CSGOPlusPointsAnimationStage1 = function ( element, event )
					if event.interrupted then
						CSGOPlusPointsAnimationStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						local randomLRInt = math.random( 1, 50 )
						local randomTBInt = math.random( 1, 50 )
						if math.random( 1, 2 ) == 1 then
							randomTBInt = - randomTBInt
						end
	
						element:setAlpha( 1 )
						element:setLeftRight( true, false, 68.91 + randomLRInt, 153.91 + randomLRInt )
						element:setTopBottom( true, false, 46.88 - randomTBInt, 112.63 - randomTBInt )
						
						element:registerEventHandler( "transition_complete_keyframe", CSGOPlusPointsAnimationStage2 )
					end
				end
				
				self.ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setAlpha( 0 )
				self.ZMScrPlusPoints:setLeftRight( true, false, 68.91, 153.91 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 46.88, 112.63 )
				CSGOPlusPointsAnimationStage1( self.ZMScrPlusPoints, {} )
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
