-- 77176eb32ab4a7378856ce99668a7aef
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.smokewidget" )
require( "ui.uieditor.widgets.BlackMarket.fx_Ember2" )
require( "ui.uieditor.widgets.BlackMarket.fx_Ember" )

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
	self:setLeftRight( true, false, 0, 170 )
	self:setTopBottom( true, false, 0, 90 )
	self.anyChildUsesUpdateState = true
	
	local glow00 = LUI.UIImage.new()
	glow00:setLeftRight( false, false, -68.4, 68.4 )
	glow00:setTopBottom( false, false, -63.75, 72.25 )
	glow00:setImage( RegisterImage( "uie_t7_blackmarket_crate_whiteglow" ) )
	self:addElement( glow00 )
	self.glow00 = glow00
	
	local smokewidget = CoD.smokewidget.new( menu, controller )
	smokewidget:setLeftRight( false, false, -85, 84.6 )
	smokewidget:setTopBottom( false, false, -115, 63.5 )
	smokewidget:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( smokewidget )
	self.smokewidget = smokewidget
	
	local fxEmber2 = CoD.fx_Ember2.new( menu, controller )
	fxEmber2:setLeftRight( false, false, -72.2, 71.8 )
	fxEmber2:setTopBottom( false, false, -100, 80 )
	fxEmber2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fxEmber2 )
	self.fxEmber2 = fxEmber2
	
	local fxEmber = CoD.fx_Ember.new( menu, controller )
	fxEmber:setLeftRight( false, false, -76, 75.6 )
	fxEmber:setTopBottom( false, false, -87.5, 102 )
	fxEmber:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fxEmber )
	self.fxEmber = fxEmber
	
	local CardImage = LUI.UIImage.new()
	CardImage:setLeftRight( false, false, -68.4, 68.4 )
	CardImage:setTopBottom( false, false, -63.75, 72.25 )
	CardImage:linkToElementModel( self, "rewardCarouselItemImage", true, function ( model )
		local rewardCarouselItemImage = Engine.GetModelValue( model )
		if rewardCarouselItemImage then
			CardImage:setImage( RegisterImage( rewardCarouselItemImage ) )
		end
	end )
	self:addElement( CardImage )
	self.CardImage = CardImage
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.smokewidget:close()
		element.fxEmber2:close()
		element.fxEmber:close()
		element.CardImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

