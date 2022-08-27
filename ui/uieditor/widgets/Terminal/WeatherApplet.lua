-- 6aecdb5c86c16e36e508eb1bc4b21303
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Terminal.Generalframe" )
require( "ui.uieditor.widgets.Terminal.FocusWidget" )
require( "ui.uieditor.widgets.Terminal.Weather_Rainning" )
require( "ui.uieditor.widgets.Terminal.Weather_Snowing" )
require( "ui.uieditor.widgets.Terminal.Weather_Cloudy" )

local PostLoadFunc = function ( f1_arg0 )
	local f1_local0 = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
	local f1_local1 = f1_local0 and Engine.GetModelValue( f1_local0 )
	local f1_local2, f1_local3, f1_local4, f1_local5, f1_local6, f1_local7, f1_local8, f1_local9 = nil
	if f1_local1 == "cp_mi_cairo_aquifer" then
		f1_local9 = "MENU_LOCALE_CAIRO"
		f1_local2 = "MENU_FEELSLIKE_SUN"
		f1_local4 = 9
		f1_local5 = 20
		f1_local6 = 42
		f1_local8 = 28
		f1_local7 = 45
		f1_local3 = 5
		f1_arg0:setState( "Sunny" )
	elseif f1_local1 == "cp_mi_cairo_infection" or f1_local1 == "cp_mi_cairo_infection2" or f1_local1 == "cp_mi_cairo_infection3" then
		f1_local9 = "MENU_LOCALE_CAIRO"
		f1_local2 = "MENU_FEELSLIKE_SUN"
		f1_local4 = 9
		f1_local5 = 50
		f1_local6 = 36
		f1_local8 = 33
		f1_local7 = 45
		f1_local3 = 5
		f1_arg0:setState( "NighttimeClear" )
	elseif f1_local1 == "cp_mi_cairo_lotus" or f1_local1 == "cp_mi_cairo_lotus2" or f1_local1 == "cp_mi_cairo_lotus3" then
		f1_local9 = "MENU_LOCALE_CAIRO"
		f1_local2 = "MENU_FEELSLIKE_REALLYHOT"
		f1_local4 = 9
		f1_local5 = 50
		f1_local6 = 39
		f1_local8 = 32
		f1_local7 = 46
		f1_local3 = 5
		f1_arg0:setState( "PartlyCloudy" )
	elseif f1_local1 == "cp_mi_cairo_ramses" or f1_local1 == "cp_mi_cairo_ramses2" then
		f1_local9 = "MENU_LOCALE_CAIRO"
		f1_local2 = "MENU_FEELSLIKE_FIRE"
		f1_local4 = 9
		f1_local5 = 50
		f1_local6 = 43
		f1_local8 = 36
		f1_local7 = 44
		f1_local3 = 5
		f1_arg0:setState( "Sunny" )
	elseif f1_local1 == "cp_mi_eth_prologue" then
		f1_local9 = "MENU_LOCALE_ETHIOPIA"
		f1_local2 = "MENU_FEELSLIKE_COMFORTABLE"
		f1_local4 = 3
		f1_local5 = 25
		f1_local6 = 19
		f1_local8 = 18
		f1_local7 = 27
		f1_local3 = 65
		f1_arg0:setState( "NighttimeClear" )
	elseif f1_local1 == "cp_mi_sing_biodomes" or f1_local1 == "cp_mi_sing_biodomes2" then
		f1_local9 = "MENU_LOCALE_SINGAPORE"
		f1_local2 = "MENU_FEELSLIKE_WET"
		f1_local4 = 4
		f1_local5 = 35
		f1_local6 = 27
		f1_local8 = 25
		f1_local7 = 30
		f1_local3 = 90
		f1_arg0:setState( "PartlyCloudy" )
	elseif f1_local1 == "cp_mi_sing_blackstation" then
		f1_local9 = "MENU_LOCALE_SINGAPORE"
		f1_local2 = "MENU_FEELSLIKE_SUPERSTORM"
		f1_local4 = 1
		f1_local5 = 2
		f1_local6 = 22
		f1_local8 = 18
		f1_local7 = 23
		f1_local3 = 100
		f1_arg0:setState( "Raining" )
	elseif f1_local1 == "cp_mi_sing_sgen" then
		f1_local9 = "MENU_LOCALE_SINGAPORE"
		f1_local2 = "MENU_FEELSLIKE_SOGGY"
		f1_local4 = 2
		f1_local5 = 10
		f1_local6 = 28
		f1_local8 = 22
		f1_local7 = 32
		f1_local3 = 90
		f1_arg0:setState( "PartlyCloudy" )
	elseif f1_local1 == "cp_mi_sing_vengeance" then
		f1_local9 = "MENU_LOCALE_SINGAPORE"
		f1_local2 = "MENU_FEELSLIKE_DRIPPY"
		f1_local4 = 0
		f1_local5 = 5
		f1_local6 = 23
		f1_local8 = 20
		f1_local7 = 28
		f1_local3 = 85
		f1_arg0:setState( "NighttimeClear" )
	elseif f1_local1 == "cp_mi_zurich_coalescence" then
		f1_local9 = "MENU_LOCALE_SINGAPORE"
		f1_local2 = "MENU_FEELSLIKE_ICE"
		f1_local4 = 1
		f1_local5 = 15
		f1_local6 = -2
		f1_local8 = -10
		f1_local7 = 6
		f1_local3 = 20
		f1_arg0:setState( "Snowing" )
	elseif f1_local1 == "cp_mi_zurich_newworld" then
		f1_local9 = "MENU_LOCALE_SINGAPORE"
		f1_local2 = "MENU_FEELSLIKE_FRIGID"
		f1_local4 = 0
		f1_local5 = 5
		f1_local6 = 0
		f1_local8 = -14
		f1_local7 = 2
		f1_local3 = 15
		f1_arg0:setState( "Snowing" )
	elseif LUI.startswith( Engine.GetCurrentMap(), "cp_sh_cairo" ) then
		f1_local9 = "MENU_LOCALE_CAIRO"
		f1_local2 = "MENU_FEELSLIKE_LAVA"
		f1_local4 = 9
		f1_local5 = 25
		f1_local6 = 44
		f1_local8 = 40
		f1_local7 = 45
		f1_local3 = 5
		f1_arg0:setState( "Sunny" )
	elseif LUI.startswith( Engine.GetCurrentMap(), "cp_sh_singapore" ) then
		f1_local9 = "MENU_LOCALE_SINGAPORE"
		f1_local2 = "MENU_FEELSLIKE_RAIN"
		f1_local4 = 3
		f1_local5 = 15
		f1_local6 = 33
		f1_local8 = 33
		f1_local7 = 35
		f1_local3 = 95
		f1_arg0:setState( "Raining" )
	elseif LUI.startswith( Engine.GetCurrentMap(), "cp_sh_mobile" ) then
		f1_local9 = "MENU_LOCALE_ZURICH"
		f1_local2 = "MENU_FEELSLIKE_SNOW"
		f1_local4 = 1
		f1_local5 = 5
		f1_local6 = 0
		f1_local8 = -3
		f1_local7 = 5
		f1_local3 = 15
		f1_arg0:setState( "Snowing" )
	else
		f1_local9 = "MENU_LOCALE_DARKSIDEOFTHEMOON"
		f1_local2 = "MENU_FEELSLIKE_VACUUM"
		f1_local4 = 11
		f1_local5 = 5000
		f1_local6 = 178
		f1_local8 = -132
		f1_local7 = 254
		f1_local3 = 0
		f1_arg0:setState( "NighttimeClear" )
	end
	f1_arg0.LocationText:setText( Engine.Localize( f1_local9 ) )
	f1_arg0.TempText:setText( f1_local6 )
	f1_arg0.HighLowText:setText( Engine.Localize( "MENU_LOCALE_TEMPLOW" ) .. f1_local8 .. "\n" .. Engine.Localize( "MENU_LOCALE_TEMPHIGH" ) .. f1_local7 )
	f1_arg0.Details1Text:setText( Engine.Localize( "MENU_LOCALE_HUMIDITY" ) .. f1_local3 .. "%" )
	f1_arg0.Details2Text:setText( Engine.Localize( "MENU_LOCALE_FEELSLIKE" ) .. Engine.Localize( f1_local2 ) )
	f1_arg0.Details3Text:setText( Engine.Localize( "MENU_LOCALE_UVINDEX" ) .. f1_local4 )
	f1_arg0.Details4Text:setText( Engine.Localize( "MENU_LOCALE_VISIBILITY" ) .. f1_local5 )
