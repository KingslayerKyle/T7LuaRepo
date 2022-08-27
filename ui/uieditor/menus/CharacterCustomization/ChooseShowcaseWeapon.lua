-- f877c4eab4cbe7a2d7187745bd01cf49
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseShowcaseWeapon_SelectionInfoWidget" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseShowcaseWeapon_ListButton" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseShowcaseWeapon_VariantButton" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponVariantIcon" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseShowcaseWeapon_LockedVariantText" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local f0_local0 = function ( f1_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "ShowcaseWeapon.Mode" ) )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f2_arg0 ), "ShowcaseWeapon.Mode" ), f2_arg1 )
end

local f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = 1
	local f3_local1 = CoD.CCUtility.customizationMode
	local f3_local2 = CoD.CCUtility.Heroes.HeroIndexForEdits
	f3_arg0.weaponList:setActiveItem( f3_arg0.weaponList:findItem( {
		itemIndex = f3_arg2
	}, nil, false, false ) )
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = #CoD.Craft.WeaponGroupNames + 1
	local f4_local1 = CoD.CCUtility.customizationMode
	local f4_local2 = CoD.CCUtility.Heroes.HeroIndexForEdits
	for f4_local6, f4_local7 in ipairs( CoD.Craft.WeaponGroupNames ) do
		if f4_arg2 == f4_local7.weapon_category then
			f4_local0 = f4_local7.index + 1
			break
		end
	end
	f4_local3 = f4_arg0.tabList.Tabs.grid:getItemAtPosition( 1, f4_local0, false )
	if f4_local3 then
		f4_arg0.tabList.Tabs.grid:setActiveItem( f4_local3 )
	end
end

