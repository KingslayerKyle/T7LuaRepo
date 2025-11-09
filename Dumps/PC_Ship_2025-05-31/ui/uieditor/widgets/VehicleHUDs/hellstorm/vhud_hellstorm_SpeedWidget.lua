require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_NotificationBox" )

CoD.vhud_hellstorm_SpeedWidget = InheritFrom( LUI.UIElement )
CoD.vhud_hellstorm_SpeedWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_hellstorm_SpeedWidget )
	self.id = "vhud_hellstorm_SpeedWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 87 )
	self:setTopBottom( true, false, 0, 42 )
	
	local speednumbers = LUI.UIText.new()
	speednumbers:setLeftRight( false, false, -43.5, 43.5 )
	speednumbers:setTopBottom( true, false, 25.65, 42 )
	speednumbers:setTTF( "fonts/default.ttf" )
	speednumbers:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	speednumbers:setShaderVector( 0, 0, 1, 0, 0 )
	speednumbers:setShaderVector( 1, 0, 0, 0, 0 )
	speednumbers:setShaderVector( 2, 0, 0, 0, 0 )
	speednumbers:setShaderVector( 3, 0, 0, 0, 0 )
	speednumbers:setShaderVector( 4, 0, 0, 0, 0 )
	speednumbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	speednumbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	speednumbers:linkToElementModel( self, "speed", true, function ( model )
		local speed = Engine.GetModelValue( model )
		if speed then
			speednumbers:setText( Engine.Localize( FormatNumberAsString( 0, speed ) ) )
		end
	end )
	self:addElement( speednumbers )
	self.speednumbers = speednumbers
	
	local vhudmsNotificationBox0 = CoD.vhud_ms_NotificationBox.new( menu, controller )
	vhudmsNotificationBox0:setLeftRight( false, false, -43.5, 43.5 )
	vhudmsNotificationBox0:setTopBottom( true, false, 0, 30 )
	vhudmsNotificationBox0.ALTtext:setText( Engine.Localize( "MENU_HUD_VEHICLE_SPEED" ) )
	self:addElement( vhudmsNotificationBox0 )
	self.vhudmsNotificationBox0 = vhudmsNotificationBox0
	
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
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudmsNotificationBox0:close()
		element.speednumbers:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

