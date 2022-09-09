-- 83e4cb9f67ade076e756a077d026d670
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_siegebot_NotificationLine = InheritFrom( LUI.UIElement )
CoD.vhud_siegebot_NotificationLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_siegebot_NotificationLine )
	self.id = "vhud_siegebot_NotificationLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 79 )
	self:setTopBottom( true, false, 0, 8 )
	
	local NotificationAmmoLineTop1 = LUI.UIImage.new()
	NotificationAmmoLineTop1:setLeftRight( true, true, 0, 0 )
	NotificationAmmoLineTop1:setTopBottom( true, true, 0, 0 )
	NotificationAmmoLineTop1:setAlpha( 0.08 )
	NotificationAmmoLineTop1:setZoom( -20 )
	NotificationAmmoLineTop1:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_notificationlinewhite" ) )
	NotificationAmmoLineTop1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NotificationAmmoLineTop1 )
	self.NotificationAmmoLineTop1 = NotificationAmmoLineTop1
	
	local NotificationAmmoLineTop = LUI.UIImage.new()
	NotificationAmmoLineTop:setLeftRight( true, true, 0, 0 )
	NotificationAmmoLineTop:setTopBottom( true, true, 0, 0 )
	NotificationAmmoLineTop:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_notificationlinewhite" ) )
	NotificationAmmoLineTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NotificationAmmoLineTop )
	self.NotificationAmmoLineTop = NotificationAmmoLineTop
	
	local NotificationAmmoLineTop0 = LUI.UIImage.new()
	NotificationAmmoLineTop0:setLeftRight( true, true, 0, 0 )
	NotificationAmmoLineTop0:setTopBottom( true, true, 0, 0 )
	NotificationAmmoLineTop0:setAlpha( 0.8 )
	NotificationAmmoLineTop0:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_notificationlinewhite" ) )
	NotificationAmmoLineTop0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NotificationAmmoLineTop0 )
	self.NotificationAmmoLineTop0 = NotificationAmmoLineTop0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
