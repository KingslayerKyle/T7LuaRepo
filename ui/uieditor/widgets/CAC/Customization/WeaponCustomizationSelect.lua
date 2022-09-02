-- 30b5731b6e45d7509a90fa36ef600a14
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.Customization.CustomizationItem_ND" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameLabel" )
require( "ui.uieditor.widgets.CAC.BlackMarketItemDescription" )
require( "ui.uieditor.widgets.CAC.cac_PrimaryWeaponDescription" )
require( "ui.uieditor.widgets.CAC.Customization.ChallengeProgressionInfo" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameLeft" )
require( "ui.uieditor.widgets.CAC.ModeIconName" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

CoD.WeaponCustomizationSelect = InheritFrom( LUI.UIElement )
CoD.WeaponCustomizationSelect.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.WeaponCustomizationSelect )
	self.id = "WeaponCustomizationSelect"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 901 )
	self:setTopBottom( true, false, 0, 505 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local selectionList = LUI.UIList.new( menu, controller, 8, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 9, 349 )
	selectionList:setTopBottom( true, false, 11, 467 )
	selectionList:setWidgetType( CoD.CustomizationItem_ND )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 8 )
	selectionList:setVerticalCounter( CoD.verticalCounter )
	selectionList:setDataSource( "WeaponOptions" )
	selectionList:linkToElementModel( selectionList, "isPackage", true, function ( model )
		local f2_local0 = selectionList
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPackage"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local f3_local0 = selectionList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:linkToElementModel( selectionList, "isBMClassified", true, function ( model )
		local f4_local0 = selectionList
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		if IsItemWeaponOptionNew( element, controller ) then
			SetWeaponOptionAsOld( menu, element, controller )
			UpdateSelfElementState( menu, element, controller )
			WC_WeaponOptionGainFocus( self, element, controller )
		else
			WC_WeaponOptionGainFocus( self, element, controller )
		end
		return f5_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	menu:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if IsSelfModelValueTrue( f8_arg0, f8_arg2, "isPackage" ) then
			OpenBuyInventoryItemDialog( self, f8_arg0, f8_arg2, "CamoCAC" )
			return true
		elseif not IsItemWeaponOptionLocked( f8_arg1, f8_arg0, f8_arg2 ) and not IsSelfModelValueTrue( f8_arg0, f8_arg2, "isBMClassified" ) then
			WC_SelectingCustomization( self, f8_arg0, f8_arg2 )
			SetWeaponOptionClassItem( self, f8_arg0, f8_arg2 )
			PlaySoundAlias( "cac_equipment_add_equipment" )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if IsSelfModelValueTrue( f9_arg0, f9_arg2, "isPackage" ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsItemWeaponOptionLocked( f9_arg1, f9_arg0, f9_arg2 ) and not IsSelfModelValueTrue( f9_arg0, f9_arg2, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
				return IsItemWeaponOptionEquipped( element, controller )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return IsItemWeaponOptionNew( element, controller )
			end
		},
		{
			stateName = "bmContracts",
			condition = function ( menu, element, event )
				return IsItemWeaponOptionLocked( menu, element, controller ) and IsSpecialContractCamo( element, controller )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsItemWeaponOptionLocked( menu, element, controller )
			end
		}
	} )
	selectionList:linkToElementModel( selectionList, "isBMClassified", true, function ( model )
		menu:updateElementState( selectionList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "isChallengeClassified", true, function ( model )
		menu:updateElementState( selectionList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isChallengeClassified"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "isPackage", true, function ( model )
		menu:updateElementState( selectionList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPackage"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		menu:updateElementState( selectionList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "weaponOptionTypeName", true, function ( model )
		menu:updateElementState( selectionList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "weaponOptionTypeName"
		} )
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local categoryName = CoD.InfoPaneItemNameLabel.new( menu, controller )
	categoryName:setLeftRight( true, false, 371, 771 )
	categoryName:setTopBottom( true, false, 11, 45 )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local itemDescription = CoD.BlackMarketItemDescription.new( menu, controller )
	itemDescription:setLeftRight( true, false, 371, 755 )
	itemDescription:setTopBottom( true, false, 49, 71 )
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
		menu:updateElementState( itemDescription, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ref"
		} )
	end )
	self:addElement( itemDescription )
	self.itemDescription = itemDescription
	
	local limitedEditionCamoDescription = CoD.BlackMarketItemDescription.new( menu, controller )
	limitedEditionCamoDescription:setLeftRight( true, false, 371, 755 )
	limitedEditionCamoDescription:setTopBottom( true, false, 49, 71 )
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
		menu:updateElementState( limitedEditionCamoDescription, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ref"
		} )
	end )
	self:addElement( limitedEditionCamoDescription )
	self.limitedEditionCamoDescription = limitedEditionCamoDescription
	
	local prestigeDescription = CoD.cac_PrimaryWeaponDescription.new( menu, controller )
	prestigeDescription:setLeftRight( true, false, 371, 755 )
	prestigeDescription:setTopBottom( true, false, 49, 71 )
	prestigeDescription:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsWeaponPrestigeItem( element, controller )
			end
		}
	} )
	prestigeDescription:linkToElementModel( prestigeDescription, "itemIndex", true, function ( model )
		menu:updateElementState( prestigeDescription, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( prestigeDescription )
	self.prestigeDescription = prestigeDescription
	
	local progressionInfo = CoD.ChallengeProgressionInfo.new( menu, controller )
	progressionInfo:setLeftRight( true, false, 371, 791 )
	progressionInfo:setTopBottom( false, true, -72, 12 )
	progressionInfo:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return ShouldHideItemWeaponOption( element, controller )
			end
		},
		{
			stateName = "bmComtracts",
			condition = function ( menu, element, event )
				local f27_local0
				if not IsItemWeaponOptionLocked( menu, element, controller ) then
					f27_local0 = IsSpecialContractCamo( element, controller )
				else
					f27_local0 = false
				end
				return f27_local0
			end
		},
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return not IsItemWeaponOptionLocked( menu, element, controller )
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
		menu:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	progressionInfo:linkToElementModel( progressionInfo, "weaponOptionTypeName", true, function ( model )
		menu:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "weaponOptionTypeName"
		} )
	end )
	progressionInfo:linkToElementModel( progressionInfo, "unlockProgressAndTarget", true, function ( model )
		menu:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "unlockProgressAndTarget"
		} )
	end )
	self:addElement( progressionInfo )
	self.progressionInfo = progressionInfo
	
	local CryptokeyTypeNameLeft = CoD.CryptokeyTypeNameLeft.new( menu, controller )
	CryptokeyTypeNameLeft:setLeftRight( true, false, 371, 482 )
	CryptokeyTypeNameLeft:setTopBottom( false, true, -11, 12 )
	CryptokeyTypeNameLeft:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f33_local0
				if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
					f33_local0 = IsSelfModelValueNonEmptyString( element, controller, "rarity" )
				else
					f33_local0 = false
				end
				return f33_local0
			end
		}
	} )
	CryptokeyTypeNameLeft:linkToElementModel( CryptokeyTypeNameLeft, "isBMClassified", true, function ( model )
		menu:updateElementState( CryptokeyTypeNameLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	CryptokeyTypeNameLeft:linkToElementModel( CryptokeyTypeNameLeft, "rarity", true, function ( model )
		menu:updateElementState( CryptokeyTypeNameLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rarity"
		} )
	end )
	self:addElement( CryptokeyTypeNameLeft )
	self.CryptokeyTypeNameLeft = CryptokeyTypeNameLeft
	
	local ModeIconName = CoD.ModeIconName.new( menu, controller )
	ModeIconName:setLeftRight( true, false, 823, 1113 )
	ModeIconName:setTopBottom( false, true, -72, -21 )
	self:addElement( ModeIconName )
	self.ModeIconName = ModeIconName
	
	local LockIcon = CoD.cac_LockBig.new( menu, controller )
	LockIcon:setLeftRight( false, false, 282.5, 378.5 )
	LockIcon:setTopBottom( true, false, -111.5, 558.5 )
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
		menu:updateElementState( LockIcon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	local f1_local10 = nil
	if IsPC() then
		f1_local10 = CoD.XCamMouseControl.new( menu, controller )
	else
		f1_local10 = LUI.UIElement.createFake()
	end
	f1_local10:setLeftRight( true, false, 371, 992 )
	f1_local10:setTopBottom( true, false, 74, 428 )
	if IsPC() then
		self:addElement( f1_local10 )
	end
	self.XCamMouseControl = f1_local10
	categoryName:linkToElementModel( selectionList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			categoryName.itemName:setText( Engine.Localize( name ) )
		end
	end )
	itemDescription:linkToElementModel( selectionList, nil, false, function ( model )
		itemDescription:setModel( model, controller )
	end )
	limitedEditionCamoDescription:linkToElementModel( selectionList, nil, false, function ( model )
		limitedEditionCamoDescription:setModel( model, controller )
	end )
	prestigeDescription:linkToElementModel( selectionList, nil, false, function ( model )
		prestigeDescription:setModel( model, controller )
	end )
	prestigeDescription:linkToElementModel( selectionList, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			prestigeDescription.weaponDescTextBox:setText( Engine.Localize( description ) )
		end
	end )
	progressionInfo:linkToElementModel( selectionList, nil, false, function ( model )
		progressionInfo:setModel( model, controller )
	end )
	progressionInfo:linkToElementModel( selectionList, "weaponOptionType", true, function ( model )
		local weaponOptionType = Engine.GetModelValue( model )
		if weaponOptionType then
			progressionInfo.requirementTitle:setText( Engine.Localize( GetWeaponOptionProgressTitle( controller, weaponOptionType ) ) )
		end
	end )
	progressionInfo:linkToElementModel( selectionList, "weaponOptionType", true, function ( model )
		local weaponOptionType = Engine.GetModelValue( model )
		if weaponOptionType then
			progressionInfo.completedTitle:setText( Engine.Localize( GetWeaponOptionCompleteTitle( controller, weaponOptionType ) ) )
		end
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
	selectionList.id = "selectionList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.selectionList:close()
		element.categoryName:close()
		element.itemDescription:close()
		element.limitedEditionCamoDescription:close()
		element.prestigeDescription:close()
		element.progressionInfo:close()
		element.CryptokeyTypeNameLeft:close()
		element.ModeIconName:close()
		element.LockIcon:close()
		element.XCamMouseControl:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

