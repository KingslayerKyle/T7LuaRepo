CoD.BM_SaleActive_Hori = InheritFrom( LUI.UIElement )
CoD.BM_SaleActive_Hori.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_SaleActive_Hori )
	self.id = "BM_SaleActive_Hori"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 58 )
	self:setTopBottom( true, false, 0, 50 )
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 11, 43 )
	Label0:setTopBottom( true, false, 4, 24 )
	Label0:setRGB( 1, 0.55, 0.55 )
	Label0:setTTF( "fonts/default.ttf" )
	Label0:linkToElementModel( self, "itemCODPointCost", true, function ( model )
		local itemCODPointCost = Engine.GetModelValue( model )
		if itemCODPointCost then
			Label0:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", GetCostBeforeLootDiscount( controller, itemCODPointCost ) ) ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 6.5, 64 )
	bg:setTopBottom( true, false, 1, 26.56 )
	bg:setImage( RegisterImage( "uie_t7_blackmarket_promo_crossout_hori" ) )
	self:addElement( bg )
	self.bg = bg
	
	local codpointText = LUI.UITightText.new()
	codpointText:setLeftRight( true, false, 36.5, 68.5 )
	codpointText:setTopBottom( true, false, 4, 24 )
	codpointText:setTTF( "fonts/default.ttf" )
	codpointText:linkToElementModel( self, "itemCODPointCost", true, function ( model )
		local itemCODPointCost = Engine.GetModelValue( model )
		if itemCODPointCost then
			codpointText:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", itemCODPointCost ) ) )
		end
	end )
	self:addElement( codpointText )
	self.codpointText = codpointText
	
	local codpointIcon = LUI.UIImage.new()
	codpointIcon:setLeftRight( true, false, -14, 10 )
	codpointIcon:setTopBottom( true, false, 2, 26 )
	codpointIcon:setScale( 0.7 )
	codpointIcon:setImage( RegisterImage( "uie_t7_icon_codpoints" ) )
	self:addElement( codpointIcon )
	self.codpointIcon = codpointIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Label0:completeAnimation()
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				codpointText:completeAnimation()
				self.codpointText:setAlpha( 0 )
				self.clipFinished( codpointText, {} )
				codpointIcon:completeAnimation()
				self.codpointIcon:setAlpha( 0 )
				self.clipFinished( codpointIcon, {} )
			end
		},
		SaleOn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				codpointText:completeAnimation()
				self.codpointText:setAlpha( 1 )
				self.clipFinished( codpointText, {} )
				codpointIcon:completeAnimation()
				self.codpointIcon:setAlpha( 1 )
				self.clipFinished( codpointIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "SaleOn",
			condition = function ( menu, element, event )
				return IsLootSaleActive( controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Label0:close()
		element.codpointText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

