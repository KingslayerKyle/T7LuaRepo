-- cf45733287e2a898c9de141f921a2958
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_hellstorm_NotificationArmed = InheritFrom( LUI.UIElement )
CoD.vhud_hellstorm_NotificationArmed.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_hellstorm_NotificationArmed )
	self.id = "vhud_hellstorm_NotificationArmed"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 81 )
	self:setTopBottom( true, false, 0, 30 )
	
	local NotificationAltBox0 = LUI.UIImage.new()
	NotificationAltBox0:setLeftRight( true, true, 0, 0 )
	NotificationAltBox0:setTopBottom( true, true, 0, 0 )
	NotificationAltBox0:setRGB( 0.74, 0.94, 0.99 )
	NotificationAltBox0:setAlpha( 0.08 )
	NotificationAltBox0:setYRot( -20 )
	NotificationAltBox0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_notificationsignalbox" ) )
	self:addElement( NotificationAltBox0 )
	self.NotificationAltBox0 = NotificationAltBox0
	
	local NotificationAltBox00 = LUI.UIImage.new()
	NotificationAltBox00:setLeftRight( true, true, 0, 0 )
	NotificationAltBox00:setTopBottom( true, true, 0, 0 )
	NotificationAltBox00:setRGB( 0.74, 0.94, 0.99 )
	NotificationAltBox00:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_notificationsignalbox" ) )
	NotificationAltBox00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NotificationAltBox00 )
	self.NotificationAltBox00 = NotificationAltBox00
	
	local ARMED = LUI.UIText.new()
	ARMED:setLeftRight( true, true, 0, 0 )
	ARMED:setTopBottom( false, false, -9, 7 )
	ARMED:setText( Engine.Localize( "MENU_HUD_VEHICLE_ARMED" ) )
	ARMED:setTTF( "fonts/default.ttf" )
	ARMED:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	ARMED:setShaderVector( 0, 0, 1, 0, 0 )
	ARMED:setShaderVector( 1, 0, 0, 0, 0 )
	ARMED:setShaderVector( 2, 0, 0, 0, 0 )
	ARMED:setShaderVector( 3, 0, 0, 0, 0 )
	ARMED:setShaderVector( 4, 0, 0, 0, 0 )
	ARMED:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ARMED:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ARMED )
	self.ARMED = ARMED
	
	local ARMED0 = LUI.UIText.new()
	ARMED0:setLeftRight( true, true, 0, 0 )
	ARMED0:setTopBottom( false, false, -9, 7 )
	ARMED0:setText( Engine.Localize( "MENU_HUD_VEHICLE_ARMED" ) )
	ARMED0:setTTF( "fonts/default.ttf" )
	ARMED0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ARMED0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ARMED0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ARMED0 )
	self.ARMED0 = ARMED0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

