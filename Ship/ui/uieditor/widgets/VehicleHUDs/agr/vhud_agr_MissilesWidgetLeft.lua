-- 39fc66a93ca452535f6f7364293114a9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_NotificationBox" )
require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_NotificationLine" )
require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_NotificationMissiles" )

CoD.vhud_agr_MissilesWidgetLeft = InheritFrom( LUI.UIElement )
CoD.vhud_agr_MissilesWidgetLeft.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.vhud_agr_MissilesWidgetLeft )
	self.id = "vhud_agr_MissilesWidgetLeft"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 86 )
	self:setTopBottom( true, false, 0, 155 )
	self.anyChildUsesUpdateState = true
	
	local speedText = LUI.UIText.new()
	speedText:setLeftRight( false, false, -42, 38 )
	speedText:setTopBottom( false, false, -48.48, -32.48 )
	speedText:setRGB( 0.49, 1, 0.74 )
	speedText:setYRot( -50 )
	speedText:setTTF( "fonts/default.ttf" )
	speedText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	speedText:setShaderVector( 0, 0, 1, 0, 0 )
	speedText:setShaderVector( 1, 0, 0, 0, 0 )
	speedText:setShaderVector( 2, 0, 0, 0, 0 )
	speedText:setShaderVector( 3, 0, 0, 0, 0 )
	speedText:setShaderVector( 4, 0, 0, 0, 0 )
	speedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	speedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	speedText:linkToElementModel( self, "speed", true, function ( model )
		local speed = Engine.GetModelValue( model )
		if speed then
			speedText:setText( Engine.Localize( FormatNumberAsString( 0, speed ) ) )
		end
	end )
	self:addElement( speedText )
	self.speedText = speedText
	
	local vhudagrNotificationBox = CoD.vhud_agr_NotificationBox.new( menu, controller )
	vhudagrNotificationBox:setLeftRight( false, false, -43, 38 )
	vhudagrNotificationBox:setTopBottom( false, false, -74.3, -44.3 )
	vhudagrNotificationBox:setYRot( -50 )
	vhudagrNotificationBox.text:setText( Engine.Localize( "MENU_HUD_VEHICLE_SPEED" ) )
	self:addElement( vhudagrNotificationBox )
	self.vhudagrNotificationBox = vhudagrNotificationBox
	
	local vhudagrNotificationLine = CoD.vhud_agr_NotificationLine.new( menu, controller )
	vhudagrNotificationLine:setLeftRight( false, false, -42, 37 )
	vhudagrNotificationLine:setTopBottom( false, false, 37.75, 45.75 )
	vhudagrNotificationLine:setYRot( -50 )
	self:addElement( vhudagrNotificationLine )
	self.vhudagrNotificationLine = vhudagrNotificationLine
	
	local vhudagrNotificationLine0 = CoD.vhud_agr_NotificationLine.new( menu, controller )
	vhudagrNotificationLine0:setLeftRight( false, false, -42, 37 )
	vhudagrNotificationLine0:setTopBottom( false, false, -34.95, -26.95 )
	vhudagrNotificationLine0:setYRot( -50 )
	self:addElement( vhudagrNotificationLine0 )
	self.vhudagrNotificationLine0 = vhudagrNotificationLine0
	
	local vhudagrNotificationMissiles = CoD.vhud_agr_NotificationMissiles.new( menu, controller )
	vhudagrNotificationMissiles:setLeftRight( false, false, -65.87, 60.87 )
	vhudagrNotificationMissiles:setTopBottom( false, false, -41.15, 48.75 )
	vhudagrNotificationMissiles:linkToElementModel( self, nil, false, function ( model )
		vhudagrNotificationMissiles:setModel( model, controller )
	end )
	self:addElement( vhudagrNotificationMissiles )
	self.vhudagrNotificationMissiles = vhudagrNotificationMissiles
	
	local vhudagrNotificationBox0 = CoD.vhud_agr_NotificationBox.new( menu, controller )
	vhudagrNotificationBox0:setLeftRight( false, false, -43, 38 )
	vhudagrNotificationBox0:setTopBottom( false, false, 39.75, 69.75 )
	vhudagrNotificationBox0:setYRot( -50 )
	vhudagrNotificationBox0.text:setText( Engine.Localize( "MENU_HUD_VEHICLE_MISSILES" ) )
	self:addElement( vhudagrNotificationBox0 )
	self.vhudagrNotificationBox0 = vhudagrNotificationBox0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 0 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudagrNotificationBox:close()
		element.vhudagrNotificationLine:close()
		element.vhudagrNotificationLine0:close()
		element.vhudagrNotificationMissiles:close()
		element.vhudagrNotificationBox0:close()
		element.speedText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
