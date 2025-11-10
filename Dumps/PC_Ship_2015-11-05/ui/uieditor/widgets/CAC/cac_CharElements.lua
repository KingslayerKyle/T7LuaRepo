require( "ui.uieditor.widgets.CAC.cac_CharBox" )

CoD.cac_CharElements = InheritFrom( LUI.UIElement )
CoD.cac_CharElements.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_CharElements )
	self.id = "cac_CharElements"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 625 )
	self:setTopBottom( true, false, 0, 85 )
	
	local cacCharBox0 = CoD.cac_CharBox.new( menu, controller )
	cacCharBox0:setLeftRight( true, true, 0, 384 )
	cacCharBox0:setTopBottom( false, false, -43, 44 )
	cacCharBox0:setAlpha( 0.58 )
	self:addElement( cacCharBox0 )
	self.cacCharBox0 = cacCharBox0
	
	local featlineleft = LUI.UIImage.new()
	featlineleft:setLeftRight( true, false, 43, 47 )
	featlineleft:setTopBottom( false, false, -42.5, 41.5 )
	featlineleft:setAlpha( 0.7 )
	featlineleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft )
	self.featlineleft = featlineleft
	
	local pixelLR = LUI.UIImage.new()
	pixelLR:setLeftRight( true, false, -27, 9 )
	pixelLR:setTopBottom( false, false, 39.48, 42.98 )
	pixelLR:setYRot( -180 )
	pixelLR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelLR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelLR )
	self.pixelLR = pixelLR
	
	local emblemline0 = LUI.UIImage.new()
	emblemline0:setLeftRight( true, false, -11, -7 )
	emblemline0:setTopBottom( false, false, -39.5, 42.5 )
	emblemline0:setAlpha( 0.25 )
	emblemline0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline0 )
	self.emblemline0 = emblemline0
	
	local pixelb = LUI.UIImage.new()
	pixelb:setLeftRight( true, false, -55, -23 )
	pixelb:setTopBottom( false, false, -25.5, 26.5 )
	pixelb:setYRot( -180 )
	pixelb:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelb" ) )
	pixelb:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelb )
	self.pixelb = pixelb
	
	local pixelLR0 = LUI.UIImage.new()
	pixelLR0:setLeftRight( true, false, -27, 9 )
	pixelLR0:setTopBottom( false, false, -40.52, -37.02 )
	pixelLR0:setYRot( -180 )
	pixelLR0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelLR0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelLR0 )
	self.pixelLR0 = pixelLR0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacCharBox0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

