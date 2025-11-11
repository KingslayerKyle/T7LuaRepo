require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )

CoD.BlackMarketClassifiedIcon = InheritFrom( LUI.UIElement )
CoD.BlackMarketClassifiedIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BlackMarketClassifiedIcon )
	self.id = "BlackMarketClassifiedIcon"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 162 )
	self:setTopBottom( 0, 0, 0, 162 )
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( 0, 1, 0, 0 )
	bgImage:setTopBottom( 0, 1, 0, 0 )
	bgImage:setRGB( 0.11, 0.11, 0.11 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( 0, 1, 5, -5 )
	BMGoldBarMed:setTopBottom( 0, 1, 72, -72 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local blackMarketBrandIcon0 = LUI.UIImage.new()
	blackMarketBrandIcon0:setLeftRight( 0, 1, 42, -42 )
	blackMarketBrandIcon0:setTopBottom( 0, 1, 42, -42 )
	blackMarketBrandIcon0:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon0 )
	self.blackMarketBrandIcon0 = blackMarketBrandIcon0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BMGoldBarMed:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

