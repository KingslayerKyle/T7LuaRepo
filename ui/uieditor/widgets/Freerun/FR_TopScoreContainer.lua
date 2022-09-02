-- 5a38c923806b04755491f36c3baf314e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Freerun.FR_TopScoreWidget" )

CoD.FR_TopScoreContainer = InheritFrom( LUI.UIElement )
CoD.FR_TopScoreContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.FR_TopScoreContainer )
	self.id = "FR_TopScoreContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 556 )
	self:setTopBottom( true, false, 0, 292 )
	self.anyChildUsesUpdateState = true
	
	local FRTopScoreWidget = CoD.FR_TopScoreWidget.new( menu, controller )
	FRTopScoreWidget:setLeftRight( true, false, 0, 556.25 )
	FRTopScoreWidget:setTopBottom( true, false, 0, 292 )
	FRTopScoreWidget:subscribeToGlobalModel( controller, "FreeRun", "topScore", function ( model )
		FRTopScoreWidget:setModel( model, controller )
	end )
	self:addElement( FRTopScoreWidget )
	self.FRTopScoreWidget = FRTopScoreWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				FRTopScoreWidget:completeAnimation()
				self.FRTopScoreWidget:setAlpha( 1 )
				self.clipFinished( FRTopScoreWidget, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local FRTopScoreWidgetFrame2 = function ( FRTopScoreWidget, event )
					if not event.interrupted then
						FRTopScoreWidget:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					FRTopScoreWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRTopScoreWidget, event )
					else
						FRTopScoreWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRTopScoreWidget:completeAnimation()
				self.FRTopScoreWidget:setAlpha( 0 )
				FRTopScoreWidgetFrame2( FRTopScoreWidget, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local FRTopScoreWidgetFrame2 = function ( FRTopScoreWidget, event )
					if not event.interrupted then
						FRTopScoreWidget:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					FRTopScoreWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FRTopScoreWidget, event )
					else
						FRTopScoreWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRTopScoreWidget:completeAnimation()
				self.FRTopScoreWidget:setAlpha( 0 )
				FRTopScoreWidgetFrame2( FRTopScoreWidget, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FRTopScoreWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

