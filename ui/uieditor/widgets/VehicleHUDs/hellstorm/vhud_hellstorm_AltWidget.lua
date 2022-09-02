-- fe7c162207bbd2de215bb57aeabad1b7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_NotificationBox" )

CoD.vhud_hellstorm_AltWidget = InheritFrom( LUI.UIElement )
CoD.vhud_hellstorm_AltWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_hellstorm_AltWidget )
	self.id = "vhud_hellstorm_AltWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 87 )
	self:setTopBottom( true, false, 0, 42 )
	
	local ALTnumbers = LUI.UIText.new()
	ALTnumbers:setLeftRight( false, false, -43.5, 43.5 )
	ALTnumbers:setTopBottom( true, false, 25.65, 41.65 )
	ALTnumbers:setTTF( "fonts/default.ttf" )
	ALTnumbers:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	ALTnumbers:setShaderVector( 0, 0, 1, 0, 0 )
	ALTnumbers:setShaderVector( 1, 0, 0, 0, 0 )
	ALTnumbers:setShaderVector( 2, 0, 0, 0, 0 )
	ALTnumbers:setShaderVector( 3, 0, 0, 0, 0 )
	ALTnumbers:setShaderVector( 4, 0, 0, 0, 0 )
	ALTnumbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ALTnumbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ALTnumbers:linkToElementModel( self, "altitude", true, function ( model )
		local altitude = Engine.GetModelValue( model )
		if altitude then
			ALTnumbers:setText( Engine.Localize( FormatNumberAsString( 0, altitude ) ) )
		end
	end )
	self:addElement( ALTnumbers )
	self.ALTnumbers = ALTnumbers
	
	local vhudmsNotificationBox0 = CoD.vhud_ms_NotificationBox.new( menu, controller )
	vhudmsNotificationBox0:setLeftRight( false, false, -43.5, 43.5 )
	vhudmsNotificationBox0:setTopBottom( true, false, 0, 30 )
	vhudmsNotificationBox0.ALTtext:setText( Engine.Localize( "MENU_HUD_VEHICLE_ALT" ) )
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
		element.ALTnumbers:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

