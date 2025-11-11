require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameLeft" )
require( "ui.uieditor.widgets.CAC.BlackMarketItemDescription" )
require( "ui.uieditor.widgets.CAC.cac_PrimaryWeaponDescription" )
require( "ui.uieditor.widgets.CAC.Customization.ChallengeProgressionInfo" )
require( "ui.uieditor.widgets.CAC.Customization.CustomizationItem_ND" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameLabel" )
require( "ui.uieditor.widgets.CAC.ModeIconName" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

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
	self:setLeftRight( 0, 0, 0, 1351 )
	self:setTopBottom( 0, 0, 0, 757 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local selectionList = LUI.UIList.new( menu, controller, 12, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
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
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		menu:updateElementState( selectionList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	selectionList:setLeftRight( 0, 0, 13, 523 )
	selectionList:setTopBottom( 0, 0, 16, 700 )
	selectionList:setWidgetType( CoD.CustomizationItem_ND )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 12 )
	selectionList:setVerticalCounter( CoD.verticalCounter )
	selectionList:setDataSource( "WeaponOptions" )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local element = selectionList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:linkToElementModel( selectionList, "isBMClassified", true, function ( model )
		local element = selectionList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsItemWeaponOptionNew( element, controller ) then
			SetWeaponOptionAsOld( menu, element, controller )
			UpdateSelfElementState( menu, element, controller )
			WC_WeaponOptionGainFocus( self, element, controller )
		else
			WC_WeaponOptionGainFocus( self, element, controller )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsItemWeaponOptionLocked( menu, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			WC_SelectingCustomization( self, element, controller )
			SetWeaponOptionClassItem( self, element, controller )
			PlaySoundAlias( "cac_equipment_add_equipment" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsItemWeaponOptionLocked( menu, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local categoryName = CoD.InfoPaneItemNameLabel.new( menu, controller )
	categoryName:setLeftRight( 0, 0, 556, 1156 )
	categoryName:setTopBottom( 0, 0, 16, 67 )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local itemDescription = CoD.BlackMarketItemDescription.new( menu, controller )
	itemDescription:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		}
	} )
	itemDescription:linkToElementModel( itemDescription, "isBMClassified", true, function ( model )
		menu:updateElementState( itemDescription, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	itemDescription:setLeftRight( 0, 0, 556, 1132 )
	itemDescription:setTopBottom( 0, 0, 73.5, 106.5 )
	itemDescription.weaponDescTextBox:setText( LocalizeIntoString( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MENU_CAMO" ) )
	self:addElement( itemDescription )
	self.itemDescription = itemDescription
	
	local prestigeDescription = CoD.cac_PrimaryWeaponDescription.new( menu, controller )
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
	prestigeDescription:setLeftRight( 0, 0, 556, 1132 )
	prestigeDescription:setTopBottom( 0, 0, 73.5, 106.5 )
	self:addElement( prestigeDescription )
	self.prestigeDescription = prestigeDescription
	
	local progressionInfo = CoD.ChallengeProgressionInfo.new( menu, controller )
	progressionInfo:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return ShouldHideItemWeaponOption( element, controller )
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
	progressionInfo:linkToElementModel( progressionInfo, "unlockProgressAndTarget", true, function ( model )
		menu:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "unlockProgressAndTarget"
		} )
	end )
	progressionInfo:setLeftRight( 0, 0, 557, 1187 )
	progressionInfo:setTopBottom( 1, 1, -108, 18 )
	self:addElement( progressionInfo )
	self.progressionInfo = progressionInfo
	
	local CryptokeyTypeNameLeft = CoD.CryptokeyTypeNameLeft.new( menu, controller )
	CryptokeyTypeNameLeft:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f24_local0
				if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
					f24_local0 = IsSelfModelValueNonEmptyString( element, controller, "rarity" )
				else
					f24_local0 = false
				end
				return f24_local0
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
	CryptokeyTypeNameLeft:setLeftRight( 0, 0, 557, 723 )
	CryptokeyTypeNameLeft:setTopBottom( 1, 1, -16.5, 16.5 )
	self:addElement( CryptokeyTypeNameLeft )
	self.CryptokeyTypeNameLeft = CryptokeyTypeNameLeft
	
	local ModeIconName = CoD.ModeIconName.new( menu, controller )
	ModeIconName:setLeftRight( 0, 0, 1234.5, 1669.5 )
	ModeIconName:setTopBottom( 1, 1, -108, -32 )
	self:addElement( ModeIconName )
	self.ModeIconName = ModeIconName
	
	categoryName:linkToElementModel( selectionList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	itemDescription:linkToElementModel( selectionList, nil, false, function ( model )
		itemDescription:setModel( model, controller )
	end )
	prestigeDescription:linkToElementModel( selectionList, nil, false, function ( model )
		prestigeDescription:setModel( model, controller )
	end )
	prestigeDescription:linkToElementModel( selectionList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			prestigeDescription.weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	progressionInfo:linkToElementModel( selectionList, nil, false, function ( model )
		progressionInfo:setModel( model, controller )
	end )
	progressionInfo:linkToElementModel( selectionList, "weaponOptionType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			progressionInfo.requirementTitle:setText( Engine.Localize( GetWeaponOptionProgressTitle( controller, modelValue ) ) )
		end
	end )
	progressionInfo:linkToElementModel( selectionList, "weaponOptionType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			progressionInfo.completedTitle:setText( Engine.Localize( GetWeaponOptionCompleteTitle( controller, modelValue ) ) )
		end
	end )
	CryptokeyTypeNameLeft:linkToElementModel( selectionList, "rarityType", false, function ( model )
		CryptokeyTypeNameLeft:setModel( model, controller )
	end )
	ModeIconName:linkToElementModel( selectionList, nil, false, function ( model )
		ModeIconName:setModel( model, controller )
	end )
	selectionList.id = "selectionList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.selectionList:close()
		self.categoryName:close()
		self.itemDescription:close()
		self.prestigeDescription:close()
		self.progressionInfo:close()
		self.CryptokeyTypeNameLeft:close()
		self.ModeIconName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

