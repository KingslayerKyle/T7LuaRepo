-- 143202b5d75220397ec187b25cd7c9ac
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics2" )
require( "ui.uieditor.widgets.playercard.IdentityBadge" )
require( "ui.uieditor.widgets.Demo.SegmentButton" )
require( "ui.uieditor.widgets.Demo.SegmentInformation" )

CoD.ManageSegments_SegmentButtonWidth = 140
CoD.ManageSegments_SegmentButtonHeight = 80
CoD.ManageSegments_SegmentButtonSpacing = 5
CoD.ManageSegments_MaxSegments = 20
CoD.ManageSegments_MaxSegmentsPerRow = 4
CoD.ManageSegments_NumRows = CoD.ManageSegments_MaxSegments / CoD.ManageSegments_MaxSegmentsPerRow
CoD.ManageSegments_TotalWidth = CoD.ManageSegments_MaxSegmentsPerRow * CoD.ManageSegments_SegmentButtonWidth + (CoD.ManageSegments_MaxSegmentsPerRow - 1) * CoD.ManageSegments_SegmentButtonSpacing
CoD.ManageSegments_TotalHeight = CoD.ManageSegments_SegmentButtonHeight * CoD.ManageSegments_NumRows + CoD.ManageSegments_SegmentButtonSpacing * (CoD.ManageSegments_NumRows - 1)
CoD.ManageSegments_TimelineHeight = 8
CoD.ManageSegments_TimelineToButtonGridSpacing = 25
CoD.ManageSegments_TimelineBlockSpacing = 3
CoD.ManageSegments_TimelineTop = CoD.ManageSegments_TotalHeight / 2 + CoD.ManageSegments_TimelineToButtonGridSpacing - CoD.ManageSegments_TimelineHeight
CoD.ManageSegments_TimelineMarkerWidth = 1
CoD.ManageSegments_TimelineMarkerHeight = 20
local f0_local0 = function ( f1_arg0 )
	local f1_local0 = Engine.GetDemoSegmentCount()
	local f1_local1 = Engine.GetDemoSegmentInformation( 0, "totalClipDuration" )
	local f1_local2 = CoD.ManageSegments_TotalWidth - CoD.ManageSegments_TimelineBlockSpacing * (f1_local0 - 1)
	local f1_local3 = f1_local2 / f1_local0
	local f1_local4 = CoD.ManageSegments_TimelineTop
	if f1_local0 <= 0 then
		return 
	end
	f1_arg0.timelineContainer = LUI.UIContainer.new()
	f1_arg0.timelineContainer:setLeftRight( true, false, 125, CoD.ManageSegments_TotalWidth + 125 )
	f1_arg0:addElement( f1_arg0.timelineContainer )
	local f1_local5 = LUI.UIImage.new()
	f1_local5:setLeftRight( true, false, 0, CoD.ManageSegments_TimelineMarkerWidth )
	f1_local5:setTopBottom( false, false, f1_local4 + CoD.ManageSegments_TimelineHeight - CoD.ManageSegments_TimelineMarkerHeight / 2, f1_local4 + CoD.ManageSegments_TimelineHeight + CoD.ManageSegments_TimelineMarkerHeight / 2 )
	f1_local5:setRGB( 1, 1, 1 )
	f1_local5:setAlpha( 1 )
	f1_arg0.timelineContainer:addElement( f1_local5 )
	local f1_local6 = "00:00"
	local f1_local7 = LUI.UIText.new()
	f1_local7:setLeftRight( true, false, -15, 100 )
	f1_local7:setTopBottom( false, false, f1_local4 + CoD.ManageSegments_TimelineHeight + 8, f1_local4 + CoD.ManageSegments_TimelineHeight + 8 + CoD.textSize.ExtraSmall )
	f1_local7:setRGB( 1, 1, 1 )
	f1_local7:setAlpha( 1 )
	f1_local7:setFont( CoD.fonts.ExtraSmall )
	f1_local7:setText( f1_local6 )
	f1_arg0.timelineContainer:addElement( f1_local7 )
	local f1_local8 = LUI.UIImage.new()
	f1_local8:setLeftRight( true, false, CoD.ManageSegments_TotalWidth, CoD.ManageSegments_TotalWidth + CoD.ManageSegments_TimelineMarkerWidth )
	f1_local8:setTopBottom( false, false, f1_local4 + CoD.ManageSegments_TimelineHeight - CoD.ManageSegments_TimelineMarkerHeight / 2, f1_local4 + CoD.ManageSegments_TimelineHeight + CoD.ManageSegments_TimelineMarkerHeight / 2 )
	f1_local8:setRGB( 1, 1, 1 )
	f1_local8:setAlpha( 1 )
	f1_arg0.timelineContainer:addElement( f1_local8 )
	local f1_local9 = LUI.UIText.new()
	f1_local9:setLeftRight( true, false, CoD.ManageSegments_TotalWidth - 15, CoD.ManageSegments_TotalWidth + 100 )
	f1_local9:setTopBottom( false, false, f1_local4 + CoD.ManageSegments_TimelineHeight + 8, f1_local4 + CoD.ManageSegments_TimelineHeight + 8 + CoD.textSize.ExtraSmall )
	f1_local9:setRGB( 1, 1, 1 )
	f1_local9:setAlpha( 1 )
	f1_local9:setFont( CoD.fonts.ExtraSmall )
	f1_local9:setText( Engine.GetDemoSegmentInformation( 0, "totalClipDurationTimeDisplay" ) )
	f1_arg0.timelineContainer:addElement( f1_local9 )
	f1_arg0.timelineContainer.timeline = LUI.UIHorizontalList.new()
	f1_arg0.timelineContainer.timeline:setLeftRight( true, false, 0, CoD.ManageSegments_TotalWidth )
	f1_arg0.timelineContainer.timeline:setTopBottom( false, false, f1_local4, f1_local4 + CoD.ManageSegments_TimelineHeight )
	f1_arg0.timelineContainer.timeline:setSpacing( CoD.ManageSegments_TimelineBlockSpacing )
	f1_arg0.timelineContainer:addElement( f1_arg0.timelineContainer.timeline )
	local f1_local10 = 2
	for f1_local11 = 1, f1_local0, 1 do
		local f1_local14 = Engine.GetDemoSegmentInformation( f1_local11 - 1, "duration" ) / f1_local1 * f1_local2
		local f1_local15 = LUI.UIContainer.new()
		f1_local15:setLeftRight( true, false, 0, f1_local14 )
		f1_local15:setTopBottom( true, false, 0, CoD.ManageSegments_TimelineHeight )
		f1_local15.image = LUI.UIImage.new()
		f1_local15.image:setLeftRight( true, true, f1_local10 / 2, -f1_local10 / 2 )
		f1_local15.image:setTopBottom( true, true, f1_local10 / 2, -f1_local10 / 2 )
		f1_local15.image:setRGB( 1, 1, 1 )
		f1_local15.image:setAlpha( 1 )
		f1_local15:addElement( f1_local15.image )
		f1_local15.border = CoD.BorderT6.new( f1_local10, 0.9, 0.5, 0.1 )
		f1_local15.border:setAlpha( 0 )
		f1_local15:addElement( f1_local15.border )
		f1_local15.focussed = false
		f1_arg0.timelineContainer.timeline[f1_local11] = f1_local15
		f1_arg0.timelineContainer.timeline:addElement( f1_local15 )
	end
