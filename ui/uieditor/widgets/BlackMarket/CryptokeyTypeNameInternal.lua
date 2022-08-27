-- ab80824380035e7cce65947e70861103
-- This hash is used for caching, delete to decompile the file again

CoD.CryptokeyTypeNameInternal = InheritFrom( LUI.UIElement )
CoD.CryptokeyTypeNameInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CryptokeyTypeNameInternal )
	self.id = "CryptokeyTypeNameInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 22 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	bg:setRGB( 0, 0.6, 0.9 )
	self:addElement( bg )
	self.bg = bg
	
	local nameText = LUI.UIText.new()
	nameText:setLeftRight( false, false, -250, 250 )
	nameText:setTopBottom( true, false, 0, 22 )
	nameText:setText( Engine.Localize( "MPUI_BM_RARE" ) )
	nameText:setTTF( "fonts/escom.ttf" )
	nameText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	nameText:setShaderVector( 0, 0.09, 0, 0, 0 )
	nameText:setShaderVector( 1, 0.06, 0, 0, 0 )
	nameText:setShaderVector( 2, 1, 0, 0, 0 )
	nameText:setLetterSpacing( 2 )
	nameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	nameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( nameText, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 7 )
	end )
	self:addElement( nameText )
	self.nameText = nameText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				bg:completeAnimation()
				self.bg:setRGB( 0, 0.6, 0.9 )
				self.clipFinished( bg, {} )
				nameText:completeAnimation()
				self.nameText:setAlpha( 1 )
				self.clipFinished( nameText, {} )
			end
		},
		Common = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				bg:completeAnimation()
				self.bg:setRGB( ColorSet.BlackMarketCommon.r, ColorSet.BlackMarketCommon.g, ColorSet.BlackMarketCommon.b )
				self.clipFinished( bg, {} )
				nameText:completeAnimation()
				self.nameText:setRGB( 0, 0, 0 )
				self.clipFinished( nameText, {} )
			end
		},
		Rare = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				bg:completeAnimation()
				self.bg:setRGB( 0, 0.6, 0.9 )
				self.clipFinished( bg, {} )
				nameText:completeAnimation()
				self.nameText:setRGB( 1, 1, 1 )
				self.clipFinished( nameText, {} )
			end
		},
		Legendary = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				bg:completeAnimation()
				self.bg:setRGB( ColorSet.BlackMarketLegendary.r, ColorSet.BlackMarketLegendary.g, ColorSet.BlackMarketLegendary.b )
				self.clipFinished( bg, {} )
				nameText:completeAnimation()
				self.nameText:setRGB( 1, 1, 1 )
				self.clipFinished( nameText, {} )
			end
		},
		Epic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				bg:completeAnimation()
				self.bg:setRGB( 1, 0.67, 0 )
				self.clipFinished( bg, {} )
				nameText:completeAnimation()
				self.nameText:setRGB( 1, 1, 1 )
				self.clipFinished( nameText, {} )
			end
		},
		Bribe = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				bg:completeAnimation()
				self.bg:setRGB( 1, 1, 1 )
				self.clipFinished( bg, {} )
				nameText:completeAnimation()
				self.nameText:setRGB( 0, 0, 0 )
				self.clipFinished( nameText, {} )
			end
		},
		Bundle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				bg:completeAnimation()
				self.bg:setRGB( 0, 0.6, 0.9 )
				self.clipFinished( bg, {} )
				nameText:completeAnimation()
				self.nameText:setAlpha( 1 )
				self.clipFinished( nameText, {} )
			end
		},
		SixPack = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				bg:completeAnimation()
				self.bg:setRGB( ColorSet.BlackMarketCommon.r, ColorSet.BlackMarketCommon.g, ColorSet.BlackMarketCommon.b )
				self.clipFinished( bg, {} )
				nameText:completeAnimation()
				self.nameText:setRGB( 0, 0, 0 )
				self.clipFinished( nameText, {} )
			end
		},
		Limited = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				bg:completeAnimation()
				self.bg:setRGB( ColorSet.BlackMarketLimited.r, ColorSet.BlackMarketLimited.g, ColorSet.BlackMarketLimited.b )
				self.clipFinished( bg, {} )
				nameText:completeAnimation()
				self.nameText:setRGB( 0, 0, 0 )
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
		},
		{
			stateName = "Bribe",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToAnyValue( element, controller, "rarity", "MPUI_BM_BRIBE_CALLINGCARD", "MPUI_BM_BRIBE_OUTFIT", "MPUI_BM_BRIBE_TAUNTS_GESTURES" )
			end
		},
		{
			stateName = "Bundle",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarity", "MPUI_BM_BUNDLE" )
			end
		},
		{
			stateName = "SixPack",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarity", "MPUI_BM_SIX_PACK" )
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

