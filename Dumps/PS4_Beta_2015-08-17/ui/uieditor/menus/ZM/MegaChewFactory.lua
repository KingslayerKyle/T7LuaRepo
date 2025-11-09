require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewMachine" )
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsole" )

LUI.createMenu.MegaChewFactory = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MegaChewFactory" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MegaChewFactory.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_MegaChew_FACTORY_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MegaChew_FACTORY_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local MegaChewMachine0 = CoD.MegaChewMachine.new( self, controller )
	MegaChewMachine0:setLeftRight( true, false, 342, 470 )
	MegaChewMachine0:setTopBottom( true, false, 296, 424 )
	MegaChewMachine0:subscribeToGlobalModel( controller, "MegaChewMachines", "machine0", function ( model )
		MegaChewMachine0:setModel( model, controller )
	end )
	MegaChewMachine0:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		MegaChewFactoryFocusChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MegaChewMachine0:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( MegaChewMachine0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if HasBGBTokensRemaining( element, controller ) then
			MegaChewFactoryPurchase( self, element, controller )
			return true
		else
			MegaChewFactoryMachineSelect( self, element, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( MegaChewMachine0 )
	self.MegaChewMachine0 = MegaChewMachine0
	
	local MegaChewMachine1 = CoD.MegaChewMachine.new( self, controller )
	MegaChewMachine1:setLeftRight( true, false, 576, 704 )
	MegaChewMachine1:setTopBottom( true, false, 296, 424 )
	MegaChewMachine1:subscribeToGlobalModel( controller, "MegaChewMachines", "machine1", function ( model )
		MegaChewMachine1:setModel( model, controller )
	end )
	MegaChewMachine1:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		MegaChewFactoryFocusChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MegaChewMachine1:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( MegaChewMachine1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if HasBGBTokensRemaining( element, controller ) then
			MegaChewFactoryPurchase( self, element, controller )
			return true
		else
			MegaChewFactoryMachineSelect( self, element, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( MegaChewMachine1 )
	self.MegaChewMachine1 = MegaChewMachine1
	
	local MegaChewMachine2 = CoD.MegaChewMachine.new( self, controller )
	MegaChewMachine2:setLeftRight( true, false, 809, 937 )
	MegaChewMachine2:setTopBottom( true, false, 296, 424 )
	MegaChewMachine2:subscribeToGlobalModel( controller, "MegaChewMachines", "machine2", function ( model )
		MegaChewMachine2:setModel( model, controller )
	end )
	MegaChewMachine2:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		MegaChewFactoryFocusChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MegaChewMachine2:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( MegaChewMachine2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if HasBGBTokensRemaining( element, controller ) then
			MegaChewFactoryPurchase( self, element, controller )
			return true
		else
			MegaChewFactoryMachineSelect( self, element, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( MegaChewMachine2 )
	self.MegaChewMachine2 = MegaChewMachine2
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 141.39, 213.39 )
	Label0:setTopBottom( true, false, 271.5, 320.5 )
	Label0:setTTF( "fonts/default.ttf" )
	Label0:subscribeToGlobalModel( controller, "MegaChewTokens", "remainingTokens", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Label1 = LUI.UITightText.new()
	Label1:setLeftRight( true, false, 350.5, 461.5 )
	Label1:setTopBottom( true, false, 320.5, 372.5 )
	Label1:setText( Engine.Localize( "Spend 1" ) )
	Label1:setTTF( "fonts/default.ttf" )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	local Label10 = LUI.UITightText.new()
	Label10:setLeftRight( true, false, 582.5, 697.5 )
	Label10:setTopBottom( true, false, 320.5, 372.5 )
	Label10:setText( Engine.Localize( "Spend 2" ) )
	Label10:setTTF( "fonts/default.ttf" )
	self:addElement( Label10 )
	self.Label10 = Label10
	
	local Label100 = LUI.UITightText.new()
	Label100:setLeftRight( true, false, 815.5, 930.5 )
	Label100:setTopBottom( true, false, 320.5, 372.5 )
	Label100:setText( Engine.Localize( "Spend 3" ) )
	Label100:setTTF( "fonts/default.ttf" )
	self:addElement( Label100 )
	self.Label100 = Label100
	
	local console = CoD.CenterConsole.new( self, controller )
	console:setLeftRight( false, false, -370, 370 )
	console:setTopBottom( true, false, 123, 221 )
	self:addElement( console )
	self.console = console
	
	MegaChewMachine0.navigation = {
		right = MegaChewMachine1
	}
	MegaChewMachine1.navigation = {
		left = MegaChewMachine0,
		right = MegaChewMachine2
	}
	MegaChewMachine2.navigation = {
		left = MegaChewMachine1
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "T", function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		UploadStats( self, controller )
		MegaChewFactoryPrintBGBs( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	MegaChewMachine0.id = "MegaChewMachine0"
	MegaChewMachine1.id = "MegaChewMachine1"
	MegaChewMachine2.id = "MegaChewMachine2"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.MegaChewMachine0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GenericMenuFrame0:close()
		self.MegaChewMachine0:close()
		self.MegaChewMachine1:close()
		self.MegaChewMachine2:close()
		self.console:close()
		self.Label0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

