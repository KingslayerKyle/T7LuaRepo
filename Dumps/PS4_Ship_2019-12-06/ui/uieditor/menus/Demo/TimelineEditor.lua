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
	local f2_local0 = CoD.DemoUtility.Timeline_GetSelectedSegmentModel()
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

CoD.Timeline_RefreshStateAfterMove = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	if f4_arg3 then
		f0_local1( f4_arg0 )
		CoD.Timeline_RefreshState( f4_arg0, f4_arg2, false )
		CoD.Timeline_RefreshState( f4_arg0, f4_arg1, true )
	else
		local f4_local0 = Engine.GetModelValue
		local f4_local1 = Engine.GetModel
		local f4_local2 = f4_arg2
		CoD.Timeline_RefreshState( f4_arg0, f4_arg2, f4_arg0.timelineContainer.timeline[f4_local0( f4_local1( f4_arg2, "segmentNumber" ) )].focussed )
	end
end

local PreLoadFunc = function ( self, controller )
	f0_local0( self )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "demo.showFilmOptionsSidebar" ), false )
end

local f0_local3 = function ( f6_arg0, f6_arg1 )
	if Engine.GetDemoSegmentCount() <= 0 then
		if f6_arg0.ClipStartTime then
			f6_arg0.ClipStartTime:setAlpha( 0 )
		end
		if f6_arg0.ClipEndTime then
			f6_arg0.ClipEndTime:setAlpha( 0 )
		end
	elseif f6_arg0.ClipEndTime then
		f6_arg0.ClipEndTime.Text:setText( Engine.GetDemoSegmentInformation( 0, "totalClipDurationTimeDisplay" ) )
	end
end

