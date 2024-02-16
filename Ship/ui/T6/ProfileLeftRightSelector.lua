-- eff499c8751f5c2b2f8437481c1fece5
-- This hash is used for caching, delete to decompile the file again

require( "ui.T6.LeftRightSelector" )

CoD.ProfileLeftRightSelector = {}
local f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg1 then
		Engine.SetProfileVar( f1_arg0.parentSelectorButton.m_currentController, f1_arg0.parentSelectorButton.m_profileVarName, f1_arg0.value )
	end
end

CoD.ProfileLeftRightSelector.AddChoice = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
	local f2_local0 = nil
	if f2_arg4 ~= nil then
		f2_local0 = f2_arg4
	else
		f2_local0 = f0_local0
	end
	CoD.LeftRightSelector.AddChoice( f2_arg0, f2_arg1, f2_local0, {
		parentSelectorButton = f2_arg0,
		value = f2_arg2,
		extraParams = f2_arg3
	} )
end

CoD.ProfileLeftRightSelector.getCurrentValue = function ( f3_arg0 )
	return Engine.ProfileValueAsString( f3_arg0.m_currentController, f3_arg0.m_profileVarName )
end

CoD.ProfileLeftRightSelector.new = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4, f4_arg5 )
	local f4_local0 = Engine.ProfileValueAsString( f4_arg0, f4_arg2 )
	if not f4_arg5 then
		f4_arg5 = CoD.LeftRightSelector.ChangeSFX
	end
	local f4_local1 = CoD.LeftRightSelector.new( f4_arg1, f4_local0, f4_arg3, f4_arg4, f4_arg5 )
	f4_local1.m_profileVarName = f4_arg2
	f4_local1.m_currentController = f4_arg0
	f4_local1.addChoice = CoD.ProfileLeftRightSelector.AddChoice
	f4_local1.currentProfileVarValue = Engine.ProfileValueAsString( f4_arg0, f4_arg2 )
	f4_local1.getCurrentValue = CoD.ProfileLeftRightSelector.getCurrentValue
	return f4_local1
end

