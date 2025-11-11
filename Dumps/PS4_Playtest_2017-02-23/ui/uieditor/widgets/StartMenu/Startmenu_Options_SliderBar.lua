require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_SliderBar_Bar" )

local UpdateBarMouse = function ( self, event )
	local gleft, gtop, gright, gbottom = self.FilledPartBg:getRect()
	local barWidth = gright - gleft
	local xPos = CoD.ColorUtility.ClampColor( event.x - gleft, 0, barWidth )
	local fraction = xPos / barWidth
	self:processEvent( {
		name = "slider_updated",
		fraction = fraction,
		controller = event.controller
	} )
end

local UpdateVisuals = function ( self )
	local lleft, ltop, lright, lbottom = self.FilledPartBg:getLocalRect()
	local xPos = self.m_fraction * (lright - lleft)
	local visValue = string.format( self.m_formatString, self.m_currentValue )
	local visZero = string.format( self.m_formatString, -0 )
	if visValue == visZero then
		visValue = string.format( self.m_formatString, -0 )
	end
	self.numeric:setText( visValue )
	self.Bar:setLeftRight( true, false, lleft + xPos - self.m_markerHalfWidth, lleft + xPos + self.m_markerHalfWidth )
	self.FilledPart:setLeftRight( true, false, lleft, lleft + xPos )
end

