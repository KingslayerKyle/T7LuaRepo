CoD.BorderBakedSymbols = InheritFrom( LUI.UIElement )
CoD.BorderBakedSymbols.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BorderBakedSymbols )
	self.id = "BorderBakedSymbols"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -5.33, 5.33 )
	Image0:setTopBottom( true, false, -6, 2 )
	Image0:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -2.33, 8.33 )
	Image1:setTopBottom( true, false, -6, 2 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, -5.33, 5.33 )
	Image2:setTopBottom( false, true, -2, 6 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -2.33, 8.34 )
	Image3:setTopBottom( false, true, -2, 6 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

