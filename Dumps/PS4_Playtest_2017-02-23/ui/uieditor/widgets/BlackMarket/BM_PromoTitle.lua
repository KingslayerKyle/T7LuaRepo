CoD.BM_PromoTitle = InheritFrom( LUI.UIElement )
CoD.BM_PromoTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_PromoTitle )
	self.id = "BM_PromoTitle"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 334 )
	self:setTopBottom( 0, 0, 0, 72 )
	
	local TitleBG = LUI.UIImage.new()
	TitleBG:setLeftRight( 0, 1, 0, 0 )
	TitleBG:setTopBottom( 0, 1, 0, 0 )
	TitleBG:setImage( RegisterImage( "uie_t7_blackmarket_promo_titlebg" ) )
	TitleBG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	TitleBG:setShaderVector( 0, 0, 0, 0, 0 )
	TitleBG:setupNineSliceShader( 24, 12 )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 16, 726 )
	Title:setTopBottom( 0, 0, 10, 61 )
	Title:setRGB( 0, 0, 0 )
	Title:setText( Engine.Localize( "MENU_HALF_OFF" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	Title:setShaderVector( 0, 0.09, 0, 0, 0 )
	Title:setShaderVector( 1, 0.06, 0, 0, 0 )
	Title:setShaderVector( 2, 1, 0, 0, 0 )
	Title:setLetterSpacing( 1.6 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Title, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 10 )
	end )
	self:addElement( Title )
	self.Title = Title
	
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

