require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameLeft" )
require( "ui.uieditor.widgets.CAC.BlackMarketItemDescription" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.Customization.ChallengeProgressionInfo" )
require( "ui.uieditor.widgets.CAC.Customization.CustomizationItem_ND" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropContainer3x4" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropSymbols" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CAC.ModeIconName" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.TabbedWidgets.WeaponGroupsTabWidget" )

local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].customizationType = Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO
	local camoIndexModel = CoD.perController[controller].gunsmithCamoIndexModel
	self:setModel( camoIndexModel )
	local camoIndex = Engine.GetModelValue( camoIndexModel )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local weaponPlusAttachments = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( controller, variantModel )
	local gunsmithModeAbbr = CoD.CraftUtility.GetModeAbbreviation()
	local loadoutSlotName = CoD.CraftUtility.GetLoadoutSlot( controller )
end

local UpdateCamoListFromTabChanged = function ( self, element, controller )
	if self.selectionList and element.filterString then
		local filterCategory = "camo"
		DataSources.GunsmithWeaponOptions.setCurrentFilterItem( filterCategory .. "_" .. element.filterString )
		self.selectionList:updateDataSource()
		local focusItem = self.selectionList:getItemAt( 1 )
		self.selectionList:setActiveItem( focusItem )
	end
end

