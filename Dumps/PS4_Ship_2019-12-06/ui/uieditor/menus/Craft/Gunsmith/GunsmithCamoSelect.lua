require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropContainer3x4" )
require( "ui.uieditor.widgets.CAC.Customization.CustomizationItem_ND" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropSymbols" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.BlackMarketItemDescription" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.TabbedWidgets.WeaponGroupsTabWidget" )
require( "ui.uieditor.widgets.CAC.Customization.ChallengeProgressionInfo" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameLeft" )
require( "ui.uieditor.widgets.CAC.ModeIconName" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )

local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].customizationType = Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO
	local f1_local0 = CoD.perController[controller].gunsmithCamoIndexModel
	self:setModel( f1_local0 )
	local f1_local1 = Engine.GetModelValue( f1_local0 )
	local f1_local2 = CoD.perController[controller].gunsmithVariantModel
	local f1_local3 = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local f1_local4 = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( controller, f1_local2 )
	local f1_local5 = CoD.CraftUtility.GetModeAbbreviation()
	local f1_local6 = CoD.CraftUtility.GetLoadoutSlot( controller )
	Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( controller ), "StoreRoot" ), "InventoryItemPurchaseSuccessful" )
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg0.selectionList and f2_arg1.filterString then
		DataSources.GunsmithWeaponOptions.setCurrentFilterItem( "camo" .. "_" .. f2_arg1.filterString )
		f2_arg0.selectionList:updateDataSource()
		f2_arg0.selectionList:setActiveItem( f2_arg0.selectionList:getItemAt( 1 ) )
	end
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	local f3_local0 = CoD.GetCustomization( f3_arg1, "weapon_index" )
	CoD.GunsmithWeaponOptionsTable = {}
	CoD.GunsmithWeaponOptionsTable = CoD.GetGunsmithWeaponOptionsTable( f3_arg1, CoD.GunsmithWeaponOptionsTable, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO, f3_local0, 0, true )
	f3_arg0.tabChanged = f0_local1
	local f3_local1 = Engine.CurrentSessionMode()
	if f3_local1 == Enum.eModes.MODE_INVALID then
		f3_local1 = Enum.eModes.MODE_CAMPAIGN
	end
	local f3_local2 = "camo"
	local f3_local3 = CoD.WeaponOptionFilterToString( f3_local1 )
	local f3_local4 = f3_arg0.categoryTabs.Tabs.grid:findItem( nil, {
		filterEnum = f3_local1
	}, false, nil )
	if f3_local4 then
		f3_arg0.categoryTabs.Tabs.grid:setActiveItem( f3_local4 )
	else
		local f3_local5 = f3_arg0.categoryTabs.Tabs.grid:getItemAt( 2 )
		f3_arg0.categoryTabs.Tabs.grid:setActiveItem( f3_local5 )
		f3_local3 = CoD.WeaponOptionFilterToString( f3_local5.filterEnum )
	end
	for f3_local5 = Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_FIRST, Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_COUNT - 1, 1 do
		local f3_local8 = f3_arg0.categoryTabs.Tabs.grid:findItem( nil, {
			filterEnum = f3_local5
		}, false, nil )
		if f3_local8 then
			local f3_local9 = CoD.GetCustomization( f3_arg1, "weapon_index" )
			local f3_local10 = CoD.CACUtility.GetWeaponOptionTypeForName( "camo" )
			local f3_local11 = f3_local8:getModel( f3_arg1, "breadcrumbCount" )
			if f3_local11 then
				if f3_local5 < Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MODE_COUNT then
					Engine.SetModelValue( f3_local11, Engine.WeaponOptionNewItemCount( f3_arg1, f3_local9, f3_local10, f3_local8.filterEnum ) )
				else
					Engine.SetModelValue( f3_local11, Engine.WeaponOptionNewModeAgnosticItemCount( f3_arg1, f3_local9, f3_local10, f3_local8.filterEnum ) )
				end
			end
		end
	end
	DataSources.GunsmithWeaponOptions.setCurrentFilterItem( f3_local2 .. "_" .. f3_local3 )
	f3_arg0.selectionList:updateDataSource()
	f3_arg0.originalOcclusionChange = f3_arg0.m_eventHandlers.occlusion_change
	f3_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded and event.occludedBy and event.occludedBy.id == "Menu.PurchaseInventoryItemComplete" then
			CoD.GunsmithWeaponOptionsTable = {}
			CoD.GunsmithWeaponOptionsTable = CoD.GetGunsmithWeaponOptionsTable( f3_arg1, CoD.GunsmithWeaponOptionsTable, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO )
			ForceNotifyControllerModel( f3_arg1, "StoreRoot.InventoryItemPurchaseSuccessful" )
			local f4_local0 = element.categoryTabs.Tabs.grid:findItem( nil, {
				filterEnum = Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_EXTRAS
			}, false, nil )
			if f4_local0 then
				Engine.SetModelValue( f4_local0:getModel( f3_arg1, "breadcrumbCount" ), Engine.WeaponOptionNewModeAgnosticItemCount( f3_arg1, CoD.GetCustomization( f3_arg1, "weapon_index" ), CoD.CACUtility.GetWeaponOptionTypeForName( "camo" ), f4_local0.filterEnum ) )
			end
		end
		element:originalOcclusionChange( event )
	end )
