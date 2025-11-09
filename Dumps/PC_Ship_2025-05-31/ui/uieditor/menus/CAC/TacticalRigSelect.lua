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
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 370 )
	LeftPanel:setTopBottom( true, false, 78, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local selectMenuWidget = CoD.SelectMenuWidgetNew.new( self, controller )
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
	
	local selectionList = LUI.UIList.new( self, controller, 7, 0, function ( f5_arg0 )
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
		CoD.Menu.UpdateButtonShownState( f6_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f6_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f7_local0 = nil
		SetCACItemAsOld( element, controller )
		UpdateSelfElementState( self, element, controller )
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
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) then
			OpenUnlockClassItemDialog( menu, element, controller )
			return true
		elseif not IsCACItemPurchased( element, controller ) and not IsCACItemLocked( menu, element, controller ) and not IsCACHaveTokens( controller ) then
			SetUnlockConfirmationInfo( element, controller )
			OpenOverlay( self, "OutOfUnlockTokens", controller, "", "" )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not IsCACItemBanned( menu, element, controller ) then
			SetClassItem( self, element, controller )
			return true
		elseif IsCACItemBanned( menu, element, controller ) then
			OpenGenericSmallPopup( menu, controller, "MENU_TACTICAL_RIG_CAPS", "MENU_TRAINING_SIM_NOTAVAILABLE", "t7_icon_connect_overlays_bkg", "MENU_OK", "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsCACItemPurchased( element, controller ) and not IsCACItemLocked( menu, element, controller ) and not IsCACHaveTokens( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not IsCACItemBanned( menu, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif IsCACItemBanned( menu, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_RESTRICTED" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "U", function ( element, menu, controller, model )
		if not IsCACHaveTokens( controller ) and IsCACItemUpgradable( menu, element, controller ) then
			SetUpgradeConfirmationInfo( element, controller )
			OpenOverlay( self, "OutOfUnlockTokens", controller, "", "" )
			return true
		elseif IsCACItemUpgradable( menu, element, controller ) then
			OpenUpgradeClassItemDialog( menu, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_UPGRADE" )
		if not IsCACHaveTokens( controller ) and IsCACItemUpgradable( menu, element, controller ) then
			return true
		elseif IsCACItemUpgradable( menu, element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local cacElemsSideListBoxes0 = CoD.cac_ElemsSideListBoxes.new( self, controller )
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
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
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
	
	local GridItemUpgradeInfo = CoD.GridItemUpgradeInfo.new( self, controller )
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
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f18_local0 = nil
		SetElementStateByElementName( self, "selectMenuWidget", controller, "Update" )
		if not f18_local0 then
			f18_local0 = self:dispatchEventToChildren( event )
		end
		return f18_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = self
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

