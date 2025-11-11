CoD.BM_Logo = InheritFrom( LUI.UIElement )
CoD.BM_Logo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Logo )
	self.id = "BM_Logo"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 486 )
	self:setTopBottom( 0, 0, 0, 181 )
	
	local logo = LUI.UIImage.new()
	logo:setLeftRight( 0, 0, 0, 508 )
	logo:setTopBottom( 0, 0, 0, 182 )
	logo:setImage( RegisterImage( "uie_t7_blackmarket_screen_header" ) )
	self:addElement( logo )
	self.logo = logo
	
	local text = LUI.UITightText.new()
	text:setLeftRight( 0, 0, 226, 470 )
	text:setTopBottom( 0, 0, 80, 105 )
	text:setRGB( 0.49, 0.59, 0.59 )
	text:setScale( 0.8 )
	text:setText( Engine.Localize( "MPUI_CONTRABAND_CAPS" ) )
	text:setTTF( "fonts/escom.ttf" )
	text:setLetterSpacing( 8.2 )
	self:addElement( text )
	self.text = text
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

