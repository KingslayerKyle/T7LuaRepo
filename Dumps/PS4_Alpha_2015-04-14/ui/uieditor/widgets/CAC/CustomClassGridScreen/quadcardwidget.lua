require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.QuadCardWidget_Internal" )

CoD.QuadCardWidget = InheritFrom( LUI.UIElement )
CoD.QuadCardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.QuadCardWidget )
	self.id = "QuadCardWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 409 )
	self:setTopBottom( true, false, 0, 228 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local quadCardWidget = CoD.QuadCardWidget_Internal.new( menu, controller )
	quadCardWidget:setLeftRight( true, false, 0, 409 )
	quadCardWidget:setTopBottom( true, false, 0, 227 )
	quadCardWidget:setRGB( 1, 1, 1 )
	self:addElement( quadCardWidget )
	self.quadCardWidget = quadCardWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				quadCardWidget:completeAnimation()
				self.quadCardWidget:setRGB( 1, 1, 1 )
				self.clipFinished( quadCardWidget, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				quadCardWidget:completeAnimation()
				self.quadCardWidget:setAlpha( 1 )
				self.clipFinished( quadCardWidget, {} )
			end
		},
		BoxFocus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local quadCardWidgetFrame2 = function ( quadCardWidget, event )
					if not event.interrupted then
						quadCardWidget:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					quadCardWidget:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( quadCardWidget, event )
					else
						quadCardWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				quadCardWidget:completeAnimation()
				self.quadCardWidget:setZoom( 0 )
				quadCardWidgetFrame2( quadCardWidget, {} )
			end
		}
	}
	quadCardWidget.id = "quadCardWidget"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.quadCardWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.quadCardWidget:close()
		CoD.QuadCardWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

