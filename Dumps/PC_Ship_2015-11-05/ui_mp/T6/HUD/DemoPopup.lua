CoD.DemoPopup = {}
local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:goBack( f1_arg1.controller )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	Engine.Exec( f2_arg1.controller, "demo_savesegment 0" )
	f0_local0( f2_arg0, f2_arg1 )
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	Engine.Exec( f3_arg1.controller, "demo_keyboard segmentName" )
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	Engine.Exec( f4_arg1.controller, "demo_previewsegment" )
	f0_local0( f4_arg0, f4_arg1 )
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	Engine.Exec( f5_arg1.controller, "demo_savesegment 1" )
	f0_local0( f5_arg0, f5_arg1 )
end

LUI.createMenu.Demo_Save_Popup = function ( f6_arg0 )
	local f6_local0 = CoD.Menu.NewSmallPopup( "Demo_Save_Popup" )
	f6_local0:setOwner( f6_arg0 )
	f6_local0:addSelectButton()
	f6_local0:registerEventHandler( "demo_close_save_popup", f0_local0 )
	local f6_local1 = 5
	local self = LUI.UIText.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, false, f6_local1, f6_local1 + CoD.textSize.Big )
	self:setFont( CoD.fonts.Big )
	self:setAlignment( LUI.Alignment.Left )
	self:setText( Engine.Localize( "MENU_KEEP_SEGMENT" ) )
	f6_local0:addElement( self )
	local f6_local3 = CoD.ButtonList.new( {} )
	f6_local3:setLeftRight( true, true, 0, 0 )
	f6_local3:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 5 + 10, 0 )
	f6_local0:addElement( f6_local3 )
	local f6_local4 = f6_local3:addButton( Engine.Localize( "MENU_AUTONAME_SEGMENT" ) )
	f6_local4:setActionEventName( "autoname_and_save_segment" )
	f6_local4:processEvent( {
		name = "gain_focus"
	} )
	f6_local0:registerEventHandler( "autoname_and_save_segment", f0_local1 )
	local f6_local5 = f6_local3:addButton( Engine.Localize( "MENU_NAME_SEGMENT" ) )
	f6_local5:setActionEventName( "name_and_save_segment" )
	f6_local0:registerEventHandler( "name_and_save_segment", f0_local2 )
	local f6_local6 = f6_local3:addButton( Engine.Localize( "MENU_PREVIEW_SEGMENT" ) )
	f6_local6:setActionEventName( "preview_segment" )
	f6_local0:registerEventHandler( "preview_segment", f0_local3 )
	local f6_local7 = f6_local3:addButton( Engine.Localize( "MENU_DISCARD_SEGMENT" ) )
	f6_local7:setActionEventName( "discard_segment" )
	f6_local0:registerEventHandler( "discard_segment", f0_local4 )
	return f6_local0
end

CoD.DemoPopup.OpenSavePopup = function ( f7_arg0, f7_arg1 )
	if f7_arg1.menuName == "demo_save_clip" then
		f7_arg0:openPopup( "Demo_Save_Popup", f7_arg1.controller )
	else
		CoD.perController[f7_arg1.controller].fileshareSaveCategory = "screenshot"
		CoD.perController[f7_arg1.controller].fileshareSaveIsCopy = false
		CoD.perController[f7_arg1.controller].fileshareSaveIsPooled = false
	end
end

LUI.createMenu.Demo_Wait = function ( f8_arg0, f8_arg1 )
	local f8_local0 = CoD.Menu.NewSmallPopup( "Demo_Wait" )
	f8_local0:setOwner( f8_arg0 )
	f8_local0:addBackButton()
	local f8_local1 = 5
	local self = LUI.UIText.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, false, f8_local1, f8_local1 + CoD.textSize.Condensed )
	self:setFont( CoD.fonts.Condensed )
	self:setAlignment( LUI.Alignment.Left )
	self:setText( Engine.Localize( "MENU_PLEASEWAIT" ) )
	f8_local0:addElement( self )
	return f8_local0
end

CoD.DOLLYCAM_SPEEDMODE_MANUAL = 0
CoD.DOLLYCAM_SPEEDMODE_LINEAR = 1
CoD.DOLLYCAM_SPEEDMODE_FIXED = 2
local f0_local5 = function ( f9_arg0, f9_arg1 )
	f9_arg0:goBack( f9_arg1.controller )
	Engine.LockInput( f9_arg1.controller, false )
	Engine.SetUIActive( f9_arg1.controller, false )
