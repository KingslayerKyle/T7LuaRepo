-- 4981d76bd44daf5358e4179afda193d5
-- This hash is used for caching, delete to decompile the file again

CoD.Notif_Global_TitleBackingLine = InheritFrom( LUI.UIElement )
CoD.Notif_Global_TitleBackingLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Notif_Global_TitleBackingLine )
	self.id = "Notif_Global_TitleBackingLine"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 40 )
	
	local TitleBackingLine = LUI.UIImage.new()
	TitleBackingLine:setLeftRight( true, false, 0, 136 )
	TitleBackingLine:setTopBottom( true, false, 4, 36 )
	TitleBackingLine:setImage( RegisterImage( "uie_t7_hud_notif_global_titlebacking_line" ) )
	TitleBackingLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleBackingLine )
	self.TitleBackingLine = TitleBackingLine
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, true, -136, 0 )
	Image0:setTopBottom( true, false, 4, 36 )
	Image0:setYRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_hud_notif_global_titlebacking_line" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

