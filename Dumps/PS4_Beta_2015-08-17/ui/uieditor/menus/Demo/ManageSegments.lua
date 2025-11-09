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
local ManageSegments_AddTimeline = function ( self )
	local segmentCount = Engine.GetDemoSegmentCount()
	local totalClipDuration = Engine.GetDemoSegmentInformation( 0, "totalClipDuration" )
	local timelineTotalWidthForAllBlocks = CoD.ManageSegments_TotalWidth - CoD.ManageSegments_TimelineBlockSpacing * (segmentCount - 1)
	local timelineWidthPerBlock = timelineTotalWidthForAllBlocks / segmentCount
	local timelineTop = CoD.ManageSegments_TimelineTop
	if segmentCount <= 0 then
		return 
	end
	self.timelineContainer = LUI.UIContainer.new()
	self.timelineContainer:setLeftRight( true, false, 125, CoD.ManageSegments_TotalWidth + 125 )
	self:addElement( self.timelineContainer )
	local startLine = LUI.UIImage.new()
	startLine:setLeftRight( true, false, 0, CoD.ManageSegments_TimelineMarkerWidth )
	startLine:setTopBottom( false, false, timelineTop + CoD.ManageSegments_TimelineHeight - CoD.ManageSegments_TimelineMarkerHeight / 2, timelineTop + CoD.ManageSegments_TimelineHeight + CoD.ManageSegments_TimelineMarkerHeight / 2 )
	startLine:setRGB( 1, 1, 1 )
	startLine:setAlpha( 1 )
	self.timelineContainer:addElement( startLine )
	local time = "00:00"
	local startLineText = LUI.UIText.new()
	startLineText:setLeftRight( true, false, -15, 100 )
	startLineText:setTopBottom( false, false, timelineTop + CoD.ManageSegments_TimelineHeight + 8, timelineTop + CoD.ManageSegments_TimelineHeight + 8 + CoD.textSize.ExtraSmall )
	startLineText:setRGB( 1, 1, 1 )
	startLineText:setAlpha( 1 )
	startLineText:setFont( CoD.fonts.ExtraSmall )
	startLineText:setText( time )
	self.timelineContainer:addElement( startLineText )
	local endLine = LUI.UIImage.new()
	endLine:setLeftRight( true, false, CoD.ManageSegments_TotalWidth, CoD.ManageSegments_TotalWidth + CoD.ManageSegments_TimelineMarkerWidth )
	endLine:setTopBottom( false, false, timelineTop + CoD.ManageSegments_TimelineHeight - CoD.ManageSegments_TimelineMarkerHeight / 2, timelineTop + CoD.ManageSegments_TimelineHeight + CoD.ManageSegments_TimelineMarkerHeight / 2 )
	endLine:setRGB( 1, 1, 1 )
	endLine:setAlpha( 1 )
	self.timelineContainer:addElement( endLine )
	local endLineText = LUI.UIText.new()
	endLineText:setLeftRight( true, false, CoD.ManageSegments_TotalWidth - 15, CoD.ManageSegments_TotalWidth + 100 )
	endLineText:setTopBottom( false, false, timelineTop + CoD.ManageSegments_TimelineHeight + 8, timelineTop + CoD.ManageSegments_TimelineHeight + 8 + CoD.textSize.ExtraSmall )
	endLineText:setRGB( 1, 1, 1 )
	endLineText:setAlpha( 1 )
	endLineText:setFont( CoD.fonts.ExtraSmall )
	endLineText:setText( Engine.GetDemoSegmentInformation( 0, "totalClipDurationTimeDisplay" ) )
	self.timelineContainer:addElement( endLineText )
	self.timelineContainer.timeline = LUI.UIHorizontalList.new()
	self.timelineContainer.timeline:setLeftRight( true, false, 0, CoD.ManageSegments_TotalWidth )
	self.timelineContainer.timeline:setTopBottom( false, false, timelineTop, timelineTop + CoD.ManageSegments_TimelineHeight )
	self.timelineContainer.timeline:setSpacing( CoD.ManageSegments_TimelineBlockSpacing )
	self.timelineContainer:addElement( self.timelineContainer.timeline )
	local borderWidth = 2
	for i = 1, segmentCount, 1 do
		local segmentDuration = Engine.GetDemoSegmentInformation( i - 1, "duration" )
		local blockWidth = segmentDuration / totalClipDuration * timelineTotalWidthForAllBlocks
		local container = LUI.UIContainer.new()
		container:setLeftRight( true, false, 0, blockWidth )
		container:setTopBottom( true, false, 0, CoD.ManageSegments_TimelineHeight )
		container.image = LUI.UIImage.new()
		container.image:setLeftRight( true, true, borderWidth / 2, -borderWidth / 2 )
		container.image:setTopBottom( true, true, borderWidth / 2, -borderWidth / 2 )
		container.image:setRGB( 1, 1, 1 )
		container.image:setAlpha( 1 )
		container:addElement( container.image )
		container.border = CoD.BorderT6.new( borderWidth, 0.9, 0.5, 0.1 )
		container.border:setAlpha( 0 )
		container:addElement( container.border )
		container.focussed = false
		self.timelineContainer.timeline[i] = container
		self.timelineContainer.timeline:addElement( container )
	end
