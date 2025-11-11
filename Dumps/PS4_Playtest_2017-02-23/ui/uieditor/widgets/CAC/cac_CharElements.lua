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
	self:setLeftRight( 0, 0, 0, 937 )
	self:setTopBottom( 0, 0, 0, 127 )
	
	local cacCharBox0 = CoD.cac_CharBox.new( menu, controller )
	cacCharBox0:setLeftRight( 0, 1, 0, 576 )
	cacCharBox0:setTopBottom( 0.5, 0.5, -64, 66 )
	cacCharBox0:setAlpha( 0.58 )
	self:addElement( cacCharBox0 )
	self.cacCharBox0 = cacCharBox0
	
	local featlineleft = LUI.UIImage.new()
	featlineleft:setLeftRight( 0, 0, 65, 71 )
	featlineleft:setTopBottom( 0.5, 0.5, -64, 62 )
	featlineleft:setAlpha( 0.7 )
	featlineleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft )
	self.featlineleft = featlineleft
	
	local pixelLR = LUI.UIImage.new()
	pixelLR:setLeftRight( 0, 0, -41, 13 )
	pixelLR:setTopBottom( 0.5, 0.5, 59, 64 )
	pixelLR:setYRot( -180 )
	pixelLR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelLR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelLR )
	self.pixelLR = pixelLR
	
	local emblemline0 = LUI.UIImage.new()
	emblemline0:setLeftRight( 0, 0, -17, -11 )
	emblemline0:setTopBottom( 0.5, 0.5, -59, 64 )
	emblemline0:setAlpha( 0.25 )
	emblemline0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline0 )
	self.emblemline0 = emblemline0
	
	local pixelb = LUI.UIImage.new()
	pixelb:setLeftRight( 0, 0, -82, -34 )
	pixelb:setTopBottom( 0.5, 0.5, -38, 40 )
	pixelb:setYRot( -180 )
	pixelb:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelb" ) )
	pixelb:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelb )
	self.pixelb = pixelb
	
	local pixelLR0 = LUI.UIImage.new()
	pixelLR0:setLeftRight( 0, 0, -41, 13 )
	pixelLR0:setTopBottom( 0.5, 0.5, -61, -56 )
	pixelLR0:setYRot( -180 )
	pixelLR0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelLR0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelLR0 )
	self.pixelLR0 = pixelLR0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacCharBox0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

