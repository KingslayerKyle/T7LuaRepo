require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponVariantIcon" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseShowcaseWeapon_ListButton" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseShowcaseWeapon_LockedVariantText" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseShowcaseWeapon_SelectionInfoWidget" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseShowcaseWeapon_VariantButton" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )

local GetShowcaseWeaponModeValue = function ( controller )
	local showcaseWeaponMode = Engine.CreateModel( Engine.GetModelForController( controller ), "ShowcaseWeapon.Mode" )
	local modeValue = Engine.GetModelValue( showcaseWeaponMode )
	return modeValue
end

local SetShowcaseWeaponModeValue = function ( controller, value )
	local showcaseWeaponMode = Engine.CreateModel( Engine.GetModelForController( controller ), "ShowcaseWeapon.Mode" )
	Engine.SetModelValue( showcaseWeaponMode, value )
end

local SetFocusOnLastSelectedWeapon = function ( self, controller, weaponIndex )
	local buttonIndex = 1
	local mode = CoD.PlayerRoleUtility.customizationMode
	local heroIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
	local weaponWidget = self.weaponList:findItem( {
		itemIndex = weaponIndex
	}, nil, false, nil )
	self.weaponList:setActiveItem( weaponWidget )
end

local SetFocusOnLastSelectedWeaponCategory = function ( self, controller, weaponCategory )
	local tabIndex = #CoD.CraftUtility.WeaponGroupNames + 1
	local mode = CoD.PlayerRoleUtility.customizationMode
	local heroIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
	for _, weaponGroupData in ipairs( CoD.CraftUtility.WeaponGroupNames ) do
		if weaponCategory == weaponGroupData.weapon_category then
			tabIndex = weaponGroupData.index + 1
			break
		end
	end
	local weaponCategoryWidget = self.tabList.Tabs.grid:getItemAtPosition( 1, tabIndex, false )
	if weaponCategoryWidget then
		self.tabList.Tabs.grid:setActiveItem( weaponCategoryWidget )
	end
end

local PostLoadFunc = function ( self, controller )
	self.disableDarkenElement = true
	self.disableBlur = true
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
	CoD.SetCustomization( controller, customizationType, "type" )
	local weaponIndex = Engine.GetHeroShowcaseWeaponAttribute( controller, CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, "weaponIndex" )
	local weaponGroup = Engine.GetItemGroup( weaponIndex, CoD.PlayerRoleUtility.customizationMode )
	SetFocusOnLastSelectedWeaponCategory( self, controller, weaponGroup )
	SetFocusOnLastSelectedWeapon( self, controller, weaponIndex )
	self.updateMode = function ( self, mode, element )
		SetShowcaseWeaponModeValue( controller, mode )
		if mode == Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_WEAPONLIST then
			self.tabList.Tabs.m_disableNavigation = false
			CoD.SwapFocusableElements( controller, self.variantList, self.weaponList )
			self:setState( "DefaultState" )
		elseif mode == Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_VARIANTS then
			self.tabList.Tabs.m_disableNavigation = true
			self.variantList:updateDataSource()
			CoD.SwapFocusableElements( controller, self.weaponList, self.variantList )
			self:setState( "ShowVariants" )
		end
	end
	
end

local PreLoadFunc = function ( self, controller )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
	CoD.SetCustomization( controller, customizationType, "type" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "ShowcaseWeapon.updateVariantList" )
	CoD.perController[controller].weaponIndexForVariant = 0
end