end

CoD.ManageSegments_Timeline_RefreshState = function ( menu, model, focused )
	if not model then
		return 
	end
	local selectedSegmentModel = GetSelectedSegmentModel()
	local isEmpty = Engine.GetModelValue( Engine.GetModel( model, "disabled" ) )
	local segmentNumber = Engine.GetModelValue( Engine.GetModel( model, "segmentNumber" ) )
	if not focused then
		if model == selectedSegmentModel then
			
		elseif not isEmpty and menu.timelineContainer ~= nil then
			menu.timelineContainer.timeline[segmentNumber].border:setAlpha( 0 )
			menu.timelineContainer.timeline[segmentNumber].image:setRGB( 1, 1, 1 )
			menu.timelineContainer.timeline[segmentNumber].image:setAlpha( 1 )
		end
	elseif model == selectedSegmentModel then
		if menu.timelineContainer ~= nil then
			menu.timelineContainer.timeline[segmentNumber].border:setRGB( 0.9, 0.5, 0.1 )
			menu.timelineContainer.timeline[segmentNumber].border:setAlpha( 1 )
			menu.timelineContainer.timeline[segmentNumber].image:setRGB( 0.9, 0.5, 0.1 )
			menu.timelineContainer.timeline[segmentNumber].image:setAlpha( 1 )
		end
	elseif not isEmpty and menu.timelineContainer ~= nil then
		menu.timelineContainer.timeline[segmentNumber].border:setRGB( 0.9, 0.5, 0.1 )
		menu.timelineContainer.timeline[segmentNumber].border:setAlpha( 1 )
		menu.timelineContainer.timeline[segmentNumber].image:setRGB( 1, 1, 1 )
		menu.timelineContainer.timeline[segmentNumber].image:setAlpha( 1 )
	else
		
	end
	if menu.timelineContainer ~= nil and not isEmpty then
		menu.timelineContainer.timeline[segmentNumber].focussed = focused
	end
end

local ManageSegments_ReAddTimeline = function ( self )
	if self.timelineContainer ~= nil then
		self.timelineContainer:close()
	end
	ManageSegments_AddTimeline( self )
end

CoD.ManageSegments_Timeline_RefreshStateAfterMove = function ( menu, toModel, fromModel, success )
	if success then
		ManageSegments_ReAddTimeline( menu )
		CoD.ManageSegments_Timeline_RefreshState( menu, fromModel, false )
		CoD.ManageSegments_Timeline_RefreshState( menu, toModel, true )
	else
		local segmentNumber = Engine.GetModelValue( Engine.GetModel( fromModel, "segmentNumber" ) )
		local focussed = menu.timelineContainer.timeline[segmentNumber].focussed
		CoD.ManageSegments_Timeline_RefreshState( menu, fromModel, focussed )
	end
