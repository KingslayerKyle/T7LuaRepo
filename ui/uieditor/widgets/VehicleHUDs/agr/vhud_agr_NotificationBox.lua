-- 381e5335fada80329e589823ea438646
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_agr_NotificationBox = InheritFrom( LUI.UIElement )
CoD.vhud_agr_NotificationBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_agr_NotificationBox )
	self.id = "vhud_agr_NotificationBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 81 )
	self:setTopBottom( true, false, 0, 30 )
	
	local normalBox = LUI.UIImage.new()
	normalBox:setLeftRight( true, true, 0, 0 )
	normalBox:setTopBottom( true, true, 0, 0 )
	normalBox:setRGB( 0.49, 1, 0.74 )
	normalBox:setAlpha( 0.08 )
	normalBox:setZoom( -20 )
	normalBox:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_notificationboxaltitude" ) )
	normalBox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	normalBox:setShaderVector( 0, 0.46, 0.49, 0, 0 )
	normalBox:setupNineSliceShader( 18, 10 )
	self:addElement( normalBox )
	self.normalBox = normalBox
	
	local addBox = LUI.UIImage.new()
	addBox:setLeftRight( true, true, 0, 0 )
	addBox:setTopBottom( true, true, 0, 0 )
	addBox:setRGB( 0.74, 0.99, 0.84 )
	addBox:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_notificationboxaltitude" ) )
	addBox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	addBox:setShaderVector( 0, 0.46, 0.5, 0, 0 )
	addBox:setupNineSliceShader( 18, 10 )
	self:addElement( addBox )
	self.addBox = addBox
	
	local text = LUI.UIText.new()
	text:setLeftRight( false, false, -100, 100 )
	text:setTopBottom( false, false, -8, 8 )
	text:setRGB( 0.49, 1, 0.74 )
	text:setText( Engine.Localize( "MENU_HUD_VEHICLE_RPM" ) )
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
