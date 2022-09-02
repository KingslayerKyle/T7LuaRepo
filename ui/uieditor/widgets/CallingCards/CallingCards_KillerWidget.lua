-- 6dfe604b9b5034e228f8360ab6ffc65e
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_killer_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local CallingCardsKillerCloudFront = CoD.CallingCards_KillerCloudFront.new( menu, controller )
	CallingCardsKillerCloudFront:setLeftRight( true, false, 114.1, 501.65 )
	CallingCardsKillerCloudFront:setTopBottom( true, false, -24.25, 144.25 )
	CallingCardsKillerCloudFront:setAlpha( 0.95 )
	self:addElement( CallingCardsKillerCloudFront )
	self.CallingCardsKillerCloudFront = CallingCardsKillerCloudFront
	
	local skull = LUI.UIImage.new()
	skull:setLeftRight( true, false, 156, 480 )
	skull:setTopBottom( true, false, 0, 120 )
	skull:setImage( RegisterImage( "uie_t7_callingcard_killer_creeper" ) )
	self:addElement( skull )
	self.skull = skull
	
	local ash2 = LUI.UIImage.new()
	ash2:setLeftRight( true, false, 0, 480 )
	ash2:setTopBottom( true, false, 0, 120 )
	ash2:setImage( RegisterImage( "uie_t7_callingcard_killer_ash2" ) )
	ash2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	ash2:setShaderVector( 0, 1, 1, 0, 0 )
	ash2:setShaderVector( 1, 0, 1.04, 0, 0 )
	self:addElement( ash2 )
	self.ash2 = ash2
	
	local ash1 = LUI.UIImage.new()
	ash1:setLeftRight( true, false, 0, 480 )
	ash1:setTopBottom( true, false, 0, 120 )
	ash1:setImage( RegisterImage( "uie_t7_callingcard_killer_ash1" ) )
	ash1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	ash1:setShaderVector( 0, 1, 1, 0, 0 )
	ash1:setShaderVector( 1, 0, 0.38, 0, 0 )
	self:addElement( ash1 )
	self.ash1 = ash1
	
	local CallingCardsKillerEyes = CoD.CallingCards_KillerEyes.new( menu, controller )
	CallingCardsKillerEyes:setLeftRight( true, false, 301, 333 )
	CallingCardsKillerEyes:setTopBottom( true, false, 38.5, 50.5 )
	self:addElement( CallingCardsKillerEyes )
	self.CallingCardsKillerEyes = CallingCardsKillerEyes
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				CallingCardsKillerCloudFront:completeAnimation()
				self.CallingCardsKillerCloudFront:setAlpha( 0.95 )
				self.clipFinished( CallingCardsKillerCloudFront, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsKillerCloudFront:close()
		element.CallingCardsKillerEyes:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

