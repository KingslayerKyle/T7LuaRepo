require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.menus.CPLevels.CPSelectDifficulty" )
require( "ui.uieditor.widgets.Heroes.chooseFaceOption" )

local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	self.disableDarkenElement = true
end

LUI.createMenu.ChooseHead = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseHead" )
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
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "HEROES_SELECT_HEAD" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local selectionList = LUI.UIList.new( self, controller, 8, 0, nil, false, false, 0, 0, false, true )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 64, 464 )
	selectionList:setTopBottom( true, false, 108.03, 644.03 )
	selectionList:setRGB( 1, 1, 1 )
	selectionList:setDataSource( "HeroFaceButtonList" )
	selectionList:setWidgetType( CoD.chooseFaceOption )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 8 )
	selectionList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsDisabled( element, controller ) and IsFirstTimeSetup( controller ) then
			SelectHead( self, element, controller )
			UploadStats( self, controller )
			SendClientScriptNotify( controller, "updateHero", "refresh" )
			SendOwnMenuResponse( self, controller, "closed" )
			OpenOverlay( self, "CPSelectDifficulty", controller )
		elseif not IsDisabled( element, controller ) then
			SelectHead( self, element, controller )
			UploadStats( self, controller )
			SendClientScriptNotify( controller, "updateHero", "refresh" )
			GoBackToMenu( self, controller, "OutfitsMainMenu" )
			SendOwnMenuResponse( self, controller, "closed" )
		end
		return retVal
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
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
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
			SendOwnMenuResponse( self, controller, "closed" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendOwnMenuResponse( self, controller, "opened" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	selectionList.id = "selectionList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.GenericMenuFrame0:close()
		self.selectionList:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

