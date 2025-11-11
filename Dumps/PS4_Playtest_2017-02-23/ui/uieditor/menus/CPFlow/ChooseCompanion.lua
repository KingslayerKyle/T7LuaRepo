require( "ui.uieditor.widgets.BackgroundFrames.PrototypeBackgroundFrame" )
require( "ui.uieditor.widgets.Lobby.Flyouts.lobbyFlyout_GenericSelectionButton" )

LUI.createMenu.ChooseCompanion = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseCompanion" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseCompanion.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local PrototypeBackgroundFrame = CoD.PrototypeBackgroundFrame.new( self, controller )
	PrototypeBackgroundFrame:setLeftRight( 0, 1, 0, 0 )
	PrototypeBackgroundFrame:setTopBottom( 0, 1, 0, 0 )
	PrototypeBackgroundFrame:setZoom( 10 )
	self:addElement( PrototypeBackgroundFrame )
	self.PrototypeBackgroundFrame = PrototypeBackgroundFrame
	
	local selectionList = LUI.UIList.new( self, controller, -28, 0, nil, false, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( 0, 0, 283, 1651 )
	selectionList:setTopBottom( 0, 0, 678, 840 )
	selectionList:setZoom( 50 )
	selectionList:setWidgetType( CoD.lobbyFlyout_GenericSelectionButton )
	selectionList:setHorizontalCount( 10 )
	selectionList:setSpacing( -28 )
	selectionList:setDataSource( "CompanionList" )
	selectionList:linkToElementModel( selectionList, "locked", true, function ( model )
		local element = selectionList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "locked"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		CoD.CPUtility.CompanionHighlighted( controller, self, element )
		return retVal
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN ) and not IsSelfModelValueTrue( element, controller, "locked" ) then
			CoD.CPUtility.SelectCompanion( controller, menu, element )
			CoD.CPUtility.SetupStartingMission( controller )
			SetFirstTimeSetupComplete( self, element, controller )
			GoBackToMenu( menu, controller, "Lobby" )
			SendCustomClientScriptNotifyForAdjustedClient( controller, "menu_change", {
				menu = "Main",
				status = "closeToMenu"
			} )
			return true
		elseif not IsPlayerStatEqualToElementProperty( controller, "companion", element, "characterIndex" ) and not IsSelfModelValueTrue( element, controller, "locked" ) then
			OpenSystemOverlay( self, menu, controller, "ConfirmCompanionChange", element.characterIndex )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "locked" ) then
			GoBack( self, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN ) and not IsSelfModelValueTrue( element, controller, "locked" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
			return true
		elseif not IsPlayerStatEqualToElementProperty( controller, "companion", element, "characterIndex" ) and not IsSelfModelValueTrue( element, controller, "locked" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "locked" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
			return true
		else
			return false
		end
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
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
	TextBox:setText( Engine.Localize( "MENU_CHOOSE_COMPANION" ) )
	TextBox:setTTF( "fonts/default.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN ) then
			SendClientScriptMenuChangeNotify( controller, self, true )
			SendClientScriptNotifyForAdjustedClient( controller, "updateCpCompanion", "show" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	PrototypeBackgroundFrame:setModel( self.buttonModel, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PrototypeBackgroundFrame:close()
		self.selectionList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseCompanion.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