local PostLoadFunc = function ( self, controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	CoD.CACUtility.GunsmithWeaponOptionsTable = {}
	CoD.CACUtility.GunsmithWeaponOptionsTable = CoD.CACUtility.GetGunsmithWeaponOptionsTable( controller, CoD.CACUtility.GunsmithWeaponOptionsTable, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO, weaponIndex, 0, true )
	self.tabChanged = UpdateCamoListFromTabChanged
	local currentMode = Engine.CurrentSessionMode()
	if currentMode == Enum.eModes.MODE_INVALID then
		currentMode = Enum.eModes.MODE_CAMPAIGN
	end
	local filterCategory = "camo"
	local filterModeString = CoD.WeaponOptionFilterToString( currentMode )
	local tabWidget = self.categoryTabs.Tabs.grid:findItem( nil, {
		filterEnum = currentMode
	}, false, nil )
	if tabWidget then
		self.categoryTabs.Tabs.grid:setActiveItem( tabWidget )
	else
		local focusTabWidget = self.categoryTabs.Tabs.grid:getItemAt( 2 )
		self.categoryTabs.Tabs.grid:setActiveItem( focusTabWidget )
		filterModeString = CoD.WeaponOptionFilterToString( focusTabWidget.filterEnum )
	end
	for f3_local0 = Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_FIRST, Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_COUNT - 1, 1 do
		local filetTabWidget = self.categoryTabs.Tabs.grid:findItem( nil, {
			filterEnum = f3_local0
		}, false, nil )
		if filetTabWidget then
			local weaponItemIndex = CoD.GetCustomization( controller, "weapon_index" )
			local weaponOptionType = CoD.CACUtility.GetWeaponOptionTypeForName( "camo" )
			local breadcrumbCountModel = filetTabWidget:getModel( controller, "breadcrumbCount" )
			if breadcrumbCountModel then
				if f3_local0 < Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MODE_COUNT then
					local newItemCount = Engine.WeaponOptionNewItemCount( controller, weaponItemIndex, weaponOptionType, filetTabWidget.filterEnum )
					Engine.SetModelValue( breadcrumbCountModel, newItemCount )
				else
					local newItemCount = Engine.WeaponOptionNewModeAgnosticItemCount( controller, weaponItemIndex, weaponOptionType, filetTabWidget.filterEnum )
					Engine.SetModelValue( breadcrumbCountModel, newItemCount )
				end
			end
		end
	end
	local filterItemName = filterCategory .. "_" .. filterModeString
	DataSources.GunsmithWeaponOptions.setCurrentFilterItem( filterItemName )
	self.selectionList:updateDataSource()
end

LUI.createMenu.GunsmithCamoSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithCamoSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithCamoSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 640 )
	LeftPanel:setTopBottom( 0, 0, 189, 1080 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local GridItemButtonBackdropContainer3x4 = CoD.GridItemButtonBackdropContainer3x4.new( self, controller )
	GridItemButtonBackdropContainer3x4:setLeftRight( 0, 0, 148, 664 )
	GridItemButtonBackdropContainer3x4:setTopBottom( 0, 0, 218, 902 )
	GridItemButtonBackdropContainer3x4:setAlpha( 0 )
	self:addElement( GridItemButtonBackdropContainer3x4 )
	self.GridItemButtonBackdropContainer3x4 = GridItemButtonBackdropContainer3x4
	
	local selectionList = LUI.UIList.new( self, controller, 12, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
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
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	selectionList:setLeftRight( 0, 0, 112, 622 )
	selectionList:setTopBottom( 0, 0, 206, 890 )
	selectionList:setWidgetType( CoD.CustomizationItem_ND )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 12 )
	selectionList:setVerticalCounter( CoD.verticalCounter )
	selectionList:setDataSource( "GunsmithWeaponOptions" )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local element = selectionList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:linkToElementModel( selectionList, "isBMClassified", true, function ( model )
		local element = selectionList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if Gunsmith_IsCamoNew( self, element, controller ) then
			Gunsmith_SetWeaponOptionAsOld( self, element, controller )
			UpdateSelfElementState( self, element, controller )
			Gunsmith_FocusCamo( self, element, controller )
		else
			Gunsmith_FocusCamo( self, element, controller )
		end
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
		if not IsGunsmithItemWeaponOptionLocked( menu, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			Gunsmith_SelectCamo( self, element, controller )
			GoBack( self, controller )
			ClearMenuSavedState( menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsGunsmithItemWeaponOptionLocked( menu, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local GridItemButtonBackdropSymbols = CoD.GridItemButtonBackdropSymbols.new( self, controller )
	GridItemButtonBackdropSymbols:setLeftRight( 0, 0, 147, 1789 )
	GridItemButtonBackdropSymbols:setTopBottom( 0, 0, 217, 903 )
	GridItemButtonBackdropSymbols:setAlpha( 0 )
	GridItemButtonBackdropSymbols:setZoom( -7 )
	self:addElement( GridItemButtonBackdropSymbols )
	self.GridItemButtonBackdropSymbols = GridItemButtonBackdropSymbols
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( 0, 0, -108, 806 )
	cac3dTitleIntermediary0:setTopBottom( 0, 0, -6, 213 )
	cac3dTitleIntermediary0:setAlpha( 0 )
	cac3dTitleIntermediary0:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_CAMO_SELECT_TITLE", controller, modelValue ) )
		end
	end )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine0:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( 0, 0, 6, 108 )
	ElemsSideList:setTopBottom( 0, 0, -16.5, 988.5 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local itemDescription = CoD.BlackMarketItemDescription.new( self, controller )
	itemDescription:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		}
	} )
	itemDescription:linkToElementModel( itemDescription, "isBMClassified", true, function ( model )
		self:updateElementState( itemDescription, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	itemDescription:setLeftRight( 0, 0, 672, 1248 )
	itemDescription:setTopBottom( 0, 0, 262.5, 295.5 )
	itemDescription.weaponDescTextBox:setText( LocalizeIntoString( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MENU_CAMO" ) )
	self:addElement( itemDescription )
	self.itemDescription = itemDescription
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( self, controller )
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
	WeaponNameWidget0:setLeftRight( 0, 0, 673, 1173 )
	WeaponNameWidget0:setTopBottom( 0, 0, 205.5, 256.5 )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	MenuFrame:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MenuFrame.titleLabel:setText( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_CAMO_SELECT_TITLE", controller, modelValue ) )
		end
	end )
	MenuFrame:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_CAMO_SELECT_TITLE", controller, modelValue ) )
		end
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local categoryTabs = CoD.FE_TabBar.new( self, controller )
	categoryTabs:setLeftRight( 0, 0, 0, 3746 )
	categoryTabs:setTopBottom( 0, 0, 127, 189 )
	categoryTabs.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	categoryTabs.Tabs.grid:setHorizontalCount( 7 )
	categoryTabs.Tabs.grid:setDataSource( "CACCustomizationTabs" )
	categoryTabs:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		CallCustomElementFunction_Self( self, "tabChanged", element, controller )
		UpdateElementState( self, "WeaponNameWidget0", controller )
		UpdateElementState( self, "progressionInfo", controller )
		UpdateElementState( self, "itemDescription", controller )
		return retVal
	end )
	self:addElement( categoryTabs )
	self.categoryTabs = categoryTabs
	
	local progressionInfo = CoD.ChallengeProgressionInfo.new( self, controller )
	progressionInfo:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return ShouldHideItemWeaponOptionInGunsmith( element, controller )
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
				return AlwaysFalse()
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
	progressionInfo:setLeftRight( 0, 0, 659, 1289 )
	progressionInfo:setTopBottom( 1, 1, -243, -117 )
	progressionInfo.requirementTitle:setText( Engine.Localize( "MENU_CAMO_REQUIREMENTS" ) )
	progressionInfo.completedTitle:setText( Engine.Localize( "MENU_CAMO_COMPLETE" ) )
	self:addElement( progressionInfo )
	self.progressionInfo = progressionInfo
	
	local CryptokeyTypeNameLeft = CoD.CryptokeyTypeNameLeft.new( self, controller )
	CryptokeyTypeNameLeft:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f30_local0 = AlwaysTrue()
				if f30_local0 then
					if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
						f30_local0 = IsSelfModelValueNonEmptyString( element, controller, "rarity" )
					else
						f30_local0 = false
					end
				end
				return f30_local0
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
	CryptokeyTypeNameLeft:setLeftRight( 0, 0, 659, 825 )
	CryptokeyTypeNameLeft:setTopBottom( 1, 1, -151.5, -118.5 )
	self:addElement( CryptokeyTypeNameLeft )
	self.CryptokeyTypeNameLeft = CryptokeyTypeNameLeft
	
	local ModeIconName = CoD.ModeIconName.new( self, controller )
	ModeIconName:setLeftRight( 0, 0, 1336.5, 1771.5 )
	ModeIconName:setTopBottom( 1, 1, -243, -167 )
	self:addElement( ModeIconName )
	self.ModeIconName = ModeIconName
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( 1, 1, -1158, 0 )
	XCamMouseControl:setTopBottom( 0, 1, 336, -296 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	itemDescription:linkToElementModel( selectionList, nil, false, function ( model )
		itemDescription:setModel( model, controller )
	end )
	WeaponNameWidget0:linkToElementModel( selectionList, nil, false, function ( model )
		WeaponNameWidget0:setModel( model, controller )
	end )
	WeaponNameWidget0:linkToElementModel( selectionList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
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
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		SetHeadingKickerText( "MENU_PLAY_LOCAL" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		if not IsLAN() then
			SetHeadingKickerText( "MPUI_PUBLIC_MATCH_LOBBY" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		SetPerControllerTableProperty( controller, "customizationType", nil )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if CACShowRotatePrompt( self, element, controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CACShowRotatePrompt( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.GridItemButtonBackdropContainer3x4:close()
		self.selectionList:close()
		self.GridItemButtonBackdropSymbols:close()
		self.cac3dTitleIntermediary0:close()
		self.ElemsSideList:close()
		self.itemDescription:close()
		self.WeaponNameWidget0:close()
		self.MenuFrame:close()
		self.categoryTabs:close()
		self.progressionInfo:close()
		self.CryptokeyTypeNameLeft:close()
		self.ModeIconName:close()
		self.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithCamoSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

