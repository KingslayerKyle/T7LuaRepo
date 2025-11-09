CoD.CategoryNameWidget = InheritFrom( LUI.UIElement )
CoD.CategoryNameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CategoryNameWidget )
	self.id = "CategoryNameWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 103 )
	self:setTopBottom( true, false, 0, 34 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 8 )
	Image1:setTopBottom( true, false, 0, 8 )
	Image1:setImage( RegisterImage( "uie_t7_menu_cac_itemtitleglowul" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, true, 8, -8 )
	Image2:setTopBottom( true, false, 0, 8 )
	Image2:setImage( RegisterImage( "uie_t7_menu_cac_itemtitleglowum" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -8, 0 )
	Image3:setTopBottom( true, false, 0, 8 )
	Image3:setImage( RegisterImage( "uie_t7_menu_cac_itemtitleglowur" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 0, 8 )
	Image4:setTopBottom( true, true, 8, -8 )
	Image4:setImage( RegisterImage( "uie_t7_menu_cac_itemtitleglowml" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, true, 8, -8 )
	Image5:setTopBottom( true, true, 8, -8 )
	Image5:setImage( RegisterImage( "uie_t7_menu_cac_itemtitleglowmm" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( false, true, -8, 0 )
	Image6:setTopBottom( true, true, 8, -8 )
	Image6:setImage( RegisterImage( "uie_t7_menu_cac_itemtitleglowmr" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, false, 0, 8 )
	Image7:setTopBottom( false, true, -8, 0 )
	Image7:setImage( RegisterImage( "uie_t7_menu_cac_itemtitleglowll" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, true, 8, -8 )
	Image8:setTopBottom( false, true, -8, 0 )
	Image8:setImage( RegisterImage( "uie_t7_menu_cac_itemtitleglowlm" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( false, true, -8, 0 )
	Image9:setTopBottom( false, true, -8, 0 )
	Image9:setImage( RegisterImage( "uie_t7_menu_cac_itemtitleglowlr" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -50.21, 51.79 )
	Glow:setTopBottom( false, false, -31, 42 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local categoryNameLabel = LUI.UIText.new()
	categoryNameLabel:setLeftRight( true, true, 14, 6 )
	categoryNameLabel:setTopBottom( false, false, -10.32, 14.68 )
	categoryNameLabel:setRGB( 0, 0, 0 )
	categoryNameLabel:setTTF( "fonts/escom.ttf" )
	categoryNameLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	categoryNameLabel:setShaderVector( 0, 0.06, 0, 0, 0 )
	categoryNameLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	categoryNameLabel:setShaderVector( 2, 1, 0, 0, 0 )
	categoryNameLabel:setLetterSpacing( 0.6 )
	categoryNameLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	categoryNameLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	categoryNameLabel:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			categoryNameLabel:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( categoryNameLabel )
	self.categoryNameLabel = categoryNameLabel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.categoryNameLabel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

