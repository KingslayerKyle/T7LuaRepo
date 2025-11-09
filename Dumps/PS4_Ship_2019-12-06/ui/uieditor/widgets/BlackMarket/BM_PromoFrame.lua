CoD.BM_PromoFrame = InheritFrom( LUI.UIElement )
CoD.BM_PromoFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_PromoFrame )
	self.id = "BM_PromoFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 907 )
	self:setTopBottom( true, false, 0, 204 )
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( true, true, -41, -207 )
	Backing:setTopBottom( true, false, 32, 168 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0.5 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, true, 174, -218 )
	Image00:setTopBottom( true, false, 0, 204 )
	Image00:setImage( RegisterImage( "uie_t7_blackmarket_promo_framecenter" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image000 = LUI.UIImage.new()
	Image000:setLeftRight( false, true, -218, -182 )
	Image000:setTopBottom( true, false, 0, 204 )
	Image000:setImage( RegisterImage( "uie_t7_blackmarket_promo_frameright" ) )
	self:addElement( Image000 )
	self.Image000 = Image000
	
	local Image001 = LUI.UIImage.new()
	Image001:setLeftRight( true, false, 174, 0 )
	Image001:setTopBottom( true, false, 0, 204 )
	Image001:setImage( RegisterImage( "uie_t7_blackmarket_promo_framecenter" ) )
	self:addElement( Image001 )
	self.Image001 = Image001
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, false, 51.55, 689 )
	Desc:setTopBottom( true, false, 98, 122 )
	Desc:setRGB( 0.69, 0.9, 0.8 )
	Desc:setText( Engine.Localize( "MENU_50_PERCENT_OFF" ) )
	Desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Desc:setShaderVector( 0, 0.05, 0, 0, 0 )
	Desc:setShaderVector( 1, 0.03, 0, 0, 0 )
	Desc:setShaderVector( 2, 1, 0, 0, 0 )
	Desc:setLineSpacing( -2 )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local Image00Arabic = LUI.UIImage.new()
	Image00Arabic:setLeftRight( true, false, -288, 409 )
	Image00Arabic:setTopBottom( true, false, 0, 204 )
	Image00Arabic:setAlpha( 0 )
	Image00Arabic:setImage( RegisterImage( "uie_t7_blackmarket_promo_framecenter" ) )
	self:addElement( Image00Arabic )
	self.Image00Arabic = Image00Arabic
	
	local Image000Arabic = LUI.UIImage.new()
	Image000Arabic:setLeftRight( true, false, 409, 445 )
	Image000Arabic:setTopBottom( true, false, 0, 204 )
	Image000Arabic:setAlpha( 0 )
	Image000Arabic:setImage( RegisterImage( "uie_t7_blackmarket_promo_frameright" ) )
	self:addElement( Image000Arabic )
	self.Image000Arabic = Image000Arabic
	
	local Image001Arabic = LUI.UIImage.new()
	Image001Arabic:setLeftRight( true, false, -288, -462 )
	Image001Arabic:setTopBottom( true, false, 0, 204 )
	Image001Arabic:setAlpha( 0 )
	Image001Arabic:setImage( RegisterImage( "uie_t7_blackmarket_promo_framecenter" ) )
	self:addElement( Image001Arabic )
	self.Image001Arabic = Image001Arabic
	
	local DescArabic = LUI.UIText.new()
	DescArabic:setLeftRight( true, false, -410.45, 422 )
	DescArabic:setTopBottom( true, false, 98, 122 )
	DescArabic:setRGB( 0.69, 0.9, 0.8 )
	DescArabic:setAlpha( 0 )
	DescArabic:setText( Engine.Localize( "MENU_50_PERCENT_OFF" ) )
	DescArabic:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	DescArabic:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	DescArabic:setShaderVector( 0, 0.05, 0, 0, 0 )
	DescArabic:setShaderVector( 1, 0.03, 0, 0, 0 )
	DescArabic:setShaderVector( 2, 1, 0, 0, 0 )
	DescArabic:setLineSpacing( -2 )
	DescArabic:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DescArabic:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DescArabic )
	self.DescArabic = DescArabic
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Arabic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Image00:completeAnimation()
				self.Image00:setLeftRight( true, true, 174, -36 )
				self.Image00:setTopBottom( true, false, 0, 204 )
				self.Image00:setAlpha( 0 )
				self.clipFinished( Image00, {} )
				Image000:completeAnimation()
				self.Image000:setLeftRight( false, true, -36, 0 )
				self.Image000:setTopBottom( true, false, 0, 204 )
				self.Image000:setAlpha( 0 )
				self.clipFinished( Image000, {} )
				Image001:completeAnimation()
				self.Image001:setLeftRight( true, false, 174, 0 )
				self.Image001:setTopBottom( true, false, 0, 204 )
				self.Image001:setAlpha( 0 )
				self.clipFinished( Image001, {} )
				Desc:completeAnimation()
				self.Desc:setLeftRight( true, false, 51.55, 884 )
				self.Desc:setTopBottom( true, false, 98, 124 )
				self.Desc:setAlpha( 0 )
				self.clipFinished( Desc, {} )
				Image00Arabic:completeAnimation()
				self.Image00Arabic:setAlpha( 1 )
				self.clipFinished( Image00Arabic, {} )
				Image000Arabic:completeAnimation()
				self.Image000Arabic:setAlpha( 1 )
				self.clipFinished( Image000Arabic, {} )
				Image001Arabic:completeAnimation()
				self.Image001Arabic:setAlpha( 1 )
				self.clipFinished( Image001Arabic, {} )
				DescArabic:completeAnimation()
				self.DescArabic:setAlpha( 1 )
				self.clipFinished( DescArabic, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Arabic",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

