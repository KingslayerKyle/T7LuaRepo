require( "ui.uieditor.widgets.Social.Social_PlayersList_ManageParty" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		if Engine.GetModelValue( model ) == true then
			ShowSocialPartyWidget( f1_arg1 )
			GoBack( f1_arg0, f1_arg1 )
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Social_Party_ManagePartyPopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local playersManageParty = CoD.Social_PlayersList_ManageParty.new( self, controller )
	playersManageParty:setLeftRight( true, false, 54, 699 )
	playersManageParty:setTopBottom( true, false, 158, 672 )
	playersManageParty:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	playersManageParty:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	self:AddButtonCallbackFunction( playersManageParty, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowSocialPartyWidget( controller )
		ManagePartyAction( menu, self, element, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( playersManageParty )
	self.playersManageParty = playersManageParty
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ShowSocialPartyWidget( controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.playersManageParty:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Social_Party_ManagePartyPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

