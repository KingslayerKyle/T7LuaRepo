-- fbb138e0ca1a1efeed9bcae8b73b0847
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.wasp.vhud_sentinel_NotificationLine" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_NotificationBox" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_missilesWidget" )

CoD.vhud_ms_StatusWidgetRight = InheritFrom( LUI.UIElement )
CoD.vhud_ms_StatusWidgetRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_StatusWidgetRight )
	self.id = "vhud_ms_StatusWidgetRight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 83 )
	self:setTopBottom( true, false, 0, 162 )
	self.anyChildUsesUpdateState = true
	
	local SpeedNumbers = LUI.UIText.new()
	SpeedNumbers:setLeftRight( true, true, 0, 0 )
	SpeedNumbers:setTopBottom( true, false, 25.22, 41.22 )
	SpeedNumbers:setTTF( "fonts/default.ttf" )
	SpeedNumbers:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	SpeedNumbers:setShaderVector( 0, 0, 1, 0, 0 )
	SpeedNumbers:setShaderVector( 1, 0, 0, 0, 0 )
	SpeedNumbers:setShaderVector( 2, 0, 0, 0, 0 )
	SpeedNumbers:setShaderVector( 3, 0, 0, 0, 0 )
	SpeedNumbers:setShaderVector( 4, 0, 0, 0, 0 )
	SpeedNumbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SpeedNumbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SpeedNumbers:linkToElementModel( self, "speed", true, function ( model )
		local speed = Engine.GetModelValue( model )
		if speed then
			SpeedNumbers:setText( Engine.Localize( FormatNumberAsString( 0, speed ) ) )
		end
	end )
	self:addElement( SpeedNumbers )
	self.SpeedNumbers = SpeedNumbers
	
	local vhudsentinelNotificationLine = CoD.vhud_sentinel_NotificationLine.new( menu, controller )
	vhudsentinelNotificationLine:setLeftRight( true, true, 2, -2 )
	vhudsentinelNotificationLine:setTopBottom( true, false, 40.72, 48.72 )
	vhudsentinelNotificationLine:setRGB( 0.74, 0.94, 0.99 )
	vhudsentinelNotificationLine:setAlpha( 0.7 )
	self:addElement( vhudsentinelNotificationLine )
	self.vhudsentinelNotificationLine = vhudsentinelNotificationLine
	
	local vhudmsNotificationBox = CoD.vhud_ms_NotificationBox.new( menu, controller )
	vhudmsNotificationBox:setLeftRight( false, false, -41.5, 41.5 )
	vhudmsNotificationBox:setTopBottom( true, false, 0, 30 )
	vhudmsNotificationBox.ALTtext:setText( Engine.Localize( "MENU_HUD_VEHICLE_SPEED" ) )
	self:addElement( vhudmsNotificationBox )
	self.vhudmsNotificationBox = vhudmsNotificationBox
	
	local vhudmsmissilesWidget = CoD.vhud_ms_missilesWidget.new( menu, controller )
	vhudmsmissilesWidget:setLeftRight( false, false, -32.22, 30.22 )
	vhudmsmissilesWidget:setTopBottom( true, false, 61.83, 118.83 )
	vhudmsmissilesWidget:linkToElementModel( self, nil, false, function ( model )
		vhudmsmissilesWidget:setModel( model, controller )
	end )
	self:addElement( vhudmsmissilesWidget )
	self.vhudmsmissilesWidget = vhudmsmissilesWidget
	
	local vhudmsmissilesWidget0 = CoD.vhud_ms_missilesWidget.new( menu, controller )
	vhudmsmissilesWidget0:setLeftRight( false, false, -32.22, 30.22 )
	vhudmsmissilesWidget0:setTopBottom( true, false, 61.83, 118.83 )
	vhudmsmissilesWidget0:setAlpha( 0.15 )
	vhudmsmissilesWidget0:setZoom( -15 )
	vhudmsmissilesWidget0:linkToElementModel( self, nil, false, function ( model )
		vhudmsmissilesWidget0:setModel( model, controller )
	end )
	self:addElement( vhudmsmissilesWidget0 )
	self.vhudmsmissilesWidget0 = vhudmsmissilesWidget0
	
	local vhudsentinelNotificationLine0 = CoD.vhud_sentinel_NotificationLine.new( menu, controller )
	vhudsentinelNotificationLine0:setLeftRight( true, true, 2, -2 )
	vhudsentinelNotificationLine0:setTopBottom( true, false, 138.67, 146.67 )
	vhudsentinelNotificationLine0:setRGB( 0.74, 0.94, 0.99 )
	vhudsentinelNotificationLine0:setAlpha( 0.7 )
	self:addElement( vhudsentinelNotificationLine0 )
	self.vhudsentinelNotificationLine0 = vhudsentinelNotificationLine0
	
	local MISSILEStext = LUI.UIText.new()
	MISSILEStext:setLeftRight( true, true, 0, 0 )
	MISSILEStext:setTopBottom( true, false, 146.88, 161.88 )
	MISSILEStext:setText( Engine.Localize( "MENU_HUD_VEHICLE_MISSILES" ) )
	MISSILEStext:setTTF( "fonts/default.ttf" )
	MISSILEStext:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	MISSILEStext:setShaderVector( 0, 0, 1, 0, 0 )
	MISSILEStext:setShaderVector( 1, 0, 0, 0, 0 )
	MISSILEStext:setShaderVector( 2, 0, 0, 0, 0 )
	MISSILEStext:setShaderVector( 3, 0, 0, 0, 0 )
	MISSILEStext:setShaderVector( 4, 0, 0, 0, 0 )
	MISSILEStext:setLetterSpacing( 0.5 )
	MISSILEStext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MISSILEStext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MISSILEStext )
	self.MISSILEStext = MISSILEStext
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudsentinelNotificationLine:close()
		element.vhudmsNotificationBox:close()
		element.vhudmsmissilesWidget:close()
		element.vhudmsmissilesWidget0:close()
		element.vhudsentinelNotificationLine0:close()
		element.SpeedNumbers:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
