require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.SelectionListButton" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.MissionObjectiveGroup" )

local PostLoadFunc = function ( self, controller )
	self.handleGamepadButton = nil
	self.m_disableNavigation = true
	local mapNameText = CoD.GetMapValue( Engine.DvarString( nil, "mapname" ), "mapName", Engine.DvarString( nil, "mapname" ) )
	local mapNameLocalized = Engine.Localize( mapNameText .. "_CAPS" )
	self.locationText:setText( mapNameLocalized )
	local textWidgetLeft, textWidgetTop, textWidgetRight, textWidgetBottom = self.locationText:getLocalRect()
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( self.locationText:getText(), CoD.fonts.Big, CoD.textSize.Big )
	self.geographicText:setLeftRight( true, false, textWidgetLeft + textRight + 10, textWidgetLeft + textRight + 300 )
	local geographicTextLocalized = Engine.Localize( mapNameText .. "_LOC" )
	self.geographicText:setText( geographicTextLocalized )
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
	headerBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
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
	selectionList:setRGB( 1, 1, 1 )
	selectionList:setDataSource( "StartMenuSelectionList" )
	selectionList:setWidgetType( CoD.SelectionListButton )
	selectionList:setVerticalCount( 3 )
	selectionList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ProcessListAction( self, element, controller )
		return retVal
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local MinimapFull0 = LUI.UIImage.new()
	MinimapFull0:setLeftRight( true, false, 294, 1068 )
	MinimapFull0:setTopBottom( true, false, 90, 520 )
	MinimapFull0:setRGB( 1, 1, 1 )
	MinimapFull0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	MinimapFull0:setupCompassMap( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( MinimapFull0 )
	self.MinimapFull0 = MinimapFull0
	
	local MinimapFull1 = LUI.UIImage.new()
	MinimapFull1:setLeftRight( true, false, 294, 1068 )
	MinimapFull1:setTopBottom( true, false, 90, 520 )
	MinimapFull1:setRGB( 1, 1, 1 )
	MinimapFull1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	MinimapFull1:setupCompassItems( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( MinimapFull1 )
	self.MinimapFull1 = MinimapFull1
	
	local MinimapFull2 = LUI.UIImage.new()
	MinimapFull2:setLeftRight( true, false, 294, 1068 )
	MinimapFull2:setTopBottom( true, false, 90, 520 )
	MinimapFull2:setRGB( 1, 1, 1 )
	MinimapFull2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	MinimapFull2:setupCompassOverlay( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( MinimapFull2 )
	self.MinimapFull2 = MinimapFull2
	
	local objectivesList = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, true )
	objectivesList:makeFocusable()
	objectivesList:setLeftRight( true, false, 20, 280 )
	objectivesList:setTopBottom( true, false, 190, 1020 )
	objectivesList:setRGB( 1, 1, 1 )
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
	selectionList.id = "selectionList"
	objectivesList.id = "objectivesList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.selectionList:close()
		self.objectivesList:close()
		CoD.MissionTab.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

