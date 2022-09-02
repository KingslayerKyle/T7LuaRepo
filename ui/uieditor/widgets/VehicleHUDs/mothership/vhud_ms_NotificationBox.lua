-- 4dbf25a797a367197ec10f0190624f26
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_ms_NotificationBox = InheritFrom( LUI.UIElement )
CoD.vhud_ms_NotificationBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_NotificationBox )
	self.id = "vhud_ms_NotificationBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 81 )
	self:setTopBottom( true, false, 0, 30 )
	
	local NotificationAltBox = LUI.UIImage.new()
	NotificationAltBox:setLeftRight( true, true, 0, 0 )
	NotificationAltBox:setTopBottom( true, true, 0, 0 )
	NotificationAltBox:setAlpha( 0.08 )
	NotificationAltBox:setZoom( -20 )
	NotificationAltBox:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_notificationbox" ) )
	NotificationAltBox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	NotificationAltBox:setShaderVector( 0, 0.46, 0.5, 0, 0 )
	NotificationAltBox:setupNineSliceShader( 18, 10 )
	self:addElement( NotificationAltBox )
	self.NotificationAltBox = NotificationAltBox
	
	local NotificationAltBox0 = LUI.UIImage.new()
	NotificationAltBox0:setLeftRight( true, true, 0, 0 )
	NotificationAltBox0:setTopBottom( true, true, 0, 0 )
	NotificationAltBox0:setRGB( 0.74, 0.94, 0.99 )
	NotificationAltBox0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_notificationbox" ) )
	NotificationAltBox0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	NotificationAltBox0:setShaderVector( 0, 0.46, 0.5, 0, 0 )
	NotificationAltBox0:setupNineSliceShader( 18, 10 )
	self:addElement( NotificationAltBox0 )
	self.NotificationAltBox0 = NotificationAltBox0
	
	local ALTtext = LUI.UIText.new()
	ALTtext:setLeftRight( false, false, -100, 100 )
	ALTtext:setTopBottom( false, false, -7.64, 8.36 )
	ALTtext:setText( Engine.Localize( "MENU_HUD_VEHICLE_ALT" ) )
	ALTtext:setTTF( "fonts/default.ttf" )
	ALTtext:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	ALTtext:setShaderVector( 0, 0, 1, 0, 0 )
	ALTtext:setShaderVector( 1, 0, 0, 0, 0 )
	ALTtext:setShaderVector( 2, 0, 0, 0, 0 )
	ALTtext:setShaderVector( 3, 0, 0, 0, 0 )
	ALTtext:setShaderVector( 4, 0, 0, 0, 0 )
	ALTtext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ALTtext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( ALTtext, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWithMinimum( self, element, 20, 81 )
	end )
	self:addElement( ALTtext )
	self.ALTtext = ALTtext
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