local PostLoadFunc = function ( self, controller, menu )
	self.m_forceMouseEventDispatch = true
	local barLeft, barTop, barRight, barBottom = self.Bar:getLocalRect()
	self.m_markerHalfWidth = (barRight - barLeft) / 2
	self.m_formatString = "%.2f"
	self.m_speedMaxMultiplier = 25
	self.m_ownerController = controller
	self:registerEventHandler( "leftmouseup", function ( self, event )
		UpdateBarMouse( self, event )
		return true
	end )
	self:registerEventHandler( "mousedrag", function ( self, event )
		UpdateBarMouse( self, event )
	end )
	self:registerEventHandler( "options_refresh", function ( self, event )
		if type( self.sliderRefresh ) == "function" then
			self.sliderRefresh( controller, self )
			UpdateVisuals( self )
		end
	end )
	self:registerEventHandler( "slider_updated", function ( self, event )
		if type( self.sliderUpdated ) == "function" then
			self.sliderUpdated( controller, self, event.fraction )
			UpdateVisuals( self )
		end
	end )
	self:registerEventHandler( "update_bar", function ( self, event )
		local slideDirection = self.m_slideDirection
		local currentFrac = self.m_fraction
		local sliderSpeed = self.m_currentSpeed
		if slideDirection then
			local newFrac = currentFrac + sliderSpeed * slideDirection * event.timeElapsed / 1000
			self:processEvent( {
				name = "slider_updated",
				fraction = CoD.ColorUtility.ClampColor( newFrac, 0, 1 ),
				controller = self.m_ownerController
			} )
		end
	end )
	self.updateSlideDirection = function ( self, value )
		self.m_slideDirection = value
	end
	
	self:registerEventHandler( "lose_focus", function ( self, event )
		self:updateSlideDirection( nil )
		self.m_timer:close()
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
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_LEFT, "LEFTARROW", function ( element, menu, controller, model )
		if not self.m_disableNavigation then
			if not self.m_beat then
				self:updateSlideDirection( -1 )
				self:addElement( self.m_timer )
				self.m_currentSpeed = self.m_sliderSpeed
				
				self.m_speedMax = self.m_sliderSpeed * self.m_speedMaxMultiplier
				self.m_beat = true
				self:addElement( self.m_heartbeat )
			else
				self.m_heartbeat:reset()
				self.m_currentSpeed = math.min( self.m_currentSpeed * 1.1, self.m_speedMax )
			end
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_RIGHT, "RIGHTARROW", function ( element, menu, controller, model )
		if not self.m_disableNavigation then
			if not self.m_beat then
				self:updateSlideDirection( 1 )
				self:addElement( self.m_timer )
				self.m_currentSpeed = self.m_sliderSpeed
				
				self.m_speedMax = self.m_sliderSpeed * self.m_speedMaxMultiplier
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
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 60 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local fullBacking = LUI.UIImage.new()
	fullBacking:setLeftRight( 0, 1, 0, 0 )
	fullBacking:setTopBottom( 0, 1, 0, 0 )
	fullBacking:setRGB( 0.1, 0.1, 0.1 )
	fullBacking:setAlpha( 0 )
	self:addElement( fullBacking )
	self.fullBacking = fullBacking
	
	local frameOutline = CoD.StartMenu_frame_noBG.new( menu, controller )
	frameOutline:setLeftRight( 0, 1, 0, 0 )
	frameOutline:setTopBottom( 0, 1, 0, 0 )
	frameOutline:setRGB( 0.87, 0.37, 0 )
	frameOutline:setAlpha( 0 )
	self:addElement( frameOutline )
	self.frameOutline = frameOutline
	
	local label = LUI.UIText.new()
	label:setLeftRight( 0, 0, 12, 352 )
	label:setTopBottom( 0, 0, 8, 46 )
	label:setTTF( "fonts/default.ttf" )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( label )
	self.label = label
	
	local numeric = LUI.UITightText.new()
	numeric:setLeftRight( 0, 0, 679, 741 )
	numeric:setTopBottom( 0, 0, 8, 46 )
	numeric:setText( Engine.Localize( "MENU_NEW" ) )
	numeric:setTTF( "fonts/default.ttf" )
	self:addElement( numeric )
	self.numeric = numeric
	
	local FilledPartBg = LUI.UIImage.new()
	FilledPartBg:setLeftRight( 0, 0, 382, 652 )
	FilledPartBg:setTopBottom( 0.5, 0.5, -1, 1 )
	FilledPartBg:setRGB( 0.55, 0.55, 0.55 )
	FilledPartBg:setAlpha( 0 )
	self:addElement( FilledPartBg )
	self.FilledPartBg = FilledPartBg
	
	local FilledPart = LUI.UIImage.new()
	FilledPart:setLeftRight( 0, 0, 385, 568 )
	FilledPart:setTopBottom( 0.5, 0.5, -3.5, 3.5 )
	FilledPart:setRGB( 0.87, 0.37, 0 )
	self:addElement( FilledPart )
	self.FilledPart = FilledPart
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG00:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, 0 )
	FocusBarT:setTopBottom( 0, 0, 0, 6 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -8, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( 0, 1, 379, -91 )
	FETitleNumBrdr0:setTopBottom( 0, 1, 23, -23 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local Bar = CoD.StartMenu_Options_SliderBar_Bar.new( menu, controller )
	Bar:setLeftRight( 0, 0, 567.5, 576.5 )
	Bar:setTopBottom( 0.5, 0.5, -16, 16 )
	self:addElement( Bar )
	self.Bar = Bar
	
	self.label:linkToElementModel( self, "label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			label:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		FilledPart:completeAnimation()
		numeric:completeAnimation()
		frameOutline:completeAnimation()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		Bar:completeAnimation()
		FilledPart:setRGB( 0.87, 0.37, 0 )
		numeric:setAlpha( 1 )
		frameOutline:setAlpha( 0 )
		FocusBarT:setLeftRight( 0, 1, 0, 0 )
		FocusBarT:setTopBottom( 0, 0, 0, 6 )
		FocusBarT:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
		Bar:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				numeric:completeAnimation()
				self.numeric:setAlpha( 0.5 )
				self.clipFinished( numeric, {} )
				FilledPart:completeAnimation()
				self.FilledPart:setRGB( 1, 1, 1 )
				self.clipFinished( FilledPart, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				frameOutline:completeAnimation()
				self.frameOutline:setAlpha( 1 )
				self.clipFinished( frameOutline, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 1, 0, 0 )
				self.FocusBarT:setTopBottom( 0, 0, 0, 8 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				Bar:completeAnimation()
				self.Bar:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( Bar, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.frameOutline:close()
		self.StartMenuframenoBG00:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.FETitleNumBrdr0:close()
		self.Bar:close()
		self.label:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