end

CoD.ManageSegments_Timeline_RefreshState = function ( f2_arg0, f2_arg1, f2_arg2 )
	if not f2_arg1 then
		return 
	end
	local f2_local0 = GetSelectedSegmentModel()
	local f2_local1 = Engine.GetModelValue( Engine.GetModel( f2_arg1, "disabled" ) )
	local f2_local2 = Engine.GetModelValue( Engine.GetModel( f2_arg1, "segmentNumber" ) )
	if not f2_arg2 then
		if f2_arg1 == f2_local0 then
			
		elseif not f2_local1 and f2_arg0.timelineContainer ~= nil then
			f2_arg0.timelineContainer.timeline[f2_local2].border:setAlpha( 0 )
			f2_arg0.timelineContainer.timeline[f2_local2].image:setRGB( 1, 1, 1 )
			f2_arg0.timelineContainer.timeline[f2_local2].image:setAlpha( 1 )
		end
	elseif f2_arg1 == f2_local0 then
		if f2_arg0.timelineContainer ~= nil then
			f2_arg0.timelineContainer.timeline[f2_local2].border:setRGB( 0.9, 0.5, 0.1 )
			f2_arg0.timelineContainer.timeline[f2_local2].border:setAlpha( 1 )
			f2_arg0.timelineContainer.timeline[f2_local2].image:setRGB( 0.9, 0.5, 0.1 )
			f2_arg0.timelineContainer.timeline[f2_local2].image:setAlpha( 1 )
		end
	elseif not f2_local1 and f2_arg0.timelineContainer ~= nil then
		f2_arg0.timelineContainer.timeline[f2_local2].border:setRGB( 0.9, 0.5, 0.1 )
		f2_arg0.timelineContainer.timeline[f2_local2].border:setAlpha( 1 )
		f2_arg0.timelineContainer.timeline[f2_local2].image:setRGB( 1, 1, 1 )
		f2_arg0.timelineContainer.timeline[f2_local2].image:setAlpha( 1 )
	else
		
	end
	if f2_arg0.timelineContainer ~= nil and not f2_local1 then
		f2_arg0.timelineContainer.timeline[f2_local2].focussed = f2_arg2
	end
