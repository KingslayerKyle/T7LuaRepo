require( "ui.T6.SideBracketsImage" )

CoD.CoD9Button = {}
CoD.CoD9Button.Height = 30
CoD.CoD9Button.FontName = "Condensed"
CoD.CoD9Button.Font = CoD.fonts[CoD.CoD9Button.FontName]
CoD.CoD9Button.TextHeight = CoD.textSize[CoD.CoD9Button.FontName]
CoD.CoD9Button.BackgroundColor = {
	r = 1,
	g = 1,
	b = 1,
	a = 0.2
}
CoD.CoD9Button.BracketAnimDistance = 30
CoD.CoD9Button.ButtonOverAnimTime = 150
CoD.CoD9Button.BracketSpacer = 10
CoD.CoD9Button.PulseDuration = 650
CoD.CoD9Button.SetBracketContainerStates = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	if f1_arg2 == nil then
		f1_arg2 = "Condensed"
	end
	local f1_local0 = {}
	f1_local0 = GetTextDimensions( f1_arg1, CoD.fonts[f1_arg2], CoD.textSize[f1_arg2] )
	local f1_local1 = f1_local0[3]
	if f1_arg3 == nil then
		f1_arg3 = 0
	end
	f1_arg0.container.leftOffset = f1_arg3
	f1_arg0.container.textWidth = f1_local1
	f1_arg0.container:setLeftRight( true, false, f1_arg0.container.leftOffset - CoD.CoD9Button.BracketSpacer - CoD.CoD9Button.BracketAnimDistance, f1_arg0.container.leftOffset + f1_local1 + CoD.CoD9Button.BracketSpacer + CoD.CoD9Button.BracketAnimDistance )
	f1_arg0.container:setTopBottom( true, true, 0, 0 )
end

CoD.CoD9Button.SetLabel = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	f2_arg0.id = "CoD9Button." .. f2_arg1
	f2_arg0.label:setText( f2_arg1 )
	f2_arg0.labelString = f2_arg1
	CoD.CoD9Button.SetBracketContainerStates( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
end

CoD.CoD9Button.Lock = function ( f3_arg0 )
	f3_arg0:disable()
	f3_arg0.lockImage = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = true,
		left = -CoD.CoD9Button.Height,
		right = -6,
		topAnchor = true,
		bottomAnchor = true,
		top = 3,
		bottom = -3,
		material = RegisterMaterial( "lock" )
	} )
	f3_arg0:addElement( f3_arg0.lockImage )
	f3_arg0:showNewIcon( false )
end

CoD.CoD9Button.ShowNewIcon = function ( f4_arg0, f4_arg1 )
	if CoD.isSinglePlayer then
		f4_arg0.newIcon = LUI.UIImage.new( {
			leftAnchor = false,
			rightAnchor = true,
			left = -CoD.CoD9Button.Height,
			right = 10,
			topAnchor = true,
			bottomAnchor = true,
			top = 0,
			bottom = 0,
			material = RegisterMaterial( "menu_mp_lobby_new" )
		} )
		f4_arg0:addElement( f4_arg0.newIcon )
	elseif f4_arg1 and not f4_arg0.lockImage then
		if not f4_arg0.newIcon then
			f4_arg0.newIcon = LUI.UIImage.new()
			f4_arg0.newIcon:setLeftRight( true, false, f4_arg0.container.textWidth + 10, f4_arg0.container.textWidth + 10 + CoD.CACUtility.ButtonGridNewImageWidth )
			f4_arg0.newIcon:setTopBottom( false, false, -CoD.CACUtility.ButtonGridNewImageHeight / 2, CoD.CACUtility.ButtonGridNewImageHeight / 2 )
			f4_arg0.newIcon:setImage( RegisterMaterial( CoD.CACUtility.NewImageMaterial ) )
			f4_arg0:addElement( f4_arg0.newIcon )
		end
	elseif f4_arg0.newIcon then
		f4_arg0.newIcon:close()
		f4_arg0.newIcon = nil
	end
end

