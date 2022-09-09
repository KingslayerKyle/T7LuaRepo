-- 5624fbb267405910843db698778bd4e0
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_dart_ammo_item = InheritFrom( LUI.UIElement )
CoD.vhud_dart_ammo_item.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_dart_ammo_item )
	self.id = "vhud_dart_ammo_item"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 16 )
	
	local NotificationAmmoBox1 = LUI.UIImage.new()
	NotificationAmmoBox1:setLeftRight( false, false, -24, 24 )
	NotificationAmmoBox1:setTopBottom( false, false, -8, 8 )
	NotificationAmmoBox1:setScale( 1.2 )
	NotificationAmmoBox1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_notificationboxammo" ) )
	NotificationAmmoBox1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NotificationAmmoBox1 )
	self.NotificationAmmoBox1 = NotificationAmmoBox1
	
	local agrIconMissileLine1 = LUI.UIImage.new()
	agrIconMissileLine1:setLeftRight( true, true, 0, 0 )
	agrIconMissileLine1:setTopBottom( true, true, 0, 0 )
	agrIconMissileLine1:setScale( 1.2 )
	agrIconMissileLine1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_notificationboxammoline" ) )
	agrIconMissileLine1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrIconMissileLine1 )
	self.agrIconMissileLine1 = agrIconMissileLine1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				NotificationAmmoBox1:completeAnimation()
				self.NotificationAmmoBox1:setAlpha( 0 )
				self.NotificationAmmoBox1:setScale( 1 )
				self.clipFinished( NotificationAmmoBox1, {} )

				agrIconMissileLine1:completeAnimation()
				self.agrIconMissileLine1:setAlpha( 1 )
				self.agrIconMissileLine1:setScale( 1 )
				self.clipFinished( agrIconMissileLine1, {} )
			end
		},
		On = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				NotificationAmmoBox1:completeAnimation()
				self.NotificationAmmoBox1:setAlpha( 1 )
				self.NotificationAmmoBox1:setScale( 1.2 )
				self.clipFinished( NotificationAmmoBox1, {} )

				agrIconMissileLine1:completeAnimation()
				self.agrIconMissileLine1:setAlpha( 1 )
				self.agrIconMissileLine1:setScale( 1.2 )
				self.clipFinished( agrIconMissileLine1, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