end

local f0_local1 = function ( f3_arg0 )
	if f3_arg0.timelineContainer ~= nil then
		f3_arg0.timelineContainer:close()
	end
	f0_local0( f3_arg0 )
end

CoD.ManageSegments_Timeline_RefreshStateAfterMove = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	if f4_arg3 then
		f0_local1( f4_arg0 )
		CoD.ManageSegments_Timeline_RefreshState( f4_arg0, f4_arg2, false )
		CoD.ManageSegments_Timeline_RefreshState( f4_arg0, f4_arg1, true )
	else
		local f4_local0 = Engine.GetModelValue
		local f4_local1 = Engine.GetModel
		local f4_local2 = f4_arg2
		CoD.ManageSegments_Timeline_RefreshState( f4_arg0, f4_arg2, f4_arg0.timelineContainer.timeline[f4_local0( f4_local1( f4_arg2, "segmentNumber" ) )].focussed )
	end
end

CoD.SegmentsOptionsPopupHeight = 256
CoD.SegmentsOptionsPopupHeightOffset = 40
local f0_local2 = function ( f5_arg0, f5_arg1 )
	Engine.ExecNow( f5_arg1.controller, "demo_deletesegment " .. f5_arg0.segmentIndex )
	f0_local1( f5_arg0.occludedMenu )
	f5_arg0:setPreviousMenu( nil )
	f5_arg0:goBack( f5_arg1.controller )
	ManageSegmentsRefresh( f5_arg0.occludedMenu )
end

