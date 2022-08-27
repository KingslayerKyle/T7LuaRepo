-- 73b2f1f24d3f080a9b664c68ea35fa79
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectMenuWidgetNew" )
require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.CAC.GridItemButtonNew" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )

local PreLoadFunc = function ( self, controller )
	if IsCampaign() then
		self.disableBlur = true
	end
	self:setModel( CoD.perController[controller].classModel )
	self.restoreState = function ( f2_arg0 )
		local f2_local0 = CoD.perController[controller].weaponCategory
		DataSources.Unlockables.setCurrentFilterItem( "secondarygadget" )
		f2_arg0.selectionList:updateDataSource( true )
		local f2_local1 = 0
		if not CoD.PrestigeUtility.isInPermanentUnlockMenu then
			local f2_local2 = Engine.GetModelValue( f2_arg0:getModel( controller, f2_local0 .. ".itemIndex" ) )
		end
		local f2_local2 = f2_arg0.selectionList:findItem( {
			itemIndex = f2_local1
		}, nil, false, false )
		local f2_local3 = {
			name = "gain_focus",
			controller = controller
		}
		if f2_local2 then
			f2_local3.selectIndex = f2_local2.gridInfoTable.zeroBasedIndex
		end
		f2_arg0.selectionList:processEvent( f2_local3 )
		return true
	end
	
end

LUI.createMenu.TacticalEquipmentSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "TacticalEquipmentSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_TacticalGrenade"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "TacticalEquipmentSelect.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f3_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 428 )
	LeftPanel:setTopBottom( true, true, 78, 0 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f3_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local selectMenuWidget = CoD.SelectMenuWidgetNew.new( f3_local1, controller )
	selectMenuWidget:setLeftRight( true, true, 0, 0 )
	selectMenuWidget:setTopBottom( true, true, 0, 0 )
	selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_TACTICAL_CAPS" ) )
	selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	selectMenuWidget:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( name ) )
		end
	end )
	selectMenuWidget:mergeStateConditions( {
		{
			stateName = "GridLayout",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( selectMenuWidget )
	self.selectMenuWidget = selectMenuWidget
	
	local selectionList = LUI.UIList.new( f3_local1, controller, 7, 0, function ( f6_arg0 )
		return Engine.GetModelValue( Engine.GetModel( f6_arg0, "group" ) ) == "weapon_grenade"
	end, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 415 )
	selectionList:setTopBottom( true, false, 136, 589 )
	selectionList:setDataSource( "Unlockables" )
	selectionList:setWidgetType( CoD.GridItemButtonNew )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local f7_local0 = selectionList
		local f7_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f7_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f8_local0 = nil
		if IsCACItemNew( element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			SetCACItemAsOld( element, controller )
			UpdateSelfElementState( f3_local1, element, controller )
			FocusWeapon( self, element, controller )
		else
			FocusWeapon( self, element, controller )
		end
		return f8_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	f3_local1:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if not IsCACItemLocked( f11_arg1, f11_arg0, f11_arg2 ) and not IsCACItemPurchased( f11_arg0, f11_arg2 ) and not IsCACHaveTokens( f11_arg2 ) and not IsInPermanentUnlockMenu( f11_arg2 ) then
			SetUnlockConfirmationInfo( f11_arg0, f11_arg2 )
			OpenPopup( self, "OutOfUnlockTokens", f11_arg2 )
			return true
		elseif not IsCACItemLocked( f11_arg1, f11_arg0, f11_arg2 ) and not IsCACItemPurchased( f11_arg0, f11_arg2 ) and IsCACHaveTokens( f11_arg2 ) and not IsInPermanentUnlockMenu( f11_arg2 ) then
			OpenUnlockClassItemDialog( f11_arg1, f11_arg0, f11_arg2 )
			return true
		elseif not IsCACItemLocked( f11_arg1, f11_arg0, f11_arg2 ) and IsCACItemPurchased( f11_arg0, f11_arg2 ) and not IsInPermanentUnlockMenu( f11_arg2 ) then
			SetClassItem( self, f11_arg0, f11_arg2 )
			return true
		elseif IsInPermanentUnlockMenu( f11_arg2 ) and not IsPermanentlyUnlocked( f11_arg0, f11_arg2 ) and HavePermanentUnlockTokens( f11_arg2 ) then
			OpenPermanentUnlockClassItemDialog( f11_arg1, f11_arg0, f11_arg2 )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsCACItemLocked( f12_arg1, f12_arg0, f12_arg2 ) and not IsCACItemPurchased( f12_arg0, f12_arg2 ) and not IsCACHaveTokens( f12_arg2 ) and not IsInPermanentUnlockMenu( f12_arg2 ) then
			return true
		elseif not IsCACItemLocked( f12_arg1, f12_arg0, f12_arg2 ) and not IsCACItemPurchased( f12_arg0, f12_arg2 ) and IsCACHaveTokens( f12_arg2 ) and not IsInPermanentUnlockMenu( f12_arg2 ) then
			return true
		elseif not IsCACItemLocked( f12_arg1, f12_arg0, f12_arg2 ) and IsCACItemPurchased( f12_arg0, f12_arg2 ) and not IsInPermanentUnlockMenu( f12_arg2 ) then
			return true
		elseif IsInPermanentUnlockMenu( f12_arg2 ) and not IsPermanentlyUnlocked( f12_arg0, f12_arg2 ) and HavePermanentUnlockTokens( f12_arg2 ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( f3_local1, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f13_local0 = nil
		SizeToSafeArea( element, controller )
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	feFooterContainer:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
		return f14_local0
	end )
	feFooterContainer:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	f3_local1:AddButtonCallbackFunction( feFooterContainer, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if CACShowRotatePrompt( self, f16_arg0, f16_arg2 ) then
			return true
		else
			
		end
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		if CACShowRotatePrompt( self, f17_arg0, f17_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( f3_local1, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "EquipmentSelect",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		f3_local1:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	selectMenuWidget:linkToElementModel( selectionList, nil, false, function ( model )
		selectMenuWidget:setModel( model, controller )
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f21_local0 = nil
		ShowHeaderKickerAndIcon( f3_local1 )
		if not f21_local0 then
			f21_local0 = element:dispatchEventToChildren( event )
		end
		return f21_local0
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		GoBack( self, f22_arg2 )
		PlaySoundSetSound( self, "menu_no_selection" )
		return true
	end, function ( f23_arg0, f23_arg1, f23_arg2 )
		CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		if CACShowRotatePrompt( self, f24_arg0, f24_arg2 ) then
			return true
		else
			
		end
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		if CACShowRotatePrompt( self, f25_arg0, f25_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	selectionList.id = "selectionList"
	feFooterContainer:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FEMenuLeftGraphics:close()
		element.selectMenuWidget:close()
		element.selectionList:close()
		element.feFooterContainer:close()
		element.PregameTimerOverlay:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "TacticalEquipmentSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

