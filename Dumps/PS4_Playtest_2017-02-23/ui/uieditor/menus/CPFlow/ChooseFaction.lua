require( "ui.uieditor.menus.CharacterCustomization.ChooseGender" )
require( "ui.uieditor.widgets.BackgroundFrames.PrototypeBackgroundFrame" )
require( "ui.uieditor.widgets.CPFlow.chooseFactionButton" )

LUI.createMenu.ChooseFaction = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseFaction" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseFaction.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local PrototypeBackgroundFrame = CoD.PrototypeBackgroundFrame.new( self, controller )
	PrototypeBackgroundFrame:setLeftRight( 0, 1, 0, 0 )
	PrototypeBackgroundFrame:setTopBottom( 0, 1, 0, 0 )
	PrototypeBackgroundFrame:setZoom( 10 )
	self:addElement( PrototypeBackgroundFrame )
	self.PrototypeBackgroundFrame = PrototypeBackgroundFrame
	
	local factionList = LUI.UIList.new( self, controller, -28, 0, nil, false, false, 0, 0, false, false )
	factionList:makeFocusable()
	factionList:setLeftRight( 0.5, 0.5, -864, -568 )
	factionList:setTopBottom( 1, 1, -518, -356 )
	factionList:setZoom( 50 )
	factionList:setWidgetType( CoD.chooseFactionButton )
	factionList:setHorizontalCount( 2 )
	factionList:setSpacing( -28 )
	factionList:setDataSource( "CPFactions" )
	factionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		CoD.CPUtility.FactionHighlighted( controller, self, element )
		return retVal
	end )
	factionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	factionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( factionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN ) then
			CoD.CPUtility.ChooseFaction( controller, menu, element )
			NavigateToMenu( self, "ChooseGender", true, controller )
			ClearMenuSavedState( menu )
			return true
		elseif not IsPlayerStatEqualToElementProperty( controller, "faction", element, "faction" ) then
			OpenSystemOverlay( self, menu, controller, "ConfirmFactionChange", element.faction )
			return true
		else
			GoBack( self, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
		return true
	end, false )
	self:addElement( factionList )
	self.factionList = factionList
	
	local TitleBox = LUI.UIText.new()
	TitleBox:setLeftRight( 0, 0, 96, 896 )
	TitleBox:setTopBottom( 0, 0, 434, 464 )
	TitleBox:setRGB( 0.74, 1, 0.9 )
	TitleBox:setAlpha( 0.5 )
	TitleBox:setZoom( 25 )
	TitleBox:setText( Engine.Localize( "MENU_DESCRIPTION" ) )
	TitleBox:setTTF( "fonts/default.ttf" )
	TitleBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TitleBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( 0, 0, 96, 896 )
	TextBox:setTopBottom( 0, 0, 359, 434 )
	TextBox:setRGB( 0.74, 1, 0.9 )
	TextBox:setAlpha( 0.3 )
	TextBox:setZoom( 25 )
	TextBox:setText( Engine.Localize( "MENU_CHOOSE_FACTION" ) )
	TextBox:setTTF( "fonts/default.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if not IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN ) then
			GoBack( self, controller )
			ClearMenuSavedState( menu )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		else
			return false
		end
	end, false )
	PrototypeBackgroundFrame:setModel( self.buttonModel, controller )
	factionList.id = "factionList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.factionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PrototypeBackgroundFrame:close()
		self.factionList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseFaction.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

