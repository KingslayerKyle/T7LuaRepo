require( "ui.uieditor.menus.CAC.Popups.ClassOptions" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackground_old" )
require( "ui.uieditor.menus.CAC.Old.CustomClass_old" )
require( "ui.uieditor.widgets.CAC.List1ButtonChooseClass" )
require( "ui.uieditor.widgets.CAC.MenuChooseClassold.chooseClassWidget_old" )

local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
end

local PostLoadFunc = function ( self, controller )
	Engine.ExecNow( controller, "setupweapondefs" )
	if CoD.CACUtility.FromCustomClass then
		self:playSound( "cac_reenter" )
		CoD.CACUtility.FromCustomClass = false
	else
		self:playSound( "cac_enter" )
	end
	self.chooseClassWidget:subscribeToElementModel( self.buttonList, nil, function ( model )
		self.chooseClassWidget:setModel( model, controller )
	end )
	self:processEvent( {
		name = "update_state",
		controller = controller
	} )
	self:processEvent( {
		name = "update_class",
		controller = controller
	} )
	if Dvar.ui_extracamCAC:get() then
		SendLobbyMenuResponse( self, controller, "chooseClass" )
	end
end

LUI.createMenu.chooseClass_old = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "chooseClass_old" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local backgroundtempimage = LUI.UIImage.new()
	backgroundtempimage:setLeftRight( true, false, 0, 1280 )
	backgroundtempimage:setTopBottom( true, false, 0, 720 )
	backgroundtempimage:setRGB( 1, 1, 1 )
	backgroundtempimage:setImage( RegisterImage( "uie_img_t7_menu_cacselection_tempbackdrop" ) )
	backgroundtempimage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( backgroundtempimage )
	self.backgroundtempimage = backgroundtempimage
	
	local background = CoD.CACBackground_old.new( self, controller )
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 1, 1, 1 )
	background.titleLabel:setText( Engine.Localize( "MPUI_CHOOSE_CLASS_CAPS" ) )
	self:addElement( background )
	self.background = background
	
	local buttonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 47, 327 )
	buttonList:setTopBottom( true, false, 98, 266 )
	buttonList:setRGB( 1, 1, 1 )
	buttonList:setDataSource( "ChooseClassList" )
	buttonList:setWidgetType( CoD.List1ButtonChooseClass )
	buttonList:setVerticalCount( 5 )
	buttonList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		SetCustomClassNum( self, element, controller )
		NavigateToMenu( self, "CustomClass_old", true, controller )
		return retVal
	end )
	buttonList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetCustomClassNum( self, element, controller )
		ResetCustomClassStartingFocus( self, element, controller, true )
		return retVal
	end )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local chooseClassWidget = CoD.chooseClassWidget_old.new( self, controller )
	chooseClassWidget:setLeftRight( false, true, -965, -144.5 )
	chooseClassWidget:setTopBottom( true, false, 103, 646 )
	chooseClassWidget:setRGB( 1, 1, 1 )
	self:addElement( chooseClassWidget )
	self.chooseClassWidget = chooseClassWidget
	
	background:linkToElementModel( buttonList, nil, false, function ( model )
		background:setModel( model, controller )
	end )
	chooseClassWidget:linkToElementModel( buttonList, nil, false, function ( model )
		chooseClassWidget:setModel( model, controller )
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT_CAPS" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_CLASS_OPTIONS_CAPS" ), "O", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.alt1( self, self, {
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
			PartyHostSetState( self, controller, CoD.PARTYHOST_STATE_NONE )
			GoBack( self, controller )
			ClearSavedState( self, controller )
			UploadStats( self, controller )
			ResetCustomClassStartingFocus( self, element, controller, true )
		end
		if not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "O") then
			NavigateToMenu( self, "ClassOptions", true, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "update_class", function ( element, event )
		local retVal = nil
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		LobbySetLeaderActivity( self, controller, "MODIFYING_CAC" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	buttonList.id = "buttonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.background:close()
		self.buttonList:close()
		self.chooseClassWidget:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

