require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Demo.SegmentButton" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )

CoD.Timeline_Container_LeftOffset = 154
CoD.Timeline_Container_RightOffset = 154
CoD.Timeline_Container_BottomOffset = 80
CoD.Timeline_Container_Height = 20
CoD.Timeline_Block_Spacing = 3
local f0_local0 = function ( f1_arg0 )
	local f1_local0 = Engine.GetDemoSegmentCount()
	local f1_local1 = Engine.GetDemoSegmentInformation( 0, "totalClipDuration" )
	local f1_local2 = 1280 - CoD.Timeline_Container_LeftOffset + CoD.Timeline_Container_RightOffset - CoD.Timeline_Block_Spacing * (f1_local0 - 1)
	local f1_local3 = f1_local2 / f1_local0
	if f1_local0 <= 0 then
		return 
	end
	f1_arg0.timelineContainer = LUI.UIContainer.new()
	f1_arg0.timelineContainer:setLeftRight( true, true, CoD.Timeline_Container_LeftOffset, -CoD.Timeline_Container_RightOffset )
	f1_arg0.timelineContainer:setTopBottom( false, true, -CoD.Timeline_Container_Height - CoD.Timeline_Container_BottomOffset, -CoD.Timeline_Container_BottomOffset )
	f1_arg0:addElement( f1_arg0.timelineContainer )
	f1_arg0.timelineContainer.timeline = LUI.UIHorizontalList.new()
	f1_arg0.timelineContainer.timeline:setLeftRight( true, true, 0, 0 )
	f1_arg0.timelineContainer.timeline:setTopBottom( true, true, 0, 0 )
	f1_arg0.timelineContainer.timeline:setSpacing( CoD.Timeline_Block_Spacing )
	f1_arg0.timelineContainer:addElement( f1_arg0.timelineContainer.timeline )
	local f1_local4 = 2
	for f1_local5 = 1, f1_local0, 1 do
		local f1_local8 = Engine.GetDemoSegmentInformation( f1_local5 - 1, "duration" ) / f1_local1 * f1_local2
		local f1_local9 = LUI.UIContainer.new()
		f1_local9:setLeftRight( true, false, 0, f1_local8 )
		f1_local9:setTopBottom( true, false, 0, CoD.Timeline_Container_Height )
		f1_local9.image = LUI.UIImage.new()
		f1_local9.image:setLeftRight( true, true, f1_local4 / 2, -f1_local4 / 2 )
		f1_local9.image:setTopBottom( true, true, f1_local4 / 2, -f1_local4 / 2 )
		f1_local9.image:setRGB( 1, 1, 1 )
		f1_local9.image:setAlpha( 1 )
		f1_local9:addElement( f1_local9.image )
		f1_local9.border = CoD.BorderT6.new( f1_local4, 0.9, 0.5, 0.1 )
		f1_local9.border:setAlpha( 0 )
		f1_local9:addElement( f1_local9.border )
		f1_local9.focussed = false
		f1_arg0.timelineContainer.timeline[f1_local5] = f1_local9
		f1_arg0.timelineContainer.timeline:addElement( f1_local9 )
	end
end

CoD.Timeline_RefreshState = function ( f2_arg0, f2_arg1, f2_arg2 )
	if not f2_arg1 then
		return 
	end
	local f2_local0 = CoD.Timeline_GetSelectedSegmentModel()
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

CoD.Timeline_GetSelectedSegmentModel = function ()
	local f3_local0 = Engine.GetDemoSegmentCount()
	local f3_local1 = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" )
	if f3_local1 then
		for f3_local2 = 1, f3_local0, 1 do
			local f3_local5 = Engine.GetModel( f3_local1, f3_local2 - 1 )
			if f3_local5 then
				local f3_local6 = Engine.GetModel( f3_local5, "selected" )
				if f3_local6 and Engine.GetModelValue( f3_local6 ) == true then
					return f3_local5
				end
			end
		end
	end
	return nil
end

CoD.Timeline_GetHighlightedSegmentModel = function ()
	local f4_local0 = Engine.GetDemoSegmentCount()
	local f4_local1 = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" )
	if f4_local1 then
		for f4_local2 = 1, f4_local0, 1 do
			local f4_local5 = Engine.GetModel( f4_local1, f4_local2 - 1 )
			if f4_local5 then
				local f4_local6 = Engine.GetModel( f4_local5, "highlighted" )
				if f4_local6 and Engine.GetModelValue( f4_local6 ) == true then
					return f4_local5
				end
			end
		end
	end
	return nil
end

local f0_local1 = function ( f5_arg0 )
	if f5_arg0.timelineContainer ~= nil then
		f5_arg0.timelineContainer:close()
	end
	f0_local0( f5_arg0 )
end

CoD.Timeline_RefreshStateAfterMove = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	if f6_arg3 then
		f0_local1( f6_arg0 )
		CoD.Timeline_RefreshState( f6_arg0, f6_arg2, false )
		CoD.Timeline_RefreshState( f6_arg0, f6_arg1, true )
	else
		local f6_local0 = Engine.GetModelValue
		local f6_local1 = Engine.GetModel
		local f6_local2 = f6_arg2
		CoD.Timeline_RefreshState( f6_arg0, f6_arg2, f6_arg0.timelineContainer.timeline[f6_local0( f6_local1( f6_arg2, "segmentNumber" ) )].focussed )
	end
end

local PreLoadFunc = function ( self, controller )
	f0_local0( self )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "demo.showFilmOptionsSidebar" ), false )
end