end

LUI.createMenu.GunsmithCamoSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithCamoSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithCamoSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 427 )
	LeftPanel:setTopBottom( true, false, 126, 720 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local GridItemButtonBackdropContainer3x4 = CoD.GridItemButtonBackdropContainer3x4.new( self, controller )
	GridItemButtonBackdropContainer3x4:setLeftRight( true, false, 99, 443 )
	GridItemButtonBackdropContainer3x4:setTopBottom( true, false, 145.5, 601.5 )
	GridItemButtonBackdropContainer3x4:setAlpha( 0 )
	self:addElement( GridItemButtonBackdropContainer3x4 )
	self.GridItemButtonBackdropContainer3x4 = GridItemButtonBackdropContainer3x4
	
	local selectionList = LUI.UIList.new( self, controller, 8, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 74.5, 414.5 )
	selectionList:setTopBottom( true, false, 137, 593 )
	selectionList:setWidgetType( CoD.CustomizationItem_ND )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 8 )
	selectionList:setVerticalCounter( CoD.verticalCounter )
	selectionList:setDataSource( "GunsmithWeaponOptions" )
	selectionList:linkToElementModel( selectionList, "isPackage", true, function ( model )
		local f6_local0 = selectionList
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPackage"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local f7_local0 = selectionList
		local f7_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f7_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:linkToElementModel( selectionList, "isBMClassified", true, function ( model )
		local f8_local0 = selectionList
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f9_local0 = nil
		if Gunsmith_IsCamoNew( self, element, controller ) then
			Gunsmith_SetWeaponOptionAsOld( self, element, controller )
			UpdateSelfElementState( self, element, controller )
			Gunsmith_FocusCamo( self, element, controller )
		else
			Gunsmith_FocusCamo( self, element, controller )
		end
		return f9_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "isPackage" ) then
			OpenBuyInventoryItemDialog( self, element, controller, "CamoBlacksmith" )
			return true
		elseif not IsGunsmithItemWeaponOptionLocked( menu, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			Gunsmith_SelectCamo( self, element, controller )
			GoBack( self, controller )
			ClearMenuSavedState( menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueTrue( element, controller, "isPackage" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsGunsmithItemWeaponOptionLocked( menu, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	selectionList:subscribeToGlobalModel( controller, "PerController", "StoreRoot.InventoryItemPurchaseSuccessful", function ( model )
		UpdateDataSource( self, selectionList, controller )
	end )
	selectionList:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return Gunsmith_IsCamoEquipped( menu, element, controller )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return Gunsmith_IsCamoNew( menu, element, controller )
			end
		},
		{
			stateName = "bmContracts",
			condition = function ( menu, element, event )
				return IsGunsmithItemWeaponOptionLocked( menu, element, controller ) and IsSpecialContractCamo( element, controller )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsGunsmithItemWeaponOptionLocked( menu, element, controller )
			end
		}
	} )
	selectionList:linkToElementModel( selectionList, "isBMClassified", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "isChallengeClassified", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isChallengeClassified"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "isPackage", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPackage"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "weaponOptionTypeName", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "weaponOptionTypeName"
		} )
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local GridItemButtonBackdropSymbols = CoD.GridItemButtonBackdropSymbols.new( self, controller )
	GridItemButtonBackdropSymbols:setLeftRight( true, false, 98, 1192.67 )
	GridItemButtonBackdropSymbols:setTopBottom( true, false, 144.5, 601.5 )
	GridItemButtonBackdropSymbols:setAlpha( 0 )
	GridItemButtonBackdropSymbols:setZoom( -7.02 )
	self:addElement( GridItemButtonBackdropSymbols )
	self.GridItemButtonBackdropSymbols = GridItemButtonBackdropSymbols
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0:setAlpha( 0 )
	cac3dTitleIntermediary0:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_CAMO_SELECT_TITLE", "mp", controller, weaponIndex ) )
		end
	end )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 4.13, 72 )
	ElemsSideList:setTopBottom( true, false, -11, 659 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local itemDescription = CoD.BlackMarketItemDescription.new( self, controller )
	itemDescription:setLeftRight( true, false, 448, 832 )
	itemDescription:setTopBottom( true, false, 175, 197 )
	itemDescription.weaponDescTextBox:setText( LocalizeIntoString( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MENU_CAMO" ) )
	itemDescription:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return ShouldHideClassifiedDescription( element, controller )
			end
		}
	} )
	itemDescription:linkToElementModel( itemDescription, "ref", true, function ( model )
		self:updateElementState( itemDescription, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ref"
		} )
	end )
	self:addElement( itemDescription )
	self.itemDescription = itemDescription
	
	local limitedEditionCamoDescription = CoD.BlackMarketItemDescription.new( self, controller )
	limitedEditionCamoDescription:setLeftRight( true, false, 448, 832 )
	limitedEditionCamoDescription:setTopBottom( true, false, 175, 197 )
	limitedEditionCamoDescription.weaponDescTextBox:setText( Engine.Localize( "MPUI_LIMITED_CAMO_ITEM_CLASSIFIED_DESC" ) )
	limitedEditionCamoDescription:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return ShouldHideClassifiedLimitedEditionCamoDescription( element, controller )
			end
		}
	} )
	limitedEditionCamoDescription:linkToElementModel( limitedEditionCamoDescription, "ref", true, function ( model )
		self:updateElementState( limitedEditionCamoDescription, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ref"
		} )
	end )
	self:addElement( limitedEditionCamoDescription )
	self.limitedEditionCamoDescription = limitedEditionCamoDescription
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( self, controller )
	WeaponNameWidget0:setLeftRight( true, false, 449, 782 )
	WeaponNameWidget0:setTopBottom( true, false, 137, 171 )
	WeaponNameWidget0:mergeStateConditions( {
		{
			stateName = "NoText",
			condition = function ( menu, element, event )
				return ShouldHideItemWeaponOptionInGunsmith( element, controller )
			end
		}
	} )
	WeaponNameWidget0:linkToElementModel( WeaponNameWidget0, "itemIndex", true, function ( model )
		self:updateElementState( WeaponNameWidget0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	MenuFrame:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			MenuFrame.titleLabel:setText( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_CAMO_SELECT_TITLE", "mp", controller, weaponIndex ) )
		end
	end )
	MenuFrame:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_CAMO_SELECT_TITLE", "mp", controller, weaponIndex ) )
		end
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local categoryTabs = CoD.FE_TabBar.new( self, controller )
	categoryTabs:setLeftRight( true, false, 0, 2497 )
	categoryTabs:setTopBottom( true, false, 85, 126 )
	categoryTabs.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	categoryTabs.Tabs.grid:setHorizontalCount( 7 )
	categoryTabs.Tabs.grid:setDataSource( "CACCustomizationTabs" )
	categoryTabs:registerEventHandler( "list_active_changed", function ( element, event )
		local f33_local0 = nil
		CallCustomElementFunction_Self( self, "tabChanged", element, controller )
		UpdateElementState( self, "WeaponNameWidget0", controller )
		UpdateElementState( self, "progressionInfo", controller )
		UpdateElementState( self, "itemDescription", controller )
		return f33_local0
	end )
	self:addElement( categoryTabs )
	self.categoryTabs = categoryTabs
	
	local progressionInfo = CoD.ChallengeProgressionInfo.new( self, controller )
	progressionInfo:setLeftRight( true, false, 439, 859 )
	progressionInfo:setTopBottom( false, true, -162, -78 )
	progressionInfo.requirementTitle:setText( Engine.Localize( "MENU_CAMO_REQUIREMENTS" ) )
	progressionInfo.completedTitle:setText( Engine.Localize( "MENU_CAMO_COMPLETE" ) )
	progressionInfo:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return ShouldHideItemWeaponOptionInGunsmith( element, controller )
			end
		},
		{
			stateName = "bmComtracts",
			condition = function ( menu, element, event )
				return IsSpecialContractCamo( element, controller ) and not IsGunsmithItemWeaponOptionLocked( menu, element, controller )
			end
		},
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return not IsGunsmithItemWeaponOptionLocked( menu, element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "unlockProgressAndTarget" )
			end
		}
	} )
	progressionInfo:linkToElementModel( progressionInfo, "itemIndex", true, function ( model )
		self:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	progressionInfo:linkToElementModel( progressionInfo, "weaponOptionTypeName", true, function ( model )
		self:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "weaponOptionTypeName"
		} )
	end )
	progressionInfo:linkToElementModel( progressionInfo, "unlockProgressAndTarget", true, function ( model )
		self:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "unlockProgressAndTarget"
		} )
	end )
	self:addElement( progressionInfo )
	self.progressionInfo = progressionInfo
	
	local CryptokeyTypeNameLeft = CoD.CryptokeyTypeNameLeft.new( self, controller )
	CryptokeyTypeNameLeft:setLeftRight( true, false, 439, 550 )
	CryptokeyTypeNameLeft:setTopBottom( false, true, -101, -79 )
	CryptokeyTypeNameLeft:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f41_local0 = AlwaysTrue()
				if f41_local0 then
					if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
						f41_local0 = IsSelfModelValueNonEmptyString( element, controller, "rarity" )
					else
						f41_local0 = false
					end
				end
				return f41_local0
			end
		}
	} )
	CryptokeyTypeNameLeft:linkToElementModel( CryptokeyTypeNameLeft, "isBMClassified", true, function ( model )
		self:updateElementState( CryptokeyTypeNameLeft, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	CryptokeyTypeNameLeft:linkToElementModel( CryptokeyTypeNameLeft, "rarity", true, function ( model )
		self:updateElementState( CryptokeyTypeNameLeft, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rarity"
		} )
	end )
	self:addElement( CryptokeyTypeNameLeft )
	self.CryptokeyTypeNameLeft = CryptokeyTypeNameLeft
	
	local ModeIconName = CoD.ModeIconName.new( self, controller )
	ModeIconName:setLeftRight( true, false, 891, 1181 )
	ModeIconName:setTopBottom( false, true, -162, -111 )
	self:addElement( ModeIconName )
	self.ModeIconName = ModeIconName
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( false, true, -772, 0 )
	XCamMouseControl:setTopBottom( true, true, 223.5, -197.5 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local LockIcon = CoD.cac_LockBig.new( self, controller )
	LockIcon:setLeftRight( false, false, 159, 255 )
	LockIcon:setTopBottom( true, false, 14, 684 )
	LockIcon:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LockIcon:linkToElementModel( LockIcon, "isBMClassified", true, function ( model )
		self:updateElementState( LockIcon, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	itemDescription:linkToElementModel( selectionList, nil, false, function ( model )
		itemDescription:setModel( model, controller )
	end )
	limitedEditionCamoDescription:linkToElementModel( selectionList, nil, false, function ( model )
		limitedEditionCamoDescription:setModel( model, controller )
	end )
	WeaponNameWidget0:linkToElementModel( selectionList, nil, false, function ( model )
		WeaponNameWidget0:setModel( model, controller )
	end )
	WeaponNameWidget0:linkToElementModel( selectionList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( name ) )
		end
	end )
	progressionInfo:linkToElementModel( selectionList, nil, false, function ( model )
		progressionInfo:setModel( model, controller )
	end )
	CryptokeyTypeNameLeft:linkToElementModel( selectionList, "rarityType", false, function ( model )
		CryptokeyTypeNameLeft:setModel( model, controller )
	end )
	ModeIconName:linkToElementModel( selectionList, nil, false, function ( model )
		ModeIconName:setModel( model, controller )
	end )
	LockIcon:linkToElementModel( selectionList, nil, false, function ( model )
		LockIcon:setModel( model, controller )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f55_local0 = nil
		ShowHeaderKickerAndIcon( self )
		SetHeadingKickerText( "MENU_PLAY_LOCAL" )
		if not f55_local0 then
			f55_local0 = self:dispatchEventToChildren( event )
		end
		return f55_local0
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f56_local0 = nil
		if not IsLAN() then
			SetHeadingKickerText( "MPUI_PUBLIC_MATCH_LOBBY" )
		end
		if not f56_local0 then
			f56_local0 = self:dispatchEventToChildren( event )
		end
		return f56_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		SetPerControllerTableProperty( controller, "customizationType", nil )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if CACShowRotatePrompt( self, element, controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CACShowRotatePrompt( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
			return true
		else
			return false
		end
	end, false )
	selectionList.id = "selectionList"
	MenuFrame:setModel( self.buttonModel, controller )
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
		element.GridItemButtonBackdropContainer3x4:close()
		element.selectionList:close()
		element.GridItemButtonBackdropSymbols:close()
		element.cac3dTitleIntermediary0:close()
		element.ElemsSideList:close()
		element.itemDescription:close()
		element.limitedEditionCamoDescription:close()
		element.WeaponNameWidget0:close()
		element.MenuFrame:close()
		element.categoryTabs:close()
		element.progressionInfo:close()
		element.CryptokeyTypeNameLeft:close()
		element.ModeIconName:close()
		element.XCamMouseControl:close()
		element.LockIcon:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithCamoSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

