require( "ui.uieditor.widgets.MenuSpecificWidgets.CampaignMissionButton" )

LUI.createMenu.MissionSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MissionSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MissionSelect.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local missionButtonList = LUI.UIList.new( menu, controller, 5, 0, nil, false, false, 0, 0, false, true )
	missionButtonList:makeFocusable()
	missionButtonList:setLeftRight( true, false, 137, 287 )
	missionButtonList:setTopBottom( true, false, 191, 666 )
	missionButtonList:setDataSource( "CampaignMissionList" )
	missionButtonList:setWidgetType( CoD.CampaignMissionButton )
	missionButtonList:setVerticalCount( 15 )
	missionButtonList:setSpacing( 5 )
	missionButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	missionButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( missionButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		LaunchLevel( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( missionButtonList )
	self.missionButtonList = missionButtonList
	
	local missionSelectTitle = LUI.UITightText.new()
	missionSelectTitle:setLeftRight( true, false, 122, 338 )
	missionSelectTitle:setTopBottom( true, false, 94.21, 127.21 )
	missionSelectTitle:setText( Engine.Localize( "MISSION SELECT" ) )
	missionSelectTitle:setTTF( "fonts/default.ttf" )
	self:addElement( missionSelectTitle )
	self.missionSelectTitle = missionSelectTitle
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	missionButtonList.id = "missionButtonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.missionButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.missionButtonList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MissionSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

