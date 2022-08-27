-- 40a7e6b3233d899544f6369a0a5b709a
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_agr_NotificationLine = InheritFrom( LUI.UIElement )
CoD.vhud_agr_NotificationLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_agr_NotificationLine )
	self.id = "vhud_agr_NotificationLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 79 )
	self:setTopBottom( true, false, 0, 8 )
	
	local NotificationAmmoLineTop1 = LUI.UIImage.new()
	NotificationAmmoLineTop1:setLeftRight( true, true, 0, 0 )
	NotificationAmmoLineTop1:setTopBottom( true, true, 0, 0 )
	NotificationAmmoLineTop1:setRGB( 0.28, 0.92, 0.12 )
	NotificationAmmoLineTop1:setAlpha( 0.08 )
	NotificationAmmoLineTop1:setZoom( -20 )
	NotificationAmmoLineTop1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_notificationline" ) )
	NotificationAmmoLineTop1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NotificationAmmoLineTop1 )
	self.NotificationAmmoLineTop1 = NotificationAmmoLineTop1
	
	local NotificationAmmoLineTop = LUI.UIImage.new()
	NotificationAmmoLineTop:setLeftRight( true, true, 0, 0 )
	NotificationAmmoLineTop:setTopBottom( true, true, 0, 0 )
	NotificationAmmoLineTop:setRGB( 0.28, 0.92, 0.12 )
	NotificationAmmoLineTop:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_notificationline" ) )
	NotificationAmmoLineTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NotificationAmmoLineTop )
	self.NotificationAmmoLineTop = NotificationAmmoLineTop
	
	local NotificationAmmoLineTop0 = LUI.UIImage.new()
	NotificationAmmoLineTop0:setLeftRight( true, true, 0, 0 )
	NotificationAmmoLineTop0:setTopBottom( true, true, 0, 0 )
	NotificationAmmoLineTop0:setRGB( 0.49, 1, 0.74 )
	NotificationAmmoLineTop0:setAlpha( 0.8 )
	NotificationAmmoLineTop0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_notificationline" ) )
	NotificationAmmoLineTop0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NotificationAmmoLineTop0 )
	self.NotificationAmmoLineTop0 = NotificationAmmoLineTop0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

