require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_SliderBar_Bar" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0, f1_local1, f1_local2, f1_local3 = f1_arg0.FilledPartBg:getRect()
	local f1_local4 = f1_local2 - f1_local0
	f1_arg0:processEvent( {
		name = "slider_updated",
		fraction = CoD.ClampColor( f1_arg1.x - f1_local0, 0, f1_local4 ) / f1_local4,
		controller = f1_arg1.controller
	} )
end

local f0_local1 = function ( f2_arg0 )
	local f2_local0, f2_local1, f2_local2, f2_local3 = f2_arg0.FilledPartBg:getLocalRect()
	local f2_local4 = f2_arg0.m_fraction * (f2_local2 - f2_local0)
	local f2_local5 = string.format( f2_arg0.m_formatString, f2_arg0.m_currentValue )
	if f2_local5 == string.format( f2_arg0.m_formatString, -0 ) then
		f2_local5 = "0.00"
	end
	f2_arg0.numeric:setText( f2_local5 )
	f2_arg0.Bar:setLeftRight( true, false, f2_local0 + f2_local4 - f2_arg0.m_markerHalfWidth, f2_local0 + f2_local4 + f2_arg0.m_markerHalfWidth )
	f2_arg0.FilledPart:setLeftRight( true, false, f2_local0, f2_local0 + f2_local4 )
end

local PostLoadFunc = function ( self, controller, menu )
	self.m_forceMouseEventDispatch = true
	local f3_local0, f3_local1, f3_local2, f3_local3 = self.Bar:getLocalRect()
	self.m_markerHalfWidth = (f3_local2 - f3_local0) / 2
	self.m_formatString = "%.2f"
	self.m_speedMaxMultiplier = 8
	self.m_ownerController = controller
	self:registerEventHandler( "leftmouseup", function ( element, event )
		f0_local0( element, event )
		return true
	end )
	self:registerEventHandler( "mousedrag", function ( element, event )
		f0_local0( element, event )
	end )
	self:registerEventHandler( "options_refresh", function ( element, event )
		if type( element.sliderRefresh ) == "function" then
			element.sliderRefresh( controller, element )
			f0_local1( element )
		end
	end )
	self:registerEventHandler( "slider_updated", function ( element, event )
		if type( element.sliderUpdated ) == "function" then
			element.sliderUpdated( controller, element, event.fraction )
			f0_local1( element )
		end
	end )
	self:registerEventHandler( "update_bar", function ( element, event )
		local f8_local0 = element.m_slideDirection
		local f8_local1 = element.m_fraction
		local f8_local2 = element.m_currentSpeed
		if f8_local0 then
			element:processEvent( {
				name = "slider_updated",
				fraction = CoD.ClampColor( f8_local1 + f8_local2 * f8_local0 * event.timeElapsed / 1000, 0, 1 ),
				controller = element.m_ownerController
			} )
		end
	end )
	self.updateSlideDirection = function ( f9_arg0, f9_arg1 )
		f9_arg0.m_slideDirection = f9_arg1
	end
	
	self:registerEventHandler( "lose_focus", function ( element, event )
		element:updateSlideDirection( nil )
		element.m_timer:close()
	end )
	self:registerEventHandler( "check_pulse", function ( element, event )
		if self.m_beat then
			self.m_timer:close()
			self.m_heartbeat:close()
			self.m_beat = nil
		end
	end )
	self.m_timer = LUI.UITimer.new( 1, "update_bar", false )
	self.m_heartbeat = LUI.UITimer.new( 100, "check_pulse", false )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_LEFT, "LEFTARROW", function ( element, menu, controller, f12_arg3 )
		if not self.m_disableNavigation then
			if not self.m_beat then
				self:updateSlideDirection( -1 )
				self:addElement( self.m_timer )
				self.m_currentSpeed = self.m_sliderSpeed
				
				self.m_speedMax = self.m_sliderSpeed * self.m_speedMaxMultiplier * self.m_range
				self.m_beat = true
				self:addElement( self.m_heartbeat )
			else
				self.m_heartbeat:reset()
				self.m_currentSpeed = math.min( self.m_currentSpeed * 1.1, self.m_speedMax )
			end
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_RIGHT, "RIGHTARROW", function ( element, menu, controller, f13_arg3 )
		if not self.m_disableNavigation then
			if not self.m_beat then
				self:updateSlideDirection( 1 )
				self:addElement( self.m_timer )
				self.m_currentSpeed = self.m_sliderSpeed
				
				self.m_speedMax = self.m_sliderSpeed * self.m_speedMaxMultiplier * self.m_range
				self.m_beat = true
				self:addElement( self.m_heartbeat )
			else
				self.m_heartbeat:reset()
				self.m_currentSpeed = math.min( self.m_currentSpeed * 1.1, self.m_speedMax )
			end
		end
	end )
end

