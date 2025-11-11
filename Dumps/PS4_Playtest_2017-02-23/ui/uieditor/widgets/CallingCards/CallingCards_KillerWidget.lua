require( "ui.uieditor.widgets.CallingCards.CallingCards_KillerCloudFront" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_KillerEyes" )

CoD.CallingCards_KillerWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_KillerWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_KillerWidget )
	self.id = "CallingCards_KillerWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 0, 720 )
	bg:setTopBottom( 0, 0, 0, 180 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_killer_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local CallingCardsKillerCloudFront = CoD.CallingCards_KillerCloudFront.new( menu, controller )
	CallingCardsKillerCloudFront:setLeftRight( 0, 0, 171, 752 )
	CallingCardsKillerCloudFront:setTopBottom( 0, 0, -37, 216 )
	CallingCardsKillerCloudFront:setAlpha( 0.95 )
	self:addElement( CallingCardsKillerCloudFront )
	self.CallingCardsKillerCloudFront = CallingCardsKillerCloudFront
	
	local skull = LUI.UIImage.new()
	skull:setLeftRight( 0, 0, 234, 720 )
	skull:setTopBottom( 0, 0, 0, 180 )
	skull:setImage( RegisterImage( "uie_t7_callingcard_killer_creeper" ) )
	self:addElement( skull )
	self.skull = skull
	
	local ash2 = LUI.UIImage.new()
	ash2:setLeftRight( 0, 0, 0, 720 )
	ash2:setTopBottom( 0, 0, 0, 180 )
	ash2:setImage( RegisterImage( "uie_t7_callingcard_killer_ash2" ) )
	ash2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	ash2:setShaderVector( 0, 1, 1, 0, 0 )
	ash2:setShaderVector( 1, 0, 1.04, 0, 0 )
	self:addElement( ash2 )
	self.ash2 = ash2
	
	local ash1 = LUI.UIImage.new()
	ash1:setLeftRight( 0, 0, 0, 720 )
	ash1:setTopBottom( 0, 0, 0, 180 )
	ash1:setImage( RegisterImage( "uie_t7_callingcard_killer_ash1" ) )
	ash1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	ash1:setShaderVector( 0, 1, 1, 0, 0 )
	ash1:setShaderVector( 1, 0, 0.38, 0, 0 )
	self:addElement( ash1 )
	self.ash1 = ash1
	
	local CallingCardsKillerEyes = CoD.CallingCards_KillerEyes.new( menu, controller )
	CallingCardsKillerEyes:setLeftRight( 0, 0, 452, 500 )
	CallingCardsKillerEyes:setTopBottom( 0, 0, 58, 76 )
	self:addElement( CallingCardsKillerEyes )
	self.CallingCardsKillerEyes = CallingCardsKillerEyes
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardsKillerCloudFront:close()
		self.CallingCardsKillerEyes:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

