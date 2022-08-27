-- 848b5b60ae62720035f7f73ec5fe15c6
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 534 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local frame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	frame:setLeftRight( true, false, 0, 1152 )
	frame:setTopBottom( true, false, 0, 534 )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.frame:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

