require( "ui.uieditor.widgets.Social.Social_PlayersList_ManageParty" )

local PostLoadFunc = function ( self, controller )
	local lockedInModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" )
	self:subscribeToModel( lockedInModel, function ( model )
		local lockedIn = Engine.GetModelValue( model )
		if lockedIn == true then
			ShowSocialPartyWidget( controller )
			GoBack( self, controller )
		end
	end )
end

LUI.createMenu.Social_Party_ManagePartyPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Social_Party_ManagePartyPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Social_Party_ManagePartyPopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local playersManageParty = CoD.Social_PlayersList_ManageParty.new( self, controller )
	playersManageParty:setLeftRight( 0, 0, 81, 1049 )
	playersManageParty:setTopBottom( 0, 0, 237, 1008 )
	playersManageParty:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	playersManageParty:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( playersManageParty, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowSocialPartyWidget( controller )
		ManagePartyAction( menu, self, element, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( playersManageParty )
	self.playersManageParty = playersManageParty
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ShowSocialPartyWidget( controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
	playersManageParty.id = "playersManageParty"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.playersManageParty:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.playersManageParty:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Social_Party_ManagePartyPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

