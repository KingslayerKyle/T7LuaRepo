-- e7fdaa88d97a489c691a0f301f294712
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_NotificationBox" )

CoD.vhud_agr_RpmWidget = InheritFrom( LUI.UIElement )
CoD.vhud_agr_RpmWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_agr_RpmWidget )
	self.id = "vhud_agr_RpmWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 86 )
	self:setTopBottom( true, false, 0, 42 )
	
	local vhudagrNotificationBox0 = CoD.vhud_agr_NotificationBox.new( menu, controller )
	vhudagrNotificationBox0:setLeftRight( false, true, -86, -5 )
	vhudagrNotificationBox0:setTopBottom( false, false, -20.91, 9.09 )
	vhudagrNotificationBox0:setYRot( 50 )
	vhudagrNotificationBox0.text:setText( Engine.Localize( "MENU_HUD_VEHICLE_RPM" ) )
	self:addElement( vhudagrNotificationBox0 )
	self.vhudagrNotificationBox0 = vhudagrNotificationBox0
	
	local TextBox10 = LUI.UIText.new()
	TextBox10:setLeftRight( false, true, -86, -5 )
	TextBox10:setTopBottom( false, false, 4.91, 20.91 )
	TextBox10:setRGB( 0.49, 1, 0.74 )
	TextBox10:setYRot( 50 )
	TextBox10:setTTF( "fonts/default.ttf" )
	TextBox10:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	TextBox10:setShaderVector( 0, 0, 1, 0, 0 )
	TextBox10:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox10:setShaderVector( 2, 0, 0, 0, 0 )
	TextBox10:setShaderVector( 3, 0, 0, 0, 0 )
	TextBox10:setShaderVector( 4, 0, 0, 0, 0 )
	TextBox10:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox10:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox10:linkToElementModel( self, "engineRPM", true, function ( model )
		local engineRPM = Engine.GetModelValue( model )
		if engineRPM then
			TextBox10:setText( Engine.Localize( FormatNumberAsString( 0, engineRPM ) ) )
		end
	end )
	self:addElement( TextBox10 )
	self.TextBox10 = TextBox10
	
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
		element.vhudagrNotificationBox0:close()
		element.TextBox10:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
