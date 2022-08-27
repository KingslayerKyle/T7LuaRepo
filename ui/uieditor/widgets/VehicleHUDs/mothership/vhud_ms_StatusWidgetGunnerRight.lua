-- 96c947e3fc69ce278ca19eaab1353338
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.wasp.vhud_sentinel_NotificationLine" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_NotificationBox" )

CoD.vhud_ms_StatusWidgetGunnerRight = InheritFrom( LUI.UIElement )
CoD.vhud_ms_StatusWidgetGunnerRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_StatusWidgetGunnerRight )
	self.id = "vhud_ms_StatusWidgetGunnerRight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 83 )
	self:setTopBottom( true, false, 0, 162 )
	
	local SpeedNumbers = LUI.UIText.new()
	SpeedNumbers:setLeftRight( true, true, 0, 0 )
	SpeedNumbers:setTopBottom( false, false, -55.78, -39.78 )
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
			SpeedNumbers:setText( Engine.Localize( speed ) )
		end
	end )
	self:addElement( SpeedNumbers )
	self.SpeedNumbers = SpeedNumbers
	
	local vhudsentinelNotificationLine = CoD.vhud_sentinel_NotificationLine.new( menu, controller )
	vhudsentinelNotificationLine:setLeftRight( true, false, 2, 81 )
	vhudsentinelNotificationLine:setTopBottom( true, false, 40.72, 48.72 )
	vhudsentinelNotificationLine:setRGB( 0.74, 0.94, 0.99 )
	vhudsentinelNotificationLine:setAlpha( 0.7 )
	self:addElement( vhudsentinelNotificationLine )
	self.vhudsentinelNotificationLine = vhudsentinelNotificationLine
	
	local vhudmsNotificationBox = CoD.vhud_ms_NotificationBox.new( menu, controller )
	vhudmsNotificationBox:setLeftRight( true, false, 0, 81 )
	vhudmsNotificationBox:setTopBottom( true, false, 0, 30 )
	vhudmsNotificationBox.ALTtext:setText( Engine.Localize( "MENU_HUD_VEHICLE_SPEED" ) )
	self:addElement( vhudmsNotificationBox )
	self.vhudmsNotificationBox = vhudmsNotificationBox
	
	local vhudsentinelNotificationLine0 = CoD.vhud_sentinel_NotificationLine.new( menu, controller )
	vhudsentinelNotificationLine0:setLeftRight( true, false, 2, 81 )
	vhudsentinelNotificationLine0:setTopBottom( true, false, 138.72, 146.72 )
	vhudsentinelNotificationLine0:setRGB( 0.74, 0.94, 0.99 )
	vhudsentinelNotificationLine0:setAlpha( 0.7 )
	self:addElement( vhudsentinelNotificationLine0 )
	self.vhudsentinelNotificationLine0 = vhudsentinelNotificationLine0
	
	local statusText = LUI.UIText.new()
	statusText:setLeftRight( true, true, 0, 0 )
	statusText:setTopBottom( true, false, 147, 162 )
	statusText:setText( Engine.Localize( "MENU_STATUS_CAPS" ) )
	statusText:setTTF( "fonts/default.ttf" )
	statusText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	statusText:setShaderVector( 0, 0, 1, 0, 0 )
	statusText:setShaderVector( 1, 0, 0, 0, 0 )
	statusText:setShaderVector( 2, 0, 0, 0, 0 )
	statusText:setShaderVector( 3, 0, 0, 0, 0 )
	statusText:setShaderVector( 4, 0, 0, 0, 0 )
	statusText:setLetterSpacing( 0.5 )
	statusText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	statusText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( statusText )
	self.statusText = statusText
	
	local Bar0 = LUI.UIImage.new()
	Bar0:setLeftRight( true, false, -4.5, 85.5 )
	Bar0:setTopBottom( true, false, 84.3, 102.71 )
	Bar0:setRGB( 0.74, 0.94, 0.99 )
	Bar0:setAlpha( 0.15 )
	Bar0:setZRot( 90 )
	Bar0:setZoom( -15 )
	Bar0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_timebar" ) )
	Bar0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bar0 )
	self.Bar0 = Bar0
	
	local Bar = LUI.UIImage.new()
	Bar:setLeftRight( true, false, -4.5, 85.5 )
	Bar:setTopBottom( true, false, 84.3, 102.71 )
	Bar:setRGB( 0.74, 0.94, 0.99 )
	Bar:setZRot( 90 )
	Bar:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_timebar" ) )
	Bar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bar )
	self.Bar = Bar
	
	local solidbar = LUI.UIImage.new()
	solidbar:setLeftRight( true, false, -4.5, 85.5 )
	solidbar:setTopBottom( true, false, 84.3, 102.71 )
	solidbar:setRGB( 0.74, 0.94, 0.99 )
	solidbar:setZRot( 90 )
	solidbar:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_timebarsolid" ) )
	solidbar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	solidbar:setShaderVector( 1, 0, 0, 0, 0 )
	solidbar:setShaderVector( 2, 1, 0, 0, 0 )
	solidbar:setShaderVector( 3, 0, 0, 0, 0 )
	solidbar:linkToElementModel( self, "weaponHeat", true, function ( model )
		local weaponHeat = Engine.GetModelValue( model )
		if weaponHeat then
			solidbar:setShaderVector( 0, CoD.GetVectorComponentFromString( weaponHeat, 1 ), CoD.GetVectorComponentFromString( weaponHeat, 2 ), CoD.GetVectorComponentFromString( weaponHeat, 3 ), CoD.GetVectorComponentFromString( weaponHeat, 4 ) )
		end
	end )
	self:addElement( solidbar )
	self.solidbar = solidbar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				solidbar:completeAnimation()
				self.solidbar:setRGB( 0.74, 0.94, 0.99 )
				self.clipFinished( solidbar, {} )
			end
		},
		Overheating = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				solidbar:completeAnimation()
				self.solidbar:setRGB( 0.99, 0.2, 0.27 )
				self.clipFinished( solidbar, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Overheating",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "weaponOverheating" )
			end
		}
	} )
	self:linkToElementModel( self, "weaponOverheating", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "weaponOverheating"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudsentinelNotificationLine:close()
		element.vhudmsNotificationBox:close()
		element.vhudsentinelNotificationLine0:close()
		element.SpeedNumbers:close()
		element.solidbar:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