end

local f0_local6 = function ( f10_arg0, f10_arg1 )
	Engine.ExecNow( f10_arg1.controller, "demo_removedollycammarker -1" )
	f10_arg0:setPreviousMenu( nil )
	f0_local5( f10_arg0, f10_arg1 )
end

LUI.createMenu.RemoveAllMarkers = function ( f11_arg0 )
	local f11_local0 = CoD.Popup.SetupPopupChoice( "RemoveAllMarkers", f11_arg0 )
	f11_local0.title:setText( Engine.Localize( "MENU_WARNING" ) )
	f11_local0.msg:setText( Engine.Localize( "MENU_DEMO_DOLLYCAM_MARKER_REMOVE_ALL_CONFIRMATION" ) )
	f11_local0:addBackButton()
	f11_local0.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	f11_local0.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	f11_local0.choiceA:setActionEventName( "remove_all_markers_accept" )
	f11_local0.choiceB:processEvent( {
		name = "gain_focus"
	} )
	f11_local0:registerEventHandler( "remove_all_markers_accept", f0_local6 )
	return f11_local0
end

local f0_local7 = function ( f12_arg0, f12_arg1 )
	Engine.Exec( f12_arg1.controller, "demo_repositiondollycammarker " .. Engine.GetHighlightedCameraMarker() )
	f0_local5( f12_arg0, f12_arg1 )
end

local f0_local8 = function ( f13_arg0, f13_arg1 )
	Engine.Exec( f13_arg1.controller, "demo_removedollycammarker " .. Engine.GetHighlightedCameraMarker() )
	f0_local5( f13_arg0, f13_arg1 )
end

local f0_local9 = function ( f14_arg0, f14_arg1 )
	f14_arg0:openMenu( "RemoveAllMarkers", f14_arg1.controller )
	f14_arg0:close()
end

local f0_local10 = function ( f15_arg0, f15_arg1 )
	local f15_local0 = Engine.GetHighlightedCameraMarker() + 1
	local f15_local1 = f15_arg0.speedSettingMode:getCurrentValue()
	f15_arg0.messageText:setText( Engine.ToUpper( Engine.Localize( "MENU_DEMO_DOLLYCAM_MARKER_NUMBER", f15_local0 ) ) )
	f15_arg0.speedSettingMode:refreshChoice()
	if f15_arg0.speedSettingValue ~= nil then
		if f15_local1 ~= "0" then
			if f15_arg0.speedSettingValueValid == false then
				f15_arg0.speedSettingValueSpacer:close()
				f15_arg0.speedSettingValue:addElementAfter( f15_arg0.speedSettingMode )
				LUI.UIVerticalList.UpdateNavigation( f15_arg0.buttonList )
				f15_arg0.speedSettingValueValid = true
			end
			f15_arg0.speedSettingValue.label:setText( Engine.Localize( "MENU_DEMO_DOLLYCAM_SPEED_SETTING_SPEED", string.format( "%.1f", Engine.DvarFloat( "demo_dollycamMarkerTimeScaleValue" ) ) ) )
		elseif f15_arg0.speedSettingValueValid == true then
			f15_arg0.speedSettingValue:processEvent( {
				name = "lose_focus"
			} )
			f15_arg0.speedSettingValue:close()
			f15_arg0.speedSettingValueValid = false
			f15_arg0.speedSettingValueSpacer:addElementAfter( f15_arg0.speedSettingMode )
			f15_arg0.speedSettingMode:processEvent( {
				name = "gain_focus"
			} )
			LUI.UIVerticalList.UpdateNavigation( f15_arg0.buttonList )
		end
	end
end

local f0_local11 = function ( f16_arg0, f16_arg1 )
	Engine.SetDvar( f16_arg0.m_dvarName, f16_arg1 )
	local f16_local0 = f16_arg0:getParent()
	if f16_local0 ~= nil then
		local f16_local1 = f16_local0:getParent()
		if f16_local1 ~= nil then
			f0_local10( f16_local1, nil )
		end
	end
end

