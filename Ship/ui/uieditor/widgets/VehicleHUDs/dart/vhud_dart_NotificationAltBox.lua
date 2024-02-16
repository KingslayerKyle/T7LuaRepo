-- 70aca21067ac74ed0c01c9b16203a583
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_dart_NotificationAltBox = InheritFrom( LUI.UIElement )
CoD.vhud_dart_NotificationAltBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_dart_NotificationAltBox )
	self.id = "vhud_dart_NotificationAltBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 81 )
	self:setTopBottom( true, false, 0, 30 )
	
	local boxNormal = LUI.UIImage.new()
	boxNormal:setLeftRight( true, true, 0, 0 )
	boxNormal:setTopBottom( true, true, 0, 0 )
	boxNormal:setAlpha( 0.08 )
	boxNormal:setZoom( -20 )
	boxNormal:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_notificationboxaltitude" ) )
	boxNormal:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	boxNormal:setShaderVector( 0, 0.46, 0.5, 0, 0 )
	boxNormal:setupNineSliceShader( 18, 10 )
	self:addElement( boxNormal )
	self.boxNormal = boxNormal
	
	local boxAdd = LUI.UIImage.new()
	boxAdd:setLeftRight( true, true, 0, 0 )
	boxAdd:setTopBottom( true, true, 0, 0 )
	boxAdd:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_notificationboxaltitude" ) )
	boxAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	boxAdd:setShaderVector( 0, 0.46, 0.5, 0, 0 )
	boxAdd:setupNineSliceShader( 18, 10 )
	self:addElement( boxAdd )
	self.boxAdd = boxAdd
	
	local text = LUI.UIText.new()
	text:setLeftRight( false, false, -100, 100 )
	text:setTopBottom( false, false, -8, 8 )
	text:setRGB( 0.95, 0.87, 0.34 )
	text:setText( Engine.Localize( "MENU_HUD_VEHICLE_ALT" ) )
	text:setTTF( "fonts/default.ttf" )
	text:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	text:setShaderVector( 0, 0, 1, 0, 0 )
	text:setShaderVector( 1, 0, 0, 0, 0 )
	text:setShaderVector( 2, 0, 0, 0, 0 )
	text:setShaderVector( 3, 0, 0, 0, 0 )
	text:setShaderVector( 4, 0, 0, 0, 0 )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( text, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWithMinimum( self, element, 20, 81 )
	end )
	self:addElement( text )
	self.text = text
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
