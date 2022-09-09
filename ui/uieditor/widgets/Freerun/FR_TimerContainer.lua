-- 1e4a607ed2eda5b5a5055f946fa9498a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Freerun.FR_TimerWidget" )

CoD.FR_TimerContainer = InheritFrom( LUI.UIElement )
CoD.FR_TimerContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FR_TimerContainer )
	self.id = "FR_TimerContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 235 )
	self:setTopBottom( true, false, 0, 99 )
	self.anyChildUsesUpdateState = true
	
	local FRTimerWidget = CoD.FR_TimerWidget.new( menu, controller )
	FRTimerWidget:setLeftRight( false, false, -117.5, 117.5 )
	FRTimerWidget:setTopBottom( false, false, -49.5, 49.81 )
	FRTimerWidget:subscribeToGlobalModel( controller, "FreeRun", "timer", function ( model )
		FRTimerWidget:setModel( model, controller )
	end )
	self:addElement( FRTimerWidget )
	self.FRTimerWidget = FRTimerWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local FRTimerWidgetFrame2 = function ( FRTimerWidget, event )
					if not event.interrupted then
						FRTimerWidget:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					FRTimerWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRTimerWidget, event )
					else
						FRTimerWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRTimerWidget:completeAnimation()
				self.FRTimerWidget:setAlpha( 1 )
				FRTimerWidgetFrame2( FRTimerWidget, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local FRTimerWidgetFrame2 = function ( FRTimerWidget, event )
					if not event.interrupted then
						FRTimerWidget:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					FRTimerWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FRTimerWidget, event )
					else
						FRTimerWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRTimerWidget:completeAnimation()
				self.FRTimerWidget:setAlpha( 0 )
				FRTimerWidgetFrame2( FRTimerWidget, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FRTimerWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
