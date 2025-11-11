require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListBoxes" )
require( "ui.uieditor.widgets.CAC.GridItemUpgradeInfo" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectMenuWidgetNew" )
require( "ui.uieditor.widgets.CPSystems.TacticalMode.GridItemTacticalRig" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )

local isTacticalRigAllowed = function ( controller, refName )
	if CoD.isSafehouse and CoD.perController[controller].everythingUnlocked and refName == "cybercom_emergencyreserve" then
		return false
	else
		return true
	end
end

local PreLoadFunc = function ( self, controller )
	if IsCampaign() then
		self.disableBlur = true
	end
	CoD.CACUtility.GenericCACSelectionPreLoadFunc( self, controller, "cybercom_tacrig1" )
	if CoD.CACUtility.UnlockablesTable then
		local upgradeItemIndexArray = {}
		for index, model in ipairs( CoD.CACUtility.UnlockablesTable.cybercom_tacrig2 ) do
			local itemIndex = Engine.GetModelValue( Engine.GetModel( model, "itemIndex" ) )
			local ref = Engine.GetModelValue( Engine.GetModel( model, "ref" ) )
			if LUI.endswith( ref, "_pro" ) then
				local baseRef = string.sub( ref, 1, -(string.len( "_pro" ) + 1) )
				upgradeItemIndexArray[baseRef] = itemIndex
			end
		end
		for index, model in ipairs( CoD.CACUtility.UnlockablesTable.cybercom_tacrig1 ) do
			local itemIndex = Engine.GetModelValue( Engine.GetModel( model, "itemIndex" ) )
			local ref = Engine.GetModelValue( Engine.GetModel( model, "ref" ) )
			if not LUI.endswith( ref, "_pro" ) and upgradeItemIndexArray[ref] then
				if isTacticalRigAllowed( controller, ref ) == false then
					Engine.SetItemRestrictionState( itemIndex, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED )
					table.insert( CoD.perController[controller].restrictedItemIndices, itemIndex )
				end
				Engine.SetModelValue( Engine.CreateModel( model, "upgradeItemIndex" ), upgradeItemIndexArray[ref] )
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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "TacticalRigSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 555 )
	LeftPanel:setTopBottom( 0, 0, 117, 1001 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local selectMenuWidget = CoD.SelectMenuWidgetNew.new( self, controller )
	selectMenuWidget:mergeStateConditions( {
		{
			stateName = "GridLayout",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	selectMenuWidget:setLeftRight( 0, 1, 0, 0 )
	selectMenuWidget:setTopBottom( 0, 1, 0, 0 )
	selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_TACTICAL_RIG_CAPS" ) )
	selectMenuWidget.selectionInfoWidget.previewImage.image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	self:addElement( selectMenuWidget )
	self.selectMenuWidget = selectMenuWidget
	
	local selectionList = LUI.UIList.new( self, controller, 10, 0, function ( model )
		return Engine.GetModelValue( Engine.GetModel( model, "loadoutSlot" ) ) == "cybercom_tacrig1"
	end, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( 0, 0, 116, 536 )
	selectionList:setTopBottom( 0, 0, 207.5, 946.5 )
	selectionList:setWidgetType( CoD.GridItemTacticalRig )
	selectionList:setVerticalCount( 7 )
	selectionList:setSpacing( 10 )
	selectionList:setDataSource( "Unlockables" )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local element = selectionList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetCACItemAsOld( element, controller )
		UpdateSelfElementState( self, element, controller )
		FocusClassItem( self, element, controller )
		return retVal
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return retVal
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif not IsCACItemPurchased( element, controller ) and not IsCACItemLocked( menu, element, controller ) and not IsCACHaveTokens( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not IsCACItemBanned( menu, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif IsCACItemBanned( menu, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_RESTRICTED", nil )
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
		if not IsCACHaveTokens( controller ) and IsCACItemUpgradable( menu, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_UPGRADE", nil )
			return true
		elseif IsCACItemUpgradable( menu, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_UPGRADE", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local cacElemsSideListBoxes0 = CoD.cac_ElemsSideListBoxes.new( self, controller )
	cacElemsSideListBoxes0:setLeftRight( 0, 0, 28, 108 )
	cacElemsSideListBoxes0:setTopBottom( 0, 0, -18.5, 986.5 )
	self:addElement( cacElemsSideListBoxes0 )
	self.cacElemsSideListBoxes0 = cacElemsSideListBoxes0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( 0, 1, 0, 0 )
	feFooterContainer:setTopBottom( 1, 1, -98, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local GridItemUpgradeInfo = CoD.GridItemUpgradeInfo.new( self, controller )
	GridItemUpgradeInfo:setLeftRight( 0, 0, 602, 964 )
	GridItemUpgradeInfo:setTopBottom( 0, 0, 855, 965 )
	self:addElement( GridItemUpgradeInfo )
	self.GridItemUpgradeInfo = GridItemUpgradeInfo
	
	selectMenuWidget:linkToElementModel( selectionList, nil, false, function ( model )
		selectMenuWidget:setModel( model, controller )
	end )
	selectMenuWidget:linkToElementModel( selectionList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	GridItemUpgradeInfo:linkToElementModel( selectionList, nil, false, function ( model )
		GridItemUpgradeInfo:setModel( model, controller )
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		SetElementStateByElementName( self, "selectMenuWidget", controller, "Update" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.selectMenuWidget:close()
		self.selectionList:close()
		self.cacElemsSideListBoxes0:close()
		self.feFooterContainer:close()
		self.GridItemUpgradeInfo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "TacticalRigSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

