-- e095b2bca8342d2dd873e6e92dfcd346
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.wasp.vhud_sentinel_NotificationBox" )

CoD.genericVHUDInfoArea = InheritFrom( LUI.UIElement )
CoD.genericVHUDInfoArea.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.genericVHUDInfoArea )
	self.id = "genericVHUDInfoArea"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 89 )
	self:setTopBottom( true, false, 0, 42 )
	
	local value = LUI.UIText.new()
	value:setLeftRight( false, true, -88.75, 0 )
	value:setTopBottom( false, false, 4.83, 20.83 )
	value:setText( Engine.Localize( "000" ) )
	value:setTTF( "fonts/default.ttf" )
	value:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	value:setShaderVector( 0, 0, 1, 0, 0 )
	value:setShaderVector( 1, 0, 0, 0, 0 )
	value:setShaderVector( 2, 0, 0, 0, 0 )
	value:setShaderVector( 3, 0, 0, 0, 0 )
	value:setShaderVector( 4, 0, 0, 0, 0 )
	value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( value )
	self.value = value
	
	local vhudsentinelNotificationBox = CoD.vhud_sentinel_NotificationBox.new( menu, controller )
	vhudsentinelNotificationBox:setLeftRight( false, false, -44.25, 44.5 )
	vhudsentinelNotificationBox:setTopBottom( false, false, -20.83, 9.17 )
	vhudsentinelNotificationBox.SignalText:setText( Engine.Localize( "MENU_HUD_VEHICLE_SPEED" ) )
	self:addElement( vhudsentinelNotificationBox )
	self.vhudsentinelNotificationBox = vhudsentinelNotificationBox
	
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
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				value:completeAnimation()
				self.value:setAlpha( 0 )
				self.clipFinished( value, {} )
				vhudsentinelNotificationBox:completeAnimation()
				self.vhudsentinelNotificationBox:setAlpha( 0 )
				self.clipFinished( vhudsentinelNotificationBox, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudsentinelNotificationBox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

