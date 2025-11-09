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
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 100 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local SkuName = LUI.UIText.new()
	SkuName:setLeftRight( true, false, 178, 350 )
	SkuName:setTopBottom( true, false, 6, 42 )
	SkuName:setTTF( "fonts/default.ttf" )
	SkuName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SkuName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SkuName )
	self.SkuName = SkuName
	
	local FocusIcon = LUI.UIImage.new()
	FocusIcon:setLeftRight( true, false, -4, 60 )
	FocusIcon:setTopBottom( true, false, 18, 82 )
	FocusIcon:setImage( RegisterImage( "uie_headicon_dead" ) )
	self:addElement( FocusIcon )
	self.FocusIcon = FocusIcon
	
	local SkuPriceText = LUI.UIText.new()
	SkuPriceText:setLeftRight( true, false, 100, 144 )
	SkuPriceText:setTopBottom( true, false, 45, 67 )
	SkuPriceText:setTTF( "fonts/default.ttf" )
	SkuPriceText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SkuPriceText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SkuPriceText )
	self.SkuPriceText = SkuPriceText
	
	local SkuDescription = LUI.UITightText.new()
	SkuDescription:setLeftRight( true, false, 60, 140 )
	SkuDescription:setTopBottom( true, false, 6, 42 )
	SkuDescription:setText( Engine.Localize( "SKU Name:" ) )
	SkuDescription:setTTF( "fonts/default.ttf" )
	self:addElement( SkuDescription )
	self.SkuDescription = SkuDescription
	
	local SkuPriceLabel = LUI.UITightText.new()
	SkuPriceLabel:setLeftRight( true, false, 60, 100 )
	SkuPriceLabel:setTopBottom( true, false, 45, 67 )
	SkuPriceLabel:setText( Engine.Localize( "Price:" ) )
	SkuPriceLabel:setTTF( "fonts/default.ttf" )
	self:addElement( SkuPriceLabel )
	self.SkuPriceLabel = SkuPriceLabel
	
	local CurrencyTypeLabel = LUI.UITightText.new()
	CurrencyTypeLabel:setLeftRight( true, false, 175, 252 )
	CurrencyTypeLabel:setTopBottom( true, false, 45, 67 )
	CurrencyTypeLabel:setText( Engine.Localize( "Currency ID: " ) )
	CurrencyTypeLabel:setTTF( "fonts/default.ttf" )
	self:addElement( CurrencyTypeLabel )
	self.CurrencyTypeLabel = CurrencyTypeLabel
	
	local CurrencyType = LUI.UIText.new()
	CurrencyType:setLeftRight( true, false, 253, 292 )
	CurrencyType:setTopBottom( true, false, 45, 67 )
	CurrencyType:setTTF( "fonts/default.ttf" )
	CurrencyType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CurrencyType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CurrencyType )
	self.CurrencyType = CurrencyType
	
	local ProductIdLabel = LUI.UITightText.new()
	ProductIdLabel:setLeftRight( true, false, 60, 125 )
	ProductIdLabel:setTopBottom( true, false, 71, 93 )
	ProductIdLabel:setText( Engine.Localize( "Product ID:" ) )
	ProductIdLabel:setTTF( "fonts/default.ttf" )
	self:addElement( ProductIdLabel )
	self.ProductIdLabel = ProductIdLabel
	
	local ProductId = LUI.UIText.new()
	ProductId:setLeftRight( true, false, 134, 164 )
	ProductId:setTopBottom( true, false, 71, 93 )
	ProductId:setTTF( "fonts/default.ttf" )
	ProductId:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ProductId:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProductId )
	self.ProductId = ProductId
	
	local RentalLabel = LUI.UITightText.new()
	RentalLabel:setLeftRight( true, false, 175, 216 )
	RentalLabel:setTopBottom( true, false, 71, 93 )
	RentalLabel:setText( Engine.Localize( "Rental:" ) )
	RentalLabel:setTTF( "fonts/default.ttf" )
	self:addElement( RentalLabel )
	self.RentalLabel = RentalLabel
	
	local RentalDuration = LUI.UIText.new()
	RentalDuration:setLeftRight( true, false, 224, 252 )
	RentalDuration:setTopBottom( true, false, 71, 93 )
	RentalDuration:setTTF( "fonts/default.ttf" )
	RentalDuration:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RentalDuration:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RentalDuration )
	self.RentalDuration = RentalDuration
	
	local RentalDurationUnits = LUI.UIText.new()
	RentalDurationUnits:setLeftRight( true, false, 253, 281 )
	RentalDurationUnits:setTopBottom( true, false, 71, 93 )
	RentalDurationUnits:setTTF( "fonts/default.ttf" )
	RentalDurationUnits:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RentalDurationUnits:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RentalDurationUnits )
	self.RentalDurationUnits = RentalDurationUnits
	
	self.SkuName:linkToElementModel( self, "productName", true, function ( model )
		local productName = Engine.GetModelValue( model )
		if productName then
			SkuName:setText( Engine.Localize( ToString( productName ) ) )
		end
	end )
	self.SkuPriceText:linkToElementModel( self, "skuPrice", true, function ( model )
		local skuPrice = Engine.GetModelValue( model )
		if skuPrice then
			SkuPriceText:setText( Engine.Localize( ToString( skuPrice ) ) )
		end
	end )
	self.CurrencyType:linkToElementModel( self, "currencyId", true, function ( model )
		local currencyId = Engine.GetModelValue( model )
		if currencyId then
			CurrencyType:setText( Engine.Localize( ToString( currencyId ) ) )
		end
	end )
	self.ProductId:linkToElementModel( self, "productId", true, function ( model )
		local productId = Engine.GetModelValue( model )
		if productId then
			ProductId:setText( Engine.Localize( ToString( productId ) ) )
		end
	end )
	self.RentalDuration:linkToElementModel( self, "rentalDuration", true, function ( model )
		local rentalDuration = Engine.GetModelValue( model )
		if rentalDuration then
			RentalDuration:setText( Engine.Localize( ToString( rentalDuration ) ) )
		end
	end )
	self.RentalDurationUnits:linkToElementModel( self, "rentalDurationUnit", true, function ( model )
		local rentalDurationUnit = Engine.GetModelValue( model )
		if rentalDurationUnit then
			RentalDurationUnits:setText( Engine.Localize( ToString( rentalDurationUnit ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FocusIcon:completeAnimation()
				self.FocusIcon:setAlpha( 0 )
				self.clipFinished( FocusIcon, {} )
			end,
			Focus = function ()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SkuName:close()
		element.SkuPriceText:close()
		element.CurrencyType:close()
		element.ProductId:close()
		element.RentalDuration:close()
		element.RentalDurationUnits:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

