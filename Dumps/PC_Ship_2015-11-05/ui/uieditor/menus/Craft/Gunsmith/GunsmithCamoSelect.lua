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
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeName" )

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
	selectionList:setDataSource( "GunsmithWeaponOptions" )
	selectionList:setWidgetType( CoD.CustomizationItem_ND )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 8 )
	selectionList:setVerticalCounter( CoD.verticalCounter )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local f5_local0 = selectionList
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:linkToElementModel( selectionList, "isBMClassified", true, function ( model )
		local f6_local0 = selectionList
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f7_local0 = nil
		if Gunsmith_IsCamoNew( self, element, controller ) then
			Gunsmith_SetWeaponOptionAsOld( self, element, controller )
			UpdateSelfElementState( self, element, controller )
			Gunsmith_FocusCamo( self, element, controller )
		else
			Gunsmith_FocusCamo( self, element, controller )
		end
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
		if not IsGunsmithItemWeaponOptionLocked( menu, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			Gunsmith_SelectCamo( self, element, controller )
			GoBack( self, controller )
			ClearMenuSavedState( menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsGunsmithItemWeaponOptionLocked( menu, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			return true
		else
			return false
		end
	end, false )
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
			cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_CAMO_SELECT_TITLE", controller, weaponIndex ) ) )
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
	itemDescription.weaponDescTextBox:setText( Engine.Localize( LocalizeIntoString( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MENU_CAMO" ) ) )
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
	self:addElement( itemDescription )
	self.itemDescription = itemDescription
	
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
			MenuFrame.titleLabel:setText( Engine.Localize( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_CAMO_SELECT_TITLE", controller, weaponIndex ) ) )
		end
	end )
	MenuFrame:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_CAMO_SELECT_TITLE", controller, weaponIndex ) ) )
		end
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local categoryTabs = CoD.FE_TabBar.new( self, controller )
	categoryTabs:setLeftRight( true, false, 0, 2497 )
	categoryTabs:setTopBottom( true, false, 85, 126 )
	categoryTabs.Tabs.grid:setDataSource( "CACCustomizationTabs" )
	categoryTabs.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	categoryTabs.Tabs.grid:setHorizontalCount( 7 )
	categoryTabs:registerEventHandler( "list_active_changed", function ( element, event )
		local f25_local0 = nil
		CallCustomElementFunction_Self( self, "tabChanged", element, controller )
		UpdateElementState( self, "WeaponNameWidget0", controller )
		UpdateElementState( self, "progressionInfo", controller )
		UpdateElementState( self, "itemDescription", controller )
		return f25_local0
	end )
	self:addElement( categoryTabs )
	self.categoryTabs = categoryTabs
	
	local progressionInfo = CoD.ChallengeProgressionInfo.new( self, controller )
	progressionInfo:setLeftRight( true, false, 443, 863 )
	progressionInfo:setTopBottom( false, true, -183, -71 )
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
	self:addElement( progressionInfo )
	self.progressionInfo = progressionInfo
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( false, true, -772, 0 )
	XCamMouseControl:setTopBottom( true, true, 223.5, -197.5 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local rarityType = CoD.CryptokeyTypeName.new( self, controller )
	rarityType:setLeftRight( true, false, 449, 533 )
	rarityType:setTopBottom( false, true, -93, -71 )
	rarityType:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f30_local0
				if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
					f30_local0 = IsSelfModelValueNonEmptyString( element, controller, "rarity" )
				else
					f30_local0 = false
				end
				return f30_local0
			end
		}
	} )
	rarityType:linkToElementModel( rarityType, "isBMClassified", true, function ( model )
		self:updateElementState( rarityType, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	rarityType:linkToElementModel( rarityType, "rarity", true, function ( model )
		self:updateElementState( rarityType, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rarity"
		} )
	end )
	self:addElement( rarityType )
	self.rarityType = rarityType
	
	itemDescription:linkToElementModel( selectionList, nil, false, function ( model )
		itemDescription:setModel( model, controller )
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
	rarityType:linkToElementModel( selectionList, "rarityType", false, function ( model )
		rarityType:setModel( model, controller )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f38_local0 = nil
		ShowHeaderKickerAndIcon( self )
		if not f38_local0 then
			f38_local0 = self:dispatchEventToChildren( event )
		end
		return f38_local0
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		if CACShowRotatePrompt( self, element, controller ) then
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
		element.WeaponNameWidget0:close()
		element.MenuFrame:close()
		element.categoryTabs:close()
		element.progressionInfo:close()
		element.XCamMouseControl:close()
		element.rarityType:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithCamoSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

