require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewMachine" )
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsole" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewFactoryVat" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewFactoryBottomLeftLabel" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "MegaChewFactory" )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "getResultsOrKeepWaiting" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "disableInput" ), 0 )
end

local f0_local1 = function ( f2_arg0 )
	if f2_arg0 == Enum.LootResultType.LOOT_RESULT_FAILURE_INSUFFICIENT_FUNDS then
		return Engine.Localize( "MENU_BGB_FACTORY_ERR_INSUFFICIENT_FUNDS" )
	elseif f2_arg0 == Enum.LootResultType.LOOT_RESULT_FAILURE_BAD_RESPONE then
		return Engine.Localize( "MENU_BGB_FACTORY_ERR_BAD_RESPONSE" )
	elseif f2_arg0 == Enum.LootResultType.LOOT_RESULT_FAILURE or f2_arg0 == Enum.LootResultType.LOOT_RESULT_INVALID then
		return Engine.Localize( "MENU_BGB_FACTORY_ERR_NO_RESULT" )
	else
		return Engine.Localize( "MENU_BGB_FACTORY_ERR_NO_RESULT" )
	end
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	local f3_local0 = Engine.CreateModel( Engine.GetModelForController( f3_arg1 ), "MegaChewFactory" )
	local f3_local1 = f3_arg0.Label0
	local f3_local2 = f3_local1
	f3_local1 = f3_local1.subscribeToGlobalModel
	local f3_local3 = f3_arg1
	local f3_local4 = "MegaChewTokens"
	f3_local1( f3_local2, f3_local3, f3_local4, "remainingTokens", function ( f4_arg0 )
		local modelValue = Engine.GetModelValue( f4_arg0 )
		if modelValue then
			Engine.SendClientScriptNotify( f3_arg1, "mega_chew_remaining_tokens", modelValue )
		end
	end )
	f3_local1 = 3000
	f3_local2 = 32
	f3_local3 = 0
	f3_local4 = function ()
		if Engine.LootResultsReady( f3_arg1 ) ~= false then
			local f5_local0 = Engine.LootFailureReason( f3_arg1 )
			if f5_local0 == Enum.LootResultType.LOOT_RESULT_SUCCESS then
				local f5_local1 = Engine.GetLootResults( f3_arg1 )
				Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f3_arg1 ), "MegaChewTokens" ), "remainingTokens" ), Engine.GetZMVials( f3_arg1 ) )
				Engine.SendClientScriptNotify( f3_arg1, "mega_chew_results", true, f5_local1[1], f5_local1[2], f5_local1[3] )
			else
				Engine.PlaySound( "uin_bm_denied" )
				Engine.SendClientScriptNotify( f3_arg1, "mega_chew_results", false, "", "", "" )
				LuaUtils.UI_ShowErrorMessageDialog( f3_arg1, f0_local1( f5_local0 ) )
			end
		else
			f3_local3 = f3_local3 + 1
			if f3_local3 < f3_local2 then
				f3_arg0:addElement( LUI.UITimer.newElementTimer( 250, true, f3_local4 ) )
			else
				Engine.SendClientScriptNotify( f3_arg1, "mega_chew_results", false )
			end
		end
	end
	
	f3_arg0:subscribeToModel( Engine.CreateModel( f3_local0, "getResultsOrKeepWaiting" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue and modelValue ~= 0 then
			f3_local3 = 0
			f3_arg0:addElement( LUI.UITimer.newElementTimer( f3_local1, true, f3_local4 ) )
		end
		Engine.SetModelValue( model, 0 )
	end )
end

LUI.createMenu.MegaChewFactory = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MegaChewFactory" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MegaChewFactory.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_MegaChew_FACTORY_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MegaChew_FACTORY_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local MegaChewMachine0 = CoD.MegaChewMachine.new( self, controller )
	MegaChewMachine0:setLeftRight( true, false, 470, 566 )
	MegaChewMachine0:setTopBottom( true, false, 483, 651 )
	MegaChewMachine0:setAlpha( 0.01 )
	MegaChewMachine0:subscribeToGlobalModel( controller, "MegaChewMachines", "machine0", function ( model )
		MegaChewMachine0:setModel( model, controller )
	end )
	MegaChewMachine0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.disableInput" ), function ( model )
		local f9_local0 = MegaChewMachine0
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "MegaChewFactory.disableInput"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	MegaChewMachine0:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		MegaChewFactoryFocusChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	MegaChewMachine0:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	self:AddButtonCallbackFunction( MegaChewMachine0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			MegaChewFactoryPurchase( self, element, controller )
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			MegaChewFactoryMachineSelect( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( MegaChewMachine0 )
	self.MegaChewMachine0 = MegaChewMachine0
	
	local MegaChewMachine1 = CoD.MegaChewMachine.new( self, controller )
	MegaChewMachine1:setLeftRight( true, false, 596, 691 )
	MegaChewMachine1:setTopBottom( true, false, 483, 651 )
	MegaChewMachine1:setAlpha( 0.01 )
	MegaChewMachine1:subscribeToGlobalModel( controller, "MegaChewMachines", "machine1", function ( model )
		MegaChewMachine1:setModel( model, controller )
	end )
	MegaChewMachine1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.disableInput" ), function ( model )
		local f15_local0 = MegaChewMachine1
		local f15_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "MegaChewFactory.disableInput"
		}
		CoD.Menu.UpdateButtonShownState( f15_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	MegaChewMachine1:registerEventHandler( "gain_focus", function ( element, event )
		local f16_local0 = nil
		if element.gainFocus then
			f16_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f16_local0 = element.super:gainFocus( event )
		end
		MegaChewFactoryFocusChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f16_local0
	end )
	MegaChewMachine1:registerEventHandler( "lose_focus", function ( element, event )
		local f17_local0 = nil
		if element.loseFocus then
			f17_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f17_local0 = element.super:loseFocus( event )
		end
		return f17_local0
	end )
	self:AddButtonCallbackFunction( MegaChewMachine1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			MegaChewFactoryPurchase( self, element, controller )
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			MegaChewFactoryMachineSelect( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( MegaChewMachine1 )
	self.MegaChewMachine1 = MegaChewMachine1
	
	local MegaChewMachine2 = CoD.MegaChewMachine.new( self, controller )
	MegaChewMachine2:setLeftRight( true, false, 711, 808 )
	MegaChewMachine2:setTopBottom( true, false, 483, 651 )
	MegaChewMachine2:setAlpha( 0.01 )
	MegaChewMachine2:subscribeToGlobalModel( controller, "MegaChewMachines", "machine2", function ( model )
		MegaChewMachine2:setModel( model, controller )
	end )
	MegaChewMachine2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.disableInput" ), function ( model )
		local f21_local0 = MegaChewMachine2
		local f21_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "MegaChewFactory.disableInput"
		}
		CoD.Menu.UpdateButtonShownState( f21_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	MegaChewMachine2:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		MegaChewFactoryFocusChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f22_local0
	end )
	MegaChewMachine2:registerEventHandler( "lose_focus", function ( element, event )
		local f23_local0 = nil
		if element.loseFocus then
			f23_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f23_local0 = element.super:loseFocus( event )
		end
		return f23_local0
	end )
	self:AddButtonCallbackFunction( MegaChewMachine2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			MegaChewFactoryPurchase( self, element, controller )
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			MegaChewFactoryMachineSelect( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if HasBGBTokensRemaining( element, controller ) and IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			return true
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( MegaChewMachine2 )
	self.MegaChewMachine2 = MegaChewMachine2
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, -307.61, -235.61 )
	Label0:setTopBottom( true, false, 961.5, 1010.5 )
	Label0:setTTF( "fonts/default.ttf" )
	Label0:subscribeToGlobalModel( controller, "MegaChewTokens", "remainingTokens", function ( model )
		local remainingTokens = Engine.GetModelValue( model )
		if remainingTokens then
			Label0:setText( Engine.Localize( remainingTokens ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local console = CoD.CenterConsole.new( self, controller )
	console:setLeftRight( false, false, -370, 370 )
	console:setTopBottom( true, false, 123, 221 )
	self:addElement( console )
	self.console = console
	
	local MegaChewFactoryVatLeft = CoD.MegaChewFactoryVat.new( self, controller )
	MegaChewFactoryVatLeft:setLeftRight( true, false, 110, 470 )
	MegaChewFactoryVatLeft:setTopBottom( true, false, -313.15, -178.15 )
	Engine.SetupUI3DWindow( controller, 0, 360, 135 )
	MegaChewFactoryVatLeft:setUI3DWindow( 0 )
	MegaChewFactoryVatLeft.TextBox:setText( Engine.Localize( "$(MegaChewLabelLeft)" ) )
	self:addElement( MegaChewFactoryVatLeft )
	self.MegaChewFactoryVatLeft = MegaChewFactoryVatLeft
	
	local MegaChewFactoryVatMiddle = CoD.MegaChewFactoryVat.new( self, controller )
	MegaChewFactoryVatMiddle:setLeftRight( true, false, 576, 936 )
	MegaChewFactoryVatMiddle:setTopBottom( true, false, -313.15, -178.15 )
	Engine.SetupUI3DWindow( controller, 1, 360, 135 )
	MegaChewFactoryVatMiddle:setUI3DWindow( 1 )
	MegaChewFactoryVatMiddle.TextBox:setText( Engine.Localize( "$(MegaChewLabelMiddle)" ) )
	self:addElement( MegaChewFactoryVatMiddle )
	self.MegaChewFactoryVatMiddle = MegaChewFactoryVatMiddle
	
	local MegaChewFactoryVatRight = CoD.MegaChewFactoryVat.new( self, controller )
	MegaChewFactoryVatRight:setLeftRight( true, false, 1051, 1411 )
	MegaChewFactoryVatRight:setTopBottom( true, false, -313.15, -178.15 )
	Engine.SetupUI3DWindow( controller, 2, 360, 135 )
	MegaChewFactoryVatRight:setUI3DWindow( 2 )
	MegaChewFactoryVatRight.TextBox:setText( Engine.Localize( "$(MegaChewLabelRight)" ) )
	self:addElement( MegaChewFactoryVatRight )
	self.MegaChewFactoryVatRight = MegaChewFactoryVatRight
	
	local MegaChewFactoryBottomLeftLabel = CoD.MegaChewFactoryBottomLeftLabel.new( self, controller )
	MegaChewFactoryBottomLeftLabel:setLeftRight( true, false, -659.07, -179.07 )
	MegaChewFactoryBottomLeftLabel:setTopBottom( true, false, 315, 405 )
	Engine.SetupUI3DWindow( controller, 3, 480, 90 )
	MegaChewFactoryBottomLeftLabel:setUI3DWindow( 3 )
	MegaChewFactoryBottomLeftLabel.TextBox:setText( Engine.Localize( "$(MegaChewLabelInstructions)" ) )
	self:addElement( MegaChewFactoryBottomLeftLabel )
	self.MegaChewFactoryBottomLeftLabel = MegaChewFactoryBottomLeftLabel
	
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.disableInput" ), function ( model )
		local f27_local0 = self
		local f27_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "MegaChewFactory.disableInput"
		}
		CoD.Menu.UpdateButtonShownState( f27_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		CoD.Menu.UpdateButtonShownState( f27_local0, self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
	end )
	self:registerEventHandler( "input_source_changed", function ( self, event )
		CoD.Menu.UpdateButtonShownState( self, self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		local f29_local0 = self
		local f29_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		}
		CoD.Menu.UpdateButtonShownState( f29_local0, self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f30_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		if not f30_local0 then
			f30_local0 = self:dispatchEventToChildren( event )
		end
		return f30_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			SendClientScriptMenuChangeNotify( controller, menu, false )
			GoBack( self, controller )
			ClearMenuSavedState( menu )
			UploadStats( self, controller )
			Close( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) and IsGamepad( controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "MENU_NAVIGATE" )
		if IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) and IsGamepad( controller ) then
			return true
		else
			return false
		end
	end, false )
	self:subscribeToGlobalModel( controller, "PerController", "MegaChewFactory.disableInput", function ( model )
		local f35_local0 = self
		if IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 1 ) then
			DisableNavigation( self, "MegaChewMachine0" )
			DisableNavigation( self, "MegaChewMachine1" )
			DisableNavigation( self, "MegaChewMachine2" )
		elseif IsModelValueEqualTo( controller, "MegaChewFactory.disableInput", 0 ) then
			EnableNavigation( self, "MegaChewMachine0" )
			EnableNavigation( self, "MegaChewMachine1" )
			EnableNavigation( self, "MegaChewMachine2" )
		end
	end )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GenericMenuFrame0:close()
		element.MegaChewMachine0:close()
		element.MegaChewMachine1:close()
		element.MegaChewMachine2:close()
		element.console:close()
		element.MegaChewFactoryVatLeft:close()
		element.MegaChewFactoryVatMiddle:close()
		element.MegaChewFactoryVatRight:close()
		element.MegaChewFactoryBottomLeftLabel:close()
		element.Label0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewFactory.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

