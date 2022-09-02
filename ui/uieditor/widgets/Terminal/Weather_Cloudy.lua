-- 4a6535cfcf016149ddffa6addb098e6b
-- This hash is used for caching, delete to decompile the file again

CoD.Weather_Cloudy = InheritFrom( LUI.UIElement )
CoD.Weather_Cloudy.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Weather_Cloudy )
	self.id = "Weather_Cloudy"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 83 )
	self:setTopBottom( true, false, 0, 66 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Sun0 = LUI.UIImage.new()
	Sun0:setLeftRight( true, false, 8.26, 74.74 )
	Sun0:setTopBottom( true, false, 5.5, 62 )
	Sun0:setAlpha( 0.72 )
	Sun0:setImage( RegisterImage( "uie_datavault_weather_sun" ) )
	self:addElement( Sun0 )
	self.Sun0 = Sun0
	
	local CloudSmall = LUI.UIImage.new()
	CloudSmall:setLeftRight( true, false, 38.49, 79.33 )
	CloudSmall:setTopBottom( true, false, 41.5, 59 )
	CloudSmall:setImage( RegisterImage( "uie_datavault_weather_cloudsmall" ) )
	self:addElement( CloudSmall )
	self.CloudSmall = CloudSmall
	
	local CloudSmall0 = LUI.UIImage.new()
	CloudSmall0:setLeftRight( true, false, 4, 49.83 )
	CloudSmall0:setTopBottom( true, false, 13.36, 33 )
	CloudSmall0:setImage( RegisterImage( "uie_datavault_weather_cloudsmall" ) )
	self:addElement( CloudSmall0 )
	self.CloudSmall0 = CloudSmall0
	
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

