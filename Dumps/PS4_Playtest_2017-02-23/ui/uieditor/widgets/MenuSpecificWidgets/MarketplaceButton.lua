CoD.MarketplaceButton = InheritFrom( LUI.UIElement )
CoD.MarketplaceButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MarketplaceButton )
	self.id = "MarketplaceButton"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 150 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local SkuName = LUI.UIText.new()
	SkuName:setLeftRight( 0, 0, 267, 525 )
	SkuName:setTopBottom( 0, 0, 9, 63 )
	SkuName:setTTF( "fonts/default.ttf" )
	SkuName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SkuName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SkuName )
	self.SkuName = SkuName
	
	local FocusIcon = LUI.UIImage.new()
	FocusIcon:setLeftRight( 0, 0, -6, 90 )
	FocusIcon:setTopBottom( 0, 0, 27, 123 )
	FocusIcon:setImage( RegisterImage( "uie_headicon_dead" ) )
	self:addElement( FocusIcon )
	self.FocusIcon = FocusIcon
	
	local SkuPriceText = LUI.UIText.new()
	SkuPriceText:setLeftRight( 0, 0, 150, 216 )
	SkuPriceText:setTopBottom( 0, 0, 67, 100 )
	SkuPriceText:setTTF( "fonts/default.ttf" )
	SkuPriceText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SkuPriceText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SkuPriceText )
	self.SkuPriceText = SkuPriceText
	
	local SkuDescription = LUI.UITightText.new()
	SkuDescription:setLeftRight( 0, 0, 90, 210 )
	SkuDescription:setTopBottom( 0, 0, 9, 63 )
	SkuDescription:setText( Engine.Localize( "SKU Name:" ) )
	SkuDescription:setTTF( "fonts/default.ttf" )
	self:addElement( SkuDescription )
	self.SkuDescription = SkuDescription
	
	local SkuPriceLabel = LUI.UITightText.new()
	SkuPriceLabel:setLeftRight( 0, 0, 90, 150 )
	SkuPriceLabel:setTopBottom( 0, 0, 67, 100 )
	SkuPriceLabel:setText( Engine.Localize( "Price:" ) )
	SkuPriceLabel:setTTF( "fonts/default.ttf" )
	self:addElement( SkuPriceLabel )
	self.SkuPriceLabel = SkuPriceLabel
	
	local CurrencyTypeLabel = LUI.UITightText.new()
	CurrencyTypeLabel:setLeftRight( 0, 0, 262, 378 )
	CurrencyTypeLabel:setTopBottom( 0, 0, 67, 100 )
	CurrencyTypeLabel:setText( Engine.Localize( "Currency ID: " ) )
	CurrencyTypeLabel:setTTF( "fonts/default.ttf" )
	self:addElement( CurrencyTypeLabel )
	self.CurrencyTypeLabel = CurrencyTypeLabel
	
	local CurrencyType = LUI.UIText.new()
	CurrencyType:setLeftRight( 0, 0, 380, 438 )
	CurrencyType:setTopBottom( 0, 0, 67, 100 )
	CurrencyType:setTTF( "fonts/default.ttf" )
	CurrencyType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CurrencyType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CurrencyType )
	self.CurrencyType = CurrencyType
	
	local ProductIdLabel = LUI.UITightText.new()
	ProductIdLabel:setLeftRight( 0, 0, 90, 188 )
	ProductIdLabel:setTopBottom( 0, 0, 107, 140 )
	ProductIdLabel:setText( Engine.Localize( "Product ID:" ) )
	ProductIdLabel:setTTF( "fonts/default.ttf" )
	self:addElement( ProductIdLabel )
	self.ProductIdLabel = ProductIdLabel
	
	local ProductId = LUI.UIText.new()
	ProductId:setLeftRight( 0, 0, 201, 246 )
	ProductId:setTopBottom( 0, 0, 107, 140 )
	ProductId:setTTF( "fonts/default.ttf" )
	ProductId:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ProductId:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProductId )
	self.ProductId = ProductId
	
	local RentalLabel = LUI.UITightText.new()
	RentalLabel:setLeftRight( 0, 0, 262, 324 )
	RentalLabel:setTopBottom( 0, 0, 107, 140 )
	RentalLabel:setText( Engine.Localize( "Rental:" ) )
	RentalLabel:setTTF( "fonts/default.ttf" )
	self:addElement( RentalLabel )
	self.RentalLabel = RentalLabel
	
	local RentalDuration = LUI.UIText.new()
	RentalDuration:setLeftRight( 0, 0, 336, 378 )
	RentalDuration:setTopBottom( 0, 0, 107, 140 )
	RentalDuration:setTTF( "fonts/default.ttf" )
	RentalDuration:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RentalDuration:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RentalDuration )
	self.RentalDuration = RentalDuration
	
	local RentalDurationUnits = LUI.UIText.new()
	RentalDurationUnits:setLeftRight( 0, 0, 379, 421 )
	RentalDurationUnits:setTopBottom( 0, 0, 107, 140 )
	RentalDurationUnits:setTTF( "fonts/default.ttf" )
	RentalDurationUnits:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RentalDurationUnits:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RentalDurationUnits )
	self.RentalDurationUnits = RentalDurationUnits
	
	self.SkuName:linkToElementModel( self, "productName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SkuName:setText( ToString( modelValue ) )
		end
	end )
	self.SkuPriceText:linkToElementModel( self, "skuPrice", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SkuPriceText:setText( ToString( modelValue ) )
		end
	end )
	self.CurrencyType:linkToElementModel( self, "currencyId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CurrencyType:setText( ToString( modelValue ) )
		end
	end )
	self.ProductId:linkToElementModel( self, "productId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ProductId:setText( ToString( modelValue ) )
		end
	end )
	self.RentalDuration:linkToElementModel( self, "rentalDuration", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RentalDuration:setText( ToString( modelValue ) )
		end
	end )
	self.RentalDurationUnits:linkToElementModel( self, "rentalDurationUnit", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RentalDurationUnits:setText( ToString( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		FocusIcon:completeAnimation()
		FocusIcon:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				FocusIcon:completeAnimation()
				self.FocusIcon:setAlpha( 0 )
				self.clipFinished( FocusIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local FocusIconFrame2 = function ( FocusIcon, event )
					if not event.interrupted then
						FocusIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					FocusIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusIcon, event )
					else
						FocusIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusIcon:completeAnimation()
				self.FocusIcon:setAlpha( 0 )
				FocusIconFrame2( FocusIcon, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local FocusIconFrame2 = function ( FocusIcon, event )
					if not event.interrupted then
						FocusIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					FocusIcon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusIcon, event )
					else
						FocusIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusIcon:completeAnimation()
				self.FocusIcon:setAlpha( 1 )
				FocusIconFrame2( FocusIcon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.SkuName:close()
		self.SkuPriceText:close()
		self.CurrencyType:close()
		self.ProductId:close()
		self.RentalDuration:close()
		self.RentalDurationUnits:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

