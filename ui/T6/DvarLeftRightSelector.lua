-- 0123456789abcdeffedcba9876543210
-- This hash is used for caching, delete to decompile the file again

require( "ui.T6.LeftRightSelector" )

CoD.DvarLeftRightSelector = {}
local f0_local0 = function ( f1_arg0 )
	Engine.SetDvar( f1_arg0.parentSelectorButton.m_dvarName, f1_arg0.value )
end

CoD.DvarLeftRightSelector.AddChoice = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5 )
	local f2_local0 = nil
	if f2_arg5 ~= nil then
		f2_local0 = f2_arg5
	else
		f2_local0 = f0_local0
	end
	CoD.LeftRightSelector.AddChoice( f2_arg0, f2_arg2, f2_local0, {
		parentSelectorButton = f2_arg0,
		value = f2_arg3,
		extraParams = f2_arg4
	} )
end

CoD.DvarLeftRightSelector.getCurrentValue = function ( f3_arg0 )
	return Engine.DvarString( nil, f3_arg0.m_dvarName )
end

CoD.DvarLeftRightSelector.new = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
	local f4_local0 = nil
	if f4_arg2 then
		f4_local0 = Engine.DvarString( nil, f4_arg2 )
	end
	local f4_local1 = CoD.LeftRightSelector.new( f4_arg1, f4_local0, f4_arg3, f4_arg4, "cac_grid_nav" )
	f4_local1.m_dvarName = f4_arg2
	f4_local1.m_currentController = f4_arg0
	f4_local1.addChoice = CoD.DvarLeftRightSelector.AddChoice
	f4_local1.getCurrentValue = CoD.DvarLeftRightSelector.getCurrentValue
	return f4_local1
end