local f0_local12 = function ( f17_arg0 )
	Engine.SetDvar( f17_arg0.parentSelectorButton.m_dvarName, f17_arg0.value )
	local f17_local0 = f17_arg0.parentSelectorButton:getParent()
	if f17_local0 ~= nil then
		local f17_local1 = f17_local0:getParent()
		if f17_local1 ~= nil and f17_local1.creatingSpeedSettingModeButton ~= true then
			f17_local1:processEvent( {
				name = "demo_dollycam_marker_options_update",
				controller = f17_local1.controller
			} )
		end
	end
end

local f0_local13 = function ( f18_arg0, f18_arg1 )
	local f18_local0 = Engine.GetHighlightedCameraMarker()
	Engine.Exec( f18_arg1.controller, "demo_updatedollycammarkerparameters " .. f18_local0 )
	Engine.Exec( f18_arg1.controller, "demo_switchdollycammarker " .. f18_local0 .. " 0" )
end

local f0_local14 = function ( f19_arg0, f19_arg1 )
	local f19_local0 = Engine.GetHighlightedCameraMarker()
	Engine.Exec( f19_arg1.controller, "demo_updatedollycammarkerparameters " .. f19_local0 )
	Engine.Exec( f19_arg1.controller, "demo_switchdollycammarker " .. f19_local0 .. " 1" )
end

local f0_local15 = function ( f20_arg0, f20_arg1 )
	Engine.Exec( f20_arg1.controller, "demo_updatedollycammarkerparameters " .. Engine.GetHighlightedCameraMarker() )
	f0_local5( f20_arg0, f20_arg1 )
end

