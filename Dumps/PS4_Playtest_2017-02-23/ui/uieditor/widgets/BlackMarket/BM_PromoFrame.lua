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
	self:setLeftRight( 0, 0, 0, 813 )
	self:setTopBottom( 0, 0, 0, 306 )
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0, 1, 262, -54 )
	Image00:setTopBottom( 0, 0, 0, 306 )
	Image00:setImage( RegisterImage( "uie_t7_blackmarket_promo_framecenter" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image000 = LUI.UIImage.new()
	Image000:setLeftRight( 1, 1, -54, 0 )
	Image000:setTopBottom( 0, 0, 0, 306 )
	Image000:setImage( RegisterImage( "uie_t7_blackmarket_promo_frameright" ) )
	self:addElement( Image000 )
	self.Image000 = Image000
	
	local Image001 = LUI.UIImage.new()
	Image001:setLeftRight( 0, 0, 260.5, -0.5 )
	Image001:setTopBottom( 0, 0, 0, 306 )
	Image001:setImage( RegisterImage( "uie_t7_blackmarket_promo_framecenter" ) )
	self:addElement( Image001 )
	self.Image001 = Image001
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( 0, 0, 77, 780 )
	Desc:setTopBottom( 0, 0, 147, 186 )
	Desc:setRGB( 0.69, 0.9, 0.8 )
	Desc:setText( Engine.Localize( "MENU_50_PERCENT_OFF" ) )
	Desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	Desc:setShaderVector( 0, 0.05, 0, 0, 0 )
	Desc:setShaderVector( 1, 0.03, 0, 0, 0 )
	Desc:setShaderVector( 2, 1, 0, 0, 0 )
	Desc:setLineSpacing( -2 )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Desc, "setText", function ( element, text )
		ScaleWidgetToLabelWrapped( self, element, 2, 1 )
	end )
	self:addElement( Desc )
	self.Desc = Desc
	
	self:mergeStateConditions( {
		{
			stateName = "FiftyPercentOff",
			condition = function ( menu, element, event )
				return IsLootSaleActive( controller )
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