LUI.createMenu.NewDeleteSegment = function ( f6_arg0 )
	local f6_local0 = CoD.Popup.SetupPopupChoice( "NewDeleteSegment", f6_arg0 )
	f6_local0:setTopBottom( false, false, (-CoD.SegmentsOptionsPopupHeight - CoD.SegmentsOptionsPopupHeightOffset) / 2, (CoD.SegmentsOptionsPopupHeight + CoD.SegmentsOptionsPopupHeightOffset) / 2 )
	f6_local0.smallPopupBackground:setTopBottom( false, false, -CoD.SegmentsOptionsPopupHeight / 2 - CoD.SegmentsOptionsPopupHeightOffset - 10, CoD.SegmentsOptionsPopupHeight / 2 + 10 )
	f6_local0.model = CoD.perController[f6_arg0].selectedSegment
	f6_local0.segmentIndex = Engine.GetModelValue( Engine.GetModel( f6_local0.model, "segmentNumber" ) ) - 1
	f6_local0.title:setText( Engine.Localize( "MENU_WARNING" ) )
	f6_local0.msg:setText( Engine.Localize( "MENU_DELETE_SEGMENT_CONFIRMATION" ) )
	f6_local0:addBackButton()
	f6_local0.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	f6_local0.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	f6_local0.choiceA:setActionEventName( "delete_segment_accept" )
	f6_local0.choiceB:processEvent( {
		name = "gain_focus"
	} )
	f6_local0:registerEventHandler( "delete_segment_accept", f0_local2 )
	return f6_local0
end

CoD.DEMO_CLIP_TRANSITION_NONE = 0
CoD.DEMO_CLIP_TRANSITION_FADE = 1
local f0_local3 = function ( f7_arg0, f7_arg1 )
	f7_arg0:goBack( f7_arg1.controller )
	ManageSegmentsRefresh( f7_arg0.occludedMenu )
	CoD.perController[f7_arg1.controller].selectedSegment = nil
end

local f0_local4 = function ( f8_arg0 )
	Engine.ExecNow( f8_arg0.controller, "demo_switchtransition " .. f8_arg0.segmentIndex .. " " .. f8_arg0.value )
	Engine.SetModelValue( Engine.GetModel( f8_arg0.selectedSegmentModel, "transitionText" ), Engine.Localize( "MENU_TRANSITION" ) .. Engine.GetDemoSegmentInformation( f8_arg0.segmentIndex, "transition" ) )
end

local f0_local5 = function ( f9_arg0, f9_arg1 )
	Engine.SetModelValue( Engine.GetModel( f9_arg0.model, "name" ), Engine.GetDemoSegmentInformation( f9_arg0.segmentIndex, "name" ) )
end

local f0_local6 = function ( f10_arg0, f10_arg1 )
	Engine.Exec( f10_arg1.controller, "demo_keyboard segmentName " .. f10_arg0.segmentIndex )
end

local f0_local7 = function ( f11_arg0, f11_arg1 )
	f11_arg0:goBack( f11_arg1.controller )
	CoD.InGameMenu.CloseAllInGameMenus( f11_arg0.occludedMenu, {
		name = "close_all_ingame_menus",
		controller = f11_arg1.controller
	} )
	Engine.Exec( f11_arg1.controller, "demo_previewsegment " .. f11_arg0.segmentIndex )
end

local f0_local8 = function ( f12_arg0, f12_arg1 )
	f12_arg0:openMenu( "NewDeleteSegment", f12_arg1.controller )
	f12_arg0:close()
end

local f0_local9 = function ( f13_arg0, f13_arg1 )
	Engine.SetModelValue( Engine.CreateModel( f13_arg0.model, "selected" ), true )
	f0_local3( f13_arg0, f13_arg1 )
end