CoD.StartMenu_Options_SliderBar = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_SliderBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_SliderBar )
	self.id = "StartMenu_Options_SliderBar"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 40 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local fullBacking = LUI.UIImage.new()
	fullBacking:setLeftRight( true, true, 0, 0 )
	fullBacking:setTopBottom( true, true, 0, 0 )
	fullBacking:setRGB( 0.1, 0.1, 0.1 )
	fullBacking:setAlpha( 0 )
	self:addElement( fullBacking )
	self.fullBacking = fullBacking
	
	local frameOutline = CoD.StartMenu_frame_noBG.new( menu, controller )
	frameOutline:setLeftRight( true, true, 0, 0 )
	frameOutline:setTopBottom( true, true, 0, 0 )
	frameOutline:setRGB( 0.87, 0.37, 0 )
	frameOutline:setAlpha( 0 )
	self:addElement( frameOutline )
	self.frameOutline = frameOutline
	
	local label = LUI.UIText.new()
	label:setLeftRight( true, false, 8, 235 )
	label:setTopBottom( true, false, 5.5, 30.5 )
	label:setTTF( "fonts/default.ttf" )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( label )
	self.label = label
	
	local numeric = LUI.UITightText.new()
	numeric:setLeftRight( true, false, 448, 498 )
	numeric:setTopBottom( true, false, 5.5, 30.5 )
	numeric:setText( Engine.Localize( "MENU_NEW" ) )
	numeric:setTTF( "fonts/default.ttf" )
	self:addElement( numeric )
	self.numeric = numeric
	
	local FilledPartBg = LUI.UIImage.new()
	FilledPartBg:setLeftRight( true, false, 254.41, 434.41 )
	FilledPartBg:setTopBottom( false, false, -0.5, 0.5 )
	FilledPartBg:setRGB( 0.55, 0.55, 0.55 )
	FilledPartBg:setAlpha( 0 )
	self:addElement( FilledPartBg )
	self.FilledPartBg = FilledPartBg
	
	local FilledPart = LUI.UIImage.new()
	FilledPart:setLeftRight( true, false, 256.41, 378.41 )
	FilledPart:setTopBottom( false, false, -2.2, 2.2 )
	FilledPart:setRGB( 0.87, 0.37, 0 )
	self:addElement( FilledPart )
	self.FilledPart = FilledPart
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG00:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -5.5, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 252.41, -60.59 )
	FETitleNumBrdr0:setTopBottom( true, true, 15.5, -15.5 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local Bar = CoD.StartMenu_Options_SliderBar_Bar.new( menu, controller )
	Bar:setLeftRight( true, false, 378.41, 384.41 )
	Bar:setTopBottom( false, false, -10.5, 10.5 )
	self:addElement( Bar )
	self.Bar = Bar
	
	self.label:linkToElementModel( self, "label", true, function ( model )
		local _label = Engine.GetModelValue( model )
		if _label then
			label:setText( Engine.Localize( _label ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				frameOutline:completeAnimation()
				self.frameOutline:setAlpha( 0 )
				self.clipFinished( frameOutline, {} )
				label:completeAnimation()
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )
				numeric:completeAnimation()
				self.numeric:setAlpha( 0.5 )
				self.clipFinished( numeric, {} )
				FilledPartBg:completeAnimation()
				self.FilledPartBg:setLeftRight( true, false, 254.41, 434.41 )
				self.FilledPartBg:setTopBottom( false, false, -0.5, 0.5 )
				self.FilledPartBg:setAlpha( 0 )
				self.clipFinished( FilledPartBg, {} )
				FilledPart:completeAnimation()
				self.FilledPart:setRGB( 1, 1, 1 )
				self.clipFinished( FilledPart, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setLeftRight( true, true, 252.41, -60.59 )
				self.FETitleNumBrdr0:setTopBottom( true, true, 15.5, -15.5 )
				self.clipFinished( FETitleNumBrdr0, {} )
				Bar:completeAnimation()
				self.Bar:setRGB( 1, 1, 1 )
				self.clipFinished( Bar, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )
				frameOutline:completeAnimation()
				self.frameOutline:setRGB( 0.87, 0.37, 0 )
				self.frameOutline:setAlpha( 1 )
				self.clipFinished( frameOutline, {} )
				label:completeAnimation()
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )
				numeric:completeAnimation()
				self.numeric:setAlpha( 1 )
				self.clipFinished( numeric, {} )
				FilledPartBg:completeAnimation()
				self.FilledPartBg:setLeftRight( true, false, 254.41, 434.41 )
				self.FilledPartBg:setTopBottom( false, false, -0.5, 0.5 )
				self.FilledPartBg:setAlpha( 0 )
				self.clipFinished( FilledPartBg, {} )
				FilledPart:completeAnimation()
				self.FilledPart:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( FilledPart, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 0, 0 )
				self.FocusBarT:setTopBottom( true, false, 0, 5.5 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, 0, 0 )
				self.FocusBarB:setTopBottom( false, true, -5.5, 0 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setLeftRight( true, true, 252.41, -60.59 )
				self.FETitleNumBrdr0:setTopBottom( true, true, 15.5, -15.5 )
				self.FETitleNumBrdr0:setAlpha( 1 )
				self.clipFinished( FETitleNumBrdr0, {} )
				Bar:completeAnimation()
				self.Bar:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( Bar, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.frameOutline:close()
		element.StartMenuframenoBG00:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.FETitleNumBrdr0:close()
		element.Bar:close()
		element.label:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

