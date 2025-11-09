require( "ui.uieditor.widgets.Terminal.TerminalLauncher" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

LUI.createMenu.PersonalDataVaultMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PersonalDataVaultMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PersonalDataVaultMenu.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local TerminalLauncher = CoD.TerminalLauncher.new( self, controller )
	TerminalLauncher:setLeftRight( false, false, -380, 520 )
	TerminalLauncher:setTopBottom( true, false, 85, 685 )
	Engine.SetupUI3DWindow( controller, 5, 900, 600 )
	TerminalLauncher:setUI3DWindow( 5 )
	self:addElement( TerminalLauncher )
	self.TerminalLauncher = TerminalLauncher
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		SizeToSafeArea( element, controller )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f3_local0 = nil
		if TestAndSetFirstTimeMenu( controller, "com_firsttime_pdv" ) then
			OpenGenericLargePopup( self, controller, "MENU_FIRSTTIME_PDV", "MENU_FIRSTTIME_PDV2", "com_firsttime_pdv_image", "MENU_FIRSTTIME_PDV_BUTTONTEXT", "", "" )
		end
		if not f3_local0 then
			f3_local0 = self:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f4_local0 = nil
		PDV_DataVaultOpened( self, controller )
		if not f4_local0 then
			f4_local0 = self:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		PDV_DataVaultClosed( self, controller )
		PlaySoundSetSound( self, "menu_go_back" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	TerminalLauncher.id = "TerminalLauncher"
	feFooterContainer:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.TerminalLauncher:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TerminalLauncher:close()
		element.feFooterContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PersonalDataVaultMenu.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

