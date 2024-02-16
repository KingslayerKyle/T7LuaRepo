-- 29f0d181ba7499c830cd3b5dd302ac6b
-- This hash is used for caching, delete to decompile the file again

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
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local TerminalLauncher = CoD.TerminalLauncher.new( f1_local1, controller )
	TerminalLauncher:setLeftRight( false, false, -380, 520 )
	TerminalLauncher:setTopBottom( true, false, 85, 685 )
	Engine.SetupUI3DWindow( controller, 5, 900, 600 )
	TerminalLauncher:setUI3DWindow( 5 )
	self:addElement( TerminalLauncher )
	self.TerminalLauncher = TerminalLauncher
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( f1_local1, controller )
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
	
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f3_local0 = nil
		if TestAndSetFirstTimeMenu( controller, "com_firsttime_pdv" ) then
			OpenGenericLargePopup( f1_local1, controller, "MENU_FIRSTTIME_PDV", "MENU_FIRSTTIME_PDV2", "com_firsttime_pdv_image", "MENU_FIRSTTIME_PDV_BUTTONTEXT", "", "" )
		end
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		PDV_DataVaultOpened( self, controller )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		PDV_DataVaultClosed( self, f7_arg2 )
		PlaySoundSetSound( self, "menu_go_back" )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f1_local1
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

