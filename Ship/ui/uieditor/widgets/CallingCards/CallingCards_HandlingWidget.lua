-- 747c6ceecc0fd2d34b7f606b9a28d7d4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_HandlingEyes" )

CoD.CallingCards_HandlingWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_HandlingWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_HandlingWidget )
	self.id = "CallingCards_HandlingWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 480 )
	BG:setTopBottom( true, false, 0, 120 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_handling_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local skull = LUI.UIImage.new()
	skull:setLeftRight( true, false, 184, 416 )
	skull:setTopBottom( true, false, -51.36, 186.75 )
	skull:setImage( RegisterImage( "uie_t7_callingcard_handling_skull" ) )
	self:addElement( skull )
	self.skull = skull
	
	local bullets = LUI.UIImage.new()
	bullets:setLeftRight( true, false, 0, 480 )
	bullets:setTopBottom( true, false, 0, 120 )
	bullets:setImage( RegisterImage( "uie_t7_callingcard_handling_bullets" ) )
	bullets:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	bullets:setShaderVector( 0, 1, 1, 0, 0 )
	bullets:setShaderVector( 1, 0, -0.79, 0, 0 )
	self:addElement( bullets )
	self.bullets = bullets
	
	local bulletsblk = LUI.UIImage.new()
	bulletsblk:setLeftRight( true, false, -86, 562 )
	bulletsblk:setTopBottom( true, false, -42, 162 )
	bulletsblk:setImage( RegisterImage( "uie_t7_callingcard_handling_bulletsblk" ) )
	bulletsblk:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	bulletsblk:setShaderVector( 0, 1, 1, 0, 0 )
	bulletsblk:setShaderVector( 1, 0, -0.27, 0, 0 )
	self:addElement( bulletsblk )
	self.bulletsblk = bulletsblk
	
	local CallingCardsHandlingEyes = CoD.CallingCards_HandlingEyes.new( menu, controller )
	CallingCardsHandlingEyes:setLeftRight( true, false, 272.6, 278.74 )
	CallingCardsHandlingEyes:setTopBottom( true, false, 62.35, 69.05 )
	self:addElement( CallingCardsHandlingEyes )
	self.CallingCardsHandlingEyes = CallingCardsHandlingEyes
	
	local CallingCardsHandlingEyes0 = CoD.CallingCards_HandlingEyes.new( menu, controller )
	CallingCardsHandlingEyes0:setLeftRight( true, false, 316.6, 322.74 )
	CallingCardsHandlingEyes0:setTopBottom( true, false, 62.35, 69.05 )
	self:addElement( CallingCardsHandlingEyes0 )
	self.CallingCardsHandlingEyes0 = CallingCardsHandlingEyes0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsHandlingEyes:close()
		element.CallingCardsHandlingEyes0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