LUI.createMenu.Demo_DollyCam_Marker_Options = function ( f21_arg0 )
	local f21_local0 = CoD.Menu.NewSmallPopup( "Demo_DollyCam_Marker_Options" )
	f21_local0.controller = f21_arg0
	f21_local0:setOwner( f21_arg0 )
	f21_local0:addSelectButton()
	f21_local0:addBackButton( Engine.Localize( "MPUI_DONE" ) )
	f21_local0:registerEventHandler( "button_prompt_back", f0_local15 )
	f21_local0:registerEventHandler( "demo_dollycam_marker_options_update", f0_local10 )
	local f21_local1 = 0
	local f21_local2 = CoD.textSize.Condensed
	local f21_local3 = 240
	f21_local0.leftTopButtonBar = LUI.UIHorizontalList.new( {
		left = f21_local1,
		top = -30,
		right = 0,
		bottom = 60,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Condensed,
		alignment = LUI.Alignment.Left
	} )
	f21_local0:addElement( f21_local0.leftTopButtonBar )
	f21_local0.leftTopButtonBar:addElement( CoD.ButtonPrompt.new( "shoulderl", "", f21_local0, "switch_dollycam_marker_previous" ) )
	f21_local0:registerEventHandler( "switch_dollycam_marker_previous", f0_local13 )
	f21_local0.rightTopButtonBar = LUI.UIHorizontalList.new( {
		left = 0,
		top = -30,
		right = -f21_local1,
		bottom = 60,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Condensed,
		alignment = LUI.Alignment.Right
	} )
	f21_local0:addElement( f21_local0.rightTopButtonBar )
	f21_local0.rightTopButtonBar:addElement( CoD.ButtonPrompt.new( "shoulderr", "", f21_local0, "switch_dollycam_marker_next" ) )
	f21_local0:registerEventHandler( "switch_dollycam_marker_next", f0_local14 )
	f21_local0.messageText = LUI.UIText.new( {
		left = 0,
		top = f21_local1,
		right = 0,
		bottom = f21_local1 + f21_local2,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Big,
		alignment = LUI.Alignment.Center
	} )
	f21_local0.messageText:setText( Engine.ToUpper( Engine.Localize( "MENU_DEMO_DOLLYCAM_MARKER_NUMBER", Engine.GetHighlightedCameraMarker() + 1 ) ) )
	f21_local0:addElement( f21_local0.messageText )
	f21_local0.buttonList = CoD.ButtonList.new( {
		left = f21_local1,
		top = f21_local1 + f21_local2 + 10,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	f21_local0:addElement( f21_local0.buttonList )
	f21_local0.creatingSpeedSettingModeButton = true
	f21_local0.speedSettingMode = f21_local0.buttonList:addDvarLeftRightSelector( f21_arg0, Engine.Localize( "MENU_DEMO_DOLLYCAM_SPEED_SETTING_MODE" ), "demo_dollycamMarkerTimeScaleMode", nil, f21_local3 )
	local f21_local4 = f21_local0.speedSettingMode
	local f21_local5 = {}
	local f21_local6 = Engine.Localize( "MENU_DEMO_DOLLYCAM_SPEED_SETTING_MANUAL" )
	local f21_local7 = Engine.Localize( "MENU_DEMO_DOLLYCAM_SPEED_SETTING_LINEAR" )
	local f21_local8 = Engine.Localize( "MENU_DEMO_DOLLYCAM_SPEED_SETTING_FIXED" )
	f21_local4.strings = f21_local6
	f21_local0.speedSettingMode.values = {
		CoD.DOLLYCAM_SPEEDMODE_MANUAL,
		CoD.DOLLYCAM_SPEEDMODE_LINEAR,
		CoD.DOLLYCAM_SPEEDMODE_FIXED
	}
	for f21_local4 = 1, #f21_local0.speedSettingMode.strings, 1 do
		f21_local0.speedSettingMode:addChoice( f21_arg0, Engine.Localize( f21_local0.speedSettingMode.strings[f21_local4] ), f21_local0.speedSettingMode.values[f21_local4], nil, f0_local12 )
	end
	f21_local0.creatingSpeedSettingModeButton = false
	f21_local0.speedSettingValue = f21_local0.buttonList:addDvarLeftRightSlider( f21_arg0, Engine.Localize( "MENU_DEMO_DOLLYCAM_SPEED_SETTING_SPEED", string.format( "%.1f", Engine.DvarFloat( "demo_dollycamMarkerTimeScaleValue" ) ) ), "demo_dollycamMarkerTimeScaleValue", 0.1, Dvar.demo_maxTimeScale:get(), nil, f21_local3 )
	f21_local0.speedSettingValue:setSliderCallback( f0_local11 )
	f21_local0.speedSettingValueValid = true
	f21_local0.speedSettingValueSpacer = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = CoD.CoD9Button.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	} )
	f21_local0.repositionCamera = f21_local0.buttonList:addButton( Engine.Localize( "MENU_DEMO_DOLLYCAM_MARKER_REPOSITION" ) )
	f21_local0.repositionCamera:setActionEventName( "reposition_camera" )
	f21_local0:registerEventHandler( "reposition_camera", f0_local7 )
	f21_local0.removeMarker = f21_local0.buttonList:addButton( Engine.Localize( "MENU_DEMO_DOLLYCAM_MARKER_REMOVE" ) )
	f21_local0.removeMarker:setActionEventName( "remove_marker" )
	f21_local0:registerEventHandler( "remove_marker", f0_local8 )
	f21_local0.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	f21_local0.removeAllMarkers = f21_local0.buttonList:addButton( Engine.Localize( "MENU_DEMO_DOLLYCAM_MARKER_REMOVE_ALL" ) )
	f21_local0.removeAllMarkers:setActionEventName( "remove_all_markers" )
	f21_local0:registerEventHandler( "remove_all_markers", f0_local9 )
	f21_local0.buttonList:processEvent( {
		name = "gain_focus"
	} )
	f21_local0:processEvent( {
		name = "demo_dollycam_marker_options_update",
		controller = f21_arg0
	} )
	return f21_local0
end

CoD.DemoPopup.OpenDollyCamMarkerOptionsPopup = function ( f22_arg0, f22_arg1 )
	f22_arg0:openPopup( "Demo_DollyCam_Marker_Options", f22_arg1.controller )
end

CoD.LightmanPopupWidth = 600
CoD.LightmanPopupHeight = 420
CoD.LightmanPopupWidthOffset = 40
CoD.LightmanPopupHeightOffset = 40
local f0_local16 = function ( f23_arg0, f23_arg1 )
	f23_arg0:goBack( f23_arg1.controller )
	Engine.LockInput( f23_arg1.controller, false )
	Engine.SetUIActive( f23_arg1.controller, false )
end

local f0_local17 = function ( f24_arg0, f24_arg1 )
	Engine.ExecNow( f24_arg1.controller, "demo_removelightmanmarker -1" )
	f24_arg0:setPreviousMenu( nil )
	f0_local16( f24_arg0, f24_arg1 )
end

