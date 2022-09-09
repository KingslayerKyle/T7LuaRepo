-- 929a91299c245fc9a71e9385ebe5df60
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.wasp.vhud_sentinel_NotificationBox" )

CoD.vhud_sentinel_AltitudeInfo = InheritFrom( LUI.UIElement )
CoD.vhud_sentinel_AltitudeInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_sentinel_AltitudeInfo )
	self.id = "vhud_sentinel_AltitudeInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 87 )
	self:setTopBottom( true, false, 0, 42 )
	
	local ALTnumbers = LUI.UIText.new()
	ALTnumbers:setLeftRight( false, false, -43.5, 37.5 )
	ALTnumbers:setTopBottom( false, false, 4.83, 20.83 )
	ALTnumbers:setRGB( 0.6, 0.82, 0.91 )
	ALTnumbers:setYRot( 40 )
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
	
	local ALTBox = CoD.vhud_sentinel_NotificationBox.new( menu, controller )
	ALTBox:setLeftRight( false, false, -43.5, 37.5 )
	ALTBox:setTopBottom( false, false, -20.83, 9.17 )
	ALTBox:setRGB( 0.6, 0.82, 0.91 )
	ALTBox:setYRot( 50 )
	ALTBox.SignalText:setText( Engine.Localize( "MENU_HUD_VEHICLE_ALT" ) )
	self:addElement( ALTBox )
	self.ALTBox = ALTBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				ALTnumbers:completeAnimation()
				self.ALTnumbers:setAlpha( 1 )
				self.clipFinished( ALTnumbers, {} )

				ALTBox:completeAnimation()
				self.ALTBox:setAlpha( 1 )
				self.clipFinished( ALTBox, {} )
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

				ALTnumbers:completeAnimation()
				self.ALTnumbers:setAlpha( 0 )
				self.clipFinished( ALTnumbers, {} )

				ALTBox:completeAnimation()
				self.ALTBox:setAlpha( 0 )
				self.clipFinished( ALTBox, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ALTBox:close()
		element.ALTnumbers:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