CoD.CoD9Button.GainFocus = function ( f5_arg0, f5_arg1 )
	local f5_local0 = LUI.UIButton.gainFocus( f5_arg0, f5_arg1 )
	if CoD.isZombie == true then
		f5_arg0.brackets:beginAnimation( "selected", CoD.CoD9Button.ButtonOverAnimTime )
		f5_arg0.brackets:setAlpha( 1 )
		f5_arg0.container:beginAnimation( "selected", CoD.CoD9Button.ButtonOverAnimTime )
		f5_arg0.container:setLeftRight( true, false, f5_arg0.container.leftOffset - CoD.CoD9Button.BracketSpacer, f5_arg0.container.leftOffset + f5_arg0.container.textWidth + CoD.CoD9Button.BracketSpacer )
		f5_arg0.container:setTopBottom( true, true, 0, 0 )
	end
	if f5_arg0.background then
		f5_arg0.background:beginAnimation( "selected", CoD.CoD9Button.ButtonOverAnimTime )
		f5_arg0.background:setRGB( 1, 1, 1 )
		f5_arg0.background:setAlpha( 1 )
	end
	f5_arg0.buttonHasFocus = true
	CoD.CoD9Button.StartLabelPulse( f5_arg0 )
	f5_arg0:dispatchEventToParent( {
		name = "button_gained_focus",
		button = f5_arg0
	} )
	if f5_arg0.disabled then
		f5_arg0:dispatchEventToParent( {
			name = "COD9ButtonIsDisabled"
		} )
	elseif not f5_arg0.actionPromptString then
		f5_arg0:dispatchEventToParent( {
			name = "COD9ButtonIsEnabled"
		} )
	end
	return f5_local0
end

CoD.CoD9Button.LoseFocus = function ( f6_arg0, f6_arg1 )
	LUI.UIButton.loseFocus( f6_arg0, f6_arg1 )
	f6_arg0:animateToState( "pulse_high", 1 )
	f6_arg0:completeAnimation()
	f6_arg0.buttonHasFocus = nil
	if CoD.isZombie == true then
		f6_arg0.brackets:beginAnimation( "not_selected", CoD.CoD9Button.ButtonOverAnimTime )
		f6_arg0.brackets:setAlpha( 0 )
		f6_arg0.container:beginAnimation( "not_selected", CoD.CoD9Button.ButtonOverAnimTime )
		f6_arg0.container:setLeftRight( true, false, f6_arg0.container.leftOffset - CoD.CoD9Button.BracketSpacer - CoD.CoD9Button.BracketAnimDistance, f6_arg0.container.leftOffset + f6_arg0.container.textWidth + CoD.CoD9Button.BracketSpacer + CoD.CoD9Button.BracketAnimDistance )
		f6_arg0.container:setTopBottom( true, true, 0, 0 )
	end
	if f6_arg0.background then
		f6_arg0.background:animateToState( "default", CoD.CoD9Button.ButtonOverAnimTime )
	end
end

CoD.CoD9Button.SetupTextElement = function ( f7_arg0 )
	f7_arg0:registerAnimationState( "button_over", {
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b,
		alpha = 1
	} )
	local f7_local0 = 0.5
	if CoD.isZombie then
		f7_local0 = 0.3
		f7_arg0:registerAnimationState( "button_over_disabled", {
			red = 0.18,
			green = 0.31,
			blue = 0.31,
			alpha = f7_local0
		} )
	end
	if CoD.isSinglePlayer then
		f7_arg0:registerAnimationState( "disabled", {
			red = CoD.DisabledTextColor.r,
			green = CoD.DisabledTextColor.g,
			blue = CoD.DisabledTextColor.b
		} )
	else
		f7_arg0:registerAnimationState( "disabled", {
			red = CoD.ButtonTextColor.r,
			green = CoD.ButtonTextColor.g,
			blue = CoD.ButtonTextColor.b,
			alpha = f7_local0
		} )
	end
	f7_arg0.overDuration = CoD.CoD9Button.ButtonOverAnimTime
	f7_arg0.upDuration = CoD.CoD9Button.ButtonOverAnimTime
	LUI.UIButton.SetupElement( f7_arg0 )
end

CoD.CoD9Button.StartAnimation = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
	local f8_local0 = ""
	if f8_arg0.disabled == true then
		f8_local0 = "_disabled"
	end
	f8_arg0:animateToState( f8_arg1 .. f8_local0, f8_arg2, f8_arg3, f8_arg4 )
end

CoD.CoD9Button.StartLabelPulse = function ( f9_arg0 )
	CoD.CoD9Button.StartAnimation( f9_arg0, "pulse_high", 1 )
end

CoD.CoD9Button.TransitionCompletePulseHigh = function ( f10_arg0, f10_arg1 )
	if f10_arg1.interrupted ~= true then
		if f10_arg0.buttonList ~= nil and f10_arg0.buttonList.m_inputDisabled == true then
			CoD.CoD9Button.StartAnimation( f10_arg0, "pulse_high", 1 )
		else
			CoD.CoD9Button.StartAnimation( f10_arg0, "pulse_low", CoD.CoD9Button.PulseDuration, true, false )
		end
	end