LUI.createMenu.NewSegmentOptions = function ( f14_arg0 )
	local f14_local0 = CoD.Popup.SetupPopup( "NewSegmentOptions", f14_arg0 )
	f14_local0:setTopBottom( false, false, (-CoD.SegmentsOptionsPopupHeight - CoD.SegmentsOptionsPopupHeightOffset) / 2, (CoD.SegmentsOptionsPopupHeight + CoD.SegmentsOptionsPopupHeightOffset) / 2 )
	f14_local0.smallPopupBackground:setTopBottom( false, false, -CoD.SegmentsOptionsPopupHeight / 2 - CoD.SegmentsOptionsPopupHeightOffset - 10, CoD.SegmentsOptionsPopupHeight / 2 + 10 )
	f14_local0:addSelectButton()
	f14_local0:addBackButton()
	f14_local0:registerEventHandler( "button_prompt_back", f0_local3 )
	f14_local0:registerEventHandler( "delete_segment_confirmation", f0_local8 )
	f14_local0:registerEventHandler( "preview_segment", f0_local7 )
	f14_local0:registerEventHandler( "rename_segment", f0_local6 )
	f14_local0:registerEventHandler( "demo_keyboard_complete", f0_local5 )
	f14_local0:registerEventHandler( "setup_move_segment", f0_local9 )
	f14_local0.title:setText( Engine.Localize( "MENU_SEGMENT_OPTIONS" ) )
	f14_local0.msg:setText( Engine.Localize( "MENU_SEGMENT_OPTIONS_DESC" ) )
	f14_local0.model = CoD.perController[f14_arg0].selectedSegment
	f14_local0.segmentIndex = Engine.GetModelValue( Engine.GetModel( f14_local0.model, "segmentNumber" ) ) - 1
	local f14_local1 = f14_local0.segmentIndex == Engine.GetDemoSegmentCount() - 1
	local f14_local2 = CoD.ButtonList.new( {} )
	f14_local2:setLeftRight( true, true, 0, 0 )
	if f14_local1 then
		f14_local2:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 4 - 20, 0 )
	else
		f14_local2:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 5 - 20, 0 )
	end
	f14_local2:setSpacing( 0 )
	f14_local0:addElement( f14_local2 )
	local f14_local3 = f14_local2:addButton( Engine.Localize( "MPUI_PREVIEW" ) )
	f14_local3:setActionEventName( "preview_segment" )
	f14_local3:processEvent( {
		name = "gain_focus"
	} )
	local f14_local4 = f14_local2:addButton( Engine.Localize( "MENU_MOVE" ) )
	f14_local4:setActionEventName( "setup_move_segment" )
	if not f14_local1 then
		local f14_local5 = f14_local2:addLeftRightSelector( Engine.Localize( "MENU_CHANGE_TRANSITION" ), tonumber( Engine.GetDemoSegmentInformation( f14_local0.segmentIndex, "transitionValue" ) ) )
		local f14_local6 = {}
		local f14_local7 = Engine.Localize( "MENU_DEMO_TRANSITION_CUT" )
		local f14_local8 = Engine.Localize( "MENU_DEMO_TRANSITION_FADE" )
		f14_local5.strings = f14_local7
		f14_local5.values = {
			CoD.DEMO_CLIP_TRANSITION_NONE,
			CoD.DEMO_CLIP_TRANSITION_FADE
		}
		for f14_local6 = 1, #f14_local5.strings, 1 do
			f14_local5:addChoice( Engine.Localize( f14_local5.strings[f14_local6] ), f0_local4, {
				value = f14_local5.values[f14_local6],
				controller = f14_arg0,
				parentButton = f14_local5,
				segmentIndex = f14_local0.segmentIndex,
				selectedSegmentModel = f14_local0.model
			} )
		end
	end
	local f14_local9 = f14_local2:addButton( Engine.Localize( "MENU_RENAME" ) )
	f14_local9:setActionEventName( "rename_segment" )
	local f14_local5 = f14_local2:addButton( Engine.Localize( "MENU_DELETE" ) )
	f14_local5:setActionEventName( "delete_segment_confirmation" )
	return f14_local0
end

local f0_local10 = function ( f15_arg0, f15_arg1 )
	Engine.ExecNow( f15_arg1.controller, "demo_mergesegments" )
	f0_local1( f15_arg0.occludedMenu )
	f15_arg0:setPreviousMenu( nil )
	f15_arg0:goBack( f15_arg1.controller )
	ManageSegmentsRefresh( f15_arg0.occludedMenu )
end

