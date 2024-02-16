-- 31701e32b85f3d3f8f58408f339665c3
-- This hash is used for caching, delete to decompile the file again

CoD.CryptokeyTypeNameLeftInternal = InheritFrom( LUI.UIElement )
CoD.CryptokeyTypeNameLeftInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CryptokeyTypeNameLeftInternal )
	self.id = "CryptokeyTypeNameLeftInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 22 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	bg:setRGB( 0, 0.6, 0.9 )
	self:addElement( bg )
	self.bg = bg
	
	local GoldBG = LUI.UIImage.new()
	GoldBG:setLeftRight( true, true, 0, 0 )
	GoldBG:setTopBottom( true, true, -8.68, 8.68 )
	GoldBG:setImage( RegisterImage( "uie_t7_icon_cac_bm_label" ) )
	GoldBG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	GoldBG:setShaderVector( 0, 0.48, 0.25, 0.4, 0.35 )
	GoldBG:setupNineSliceShader( 72, 10 )
	self:addElement( GoldBG )
	self.GoldBG = GoldBG
	
	local nameText = LUI.UIText.new()
	nameText:setLeftRight( true, true, 7, -7 )
	nameText:setTopBottom( false, false, -11, 11 )
	nameText:setText( Engine.Localize( "MPUI_BM_RARE" ) )
	nameText:setTTF( "fonts/escom.ttf" )
	nameText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	nameText:setShaderVector( 0, 0.09, 0, 0, 0 )
	nameText:setShaderVector( 1, 0.06, 0, 0, 0 )
	nameText:setShaderVector( 2, 1, 0, 0, 0 )
	nameText:setLetterSpacing( 2 )
	nameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	nameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( nameText, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( nameText )
	self.nameText = nameText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Common = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				bg:completeAnimation()
				self.bg:setRGB( ColorSet.BlackMarketCommon.r, ColorSet.BlackMarketCommon.g, ColorSet.BlackMarketCommon.b )
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )

				GoldBG:completeAnimation()
				self.GoldBG:setAlpha( 0 )
				self.clipFinished( GoldBG, {} )

				nameText:completeAnimation()
				self.nameText:setRGB( 0, 0, 0 )
				self.clipFinished( nameText, {} )
			end
		},
		Rare = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				bg:completeAnimation()
				self.bg:setRGB( 0, 0.6, 0.9 )
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )

				GoldBG:completeAnimation()
				self.GoldBG:setAlpha( 0 )
				self.clipFinished( GoldBG, {} )

				nameText:completeAnimation()
				self.nameText:setRGB( 1, 1, 1 )
				self.clipFinished( nameText, {} )
			end
		},
		Legendary = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				bg:completeAnimation()
				self.bg:setRGB( ColorSet.BlackMarketLegendary.r, ColorSet.BlackMarketLegendary.g, ColorSet.BlackMarketLegendary.b )
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )

				GoldBG:completeAnimation()
				self.GoldBG:setAlpha( 0 )
				self.clipFinished( GoldBG, {} )

				nameText:completeAnimation()
				self.nameText:setRGB( 1, 1, 1 )
				self.clipFinished( nameText, {} )
			end
		},
		Epic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				bg:completeAnimation()
				self.bg:setRGB( 1, 0.67, 0 )
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )

				GoldBG:completeAnimation()
				self.GoldBG:setAlpha( 0 )
				self.clipFinished( GoldBG, {} )

				nameText:completeAnimation()
				self.nameText:setRGB( 1, 1, 1 )
				self.clipFinished( nameText, {} )
			end
		},
		Limited = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				bg:completeAnimation()
				self.bg:setRGB( ColorSet.BlackMarketLimited.r, ColorSet.BlackMarketLimited.g, ColorSet.BlackMarketLimited.b )
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				GoldBG:completeAnimation()
				self.GoldBG:setLeftRight( true, true, 0, 0 )
				self.GoldBG:setTopBottom( true, true, -8.68, 8.68 )
				self.GoldBG:setAlpha( 1 )
				self.GoldBG:setScale( 1.05 )
				self.GoldBG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
				self.GoldBG:setShaderVector( 0, 0.86, 0, 0.4, 0.35 )
				self.clipFinished( GoldBG, {} )

				nameText:completeAnimation()
				self.nameText:setRGB( 0, 0, 0 )
				self.nameText:setScale( 0.9 )
				self.clipFinished( nameText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Common",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarity", "MPUI_BM_COMMON" )
			end
		},
		{
			stateName = "Rare",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarity", "MPUI_BM_RARE" )
			end
		},
		{
			stateName = "Legendary",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarity", "MPUI_BM_LEGENDARY" )
			end
		},
		{
			stateName = "Epic",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarity", "MPUI_BM_EPIC" )
			end
		},
		{
			stateName = "Limited",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarity", "MPUI_BM_LIMITED" )
			end
		}
	} )
	self:linkToElementModel( self, "rarity", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rarity"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
