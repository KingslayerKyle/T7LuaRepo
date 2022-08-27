-- dfe0fb6dbb4c2a76bf5a2694236574df
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 1095 )
	self:setTopBottom( true, false, 0, 457 )
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 0, 10.67 )
	Image2:setTopBottom( true, false, 0, 8 )
	Image2:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 112, 122.67 )
	Image3:setTopBottom( true, false, 0, 8 )
	Image3:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 224, 234.67 )
	Image4:setTopBottom( true, false, 0, 8 )
	Image4:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 336.5, 347.17 )
	Image5:setTopBottom( true, false, 0, 8 )
	Image5:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, false, 0, 10.67 )
	Image6:setTopBottom( true, false, 112, 120 )
	Image6:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, false, 112, 122.67 )
	Image7:setTopBottom( true, false, 112, 120 )
	Image7:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, false, 224, 234.67 )
	Image8:setTopBottom( true, false, 112, 120 )
	Image8:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( true, false, 336.5, 347.17 )
	Image9:setTopBottom( true, false, 112, 120 )
	Image9:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 0, 10.67 )
	Image10:setTopBottom( true, false, 224.5, 232.5 )
	Image10:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image11 = LUI.UIImage.new()
	Image11:setLeftRight( true, false, 112, 122.67 )
	Image11:setTopBottom( true, false, 224.5, 232.5 )
	Image11:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image11:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image11 )
	self.Image11 = Image11
	
	local Image12 = LUI.UIImage.new()
	Image12:setLeftRight( true, false, 224, 234.67 )
	Image12:setTopBottom( true, false, 224.5, 232.5 )
	Image12:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image12:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image12 )
	self.Image12 = Image12
	
	local Image13 = LUI.UIImage.new()
	Image13:setLeftRight( true, false, 336.5, 347.17 )
	Image13:setTopBottom( true, false, 224.5, 232.5 )
	Image13:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image13:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image13 )
	self.Image13 = Image13
	
	local Image14 = LUI.UIImage.new()
	Image14:setLeftRight( true, false, 0, 10.67 )
	Image14:setTopBottom( true, false, 336.5, 344.5 )
	Image14:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image14:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image14 )
	self.Image14 = Image14
	
	local Image15 = LUI.UIImage.new()
	Image15:setLeftRight( true, false, 112, 122.67 )
	Image15:setTopBottom( true, false, 336.5, 344.5 )
	Image15:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image15:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image15 )
	self.Image15 = Image15
	
	local Image16 = LUI.UIImage.new()
	Image16:setLeftRight( true, false, 224, 234.67 )
	Image16:setTopBottom( true, false, 336.5, 344.5 )
	Image16:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image16:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image16 )
	self.Image16 = Image16
	
	local Image17 = LUI.UIImage.new()
	Image17:setLeftRight( true, false, 336.5, 347.17 )
	Image17:setTopBottom( true, false, 336.5, 344.5 )
	Image17:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image17:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image17 )
	self.Image17 = Image17
	
	local Image18 = LUI.UIImage.new()
	Image18:setLeftRight( true, false, 0, 10.67 )
	Image18:setTopBottom( true, false, 449, 457 )
	Image18:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image18:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image18 )
	self.Image18 = Image18
	
	local Image19 = LUI.UIImage.new()
	Image19:setLeftRight( true, false, 112, 122.67 )
	Image19:setTopBottom( true, false, 449, 457 )
	Image19:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image19:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image19 )
	self.Image19 = Image19
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( true, false, 224, 234.67 )
	Image20:setTopBottom( true, false, 449, 457 )
	Image20:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	local Image21 = LUI.UIImage.new()
	Image21:setLeftRight( true, false, 336.5, 347.17 )
	Image21:setTopBottom( true, false, 449, 457 )
	Image21:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image21:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image21 )
	self.Image21 = Image21
	
	local Image22 = LUI.UIImage.new()
	Image22:setLeftRight( true, false, 364.5, 375.17 )
	Image22:setTopBottom( true, false, 449, 457 )
	Image22:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image22:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image22 )
	self.Image22 = Image22
	
	local Image23 = LUI.UIImage.new()
	Image23:setLeftRight( true, false, 1083, 1093.67 )
	Image23:setTopBottom( true, false, 449, 457 )
	Image23:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image23:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image23 )
	self.Image23 = Image23
	
	local Image24 = LUI.UIImage.new()
	Image24:setLeftRight( true, false, 363.5, 374.17 )
	Image24:setTopBottom( true, false, 0, 8 )
	Image24:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image24:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image24 )
	self.Image24 = Image24
	
	local Image25 = LUI.UIImage.new()
	Image25:setLeftRight( true, false, 1084, 1094.67 )
	Image25:setTopBottom( true, false, 0, 8 )
	Image25:setImage( RegisterImage( "uie_img_t7_menu_cacselection_plussymbol" ) )
	Image25:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image25 )
	self.Image25 = Image25
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

