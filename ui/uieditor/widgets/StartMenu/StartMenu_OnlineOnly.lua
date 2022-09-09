-- cdf505ff2895735b275aaf16553489ed
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderThin" )

CoD.StartMenu_OnlineOnly = InheritFrom( LUI.UIElement )
CoD.StartMenu_OnlineOnly.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_OnlineOnly )
	self.id = "StartMenu_OnlineOnly"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 214 )
	self:setTopBottom( true, false, 0, 28 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BorderThin0 = CoD.BorderThin.new( menu, controller )
	BorderThin0:setLeftRight( true, true, 0, 0 )
	BorderThin0:setTopBottom( true, true, 0, 0 )
	self:addElement( BorderThin0 )
	self.BorderThin0 = BorderThin0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 1, -1 )
	Image0:setTopBottom( true, true, 1, -1 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0.6 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local TextBox0 = LUI.UITightText.new()
	TextBox0:setLeftRight( false, false, -40, 40 )
	TextBox0:setTopBottom( true, false, 4.5, 23.5 )
	TextBox0:setText( LocalizeToUpperString( "MENU_ONLINE_ONLY" ) )
	TextBox0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox0:setLetterSpacing( 2 )

	LUI.OverrideFunction_CallOriginalFirst( TextBox0, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 5 )
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderThin0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