local PostLoadFunc = function ( f5_arg0, f5_arg1 )
	f5_arg0.disableDarkenElement = true
	f5_arg0.disableBlur = true
	CoD.SetCustomization( f5_arg1, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	local f5_local0 = Engine.GetHeroShowcaseWeaponAttribute( f5_arg1, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, "weaponIndex" )
	f0_local3( f5_arg0, f5_arg1, Engine.GetItemGroup( f5_local0, CoD.CCUtility.customizationMode ) )
	f0_local2( f5_arg0, f5_arg1, f5_local0 )
	f5_arg0.updateMode = function ( f6_arg0, f6_arg1, f6_arg2 )
		f0_local1( f5_arg1, f6_arg1 )
		if f6_arg1 == Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_WEAPONLIST then
			f6_arg0.tabList.Tabs.m_disableNavigation = false
			CoD.SwapFocusableElements( f5_arg1, f6_arg0.variantList, f6_arg0.weaponList )
			f6_arg0:setState( "DefaultState" )
		elseif f6_arg1 == Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_VARIANTS then
			f6_arg0.tabList.Tabs.m_disableNavigation = true
			f6_arg0.variantList:updateDataSource()
			CoD.SwapFocusableElements( f5_arg1, f6_arg0.weaponList, f6_arg0.variantList )
			f6_arg0:setState( "ShowVariants" )
		end
	end
	
end

local PreLoadFunc = function ( self, controller )
	CoD.SetCustomization( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseShowcaseWeapon.buttonPrompts" )
	local f8_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f8_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 368 )
	LeftPanel:setTopBottom( true, false, 78, 744 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local selectionInfoWidget = CoD.ChooseShowcaseWeapon_SelectionInfoWidget.new( f8_local1, controller )
	selectionInfoWidget:setLeftRight( false, true, -850, 0 )
	selectionInfoWidget:setTopBottom( false, true, -596, 0 )
	selectionInfoWidget.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
	selectionInfoWidget:mergeStateConditions( {
		{
			stateName = "VariantSelect",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "ShowcaseWeapon.Mode", Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_VARIANTS )
			end
		}
	} )
	selectionInfoWidget:linkToElementModel( selectionInfoWidget, "isBMClassified", true, function ( model )
		f8_local1:updateElementState( selectionInfoWidget, {
			name = "model_validation",
			menu = f8_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	selectionInfoWidget:linkToElementModel( selectionInfoWidget, "itemIndex", true, function ( model )
		f8_local1:updateElementState( selectionInfoWidget, {
			name = "model_validation",
			menu = f8_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	selectionInfoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ShowcaseWeapon.Mode" ), function ( model )
		f8_local1:updateElementState( selectionInfoWidget, {
			name = "model_validation",
			menu = f8_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ShowcaseWeapon.Mode"
		} )
	end )
	self:addElement( selectionInfoWidget )
	self.selectionInfoWidget = selectionInfoWidget
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local weaponList = LUI.UIList.new( f8_local1, controller, 7, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( true, false, 77, 357 )
	weaponList:setTopBottom( true, false, 136, 633 )
	weaponList:setWidgetType( CoD.ChooseShowcaseWeapon_ListButton )
	weaponList:setVerticalCount( 7 )
	weaponList:setSpacing( 7 )
	weaponList:setDataSource( "Unlockables" )
	weaponList:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local f13_local0 = weaponList
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	weaponList:linkToElementModel( weaponList, "isBMClassified", true, function ( model )
		local f14_local0 = weaponList
		local f14_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f14_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	weaponList:linkToElementModel( weaponList, "ref", true, function ( model )
		local f15_local0 = weaponList
		local f15_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "ref"
		}
		CoD.Menu.UpdateButtonShownState( f15_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	weaponList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f16_local0 = nil
		Gunsmith_GainFocus( self, element, controller )
		return f16_local0
	end )
	weaponList:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f17_local0
	end )
	weaponList:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	f8_local1:AddButtonCallbackFunction( weaponList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if not IsCACItemLocked( f19_arg1, f19_arg0, f19_arg2 ) and IsCACItemPurchased( f19_arg0, f19_arg2 ) and IsCACWeaponVariantAvailable( f19_arg0, f19_arg2 ) and not IsSelfModelValueTrue( f19_arg0, f19_arg2, "isBMClassified" ) and not IsCACItemContractLocked( f19_arg0, f19_arg2 ) then
			CallCustomElementFunction_Self( self, "updateMode", Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_VARIANTS )
			return true
		elseif not IsCACItemLocked( f19_arg1, f19_arg0, f19_arg2 ) and IsCACItemPurchased( f19_arg0, f19_arg2 ) and not IsCACWeaponVariantAvailable( f19_arg0, f19_arg2 ) and not IsSelfModelValueTrue( f19_arg0, f19_arg2, "isBMClassified" ) and not IsCACItemContractLocked( f19_arg0, f19_arg2 ) then
			HeroShowcaseWeaponSelected( f19_arg1, f19_arg0, f19_arg2 )
			MarkCACPaintshopDataDirtyForEdittingSpecialist( f19_arg2 )
			SendClientScriptMenuChangeNotify( f19_arg2, f19_arg1, false )
			SetPerControllerTableProperty( f19_arg2, "isShowcaseWeaponMenu", false )
			GoBack( self, f19_arg2 )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if not IsCACItemLocked( f20_arg1, f20_arg0, f20_arg2 ) and IsCACItemPurchased( f20_arg0, f20_arg2 ) and IsCACWeaponVariantAvailable( f20_arg0, f20_arg2 ) and not IsSelfModelValueTrue( f20_arg0, f20_arg2, "isBMClassified" ) and not IsCACItemContractLocked( f20_arg0, f20_arg2 ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsCACItemLocked( f20_arg1, f20_arg0, f20_arg2 ) and IsCACItemPurchased( f20_arg0, f20_arg2 ) and not IsCACWeaponVariantAvailable( f20_arg0, f20_arg2 ) and not IsSelfModelValueTrue( f20_arg0, f20_arg2, "isBMClassified" ) and not IsCACItemContractLocked( f20_arg0, f20_arg2 ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	local variantList = LUI.UIList.new( f8_local1, controller, 7, 0, nil, true, false, 0, 0, false, false )
	variantList:makeFocusable()
	variantList:setLeftRight( true, false, 77, 415 )
	variantList:setTopBottom( true, false, 136, 589 )
	variantList:setAlpha( 0 )
	variantList:setWidgetType( CoD.ChooseShowcaseWeapon_VariantButton )
	variantList:setHorizontalCount( 3 )
	variantList:setVerticalCount( 4 )
	variantList:setSpacing( 7 )
	variantList:setDataSource( "WeaponVariantList" )
	variantList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f21_local0 = nil
		if DoesWeaponVariantContainLockedAttachments( self, element, controller ) then
			FocusWeaponVariant( self, element, controller )
			SetElementStateByElementName( self, "lockedVariantText", controller, "ShowText" )
		elseif not DoesWeaponVariantContainLockedAttachments( self, element, controller ) then
			FocusWeaponVariant( self, element, controller )
			SetElementStateByElementName( self, "lockedVariantText", controller, "DefaultState" )
		end
		return f21_local0
	end )
	variantList:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f22_local0
	end )
	variantList:registerEventHandler( "lose_focus", function ( element, event )
		local f23_local0 = nil
		if element.loseFocus then
			f23_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f23_local0 = element.super:loseFocus( event )
		end
		return f23_local0
	end )
	f8_local1:AddButtonCallbackFunction( variantList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		if not DoesWeaponVariantContainLockedAttachments( self, f24_arg0, f24_arg2 ) then
			HeroShowcaseWeaponVariantSelected( f24_arg1, f24_arg0, f24_arg2 )
			MarkCACPaintshopDataDirtyForEdittingSpecialist( f24_arg2 )
			CallCustomElementFunction_Self( self, "updateMode", Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_WEAPONLIST )
			SendClientScriptMenuChangeNotify( f24_arg2, f24_arg1, false )
			SetPerControllerTableProperty( f24_arg2, "isShowcaseWeaponMenu", false )
			GoBack( self, f24_arg2 )
			return true
		else
			
		end
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		if not DoesWeaponVariantContainLockedAttachments( self, f25_arg0, f25_arg2 ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	f8_local1:AddButtonCallbackFunction( variantList, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		CallCustomElementFunction_Self( self, "updateMode", Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_WEAPONLIST )
		return true
	end, function ( f27_arg0, f27_arg1, f27_arg2 )
		CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( variantList )
	self.variantList = variantList
	
	local attachmentList = LUI.UIList.new( f8_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	attachmentList:makeFocusable()
	attachmentList:setLeftRight( true, false, 449, 753 )
	attachmentList:setTopBottom( true, false, 183, 215 )
	attachmentList:setAlpha( 0 )
	attachmentList:setWidgetType( CoD.WeaponVariantIcon )
	attachmentList:setHorizontalCount( 9 )
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
	self:addElement( attachmentList )
	self.attachmentList = attachmentList
	
	local lockedVariantText = CoD.ChooseShowcaseWeapon_LockedVariantText.new( f8_local1, controller )
	lockedVariantText:setLeftRight( true, false, 449, 819 )
	lockedVariantText:setTopBottom( true, false, 225.2, 250.2 )
	lockedVariantText:setAlpha( 0 )
	lockedVariantText.lockedVariantText:setText( Engine.Localize( "HEROES_SHOWCASE_WEAPON_VARIANT_LOCKED" ) )
	lockedVariantText:mergeStateConditions( {
		{
			stateName = "ShowText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( lockedVariantText )
	self.lockedVariantText = lockedVariantText
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( f8_local1, controller )
	ElemsSideList:setLeftRight( true, false, 4.13, 72 )
	ElemsSideList:setTopBottom( true, false, -12, 658 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local BlackHeader = LUI.UIImage.new()
	BlackHeader:setLeftRight( true, false, 77, 415 )
	BlackHeader:setTopBottom( true, false, 92.5, 124.5 )
	BlackHeader:setRGB( 0, 0, 0 )
	BlackHeader:setAlpha( 0.44 )
	self:addElement( BlackHeader )
	self.BlackHeader = BlackHeader
	
	local variantName = LUI.UIText.new()
	variantName:setLeftRight( true, false, 84, 284 )
	variantName:setTopBottom( true, false, 95, 120 )
	variantName:setAlpha( 0 )
	variantName:setText( Engine.Localize( "MENU_VARIANTS_CAPS" ) )
	variantName:setTTF( "fonts/default.ttf" )
	variantName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	variantName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( variantName )
	self.variantName = variantName
	
	local MenuFrame = CoD.GenericMenuFrame.new( f8_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "HEROES_SHOWCASE_WEAPON_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "HEROES_SHOWCASE_WEAPON_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cac" ) )
	MenuFrame:registerEventHandler( "menu_opened", function ( element, event )
		local f31_local0 = nil
		ShowHeaderIconOnly( f8_local1 )
		if not f31_local0 then
			f31_local0 = element:dispatchEventToChildren( event )
		end
		return f31_local0
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local tabList = CoD.FE_TabBar.new( f8_local1, controller )
	tabList:setLeftRight( true, false, 0, 2560 )
	tabList:setTopBottom( true, false, 83, 124 )
	tabList.Tabs.grid:setHorizontalCount( 10 )
	tabList.Tabs.grid:setDataSource( "GunsmithWeaponTabType" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f32_local0 = nil
		CAC_TabChanged( self, element, controller )
		return f32_local0
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local verticalCounter0 = CoD.verticalCounter.new( f8_local1, controller )
	verticalCounter0:setLeftRight( true, false, 117, 317 )
	verticalCounter0:setTopBottom( true, false, 645.5, 670.5 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local f33_local0 = nil
		SetAsListVerticalCounter( self, element, "weaponList" )
		if not f33_local0 then
			f33_local0 = element:dispatchEventToChildren( event )
		end
		return f33_local0
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	selectionInfoWidget:linkToElementModel( weaponList, nil, false, function ( model )
		selectionInfoWidget:setModel( model, controller )
	end )
	selectionInfoWidget:linkToElementModel( weaponList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			selectionInfoWidget.itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( name ) )
		end
	end )
	selectionInfoWidget:linkToElementModel( variantList, "variantNameBig", true, function ( model )
		local variantNameBig = Engine.GetModelValue( model )
		if variantNameBig then
			selectionInfoWidget.itemName.weaponNameWithVariant.variantName.itemName:setText( variantNameBig )
		end
	end )
	selectionInfoWidget:linkToElementModel( weaponList, "weaponAttributes", false, function ( model )
		selectionInfoWidget.WeaponAttributesInternal:setModel( model, controller )
	end )
	attachmentList:linkToElementModel( variantList, "listDataSource", true, function ( model )
		local listDataSource = Engine.GetModelValue( model )
		if listDataSource then
			attachmentList:setDataSource( listDataSource )
		end
	end )
	weaponList.navigation = {
		right = attachmentList
	}
	variantList.navigation = {
		right = attachmentList
	}
	attachmentList.navigation = {
		left = variantList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				CategoryListPanel:completeAnimation()
				self.CategoryListPanel:setAlpha( 1 )
				self.clipFinished( CategoryListPanel, {} )
				selectionInfoWidget:completeAnimation()
				selectionInfoWidget.itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.selectionInfoWidget:setLeftRight( false, true, -912, -62 )
				self.selectionInfoWidget:setTopBottom( false, true, -596, 0 )
				self.selectionInfoWidget.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				self.clipFinished( selectionInfoWidget, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 1 )
				self.clipFinished( weaponList, {} )
				variantList:completeAnimation()
				self.variantList:setLeftRight( true, false, -274, 64 )
				self.variantList:setTopBottom( true, false, 136, 589 )
				self.variantList:setAlpha( 0 )
				self.clipFinished( variantList, {} )
				attachmentList:completeAnimation()
				self.attachmentList:setLeftRight( true, false, 391, 695 )
				self.attachmentList:setTopBottom( true, false, 183, 215 )
				self.attachmentList:setAlpha( 0 )
				self.clipFinished( attachmentList, {} )
				lockedVariantText:completeAnimation()
				self.lockedVariantText:setAlpha( 0 )
				self.clipFinished( lockedVariantText, {} )
				ElemsSideList:completeAnimation()
				self.ElemsSideList:setLeftRight( true, false, 9.13, 77 )
				self.ElemsSideList:setTopBottom( true, false, -12, 658 )
				self.clipFinished( ElemsSideList, {} )
				BlackHeader:completeAnimation()
				self.BlackHeader:setAlpha( 0 )
				self.clipFinished( BlackHeader, {} )
				variantName:completeAnimation()
				self.variantName:setAlpha( 0 )
				self.clipFinished( variantName, {} )
				tabList:completeAnimation()
				self.tabList:setAlpha( 1 )
				self.clipFinished( tabList, {} )
			end,
			ShowVariants = function ()
				self:setupElementClipCounter( 10 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 428 )
					LeftPanel:setTopBottom( true, false, 78, 667 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 368 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
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
					selectionInfoWidget:setLeftRight( false, true, -850, 0 )
					selectionInfoWidget:setTopBottom( false, true, -596, 0 )
					if event.interrupted then
						self.clipFinished( selectionInfoWidget, event )
					else
						selectionInfoWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionInfoWidget:completeAnimation()
				self.selectionInfoWidget:setLeftRight( false, true, -912, -62 )
				self.selectionInfoWidget:setTopBottom( false, true, -596, 0 )
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
						variantList:setLeftRight( true, false, 77, 415 )
						variantList:setTopBottom( true, false, 136, 589 )
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
						variantList:setLeftRight( true, false, -98.5, 239.5 )
						variantList:registerEventHandler( "transition_complete_keyframe", variantListFrame3 )
					end
				end
				
				variantList:completeAnimation()
				self.variantList:setLeftRight( true, false, -274, 64 )
				self.variantList:setTopBottom( true, false, 136, 589 )
				self.variantList:setAlpha( 0 )
				variantListFrame2( variantList, {} )
				local attachmentListFrame2 = function ( attachmentList, event )
					local attachmentListFrame3 = function ( attachmentList, event )
						if not event.interrupted then
							attachmentList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						attachmentList:setLeftRight( true, false, 449, 753 )
						attachmentList:setTopBottom( true, false, 183, 215 )
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
						attachmentList:setLeftRight( true, false, 420, 724 )
						attachmentList:registerEventHandler( "transition_complete_keyframe", attachmentListFrame3 )
					end
				end
				
				attachmentList:completeAnimation()
				self.attachmentList:setLeftRight( true, false, 391, 695 )
				self.attachmentList:setTopBottom( true, false, 183, 215 )
				self.attachmentList:setAlpha( 0 )
				attachmentListFrame2( attachmentList, {} )
				lockedVariantText:completeAnimation()
				self.lockedVariantText:setAlpha( 0 )
				self.clipFinished( lockedVariantText, {} )
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
				self:setupElementClipCounter( 10 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
				self.clipFinished( LeftPanel, {} )
				CategoryListPanel:completeAnimation()
				self.CategoryListPanel:setAlpha( 0 )
				self.clipFinished( CategoryListPanel, {} )
				selectionInfoWidget:completeAnimation()
				selectionInfoWidget.itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.selectionInfoWidget:setLeftRight( false, true, -850, 0 )
				self.selectionInfoWidget:setTopBottom( false, true, -596, 0 )
				self.selectionInfoWidget.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				self.clipFinished( selectionInfoWidget, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				self.clipFinished( weaponList, {} )
				variantList:completeAnimation()
				self.variantList:setAlpha( 1 )
				self.clipFinished( variantList, {} )
				attachmentList:completeAnimation()
				self.attachmentList:setLeftRight( true, false, 449, 753 )
				self.attachmentList:setTopBottom( true, false, 183, 215 )
				self.attachmentList:setAlpha( 1 )
				self.clipFinished( attachmentList, {} )
				lockedVariantText:completeAnimation()
				self.lockedVariantText:setAlpha( 1 )
				self.clipFinished( lockedVariantText, {} )
				BlackHeader:completeAnimation()
				self.BlackHeader:setAlpha( 0.44 )
				self.clipFinished( BlackHeader, {} )
				variantName:completeAnimation()
				self.variantName:setAlpha( 1 )
				self.clipFinished( variantName, {} )
				tabList:completeAnimation()
				self.tabList:setAlpha( 0 )
				self.clipFinished( tabList, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 10 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 368 )
					LeftPanel:setTopBottom( true, false, 78, 667 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
				LeftPanelFrame2( LeftPanel, {} )
				local f55_local1 = function ( f57_arg0, f57_arg1 )
					if not f57_arg1.interrupted then
						f57_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					f57_arg0:setAlpha( 1 )
					if f57_arg1.interrupted then
						self.clipFinished( f57_arg0, f57_arg1 )
					else
						f57_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListPanel:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				CategoryListPanel:setAlpha( 0 )
				CategoryListPanel:registerEventHandler( "transition_complete_keyframe", f55_local1 )
				local selectionInfoWidgetFrame2 = function ( selectionInfoWidget, event )
					if not event.interrupted then
						selectionInfoWidget:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					selectionInfoWidget:setLeftRight( false, true, -912, -62 )
					selectionInfoWidget:setTopBottom( false, true, -596, 0 )
					if event.interrupted then
						self.clipFinished( selectionInfoWidget, event )
					else
						selectionInfoWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionInfoWidget:completeAnimation()
				self.selectionInfoWidget:setLeftRight( false, true, -850, 0 )
				self.selectionInfoWidget:setTopBottom( false, true, -596, 0 )
				selectionInfoWidgetFrame2( selectionInfoWidget, {} )
				local f55_local3 = function ( f59_arg0, f59_arg1 )
					if not f59_arg1.interrupted then
						f59_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					f59_arg0:setAlpha( 1 )
					if f59_arg1.interrupted then
						self.clipFinished( f59_arg0, f59_arg1 )
					else
						f59_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				weaponList:setAlpha( 0 )
				weaponList:registerEventHandler( "transition_complete_keyframe", f55_local3 )
				local variantListFrame2 = function ( variantList, event )
					local variantListFrame3 = function ( variantList, event )
						if not event.interrupted then
							variantList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						variantList:setLeftRight( true, false, -274, 64 )
						variantList:setTopBottom( true, false, 136, 589 )
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
						variantList:setLeftRight( true, false, -98.5, 239.5 )
						variantList:setAlpha( 0 )
						variantList:registerEventHandler( "transition_complete_keyframe", variantListFrame3 )
					end
				end
				
				variantList:completeAnimation()
				self.variantList:setLeftRight( true, false, 77, 415 )
				self.variantList:setTopBottom( true, false, 136, 589 )
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
				lockedVariantText:completeAnimation()
				self.lockedVariantText:setAlpha( 0 )
				self.clipFinished( lockedVariantText, {} )
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
				local f55_local8 = function ( f67_arg0, f67_arg1 )
					if not f67_arg1.interrupted then
						f67_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					f67_arg0:setAlpha( 1 )
					if f67_arg1.interrupted then
						self.clipFinished( f67_arg0, f67_arg1 )
					else
						f67_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tabList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				tabList:setAlpha( 0 )
				tabList:registerEventHandler( "transition_complete_keyframe", f55_local8 )
			end
		}
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ShowcaseWeapon.Mode" ), function ( model )
		local f68_local0 = self
		local f68_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "ShowcaseWeapon.Mode"
		}
		CoD.Menu.UpdateButtonShownState( f68_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( f8_local1, self, controller )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f69_local0 = nil
		CallCustomElementFunction_Self( self, "updateMode", Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_WEAPONLIST )
		SetPerControllerTableProperty( controller, "isShowcaseWeaponMenu", true )
		if not f69_local0 then
			f69_local0 = element:dispatchEventToChildren( event )
		end
		return f69_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f70_local0 = nil
		SendClientScriptMenuChangeNotify( controller, f8_local1, true )
		ShowHeaderKickerAndIcon( f8_local1 )
		if not f70_local0 then
			f70_local0 = element:dispatchEventToChildren( event )
		end
		return f70_local0
	end )
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f71_arg0, f71_arg1, f71_arg2, f71_arg3 )
		return true
	end, function ( f72_arg0, f72_arg1, f72_arg2 )
		CoD.Menu.SetButtonLabel( f72_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f73_arg0, f73_arg1, f73_arg2, f73_arg3 )
		if IsModelValueEqualTo( f73_arg2, "ShowcaseWeapon.Mode", Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_WEAPONLIST ) then
			SendClientScriptNotifyForAdjustedClient( f73_arg2, "CustomClass_closed", "" )
			SendClientScriptMenuChangeNotify( f73_arg2, f73_arg1, false )
			SetPerControllerTableProperty( f73_arg2, "isShowcaseWeaponMenu", false )
			GoBack( self, f73_arg2 )
			PlaySoundSetSound( self, "menu_no_selection" )
			return true
		else
			CallCustomElementFunction_Self( self, "updateMode", Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_WEAPONLIST )
			return true
		end
	end, function ( f74_arg0, f74_arg1, f74_arg2 )
		CoD.Menu.SetButtonLabel( f74_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3 )
		return true
	end, function ( f76_arg0, f76_arg1, f76_arg2 )
		CoD.Menu.SetButtonLabel( f76_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
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
		menu = f8_local1
	} )
	if not self:restoreState() then
		self.weaponList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.selectionInfoWidget:close()
		element.weaponList:close()
		element.variantList:close()
		element.attachmentList:close()
		element.lockedVariantText:close()
		element.ElemsSideList:close()
		element.MenuFrame:close()
		element.tabList:close()
		element.verticalCounter0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseShowcaseWeapon.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

