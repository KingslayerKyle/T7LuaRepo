-- b611d4854d09d4dbb71cf99740ce0dcf
-- This hash is used for caching, delete to decompile the file again

CoD.MissionRecordVault_AccoladesAirVehicleDestroy = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_AccoladesAirVehicleDestroy.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_AccoladesAirVehicleDestroy )
	self.id = "MissionRecordVault_AccoladesAirVehicleDestroy"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 100 )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, true, 0, 0 )
	image:setTopBottom( true, true, 0, 0 )
	image:setRGB( 1, 0.98, 0.55 )
	image:setImage( RegisterImage( "uie_air_vehicle" ) )
	self:addElement( image )
	self.image = image
	
	local centerText = LUI.UIText.new()
	centerText:setLeftRight( true, true, 17, -58 )
	centerText:setTopBottom( false, false, 7, 37 )
	centerText:setRGB( 0.99, 1, 0 )
	centerText:setAlpha( 0 )
	centerText:setTTF( "fonts/escom.ttf" )
	centerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	centerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	centerText:linkToElementModel( self, "centerText", true, function ( model )
		local _centerText = Engine.GetModelValue( model )
		if _centerText then
			centerText:setText( Engine.Localize( _centerText ) )
		end
	end )
	self:addElement( centerText )
	self.centerText = centerText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				image:completeAnimation()
				self.image:setRGB( 1, 0.96, 0 )
				self.clipFinished( image, {} )
			end
		},
		Incomplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				image:completeAnimation()
				self.image:setRGB( 1, 1, 1 )
				self.clipFinished( image, {} )
				centerText:completeAnimation()
				self.centerText:setRGB( 1, 1, 1 )
				self.clipFinished( centerText, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Incomplete",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "completed" )
			end
		}
	} )
	self:linkToElementModel( self, "completed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completed"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.centerText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