LUI.createMenu.ChooseShowcaseWeapon = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseShowcaseWeapon" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_PrimaryWeapon"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseShowcaseWeapon.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 552 )
	LeftPanel:setTopBottom( 0, 0, 117, 1116 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( 0.5, 0.5, -960, 960 )
	CategoryListPanel:setTopBottom( 0.5, 0.5, -414, -356 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local selectionInfoWidget = CoD.ChooseShowcaseWeapon_SelectionInfoWidget.new( self, controller )
	selectionInfoWidget:mergeStateConditions( {
		{
			stateName = "VariantSelect",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "ShowcaseWeapon.Mode", Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_VARIANTS )
			end
		}
	} )
	selectionInfoWidget:linkToElementModel( selectionInfoWidget, "isBMClassified", true, function ( model )
		self:updateElementState( selectionInfoWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	selectionInfoWidget:linkToElementModel( selectionInfoWidget, "itemIndex", true, function ( model )
		self:updateElementState( selectionInfoWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	selectionInfoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ShowcaseWeapon.Mode" ), function ( model )
		self:updateElementState( selectionInfoWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ShowcaseWeapon.Mode"
		} )
	end )
	selectionInfoWidget:setLeftRight( 1, 1, -1275.5, -0.5 )
	selectionInfoWidget:setTopBottom( 1, 1, -894, 0 )
	selectionInfoWidget.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
	self:addElement( selectionInfoWidget )
	self.selectionInfoWidget = selectionInfoWidget
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local weaponList = LUI.UIList.new( self, controller, 10, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( 0, 0, 116, 536 )
	weaponList:setTopBottom( 0, 0, 207.5, 946.5 )
	weaponList:setWidgetType( CoD.ChooseShowcaseWeapon_ListButton )
	weaponList:setVerticalCount( 7 )
	weaponList:setSpacing( 10 )
	weaponList:setDataSource( "Unlockables" )
	weaponList:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local element = weaponList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	weaponList:linkToElementModel( weaponList, "isBMClassified", true, function ( model )
		local element = weaponList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	weaponList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		Gunsmith_GainFocus( self, element, controller )
		return retVal
	end )
	weaponList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	weaponList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( weaponList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and IsCACWeaponVariantAvailable( element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CallCustomElementFunction_Self( self, "updateMode", Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_VARIANTS )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not IsCACWeaponVariantAvailable( element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			HeroShowcaseWeaponSelected( menu, element, controller )
			MarkCACPaintshopDataDirtyForEdittingSpecialist( controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			SetPerControllerTableProperty( controller, "isShowcaseWeaponMenu", false )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and IsCACWeaponVariantAvailable( element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not IsCACWeaponVariantAvailable( element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	local variantList = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	variantList:makeFocusable()
	variantList:setLeftRight( 0, 0, 116.5, 622.5 )
	variantList:setTopBottom( 0, 0, 205, 883 )
	variantList:setAlpha( 0 )
	variantList:setWidgetType( CoD.ChooseShowcaseWeapon_VariantButton )
	variantList:setHorizontalCount( 3 )
	variantList:setVerticalCount( 4 )
	variantList:setSpacing( 10 )
	variantList:setDataSource( "WeaponVariantList" )
	variantList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if DoesWeaponVariantContainLockedAttachments( self, element, controller ) then
			FocusWeaponVariant( self, element, controller )
			SetElementStateByElementName( self, "lockedVariantText", controller, "ShowText" )
		elseif not DoesWeaponVariantContainLockedAttachments( self, element, controller ) then
			FocusWeaponVariant( self, element, controller )
			SetElementStateByElementName( self, "lockedVariantText", controller, "DefaultState" )
		end
		return retVal
	end )
	variantList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return retVal
	end )
	variantList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( variantList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not DoesWeaponVariantContainLockedAttachments( self, element, controller ) then
			HeroShowcaseWeaponVariantSelected( menu, element, controller )
			MarkCACPaintshopDataDirtyForEdittingSpecialist( controller )
			CallCustomElementFunction_Self( self, "updateMode", Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_WEAPONLIST )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			SetPerControllerTableProperty( controller, "isShowcaseWeaponMenu", false )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not DoesWeaponVariantContainLockedAttachments( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( variantList, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		CallCustomElementFunction_Self( self, "updateMode", Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_WEAPONLIST )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:addElement( variantList )
	self.variantList = variantList
	
	local attachmentList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	attachmentList:makeFocusable()
	attachmentList:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShowcaseWeaponLocked",
			condition = function ( menu, element, event )
				return IsProgressionElementItemLocked( menu, element, controller )
			end
		}
	} )
	attachmentList:setLeftRight( 0, 0, 678, 1126 )
	attachmentList:setTopBottom( 0, 0, 274, 322 )
	attachmentList:setAlpha( 0 )
	attachmentList:setWidgetType( CoD.WeaponVariantIcon )
	attachmentList:setHorizontalCount( 9 )
	self:addElement( attachmentList )
	self.attachmentList = attachmentList
	
	local lockedVariantText = CoD.ChooseShowcaseWeapon_LockedVariantText.new( self, controller )
	lockedVariantText:mergeStateConditions( {
		{
			stateName = "ShowText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	lockedVariantText:setLeftRight( 0, 0, 674, 1229 )
	lockedVariantText:setTopBottom( 0, 0, 338, 376 )
	lockedVariantText:setAlpha( 0 )
	lockedVariantText.lockedVariantText:setText( Engine.Localize( "HEROES_SHOWCASE_WEAPON_VARIANT_LOCKED" ) )
	self:addElement( lockedVariantText )
	self.lockedVariantText = lockedVariantText
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( 0, 0, 6, 108 )
	ElemsSideList:setTopBottom( 0, 0, -18.5, 986.5 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local BlackHeader = LUI.UIImage.new()
	BlackHeader:setLeftRight( 0, 0, 116, 623 )
	BlackHeader:setTopBottom( 0, 0, 139, 187 )
	BlackHeader:setRGB( 0, 0, 0 )
	BlackHeader:setAlpha( 0.44 )
	self:addElement( BlackHeader )
	self.BlackHeader = BlackHeader
	
	local variantName = LUI.UIText.new()
	variantName:setLeftRight( 0, 0, 126, 426 )
	variantName:setTopBottom( 0, 0, 142, 180 )
	variantName:setAlpha( 0 )
	variantName:setText( Engine.Localize( "MENU_VARIANTS_CAPS" ) )
	variantName:setTTF( "fonts/default.ttf" )
	variantName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	variantName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( variantName )
	self.variantName = variantName
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "HEROES_SHOWCASE_WEAPON_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "HEROES_SHOWCASE_WEAPON_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cac" ) )
	MenuFrame:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		ShowHeaderIconOnly( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local tabList = CoD.FE_TabBar.new( self, controller )
	tabList:setLeftRight( 0, 0, 0, 3840 )
	tabList:setTopBottom( 0, 0, 125, 186 )
	tabList.Tabs.grid:setHorizontalCount( 10 )
	tabList.Tabs.grid:setDataSource( "GunsmithWeaponTabType" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		CAC_TabChanged( self, element, controller )
		return retVal
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	selectionInfoWidget:linkToElementModel( weaponList, nil, false, function ( model )
		selectionInfoWidget:setModel( model, controller )
	end )
	selectionInfoWidget:linkToElementModel( weaponList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectionInfoWidget.itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	selectionInfoWidget:linkToElementModel( variantList, "variantNameBig", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectionInfoWidget.itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	selectionInfoWidget:linkToElementModel( weaponList, "weaponAttributes", false, function ( model )
		selectionInfoWidget.WeaponAttributesInternal:setModel( model, controller )
	end )
	attachmentList:linkToElementModel( variantList, "listDataSource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachmentList:setDataSource( modelValue )
		end
	end )
	weaponList.navigation = {
		up = variantList,
		right = variantList
	}
	variantList.navigation = {
		left = weaponList,
		right = attachmentList,
		down = weaponList
	}
	attachmentList.navigation = {
		left = variantList
	}
	self.resetProperties = function ()
		variantList:completeAnimation()
		attachmentList:completeAnimation()
		ElemsSideList:completeAnimation()
		BlackHeader:completeAnimation()
		selectionInfoWidget:completeAnimation()
		CategoryListPanel:completeAnimation()
		LeftPanel:completeAnimation()
		variantName:completeAnimation()
		weaponList:completeAnimation()
		tabList:completeAnimation()
		lockedVariantText:completeAnimation()
		variantList:setLeftRight( 0, 0, 116.5, 622.5 )
		variantList:setTopBottom( 0, 0, 205, 883 )
		variantList:setAlpha( 0 )
		attachmentList:setLeftRight( 0, 0, 678, 1126 )
		attachmentList:setTopBottom( 0, 0, 274, 322 )
		attachmentList:setAlpha( 0 )
		ElemsSideList:setLeftRight( 0, 0, 6, 108 )
		ElemsSideList:setTopBottom( 0, 0, -18.5, 986.5 )
		BlackHeader:setAlpha( 0.44 )
		selectionInfoWidget:setLeftRight( 1, 1, -1275.5, -0.5 )
		selectionInfoWidget:setTopBottom( 1, 1, -894, 0 )
		selectionInfoWidget.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
		CategoryListPanel:setAlpha( 1 )
		LeftPanel:setLeftRight( 0, 0, 96, 552 )
		LeftPanel:setTopBottom( 0, 0, 117, 1116 )
		variantName:setAlpha( 0 )
		weaponList:setAlpha( 1 )
		tabList:setAlpha( 1 )
		lockedVariantText:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				selectionInfoWidget:completeAnimation()
				self.selectionInfoWidget:setLeftRight( 1, 1, -1367.5, -92.5 )
				self.selectionInfoWidget:setTopBottom( 1, 1, -894, 0 )
				self.clipFinished( selectionInfoWidget, {} )
				variantList:completeAnimation()
				self.variantList:setLeftRight( 0, 0, -411, 96 )
				self.variantList:setTopBottom( 0, 0, 204, 884 )
				self.clipFinished( variantList, {} )
				attachmentList:completeAnimation()
				self.attachmentList:setLeftRight( 0, 0, 586, 1042 )
				self.attachmentList:setTopBottom( 0, 0, 274, 322 )
				self.clipFinished( attachmentList, {} )
				ElemsSideList:completeAnimation()
				self.ElemsSideList:setLeftRight( 0, 0, 14, 116 )
				self.ElemsSideList:setTopBottom( 0, 0, -18.5, 986.5 )
				self.clipFinished( ElemsSideList, {} )
				BlackHeader:completeAnimation()
				self.BlackHeader:setAlpha( 0 )
				self.clipFinished( BlackHeader, {} )
			end,
			ShowVariants = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( 0, 0, 96, 642 )
					LeftPanel:setTopBottom( 0, 0, 116.5, 1000.5 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 552 )
				self.LeftPanel:setTopBottom( 0, 0, 116.5, 1000.5 )
				LeftPanelFrame2( LeftPanel, {} )
				local CategoryListPanelFrame2 = function ( CategoryListPanel, event )
					if not event.interrupted then
						CategoryListPanel:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					CategoryListPanel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CategoryListPanel, event )
					else
						CategoryListPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListPanel:completeAnimation()
				self.CategoryListPanel:setAlpha( 1 )
				CategoryListPanelFrame2( CategoryListPanel, {} )
				local selectionInfoWidgetFrame2 = function ( selectionInfoWidget, event )
					if not event.interrupted then
						selectionInfoWidget:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					selectionInfoWidget:setLeftRight( 1, 1, -1275.5, -0.5 )
					selectionInfoWidget:setTopBottom( 1, 1, -894, 0 )
					if event.interrupted then
						self.clipFinished( selectionInfoWidget, event )
					else
						selectionInfoWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionInfoWidget:completeAnimation()
				self.selectionInfoWidget:setLeftRight( 1, 1, -1367.5, -92.5 )
				self.selectionInfoWidget:setTopBottom( 1, 1, -894, 0 )
				selectionInfoWidgetFrame2( selectionInfoWidget, {} )
				local weaponListFrame2 = function ( weaponList, event )
					if not event.interrupted then
						weaponList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					weaponList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weaponList, event )
					else
						weaponList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 1 )
				weaponListFrame2( weaponList, {} )
				local variantListFrame2 = function ( variantList, event )
					local variantListFrame3 = function ( variantList, event )
						if not event.interrupted then
							variantList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						variantList:setLeftRight( 0, 0, 116, 623 )
						variantList:setTopBottom( 0, 0, 204, 884 )
						variantList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( variantList, event )
						else
							variantList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						variantListFrame3( variantList, event )
						return 
					else
						variantList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						variantList:setLeftRight( 0, 0, -147.5, 359.5 )
						variantList:registerEventHandler( "transition_complete_keyframe", variantListFrame3 )
					end
				end
				
				variantList:completeAnimation()
				self.variantList:setLeftRight( 0, 0, -411, 96 )
				self.variantList:setTopBottom( 0, 0, 204, 884 )
				self.variantList:setAlpha( 0 )
				variantListFrame2( variantList, {} )
				local attachmentListFrame2 = function ( attachmentList, event )
					local attachmentListFrame3 = function ( attachmentList, event )
						if not event.interrupted then
							attachmentList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						attachmentList:setLeftRight( 0, 0, 674, 1130 )
						attachmentList:setTopBottom( 0, 0, 274, 322 )
						attachmentList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( attachmentList, event )
						else
							attachmentList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						attachmentListFrame3( attachmentList, event )
						return 
					else
						attachmentList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						attachmentList:setLeftRight( 0, 0, 630, 1086 )
						attachmentList:registerEventHandler( "transition_complete_keyframe", attachmentListFrame3 )
					end
				end
				
				attachmentList:completeAnimation()
				self.attachmentList:setLeftRight( 0, 0, 586, 1042 )
				self.attachmentList:setTopBottom( 0, 0, 274, 322 )
				self.attachmentList:setAlpha( 0 )
				attachmentListFrame2( attachmentList, {} )
				local BlackHeaderFrame2 = function ( BlackHeader, event )
					local BlackHeaderFrame3 = function ( BlackHeader, event )
						if not event.interrupted then
							BlackHeader:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						BlackHeader:setAlpha( 0.44 )
						if event.interrupted then
							self.clipFinished( BlackHeader, event )
						else
							BlackHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackHeaderFrame3( BlackHeader, event )
						return 
					else
						BlackHeader:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						BlackHeader:registerEventHandler( "transition_complete_keyframe", BlackHeaderFrame3 )
					end
				end
				
				BlackHeader:completeAnimation()
				self.BlackHeader:setAlpha( 0 )
				BlackHeaderFrame2( BlackHeader, {} )
				local variantNameFrame2 = function ( variantName, event )
					local variantNameFrame3 = function ( variantName, event )
						if not event.interrupted then
							variantName:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						variantName:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( variantName, event )
						else
							variantName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						variantNameFrame3( variantName, event )
						return 
					else
						variantName:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						variantName:registerEventHandler( "transition_complete_keyframe", variantNameFrame3 )
					end
				end
				
				variantName:completeAnimation()
				self.variantName:setAlpha( 0 )
				variantNameFrame2( variantName, {} )
				local tabListFrame2 = function ( tabList, event )
					if not event.interrupted then
						tabList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					tabList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( tabList, event )
					else
						tabList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tabList:completeAnimation()
				self.tabList:setAlpha( 1 )
				tabListFrame2( tabList, {} )
			end
		},
		ShowVariants = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 642 )
				self.LeftPanel:setTopBottom( 0, 0, 116.5, 1000.5 )
				self.clipFinished( LeftPanel, {} )
				CategoryListPanel:completeAnimation()
				self.CategoryListPanel:setAlpha( 0 )
				self.clipFinished( CategoryListPanel, {} )
				selectionInfoWidget:completeAnimation()
				selectionInfoWidget.itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.selectionInfoWidget.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				self.clipFinished( selectionInfoWidget, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				self.clipFinished( weaponList, {} )
				variantList:completeAnimation()
				self.variantList:setAlpha( 1 )
				self.clipFinished( variantList, {} )
				attachmentList:completeAnimation()
				self.attachmentList:setLeftRight( 0, 0, 674, 1130 )
				self.attachmentList:setTopBottom( 0, 0, 274, 322 )
				self.attachmentList:setAlpha( 1 )
				self.clipFinished( attachmentList, {} )
				lockedVariantText:completeAnimation()
				self.lockedVariantText:setAlpha( 1 )
				self.clipFinished( lockedVariantText, {} )
				variantName:completeAnimation()
				self.variantName:setAlpha( 1 )
				self.clipFinished( variantName, {} )
				tabList:completeAnimation()
				self.tabList:setAlpha( 0 )
				self.clipFinished( tabList, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( 0, 0, 96, 552 )
					LeftPanel:setTopBottom( 0, 0, 116.5, 1000.5 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 642 )
				self.LeftPanel:setTopBottom( 0, 0, 116.5, 1000.5 )
				LeftPanelFrame2( LeftPanel, {} )
				local CategoryListPanelFrame2 = function ( CategoryListPanel, event )
					if not event.interrupted then
						CategoryListPanel:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					CategoryListPanel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CategoryListPanel, event )
					else
						CategoryListPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListPanel:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				CategoryListPanel:setAlpha( 0 )
				CategoryListPanel:registerEventHandler( "transition_complete_keyframe", CategoryListPanelFrame2 )
				local selectionInfoWidgetFrame2 = function ( selectionInfoWidget, event )
					if not event.interrupted then
						selectionInfoWidget:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					selectionInfoWidget:setLeftRight( 1, 1, -1367.5, -92.5 )
					selectionInfoWidget:setTopBottom( 1, 1, -894, 0 )
					if event.interrupted then
						self.clipFinished( selectionInfoWidget, event )
					else
						selectionInfoWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionInfoWidget:completeAnimation()
				self.selectionInfoWidget:setLeftRight( 1, 1, -1275.5, -0.5 )
				self.selectionInfoWidget:setTopBottom( 1, 1, -894, 0 )
				selectionInfoWidgetFrame2( selectionInfoWidget, {} )
				local weaponListFrame2 = function ( weaponList, event )
					if not event.interrupted then
						weaponList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					weaponList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weaponList, event )
					else
						weaponList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				weaponList:setAlpha( 0 )
				weaponList:registerEventHandler( "transition_complete_keyframe", weaponListFrame2 )
				local variantListFrame2 = function ( variantList, event )
					local variantListFrame3 = function ( variantList, event )
						if not event.interrupted then
							variantList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						variantList:setLeftRight( 0, 0, -411, 96 )
						variantList:setTopBottom( 0, 0, 204, 884 )
						variantList:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( variantList, event )
						else
							variantList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						variantListFrame3( variantList, event )
						return 
					else
						variantList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						variantList:setLeftRight( 0, 0, -147.5, 359.5 )
						variantList:setAlpha( 0 )
						variantList:registerEventHandler( "transition_complete_keyframe", variantListFrame3 )
					end
				end
				
				variantList:completeAnimation()
				self.variantList:setLeftRight( 0, 0, 116, 623 )
				self.variantList:setTopBottom( 0, 0, 204, 884 )
				self.variantList:setAlpha( 1 )
				variantListFrame2( variantList, {} )
				local attachmentListFrame2 = function ( attachmentList, event )
					if not event.interrupted then
						attachmentList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					attachmentList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( attachmentList, event )
					else
						attachmentList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				attachmentList:completeAnimation()
				self.attachmentList:setAlpha( 1 )
				attachmentListFrame2( attachmentList, {} )
				local BlackHeaderFrame2 = function ( BlackHeader, event )
					local BlackHeaderFrame3 = function ( BlackHeader, event )
						if not event.interrupted then
							BlackHeader:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						BlackHeader:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BlackHeader, event )
						else
							BlackHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackHeaderFrame3( BlackHeader, event )
						return 
					else
						BlackHeader:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						BlackHeader:setAlpha( 0 )
						BlackHeader:registerEventHandler( "transition_complete_keyframe", BlackHeaderFrame3 )
					end
				end
				
				BlackHeader:completeAnimation()
				self.BlackHeader:setAlpha( 0.44 )
				BlackHeaderFrame2( BlackHeader, {} )
				local variantNameFrame2 = function ( variantName, event )
					local variantNameFrame3 = function ( variantName, event )
						if not event.interrupted then
							variantName:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						variantName:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( variantName, event )
						else
							variantName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						variantNameFrame3( variantName, event )
						return 
					else
						variantName:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						variantName:setAlpha( 0 )
						variantName:registerEventHandler( "transition_complete_keyframe", variantNameFrame3 )
					end
				end
				
				variantName:completeAnimation()
				self.variantName:setAlpha( 1 )
				variantNameFrame2( variantName, {} )
				local tabListFrame2 = function ( tabList, event )
					if not event.interrupted then
						tabList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					tabList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( tabList, event )
					else
						tabList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tabList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				tabList:setAlpha( 0 )
				tabList:registerEventHandler( "transition_complete_keyframe", tabListFrame2 )
			end
		}
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ShowcaseWeapon.Mode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "ShowcaseWeapon.Mode"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		CallCustomElementFunction_Self( self, "updateMode", Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_WEAPONLIST )
		SetPerControllerTableProperty( controller, "isShowcaseWeaponMenu", true )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderKickerAndIcon( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsModelValueEqualTo( controller, "ShowcaseWeapon.Mode", Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_WEAPONLIST ) then
			SendClientScriptNotifyForAdjustedClient( controller, "CustomClass_closed", "" )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			SetPerControllerTableProperty( controller, "isShowcaseWeaponMenu", false )
			GoBack( self, controller )
			PlaySoundSetSound( self, "menu_no_selection" )
			return true
		else
			CallCustomElementFunction_Self( self, "updateMode", Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_WEAPONLIST )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER", nil )
		return true
	end, false )
	weaponList.id = "weaponList"
	variantList.id = "variantList"
	attachmentList.id = "attachmentList"
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
		self.weaponList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.selectionInfoWidget:close()
		self.weaponList:close()
		self.variantList:close()
		self.attachmentList:close()
		self.lockedVariantText:close()
		self.ElemsSideList:close()
		self.MenuFrame:close()
		self.tabList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseShowcaseWeapon.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

