require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.SelectionListButton" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.MissionObjectiveGroup" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.handleGamepadButton = nil
	f1_arg0.m_disableNavigation = true
	local f1_local0 = CoD.GetMapValue( Engine.DvarString( nil, "mapname" ), "mapName", Engine.DvarString( nil, "mapname" ) )
	f1_arg0.locationText:setText( Engine.Localize( f1_local0 .. "_CAPS" ) )
	local f1_local1, f1_local2, f1_local3, f1_local4 = f1_arg0.locationText:getLocalRect()
	local f1_local5, f1_local6, f1_local7, f1_local8 = GetTextDimensions( f1_arg0.locationText:getText(), CoD.fonts.Big, CoD.textSize.Big )
	f1_arg0.geographicText:setLeftRight( true, false, f1_local1 + f1_local7 + 10, f1_local1 + f1_local7 + 300 )
	f1_arg0.geographicText:setText( Engine.Localize( f1_local0 .. "_LOC" ) )
end

CoD.MissionTab = InheritFrom( LUI.UIElement )
CoD.MissionTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.MissionTab )
	self.id = "MissionTab"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1090 )
	self:setTopBottom( true, false, 0, 560 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local headerBackground = LUI.UIImage.new()
	headerBackground:setLeftRight( true, true, 20, -20 )
	headerBackground:setTopBottom( true, false, 20, 75 )
	headerBackground:setRGB( 0.82, 0.82, 0.83 )
	self:addElement( headerBackground )
	self.headerBackground = headerBackground
	
	local locationText = LUI.UITightText.new()
	locationText:setLeftRight( true, false, 32, 323 )
	locationText:setTopBottom( true, false, 26.56, 74.56 )
	locationText:setRGB( 0.57, 0.58, 0.59 )
	locationText:setText( Engine.Localize( "CPUI_CP_MI_SING_BLACKSTATION_NI_CAPS" ) )
	locationText:setTTF( "fonts/default.ttf" )
	self:addElement( locationText )
	self.locationText = locationText
	
	local geographicText = LUI.UITightText.new()
	geographicText:setLeftRight( true, false, 412, 524 )
	geographicText:setTopBottom( true, false, 41.06, 71.06 )
	geographicText:setRGB( 0.95, 0.95, 0.95 )
	geographicText:setText( Engine.Localize( "CPUI_CP_MI_SING_BLACKSTATION_NI_LOC" ) )
	geographicText:setTTF( "fonts/default.ttf" )
	self:addElement( geographicText )
	self.geographicText = geographicText
	
	local selectionList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 20, 280 )
	selectionList:setTopBottom( true, false, 90, 184 )
	selectionList:setDataSource( "StartMenuSelectionList" )
	selectionList:setWidgetType( CoD.SelectionListButton )
	selectionList:setVerticalCount( 3 )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local MinimapFull0 = LUI.UIImage.new()
	MinimapFull0:setLeftRight( true, false, 294, 1068 )
	MinimapFull0:setTopBottom( true, false, 90, 520 )
	MinimapFull0:setupCompassMap( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( MinimapFull0 )
	self.MinimapFull0 = MinimapFull0
	
	local MinimapFull1 = LUI.UIImage.new()
	MinimapFull1:setLeftRight( true, false, 294, 1068 )
	MinimapFull1:setTopBottom( true, false, 90, 520 )
	MinimapFull1:setupCompassItems( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( MinimapFull1 )
	self.MinimapFull1 = MinimapFull1
	
	local MinimapFull2 = LUI.UIImage.new()
	MinimapFull2:setLeftRight( true, false, 294, 1068 )
	MinimapFull2:setTopBottom( true, false, 90, 520 )
	MinimapFull2:setupCompassOverlay( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( MinimapFull2 )
	self.MinimapFull2 = MinimapFull2
	
	local objectivesList = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, true )
	objectivesList:makeFocusable()
	objectivesList:setLeftRight( true, false, 20, 280 )
	objectivesList:setTopBottom( true, false, 190, 1020 )
	objectivesList:setDataSource( "CurrentObjectivesList" )
	objectivesList:setWidgetType( CoD.MissionObjectiveGroup )
	objectivesList:setVerticalCount( 3 )
	objectivesList:setSpacing( 10 )
	self:addElement( objectivesList )
	self.objectivesList = objectivesList
	
	selectionList.navigation = {
		down = objectivesList
	}
	objectivesList.navigation = {
		up = selectionList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	selectionList.id = "selectionList"
	objectivesList.id = "objectivesList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.selectionList:close()
		element.objectivesList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

