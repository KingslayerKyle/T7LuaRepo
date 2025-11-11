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
	self:setLeftRight( 0, 0, 0, 87 )
	self:setTopBottom( 0, 0, 0, 75 )
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( 0, 0, 16, 64 )
	Label0:setTopBottom( 0, 0, 6, 36 )
	Label0:setRGB( 1, 0.55, 0.55 )
	Label0:setTTF( "fonts/default.ttf" )
	Label0:linkToElementModel( self, "itemCODPointCost", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Label0:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", GetCostBeforeLootDiscount( controller, modelValue ) ) ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 10, 96 )
	bg:setTopBottom( 0, 0, 2, 40 )
	bg:setImage( RegisterImage( "uie_t7_blackmarket_promo_crossout_hori" ) )
	self:addElement( bg )
	self.bg = bg
	
	local codpointText = LUI.UITightText.new()
	codpointText:setLeftRight( 0, 0, 55, 103 )
	codpointText:setTopBottom( 0, 0, 6, 36 )
	codpointText:setTTF( "fonts/default.ttf" )
	codpointText:linkToElementModel( self, "itemCODPointCost", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			codpointText:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", modelValue ) ) )
		end
	end )
	self:addElement( codpointText )
	self.codpointText = codpointText
	
	local codpointIcon = LUI.UIImage.new()
	codpointIcon:setLeftRight( 0, 0, -21, 15 )
	codpointIcon:setTopBottom( 0, 0, 3, 39 )
	codpointIcon:setScale( 0.7 )
	codpointIcon:setImage( RegisterImage( "uie_ui_codpoints_symbol_32x32" ) )
	self:addElement( codpointIcon )
	self.codpointIcon = codpointIcon
	
	self.resetProperties = function ()
		codpointText:completeAnimation()
		bg:completeAnimation()
		Label0:completeAnimation()
		codpointIcon:completeAnimation()
		codpointText:setAlpha( 1 )
		bg:setAlpha( 1 )
		Label0:setAlpha( 1 )
		codpointIcon:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Label0:close()
		self.codpointText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

