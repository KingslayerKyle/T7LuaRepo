-- e3a0fea4d525ca84bc332781fa6a7cb6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Terminal.Generalframe" )
require( "ui.uieditor.widgets.Terminal.FocusWidget" )

CoD.WeatherWidget = InheritFrom( LUI.UIElement )
CoD.WeatherWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.WeatherWidget )
	self.id = "WeatherWidget"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 219 )
	self:setTopBottom( true, false, 0, 103 )
	self:makeFocusable()
	self:setHandleMouse( true )
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
	
	local CurTemp = LUI.UIText.new()
	CurTemp:setLeftRight( true, false, 110.75, 210.75 )
	CurTemp:setTopBottom( true, false, 29.5, 92.5 )
	CurTemp:setAlpha( 0 )
	CurTemp:setText( Engine.Localize( "38c" ) )
	CurTemp:setTTF( "fonts/default.ttf" )
	CurTemp:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CurTemp:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CurTemp )
	self.CurTemp = CurTemp
	
	local CurConditions = LUI.UIImage.new()
	CurConditions:setLeftRight( true, false, 24.75, 90.75 )
	CurConditions:setTopBottom( true, false, 21.5, 87.5 )
	CurConditions:setAlpha( 0 )
	CurConditions:setImage( RegisterImage( "uie_t7_menu_cp_datavault_weathersun" ) )
	self:addElement( CurConditions )
	self.CurConditions = CurConditions
	
	local tempWeather = LUI.UIImage.new()
	tempWeather:setLeftRight( true, false, 0, 219 )
	tempWeather:setTopBottom( true, false, 13, 86 )
	tempWeather:setAlpha( 0.85 )
	tempWeather:setImage( RegisterImage( "uie_t7_menu_cp_datavault_weathercairo" ) )
	self:addElement( tempWeather )
	self.tempWeather = tempWeather
	
	local FocusWidget = CoD.FocusWidget.new( menu, controller )
	FocusWidget:setLeftRight( true, true, -8.36, 8.36 )
	FocusWidget:setTopBottom( true, false, 0, 20 )
	FocusWidget:setAlpha( 0 )
	FocusWidget.Name:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( FocusWidget )
	self.FocusWidget = FocusWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )

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
				local CurTempFrame2 = function ( CurTemp, event )
					if not event.interrupted then
						CurTemp:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					CurTemp:setLeftRight( true, false, 110.75, 210.75 )
					CurTemp:setTopBottom( true, false, 44.5, 107.5 )
					if event.interrupted then
						self.clipFinished( CurTemp, event )
					else
						CurTemp:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CurTemp:completeAnimation()
				self.CurTemp:setLeftRight( true, false, 110.75, 210.75 )
				self.CurTemp:setTopBottom( true, false, 29.5, 92.5 )
				CurTempFrame2( CurTemp, {} )
				local CurConditionsFrame2 = function ( CurConditions, event )
					if not event.interrupted then
						CurConditions:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					CurConditions:setLeftRight( true, false, 24.75, 90.75 )
					CurConditions:setTopBottom( true, false, 36.5, 102.5 )
					if event.interrupted then
						self.clipFinished( CurConditions, event )
					else
						CurConditions:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CurConditions:completeAnimation()
				self.CurConditions:setLeftRight( true, false, 24.75, 90.75 )
				self.CurConditions:setTopBottom( true, false, 21.5, 87.5 )
				CurConditionsFrame2( CurConditions, {} )
				local tempWeatherFrame2 = function ( tempWeather, event )
					if not event.interrupted then
						tempWeather:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					tempWeather:setLeftRight( true, false, 0, 219 )
					tempWeather:setTopBottom( true, false, 33, 106 )
					tempWeather:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( tempWeather, event )
					else
						tempWeather:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tempWeather:completeAnimation()
				self.tempWeather:setLeftRight( true, false, 0, 219 )
				self.tempWeather:setTopBottom( true, false, 18, 91 )
				self.tempWeather:setAlpha( 0.85 )
				tempWeatherFrame2( tempWeather, {} )
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
			Focus = function ()
				self:setupElementClipCounter( 6 )

				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 15, 15 )
				self.clipFinished( Generalframe, {} )

				white:completeAnimation()
				self.white:setLeftRight( true, false, 0, 219 )
				self.white:setTopBottom( true, false, 15, 118 )
				self.clipFinished( white, {} )

				CurTemp:completeAnimation()
				self.CurTemp:setLeftRight( true, false, 110.75, 210.75 )
				self.CurTemp:setTopBottom( true, false, 44.5, 107.5 )
				self.clipFinished( CurTemp, {} )

				CurConditions:completeAnimation()
				self.CurConditions:setLeftRight( true, false, 24.75, 90.75 )
				self.CurConditions:setTopBottom( true, false, 36.5, 102.5 )
				self.clipFinished( CurConditions, {} )

				tempWeather:completeAnimation()
				self.tempWeather:setLeftRight( true, false, 0, 219 )
				self.tempWeather:setTopBottom( true, false, 33, 106 )
				self.clipFinished( tempWeather, {} )

				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -8.36, 8.36 )
				self.FocusWidget:setTopBottom( true, false, -10, 10 )
				self.clipFinished( FocusWidget, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 6 )

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
				local CurTempFrame2 = function ( CurTemp, event )
					if not event.interrupted then
						CurTemp:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					CurTemp:setLeftRight( true, false, 110.75, 210.75 )
					CurTemp:setTopBottom( true, false, 29.5, 92.5 )
					if event.interrupted then
						self.clipFinished( CurTemp, event )
					else
						CurTemp:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CurTemp:completeAnimation()
				self.CurTemp:setLeftRight( true, false, 110.75, 210.75 )
				self.CurTemp:setTopBottom( true, false, 44.5, 107.5 )
				CurTempFrame2( CurTemp, {} )
				local CurConditionsFrame2 = function ( CurConditions, event )
					if not event.interrupted then
						CurConditions:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					CurConditions:setLeftRight( true, false, 24.75, 90.75 )
					CurConditions:setTopBottom( true, false, 21.5, 87.5 )
					if event.interrupted then
						self.clipFinished( CurConditions, event )
					else
						CurConditions:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CurConditions:completeAnimation()
				self.CurConditions:setLeftRight( true, false, 24.75, 90.75 )
				self.CurConditions:setTopBottom( true, false, 36.5, 102.5 )
				CurConditionsFrame2( CurConditions, {} )
				local tempWeatherFrame2 = function ( tempWeather, event )
					if not event.interrupted then
						tempWeather:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					tempWeather:setLeftRight( true, false, 0, 219 )
					tempWeather:setTopBottom( true, false, 18, 91 )
					tempWeather:setAlpha( 0.85 )
					if event.interrupted then
						self.clipFinished( tempWeather, event )
					else
						tempWeather:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tempWeather:completeAnimation()
				self.tempWeather:setLeftRight( true, false, 0, 219 )
				self.tempWeather:setTopBottom( true, false, 33, 106 )
				self.tempWeather:setAlpha( 1 )
				tempWeatherFrame2( tempWeather, {} )
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
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Generalframe:close()
		element.FocusWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
