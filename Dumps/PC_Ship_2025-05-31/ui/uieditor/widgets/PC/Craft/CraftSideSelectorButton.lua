local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setHandleMouse( true )
	f1_arg0:registerEventHandler( "button_action", function ( element, event )
		if f1_arg0.turnDirection then
			f1_arg0:dispatchEventToParent( {
				name = "change_paintshop_view",
				direction = f1_arg0.turnDirection,
				controller = f1_arg1
			} )
		end
		return true
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.CraftSideSelectorButton = InheritFrom( LUI.UIElement )
CoD.CraftSideSelectorButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CraftSideSelectorButton )
	self.id = "CraftSideSelectorButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 27 )
	self:setTopBottom( true, false, 0, 25 )
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( true, true, 5, -5 )
	arrow:setTopBottom( true, true, 5, -5 )
	arrow:setRGB( 0, 0, 0 )
	arrow:setImage( RegisterImage( "uie_lui_arrow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				arrow:completeAnimation()
				self.arrow:setLeftRight( true, true, 3, -3 )
				self.arrow:setTopBottom( true, true, 3.24, -3.24 )
				self.arrow:setRGB( 0, 0, 0 )
				self.arrow:setScale( 1 )
				self.clipFinished( arrow, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )
				arrow:completeAnimation()
				self.arrow:setLeftRight( true, true, 3, -3 )
				self.arrow:setTopBottom( true, true, 3.24, -3.24 )
				self.arrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( arrow, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