LUI.createMenu.NewMergeAllSegments = function ( f16_arg0 )
	local f16_local0 = CoD.Popup.SetupPopupChoice( "NewMergeAllSegments", f16_arg0 )
	f16_local0.title:setText( Engine.Localize( "MENU_WARNING" ) )
	f16_local0.msg:setText( Engine.Localize( "MENU_MERGE_ALL_SEGMENTS_CONFIRMATION" ) )
	f16_local0:addBackButton()
	f16_local0.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	f16_local0.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	f16_local0.choiceA:setActionEventName( "merge_all_segments_accept" )
	f16_local0.choiceB:processEvent( {
		name = "gain_focus"
	} )
	f16_local0:registerEventHandler( "merge_all_segments_accept", f0_local10 )
	return f16_local0
end

local f0_local11 = function ( f17_arg0, f17_arg1 )
	Engine.ExecNow( f17_arg1.controller, "demo_deleteclip" )
	f0_local1( f17_arg0.occludedMenu )
	f17_arg0:setPreviousMenu( nil )
	f17_arg0:goBack( f17_arg1.controller )
	ManageSegmentsRefresh( f17_arg0.occludedMenu )
end

LUI.createMenu.NewDeleteAllSegments = function ( f18_arg0 )
	local f18_local0 = CoD.Popup.SetupPopupChoice( "NewDeleteAllSegments", f18_arg0 )
	f18_local0.title:setText( Engine.Localize( "MENU_WARNING" ) )
	f18_local0.msg:setText( Engine.Localize( "MENU_DELETE_ALL_SEGMENTS_CONFIRMATION" ) )
	f18_local0:addBackButton()
	f18_local0.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	f18_local0.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	f18_local0.choiceA:setActionEventName( "delete_all_segments_accept" )
	f18_local0.choiceB:processEvent( {
		name = "gain_focus"
	} )
	f18_local0:registerEventHandler( "delete_all_segments_accept", f0_local11 )
	return f18_local0
end

local f0_local12 = function ( f19_arg0, f19_arg1 )
	f19_arg0:openMenu( "NewMergeAllSegments", f19_arg1.controller )
	f19_arg0:close()
end

local f0_local13 = function ( f20_arg0, f20_arg1 )
	f20_arg0:openMenu( "NewDeleteAllSegments", f20_arg1.controller )
	f20_arg0:close()
end

LUI.createMenu.NewClipOptions = function ( f21_arg0 )
	local f21_local0 = CoD.Menu.NewSmallPopup( "NewClipOptions" )
	f21_local0:setOwner( f21_arg0 )
	f21_local0:addSelectButton()
	f21_local0:addBackButton()
	f21_local0:registerEventHandler( "merge_all_segments_confirmation", f0_local12 )
	f21_local0:registerEventHandler( "delete_all_segments_confirmation", f0_local13 )
	local f21_local1 = 5
	local self = LUI.UIText.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, false, f21_local1, f21_local1 + CoD.textSize.Big )
	self:setFont( CoD.fonts.Big )
	self:setAlignment( LUI.Alignment.Left )
	self:setText( Engine.Localize( "MENU_CLIP_OPTIONS" ) )
	f21_local0:addElement( self )
	local f21_local3 = CoD.ButtonList.new( {} )
	f21_local3:setLeftRight( true, true, 0, 0 )
	f21_local3:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10, 0 )
	f21_local0:addElement( f21_local3 )
	local f21_local4 = f21_local3:addButton( Engine.Localize( "MENU_MERGE_ALL_SEGMENTS" ) )
	f21_local4:setActionEventName( "merge_all_segments_confirmation" )
	f21_local4:processEvent( {
		name = "gain_focus"
	} )
	if Engine.GetDemoSegmentCount() <= 1 then
		f21_local4:disable()
	end
	local f21_local5 = f21_local3:addButton( Engine.Localize( "MENU_DELETE_ALL_SEGMENTS" ) )
	f21_local5:setActionEventName( "delete_all_segments_confirmation" )
	return f21_local0
end

local f0_local14 = function ( f22_arg0, f22_arg1 )
	f0_local0( f22_arg0 )
end

