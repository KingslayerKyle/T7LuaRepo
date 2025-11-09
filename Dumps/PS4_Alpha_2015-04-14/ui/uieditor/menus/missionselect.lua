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
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local missionButtonList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, true )
	missionButtonList:makeFocusable()
	missionButtonList:setLeftRight( true, false, 137, 287 )
	missionButtonList:setTopBottom( true, false, 191, 666 )
	missionButtonList:setRGB( 1, 1, 1 )
	missionButtonList:setDataSource( "CampaignMissionList" )
	missionButtonList:setWidgetType( CoD.CampaignMissionButton )
	missionButtonList:setVerticalCount( 15 )
	missionButtonList:setSpacing( 5 )
	missionButtonList:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		LaunchLevel( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( missionButtonList )
	self.missionButtonList = missionButtonList
	
	local missionSelectTitle = LUI.UITightText.new()
	missionSelectTitle:setLeftRight( true, false, 122, 338 )
	missionSelectTitle:setTopBottom( true, false, 94.21, 127.21 )
	missionSelectTitle:setRGB( 1, 1, 1 )
	missionSelectTitle:setText( Engine.Localize( "MISSION SELECT" ) )
	missionSelectTitle:setTTF( "fonts/default.ttf" )
	self:addElement( missionSelectTitle )
	self.missionSelectTitle = missionSelectTitle
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "A", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "A") then
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self.close = function ( self )
		self.missionButtonList:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

