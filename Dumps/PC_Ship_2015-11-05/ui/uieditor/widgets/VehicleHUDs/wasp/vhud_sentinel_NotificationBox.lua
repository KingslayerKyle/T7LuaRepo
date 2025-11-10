CoD.vhud_sentinel_NotificationBox = InheritFrom( LUI.UIElement )
CoD.vhud_sentinel_NotificationBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_sentinel_NotificationBox )
	self.id = "vhud_sentinel_NotificationBox"
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
	NotificationAltBox0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_notificationbox" ) )
	NotificationAltBox0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	NotificationAltBox0:setShaderVector( 0, 0.46, 0.5, 0, 0 )
	NotificationAltBox0:setupNineSliceShader( 18, 10 )
	self:addElement( NotificationAltBox0 )
	self.NotificationAltBox0 = NotificationAltBox0
	
	local SignalText = LUI.UIText.new()
	SignalText:setLeftRight( false, false, -100, 100 )
	SignalText:setTopBottom( false, false, -8, 8 )
	SignalText:setRGB( 0.6, 0.82, 0.91 )
	SignalText:setText( Engine.Localize( "MENU_HUD_VEHICLE_SIGNAL" ) )
	SignalText:setTTF( "fonts/default.ttf" )
	SignalText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	SignalText:setShaderVector( 0, 0, 1, 0, 0 )
	SignalText:setShaderVector( 1, 0, 0, 0, 0 )
	SignalText:setShaderVector( 2, 0, 0, 0, 0 )
	SignalText:setShaderVector( 3, 0, 0, 0, 0 )
	SignalText:setShaderVector( 4, 0, 0, 0, 0 )
	SignalText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SignalText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( SignalText, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWithMinimum( self, element, 20, 81 )
	end )
	self:addElement( SignalText )
	self.SignalText = SignalText
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

