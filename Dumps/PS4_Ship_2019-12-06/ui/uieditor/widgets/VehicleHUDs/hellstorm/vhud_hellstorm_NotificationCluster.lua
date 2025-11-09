CoD.vhud_hellstorm_NotificationCluster = InheritFrom( LUI.UIElement )
CoD.vhud_hellstorm_NotificationCluster.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_hellstorm_NotificationCluster )
	self.id = "vhud_hellstorm_NotificationCluster"
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
	
	local CLUSTER = LUI.UIText.new()
	CLUSTER:setLeftRight( true, true, 0, 0 )
	CLUSTER:setTopBottom( false, false, -9, 7 )
	CLUSTER:setText( Engine.Localize( "MENU_HUD_VEHICLE_CLUSTER" ) )
	CLUSTER:setTTF( "fonts/default.ttf" )
	CLUSTER:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	CLUSTER:setShaderVector( 0, 0, 1, 0, 0 )
	CLUSTER:setShaderVector( 1, 0, 0, 0, 0 )
	CLUSTER:setShaderVector( 2, 0, 0, 0, 0 )
	CLUSTER:setShaderVector( 3, 0, 0, 0, 0 )
	CLUSTER:setShaderVector( 4, 0, 0, 0, 0 )
	CLUSTER:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CLUSTER:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CLUSTER )
	self.CLUSTER = CLUSTER
	
	local CLUSTER0 = LUI.UIText.new()
	CLUSTER0:setLeftRight( true, true, 0, 0 )
	CLUSTER0:setTopBottom( false, false, -9, 7 )
	CLUSTER0:setText( Engine.Localize( "MENU_HUD_VEHICLE_CLUSTER" ) )
	CLUSTER0:setTTF( "fonts/default.ttf" )
	CLUSTER0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	CLUSTER0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CLUSTER0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CLUSTER0 )
	self.CLUSTER0 = CLUSTER0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

