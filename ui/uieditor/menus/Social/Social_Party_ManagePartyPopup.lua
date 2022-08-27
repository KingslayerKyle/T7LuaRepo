-- 1219213334e320c0a0322f707922ff4a
-- This hash is used for caching, delete to decompile the file again

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
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local playersManageParty = CoD.Social_PlayersList_ManageParty.new( f3_local1, controller )
	playersManageParty:setLeftRight( true, false, 54, 699 )
	playersManageParty:setTopBottom( true, false, 158, 672 )
	playersManageParty:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	f3_local1:AddButtonCallbackFunction( playersManageParty, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		ShowSocialPartyWidget( f6_arg2 )
		ManagePartyAction( f6_arg1, self, f6_arg0, f6_arg2 )
		GoBack( self, f6_arg2 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( playersManageParty )
	self.playersManageParty = playersManageParty
	
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		ShowSocialPartyWidget( f8_arg2 )
		GoBack( self, f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	playersManageParty.id = "playersManageParty"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
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

