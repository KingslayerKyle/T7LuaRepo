CoD.DistFieldText = {}
CoD.DistFieldText.PulseInTime = 400
CoD.DistFieldText.PulseOutTime = 150
CoD.DistFieldText.WarningPulseDuration = 500
CoD.DistFieldText.EdgeFuzziness = 0.07
CoD.DistFieldText.GlowSize = 0.5
CoD.DistFieldText.ShadowFuzziness = -1
CoD.DistFieldText.GlowSpread = 0.85
CoD.DistFieldText.Color = {
	1,
	1,
	1,
	1
}
CoD.DistFieldText.GlowColor = {
	CoD.yellowGlow.r,
	CoD.yellowGlow.g,
	CoD.yellowGlow.b,
	1
}
CoD.DistFieldText.ShadowOffset = {
	0,
	0
}
CoD.DistFieldText.OutlineSize = 0.09
CoD.DistFieldText.GlowFalloff = 0.4
CoD.DistFieldText.ShadowColor = {
	0.14,
	0.14,
	0.14,
	1
}
CoD.DistFieldText.OutlineColor = {
	CoD.yellowGlow.r,
	CoD.yellowGlow.g,
	CoD.yellowGlow.b,
	1
}
CoD.DistFieldText.new = function ( defaultAnimationState, glowColor, outlineColor, glowSize, outlineSize, edgeFuzziness, color )
	if glowColor == nil then
		glowColor = CoD.DistFieldText.GlowColor
	end
	if outlineColor == nil then
		outlineColor = CoD.DistFieldText.OutlineColor
	end
	if glowSize == nil then
		glowSize = CoD.DistFieldText.GlowSize
	end
	if outlineSize == nil then
		outlineSize = CoD.DistFieldText.OutlineSize
	end
	if edgeFuzziness == nil then
		edgeFuzziness = CoD.DistFieldText.EdgeFuzziness
	end
	if color == nil then
		color = CoD.DistFieldText.Color
	end
	local shaderVector0 = {
		0.38,
		CoD.DistFieldText.GlowSize,
		CoD.DistFieldText.ShadowFuzziness,
		0.6
	}
	local shaderVector1 = CoD.DistFieldText.Color
	local shaderVector2 = {
		1,
		1,
		1,
		1
	}
	local shaderVector3 = {
		CoD.DistFieldText.ShadowOffset[1],
		CoD.DistFieldText.ShadowOffset[2],
		outlineSize,
		CoD.DistFieldText.GlowFalloff
	}
	local shaderVector4 = CoD.DistFieldText.ShadowColor
	local shaderVector5 = {
		1,
		1,
		1,
		1
	}
	local distFontHeight = 50
	local distText = LUI.UIText.new( defaultAnimationState )
	local defaultShaderState = {
		font = CoD.fonts.Dist,
		shaderVector0 = shaderVector0,
		shaderVector1 = shaderVector1,
		shaderVector2 = shaderVector2,
		shaderVector3 = shaderVector3,
		shaderVector4 = shaderVector4,
		shaderVector5 = shaderVector5,
		alpha = 1
	}
	distText:registerAnimationState( "default_shader_state", defaultShaderState )
	shaderVector0 = {
		edgeFuzziness,
		glowSize,
		CoD.DistFieldText.ShadowFuzziness,
		CoD.DistFieldText.GlowSpread
	}
	shaderVector1 = color
	shaderVector2 = glowColor
	shaderVector5 = outlineColor
	distText:registerAnimationState( "pulse_in", {
		shaderVector0 = shaderVector0,
		shaderVector1 = shaderVector1,
		shaderVector2 = shaderVector2,
		shaderVector3 = shaderVector3,
		shaderVector5 = shaderVector5
	} )
	distText:registerAnimationState( "pulse_out", {
		shaderVector0 = shaderVector0,
		shaderVector1 = shaderVector1,
		shaderVector2 = shaderVector2,
		shaderVector3 = shaderVector3,
		shaderVector5 = shaderVector5,
		alpha = 0
	} )
	distText.pulseIn = CoD.DistFieldText.PulseIn
	distText.pulseOut = CoD.DistFieldText.PulseOut
	distText.setupForWarningPulse = CoD.DistFieldText.SetupForWarningPulse
	distText.startWarningPulse = CoD.DistFieldText.StartWarningPulse
	distText:pulseIn()
	distText:animateToState( "default" )
	return distText
end

CoD.DistFieldText.PulseIn = function ( self, animationStateName )
	self:animateToState( "default_shader_state" )
	if animationStateName == nil then
		animationStateName = "pulse_in"
	end
	self:animateToState( animationStateName, CoD.DistFieldText.PulseInTime, true, true )
end

CoD.DistFieldText.PulseOut = function ( self )
	self:animateToState( "pulse_out", CoD.DistFieldText.PulseOutTime, true, true )
end

CoD.DistFieldText.SetupForWarningPulse = function ( self )
	self:registerAnimationState( "warning_pulse_high", {
		shaderVector0 = {
			CoD.DistFieldText.EdgeFuzziness,
			CoD.DistFieldText.GlowSize,
			CoD.DistFieldText.ShadowFuzziness,
			0.92
		},
		shaderVector2 = {
			1,
			0,
			0,
			1
		},
		shaderVector3 = {
			CoD.DistFieldText.ShadowOffset[1],
			CoD.DistFieldText.ShadowOffset[2],
			-1,
			CoD.DistFieldText.GlowFalloff
		},
		shaderVector1 = {
			1,
			1,
			1,
			0.6
		}
	} )
	self:registerAnimationState( "warning_pulse_low", {
		shaderVector0 = {
			CoD.DistFieldText.EdgeFuzziness,
			CoD.DistFieldText.GlowSize,
			CoD.DistFieldText.ShadowFuzziness,
			0.75
		},
		shaderVector2 = {
			1,
			0,
			0,
			1
		},
		shaderVector3 = {
			CoD.DistFieldText.ShadowOffset[1],
			CoD.DistFieldText.ShadowOffset[2],
			-1,
			CoD.DistFieldText.GlowFalloff
		},
		shaderVector1 = {
			1,
			1,
			1,
			0.6
		}
	} )
	self:registerEventHandler( "transition_complete_warning_pulse_high", CoD.DistFieldText.TransitionCompleteWarningPulseHigh )
	self:registerEventHandler( "transition_complete_warning_pulse_low", CoD.DistFieldText.TransitionCompleteWarningPulseLow )
end

CoD.DistFieldText.StartWarningPulse = function ( self )
	self:animateToState( "warning_pulse_low" )
end

CoD.DistFieldText.TransitionCompleteWarningPulseHigh = function ( self, event )
	if event.interrupted ~= true then
		self:animateToState( "warning_pulse_low", CoD.DistFieldText.WarningPulseDuration )
	end
end

CoD.DistFieldText.TransitionCompleteWarningPulseLow = function ( self, event )
	if event.interrupted ~= true then
		self:animateToState( "warning_pulse_high", CoD.DistFieldText.WarningPulseDuration )
	end
end

