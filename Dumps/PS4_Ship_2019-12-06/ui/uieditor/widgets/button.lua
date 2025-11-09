require( "ui.uieditor.widgets.button_internal" )

CoD.button = InheritFrom( LUI.UIElement )
CoD.button.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.button )
	self.id = "button"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 610 )
	self:setTopBottom( true, false, 0, 30 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local buttoninternal0 = CoD.button_internal.new( menu, controller )
	buttoninternal0:setLeftRight( true, false, 0, 558 )
	buttoninternal0:setTopBottom( true, false, 0, 30 )
	buttoninternal0:setZoom( 10 )
	buttoninternal0.Text0:setText( Engine.Localize( "Button" ) )
	self:addElement( buttoninternal0 )
	self.buttoninternal0 = buttoninternal0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				buttoninternal0:completeAnimation()
				self.buttoninternal0:setRGB( 1, 1, 1 )
				self.buttoninternal0:setAlpha( 1 )
				self.buttoninternal0:setZoom( 0 )
				self.clipFinished( buttoninternal0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				local buttoninternal0Frame2 = function ( buttoninternal0, event )
					local buttoninternal0Frame3 = function ( buttoninternal0, event )
						if not event.interrupted then
							buttoninternal0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						buttoninternal0:setRGB( 1, 0.6, 0.04 )
						buttoninternal0:setZoom( 10 )
						if event.interrupted then
							self.clipFinished( buttoninternal0, event )
						else
							buttoninternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						buttoninternal0Frame3( buttoninternal0, event )
						return 
					else
						buttoninternal0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						buttoninternal0:setRGB( 0.61, 0.48, 0.31 )
						buttoninternal0:registerEventHandler( "transition_complete_keyframe", buttoninternal0Frame3 )
					end
				end
				
				buttoninternal0:completeAnimation()
				self.buttoninternal0:setRGB( 1, 0.6, 0.04 )
				self.buttoninternal0:setZoom( 10 )
				buttoninternal0Frame2( buttoninternal0, {} )
				self.nextClip = "Focus"
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				buttoninternal0:completeAnimation()
				self.buttoninternal0:setAlpha( 0 )
				self.clipFinished( buttoninternal0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local buttoninternal0Frame2 = function ( buttoninternal0, event )
					if not event.interrupted then
						buttoninternal0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					buttoninternal0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( buttoninternal0, event )
					else
						buttoninternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				buttoninternal0:completeAnimation()
				self.buttoninternal0:setAlpha( 0 )
				buttoninternal0Frame2( buttoninternal0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttoninternal0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

