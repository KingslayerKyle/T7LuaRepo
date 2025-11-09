local f0_local0, f0_local1, f0_local2, f0_local3, f0_local4, f0_local5, f0_local6, f0_local7, f0_local8, f0_local9, f0_local10, f0_local11, f0_local12, f0_local13, f0_local14, f0_local15, f0_local16, f0_local17, f0_local18, f0_local19, f0_local20 = nil
LUI.createMenu.EditDefaultClasses = function ( f1_arg0 )
	local f1_local0 = CoD.GameOptionsMenu.New( f1_arg0, "EditDefaultClasses" )
	f1_local0:setPreviousMenu( "EditGameOptions" )
	local self = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -640,
		right = 640,
		topAnchor = false,
		bottomAnchor = false,
		top = -360,
		bottom = 360,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	self:setPriority( -100 )
	f1_local0:addElement( self )
	f1_local0:addTitle( Engine.Localize( "MENU_PRESET_CLASSES_CAPS" ) )
	f1_local0.team = Enum.team_t.TEAM_FIRST_PLAYING_TEAM
	CoD.CACUtility.SetGametypeSettingsCACRoot( f1_local0:getOwner(), f1_local0.team )
	f1_local0.classOptionsButtonPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_CLASS_OPTIONS" ), f1_local0, "open_class_options", false, nil, false, nil, "O" )
	f1_local0.buttonList = CoD.ButtonList.new()
	f1_local0.buttonList.id = "ButtonList.EditDefaultClasses"
	f1_local0.buttonList:setLeftRight( true, false, 0, CoD.ButtonList.DefaultWidth )
	f1_local0.buttonList:setTopBottom( true, true, CoD.Menu.TitleHeight, 0 )
	f1_local0:addElement( f1_local0.buttonList )
	f1_local0[f1_local0.buttonList.id] = f1_local0.buttonList
	f1_local0.perTeamButtonList = CoD.ButtonList.new()
	f1_local0.perTeamButtonList.id = "ButtonList.EditDefaultClassesPerTeam"
	f1_local0.perTeamButtonList:setLeftRight( true, false, 0, CoD.ButtonList.DefaultWidth )
	f1_local0.perTeamButtonList:setTopBottom( true, true, CoD.Menu.TitleHeight, 0 )
	f0_local8( f1_local0 )
	f1_local0:registerEventHandler( "class_button_gained_focus", f0_local4 )
	f1_local0:registerEventHandler( "class_button_lost_focus", f0_local5 )
	f1_local0:registerEventHandler( "class_chosen", f0_local6 )
	f1_local0:registerEventHandler( "occlusion_change", f0_local13 )
	f1_local0:registerEventHandler( "open_class_options", f0_local14 )
	f1_local0:registerEventHandler( "selector_changed", f0_local18 )
	f1_local0:registerEventHandler( "team_chosen", f0_local20 )
	f0_local15( f1_local0 )
	if 1 < Engine.GetGametypeSetting( "teamCount" ) and 1 == Engine.GetGametypeSetting( "presetClassesPerTeam" ) then
		local f1_local2 = CoD.perController
		local f1_local3 = f1_local0
		if f1_local2[f1_local0:getOwner()].editingPresetClass then
			f0_local20( f1_local0 )
		end
	end
	local f1_local2 = CoD.perController
	local f1_local3 = f1_local0
	f1_local2[f1_local0:getOwner()].editingPresetClass = nil
	f1_local0.close = f0_local7
	return f1_local0
end

f0_local3 = function ( f2_arg0, f2_arg1 )
	if f2_arg0.classOptionsButton ~= nil then
		f2_arg0.classOptionsButton:close()
		f2_arg0:setHandleMouseButton( true )
	end
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = CoD.CoD9Button.GainFocus( f3_arg0, f3_arg1 )
	f3_arg0:dispatchEventToParent( {
		name = "class_button_gained_focus",
		button = f3_arg0
	} )
	return f3_local0
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	CoD.CoD9Button.LoseFocus( f4_arg0, f4_arg1 )
	if CoD.useMouse then
		f0_local3( f4_arg0 )
	end
	f4_arg0:dispatchEventToParent( {
		name = "class_button_lost_focus",
		button = f4_arg0
	} )
end

f0_local4 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = CoD.perController[f5_arg0:getOwner()]
	f5_local0.classNum = f5_arg1.button.classNum
	f5_local0.isPreset = true
	f5_local0.weaponSlot = nil
	f5_local0.grenadeSlot = nil
	f5_local0.perkCategory = nil
	f5_local0.slotIndex = nil
	f5_arg0:addRightButtonPrompt( f5_arg0.classOptionsButtonPrompt )
