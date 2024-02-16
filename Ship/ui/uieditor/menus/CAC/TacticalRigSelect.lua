-- 0adb88eae92c25e51fcdeb0418704525
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectMenuWidgetNew" )
require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.CPSystems.TacticalMode.GridItemTacticalRig" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListBoxes" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.CAC.GridItemUpgradeInfo" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if CoD.isSafehouse and CoD.perController[f1_arg0].everythingUnlocked and f1_arg1 == "cybercom_emergencyreserve" then
		return false
	else
		return true
	end
end

local PreLoadFunc = function ( self, controller )
	if IsCampaign() then
		self.disableBlur = true
	end
	CoD.GenericCACSelectionPreLoadFunc( self, controller, "cybercom_tacrig1" )
	if CoD.UnlockablesTable then
		local f2_local0 = {}
		for f2_local4, f2_local5 in ipairs( CoD.UnlockablesTable.cybercom_tacrig2 ) do
			local f2_local6 = Engine.GetModelValue( Engine.GetModel( f2_local5, "itemIndex" ) )
			local f2_local7 = Engine.GetModelValue( Engine.GetModel( f2_local5, "ref" ) )
			if LUI.endswith( f2_local7, "_pro" ) then
				f2_local0[string.sub( f2_local7, 1, -(string.len( "_pro" ) + 1) )] = f2_local6
			end
		end
		for f2_local4, f2_local5 in ipairs( CoD.UnlockablesTable.cybercom_tacrig1 ) do
			local f2_local6 = Engine.GetModelValue( Engine.GetModel( f2_local5, "itemIndex" ) )
			local f2_local7 = Engine.GetModelValue( Engine.GetModel( f2_local5, "ref" ) )
			if not LUI.endswith( f2_local7, "_pro" ) and f2_local0[f2_local7] then
				if f0_local0( controller, f2_local7 ) == false then
					Engine.SetItemRestrictionState( f2_local6, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED )
					table.insert( CoD.perController[controller].restrictedItemIndices, f2_local6 )
				end
				Engine.SetModelValue( Engine.CreateModel( f2_local5, "upgradeItemIndex" ), f2_local0[f2_local7] )
			end
		end
	end
end