local f0_local3 = function ( f8_arg0, f8_arg1 )
	if Engine.GetDemoSegmentCount() <= 0 then
		if f8_arg0.ClipStartTime then
			f8_arg0.ClipStartTime:setAlpha( 0 )
		end
		if f8_arg0.ClipEndTime then
			f8_arg0.ClipEndTime:setAlpha( 0 )
		end
	elseif f8_arg0.ClipEndTime then
		f8_arg0.ClipEndTime.Text:setText( Engine.GetDemoSegmentInformation( 0, "totalClipDurationTimeDisplay" ) )
	end
end

local PostLoadFunc = function ( f9_arg0, f9_arg1 )
	Engine.Exec( f9_arg1, "setupThumbnailsForManageSegments" )
	f0_local3( f9_arg0, f9_arg1 )
	f9_arg0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments.refresh" ), function ( model )
		f0_local1( f9_arg0 )
		f0_local3( f9_arg0, f9_arg1 )
	end )
end

LUI.createMenu.TimelineEditor = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "TimelineEditor" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "TimelineEditor.buttonPrompts" )
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
	
	local SegmentButtonList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, true )
	SegmentButtonList:makeFocusable()
	SegmentButtonList:setLeftRight( true, false, 95, 1185 )
	SegmentButtonList:setTopBottom( true, true, 112.5, -112.5 )
	SegmentButtonList:setDataSource( "DemoSegments" )
	SegmentButtonList:setWidgetType( CoD.SegmentButton )
	SegmentButtonList:setHorizontalCount( 5 )
	SegmentButtonList:setVerticalCount( 4 )
	SegmentButtonList:setSpacing( 5 )
	SegmentButtonList:linkToElementModel( SegmentButtonList, "disabled", true, function ( model )
		local f13_local0 = SegmentButtonList
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	SegmentButtonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.showFilmOptionsSidebar" ), function ( model )
		local f14_local0 = SegmentButtonList
		local f14_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.showFilmOptionsSidebar"
		}
		CoD.Menu.UpdateButtonShownState( f14_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f14_local0, self, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( f14_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	SegmentButtonList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f15_local0 = nil
		TimelineEditorUpdateTimeline( self, element, controller, "gain_focus", self )
		TimelineEditorUpdateHighlightedSegmentModel( self, element, controller, "gain_focus", self )
		return f15_local0
	end )
	SegmentButtonList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f16_local0 = nil
		TimelineEditorUpdateTimeline( self, element, controller, "lose_focus", self )
		TimelineEditorUpdateHighlightedSegmentModel( self, element, controller, "lose_focus", self )
		return f16_local0
	end )
	SegmentButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f17_local0
	end )
	SegmentButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	self:AddButtonCallbackFunction( SegmentButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) then
			TimelineEditorSelectAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT_CLIP" )
		if not IsDisabled( element, controller ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( SegmentButtonList, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if not IsSegmentSelectedForMove( element, controller ) and SegmentCountGreaterThan( controller, 0 ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) then
			TimelineEditorFilmOptions( self, element, controller )
			SetGlobalModelValueTrue( "demo.showFilmOptionsSidebar" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		if not IsSegmentSelectedForMove( element, controller ) and SegmentCountGreaterThan( controller, 0 ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( SegmentButtonList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if not IsSegmentSelectedForMove( element, controller ) and SegmentCountGreaterThan( controller, 0 ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) then
			TimelineEditorPreviewClip( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_PREVIEW_CLIP" )
		if not IsSegmentSelectedForMove( element, controller ) and SegmentCountGreaterThan( controller, 0 ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( SegmentButtonList )
	self.SegmentButtonList = SegmentButtonList
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, false, 0, 1280 )
	GenericMenuFrame0:setTopBottom( true, false, 0, 720 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "MENU_DEMO_MANAGE_SEGMENTS" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( "MENU_DEMO_MANAGE_SEGMENTS" ) ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local ClipStartTime = CoD.TextWithBg.new( self, controller )
	ClipStartTime:setLeftRight( true, false, 95, 154 )
	ClipStartTime:setTopBottom( false, true, -100, -80 )
	ClipStartTime.Text:setText( Engine.Localize( "00:00" ) )
	ClipStartTime.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ClipStartTime )
	self.ClipStartTime = ClipStartTime
	
	local ClipEndTime = CoD.TextWithBg.new( self, controller )
	ClipEndTime:setLeftRight( false, true, -154, -95 )
	ClipEndTime:setTopBottom( false, true, -100, -80 )
	ClipEndTime.Text:setText( Engine.Localize( "00:00" ) )
	ClipEndTime.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ClipEndTime )
	self.ClipEndTime = ClipEndTime
	
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.showFilmOptionsSidebar" ), function ( model )
		local f25_local0 = self
		local f25_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.showFilmOptionsSidebar"
		}
		CoD.Menu.UpdateButtonShownState( f25_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f26_local0 = nil
		TimelineEditorRefresh( "" )
		if not f26_local0 then
			f26_local0 = self:dispatchEventToChildren( event )
		end
		return f26_local0
	end )
	self:registerEventHandler( "ui_keyboard_input", function ( self, event )
		local f27_local0 = nil
		TimelineEditorKeyboardComplete( self, self, controller, event )
		if not f27_local0 then
			f27_local0 = self:dispatchEventToChildren( event )
		end
		return f27_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		TimelineEditorGoBack( self, element, controller )
		ResetThumbnailViewer( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) then
			return true
		else
			return false
		end
	end, false )
	SegmentButtonList.id = "SegmentButtonList"
	GenericMenuFrame0:setModel( self.buttonModel, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.SegmentButtonList:close()
		element.GenericMenuFrame0:close()
		element.ClipStartTime:close()
		element.ClipEndTime:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "TimelineEditor.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