end

CoD.SegmentsOptionsPopupHeight = 256
CoD.SegmentsOptionsPopupHeightOffset = 40
local NewDeleteSegment_Accept = function ( self, event )
	Engine.ExecNow( event.controller, "demo_deletesegment " .. self.segmentIndex )
	ManageSegments_ReAddTimeline( self.occludedMenu )
	self:setPreviousMenu( nil )
	self:goBack( event.controller )
	ManageSegmentsRefresh( self.occludedMenu )
end

LUI.createMenu.NewDeleteSegment = function ( controller )
	local popup = CoD.Popup.SetupPopupChoice( "NewDeleteSegment", controller )
	popup:setTopBottom( false, false, (-CoD.SegmentsOptionsPopupHeight - CoD.SegmentsOptionsPopupHeightOffset) / 2, (CoD.SegmentsOptionsPopupHeight + CoD.SegmentsOptionsPopupHeightOffset) / 2 )
	popup.smallPopupBackground:setTopBottom( false, false, -CoD.SegmentsOptionsPopupHeight / 2 - CoD.SegmentsOptionsPopupHeightOffset - 10, CoD.SegmentsOptionsPopupHeight / 2 + 10 )
	popup.model = CoD.perController[controller].selectedSegment
	popup.segmentIndex = Engine.GetModelValue( Engine.GetModel( popup.model, "segmentNumber" ) ) - 1
	popup.title:setText( Engine.Localize( "MENU_WARNING" ) )
	popup.msg:setText( Engine.Localize( "MENU_DELETE_SEGMENT_CONFIRMATION" ) )
	popup:addBackButton()
	popup.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	popup.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	popup.choiceA:setActionEventName( "delete_segment_accept" )
	popup.choiceB:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "delete_segment_accept", NewDeleteSegment_Accept )
	return popup
end

CoD.DEMO_CLIP_TRANSITION_NONE = 0
CoD.DEMO_CLIP_TRANSITION_FADE = 1
local NewSegmentOptions_Back = function ( self, event )
	self:goBack( event.controller )
	ManageSegmentsRefresh( self.occludedMenu )
	CoD.perController[event.controller].selectedSegment = nil
end

local NewSegmentOptions_SwitchTransition = function ( params )
	Engine.ExecNow( params.controller, "demo_switchtransition " .. params.segmentIndex .. " " .. params.value )
	local transition = Engine.GetDemoSegmentInformation( params.segmentIndex, "transition" )
	local transitionText = Engine.Localize( "MENU_TRANSITION" ) .. transition
	Engine.SetModelValue( Engine.GetModel( params.selectedSegmentModel, "transitionText" ), transitionText )
end

local NewSegmentOptions_KeyboardComplete = function ( self, event )
	local name = Engine.GetDemoSegmentInformation( self.segmentIndex, "name" )
	Engine.SetModelValue( Engine.GetModel( self.model, "name" ), name )
end

local NewSegmentOptions_RenameSegment = function ( self, event )
	Engine.Exec( event.controller, "demo_keyboard segmentName " .. self.segmentIndex )
end

local NewSegmentOptions_PreviewSegment = function ( self, event )
	self:goBack( event.controller )
	CoD.InGameMenu.CloseAllInGameMenus( self.occludedMenu, {
		name = "close_all_ingame_menus",
		controller = event.controller
	} )
	Engine.Exec( event.controller, "demo_previewsegment " .. self.segmentIndex )
end

local NewSegmentOptions_DeleteSegment = function ( self, event )
	self:openMenu( "NewDeleteSegment", event.controller )
	self:close()
end

local NewSegmentOptions_SetupMoveSegment = function ( self, event )
	Engine.SetModelValue( Engine.CreateModel( self.model, "selected" ), true )
	NewSegmentOptions_Back( self, event )
end

