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
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 600 )
	
	local debugImage = LUI.UIImage.new()
	debugImage:setLeftRight( 0, 1, 0, 0 )
	debugImage:setTopBottom( 0, 1, -2, 0 )
	debugImage:setAlpha( 0 )
	self:addElement( debugImage )
	self.debugImage = debugImage
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

