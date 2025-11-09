CoD.friendInfo = InheritFrom( LUI.UIElement )
CoD.friendInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.friendInfo )
	self.id = "friendInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 446 )
	self:setTopBottom( true, false, 0, 400 )
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 0, 300.18 )
	emblem:setTopBottom( true, false, 0, 300 )
	emblem:setRGB( 1, 1, 1 )
	emblem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( emblem )
	self.emblem = emblem
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 300.18 )
	Image0:setTopBottom( true, false, 300, 400 )
	Image0:setRGB( 0.67, 0.99, 0.79 )
	Image0:setAlpha( 0.09 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 300.18, 446 )
	Image1:setTopBottom( true, false, 0, 200 )
	Image1:setRGB( 0.98, 0.38, 0.76 )
	Image1:setAlpha( 0.23 )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 300.18, 446 )
	Image2:setTopBottom( true, false, 200, 400 )
	Image2:setRGB( 1, 0.33, 0.33 )
	Image2:setAlpha( 0.23 )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 37.09, 99.09 )
	Label0:setTopBottom( true, false, 326, 374 )
	Label0:setRGB( 1, 1, 1 )
	Label0:setText( Engine.Localize( "MENU_NEW" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

