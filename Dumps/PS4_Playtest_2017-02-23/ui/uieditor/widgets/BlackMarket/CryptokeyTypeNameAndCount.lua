CoD.CryptokeyTypeNameAndCount = InheritFrom( LUI.UIElement )
CoD.CryptokeyTypeNameAndCount.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CryptokeyTypeNameAndCount )
	self.id = "CryptokeyTypeNameAndCount"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 270 )
	self:setTopBottom( 0, 0, 0, 40 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 1, 48, 0 )
	bg:setTopBottom( 0, 1, 0, 0 )
	bg:setRGB( ColorSet.BlackMarketRare.r, ColorSet.BlackMarketRare.g, ColorSet.BlackMarketRare.b )
	bg:setAlpha( 0.2 )
	self:addElement( bg )
	self.bg = bg
	
	local Labelcommon = LUI.UIImage.new()
	Labelcommon:setLeftRight( 0, 0, -11, 67 )
	Labelcommon:setTopBottom( 0, 0, -10, 50 )
	Labelcommon:setAlpha( 0 )
	Labelcommon:setImage( RegisterImage( "uie_t7_blackmarket_label_common" ) )
	self:addElement( Labelcommon )
	self.Labelcommon = Labelcommon
	
	local Labelrare = LUI.UIImage.new()
	Labelrare:setLeftRight( 0, 0, -11, 67 )
	Labelrare:setTopBottom( 0, 0, -9, 51 )
	Labelrare:setAlpha( 0 )
	Labelrare:setImage( RegisterImage( "uie_t7_blackmarket_label_rare" ) )
	self:addElement( Labelrare )
	self.Labelrare = Labelrare
	
	local Labellegendary = LUI.UIImage.new()
	Labellegendary:setLeftRight( 0, 0, -11, 67 )
	Labellegendary:setTopBottom( 0, 0, -10, 50 )
	Labellegendary:setAlpha( 0 )
	Labellegendary:setImage( RegisterImage( "uie_t7_blackmarket_label_legendary" ) )
	self:addElement( Labellegendary )
	self.Labellegendary = Labellegendary
	
	local Labelepic = LUI.UIImage.new()
	Labelepic:setLeftRight( 0, 0, -11, 67 )
	Labelepic:setTopBottom( 0, 0, -10, 50 )
	Labelepic:setAlpha( 0 )
	Labelepic:setImage( RegisterImage( "uie_t7_blackmarket_label_epic" ) )
	self:addElement( Labelepic )
	self.Labelepic = Labelepic
	
	local nameText = LUI.UIText.new()
	nameText:setLeftRight( 0, 1, 58, 0 )
	nameText:setTopBottom( 0, 0, 3, 36 )
	nameText:setRGB( 0, 0, 0 )
	nameText:setText( Engine.Localize( "MPUI_BM_RARE" ) )
	nameText:setTTF( "fonts/escom.ttf" )
	nameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	nameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( nameText, "setText", function ( element, text )
		ScaleWidgetToLabelLeftJustify( self, element, 0 )
	end )
	self:addElement( nameText )
	self.nameText = nameText
	
	local count = LUI.UIText.new()
	count:setLeftRight( 0, 0, 3, 54 )
	count:setTopBottom( 0, 0, 3, 36 )
	count:setText( Engine.Localize( "4" ) )
	count:setTTF( "fonts/escom.ttf" )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( count )
	self.count = count
	
	self.resetProperties = function ()
		bg:completeAnimation()
		Labelcommon:completeAnimation()
		nameText:completeAnimation()
		Labelrare:completeAnimation()
		Labellegendary:completeAnimation()
		Labelepic:completeAnimation()
		bg:setRGB( ColorSet.BlackMarketRare.r, ColorSet.BlackMarketRare.g, ColorSet.BlackMarketRare.b )
		Labelcommon:setAlpha( 0 )
		nameText:setRGB( 0, 0, 0 )
		Labelrare:setAlpha( 0 )
		Labellegendary:setAlpha( 0 )
		Labelepic:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Common = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				bg:completeAnimation()
				self.bg:setRGB( ColorSet.BlackMarketCommon.r, ColorSet.BlackMarketCommon.g, ColorSet.BlackMarketCommon.b )
				self.clipFinished( bg, {} )
				Labelcommon:completeAnimation()
				self.Labelcommon:setAlpha( 1 )
				self.clipFinished( Labelcommon, {} )
				nameText:completeAnimation()
				self.nameText:setRGB( 0.79, 0.79, 0.79 )
				self.clipFinished( nameText, {} )
			end
		},
		Rare = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Labelrare:completeAnimation()
				self.Labelrare:setAlpha( 1 )
				self.clipFinished( Labelrare, {} )
				nameText:completeAnimation()
				self.nameText:setRGB( 0.7, 0.85, 1 )
				self.clipFinished( nameText, {} )
			end
		},
		Legendary = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				bg:completeAnimation()
				self.bg:setRGB( ColorSet.BlackMarketLegendary.r, ColorSet.BlackMarketLegendary.g, ColorSet.BlackMarketLegendary.b )
				self.clipFinished( bg, {} )
				Labellegendary:completeAnimation()
				self.Labellegendary:setAlpha( 1 )
				self.clipFinished( Labellegendary, {} )
				nameText:completeAnimation()
				self.nameText:setRGB( 0.8, 0.7, 1 )
				self.clipFinished( nameText, {} )
			end
		},
		Epic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				bg:completeAnimation()
				self.bg:setRGB( ColorSet.BlackMarketEpic.r, ColorSet.BlackMarketEpic.g, ColorSet.BlackMarketEpic.b )
				self.clipFinished( bg, {} )
				Labelepic:completeAnimation()
				self.Labelepic:setAlpha( 1 )
				self.clipFinished( Labelepic, {} )
				nameText:completeAnimation()
				self.nameText:setRGB( 1, 0.91, 0.7 )
				self.clipFinished( nameText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Common",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "cryptoKeyType", "MPUI_BM_COMMON" )
			end
		},
		{
			stateName = "Rare",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "cryptoKeyType", "MPUI_BM_RARE" )
			end
		},
		{
			stateName = "Legendary",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "cryptoKeyType", "MPUI_BM_LEGENDARY" )
			end
		},
		{
			stateName = "Epic",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "cryptoKeyType", "MPUI_BM_EPIC" )
			end
		}
	} )
	self:linkToElementModel( self, "cryptoKeyType", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "cryptoKeyType"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

