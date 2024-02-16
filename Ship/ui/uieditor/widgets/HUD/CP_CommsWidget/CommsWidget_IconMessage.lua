-- 642fbc44f7fe67852d8537ea7ba1ec2e
-- This hash is used for caching, delete to decompile the file again

CoD.CommsWidget_IconMessage = InheritFrom( LUI.UIElement )
CoD.CommsWidget_IconMessage.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CommsWidget_IconMessage )
	self.id = "CommsWidget_IconMessage"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 21 )
	self:setTopBottom( true, false, 0, 21 )
	
	local icon0 = LUI.UIImage.new()
	icon0:setLeftRight( true, false, 0, 21.33 )
	icon0:setTopBottom( true, false, 0, 21.33 )
	icon0:setImage( RegisterImage( "uie_t7_cp_hud_commswidget_icon_message" ) )
	icon0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( icon0 )
	self.icon0 = icon0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
