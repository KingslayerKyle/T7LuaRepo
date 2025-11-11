require( "ui.uieditor.widgets.MenuSpecificWidgets.CampaignMissionButton" )

LUI.createMenu.MissionSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MissionSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MissionSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local missionButtonList = LUI.UIList.new( self, controller, 8, 0, nil, false, false, 0, 0, false, false )
	missionButtonList:makeFocusable()
	missionButtonList:setLeftRight( 0, 0, 205, 430 )
	missionButtonList:setTopBottom( 0, 0, 286.5, 998.5 )
	missionButtonList:setWidgetType( CoD.CampaignMissionButton )
	missionButtonList:setVerticalCount( 15 )
	missionButtonList:setSpacing( 8 )
	missionButtonList:setDataSource( "CampaignMissionList" )
	missionButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	self:AddButtonCallbackFunction( missionButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		LaunchLevel( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( missionButtonList )
	self.missionButtonList = missionButtonList
	
	local missionSelectTitle = LUI.UITightText.new()
	missionSelectTitle:setLeftRight( 0, 0, 183, 507 )
	missionSelectTitle:setTopBottom( 0, 0, 141, 191 )
	missionSelectTitle:setText( Engine.Localize( "MISSION SELECT" ) )
	missionSelectTitle:setTTF( "fonts/default.ttf" )
	self:addElement( missionSelectTitle )
	self.missionSelectTitle = missionSelectTitle
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	missionButtonList.id = "missionButtonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
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