end

CoD.CoD9Button.TransitionCompletePulseLow = function ( f11_arg0, f11_arg1 )
	if f11_arg1.interrupted ~= true then
		if f11_arg0.buttonList ~= nil and f11_arg0.buttonList.m_inputDisabled == true then
			CoD.CoD9Button.StartAnimation( f11_arg0, "pulse_high", 1 )
		else
			CoD.CoD9Button.StartAnimation( f11_arg0, "pulse_high", CoD.CoD9Button.PulseDuration, false, true )
		end
	end
end

CoD.CoD9Button.DisableInput = function ( f12_arg0, f12_arg1 )
	if f12_arg0.buttonHasFocus == true then
		CoD.CoD9Button.StartLabelPulse( f12_arg0 )
		if f12_arg1.stopAnimation == true then
			f12_arg0:completeAnimation()
		end
	end
end

CoD.CoD9Button.EnableInput = function ( f13_arg0, f13_arg1 )
	if f13_arg0.buttonHasFocus == true then
		CoD.CoD9Button.StartLabelPulse( f13_arg0 )
	end
end

CoD.CoD9Button.AddBackgroundElement = function ( f14_arg0, f14_arg1 )
	if f14_arg0.background or not f14_arg1 then
		return 
	elseif f14_arg1.alpha == nil then
		f14_arg1.alpha = 0
	end
	f14_arg0.background = LUI.UIImage.new( f14_arg1 )
	LUI.UIButton.SetupElement( f14_arg0.background )
	f14_arg0.backgroundContainer:addElement( f14_arg0.background )
end

CoD.CoD9Button.new = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4 )
	local self = LUI.UIButton.new( f15_arg0, f15_arg1 )
	self.id = "CoD9Button"
	self.setLabel = CoD.CoD9Button.SetLabel
	self.lock = CoD.CoD9Button.Lock
	self.showNewIcon = CoD.CoD9Button.ShowNewIcon
	self.showZMNewIcon = CoD.CoD9Button.ShowZMNewIcon
	self.showStarIcon = CoD.CoD9Button.ShowStarIcon
	self.showRestrictedIcon = CoD.CoD9Button.ShowRestrictedIcon
	self.addBackground = CoD.CoD9Button.AddBackgroundElement
	self:registerEventHandler( "disable_input", CoD.CoD9Button.DisableInput )
	self:registerEventHandler( "enable_input", CoD.CoD9Button.EnableInput )
	self:registerEventHandler( "gain_focus", CoD.CoD9Button.GainFocus )
	self:registerEventHandler( "lose_focus", CoD.CoD9Button.LoseFocus )
	local f15_local1 = 0.5
	local f15_local2 = 0.25
	if CoD.isZombie then
		f15_local1 = 1
		f15_local2 = 0.5
	end
	self:registerAnimationState( "pulse_high", {
		alpha = 1
	} )
	self:registerAnimationState( "pulse_low", {
		alpha = 0.5
	} )
	self:registerAnimationState( "pulse_high_disabled", {
		alpha = f15_local1
	} )
	self:registerAnimationState( "pulse_low_disabled", {
		alpha = f15_local2
	} )
	self:registerEventHandler( "transition_complete_pulse_high", CoD.CoD9Button.TransitionCompletePulseHigh )
	self:registerEventHandler( "transition_complete_pulse_low", CoD.CoD9Button.TransitionCompletePulseLow )
	self:registerEventHandler( "transition_complete_pulse_high_disabled", CoD.CoD9Button.TransitionCompletePulseHigh )
	self:registerEventHandler( "transition_complete_pulse_low_disabled", CoD.CoD9Button.TransitionCompletePulseLow )
	self.container = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	self:addElement( self.container )
	self.backgroundContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	self:addElement( self.backgroundContainer )
	if CoD.isZombie == true then
		self.brackets = CoD.SideBracketsImage.new()
		self.brackets:setAlpha( 0 )
		self.container:addElement( self.brackets )
	end
	local f15_local3 = LUI.Alignment.Left
	if f15_arg2 then
		f15_local3 = LUI.Alignment.Center
	end
	self.label = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.CoD9Button.TextHeight / 2,
		bottom = CoD.CoD9Button.TextHeight / 2,
		red = CoD.ButtonTextColor.r,
		green = CoD.ButtonTextColor.g,
		blue = CoD.ButtonTextColor.b,
		alpha = 1,
		alignment = f15_local3
	} )
	self.label:setTTF( "fonts/escom.ttf" )
	CoD.CoD9Button.SetupTextElement( self.label )
	self:addElement( self.label )
	return self