local f0_local15 = function ( f23_arg0, f23_arg1 )
	Engine.Exec( f23_arg1, "setupThumbnailsForManageSegments" )
end

LUI.createMenu.ManageSegments = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ManageSegments" )
	if f0_local14 then
		f0_local14( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ManageSegments.buttonPrompts" )
	local f24_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( f24_local1, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 0, 0 )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( f24_local1, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, false, -11, 1285 )
	FEButtonPanelShaderContainer0:setTopBottom( true, false, 115.91, 733.91 )
	FEButtonPanelShaderContainer0:setAlpha( 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( f24_local1, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( "MENU_DEMO_MANAGE_SEGMENTS" ) ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local StartMenulineGraphics0 = CoD.StartMenu_lineGraphics.new( f24_local1, controller )
	StartMenulineGraphics0:setLeftRight( true, false, 2, 70 )
	StartMenulineGraphics0:setTopBottom( true, false, -13, 657 )
	self:addElement( StartMenulineGraphics0 )
	self.StartMenulineGraphics0 = StartMenulineGraphics0
	
	local MenuTitleBackground = LUI.UIImage.new()
	MenuTitleBackground:setLeftRight( true, true, 0, 0 )
	MenuTitleBackground:setTopBottom( false, false, -336, -276 )
	MenuTitleBackground:setRGB( 0.12, 0.13, 0.19 )
	MenuTitleBackground:setAlpha( 0 )
	self:addElement( MenuTitleBackground )
	self.MenuTitleBackground = MenuTitleBackground
	
	local TitleText = LUI.UIText.new()
	TitleText:setLeftRight( true, false, 64, 1280 )
	TitleText:setTopBottom( true, false, 31, 75 )
	TitleText:setAlpha( 0 )
	TitleText:setText( Engine.Localize( LocalizeToUpperString( "MENU_DEMO_MANAGE_SEGMENTS" ) ) )
	TitleText:setTTF( "fonts/escom.ttf" )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local ButtonBarBackground = LUI.UIImage.new()
	ButtonBarBackground:setLeftRight( true, true, -3.63, 0 )
	ButtonBarBackground:setTopBottom( false, false, 302, 332 )
	ButtonBarBackground:setRGB( 0.12, 0.13, 0.19 )
	ButtonBarBackground:setAlpha( 0 )
	self:addElement( ButtonBarBackground )
	self.ButtonBarBackground = ButtonBarBackground
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local StartMenulineGraphics20 = CoD.StartMenu_lineGraphics2.new( f24_local1, controller )
	StartMenulineGraphics20:setLeftRight( true, false, 1203, 1267 )
	StartMenulineGraphics20:setTopBottom( true, false, 112, 698.94 )
	self:addElement( StartMenulineGraphics20 )
	self.StartMenulineGraphics20 = StartMenulineGraphics20
	
	local IdentityBadge = CoD.IdentityBadge.new( f24_local1, controller )
	IdentityBadge:setLeftRight( true, false, 860, 1205 )
	IdentityBadge:setTopBottom( true, false, 25, 81 )
	self:addElement( IdentityBadge )
	self.IdentityBadge = IdentityBadge
	
	local SegmentButtonList = LUI.UIList.new( f24_local1, controller, 5, 0, nil, false, false, 0, 0, false, true )
	SegmentButtonList:makeFocusable()
	SegmentButtonList:setLeftRight( true, false, 70, 790 )
	SegmentButtonList:setTopBottom( true, false, 123, 538 )
	SegmentButtonList:setDataSource( "DemoSegments" )
	SegmentButtonList:setWidgetType( CoD.SegmentButton )
	SegmentButtonList:setHorizontalCount( 5 )
	SegmentButtonList:setVerticalCount( 4 )
	SegmentButtonList:setSpacing( 5 )
	SegmentButtonList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f26_local0 = nil
		ManageSegmentsUpdateTimeline( self, element, controller, "gain_focus", f24_local1 )
		return f26_local0
	end )
	SegmentButtonList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f27_local0 = nil
		ManageSegmentsUpdateTimeline( self, element, controller, "lose_focus", f24_local1 )
		return f27_local0
	end )
	SegmentButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f28_local0 = nil
		if element.gainFocus then
			f28_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f28_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f24_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f24_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, f24_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f28_local0
	end )
	SegmentButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f29_local0 = nil
		if element.loseFocus then
			f29_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f29_local0 = element.super:loseFocus( event )
		end
		return f29_local0
	end )
	f24_local1:AddButtonCallbackFunction( SegmentButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3 )
		ManageSegmentsSelectAction( self, f30_arg0, f30_arg2 )
		return true
	end, function ( f31_arg0, f31_arg1, f31_arg2 )
		CoD.Menu.SetButtonLabel( f31_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f24_local1:AddButtonCallbackFunction( SegmentButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
		if not IsSegmentSelectedForMove( f32_arg0, f32_arg2 ) then
			return true
		elseif IsSegmentSelectedForMove( f32_arg0, f32_arg2 ) then
			return true
		else
			
		end
	end, function ( f33_arg0, f33_arg1, f33_arg2 )
		if not IsSegmentSelectedForMove( f33_arg0, f33_arg2 ) then
			CoD.Menu.SetButtonLabel( f33_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT_CLIP" )
			return true
		elseif IsSegmentSelectedForMove( f33_arg0, f33_arg2 ) then
			CoD.Menu.SetButtonLabel( f33_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PLACE_SEGMENT" )
			return true
		else
			return false
		end
	end, false )
	f24_local1:AddButtonCallbackFunction( SegmentButtonList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
		if not IsSegmentSelectedForMove( f34_arg0, f34_arg2 ) then
			ManageSegmentsFilmOptions( self, f34_arg0, f34_arg2, "", f34_arg1 )
			return true
		else
			
		end
	end, function ( f35_arg0, f35_arg1, f35_arg2 )
		CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_CLIP_OPTIONS" )
		if not IsSegmentSelectedForMove( f35_arg0, f35_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	f24_local1:AddButtonCallbackFunction( SegmentButtonList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		if not IsSegmentSelectedForMove( f36_arg0, f36_arg2 ) then
			ManageSegmentsPreviewFilm( self, f36_arg0, f36_arg2, "", f36_arg1 )
			return true
		else
			
		end
	end, function ( f37_arg0, f37_arg1, f37_arg2 )
		CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_PREVIEW_CLIP" )
		if not IsSegmentSelectedForMove( f37_arg0, f37_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( SegmentButtonList )
	self.SegmentButtonList = SegmentButtonList
	
	local SegmentInformation = CoD.SegmentInformation.new( f24_local1, controller )
	SegmentInformation:setLeftRight( true, false, 817.36, 1117.36 )
	SegmentInformation:setTopBottom( true, false, 123, 523 )
	self:addElement( SegmentInformation )
	self.SegmentInformation = SegmentInformation
	
	SegmentInformation:linkToElementModel( SegmentButtonList, nil, false, function ( model )
		SegmentInformation:setModel( model, controller )
	end )
	f24_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
		ManageSegmentsGoBack( self, f39_arg0, f39_arg2 )
		return true
	end, function ( f40_arg0, f40_arg1, f40_arg2 )
		CoD.Menu.SetButtonLabel( f40_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	SegmentButtonList.id = "SegmentButtonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f24_local1
	} )
	if not self:restoreState() then
		self.SegmentButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.FEButtonPanelShaderContainer0:close()
		element.cac3dTitleIntermediary0:close()
		element.StartMenulineGraphics0:close()
		element.StartMenulineGraphics20:close()
		element.IdentityBadge:close()
		element.SegmentButtonList:close()
		element.SegmentInformation:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ManageSegments.buttonPrompts" ) )
	end )
	if f0_local15 then
		f0_local15( self, controller )
	end
	return self
end

