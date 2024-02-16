-- f9acd7492491154b4f4f23f4ed8abe97
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_GoldFrame" )

CoD.CallingCard_loot_deadlyanimals = InheritFrom( LUI.UIElement )
CoD.CallingCard_loot_deadlyanimals.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCard_loot_deadlyanimals )
	self.id = "CallingCard_loot_deadlyanimals"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_loot_callingcard_deadlyanimals_07_bg" ) )
	bg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	bg:setShaderVector( 0, 1, 1, 0, 0 )
	bg:setShaderVector( 1, 0.53, 0, 0, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local Animal = LUI.UIImage.new()
	Animal:setLeftRight( true, false, 91.25, 376.25 )
	Animal:setTopBottom( true, false, 0, 120 )
	Animal:setImage( RegisterImage( "uie_t7_loot_callingcard_deadlyanimals_flipbook" ) )
	Animal:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Animal:setShaderVector( 0, 12, 0, 0, 0 )
	Animal:setShaderVector( 1, 24, 0, 0, 0 )
	self:addElement( Animal )
	self.Animal = Animal
	
	local fg = LUI.UIImage.new()
	fg:setLeftRight( true, false, 0, 480 )
	fg:setTopBottom( true, false, 1, 121 )
	fg:setImage( RegisterImage( "uie_t7_loot_callingcard_deadlyanimals_07_fg" ) )
	fg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	fg:setShaderVector( 0, 1, 1, 0, 0 )
	fg:setShaderVector( 1, 1.8, 0, 0, 0 )
	self:addElement( fg )
	self.fg = fg
	
	local CallingCardsGoldFrame = CoD.CallingCards_GoldFrame.new( menu, controller )
	CallingCardsGoldFrame:setLeftRight( true, true, 0, 0 )
	CallingCardsGoldFrame:setTopBottom( true, true, 0, 0 )
	self:addElement( CallingCardsGoldFrame )
	self.CallingCardsGoldFrame = CallingCardsGoldFrame
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsGoldFrame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