LUI.createMenu.NewSegmentOptions = function ( controller )
	local popup = CoD.Popup.SetupPopup( "NewSegmentOptions", controller )
	popup:setTopBottom( false, false, (-CoD.SegmentsOptionsPopupHeight - CoD.SegmentsOptionsPopupHeightOffset) / 2, (CoD.SegmentsOptionsPopupHeight + CoD.SegmentsOptionsPopupHeightOffset) / 2 )
	popup.smallPopupBackground:setTopBottom( false, false, -CoD.SegmentsOptionsPopupHeight / 2 - CoD.SegmentsOptionsPopupHeightOffset - 10, CoD.SegmentsOptionsPopupHeight / 2 + 10 )
	popup:addSelectButton()
	popup:addBackButton()
	popup:registerEventHandler( "button_prompt_back", NewSegmentOptions_Back )
	popup:registerEventHandler( "delete_segment_confirmation", NewSegmentOptions_DeleteSegment )
	popup:registerEventHandler( "preview_segment", NewSegmentOptions_PreviewSegment )
	popup:registerEventHandler( "rename_segment", NewSegmentOptions_RenameSegment )
	popup:registerEventHandler( "demo_keyboard_complete", NewSegmentOptions_KeyboardComplete )
	popup:registerEventHandler( "setup_move_segment", NewSegmentOptions_SetupMoveSegment )
	popup.title:setText( Engine.Localize( "MENU_SEGMENT_OPTIONS" ) )
	popup.msg:setText( Engine.Localize( "MENU_SEGMENT_OPTIONS_DESC" ) )
	popup.model = CoD.perController[controller].selectedSegment
	popup.segmentIndex = Engine.GetModelValue( Engine.GetModel( popup.model, "segmentNumber" ) ) - 1
	local segmentCount = Engine.GetDemoSegmentCount()
	local f14_local0 = popup.segmentIndex == segmentCount - 1
	local buttonList = CoD.ButtonList.new( {} )
	buttonList:setLeftRight( true, true, 0, 0 )
	if f14_local0 then
		buttonList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 4 - 20, 0 )
	else
		buttonList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 5 - 20, 0 )
	end
	buttonList:setSpacing( 0 )
	popup:addElement( buttonList )
	local previewSegment = buttonList:addButton( Engine.Localize( "MPUI_PREVIEW" ) )
	previewSegment:setActionEventName( "preview_segment" )
	previewSegment:processEvent( {
		name = "gain_focus"
	} )
	local moveSegment = buttonList:addButton( Engine.Localize( "MENU_MOVE" ) )
	moveSegment:setActionEventName( "setup_move_segment" )
	if not f14_local0 then
		local transitionValue = tonumber( Engine.GetDemoSegmentInformation( popup.segmentIndex, "transitionValue" ) )
		local transitionOut = buttonList:addLeftRightSelector( Engine.Localize( "MENU_CHANGE_TRANSITION" ), transitionValue )
		local f14_local1 = {}
		local f14_local2 = Engine.Localize( "MENU_DEMO_TRANSITION_CUT" )
		local f14_local3 = Engine.Localize( "MENU_DEMO_TRANSITION_FADE" )
		transitionOut.strings = f14_local2
		transitionOut.values = {
			CoD.DEMO_CLIP_TRANSITION_NONE,
			CoD.DEMO_CLIP_TRANSITION_FADE
		}
		for index = 1, #transitionOut.strings, 1 do
			transitionOut:addChoice( Engine.Localize( transitionOut.strings[index] ), NewSegmentOptions_SwitchTransition, {
				value = transitionOut.values[index],
				controller = controller,
				parentButton = transitionOut,
				segmentIndex = popup.segmentIndex,
				selectedSegmentModel = popup.model
			} )
		end
	end
	local renameSegment = buttonList:addButton( Engine.Localize( "MENU_RENAME" ) )
	renameSegment:setActionEventName( "rename_segment" )
	local deleteSegment = buttonList:addButton( Engine.Localize( "MENU_DELETE" ) )
	deleteSegment:setActionEventName( "delete_segment_confirmation" )
	return popup
