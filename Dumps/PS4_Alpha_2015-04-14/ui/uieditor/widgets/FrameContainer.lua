CoD.FrameContainer = InheritFrom( LUI.UIElement )
CoD.FrameContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FrameContainer )
	self.id = "FrameContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 256 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local frame = LUI.UIFrame.new( menu, controller, 0, 0 )
	frame:setLeftRight( true, true, 0, 0 )
	frame:setTopBottom( true, true, 0, 0 )
	frame:setRGB( 1, 1, 1 )
	self:addElement( frame )
	self.frame = frame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				frame:completeAnimation()
				self.frame:setAlpha( 1 )
				self.clipFinished( frame, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				frame:completeAnimation()
				self.frame:setAlpha( 0 )
				self.clipFinished( frame, {} )
			end
		}
	}
	frame.id = "frame"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.frame:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

