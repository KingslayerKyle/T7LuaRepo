-- 85dd914faf4be4dcb33fad2f85a66acd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Freerun.FR_DpadWidget" )

CoD.FR_DpadContainer = InheritFrom( LUI.UIElement )
CoD.FR_DpadContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.FR_DpadContainer )
	self.id = "FR_DpadContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 259 )
	self:setTopBottom( true, false, 0, 108 )
	self.anyChildUsesUpdateState = true
	
	local FRDpadWidget = CoD.FR_DpadWidget.new( menu, controller )
	FRDpadWidget:setLeftRight( false, false, -142, 145 )
	FRDpadWidget:setTopBottom( false, false, -60.76, 60 )
	FRDpadWidget:setYRot( 27 )
	self:addElement( FRDpadWidget )
	self.FRDpadWidget = FRDpadWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FRDpadWidget:completeAnimation()
				self.FRDpadWidget:setLeftRight( true, false, -12.5, 274.5 )
				self.FRDpadWidget:setTopBottom( true, false, -6.76, 114 )
				self.clipFinished( FRDpadWidget, {} )
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
				local FRDpadWidgetFrame2 = function ( FRDpadWidget, event )
					if not event.interrupted then
						FRDpadWidget:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					FRDpadWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRDpadWidget, event )
					else
						FRDpadWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRDpadWidget:completeAnimation()
				self.FRDpadWidget:setAlpha( 1 )
				FRDpadWidgetFrame2( FRDpadWidget, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local FRDpadWidgetFrame2 = function ( FRDpadWidget, event )
					if not event.interrupted then
						FRDpadWidget:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					FRDpadWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FRDpadWidget, event )
					else
						FRDpadWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRDpadWidget:completeAnimation()
				self.FRDpadWidget:setAlpha( 0 )
				FRDpadWidgetFrame2( FRDpadWidget, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FRDpadWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

