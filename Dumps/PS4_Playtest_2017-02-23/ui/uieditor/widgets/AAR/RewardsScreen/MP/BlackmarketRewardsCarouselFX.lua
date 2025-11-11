require( "ui.uieditor.widgets.BlackMarket.fx_Ember" )
require( "ui.uieditor.widgets.BlackMarket.fx_Ember2" )
require( "ui.uieditor.widgets.BlackMarket.smokewidget" )

CoD.BlackmarketRewardsCarouselFX = InheritFrom( LUI.UIElement )
CoD.BlackmarketRewardsCarouselFX.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.BlackmarketRewardsCarouselFX )
	self.id = "BlackmarketRewardsCarouselFX"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 255 )
	self:setTopBottom( 0, 0, 0, 135 )
	
	local glow00 = LUI.UIImage.new()
	glow00:setLeftRight( 0.5, 0.5, -103, 102 )
	glow00:setTopBottom( 0.5, 0.5, -96, 108 )
	glow00:setImage( RegisterImage( "uie_t7_blackmarket_crate_whiteglow" ) )
	self:addElement( glow00 )
	self.glow00 = glow00
	
	local smokewidget = CoD.smokewidget.new( menu, controller )
	smokewidget:setLeftRight( 0.5, 0.5, -127, 127 )
	smokewidget:setTopBottom( 0.5, 0.5, -173, 95 )
	smokewidget:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( smokewidget )
	self.smokewidget = smokewidget
	
	local fxEmber2 = CoD.fx_Ember2.new( menu, controller )
	fxEmber2:setLeftRight( 0.5, 0.5, -108, 108 )
	fxEmber2:setTopBottom( 0.5, 0.5, -150, 120 )
	fxEmber2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fxEmber2 )
	self.fxEmber2 = fxEmber2
	
	local fxEmber = CoD.fx_Ember.new( menu, controller )
	fxEmber:setLeftRight( 0.5, 0.5, -114, 113 )
	fxEmber:setTopBottom( 0.5, 0.5, -131, 153 )
	fxEmber:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fxEmber )
	self.fxEmber = fxEmber
	
	local CardImage = LUI.UIImage.new()
	CardImage:setLeftRight( 0.5, 0.5, -102.5, 102.5 )
	CardImage:setTopBottom( 0.5, 0.5, -96, 108 )
	CardImage:linkToElementModel( self, "rewardCarouselItemImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CardImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( CardImage )
	self.CardImage = CardImage
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.smokewidget:close()
		self.fxEmber2:close()
		self.fxEmber:close()
		self.CardImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