local PostLoadFunc = function ( f7_arg0, f7_arg1 )
	Engine.Exec( f7_arg1, "setupThumbnailsForManageSegments" )
	f0_local3( f7_arg0, f7_arg1 )
	f7_arg0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments.refresh" ), function ( model )
		f0_local1( f7_arg0 )
		f0_local3( f7_arg0, f7_arg1 )
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
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local SegmentButtonList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	SegmentButtonList:makeFocusable()
	SegmentButtonList:setLeftRight( true, false, 95, 1185 )
	SegmentButtonList:setTopBottom( true, true, 112.5, -109.5 )
	SegmentButtonList:setWidgetType( CoD.SegmentButton )
	SegmentButtonList:setHorizontalCount( 5 )
	SegmentButtonList:setVerticalCount( 4 )
	SegmentButtonList:setSpacing( 5 )
	SegmentButtonList:setDataSource( "DemoSegments" )
	SegmentButtonList:linkToElementModel( SegmentButtonList, "disabled", true, function ( model )
		local f11_local0 = SegmentButtonList
		local f11_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f11_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	SegmentButtonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.showFilmOptionsSidebar" ), function ( model )
		local f12_local0 = SegmentButtonList
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.showFilmOptionsSidebar"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f12_local0, self, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( f12_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f12_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	SegmentButtonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.segmentCount" ), function ( model )
		local f13_local0 = SegmentButtonList
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.segmentCount"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, self, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( f13_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f13_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	SegmentButtonList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f14_local0 = nil
		if not IsTimelineEditorInMoveState( controller ) then
			TimelineEditorUpdateTimeline( self, element, controller, "gain_focus", self )
			TimelineEditorUpdateHighlightedSegmentModel( self, element, controller, "gain_focus", self )
		elseif IsTimelineEditorInMoveState( controller ) then
			TimelineEditorPlaceSegment( self, element, controller, "true", self )
			TimelineEditorSetupMoveSegment( self, element, controller, self )
			TimelineEditorUpdateTimeline( self, element, controller, "gain_focus", self )
			TimelineEditorUpdateHighlightedSegmentModel( self, element, controller, "gain_focus", self )
			UpdateAllMenuButtonPrompts( self, controller )
		end
		return f14_local0
	end )
	SegmentButtonList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f15_local0 = nil
		if not IsTimelineEditorInMoveState( controller ) then
			TimelineEditorUpdateTimeline( self, element, controller, "lose_focus", self )
			TimelineEditorUpdateHighlightedSegmentModel( self, element, controller, "lose_focus", self )
		elseif IsTimelineEditorInMoveState( controller ) then
			TimelineEditorUpdateTimeline( self, element, controller, "lose_focus", self )
			TimelineEditorUpdateHighlightedSegmentModel( self, element, controller, "lose_focus", self )
		end
		return f15_local0
	end )
	SegmentButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f16_local0 = nil
		if element.gainFocus then
			f16_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f16_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f16_local0
	end )
	SegmentButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f17_local0 = nil
		if element.loseFocus then
			f17_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f17_local0 = element.super:loseFocus( event )
		end
		return f17_local0
	end )
	self:AddButtonCallbackFunction( SegmentButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) and not IsTimelineEditorInMoveState( controller ) then
			TimelineEditorSetupMoveSegment( self, element, controller, menu )
			UpdateAllMenuButtonPrompts( menu, controller )
			return true
		elseif not IsDisabled( element, controller ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) and IsTimelineEditorInMoveState( controller ) then
			TimelineEditorPlaceSegment( self, element, controller, "true", menu )
			UpdateAllMenuButtonPrompts( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDisabled( element, controller ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) and not IsTimelineEditorInMoveState( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "DEMO_CUT_SEGMENT" )
			return true
		elseif not IsDisabled( element, controller ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) and IsTimelineEditorInMoveState( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "DEMO_PASTE_SEGMENT" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( SegmentButtonList, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if SegmentCountGreaterThan( controller, 0 ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) and not IsTimelineEditorInMoveState( controller ) then
			TimelineEditorFilmOptions( self, element, controller )
			SetGlobalModelValueTrue( "demo.showFilmOptionsSidebar" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if SegmentCountGreaterThan( controller, 0 ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) and not IsTimelineEditorInMoveState( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( SegmentButtonList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if SegmentCountGreaterThan( controller, 0 ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) and not IsTimelineEditorInMoveState( controller ) then
			TimelineEditorPreviewClip( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if SegmentCountGreaterThan( controller, 0 ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) and not IsTimelineEditorInMoveState( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_PREVIEW_CLIP" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( SegmentButtonList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if SegmentCountGreaterThan( controller, 0 ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) and CanChangeSegmentTransition( element, controller ) and IsSegmentTransition( element, controller, Enum.demoClipTransition.DEMO_CLIP_TRANSITION_NONE ) and not IsTimelineEditorInMoveState( controller ) then
			TimelineEditorChangeTransition( self, element, controller )
			UpdateAllMenuButtonPrompts( menu, controller )
			return true
		elseif SegmentCountGreaterThan( controller, 0 ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) and CanChangeSegmentTransition( element, controller ) and IsSegmentTransition( element, controller, Enum.demoClipTransition.DEMO_CLIP_TRANSITION_FADE ) and not IsTimelineEditorInMoveState( controller ) then
			TimelineEditorChangeTransition( self, element, controller )
			UpdateAllMenuButtonPrompts( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if SegmentCountGreaterThan( controller, 0 ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) and CanChangeSegmentTransition( element, controller ) and IsSegmentTransition( element, controller, Enum.demoClipTransition.DEMO_CLIP_TRANSITION_NONE ) and not IsTimelineEditorInMoveState( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "DEMO_TRANSITION_CUT" )
			return true
		elseif SegmentCountGreaterThan( controller, 0 ) and not IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) and CanChangeSegmentTransition( element, controller ) and IsSegmentTransition( element, controller, Enum.demoClipTransition.DEMO_CLIP_TRANSITION_FADE ) and not IsTimelineEditorInMoveState( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "DEMO_TRANSITION_FADE" )
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
	ClipStartTime.Text:setRGB( 1, 0.41, 0 )
	ClipStartTime.Text:setText( Engine.Localize( "00:00" ) )
	ClipStartTime.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ClipStartTime.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( ClipStartTime )
	self.ClipStartTime = ClipStartTime
	
	local ClipEndTime = CoD.TextWithBg.new( self, controller )
	ClipEndTime:setLeftRight( false, true, -154, -95 )
	ClipEndTime:setTopBottom( false, true, -100, -80 )
	ClipEndTime.Text:setRGB( 1, 0.41, 0 )
	ClipEndTime.Text:setText( Engine.Localize( "00:00" ) )
	ClipEndTime.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ClipEndTime.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( ClipEndTime )
	self.ClipEndTime = ClipEndTime
	
	local EmptyTimelineEditorText = LUI.UIText.new()
	EmptyTimelineEditorText:setLeftRight( true, true, 0, 0 )
	EmptyTimelineEditorText:setTopBottom( false, false, -12.5, 12.5 )
	EmptyTimelineEditorText:setText( Engine.Localize( "DEMO_EMPTY_TIMELINE_EDITOR" ) )
	EmptyTimelineEditorText:setTTF( "fonts/default.ttf" )
	EmptyTimelineEditorText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	EmptyTimelineEditorText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EmptyTimelineEditorText )
	self.EmptyTimelineEditorText = EmptyTimelineEditorText
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( false, false, -546, 546 )
	Image:setTopBottom( false, false, 257.5, 282 )
	Image:setAlpha( 0.5 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0, 0.16, 0, 0 )
	Image:setupNineSliceShader( 4, 4 )
	self:addElement( Image )
	self.Image = Image
	
	local Pixel2011 = LUI.UIImage.new()
	Pixel2011:setLeftRight( false, false, 547, 583 )
	Pixel2011:setTopBottom( false, false, 258, 262 )
	Pixel2011:setAlpha( 0.5 )
	Pixel2011:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2011:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2011 )
	self.Pixel2011 = Pixel2011
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, 547, 583 )
	Image0:setTopBottom( false, false, 279, 283 )
	Image0:setAlpha( 0.5 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, -582, -546 )
	Image1:setTopBottom( false, false, 257, 261 )
	Image1:setAlpha( 0.5 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, false, -582, -546 )
	Image2:setTopBottom( false, false, 278, 282 )
	Image2:setAlpha( 0.5 )
	Image2:setZRot( 180 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ClipStartTime:completeAnimation()
				self.ClipStartTime:setAlpha( 1 )
				self.clipFinished( ClipStartTime, {} )
				ClipEndTime:completeAnimation()
				self.ClipEndTime:setAlpha( 1 )
				self.clipFinished( ClipEndTime, {} )
				EmptyTimelineEditorText:completeAnimation()
				self.EmptyTimelineEditorText:setAlpha( 0 )
				self.clipFinished( EmptyTimelineEditorText, {} )
			end
		},
		Empty = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				SegmentButtonList:completeAnimation()
				self.SegmentButtonList:setAlpha( 0.4 )
				self.clipFinished( SegmentButtonList, {} )
				ClipStartTime:completeAnimation()
				self.ClipStartTime:setAlpha( 0 )
				self.clipFinished( ClipStartTime, {} )
				ClipEndTime:completeAnimation()
				self.ClipEndTime:setAlpha( 0 )
				self.clipFinished( ClipEndTime, {} )
				EmptyTimelineEditorText:completeAnimation()
				self.EmptyTimelineEditorText:setAlpha( 1 )
				self.clipFinished( EmptyTimelineEditorText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Empty",
			condition = function ( menu, element, event )
				return not SegmentCountGreaterThan( controller, 0 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.segmentCount" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.segmentCount"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.showFilmOptionsSidebar" ), function ( model )
		local f30_local0 = self
		local f30_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.showFilmOptionsSidebar"
		}
		CoD.Menu.UpdateButtonShownState( f30_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f31_local0 = nil
		TimelineEditorRefresh( "" )
		if not f31_local0 then
			f31_local0 = self:dispatchEventToChildren( event )
		end
		return f31_local0
	end )
	self:registerEventHandler( "ui_keyboard_input", function ( self, event )
		local f32_local0 = nil
		TimelineEditorKeyboardComplete( self, self, controller, event )
		if not f32_local0 then
			f32_local0 = self:dispatchEventToChildren( event )
		end
		return f32_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if not IsTimelineEditorInMoveState( controller ) then
			GoBack( self, controller )
			ResetThumbnailViewer( controller )
			return true
		elseif IsTimelineEditorInMoveState( controller ) then
			TimelineEditorPlaceSegment( self, element, controller, "false", menu )
			UpdateAllMenuButtonPrompts( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsTimelineEditorInMoveState( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		elseif IsTimelineEditorInMoveState( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsGlobalModelValueTrue( element, controller, "demo.showFilmOptionsSidebar" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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

