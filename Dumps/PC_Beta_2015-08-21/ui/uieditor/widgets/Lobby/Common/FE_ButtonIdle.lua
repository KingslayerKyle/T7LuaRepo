CoD.FE_ButtonIdle = InheritFrom( LUI.UIElement )
CoD.FE_ButtonIdle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ButtonIdle )
	self.id = "FE_ButtonIdle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 82 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( true, false, -1, 7 )
	Image9:setTopBottom( false, true, -6, 2 )
	Image9:setImage( RegisterImage( "uie_t7_menu_frontend_buttonidlell" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, true, 7, -7 )
	Image10:setTopBottom( false, true, -6, 2 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_buttonidlelm" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image11 = LUI.UIImage.new()
	Image11:setLeftRight( false, true, -7, 1 )
	Image11:setTopBottom( false, true, -6, 2 )
	Image11:setImage( RegisterImage( "uie_t7_menu_frontend_buttonidlelr" ) )
	Image11:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image11 )
	self.Image11 = Image11
	
	local Image12 = LUI.UIImage.new()
	Image12:setLeftRight( true, false, -1, 7 )
	Image12:setTopBottom( true, true, 6, -6 )
	Image12:setImage( RegisterImage( "uie_t7_menu_frontend_buttonidleml" ) )
	Image12:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image12 )
	self.Image12 = Image12
	
	local Image13 = LUI.UIImage.new()
	Image13:setLeftRight( true, true, 7, -7 )
	Image13:setTopBottom( true, true, 6, -6 )
	Image13:setImage( RegisterImage( "uie_t7_menu_frontend_buttonidlemm" ) )
	Image13:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image13 )
	self.Image13 = Image13
	
	local Image14 = LUI.UIImage.new()
	Image14:setLeftRight( false, true, -7, 1 )
	Image14:setTopBottom( true, true, 6, -6 )
	Image14:setImage( RegisterImage( "uie_t7_menu_frontend_buttonidlemr" ) )
	Image14:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image14 )
	self.Image14 = Image14
	
	local Image15 = LUI.UIImage.new()
	Image15:setLeftRight( true, false, -1, 7 )
	Image15:setTopBottom( true, false, -2, 6 )
	Image15:setImage( RegisterImage( "uie_t7_menu_frontend_buttonidleul" ) )
	Image15:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image15 )
	self.Image15 = Image15
	
	local Image16 = LUI.UIImage.new()
	Image16:setLeftRight( true, true, 7, -7 )
	Image16:setTopBottom( true, false, -2, 6 )
	Image16:setImage( RegisterImage( "uie_t7_menu_frontend_buttonidleum" ) )
	Image16:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image16 )
	self.Image16 = Image16
	
	local Image17 = LUI.UIImage.new()
	Image17:setLeftRight( false, true, -7, 1 )
	Image17:setTopBottom( true, false, -2, 6 )
	Image17:setImage( RegisterImage( "uie_t7_menu_frontend_buttonidleur" ) )
	Image17:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image17 )
	self.Image17 = Image17
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