end

f0_local5 = function ( f6_arg0, f6_arg1 )
	f6_arg0.classOptionsButtonPrompt:close()
end

f0_local6 = function ( f7_arg0, f7_arg1 )
	f7_arg0.buttonList:saveState()
	f7_arg0.perTeamButtonList:saveState()
	CoD.perController[f7_arg0:getOwner()].editingPresetClass = f7_arg0.team
	local f7_local0 = f7_arg0:getOwner()
	local f7_local1 = f7_arg1.button.classNum
	local f7_local2 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f7_local0 ), "CustomClassList" ), "class" .. f7_local1 )
	CoD.CACUtility.GetCustomClassModel( f7_local0, f7_local1, f7_local2 )
	CoD.perController[f7_local0].classModel = f7_local2
	Engine.BeginEditingPresetClass( f7_arg0.team )
	CoD.CACUtility.SetDefaultCACRoot( f7_arg1.controller )
	CoD.OpenCACMenu( f7_arg0, f7_arg1.controller )
end

f0_local7 = function ( f8_arg0 )
	local f8_local0 = CoD.perController
	local f8_local1 = f8_arg0
	if not f8_local0[f8_arg0:getOwner()].editingPresetClass then
		Engine.StopEditingPresetClass()
		f8_local0 = CoD.perController
		f8_local1 = f8_arg0
		f8_local0[f8_arg0:getOwner()].isPreset = nil
	end
	CoD.Menu.close( f8_arg0 )
end

f0_local8 = function ( f9_arg0 )
	f9_arg0.presetClassesPerTeamSelector = f9_arg0:addGametypeSetting( f9_arg0:getOwner(), "presetClassesPerTeam", true )
	f0_local10( f9_arg0 )
	f0_local9( f9_arg0 )
end

f0_local9 = function ( f10_arg0 )
	f10_arg0.classButtons = {}
	local f10_local0 = CoD.CACUtility.GetLoadoutNames( f10_arg0:getOwner() )
	for f10_local1 = 0, 4, 1 do
		local f10_local4 = f10_arg0.buttonList:addButton( Engine.Localize( f10_local0[f10_local1]:get() ) )
		f10_local4.classNum = f10_local1
		f10_local4:registerEventHandler( "gain_focus", f0_local1 )
		f10_local4:registerEventHandler( "lose_focus", f0_local2 )
		f10_local4:setActionEventNameNewStyle( f10_arg0, f10_arg0:getOwner(), "class_chosen" )
		table.insert( f10_arg0.classButtons, f10_local4 )
	end
end

f0_local10 = function ( f11_arg0 )
	f11_arg0.teamButtons = {}
	local f11_local0 = Engine.GetGametypeSetting( "teamCount" )
	local f11_local1 = {
		"MPUI_ALLIES_CAPS",
		"MPUI_AXIS_CAPS"
	}
	for f11_local2 = 1, f11_local0, 1 do
		local f11_local5 = Engine.Localize( f11_local1[f11_local2] )
		local f11_local6 = f11_arg0.buttonList:addButton( f11_local5 )
		f11_local6.teamText = f11_local5
		f11_local6.index = f11_local2 - 1
		f11_local6:setActionEventNameNewStyle( f11_arg0, f11_arg0:getOwner(), "team_chosen" )
		table.insert( f11_arg0.teamButtons, f11_local6 )
	end
end

f0_local15 = function ( f12_arg0 )
	f12_arg0.buttonList:removeAllButtons()
	f12_arg0.buttonList.hintText:close()
	local f12_local0 = Engine.GetGametypeSetting( "teamCount" )
	if f12_local0 > 1 then
		f12_arg0.buttonList:addElement( f12_arg0.presetClassesPerTeamSelector )
		f12_arg0.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	end
	if f12_local0 > 1 and Engine.GetGametypeSetting( "presetClassesPerTeam" ) == 1 then
		f0_local17( f12_arg0 )
		for f12_local4, f12_local5 in ipairs( f12_arg0.teamButtons ) do
			f12_arg0.buttonList:addElement( f12_local5 )
		end
	else
		f12_arg0.team = Enum.team_t.TEAM_FREE
		CoD.CACUtility.SetGametypeSettingsCACRoot( f12_arg0:getOwner(), f12_arg0.team )
		f0_local16( f12_arg0 )
		for f12_local4, f12_local5 in ipairs( f12_arg0.classButtons ) do
			f12_arg0.buttonList:addElement( f12_local5 )
		end
	end
	LUI.UIVerticalList.UpdateNavigation( f12_arg0.buttonList )
	if not f12_arg0.buttonList:restoreState() then
		f12_arg0.buttonList:processEvent( LUI.UIButton.GainFocusEvent )
	end
