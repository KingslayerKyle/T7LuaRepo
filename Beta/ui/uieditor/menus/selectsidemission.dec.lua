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
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SelectSideMission.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local textBackground = LUI.UIImage.new()
	textBackground:setLeftRight( false, false, 13.5, 513.5 )
	textBackground:setTopBottom( true, false, 224, 410 )
	textBackground:setRGB( 0, 0, 0 )
	textBackground:setAlpha( 0.4 )
	self:addElement( textBackground )
	self.textBackground = textBackground
	
	local sideMissionList = LUI.UIList.new( menu, controller, 4, 0, nil, false, false, 0, 0, false, true )
	sideMissionList:makeFocusable()
	sideMissionList:setLeftRight( false, false, -400, 0 )
	sideMissionList:setTopBottom( true, false, 224, 496 )
	sideMissionList:setDataSource( "SideMissionSelectList" )
	sideMissionList:setWidgetType( CoD.missionNameWidget )
	sideMissionList:setVerticalCount( 4 )
	sideMissionList:setSpacing( 4 )
	sideMissionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	sideMissionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( sideMissionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		LaunchSideMission( self, element, controller )
		GoBack( self, controller )
		SendMenuResponse( self, "SelectSideMission", "selected", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( sideMissionList )
	self.sideMissionList = sideMissionList
	
	local missionDescriptionTextBox = LUI.UIText.new()
	missionDescriptionTextBox:setLeftRight( false, false, 23.5, 503.5 )
	missionDescriptionTextBox:setTopBottom( true, false, 284, 314 )
	missionDescriptionTextBox:setTTF( "fonts/default.ttf" )
	missionDescriptionTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	missionDescriptionTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( missionDescriptionTextBox )
	self.missionDescriptionTextBox = missionDescriptionTextBox
	
	local missionTypeTextBox = LUI.UIText.new()
	missionTypeTextBox:setLeftRight( false, false, 23.5, 503.5 )
	missionTypeTextBox:setTopBottom( true, false, 224, 284 )
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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESC", function ( element, menu, controller, model )
		GoBack( self, controller )
		SendMenuResponse( self, "SelectSideMission", "close", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_CANCEL" )
		return true
	end, false )
	sideMissionList.id = "sideMissionList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.sideMissionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.sideMissionList:close()
		self.missionDescriptionTextBox:close()
		self.missionTypeTextBox:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SelectSideMission.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

