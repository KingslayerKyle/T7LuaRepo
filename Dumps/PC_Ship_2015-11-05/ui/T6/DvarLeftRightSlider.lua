require( "ui.T6.LeftRightSlider" )

CoD.DvarLeftRightSlider = {}
local f0_local0 = function ( f1_arg0, f1_arg1 )
	Engine.SetDvar( f1_arg0.m_dvarName, f1_arg1 )
end

CoD.DvarLeftRightSlider.new = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5, f2_arg6 )
	local f2_local0 = tonumber( Engine.DvarString( nil, f2_arg2 ) )
	local f2_local1 = CoD.LeftRightSlider.new( f2_arg1, f2_arg5, nil, f2_local0, f2_arg3, f2_arg4, f2_arg6 )
	f2_local1.m_dvarName = f2_arg2
	f2_local1.m_currentValue = f2_local0
	f2_local1.m_currentController = f2_arg0
	f2_local1:setSliderCallback( f0_local0 )
	return f2_local1
end

