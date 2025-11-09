require( "ui.uieditor.widgets.MenuSpecificWidgets.SelectSideMission.missionNameWidget" )

local PostLoadFunc = function ( self )
	self.sideMissionList:processEvent( {
		name = "gain_focus",
		controller = controller
	} )
	if self.m_ownerController then
		Engine.LockInput( self.m_ownerController, true )
		self.close = function ( self )
			Engine.LockInput( self.m_ownerController, false )
			CoD.Menu.close( self )
		end
		
	end
end

LUI.createMenu.SelectSideMission = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SelectSideMission" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local textBackground = LUI.UIImage.new()
	textBackground:setLeftRight( false, false, 13.5, 513.5 )
	textBackground:setTopBottom( true, false, 224, 410 )
	textBackground:setRGB( 0, 0, 0 )
	textBackground:setAlpha( 0.4 )
	textBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( textBackground )
	self.textBackground = textBackground
	
	local sideMissionList = LUI.UIList.new( self, controller, 4, 0, nil, false, false, 0, 0, false, true )
	sideMissionList:makeFocusable()
	sideMissionList:setLeftRight( false, false, -400, 0 )
	sideMissionList:setTopBottom( true, false, 224, 496 )
	sideMissionList:setRGB( 1, 1, 1 )
	sideMissionList:setDataSource( "SideMissionSelectList" )
	sideMissionList:setWidgetType( CoD.missionNameWidget )
	sideMissionList:setVerticalCount( 4 )
	sideMissionList:setSpacing( 4 )
	sideMissionList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		LaunchSideMission( self, element, controller )
		GoBack( self, controller )
		SendMenuResponse( self, "SelectSideMission", "selected", controller )
		return retVal
	end )
	self:addElement( sideMissionList )
	self.sideMissionList = sideMissionList
	
	local missionDescriptionTextBox = LUI.UIText.new()
	missionDescriptionTextBox:setLeftRight( false, false, 23.5, 503.5 )
	missionDescriptionTextBox:setTopBottom( true, false, 284, 314 )
	missionDescriptionTextBox:setRGB( 1, 1, 1 )
	missionDescriptionTextBox:setTTF( "fonts/default.ttf" )
	missionDescriptionTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	missionDescriptionTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( missionDescriptionTextBox )
	self.missionDescriptionTextBox = missionDescriptionTextBox
	
	local missionTypeTextBox = LUI.UIText.new()
	missionTypeTextBox:setLeftRight( false, false, 23.5, 503.5 )
	missionTypeTextBox:setTopBottom( true, false, 224, 284 )
	missionTypeTextBox:setRGB( 1, 1, 1 )
	missionTypeTextBox:setTTF( "fonts/default.ttf" )
	missionTypeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	missionTypeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( missionTypeTextBox )
	self.missionTypeTextBox = missionTypeTextBox
	
	missionDescriptionTextBox:linkToElementModel( sideMissionList, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			missionDescriptionTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	missionTypeTextBox:linkToElementModel( sideMissionList, "missionTypeDisplay", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			missionTypeTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_CANCEL" ), "ESC", element )
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
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESC") then
			GoBack( self, controller )
			SendMenuResponse( self, "SelectSideMission", "close", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	sideMissionList.id = "sideMissionList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.sideMissionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.sideMissionList:close()
		self.missionDescriptionTextBox:close()
		self.missionTypeTextBox:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