end

f0_local13 = function ( f13_arg0, f13_arg1 )
	CoD.Menu.OcclusionChange( f13_arg0, f13_arg1 )
	if not f13_arg1.occluded then
		Engine.StopEditingPresetClass()
		f0_local16( f13_arg0 )
		f0_local17( f13_arg0 )
	end
end

f0_local14 = function ( f14_arg0, f14_arg1 )
	Engine.BeginEditingPresetClass( f14_arg0.team )
	f14_arg0:openPopup( "T6ClassOptions", f14_arg1.controller )
end

f0_local18 = function ( f15_arg0 )
	f15_arg0.buttonList:saveState()
	f0_local15( f15_arg0 )
end

f0_local16 = function ( f16_arg0 )
	local f16_local0 = CoD.CACUtility.GetLoadoutNames( f16_arg0:getOwner() )
	for f16_local4, f16_local5 in ipairs( f16_arg0.classButtons ) do
		f16_local5.label:setText( Engine.Localize( f16_local0[f16_local5.classNum]:get() ) )
		f0_local11( f16_local5, f16_arg0.team )
	end
end

f0_local17 = function ( f17_arg0 )
	for f17_local3, f17_local4 in ipairs( f17_arg0.teamButtons ) do
		f0_local12( f17_local4 )
	end
end

f0_local11 = function ( f18_arg0, f18_arg1 )
	if Engine.IsPresetClassDefault( f18_arg1, f18_arg0.classNum ) then
		f18_arg0:showStarIcon( false )
	else
		f18_arg0:showStarIcon( true )
	end
end

f0_local12 = function ( f19_arg0 )
	for f19_local0 = 0, 4, 1 do
		if not Engine.IsPresetClassDefault( Enum.team_t.TEAM_FIRST_PLAYING_TEAM + f19_arg0.index, f19_local0 ) then
			f19_arg0:showStarIcon( true )
			return 
		end
	end
	f19_arg0:showStarIcon( false )
end

f0_local19 = function ( f20_arg0, f20_arg1 )
	f20_arg0.perTeamButtonList:processEvent( LUI.UIButton.LoseFocusEvent )
	f20_arg0.perTeamButtonList:processEvent( {
		name = "complete_animation"
	} )
	f20_arg0.perTeamButtonList:removeAllButtons()
	f20_arg0.perTeamButtonList:clearSavedState()
	f20_arg0.perTeamButtonList:close()
	f20_arg0:addElement( f20_arg0.buttonList )
	f20_arg0:processEvent( {
		name = "controller_backed_out"
	} )
	f20_arg0:registerEventHandler( "button_prompt_back", nil )
	f20_arg0:setTitle( Engine.Localize( "MENU_PRESET_CLASSES_CAPS" ) )
end

f0_local20 = function ( f21_arg0, f21_arg1 )
	local f21_local0, f21_local1 = nil
	if f21_arg1 then
		f21_arg0.team = Enum.team_t.TEAM_FIRST_PLAYING_TEAM + f21_arg1.button.index
		f21_local1 = f21_arg1.button.teamText
	else
		local f21_local2 = CoD.perController
		local f21_local3 = f21_arg0
		f21_arg0.team = f21_local2[f21_arg0:getOwner()].editingPresetClass
		for f21_local5, f21_local6 in ipairs( f21_arg0.teamButtons ) do
			if f21_local6.index == f21_arg0.team - Enum.team_t.TEAM_FIRST_PLAYING_TEAM then
				f21_local1 = f21_local6.teamText
				break
			end
		end
	end
	CoD.CACUtility.SetGametypeSettingsCACRoot( f21_arg0:getOwner(), f21_arg0.team )
	f21_arg0.buttonList:close()
	f0_local16( f21_arg0 )
	for f21_local5, f21_local6 in ipairs( f21_arg0.classButtons ) do
		f21_local6:close()
		f21_arg0.perTeamButtonList:addElement( f21_local6 )
	end
	f21_arg0:setTitle( f21_local1 )
	f21_arg0:addElement( f21_arg0.perTeamButtonList )
	if not f21_arg0.perTeamButtonList:restoreState() then
		f21_arg0.perTeamButtonList:processEvent( LUI.UIButton.GainFocusEvent )
		f21_arg0.perTeamButtonList:processEvent( {
			name = "complete_animation"
		} )
	end
	f21_arg0:registerEventHandler( "button_prompt_back", f0_local19 )
end