end

CoD.CoD9Button.ShowStarIcon = function ( f16_arg0, f16_arg1 )
	if f16_arg1 then
		if f16_arg0.restrictedIcon then
			f16_arg0.restrictedIcon:close()
			f16_arg0.restrictedIcon = nil
		end
		if not f16_arg0.starIcon then
			if not CoD.CoD9Button.CustomizedMaterial then
				CoD.CoD9Button.CustomizedMaterial = RegisterMaterial( CoD.MPZM( "ui_host", "ui_host_zm" ) )
			end
			local f16_local0 = 24
			local f16_local1 = -5
			local f16_local2 = -1
			f16_arg0.starIcon = LUI.UIImage.new()
			f16_arg0.starIcon:setLeftRight( true, false, f16_local1 - f16_local0, f16_local1 )
			f16_arg0.starIcon:setTopBottom( false, false, f16_local2 - f16_local0 / 2, f16_local2 + f16_local0 / 2 )
			f16_arg0.starIcon:setImage( CoD.CoD9Button.CustomizedMaterial )
			f16_arg0:addElement( f16_arg0.starIcon )
		end
	elseif f16_arg0.starIcon then
		f16_arg0.starIcon:close()
		f16_arg0.starIcon = nil
	end
end

CoD.CoD9Button.ShowRestrictedIcon = function ( f17_arg0, f17_arg1 )
	if f17_arg1 then
		if f17_arg0.starIcon then
			f17_arg0.starIcon:close()
			f17_arg0.starIcon = nil
		end
		if not f17_arg0.restrictedIcon then
			local f17_local0 = 24
			local f17_local1 = -5
			local f17_local2 = -1
			f17_arg0.restrictedIcon = LUI.UIImage.new()
			f17_arg0.restrictedIcon:setLeftRight( true, false, f17_local1 - f17_local0, f17_local1 )
			f17_arg0.restrictedIcon:setTopBottom( false, false, f17_local2 - f17_local0 / 2, f17_local2 + f17_local0 / 2 )
			f17_arg0.restrictedIcon:setImage( RegisterMaterial( "cac_restricted" ) )
			f17_arg0:addElement( f17_arg0.restrictedIcon )
		end
	elseif f17_arg0.restrictedIcon then
		f17_arg0.restrictedIcon:close()
		f17_arg0.restrictedIcon = nil
	end
end

CoD.CoD9Button.ShowZMNewIcon = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
	if f18_arg1 then
		if f18_arg2 == nil then
			f18_arg2 = "Condensed"
		end
		if f18_arg3 == nil then
			f18_arg3 = true
		end
		local f18_local0 = {}
		f18_local0 = GetTextDimensions( f18_arg0.labelString, CoD.fonts[f18_arg2], CoD.textSize[f18_arg2] )
		local f18_local1 = f18_local0[3]
		if not f18_arg0.newIcon then
			local f18_local2 = 64
			local f18_local3 = 32
			local f18_local4 = 25 + f18_local1
			local f18_local5 = 25
			local f18_local6 = -1
			f18_arg0.newIcon = LUI.UIImage.new()
			if f18_arg3 then
				f18_arg0.newIcon:setLeftRight( true, false, -f18_local2 + f18_local5, f18_local5 )
			else
				f18_arg0.newIcon:setLeftRight( true, false, f18_local4, f18_local4 + f18_local2 )
			end
			f18_arg0.newIcon:setTopBottom( false, false, -(f18_local3 / 2), f18_local3 / 2 )
			f18_arg0.newIcon:setImage( RegisterMaterial( "menu_mp_lobby_new_small" ) )
			f18_arg0:addElement( f18_arg0.newIcon )
		end
	elseif f18_arg0.newIcon then
		f18_arg0.newIcon:close()
		f18_arg0.newIcon = nil
	end
end

CoD.CoD9Button.RegistrationButtonOver = function ( f19_arg0, f19_arg1 )
	f19_arg0:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	f19_arg0:setAlpha( 0.75 )
	local f19_local0 = f19_arg0:getParent()
	if f19_local0 and (f19_local0.lockImage or f19_local0.isLocked) then
		f19_arg0:setRGB( 1, 1, 1 )
		f19_arg0:setAlpha( 0.1 )
	end
