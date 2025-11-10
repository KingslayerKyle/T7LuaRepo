require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.ListButton" )
require( "ui.uieditor.menus.AccountLink.UmbrellaSignIn" )
require( "ui.uieditor.menus.AccountLink.TermsOfService" )

LUI.createMenu.UmbrellaNewUserBegin = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "UmbrellaNewUserBegin" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "FrontendMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "UmbrellaNewUserBegin.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local DialogBackground0 = CoD.DialogBackground.new( self, controller )
	DialogBackground0:setLeftRight( true, false, 164, 1116 )
	DialogBackground0:setTopBottom( true, false, 86, 634 )
	self:addElement( DialogBackground0 )
	self.DialogBackground0 = DialogBackground0
	
	local ListButton0 = CoD.ListButton.new( self, controller )
	ListButton0:setLeftRight( true, false, 477, 837 )
	ListButton0:setTopBottom( true, false, 528, 563 )
	ListButton0.Text.Text0:setText( Engine.Localize( "ACCOUNT_LINK_SIGNIN" ) )
	ListButton0:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	ListButton0:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	self:AddButtonCallbackFunction( ListButton0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsInDefaultState( element ) then
			GoBackAndOpenOverlayOnParent( self, "UmbrellaSignIn", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsInDefaultState( element ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( ListButton0 )
	self.ListButton0 = ListButton0
	
	local ListButton1 = CoD.ListButton.new( self, controller )
	ListButton1:setLeftRight( true, false, 477, 837 )
	ListButton1:setTopBottom( false, true, -157, -122 )
	ListButton1.Text.Text0:setText( Engine.Localize( "ACCOUNT_LINK_CREATE" ) )
	ListButton1:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	ListButton1:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( ListButton1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsInDefaultState( element ) then
			GoBackAndOpenOverlayOnParent( self, "TermsOfService", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsInDefaultState( element ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( ListButton1 )
	self.ListButton1 = ListButton1
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 485, 795 )
	Label0:setTopBottom( true, false, 122.76, 170.76 )
	Label0:setText( Engine.Localize( "ACCOUNT_LINK_MARKETING" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	ListButton0.navigation = {
		down = ListButton1
	}
	ListButton1.navigation = {
		up = ListButton0
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		AccountLink_SetAccountLinkViewed( self, element, controller )
		GoBack( self, controller )
		LobbyBeginPlay( self, controller )
		PlaySoundSetSound( self, "action" )
		LoadSaveGameData( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "Skip" )
		return true
	end, false )
	ListButton0.id = "ListButton0"
	ListButton1.id = "ListButton1"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ListButton0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DialogBackground0:close()
		element.ListButton0:close()
		element.ListButton1:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "UmbrellaNewUserBegin.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

