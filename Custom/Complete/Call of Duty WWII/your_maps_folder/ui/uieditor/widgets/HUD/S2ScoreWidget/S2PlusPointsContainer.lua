require( "ui.uieditor.widgets.HUD.S2ScoreWidget.S2PlusPoints" )

CoD.S2PlusPointsContainer = InheritFrom( LUI.UIElement )
CoD.S2PlusPointsContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.S2PlusPointsContainer )
	self.id = "S2PlusPointsContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 66 )
	self.anyChildUsesUpdateState = true
	
	self.ZMScrPlusPoints = CoD.S2PlusPoints.new( menu, controller )
	self.ZMScrPlusPoints:setLeftRight( true, false, 68.91, 153.91 )
	self.ZMScrPlusPoints:setTopBottom( true, false, 46.88, 112.63 )
	self.ZMScrPlusPoints.Label2:setText( Engine.Localize( "+50" ) )
	self.ZMScrPlusPoints.Label1:setText( Engine.Localize( "+50" ) )
	self:addElement( self.ZMScrPlusPoints )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Anim1 = function ()
				self:setupElementClipCounter( 1 )

				local S2PlusPointsAnimation = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end

					element:setScale( 0 )
					element:setLeftRight( true, false, 88.91, 173.91 )
					element:setTopBottom( true, false, 26.88, 92.63 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.ZMScrPlusPoints:completeAnimation()
				self.ZMScrPlusPoints:setScale( 1 )
				self.ZMScrPlusPoints:setLeftRight( true, false, 68.91, 153.91 )
				self.ZMScrPlusPoints:setTopBottom( true, false, 46.88, 112.63 )
				S2PlusPointsAnimation( self.ZMScrPlusPoints, {} )
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