end

local NewMergeAllSegments_Accept = function ( self, event )
	Engine.ExecNow( event.controller, "demo_mergesegments" )
	ManageSegments_ReAddTimeline( self.occludedMenu )
	self:setPreviousMenu( nil )
	self:goBack( event.controller )
	ManageSegmentsRefresh( self.occludedMenu )
end

LUI.createMenu.NewMergeAllSegments = function ( controller )
	local popup = CoD.Popup.SetupPopupChoice( "NewMergeAllSegments", controller )
	popup.title:setText( Engine.Localize( "MENU_WARNING" ) )
	popup.msg:setText( Engine.Localize( "MENU_MERGE_ALL_SEGMENTS_CONFIRMATION" ) )
	popup:addBackButton()
	popup.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	popup.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	popup.choiceA:setActionEventName( "merge_all_segments_accept" )
	popup.choiceB:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "merge_all_segments_accept", NewMergeAllSegments_Accept )
	return popup
end

local NewDeleteAllSegments_Accept = function ( self, event )
	Engine.ExecNow( event.controller, "demo_deleteclip" )
	ManageSegments_ReAddTimeline( self.occludedMenu )
	self:setPreviousMenu( nil )
	self:goBack( event.controller )
	ManageSegmentsRefresh( self.occludedMenu )
end

LUI.createMenu.NewDeleteAllSegments = function ( controller )
	local popup = CoD.Popup.SetupPopupChoice( "NewDeleteAllSegments", controller )
	popup.title:setText( Engine.Localize( "MENU_WARNING" ) )
	popup.msg:setText( Engine.Localize( "MENU_DELETE_ALL_SEGMENTS_CONFIRMATION" ) )
	popup:addBackButton()
	popup.choiceA:setLabel( Engine.Localize( "MENU_YES" ) )
	popup.choiceB:setLabel( Engine.Localize( "MENU_NO" ) )
	popup.choiceA:setActionEventName( "delete_all_segments_accept" )
	popup.choiceB:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "delete_all_segments_accept", NewDeleteAllSegments_Accept )
	return popup
end

local NewClipOptions_MergeAllSegments = function ( self, event )
	self:openMenu( "NewMergeAllSegments", event.controller )
	self:close()
end

local NewClipOptions_DeleteAllSegments = function ( self, event )
	self:openMenu( "NewDeleteAllSegments", event.controller )
	self:close()
end

LUI.createMenu.NewClipOptions = function ( controller )
	local popup = CoD.Menu.NewSmallPopup( "NewClipOptions" )
	popup:setOwner( controller )
	popup:addSelectButton()
	popup:addBackButton()
	popup:registerEventHandler( "merge_all_segments_confirmation", NewClipOptions_MergeAllSegments )
	popup:registerEventHandler( "delete_all_segments_confirmation", NewClipOptions_DeleteAllSegments )
	local top = 5
	local messageText = LUI.UIText.new()
	messageText:setLeftRight( true, true, 0, 0 )
	messageText:setTopBottom( true, false, top, top + CoD.textSize.Big )
	messageText:setFont( CoD.fonts.Big )
	messageText:setAlignment( LUI.Alignment.Left )
	messageText:setText( Engine.Localize( "MENU_CLIP_OPTIONS" ) )
	popup:addElement( messageText )
	local buttonList = CoD.ButtonList.new( {} )
	buttonList:setLeftRight( true, true, 0, 0 )
	buttonList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10, 0 )
	popup:addElement( buttonList )
	local mergeAllSegments = buttonList:addButton( Engine.Localize( "MENU_MERGE_ALL_SEGMENTS" ) )
	mergeAllSegments:setActionEventName( "merge_all_segments_confirmation" )
	mergeAllSegments:processEvent( {
		name = "gain_focus"
	} )
	if Engine.GetDemoSegmentCount() <= 1 then
		mergeAllSegments:disable()
	end
	local deleteAllSegments = buttonList:addButton( Engine.Localize( "MENU_DELETE_ALL_SEGMENTS" ) )
	deleteAllSegments:setActionEventName( "delete_all_segments_confirmation" )
	return popup
