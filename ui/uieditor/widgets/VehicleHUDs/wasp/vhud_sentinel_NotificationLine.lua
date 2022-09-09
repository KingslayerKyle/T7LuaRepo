-- 814cc1dcc4bd72666bca9a441238e3d9
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_sentinel_NotificationLine = InheritFrom( LUI.UIElement )
CoD.vhud_sentinel_NotificationLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_sentinel_NotificationLine )
	self.id = "vhud_sentinel_NotificationLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 79 )
	self:setTopBottom( true, false, 0, 8 )
	
	local NotificationAmmoLineTop0 = LUI.UIImage.new()
	NotificationAmmoLineTop0:setLeftRight( true, true, 0, 0 )
	NotificationAmmoLineTop0:setTopBottom( true, true, 0, 0 )
	NotificationAmmoLineTop0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_notificationline" ) )
	NotificationAmmoLineTop0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NotificationAmmoLineTop0 )
	self.NotificationAmmoLineTop0 = NotificationAmmoLineTop0
	
	local NotificationAmmoLineTop00 = LUI.UIImage.new()
	NotificationAmmoLineTop00:setLeftRight( true, true, 0, 0 )
	NotificationAmmoLineTop00:setTopBottom( true, true, 0, 0 )
	NotificationAmmoLineTop00:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_notificationline" ) )
	NotificationAmmoLineTop00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NotificationAmmoLineTop00 )
	self.NotificationAmmoLineTop00 = NotificationAmmoLineTop00
	
	local NotificationAmmoLineTop000 = LUI.UIImage.new()
	NotificationAmmoLineTop000:setLeftRight( true, true, 0, 0 )
	NotificationAmmoLineTop000:setTopBottom( true, true, 0, 0 )
	NotificationAmmoLineTop000:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_notificationline" ) )
	NotificationAmmoLineTop000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NotificationAmmoLineTop000 )
	self.NotificationAmmoLineTop000 = NotificationAmmoLineTop000
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
