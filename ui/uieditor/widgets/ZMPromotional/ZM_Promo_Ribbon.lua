-- 876c0931b3a97f55cf9d11723ba3536b
-- This hash is used for caching, delete to decompile the file again

CoD.ZM_Promo_Ribbon = InheritFrom( LUI.UIElement )
CoD.ZM_Promo_Ribbon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZM_Promo_Ribbon )
	self.id = "ZM_Promo_Ribbon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 95 )
	self:setTopBottom( true, false, 0, 35 )
	
	local PromoRibbon = LUI.UIImage.new()
	PromoRibbon:setLeftRight( false, true, -22.43, -0.28 )
	PromoRibbon:setTopBottom( true, false, 4, 33.52 )
	PromoRibbon:setYRot( 180 )
	PromoRibbon:setImage( RegisterImage( "uie_t7_blackmarket_promo_ribbon_left" ) )
	self:addElement( PromoRibbon )
	self.PromoRibbon = PromoRibbon
	
	local PromoRibbon0 = LUI.UIImage.new()
	PromoRibbon0:setLeftRight( true, true, 27, -22.43 )
	PromoRibbon0:setTopBottom( true, false, 4, 33.52 )
	PromoRibbon0:setYRot( 180 )
	PromoRibbon0:setImage( RegisterImage( "uie_t7_blackmarket_promo_ribbon_center" ) )
	self:addElement( PromoRibbon0 )
	self.PromoRibbon0 = PromoRibbon0
	
	local PromoRibbon00 = LUI.UIImage.new()
	PromoRibbon00:setLeftRight( true, false, 4.57, 27 )
	PromoRibbon00:setTopBottom( true, false, 4, 33.52 )
	PromoRibbon00:setYRot( 180 )
	PromoRibbon00:setImage( RegisterImage( "uie_t7_blackmarket_promo_ribbon_right" ) )
	self:addElement( PromoRibbon00 )
	self.PromoRibbon00 = PromoRibbon00
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, true, -4, -10.28 )
	Text:setTopBottom( false, false, -3.98, 13.02 )
	Text:setRGB( 0, 0, 0 )
	Text:setText( Engine.Localize( "MENU_50PERCENTOFF" ) )
	Text:setTTF( "fonts/escom.ttf" )
	Text:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Text:setShaderVector( 0, 0.03, 0, 0, 0 )
	Text:setShaderVector( 1, 0.01, 0, 0, 0 )
	Text:setShaderVector( 2, 1, 0, 0, 0 )
	Text:setLetterSpacing( 1.3 )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Text:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )

	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, controller )
		ScaleWidgetToLabelRightAligned( self, element, 15 )
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