end

CoD.CoD9Button.RegistrationButtonUp = function ( f20_arg0, f20_arg1 )
	f20_arg0:setRGB( 1, 1, 1 )
	f20_arg0:setAlpha( 0.1 )
end

CoD.CoD9Button.RegistrationButtonSetLabel = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
	f21_arg0.id = "CoD9RegistrationButton." .. f21_arg1
	f21_arg0.label:setText( f21_arg1 )
	f21_arg0.labelString = f21_arg1
	CoD.CoD9Button.SetBracketContainerStates( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
end

CoD.CoD9Button.NewRegistrationButton = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
	local self = LUI.UIButton.new( f22_arg0, f22_arg1 )
	self.id = "CoD9RegistrationButton"
	self.setLabel = CoD.CoD9Button.RegistrationButtonSetLabel
	self.lock = CoD.CoD9Button.Lock
	self.showNewIcon = CoD.CoD9Button.ShowNewIcon
	self.showZMNewIcon = CoD.CoD9Button.ShowZMNewIcon
	self.showRestrictedIcon = CoD.CoD9Button.ShowRestrictedIcon
	self.addBackground = CoD.CoD9Button.AddBackgroundElement
	self:registerEventHandler( "disable_input", CoD.CoD9Button.DisableInput )
	self:registerEventHandler( "enable_input", CoD.CoD9Button.EnableInput )
	self:registerEventHandler( "gain_focus", CoD.CoD9Button.GainFocus )
	self:registerEventHandler( "lose_focus", CoD.CoD9Button.LoseFocus )
	local f22_local1 = 0.5
	local f22_local2 = 0.25
	if CoD.isZombie then
		f22_local1 = 1
		f22_local2 = 0.5
	end
	self:registerAnimationState( "pulse_high", {
		alpha = 1
	} )
	self:registerAnimationState( "pulse_low", {
		alpha = 0.5
	} )
	self:registerAnimationState( "pulse_high_disabled", {
		alpha = f22_local1
	} )
	self:registerAnimationState( "pulse_low_disabled", {
		alpha = f22_local2
	} )
	self:registerEventHandler( "transition_complete_pulse_high", CoD.CoD9Button.TransitionCompletePulseHigh )
	self:registerEventHandler( "transition_complete_pulse_low", CoD.CoD9Button.TransitionCompletePulseLow )
	self:registerEventHandler( "transition_complete_pulse_high_disabled", CoD.CoD9Button.TransitionCompletePulseHigh )
	self:registerEventHandler( "transition_complete_pulse_low_disabled", CoD.CoD9Button.TransitionCompletePulseLow )
	self.container = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	self:addElement( self.container )
	self.backgroundContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	self:addElement( self.backgroundContainer )
	if CoD.isZombie == true then
		self.brackets = CoD.SideBracketsImage.new()
		self.brackets:setAlpha( 0 )
		self.container:addElement( self.brackets )
	end
	local f22_local3 = LUI.Alignment.Left
	if f22_arg2 then
		f22_local3 = LUI.Alignment.Center
	end
	local f22_local4 = "Condensed"
	local f22_local5 = CoD.CoD9Button.TextHeight
	if f22_arg3 ~= nil then
		f22_local4 = f22_arg3
		f22_local5 = CoD.textSize[f22_local4]
	end
	self.label = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 6,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -f22_local5 / 2,
		bottom = f22_local5 / 2,
		red = CoD.ButtonTextColor.r,
		green = CoD.ButtonTextColor.g,
		blue = CoD.ButtonTextColor.b,
		alpha = 1,
		font = CoD.fonts[f22_local4],
		alignment = f22_local3
	} )
	CoD.CoD9Button.SetupTextElement( self.label )
	self:addElement( self.label )
	self.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	self.border:registerEventHandler( "button_over", CoD.CoD9Button.RegistrationButtonOver )
	self.border:registerEventHandler( "button_up", CoD.CoD9Button.RegistrationButtonUp )
	self:addElement( self.border )
	local f22_local6 = 4
	local f22_local7 = f22_local5 * 2 + 2
	local f22_local8 = LUI.UIImage.new()
	f22_local8:setLeftRight( true, true, f22_local6, -f22_local6 )
	f22_local8:setTopBottom( true, false, f22_local6, f22_local7 * 0.6 )
	f22_local8:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	f22_local8:setAlpha( 0.1 )
	self.backgroundContainer:addElement( f22_local8 )
	return self
end