end

CoD.WeatherApplet = InheritFrom( LUI.UIElement )
CoD.WeatherApplet.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeatherApplet )
	self.id = "WeatherApplet"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 219 )
	self:setTopBottom( true, false, 0, 103 )
	self.anyChildUsesUpdateState = true
	
	local Generalframe = CoD.Generalframe.new( menu, controller )
	Generalframe:setLeftRight( true, true, 0, 0 )
	Generalframe:setTopBottom( true, true, 0, 0 )
	self:addElement( Generalframe )
	self.Generalframe = Generalframe
	
	local white = LUI.UIImage.new()
	white:setLeftRight( true, false, 0, 219 )
	white:setTopBottom( true, false, 0, 103 )
	white:setAlpha( 0.1 )
	self:addElement( white )
	self.white = white
	
	local FocusWidget = CoD.FocusWidget.new( menu, controller )
	FocusWidget:setLeftRight( true, true, -8.36, 8.36 )
	FocusWidget:setTopBottom( true, false, 0, 20 )
	FocusWidget:setAlpha( 0 )
	FocusWidget.Name:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( FocusWidget )
	self.FocusWidget = FocusWidget
	
	local LocationText = LUI.UIText.new()
	LocationText:setLeftRight( true, false, 90.33, 213.51 )
	LocationText:setTopBottom( true, false, 8, 26 )
	LocationText:setScale( LanguageOverrideNumber( "japanese", 0.5, 1 ) )
	LocationText:setText( Engine.Localize( LocalizeToUpperString( "MENU_NEW" ) ) )
	LocationText:setTTF( "fonts/escom.ttf" )
	LocationText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	LocationText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LocationText )
	self.LocationText = LocationText
	
	local TempText = LUI.UIText.new()
	TempText:setLeftRight( true, false, 89.75, 153.51 )
	TempText:setTopBottom( true, false, 21.5, 71.5 )
	TempText:setText( Engine.Localize( "555" ) )
	TempText:setTTF( "fonts/escom.ttf" )
	TempText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TempText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TempText )
	self.TempText = TempText
	
	local HighLowText = LUI.UIText.new()
	HighLowText:setLeftRight( true, false, 92.51, 145.21 )
	HighLowText:setTopBottom( true, false, 69, 81 )
	HighLowText:setText( Engine.Localize( "MENU_NEW" ) )
	HighLowText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	HighLowText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HighLowText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HighLowText )
	self.HighLowText = HighLowText
	
	local DetailsText = LUI.UIText.new()
	DetailsText:setLeftRight( true, false, 152, 219 )
	DetailsText:setTopBottom( true, false, 28, 42.5 )
	DetailsText:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	DetailsText:setText( Engine.Localize( "MENU_DETAILS" ) )
	DetailsText:setTTF( "fonts/escom.ttf" )
	DetailsText:setLetterSpacing( 1 )
	DetailsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DetailsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DetailsText )
	self.DetailsText = DetailsText
	
	local Details1Text = LUI.UIText.new()
	Details1Text:setLeftRight( true, false, 152, 217 )
	Details1Text:setTopBottom( true, false, 46, 56 )
	Details1Text:setText( Engine.Localize( "MENU_NEW" ) )
	Details1Text:setTTF( "fonts/default.ttf" )
	Details1Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Details1Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Details1Text )
	self.Details1Text = Details1Text
	
	local Details2Text = LUI.UIText.new()
	Details2Text:setLeftRight( true, false, 152, 217 )
	Details2Text:setTopBottom( true, false, 76, 86 )
	Details2Text:setText( Engine.Localize( "MENU_NEW" ) )
	Details2Text:setTTF( "fonts/default.ttf" )
	Details2Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Details2Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Details2Text )
	self.Details2Text = Details2Text
	
	local Details3Text = LUI.UIText.new()
	Details3Text:setLeftRight( true, false, 152, 217 )
	Details3Text:setTopBottom( true, false, 66, 76 )
	Details3Text:setText( Engine.Localize( "MENU_NEW" ) )
	Details3Text:setTTF( "fonts/default.ttf" )
	Details3Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Details3Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Details3Text )
	self.Details3Text = Details3Text
	
	local Details4Text = LUI.UIText.new()
	Details4Text:setLeftRight( true, false, 152, 217 )
	Details4Text:setTopBottom( true, false, 56, 66 )
	Details4Text:setText( Engine.Localize( "MENU_NEW" ) )
	Details4Text:setTTF( "fonts/default.ttf" )
	Details4Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Details4Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Details4Text )
	self.Details4Text = Details4Text
	
	local Sun = LUI.UIImage.new()
	Sun:setLeftRight( true, false, 3.67, 81.32 )
	Sun:setTopBottom( true, false, 17, 83 )
	Sun:setAlpha( 0 )
	Sun:setImage( RegisterImage( "uie_datavault_weather_sun" ) )
	self:addElement( Sun )
	self.Sun = Sun
	
	local WeatherRainning = CoD.Weather_Rainning.new( menu, controller )
	WeatherRainning:setLeftRight( true, false, 9.67, 80.4 )
	WeatherRainning:setTopBottom( true, false, 24.3, 83.25 )
	self:addElement( WeatherRainning )
	self.WeatherRainning = WeatherRainning
	
	local WeatherSnowing = CoD.Weather_Snowing.new( menu, controller )
	WeatherSnowing:setLeftRight( true, false, 9.67, 80.4 )
	WeatherSnowing:setTopBottom( true, false, 24.3, 78 )
	self:addElement( WeatherSnowing )
	self.WeatherSnowing = WeatherSnowing
	
	local WeatherCloudy = CoD.Weather_Cloudy.new( menu, controller )
	WeatherCloudy:setLeftRight( true, false, 0, 83.33 )
	WeatherCloudy:setTopBottom( true, false, 17, 83 )
	self:addElement( WeatherCloudy )
	self.WeatherCloudy = WeatherCloudy
	
	local Moon = LUI.UIImage.new()
	Moon:setLeftRight( true, false, 7.16, 76.16 )
	Moon:setTopBottom( true, false, 22, 81 )
	Moon:setImage( RegisterImage( "uie_datavault_weather_moon" ) )
	self:addElement( Moon )
	self.Moon = Moon
	
	local Center = LUI.UIImage.new()
	Center:setLeftRight( true, true, 152, -2 )
	Center:setTopBottom( true, true, 40.5, -56.5 )
	Center:setImage( RegisterImage( "uie_t7_menu_cp_datavault_1pxlinecenter" ) )
	self:addElement( Center )
	self.Center = Center
	
	WeatherRainning.navigation = {
		left = WeatherCloudy,
		up = WeatherCloudy
	}
	WeatherSnowing.navigation = {
		left = WeatherCloudy,
		up = WeatherCloudy
	}
	WeatherCloudy.navigation = {
		right = {
			WeatherRainning,
			WeatherSnowing
		},
		down = {
			WeatherRainning,
			WeatherSnowing
		}
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Sun:completeAnimation()
				self.Sun:setAlpha( 1 )
				self.clipFinished( Sun, {} )
				WeatherRainning:completeAnimation()
				self.WeatherRainning:setAlpha( 0 )
				self.clipFinished( WeatherRainning, {} )
				WeatherSnowing:completeAnimation()
				self.WeatherSnowing:setAlpha( 0 )
				self.clipFinished( WeatherSnowing, {} )
				WeatherCloudy:completeAnimation()
				self.WeatherCloudy:setAlpha( 0 )
				self.clipFinished( WeatherCloudy, {} )
				Moon:completeAnimation()
				self.Moon:setAlpha( 0 )
				self.clipFinished( Moon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 3 )
				local GeneralframeFrame2 = function ( Generalframe, event )
					if not event.interrupted then
						Generalframe:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					Generalframe:setLeftRight( true, true, 0, 0 )
					Generalframe:setTopBottom( true, true, 15, 15 )
					if event.interrupted then
						self.clipFinished( Generalframe, event )
					else
						Generalframe:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 0, 0 )
				GeneralframeFrame2( Generalframe, {} )
				local whiteFrame2 = function ( white, event )
					if not event.interrupted then
						white:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					white:setLeftRight( true, false, 0, 219 )
					white:setTopBottom( true, false, 15, 118 )
					if event.interrupted then
						self.clipFinished( white, event )
					else
						white:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				white:completeAnimation()
				self.white:setLeftRight( true, false, 0, 219 )
				self.white:setTopBottom( true, false, 0, 103 )
				whiteFrame2( white, {} )
				local FocusWidgetFrame2 = function ( FocusWidget, event )
					if not event.interrupted then
						FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					FocusWidget:setLeftRight( true, true, -8.36, 8.36 )
					FocusWidget:setTopBottom( true, false, -10, 10 )
					FocusWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusWidget, event )
					else
						FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -9, 7.71 )
				self.FocusWidget:setTopBottom( true, false, 0, 20 )
				self.FocusWidget:setAlpha( 0 )
				FocusWidgetFrame2( FocusWidget, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )
				local GeneralframeFrame2 = function ( Generalframe, event )
					if not event.interrupted then
						Generalframe:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					Generalframe:setLeftRight( true, true, 0, 0 )
					Generalframe:setTopBottom( true, true, 0, 0 )
					if event.interrupted then
						self.clipFinished( Generalframe, event )
					else
						Generalframe:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 15, 15 )
				GeneralframeFrame2( Generalframe, {} )
				local whiteFrame2 = function ( white, event )
					if not event.interrupted then
						white:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					white:setLeftRight( true, false, 0, 219 )
					white:setTopBottom( true, false, 0, 103 )
					if event.interrupted then
						self.clipFinished( white, event )
					else
						white:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				white:completeAnimation()
				self.white:setLeftRight( true, false, 0, 219 )
				self.white:setTopBottom( true, false, 15, 118 )
				whiteFrame2( white, {} )
				local FocusWidgetFrame2 = function ( FocusWidget, event )
					if not event.interrupted then
						FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					FocusWidget:setLeftRight( true, true, -8.36, 8.36 )
					FocusWidget:setTopBottom( true, false, 0, 20 )
					FocusWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusWidget, event )
					else
						FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -8.36, 8.36 )
				self.FocusWidget:setTopBottom( true, false, -10, 10 )
				self.FocusWidget:setAlpha( 1 )
				FocusWidgetFrame2( FocusWidget, {} )
			end
		},
		Sunny = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Sun:completeAnimation()
				self.Sun:setAlpha( 0.95 )
				self.clipFinished( Sun, {} )
				WeatherRainning:completeAnimation()
				self.WeatherRainning:setAlpha( 0 )
				self.clipFinished( WeatherRainning, {} )
				WeatherSnowing:completeAnimation()
				self.WeatherSnowing:setAlpha( 0 )
				self.clipFinished( WeatherSnowing, {} )
				WeatherCloudy:completeAnimation()
				self.WeatherCloudy:setAlpha( 0 )
				self.clipFinished( WeatherCloudy, {} )
				Moon:completeAnimation()
				self.Moon:setAlpha( 0 )
				self.clipFinished( Moon, {} )
			end
		},
		Raining = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Sun:completeAnimation()
				self.Sun:setAlpha( 0 )
				self.clipFinished( Sun, {} )
				WeatherRainning:completeAnimation()
				self.WeatherRainning:setAlpha( 0.95 )
				self.clipFinished( WeatherRainning, {} )
				WeatherSnowing:completeAnimation()
				self.WeatherSnowing:setAlpha( 0 )
				self.clipFinished( WeatherSnowing, {} )
				WeatherCloudy:completeAnimation()
				self.WeatherCloudy:setAlpha( 0 )
				self.clipFinished( WeatherCloudy, {} )
				Moon:completeAnimation()
				self.Moon:setAlpha( 0 )
				self.clipFinished( Moon, {} )
			end
		},
		Snowing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Sun:completeAnimation()
				self.Sun:setAlpha( 0 )
				self.clipFinished( Sun, {} )
				WeatherRainning:completeAnimation()
				self.WeatherRainning:setAlpha( 0 )
				self.clipFinished( WeatherRainning, {} )
				WeatherSnowing:completeAnimation()
				self.WeatherSnowing:setAlpha( 0.95 )
				self.clipFinished( WeatherSnowing, {} )
				WeatherCloudy:completeAnimation()
				self.WeatherCloudy:setAlpha( 0 )
				self.clipFinished( WeatherCloudy, {} )
				Moon:completeAnimation()
				self.Moon:setAlpha( 0 )
				self.clipFinished( Moon, {} )
			end
		},
		PartlyCloudy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Sun:completeAnimation()
				self.Sun:setAlpha( 0 )
				self.clipFinished( Sun, {} )
				WeatherRainning:completeAnimation()
				self.WeatherRainning:setAlpha( 0 )
				self.clipFinished( WeatherRainning, {} )
				WeatherSnowing:completeAnimation()
				self.WeatherSnowing:setAlpha( 0 )
				self.clipFinished( WeatherSnowing, {} )
				WeatherCloudy:completeAnimation()
				self.WeatherCloudy:setAlpha( 1 )
				self.clipFinished( WeatherCloudy, {} )
				Moon:completeAnimation()
				self.Moon:setAlpha( 0 )
				self.clipFinished( Moon, {} )
			end
		},
		NightTimeClear = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Sun:completeAnimation()
				self.Sun:setAlpha( 0 )
				self.clipFinished( Sun, {} )
				WeatherRainning:completeAnimation()
				self.WeatherRainning:setAlpha( 0 )
				self.clipFinished( WeatherRainning, {} )
				WeatherSnowing:completeAnimation()
				self.WeatherSnowing:setAlpha( 0 )
				self.clipFinished( WeatherSnowing, {} )
				WeatherCloudy:completeAnimation()
				self.WeatherCloudy:setAlpha( 0 )
				self.clipFinished( WeatherCloudy, {} )
				Moon:completeAnimation()
				self.Moon:setAlpha( 1 )
				self.clipFinished( Moon, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	WeatherRainning.id = "WeatherRainning"
	WeatherSnowing.id = "WeatherSnowing"
	WeatherCloudy.id = "WeatherCloudy"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Generalframe:close()
		element.FocusWidget:close()
		element.WeatherRainning:close()
		element.WeatherSnowing:close()
		element.WeatherCloudy:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

