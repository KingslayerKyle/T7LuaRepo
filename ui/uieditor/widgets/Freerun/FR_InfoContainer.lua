-- b4e961d8ab014eb4c6ebc317258c6172
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Freerun.FR_InfoWidget" )

CoD.FR_InfoContainer = InheritFrom( LUI.UIElement )
CoD.FR_InfoContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FR_InfoContainer )
	self.id = "FR_InfoContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 302 )
	self:setTopBottom( true, false, 0, 219 )
	self.anyChildUsesUpdateState = true
	
	local FRInfoWidget = CoD.FR_InfoWidget.new( menu, controller )
	FRInfoWidget:setLeftRight( false, false, -177, 139 )
	FRInfoWidget:setTopBottom( false, false, -100, 106 )
	FRInfoWidget:setYRot( 27 )
	FRInfoWidget:subscribeToGlobalModel( controller, "FreeRun", "freeRunInfo", function ( model )
		FRInfoWidget:setModel( model, controller )
	end )
	self:addElement( FRInfoWidget )
	self.FRInfoWidget = FRInfoWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				FRInfoWidget:completeAnimation()
				self.FRInfoWidget:setLeftRight( true, false, -23, 293 )
				self.FRInfoWidget:setTopBottom( true, false, -2.2, 203.8 )
				self.clipFinished( FRInfoWidget, {} )
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

				local FRInfoWidgetFrame2 = function ( FRInfoWidget, event )
					if not event.interrupted then
						FRInfoWidget:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					FRInfoWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FRInfoWidget, event )
					else
						FRInfoWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRInfoWidget:completeAnimation()
				self.FRInfoWidget:setAlpha( 1 )
				FRInfoWidgetFrame2( FRInfoWidget, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FRInfoWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