end

local PreLoadFunc = function ( self, controller )
	ManageSegments_AddTimeline( self )
end

local PostLoadFunc = function ( self, controller )
	Engine.Exec( controller, "setupThumbnailsForManageSegments" )
end

LUI.createMenu.ManageSegments = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ManageSegments" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ManageSegments.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
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
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
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
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
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
	
	local StartMenulineGraphics0 = CoD.StartMenu_lineGraphics.new( self, controller )
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
	
	local StartMenulineGraphics20 = CoD.StartMenu_lineGraphics2.new( self, controller )
	StartMenulineGraphics20:setLeftRight( true, false, 1203, 1267 )
	StartMenulineGraphics20:setTopBottom( true, false, 112, 698.94 )
	self:addElement( StartMenulineGraphics20 )
	self.StartMenulineGraphics20 = StartMenulineGraphics20
	
	local IdentityBadge = CoD.IdentityBadge.new( self, controller )
	IdentityBadge:setLeftRight( true, false, 860, 1205 )
	IdentityBadge:setTopBottom( true, false, 25, 81 )
	self:addElement( IdentityBadge )
	self.IdentityBadge = IdentityBadge
	
	local SegmentButtonList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, true )
	SegmentButtonList:makeFocusable()
	SegmentButtonList:setLeftRight( true, false, 70, 790 )
	SegmentButtonList:setTopBottom( true, false, 123, 538 )
	SegmentButtonList:setDataSource( "DemoSegments" )
	SegmentButtonList:setWidgetType( CoD.SegmentButton )
	SegmentButtonList:setHorizontalCount( 5 )
	SegmentButtonList:setVerticalCount( 4 )
	SegmentButtonList:setSpacing( 5 )
	SegmentButtonList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		ManageSegmentsUpdateTimeline( self, element, controller, "gain_focus", self )
		return retVal
	end )
	SegmentButtonList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local retVal = nil
		ManageSegmentsUpdateTimeline( self, element, controller, "lose_focus", self )
		return retVal
	end )
	SegmentButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	SegmentButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( SegmentButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ManageSegmentsSelectAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( SegmentButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsSegmentSelectedForMove( element, controller ) then
			return true
		elseif IsSegmentSelectedForMove( element, controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSegmentSelectedForMove( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT_CLIP" )
			return true
		elseif IsSegmentSelectedForMove( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PLACE_SEGMENT" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( SegmentButtonList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if not IsSegmentSelectedForMove( element, controller ) then
			ManageSegmentsFilmOptions( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_CLIP_OPTIONS" )
		if not IsSegmentSelectedForMove( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( SegmentButtonList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if not IsSegmentSelectedForMove( element, controller ) then
			ManageSegmentsPreviewFilm( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_PREVIEW_CLIP" )
		if not IsSegmentSelectedForMove( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( SegmentButtonList )
	self.SegmentButtonList = SegmentButtonList
	
	local SegmentInformation = CoD.SegmentInformation.new( self, controller )
	SegmentInformation:setLeftRight( true, false, 817.36, 1117.36 )
	SegmentInformation:setTopBottom( true, false, 123, 523 )
	self:addElement( SegmentInformation )
	self.SegmentInformation = SegmentInformation
	
	SegmentInformation:linkToElementModel( SegmentButtonList, nil, false, function ( model )
		SegmentInformation:setModel( model, controller )
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ManageSegmentsGoBack( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	SegmentButtonList.id = "SegmentButtonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.SegmentButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.FEButtonPanelShaderContainer0:close()
		self.cac3dTitleIntermediary0:close()
		self.StartMenulineGraphics0:close()
		self.StartMenulineGraphics20:close()
		self.IdentityBadge:close()
		self.SegmentButtonList:close()
		self.SegmentInformation:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ManageSegments.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