LUI.createMenu.TacticalRigSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "TacticalRigSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_LethalGrenade"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "TacticalRigSelect.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f3_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 370 )
	LeftPanel:setTopBottom( true, false, 78, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local selectMenuWidget = CoD.SelectMenuWidgetNew.new( f3_local1, controller )
	selectMenuWidget:setLeftRight( true, true, 0, 0 )
	selectMenuWidget:setTopBottom( true, true, 0, 0 )
	selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_TACTICAL_RIG_CAPS" ) )
	selectMenuWidget.selectionInfoWidget.previewImage.image:setImage( RegisterImage( "uie_default_black_0_alpha_0" ) )
	selectMenuWidget.selectionInfoWidget.previewImage.image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	selectMenuWidget:mergeStateConditions( {
		{
			stateName = "GridLayout",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( selectMenuWidget )
	self.selectMenuWidget = selectMenuWidget
	
	local selectionList = LUI.UIList.new( f3_local1, controller, 7, 0, function ( f5_arg0 )
		return Engine.GetModelValue( Engine.GetModel( f5_arg0, "loadoutSlot" ) ) == "cybercom_tacrig1"
	end, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 357 )
	selectionList:setTopBottom( true, false, 136, 633 )
	selectionList:setDataSource( "Unlockables" )
	selectionList:setWidgetType( CoD.GridItemTacticalRig )
	selectionList:setVerticalCount( 7 )
	selectionList:setSpacing( 7 )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local f6_local0 = selectionList
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f6_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f7_local0 = nil
		SetCACItemAsOld( element, controller )
		UpdateSelfElementState( f3_local1, element, controller )
		FocusClassItem( self, element, controller )
		return f7_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f8_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	f3_local1:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if not IsCACItemLocked( f10_arg1, f10_arg0, f10_arg2 ) and not IsCACItemPurchased( f10_arg0, f10_arg2 ) and IsCACHaveTokens( f10_arg2 ) then
			OpenUnlockClassItemDialog( f10_arg1, f10_arg0, f10_arg2 )
			return true
		elseif not IsCACItemPurchased( f10_arg0, f10_arg2 ) and not IsCACItemLocked( f10_arg1, f10_arg0, f10_arg2 ) and not IsCACHaveTokens( f10_arg2 ) then
			SetUnlockConfirmationInfo( f10_arg0, f10_arg2 )
			OpenOverlay( self, "OutOfUnlockTokens", f10_arg2, "", "" )
			return true
		elseif not IsCACItemLocked( f10_arg1, f10_arg0, f10_arg2 ) and IsCACItemPurchased( f10_arg0, f10_arg2 ) and not IsCACItemBanned( f10_arg1, f10_arg0, f10_arg2 ) then
			SetClassItem( self, f10_arg0, f10_arg2 )
			return true
		elseif IsCACItemBanned( f10_arg1, f10_arg0, f10_arg2 ) then
			OpenGenericSmallPopup( f10_arg1, f10_arg2, "MENU_TACTICAL_RIG_CAPS", "MENU_TRAINING_SIM_NOTAVAILABLE", "t7_icon_connect_overlays_bkg", "MENU_OK", "", "" )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		if not IsCACItemLocked( f11_arg1, f11_arg0, f11_arg2 ) and not IsCACItemPurchased( f11_arg0, f11_arg2 ) and IsCACHaveTokens( f11_arg2 ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsCACItemPurchased( f11_arg0, f11_arg2 ) and not IsCACItemLocked( f11_arg1, f11_arg0, f11_arg2 ) and not IsCACHaveTokens( f11_arg2 ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsCACItemLocked( f11_arg1, f11_arg0, f11_arg2 ) and IsCACItemPurchased( f11_arg0, f11_arg2 ) and not IsCACItemBanned( f11_arg1, f11_arg0, f11_arg2 ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif IsCACItemBanned( f11_arg1, f11_arg0, f11_arg2 ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_RESTRICTED" )
			return true
		else
			return false
		end
	end, false )
	f3_local1:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "U", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsCACHaveTokens( f12_arg2 ) and IsCACItemUpgradable( f12_arg1, f12_arg0, f12_arg2 ) then
			SetUpgradeConfirmationInfo( f12_arg0, f12_arg2 )
			OpenOverlay( self, "OutOfUnlockTokens", f12_arg2, "", "" )
			return true
		elseif IsCACItemUpgradable( f12_arg1, f12_arg0, f12_arg2 ) then
			OpenUpgradeClassItemDialog( f12_arg1, f12_arg0, f12_arg2 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_UPGRADE" )
		if not IsCACHaveTokens( f13_arg2 ) and IsCACItemUpgradable( f13_arg1, f13_arg0, f13_arg2 ) then
			return true
		elseif IsCACItemUpgradable( f13_arg1, f13_arg0, f13_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local cacElemsSideListBoxes0 = CoD.cac_ElemsSideListBoxes.new( f3_local1, controller )
	cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
	cacElemsSideListBoxes0:setTopBottom( true, false, -12, 658 )
	self:addElement( cacElemsSideListBoxes0 )
	self.cacElemsSideListBoxes0 = cacElemsSideListBoxes0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( f3_local1, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f14_local0 = nil
		SizeToSafeArea( element, controller )
		if not f14_local0 then
			f14_local0 = element:dispatchEventToChildren( event )
		end
		return f14_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local GridItemUpgradeInfo = CoD.GridItemUpgradeInfo.new( f3_local1, controller )
	GridItemUpgradeInfo:setLeftRight( true, false, 401.66, 642.82 )
	GridItemUpgradeInfo:setTopBottom( true, false, 570.31, 643.5 )
	self:addElement( GridItemUpgradeInfo )
	self.GridItemUpgradeInfo = GridItemUpgradeInfo
	
	selectMenuWidget:linkToElementModel( selectionList, nil, false, function ( model )
		selectMenuWidget:setModel( model, controller )
	end )
	selectMenuWidget:linkToElementModel( selectionList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( name ) )
		end
	end )
	GridItemUpgradeInfo:linkToElementModel( selectionList, nil, false, function ( model )
		GridItemUpgradeInfo:setModel( model, controller )
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f18_local0 = nil
		SetElementStateByElementName( self, "selectMenuWidget", controller, "Update" )
		if not f18_local0 then
			f18_local0 = element:dispatchEventToChildren( event )
		end
		return f18_local0
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		GoBack( self, f19_arg2 )
		return true
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		element.selectMenuWidget:close()
		element.selectionList:close()
		element.cacElemsSideListBoxes0:close()
		element.feFooterContainer:close()
		element.GridItemUpgradeInfo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "TacticalRigSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

