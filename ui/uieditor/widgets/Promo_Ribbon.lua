-- 0c82dff2cd70f710607f0c661f5382f8
-- This hash is used for caching, delete to decompile the file again

CoD.Promo_Ribbon = InheritFrom( LUI.UIElement )
CoD.Promo_Ribbon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Promo_Ribbon )
	self.id = "Promo_Ribbon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 113 )
	self:setTopBottom( true, false, 0, 24 )
	
	local PromoRibbon = LUI.UIImage.new()
	PromoRibbon:setLeftRight( true, false, 0, 17.64 )
	PromoRibbon:setTopBottom( true, false, 0, 23.52 )
	PromoRibbon:setImage( RegisterImage( "uie_t7_blackmarket_promo_ribbon_left" ) )
	self:addElement( PromoRibbon )
	self.PromoRibbon = PromoRibbon
	
	local PromoRibbon0 = LUI.UIImage.new()
	PromoRibbon0:setLeftRight( true, true, 17.64, -18.06 )
	PromoRibbon0:setTopBottom( true, false, 0, 23.52 )
	PromoRibbon0:setImage( RegisterImage( "uie_t7_blackmarket_promo_ribbon_center" ) )
	self:addElement( PromoRibbon0 )
	self.PromoRibbon0 = PromoRibbon0
	
	local PromoRibbon00 = LUI.UIImage.new()
	PromoRibbon00:setLeftRight( false, true, -18.06, -0.19 )
	PromoRibbon00:setTopBottom( true, false, 0, 23.52 )
	PromoRibbon00:setImage( RegisterImage( "uie_t7_blackmarket_promo_ribbon_right" ) )
	self:addElement( PromoRibbon00 )
	self.PromoRibbon00 = PromoRibbon00
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, true, 8.82, -10.7 )
	Text:setTopBottom( true, false, 7.52, 21.52 )
	Text:setRGB( 0, 0, 0 )
	Text:setText( Engine.Localize( "MPUI_BM_SPECIAL_OFFER" ) )
	Text:setTTF( "fonts/escom.ttf" )
	Text:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Text:setShaderVector( 0, 0.03, 0, 0, 0 )
	Text:setShaderVector( 1, 0.01, 0, 0, 0 )
	Text:setShaderVector( 2, 1, 0, 0, 0 )
	Text:setLetterSpacing( 1.3 )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, controller )
		ScaleWidgetToLabelLeftJustify( self, element, 10 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
