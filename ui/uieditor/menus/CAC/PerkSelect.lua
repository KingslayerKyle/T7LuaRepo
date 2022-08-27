-- f03c3f2a4c69a6b8c45fc9b37029d22b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectMenuWidgetNew" )
require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.CAC.GridItemButtonNew" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	for f1_local0 = 1, CoD.CACUtility.maxSpecialtySlots, 1 do
		local f1_local3 = "specialty" .. f1_local0
		local f1_local4 = f1_arg0:getModel( f1_arg1, f1_local3 .. ".itemIndex" )
		if f1_local4 then
			if f1_arg2 and Engine.GetModelValue( f1_local4 ) == f1_arg2 then
				return f1_local3
			end
		end
	end
end

local f0_local1 = function ( f2_arg0 )
	if f2_arg0 == "specialty4" then
		f2_arg0 = "specialty1"
	elseif f2_arg0 == "specialty5" then
		f2_arg0 = "specialty2"
	elseif f2_arg0 == "specialty6" then
		f2_arg0 = "specialty3"
	end
	return f2_arg0
end

local PreLoadFunc = function ( self, controller )
	local f3_local0 = CoD.perController[controller].weaponCategory
	CoD.GenericCACSelectionPreLoadFunc( self, controller, f0_local1( f3_local0 ), f3_local0 )
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	local f4_local0 = nil
	local f4_local1 = CoD.perController[f4_arg1].weaponCategory
	if f4_local1 ~= "" then
		f4_local0 = f0_local1( f4_local1 )
	end
	if f4_local0 == "specialty1" then
		f4_arg0.selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_PERK1_CAPS" ) )
	elseif f4_local0 == "specialty2" then
		f4_arg0.selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_PERK2_CAPS" ) )
	elseif f4_local0 == "specialty3" then
		f4_arg0.selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_PERK3_CAPS" ) )
	end
	f4_arg0.getEquippedLoadoutSlot = f0_local0
end

LUI.createMenu.PerkSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PerkSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Perk"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PerkSelect.buttonPrompts" )
	local f5_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f5_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 428 )
	LeftPanel:setTopBottom( true, true, 78, 0 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f5_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local selectMenuWidget = CoD.SelectMenuWidgetNew.new( f5_local1, controller )
	selectMenuWidget:setLeftRight( true, true, 0, 0 )
	selectMenuWidget:setTopBottom( true, true, 0, 0 )
	selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_PERKS_CAPS" ) )
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
	
	local selectionList = LUI.UIList.new( f5_local1, controller, 7, 0, function ( f8_arg0 )
		return Engine.GetModelValue( Engine.GetModel( f8_arg0, "group" ) ) == "specialty"
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
		local f9_local0 = selectionList
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, f5_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f10_local0 = nil
		if IsCACItemNew( element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			SetCACItemAsOld( element, controller )
			UpdateSelfElementState( f5_local1, element, controller )
			FocusClassItem( self, element, controller )
		else
			FocusClassItem( self, element, controller )
		end
		return f10_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f5_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	f5_local1:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if not IsCACItemLocked( f13_arg1, f13_arg0, f13_arg2 ) and not IsCACItemPurchased( f13_arg0, f13_arg2 ) and not IsCACHaveTokens( f13_arg2 ) and not IsInPermanentUnlockMenu( f13_arg2 ) then
			SetUnlockConfirmationInfo( f13_arg0, f13_arg2 )
			OpenPopup( self, "OutOfUnlockTokens", f13_arg2 )
			return true
		elseif not IsCACItemLocked( f13_arg1, f13_arg0, f13_arg2 ) and not IsCACItemPurchased( f13_arg0, f13_arg2 ) and IsCACHaveTokens( f13_arg2 ) and not IsInPermanentUnlockMenu( f13_arg2 ) then
			OpenUnlockClassItemDialog( f13_arg1, f13_arg0, f13_arg2 )
			return true
		elseif not IsCACItemLocked( f13_arg1, f13_arg0, f13_arg2 ) and not IsInPermanentUnlockMenu( f13_arg2 ) then
			SetClassItem( self, f13_arg0, f13_arg2 )
			return true
		elseif IsInPermanentUnlockMenu( f13_arg2 ) and not IsPermanentlyUnlocked( f13_arg0, f13_arg2 ) and HavePermanentUnlockTokens( f13_arg2 ) then
			OpenPermanentUnlockClassItemDialog( f13_arg1, f13_arg0, f13_arg2 )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsCACItemLocked( f14_arg1, f14_arg0, f14_arg2 ) and not IsCACItemPurchased( f14_arg0, f14_arg2 ) and not IsCACHaveTokens( f14_arg2 ) and not IsInPermanentUnlockMenu( f14_arg2 ) then
			return true
		elseif not IsCACItemLocked( f14_arg1, f14_arg0, f14_arg2 ) and not IsCACItemPurchased( f14_arg0, f14_arg2 ) and IsCACHaveTokens( f14_arg2 ) and not IsInPermanentUnlockMenu( f14_arg2 ) then
			return true
		elseif not IsCACItemLocked( f14_arg1, f14_arg0, f14_arg2 ) and not IsInPermanentUnlockMenu( f14_arg2 ) then
			return true
		elseif IsInPermanentUnlockMenu( f14_arg2 ) and not IsPermanentlyUnlocked( f14_arg0, f14_arg2 ) and HavePermanentUnlockTokens( f14_arg2 ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( f5_local1, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f15_local0 = nil
		SizeToSafeArea( element, controller )
		if not f15_local0 then
			f15_local0 = element:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( f5_local1, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "PerkSelect",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		f5_local1:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = f5_local1,
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
		local f19_local0 = nil
		ShowHeaderKickerAndIcon( f5_local1 )
		if not f19_local0 then
			f19_local0 = element:dispatchEventToChildren( event )
		end
		return f19_local0
	end )
	f5_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		GoBack( self, f20_arg2 )
		PlaySoundSetSound( self, "menu_no_selection" )
		return true
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f5_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		return true
	end, function ( f23_arg0, f23_arg1, f23_arg2 )
		CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		return true
	end, false )
	selectionList.id = "selectionList"
	feFooterContainer:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f5_local1
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PerkSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

