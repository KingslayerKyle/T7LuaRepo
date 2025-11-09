CoD.ChooseClassSymbols_old = InheritFrom( LUI.UIElement )
CoD.ChooseClassSymbols_old.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseClassSymbols_old )
	self.id = "ChooseClassSymbols_old"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 829 )
	self:setTopBottom( true, false, 0, 564 )
	
	local symbolplus = LUI.UIImage.new()
	symbolplus:setLeftRight( true, false, 363.84, 374.51 )
	symbolplus:setTopBottom( true, false, 190.5, 198.5 )
	symbolplus:setRGB( 1, 1, 1 )
	symbolplus:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	symbolplus:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( symbolplus )
	self.symbolplus = symbolplus
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 363.84, 374.51 )
	Image0:setTopBottom( true, false, 0, 8 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 817.84, 828.51 )
	Image1:setTopBottom( true, false, 0, 8 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 817.84, 828.51 )
	Image2:setTopBottom( true, false, 190.5, 198.5 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 817.84, 828.51 )
	Image3:setTopBottom( true, false, 333.5, 341.5 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 817.84, 828.51 )
	Image4:setTopBottom( true, false, 444.5, 452.5 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 817.84, 828.51 )
	Image5:setTopBottom( true, false, 555.5, 563.5 )
	Image5:setRGB( 1, 1, 1 )
	Image5:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, false, 363.84, 374.51 )
	Image6:setTopBottom( true, false, 333.5, 341.5 )
	Image6:setRGB( 1, 1, 1 )
	Image6:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, false, 363.34, 374.01 )
	Image7:setTopBottom( true, false, 555.5, 563.5 )
	Image7:setRGB( 1, 1, 1 )
	Image7:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, false, 0, 10.67 )
	Image8:setTopBottom( true, false, 555.5, 563.5 )
	Image8:setRGB( 1, 1, 1 )
	Image8:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( true, false, 0, 10.67 )
	Image9:setTopBottom( true, false, 444, 452 )
	Image9:setRGB( 1, 1, 1 )
	Image9:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 137, 147.67 )
	Image10:setTopBottom( true, false, 333.5, 341.5 )
	Image10:setRGB( 1, 1, 1 )
	Image10:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image11 = LUI.UIImage.new()
	Image11:setLeftRight( true, false, 363.84, 374.51 )
	Image11:setTopBottom( true, false, 444, 452 )
	Image11:setRGB( 1, 1, 1 )
	Image11:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image11:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image11 )
	self.Image11 = Image11
	
	local Image12 = LUI.UIImage.new()
	Image12:setLeftRight( true, false, 590.5, 601.17 )
	Image12:setTopBottom( true, false, 444, 452 )
	Image12:setRGB( 1, 1, 1 )
	Image12:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image12:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image12 )
	self.Image12 = Image12
	
	local Image13 = LUI.UIImage.new()
	Image13:setLeftRight( true, false, 590.5, 601.17 )
	Image13:setTopBottom( true, false, 333.5, 341.5 )
	Image13:setRGB( 1, 1, 1 )
	Image13:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image13:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image13 )
	self.Image13 = Image13
	
	local Image15 = LUI.UIImage.new()
	Image15:setLeftRight( true, false, 137, 147.67 )
	Image15:setTopBottom( true, false, 444, 452 )
	Image15:setRGB( 1, 1, 1 )
	Image15:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image15:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image15 )
	self.Image15 = Image15
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

