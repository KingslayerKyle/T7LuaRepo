CoD.RipperLockArrowWidget = InheritFrom( LUI.UIElement )
CoD.RipperLockArrowWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.RipperLockArrowWidget )
	self.id = "RipperLockArrowWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 39 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 1, -2 )
	Image0:setAlpha( 0.2 )
	Image0:setZoom( 1 )
	Image0:setImage( RegisterImage( "uie_ripperlock_arrowglow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, true, 0, 0 )
	Image1:setTopBottom( true, true, 3, 0 )
	Image1:setRGB( 0, 0.84, 0.82 )
	Image1:setImage( RegisterImage( "uie_ripperlock_arrow" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( true, true, 0, 0 )
	Image100:setTopBottom( true, true, 3, 0 )
	Image100:setRGB( 0, 0.84, 0.82 )
	Image100:setAlpha( 0.93 )
	Image100:setImage( RegisterImage( "uie_ripperlock_arrow_notadd" ) )
	self:addElement( Image100 )
	self.Image100 = Image100
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

