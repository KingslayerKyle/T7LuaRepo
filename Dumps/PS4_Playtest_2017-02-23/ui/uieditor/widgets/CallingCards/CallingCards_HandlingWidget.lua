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
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 720 )
	BG:setTopBottom( 0, 0, 0, 180 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_handling_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local skull = LUI.UIImage.new()
	skull:setLeftRight( 0, 0, 276, 624 )
	skull:setTopBottom( 0, 0, -77, 280 )
	skull:setImage( RegisterImage( "uie_t7_callingcard_handling_skull" ) )
	self:addElement( skull )
	self.skull = skull
	
	local bullets = LUI.UIImage.new()
	bullets:setLeftRight( 0, 0, 0, 720 )
	bullets:setTopBottom( 0, 0, 0, 180 )
	bullets:setImage( RegisterImage( "uie_t7_callingcard_handling_bullets" ) )
	bullets:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	bullets:setShaderVector( 0, 1, 1, 0, 0 )
	bullets:setShaderVector( 1, 0, -0.79, 0, 0 )
	self:addElement( bullets )
	self.bullets = bullets
	
	local bulletsblk = LUI.UIImage.new()
	bulletsblk:setLeftRight( 0, 0, -129, 843 )
	bulletsblk:setTopBottom( 0, 0, -63, 243 )
	bulletsblk:setImage( RegisterImage( "uie_t7_callingcard_handling_bulletsblk" ) )
	bulletsblk:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	bulletsblk:setShaderVector( 0, 1, 1, 0, 0 )
	bulletsblk:setShaderVector( 1, 0, -0.27, 0, 0 )
	self:addElement( bulletsblk )
	self.bulletsblk = bulletsblk
	
	local CallingCardsHandlingEyes = CoD.CallingCards_HandlingEyes.new( menu, controller )
	CallingCardsHandlingEyes:setLeftRight( 0, 0, 409, 418 )
	CallingCardsHandlingEyes:setTopBottom( 0, 0, 94, 104 )
	self:addElement( CallingCardsHandlingEyes )
	self.CallingCardsHandlingEyes = CallingCardsHandlingEyes
	
	local CallingCardsHandlingEyes0 = CoD.CallingCards_HandlingEyes.new( menu, controller )
	CallingCardsHandlingEyes0:setLeftRight( 0, 0, 475, 484 )
	CallingCardsHandlingEyes0:setTopBottom( 0, 0, 94, 104 )
	self:addElement( CallingCardsHandlingEyes0 )
	self.CallingCardsHandlingEyes0 = CallingCardsHandlingEyes0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardsHandlingEyes:close()
		self.CallingCardsHandlingEyes0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

