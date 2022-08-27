-- f89f40a427dd969167f98154d4dafa82
-- This hash is used for caching, delete to decompile the file again

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
CoD.DistFieldText.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6 )
	if f1_arg1 == nil then
		f1_arg1 = CoD.DistFieldText.GlowColor
	end
	if f1_arg2 == nil then
		f1_arg2 = CoD.DistFieldText.OutlineColor
	end
	if f1_arg3 == nil then
		f1_arg3 = CoD.DistFieldText.GlowSize
	end
	if f1_arg4 == nil then
		f1_arg4 = CoD.DistFieldText.OutlineSize
	end
	if f1_arg5 == nil then
		f1_arg5 = CoD.DistFieldText.EdgeFuzziness
	end
	if f1_arg6 == nil then
		f1_arg6 = CoD.DistFieldText.Color
	end
	local f1_local0 = {
		0.38,
		CoD.DistFieldText.GlowSize,
		CoD.DistFieldText.ShadowFuzziness,
		0.6
	}
	local f1_local1 = CoD.DistFieldText.Color
	local f1_local2 = {
		1,
		1,
		1,
		1
	}
	local f1_local3 = {
		CoD.DistFieldText.ShadowOffset[1],
		CoD.DistFieldText.ShadowOffset[2],
		f1_arg4,
		CoD.DistFieldText.GlowFalloff
	}
	local f1_local4 = CoD.DistFieldText.ShadowColor
	local f1_local5 = {
		1,
		1,
		1,
		1
	}
	local f1_local6 = 50
	local self = LUI.UIText.new( f1_arg0 )
	self:registerAnimationState( "default_shader_state", {
		font = CoD.fonts.Dist,
		shaderVector0 = f1_local0,
		shaderVector1 = f1_local1,
		shaderVector2 = f1_local2,
		shaderVector3 = f1_local3,
		shaderVector4 = f1_local4,
		shaderVector5 = f1_local5,
		alpha = 1
	} )
	f1_local0 = {
		f1_arg5,
		f1_arg3,
		CoD.DistFieldText.ShadowFuzziness,
		CoD.DistFieldText.GlowSpread
	}
	f1_local1 = f1_arg6
	f1_local2 = f1_arg1
	f1_local5 = f1_arg2
	self:registerAnimationState( "pulse_in", {
		shaderVector0 = f1_local0,
		shaderVector1 = f1_local1,
		shaderVector2 = f1_local2,
		shaderVector3 = f1_local3,
		shaderVector5 = f1_local5
	} )
	self:registerAnimationState( "pulse_out", {
		shaderVector0 = f1_local0,
		shaderVector1 = f1_local1,
		shaderVector2 = f1_local2,
		shaderVector3 = f1_local3,
		shaderVector5 = f1_local5,
		alpha = 0
	} )
	self.pulseIn = CoD.DistFieldText.PulseIn
	self.pulseOut = CoD.DistFieldText.PulseOut
	self.setupForWarningPulse = CoD.DistFieldText.SetupForWarningPulse
	self.startWarningPulse = CoD.DistFieldText.StartWarningPulse
	self:pulseIn()
	self:animateToState( "default" )
	return self
end

CoD.DistFieldText.PulseIn = function ( f2_arg0, f2_arg1 )
	f2_arg0:animateToState( "default_shader_state" )
	if f2_arg1 == nil then
		f2_arg1 = "pulse_in"
	end
	f2_arg0:animateToState( f2_arg1, CoD.DistFieldText.PulseInTime, true, true )
end

CoD.DistFieldText.PulseOut = function ( f3_arg0 )
	f3_arg0:animateToState( "pulse_out", CoD.DistFieldText.PulseOutTime, true, true )
end

CoD.DistFieldText.SetupForWarningPulse = function ( f4_arg0 )
	f4_arg0:registerAnimationState( "warning_pulse_high", {
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
	f4_arg0:registerAnimationState( "warning_pulse_low", {
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
	f4_arg0:registerEventHandler( "transition_complete_warning_pulse_high", CoD.DistFieldText.TransitionCompleteWarningPulseHigh )
	f4_arg0:registerEventHandler( "transition_complete_warning_pulse_low", CoD.DistFieldText.TransitionCompleteWarningPulseLow )
end

CoD.DistFieldText.StartWarningPulse = function ( f5_arg0 )
	f5_arg0:animateToState( "warning_pulse_low" )
end

CoD.DistFieldText.TransitionCompleteWarningPulseHigh = function ( f6_arg0, f6_arg1 )
	if f6_arg1.interrupted ~= true then
		f6_arg0:animateToState( "warning_pulse_low", CoD.DistFieldText.WarningPulseDuration )
	end
end

CoD.DistFieldText.TransitionCompleteWarningPulseLow = function ( f7_arg0, f7_arg1 )
	if f7_arg1.interrupted ~= true then
		f7_arg0:animateToState( "warning_pulse_high", CoD.DistFieldText.WarningPulseDuration )
	end
end

