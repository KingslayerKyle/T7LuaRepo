-- a38f6b08e1b1dd833540a2339503d7dc
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_dart_NotificationAmmoLine = InheritFrom( LUI.UIElement )
CoD.vhud_dart_NotificationAmmoLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_dart_NotificationAmmoLine )
	self.id = "vhud_dart_NotificationAmmoLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 79 )
	self:setTopBottom( true, false, 0, 8 )
	
	local NotificationAmmoLineTop1 = LUI.UIImage.new()
	NotificationAmmoLineTop1:setLeftRight( true, false, 0, 79 )
	NotificationAmmoLineTop1:setTopBottom( true, false, 0, 7.9 )
	NotificationAmmoLineTop1:setAlpha( 0.08 )
	NotificationAmmoLineTop1:setZoom( -20 )
	NotificationAmmoLineTop1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_notificationline" ) )
	NotificationAmmoLineTop1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NotificationAmmoLineTop1 )
	self.NotificationAmmoLineTop1 = NotificationAmmoLineTop1
	
	local NotificationAmmoLineTop = LUI.UIImage.new()
	NotificationAmmoLineTop:setLeftRight( true, false, 0, 79 )
	NotificationAmmoLineTop:setTopBottom( true, false, 0, 7.9 )
	NotificationAmmoLineTop:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_notificationline" ) )
	NotificationAmmoLineTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NotificationAmmoLineTop )
	self.NotificationAmmoLineTop = NotificationAmmoLineTop
	
	local NotificationAmmoLineTop0 = LUI.UIImage.new()
	NotificationAmmoLineTop0:setLeftRight( true, false, 0, 79 )
	NotificationAmmoLineTop0:setTopBottom( true, false, 0, 7.9 )
	NotificationAmmoLineTop0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_notificationline" ) )
	NotificationAmmoLineTop0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NotificationAmmoLineTop0 )
	self.NotificationAmmoLineTop0 = NotificationAmmoLineTop0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
