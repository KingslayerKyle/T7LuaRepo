-- 1b50c751e586e0113b463c0e4792ec76
-- This hash is used for caching, delete to decompile the file again

CoD.Weather_Snowing = InheritFrom( LUI.UIElement )
CoD.Weather_Snowing.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Weather_Snowing )
	self.id = "Weather_Snowing"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 71 )
	self:setTopBottom( true, false, 0, 54 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local CloudBig = LUI.UIImage.new()
	CloudBig:setLeftRight( true, false, 0, 57.64 )
	CloudBig:setTopBottom( true, false, 0, 31.7 )
	CloudBig:setImage( RegisterImage( "uie_datavault_weather_cloudbig" ) )
	self:addElement( CloudBig )
	self.CloudBig = CloudBig
	
	local CloudSmall = LUI.UIImage.new()
	CloudSmall:setLeftRight( true, false, 29.9, 70.73 )
	CloudSmall:setTopBottom( true, false, 14.2, 31.7 )
	CloudSmall:setImage( RegisterImage( "uie_datavault_weather_cloudsmall" ) )
	self:addElement( CloudSmall )
	self.CloudSmall = CloudSmall
	
	local RainDrop0 = LUI.UIImage.new()
	RainDrop0:setLeftRight( true, false, 10.57, 16.57 )
	RainDrop0:setTopBottom( true, false, 34.7, 40.7 )
	RainDrop0:setImage( RegisterImage( "uie_datavault_weather_snow" ) )
	self:addElement( RainDrop0 )
	self.RainDrop0 = RainDrop0
	
	local RainDrop00 = LUI.UIImage.new()
	RainDrop00:setLeftRight( true, false, 19.82, 24.82 )
	RainDrop00:setTopBottom( true, false, 34.7, 39.7 )
	RainDrop00:setImage( RegisterImage( "uie_datavault_weather_snow" ) )
	self:addElement( RainDrop00 )
	self.RainDrop00 = RainDrop00
	
	local RainDrop000 = LUI.UIImage.new()
	RainDrop000:setLeftRight( true, false, 14.07, 16.57 )
	RainDrop000:setTopBottom( true, false, 45.2, 47.7 )
	RainDrop000:setImage( RegisterImage( "uie_datavault_weather_snow" ) )
	self:addElement( RainDrop000 )
	self.RainDrop000 = RainDrop000
	
	local RainDrop01 = LUI.UIImage.new()
	RainDrop01:setLeftRight( true, false, 31.57, 41.57 )
	RainDrop01:setTopBottom( true, false, 33.7, 43.7 )
	RainDrop01:setImage( RegisterImage( "uie_datavault_weather_snow" ) )
	self:addElement( RainDrop01 )
	self.RainDrop01 = RainDrop01
	
	local RainDrop010 = LUI.UIImage.new()
	RainDrop010:setLeftRight( true, false, 41.57, 47.57 )
	RainDrop010:setTopBottom( true, false, 37.7, 43.7 )
	RainDrop010:setImage( RegisterImage( "uie_datavault_weather_snow" ) )
	self:addElement( RainDrop010 )
	self.RainDrop010 = RainDrop010
	
	local RainDrop0000 = LUI.UIImage.new()
	RainDrop0000:setLeftRight( true, false, 36.07, 38.57 )
	RainDrop0000:setTopBottom( true, false, 45.2, 47.7 )
	RainDrop0000:setImage( RegisterImage( "uie_datavault_weather_snow" ) )
	self:addElement( RainDrop0000 )
	self.RainDrop0000 = RainDrop0000
	
	local RainDrop02 = LUI.UIImage.new()
	RainDrop02:setLeftRight( true, false, 24.32, 31.32 )
	RainDrop02:setTopBottom( true, false, 39.7, 46.7 )
	RainDrop02:setImage( RegisterImage( "uie_datavault_weather_snow" ) )
	self:addElement( RainDrop02 )
	self.RainDrop02 = RainDrop02
	
	local RainDrop0100 = LUI.UIImage.new()
	RainDrop0100:setLeftRight( true, false, 24.9, 30.82 )
	RainDrop0100:setTopBottom( true, false, 47.77, 53.7 )
	RainDrop0100:setImage( RegisterImage( "uie_datavault_weather_snow" ) )
	self:addElement( RainDrop0100 )
	self.RainDrop0100 = RainDrop0100
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

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
		},
		Sunny = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Raining = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Snowing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		PartlyCloudy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		NightTimeClear = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.WeatherRainning:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