LUI.createMenu.RemoveAllLightmanMarkers = function ( f25_arg0 )
	local f25_local0 = CoD.Popup.SetupPopupChoice( "RemoveAllLightmanMarkers", f25_arg0 )
	f25_local0.title:setText( Engine.Localize( "MENU_WARNING" ) )
	f25_local0.msg:setText( Engine.Localize( "MENU_DEMO_LIGHTMAN_MARKER_REMOVE_ALL_CONFIRMATION" ) )
	f25_local0:addBackButton()
	f25_local0.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	f25_local0.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	f25_local0.choiceA:setActionEventName( "remove_all_markers_accept" )
	f25_local0.choiceB:processEvent( {
		name = "gain_focus"
	} )
	f25_local0:registerEventHandler( "remove_all_markers_accept", f0_local17 )
	return f25_local0
end

local f0_local18 = function ( f26_arg0, f26_arg1 )
	Engine.Exec( f26_arg1.controller, "demo_repositionlightmanmarker " .. Engine.GetHighlightedCameraMarker() )
	f0_local16( f26_arg0, f26_arg1 )
end

local f0_local19 = function ( f27_arg0, f27_arg1 )
	Engine.Exec( f27_arg1.controller, "demo_removelightmanmarker " .. Engine.GetHighlightedCameraMarker() )
	f0_local16( f27_arg0, f27_arg1 )
end

local f0_local20 = function ( f28_arg0, f28_arg1 )
	f28_arg0:openMenu( "RemoveAllLightmanMarkers", f28_arg1.controller )
	f28_arg0:close()
end

