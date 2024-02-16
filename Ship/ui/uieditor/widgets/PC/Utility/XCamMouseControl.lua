-- 9f687e8a2fdf51061037b4008e8b350e
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setupXCamMouseControl()
	f1_arg0:setHandleMouse( true )
	f1_arg0:registerEventHandler( "button_action", function ( element, event )
		
	end )
	f1_arg0:registerEventHandler( "mouseenter", function ( element, event )
		Engine.SetMouseCursor( "xcam_cursor" )
	end )
	f1_arg0:registerEventHandler( "mouseleave", function ( element, event )
		Engine.SetMouseCursor( "" )
	end )

	LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "close", function ()
		Engine.SetMouseCursor( "" )
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
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
