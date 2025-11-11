CoD.GridItemButtonBackdropSymbols = InheritFrom( LUI.UIElement )
CoD.GridItemButtonBackdropSymbols.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GridItemButtonBackdropSymbols )
	self.id = "GridItemButtonBackdropSymbols"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( 0, 0, 0, 1642 )
	self:setTopBottom( 0, 0, 0, 685 )
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0, 0, 0, 16 )
	Image2:setTopBottom( 0, 0, 0, 12 )
	Image2:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 0, 168, 184 )
	Image3:setTopBottom( 0, 0, 0, 12 )
	Image3:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 0, 0, 336, 352 )
	Image4:setTopBottom( 0, 0, 0, 12 )
	Image4:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( 0, 0, 505, 521 )
	Image5:setTopBottom( 0, 0, 0, 12 )
	Image5:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( 0, 0, 0, 16 )
	Image6:setTopBottom( 0, 0, 168, 180 )
	Image6:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( 0, 0, 168, 184 )
	Image7:setTopBottom( 0, 0, 168, 180 )
	Image7:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( 0, 0, 336, 352 )
	Image8:setTopBottom( 0, 0, 168, 180 )
	Image8:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( 0, 0, 505, 521 )
	Image9:setTopBottom( 0, 0, 168, 180 )
	Image9:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( 0, 0, 0, 16 )
	Image10:setTopBottom( 0, 0, 337, 349 )
	Image10:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image11 = LUI.UIImage.new()
	Image11:setLeftRight( 0, 0, 168, 184 )
	Image11:setTopBottom( 0, 0, 337, 349 )
	Image11:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image11:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image11 )
	self.Image11 = Image11
	
	local Image12 = LUI.UIImage.new()
	Image12:setLeftRight( 0, 0, 336, 352 )
	Image12:setTopBottom( 0, 0, 337, 349 )
	Image12:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image12:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image12 )
	self.Image12 = Image12
	
	local Image13 = LUI.UIImage.new()
	Image13:setLeftRight( 0, 0, 505, 521 )
	Image13:setTopBottom( 0, 0, 337, 349 )
	Image13:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image13:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image13 )
	self.Image13 = Image13
	
	local Image14 = LUI.UIImage.new()
	Image14:setLeftRight( 0, 0, 0, 16 )
	Image14:setTopBottom( 0, 0, 505, 517 )
	Image14:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image14:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image14 )
	self.Image14 = Image14
	
	local Image15 = LUI.UIImage.new()
	Image15:setLeftRight( 0, 0, 168, 184 )
	Image15:setTopBottom( 0, 0, 505, 517 )
	Image15:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image15:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image15 )
	self.Image15 = Image15
	
	local Image16 = LUI.UIImage.new()
	Image16:setLeftRight( 0, 0, 336, 352 )
	Image16:setTopBottom( 0, 0, 505, 517 )
	Image16:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image16:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image16 )
	self.Image16 = Image16
	
	local Image17 = LUI.UIImage.new()
	Image17:setLeftRight( 0, 0, 505, 521 )
	Image17:setTopBottom( 0, 0, 505, 517 )
	Image17:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image17:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image17 )
	self.Image17 = Image17
	
	local Image18 = LUI.UIImage.new()
	Image18:setLeftRight( 0, 0, 0, 16 )
	Image18:setTopBottom( 0, 0, 674, 686 )
	Image18:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image18:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image18 )
	self.Image18 = Image18
	
	local Image19 = LUI.UIImage.new()
	Image19:setLeftRight( 0, 0, 168, 184 )
	Image19:setTopBottom( 0, 0, 674, 686 )
	Image19:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image19:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image19 )
	self.Image19 = Image19
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( 0, 0, 336, 352 )
	Image20:setTopBottom( 0, 0, 674, 686 )
	Image20:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	local Image21 = LUI.UIImage.new()
	Image21:setLeftRight( 0, 0, 505, 521 )
	Image21:setTopBottom( 0, 0, 674, 686 )
	Image21:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image21:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image21 )
	self.Image21 = Image21
	
	local Image22 = LUI.UIImage.new()
	Image22:setLeftRight( 0, 0, 547, 563 )
	Image22:setTopBottom( 0, 0, 674, 686 )
	Image22:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image22:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image22 )
	self.Image22 = Image22
	
	local Image23 = LUI.UIImage.new()
	Image23:setLeftRight( 0, 0, 1625, 1641 )
	Image23:setTopBottom( 0, 0, 674, 686 )
	Image23:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image23:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image23 )
	self.Image23 = Image23
	
	local Image24 = LUI.UIImage.new()
	Image24:setLeftRight( 0, 0, 545, 561 )
	Image24:setTopBottom( 0, 0, 0, 12 )
	Image24:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image24:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image24 )
	self.Image24 = Image24
	
	local Image25 = LUI.UIImage.new()
	Image25:setLeftRight( 0, 0, 1626, 1642 )
	Image25:setTopBottom( 0, 0, 0, 12 )
	Image25:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image25:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image25 )
	self.Image25 = Image25
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