local f0_local21 = function ( f29_arg0, f29_arg1 )
	f29_arg0.messageText:setText( Engine.ToUpper( Engine.Localize( "MENU_DEMO_LIGHTMAN_MARKER_NUMBER", Engine.GetHighlightedCameraMarker() + 1 ) ) )
	f29_arg0.lightMode:refreshChoice()
	f29_arg0.rangeValue.label:setText( Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_RANGE", string.format( "%.1f", Engine.DvarFloat( "demo_lightmanMarkerLightRange" ) ) ) )
	f29_arg0.colorRValue.label:setText( Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_COLOR_R", string.format( "%.2f", Engine.DvarFloat( "demo_lightmanMarkerLightColorR" ) ) ) )
	f29_arg0.colorGValue.label:setText( Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_COLOR_G", string.format( "%.2f", Engine.DvarFloat( "demo_lightmanMarkerLightColorG" ) ) ) )
	f29_arg0.colorBValue.label:setText( Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_COLOR_B", string.format( "%.2f", Engine.DvarFloat( "demo_lightmanMarkerLightColorB" ) ) ) )
end

local f0_local22 = function ( f30_arg0, f30_arg1 )
	Engine.SetDvar( f30_arg0.m_dvarName, f30_arg1 )
	local f30_local0 = f30_arg0:getParent()
	if f30_local0 ~= nil then
		local f30_local1 = f30_local0:getParent()
		if f30_local1 ~= nil then
			f0_local21( f30_local1, nil )
			Engine.Exec( f30_local1.controller, "demo_updatelightmanmarkerparameters " .. Engine.GetHighlightedCameraMarker() )
		end
	end
end

local f0_local23 = function ( f31_arg0 )
	Engine.SetDvar( f31_arg0.parentSelectorButton.m_dvarName, f31_arg0.value )
	local f31_local0 = f31_arg0.parentSelectorButton:getParent()
	if f31_local0 ~= nil then
		local f31_local1 = f31_local0:getParent()
		if f31_local1 ~= nil and f31_local1.creatingLightModeButton ~= true and f31_local1.creatingLightIntensityButton ~= true then
			f0_local21( f31_local1, {
				name = "demo_lightman_marker_options_update",
				controller = f31_local1.controller
			} )
			Engine.Exec( f31_local1.controller, "demo_updatelightmanmarkerparameters " .. Engine.GetHighlightedCameraMarker() )
		end
	end
end

local f0_local24 = function ( f32_arg0, f32_arg1 )
	local f32_local0 = Engine.GetHighlightedCameraMarker()
	Engine.Exec( f32_arg1.controller, "demo_updatelightmanmarkerparameters " .. f32_local0 )
	Engine.Exec( f32_arg1.controller, "demo_switchlightmanmarker " .. f32_local0 .. " 0" )
end

local f0_local25 = function ( f33_arg0, f33_arg1 )
	local f33_local0 = Engine.GetHighlightedCameraMarker()
	Engine.Exec( f33_arg1.controller, "demo_updatelightmanmarkerparameters " .. f33_local0 )
	Engine.Exec( f33_arg1.controller, "demo_switchlightmanmarker " .. f33_local0 .. " 1" )
end

local f0_local26 = function ( f34_arg0, f34_arg1 )
	Engine.Exec( f34_arg1.controller, "demo_updatelightmanmarkerparameters " .. Engine.GetHighlightedCameraMarker() )
	f0_local16( f34_arg0, f34_arg1 )
end

LUI.createMenu.Demo_Lightman_Marker_Options = function ( f35_arg0 )
	local f35_local0 = CoD.Menu.NewSmallPopup( "Demo_Lightman_Marker_Options" )
	f35_local0:setLeftRight( false, false, -CoD.LightmanPopupWidth / 2, CoD.LightmanPopupWidth / 2 )
	f35_local0:setTopBottom( false, false, (-CoD.LightmanPopupHeight - CoD.LightmanPopupHeightOffset) / 2, (CoD.LightmanPopupHeight + CoD.LightmanPopupHeightOffset) / 2 )
	f35_local0.smallPopupBackground:setLeftRight( false, false, -CoD.LightmanPopupWidth / 2 - CoD.LightmanPopupWidthOffset - 10, CoD.LightmanPopupWidth / 2 + CoD.LightmanPopupWidthOffset + 10 )
	f35_local0.smallPopupBackground:setTopBottom( false, false, -CoD.LightmanPopupHeight / 2 - CoD.LightmanPopupHeightOffset - 10, CoD.LightmanPopupHeight / 2 + 10 )
	f35_local0.controller = f35_arg0
	f35_local0:setOwner( f35_arg0 )
	f35_local0:addSelectButton()
	f35_local0:addBackButton( Engine.Localize( "MPUI_DONE" ) )
	f35_local0:registerEventHandler( "button_prompt_back", f0_local26 )
	f35_local0:registerEventHandler( "demo_lightman_marker_options_update", f0_local21 )
	local f35_local1 = 0
	local f35_local2 = CoD.textSize.Condensed
	local f35_local3 = 240
	f35_local0.leftTopButtonBar = LUI.UIHorizontalList.new( {
		left = f35_local1,
		top = -30,
		right = 0,
		bottom = 60,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Condensed,
		alignment = LUI.Alignment.Left
	} )
	f35_local0:addElement( f35_local0.leftTopButtonBar )
	f35_local0.leftTopButtonBar:addElement( CoD.ButtonPrompt.new( "shoulderl", "", f35_local0, "switch_lightman_marker_previous" ) )
	f35_local0:registerEventHandler( "switch_lightman_marker_previous", f0_local24 )
	f35_local0.rightTopButtonBar = LUI.UIHorizontalList.new( {
		left = 0,
		top = -30,
		right = -f35_local1,
		bottom = 60,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Condensed,
		alignment = LUI.Alignment.Right
	} )
	f35_local0:addElement( f35_local0.rightTopButtonBar )
	f35_local0.rightTopButtonBar:addElement( CoD.ButtonPrompt.new( "shoulderr", "", f35_local0, "switch_lightman_marker_next" ) )
	f35_local0:registerEventHandler( "switch_lightman_marker_next", f0_local25 )
	f35_local0.messageText = LUI.UIText.new( {
		left = 0,
		top = f35_local1,
		right = 0,
		bottom = f35_local1 + f35_local2,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.fonts.Big,
		alignment = LUI.Alignment.Center
	} )
	f35_local0.messageText:setText( Engine.ToUpper( Engine.Localize( "MENU_DEMO_LIGHTMAN_MARKER_NUMBER", Engine.GetHighlightedCameraMarker() + 1 ) ) )
	f35_local0:addElement( f35_local0.messageText )
	f35_local0.buttonList = CoD.ButtonList.new( {
		left = f35_local1,
		top = f35_local1 + f35_local2 + 10,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	f35_local0:addElement( f35_local0.buttonList )
	f35_local0.creatingLightModeButton = true
	f35_local0.lightMode = f35_local0.buttonList:addDvarLeftRightSelector( f35_arg0, Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_MODE" ), "demo_lightmanMarkerLightMode", nil, f35_local3 )
	local f35_local4 = f35_local0.lightMode
	local f35_local5 = {}
	local f35_local6 = Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_SETTING_OMNI" )
	local f35_local7 = Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_SETTING_SPOT" )
	f35_local4.strings = f35_local6
	f35_local0.lightMode.values = {
		Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI,
		Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_SPOT
	}
	for f35_local4 = 1, #f35_local0.lightMode.strings, 1 do
		f35_local0.lightMode:addChoice( f35_arg0, Engine.Localize( f35_local0.lightMode.strings[f35_local4] ), f35_local0.lightMode.values[f35_local4], nil, f0_local23 )
	end
	f35_local0.creatingLightModeButton = false
	f35_local0.creatingLightIntensityButton = true
	f35_local0.lightIntensity = f35_local0.buttonList:addDvarLeftRightSelector( f35_arg0, Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_INTENSITY" ), "demo_lightmanMarkerLightIntensity", nil, f35_local3 )
	f35_local0.lightIntensity.values = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10
	}
	for f35_local4 = 1, #f35_local0.lightIntensity.values, 1 do
		f35_local0.lightIntensity:addChoice( f35_arg0, Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_INTENSITY_VALUE", f35_local0.lightIntensity.values[f35_local4] ), f35_local0.lightIntensity.values[f35_local4], nil, f0_local23 )
	end
	f35_local0.creatingLightIntensityButton = false
	f35_local0.rangeValue = f35_local0.buttonList:addDvarLeftRightSlider( f35_arg0, Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_RANGE", string.format( "%d", Engine.DvarFloat( "demo_lightmanMarkerLightRange" ) ) ), "demo_lightmanMarkerLightRange", 10, 1500, nil, f35_local3 )
	f35_local0.rangeValue:setSliderCallback( f0_local22 )
	f35_local0.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	f35_local0.colorRValue = f35_local0.buttonList:addDvarLeftRightSlider( f35_arg0, Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_COLOR_R", string.format( "%.2f", Engine.DvarFloat( "demo_lightmanMarkerLightColorR" ) ) ), "demo_lightmanMarkerLightColorR", 0, 1, nil, f35_local3 )
	f35_local0.colorRValue:setSliderCallback( f0_local22 )
	f35_local0.colorGValue = f35_local0.buttonList:addDvarLeftRightSlider( f35_arg0, Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_COLOR_G", string.format( "%.2f", Engine.DvarFloat( "demo_lightmanMarkerLightColorG" ) ) ), "demo_lightmanMarkerLightColorG", 0, 1, nil, f35_local3 )
	f35_local0.colorGValue:setSliderCallback( f0_local22 )
	f35_local0.colorBValue = f35_local0.buttonList:addDvarLeftRightSlider( f35_arg0, Engine.Localize( "MENU_DEMO_LIGHTMAN_LIGHT_COLOR_B", string.format( "%.2f", Engine.DvarFloat( "demo_lightmanMarkerLightColorB" ) ) ), "demo_lightmanMarkerLightColorB", 0, 1, nil, f35_local3 )
	f35_local0.colorBValue:setSliderCallback( f0_local22 )
	f35_local0.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	f35_local0.repositionCamera = f35_local0.buttonList:addButton( Engine.Localize( "MENU_DEMO_LIGHTMAN_MARKER_REPOSITION" ) )
	f35_local0.repositionCamera:setActionEventName( "reposition_camera" )
	f35_local0:registerEventHandler( "reposition_camera", f0_local18 )
	f35_local0.removeMarker = f35_local0.buttonList:addButton( Engine.Localize( "MENU_DEMO_LIGHTMAN_MARKER_REMOVE" ) )
	f35_local0.removeMarker:setActionEventName( "remove_marker" )
	f35_local0:registerEventHandler( "remove_marker", f0_local19 )
	f35_local0.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	f35_local0.removeAllMarkers = f35_local0.buttonList:addButton( Engine.Localize( "MENU_DEMO_LIGHTMAN_MARKER_REMOVE_ALL" ) )
	f35_local0.removeAllMarkers:setActionEventName( "remove_all_markers" )
	f35_local0:registerEventHandler( "remove_all_markers", f0_local20 )
	f35_local0.buttonList:processEvent( {
		name = "gain_focus"
	} )
	f35_local0:processEvent( {
		name = "demo_lightman_marker_options_update",
		controller = f35_arg0
	} )
	return f35_local0
end

CoD.DemoPopup.OpenLightmanMarkerOptionsPopup = function ( f36_arg0, f36_arg1 )
	f36_arg0:openPopup( "Demo_Lightman_Marker_Options", f36_arg1.controller )
end

