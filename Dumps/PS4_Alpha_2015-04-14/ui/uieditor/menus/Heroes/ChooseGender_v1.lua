require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.menus.Heroes.ChooseHead_v1" )
require( "ui.uieditor.widgets.Heroes.chooseGenderButton" )

local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	self.restoreState = function ( self )
		local findGender = Engine.GetEquippedGender( controller )
		local focusedWidget = self.genderList:findItem( nil, {
			gender = findGender
		}, nil, false )
		if focusedWidget then
			self.genderList:processEvent( {
				name = "gain_focus",
				controller = controller,
				selectIndex = focusedWidget.gridInfoTable.zeroBasedIndex
			} )
		else
			self.genderList:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
		end
		return true
	end
	
end

LUI.createMenu.ChooseGender_v1 = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseGender_v1" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0:setRGB( 1, 1, 1 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "HEROES_CHARACTER_GENDER" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local genderList = LUI.UIList.new( self, controller, 20, 0, nil, false, false, 0, 0, false, true )
	genderList:makeFocusable()
	genderList:setLeftRight( true, false, 430, 850 )
	genderList:setTopBottom( true, false, 127, 627 )
	genderList:setRGB( 1, 1, 1 )
	genderList:setDataSource( "GendersList" )
	genderList:setWidgetType( CoD.chooseGenderButton )
	genderList:setHorizontalCount( 2 )
	genderList:setSpacing( 20 )
	genderList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if IsFirstTimeSetup( controller ) then
			SelectGender( self, element, controller )
			NavigateToMenu( self, "ChooseHead_v1", true, controller )
			SendMenuResponse( self, "ChooseGender_v1", "closed", controller )
		elseif not IsFirstTimeSetup( controller ) then
			SelectGender( self, element, controller )
			GoBack( self, controller )
			SendMenuResponse( self, "ChooseGender_v1", "closed", controller )
		end
		return retVal
	end )
	self:addElement( genderList )
	self.genderList = genderList
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
			SendMenuResponse( self, "ChooseGender_v1", "closed", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendMenuResponse( self, "ChooseGender_v1", "opened", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	genderList.id = "genderList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.genderList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.GenericMenuFrame0:close()
		self.genderList:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

