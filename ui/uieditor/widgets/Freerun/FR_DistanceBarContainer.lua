-- b8e27cf550924c7c25590b2ff8fe8ee7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Freerun.FR_DistanceBarWidget" )

CoD.FR_DistanceBarContainer = InheritFrom( LUI.UIElement )
CoD.FR_DistanceBarContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.FR_DistanceBarContainer )
	self.id = "FR_DistanceBarContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 547 )
	self:setTopBottom( true, false, 0, 61 )
	
	local FRDistanceBarWidget = CoD.FR_DistanceBarWidget.new( menu, controller )
	FRDistanceBarWidget:setLeftRight( true, false, 0, 546.61 )
	FRDistanceBarWidget:setTopBottom( true, false, 0, 60.73 )
	self:addElement( FRDistanceBarWidget )
	self.FRDistanceBarWidget = FRDistanceBarWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			Penalty = function ()
				self:setupElementClipCounter( 0 )

			end,
			FaultAnim = function ()
				self:setupElementClipCounter( 0 )

			end,
			RetryAnim = function ()
				self:setupElementClipCounter( 0 )

			end,
			SetCheckpointDelta = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local FRDistanceBarWidgetFrame2 = function ( FRDistanceBarWidget, event )
					if not event.interrupted then
						FRDistanceBarWidget:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					FRDistanceBarWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRDistanceBarWidget, event )
					else
						FRDistanceBarWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRDistanceBarWidget:completeAnimation()
				self.FRDistanceBarWidget:setAlpha( 1 )
				FRDistanceBarWidgetFrame2( FRDistanceBarWidget, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local FRDistanceBarWidgetFrame2 = function ( FRDistanceBarWidget, event )
					if not event.interrupted then
						FRDistanceBarWidget:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					FRDistanceBarWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FRDistanceBarWidget, event )
					else
						FRDistanceBarWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRDistanceBarWidget:completeAnimation()
				self.FRDistanceBarWidget:setAlpha( 0 )
				FRDistanceBarWidgetFrame2( FRDistanceBarWidget, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FRDistanceBarWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

