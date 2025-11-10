require( "ui.T6.LeftRightSelector" )

CoD.GametypeSettingLeftRightSelector = {}
CoD.GametypeSettingLeftRightSelector.AddChoice = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5 )
	local f1_local0 = nil
	if f1_arg5 ~= nil then
		f1_local0 = f1_arg5
	else
		f1_local0 = CoD.GametypeSettingLeftRightSelector.SelectionChanged
	end
	CoD.LeftRightSelector.AddChoice( f1_arg0, f1_arg2, f1_local0, {
		parentSelectorButton = f1_arg0,
		value = f1_arg3,
		extraParams = f1_arg4
	} )
end

CoD.GametypeSettingLeftRightSelector.SelectionChanged = function ( f2_arg0 )
	local f2_local0 = f2_arg0.parentSelectorButton
	local f2_local1 = f2_local0.m_settingName
	Engine.SetGametypeSetting( f2_local1, f2_arg0.value )
	if Engine.IsGametypeSettingDefault( f2_local1 ) then
		f2_local0:showStarIcon( false )
	else
		f2_local0:showStarIcon( true )
	end
end

CoD.GametypeSettingLeftRightSelector.getCurrentValue = function ( f3_arg0 )
	return Engine.GetGametypeSetting( f3_arg0.m_settingName )
end

CoD.GametypeSettingLeftRightSelector.new = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
	local f4_local0 = CoD.LeftRightSelector.new( f4_arg1, Engine.GetGametypeSetting( f4_arg2 ), f4_arg3, f4_arg4, "cac_grid_nav" )
	f4_local0.m_settingName = f4_arg2
	f4_local0.addChoice = CoD.GametypeSettingLeftRightSelector.AddChoice
	f4_local0.getCurrentValue = CoD.GametypeSettingLeftRightSelector.getCurrentValue
	return f4_local0
end

