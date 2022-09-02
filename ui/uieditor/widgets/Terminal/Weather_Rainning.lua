-- 530718ec731fd5a64a854233b644e7d8
-- This hash is used for caching, delete to decompile the file again

CoD.Weather_Rainning = InheritFrom( LUI.UIElement )
CoD.Weather_Rainning.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Weather_Rainning )
	self.id = "Weather_Rainning"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 71 )
	self:setTopBottom( true, false, 0, 59 )
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
	RainDrop0:setLeftRight( true, false, 6.64, 20.89 )
	RainDrop0:setTopBottom( true, false, 34.08, 48.33 )
	RainDrop0:setImage( RegisterImage( "uie_datavault_weather_rain" ) )
	self:addElement( RainDrop0 )
	self.RainDrop0 = RainDrop0
	
	local RainDrop00 = LUI.UIImage.new()
	RainDrop00:setLeftRight( true, false, 35.99, 50.24 )
	RainDrop00:setTopBottom( true, false, 34.08, 48.33 )
	RainDrop00:setImage( RegisterImage( "uie_datavault_weather_rain" ) )
	self:addElement( RainDrop00 )
	self.RainDrop00 = RainDrop00
	
	local RainDrop01 = LUI.UIImage.new()
	RainDrop01:setLeftRight( true, false, 17.57, 31.82 )
	RainDrop01:setTopBottom( true, false, 44.7, 58.95 )
	RainDrop01:setImage( RegisterImage( "uie_datavault_weather_rain" ) )
	self:addElement( RainDrop01 )
	self.RainDrop01 = RainDrop01
	
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
				self:setupElementClipCounter( 1 )

				CloudBig:completeAnimation()
				self.CloudBig:setAlpha( 1 )
				self.clipFinished( CloudBig, {} )
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

