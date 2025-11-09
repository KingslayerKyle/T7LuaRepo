require( "ui.uieditor.widgets.MenuSpecificWidgets.SelectSideMission.missionNameWidget" )

local PostLoadFunc = function ( f1_arg0 )
	f1_arg0.sideMissionList:processEvent( {
		name = "gain_focus",
		controller = controller
	} )
	if f1_arg0.m_ownerController then
		Engine.LockInput( f1_arg0.m_ownerController, true )
		f1_arg0.close = function ( f2_arg0 )
			Engine.LockInput( f2_arg0.m_ownerController, false )
			CoD.Menu.close( f2_arg0 )
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
	self.anyChildUsesUpdateState = true
	
	local textBackground = LUI.UIImage.new()
	textBackground:setLeftRight( false, false, 13.5, 513.5 )
	textBackground:setTopBottom( true, false, 224, 410 )
	textBackground:setRGB( 0, 0, 0 )
	textBackground:setAlpha( 0.4 )
	self:addElement( textBackground )
	self.textBackground = textBackground
	
	local sideMissionList = LUI.UIList.new( self, controller, 4, 0, nil, false, false, 0, 0, false, true )
	sideMissionList:makeFocusable()
	sideMissionList:setLeftRight( false, false, -400, 0 )
	sideMissionList:setTopBottom( true, false, 224, 496 )
	sideMissionList:setDataSource( "SideMissionSelectList" )
	sideMissionList:setWidgetType( CoD.missionNameWidget )
	sideMissionList:setVerticalCount( 4 )
	sideMissionList:setSpacing( 4 )
	sideMissionList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	sideMissionList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	self:AddButtonCallbackFunction( sideMissionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
		local desc = Engine.GetModelValue( model )
		if desc then
			missionDescriptionTextBox:setText( Engine.Localize( desc ) )
		end
	end )
	missionTypeTextBox:linkToElementModel( sideMissionList, "missionTypeDisplay", true, function ( model )
		local missionTypeDisplay = Engine.GetModelValue( model )
		if missionTypeDisplay then
			missionTypeTextBox:setText( Engine.Localize( missionTypeDisplay ) )
		end
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESC", function ( element, menu, controller, model )
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
		menu = self
	} )
	if not self:restoreState() then
		self.sideMissionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.sideMissionList:close()
		element.missionDescriptionTextBox:close()
		element.missionTypeTextBox:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SelectSideMission.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

