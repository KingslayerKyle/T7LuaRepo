-- 58ebb94ee06feb4231216e6526dd523d
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Promo_Ribbon = InheritFrom( LUI.UIElement )
CoD.BM_Promo_Ribbon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Promo_Ribbon )
	self.id = "BM_Promo_Ribbon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 165 )
	self:setTopBottom( true, false, 0, 35 )
	
	local PromoRibbon = LUI.UIImage.new()
	PromoRibbon:setLeftRight( true, false, 4.86, 27 )
	PromoRibbon:setTopBottom( true, false, 4, 33.52 )
	PromoRibbon:setImage( RegisterImage( "uie_t7_blackmarket_promo_ribbon_left" ) )
	self:addElement( PromoRibbon )
	self.PromoRibbon = PromoRibbon
	
	local PromoRibbon0 = LUI.UIImage.new()
	PromoRibbon0:setLeftRight( true, true, 27, -22.43 )
	PromoRibbon0:setTopBottom( true, false, 4, 33.52 )
	PromoRibbon0:setImage( RegisterImage( "uie_t7_blackmarket_promo_ribbon_center" ) )
	self:addElement( PromoRibbon0 )
	self.PromoRibbon0 = PromoRibbon0
	
	local PromoRibbon00 = LUI.UIImage.new()
	PromoRibbon00:setLeftRight( false, true, -22.43, 0 )
	PromoRibbon00:setTopBottom( true, false, 4, 33.52 )
	PromoRibbon00:setImage( RegisterImage( "uie_t7_blackmarket_promo_ribbon_right" ) )
	self:addElement( PromoRibbon00 )
	self.PromoRibbon00 = PromoRibbon00
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, true, 23.85, -24.67 )
	Text:setTopBottom( true, false, 13.52, 30.52 )
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
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				PromoRibbon:completeAnimation()
				self.PromoRibbon:setAlpha( 0 )
				self.clipFinished( PromoRibbon, {} )
				PromoRibbon0:completeAnimation()
				self.PromoRibbon0:setAlpha( 0 )
				self.clipFinished( PromoRibbon0, {} )
				PromoRibbon00:completeAnimation()
				self.PromoRibbon00:setAlpha( 0 )
				self.clipFinished( PromoRibbon00, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				PromoRibbon:completeAnimation()
				self.PromoRibbon:setAlpha( 1 )
				self.clipFinished( PromoRibbon, {} )
				PromoRibbon0:completeAnimation()
				self.PromoRibbon0:setAlpha( 1 )
				self.clipFinished( PromoRibbon0, {} )
				PromoRibbon00:completeAnimation()
				self.PromoRibbon00:setAlpha( 1 )
				self.clipFinished( PromoRibbon00, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

