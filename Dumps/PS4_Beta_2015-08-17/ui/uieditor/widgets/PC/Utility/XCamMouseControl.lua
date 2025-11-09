local SetupPC = function ( self, controller, menu )
	self:setupXCamMouseControl()
	self:setHandleMouse( true )
	self:registerEventHandler( "button_action", function ( element, event )
		
	end )
	self:registerEventHandler( "mouseenter", function ( element, event )
		Engine.SetMouseCursor( "xcam_cursor" )
	end )
	self:registerEventHandler( "mouseleave", function ( element, event )
		Engine.SetMouseCursor( "" )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
		Engine.SetMouseCursor( "" )
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		SetupPC( self, controller, menu )
	end
end

CoD.XCamMouseControl = InheritFrom( LUI.UIElement )
CoD.XCamMouseControl.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.XCamMouseControl )
	self.id = "XCamMouseControl"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 400 )
	
	local debugImage = LUI.UIImage.new()
	debugImage:setLeftRight( true, true, 0, 0 )
	debugImage:setTopBottom( true, true, -1, 0 )
	debugImage:setAlpha( 0 )
	self:addElement( debugImage )
	self.debugImage = debugImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				debugImage:completeAnimation()
				self.debugImage:setAlpha( 0 )
				self.clipFinished( debugImage, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )
				debugImage:completeAnimation()
				self.debugImage:setAlpha( 0 )
				self.clipFinished( debugImage, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

