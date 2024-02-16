require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsWeaponList" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantSelector" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.TabbedWidgets.craftTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponVariantIcon" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListBoxes" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes_Internal" )
require( "ui.uieditor.widgets.CAC.cac_WpnLvl" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsLockIcon" )

local GetGunsmithModeValue = function ( controller )
	local gunsmithMode = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.Mode" )
	local modeValue = Engine.GetModelValue( gunsmithMode )
	return modeValue
end

local SetGunsmithModeValue = function ( controller, value )
	local gunsmithMode = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.Mode" )
	Engine.SetModelValue( gunsmithMode, value )
end

local SetFocusOnLastSelectedWeapon = function ( self, controller )
	local lastIndex = 1
	if CoD.perController[controller].gunsmithWeaponListIndex ~= nil then
		lastIndex = CoD.perController[controller].gunsmithWeaponListIndex
	end
	local weaponWidget = self.weaponList:getItemAtPosition( lastIndex, 1, false )
	if weaponWidget then
		self.weaponList:setActiveItem( weaponWidget )
	end
end

local SetFocusOnLastSelectedWeaponCategory = function ( self, controller )
	local lastIndex = 2
	local category_index = CoD.GetCustomization( controller, "category_index" )
	if category_index ~= nil then
		lastIndex = category_index
	end
	CoD.perController[controller].gunsmithWeaponCategoryRestored = true
	local weaponCategoryWidget = self.tabList.grid:getItemAtPosition( 1, lastIndex, false )
	if weaponCategoryWidget then
		self.tabList.grid:setActiveItem( weaponCategoryWidget )
	end
end

local PostLoadFunc = function ( self, controller )
	self.disableDarkenElement = true
	self.disableBlur = true
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
	CoD.SetCustomization( controller, customizationType, "type" )
	self:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE" )
	self.updateMode = function ( self, mode, element )
		SetGunsmithModeValue( controller, mode )
		if mode == Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST then
			self.tabList.m_disableNavigation = false
			SetFocusOnLastSelectedWeaponCategory( self, controller )
			CoD.SwapFocusableElements( controller, self.variantSelector, self.weaponList )
			SetFocusOnLastSelectedWeapon( self, controller )
			self:setState( "DefaultState" )
		elseif mode == Enum.GunsmithMode.GUNSMITHMODE_VARIANTS then
			self.tabList.m_disableNavigation = true
			CoD.SwapFocusableElements( controller, self.weaponList, self.variantSelector )
			self:setState( "ShowVariants" )
		end
	end
	
	local modeValue = GetGunsmithModeValue( controller )
	self:updateMode( modeValue )
end

local PreLoadFunc = function ( self, controller )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
	CoD.SetCustomization( controller, customizationType, "type" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.updateVariantList" )
end

LUI.createMenu.WeaponBuildKits = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WeaponBuildKits" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponBuildKits.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, 64, 368 )
	LeftPanel:setTopBottom( true, false, 85, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local TabBacking = LUI.UIImage.new()
	TabBacking:setLeftRight( true, true, 0, 0 )
	TabBacking:setTopBottom( true, false, 123, 82 )
	TabBacking:setRGB( 0, 0, 0 )
	self:addElement( TabBacking )
	self.TabBacking = TabBacking
	
	local weaponList = LUI.UIList.new( menu, controller, 7, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( true, false, 76.5, 356.5 )
	weaponList:setTopBottom( true, false, 137, 634 )
	weaponList:setDataSource( "Unlockables" )
	weaponList:setWidgetType( CoD.WeaponBuildKitsWeaponList )
	weaponList:setVerticalCount( 7 )
	weaponList:setSpacing( 7 )
	weaponList:linkToElementModel( "itemIndex", true, function ( model )
		local element = weaponList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	weaponList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		FocusWeaponBuildKit( self, element, controller )
		return retVal
	end )
	weaponList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( weaponList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsCACItemLocked( menu, element, controller ) then
			SelectWeaponBuildKit( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsCACItemLocked( menu, element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	local variantSelector = CoD.GunsmithVariantSelector.new( menu, controller )
	variantSelector:setLeftRight( true, false, -314, 3 )
	variantSelector:setTopBottom( true, false, 129, 655 )
	variantSelector:setAlpha( 0 )
	self:addElement( variantSelector )
	self.variantSelector = variantSelector
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( menu, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local itemName = CoD.InfoPaneItemName.new( menu, controller )
	itemName:setLeftRight( true, false, 388, 769 )
	itemName:setTopBottom( true, false, 137, 171 )
	itemName:linkToElementModel( self, nil, false, function ( model )
		itemName:setModel( model, controller )
	end )
	itemName:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:addElement( itemName )
	self.itemName = itemName
	
	local tabList = CoD.craftTabList.new( menu, controller )
	tabList:setLeftRight( true, false, 64, 1304 )
	tabList:setTopBottom( true, false, 84, 124 )
	tabList.grid:setDataSource( "GunsmithWeaponTabType" )
	tabList.grid:setWidgetType( CoD.paintshopTabWidget )
	tabList.grid:setHorizontalCount( 8 )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		Gunsmith_TabChanged( self, element, controller )
		return retVal
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local attachmentList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	attachmentList:makeFocusable()
	attachmentList:setLeftRight( true, false, 388, 692 )
	attachmentList:setTopBottom( false, true, -210, -178 )
	attachmentList:setWidgetType( CoD.WeaponVariantIcon )
	attachmentList:setHorizontalCount( 9 )
	self:addElement( attachmentList )
	self.attachmentList = attachmentList
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local cacElemsSideListBoxes0 = CoD.cac_ElemsSideListBoxes.new( menu, controller )
	cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
	cacElemsSideListBoxes0:setTopBottom( true, false, -12, 658 )
	cacElemsSideListBoxes0:setAlpha( 0 )
	self:addElement( cacElemsSideListBoxes0 )
	self.cacElemsSideListBoxes0 = cacElemsSideListBoxes0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( menu, controller )
	ElemsSideList:setLeftRight( true, false, 4.13, 72 )
	ElemsSideList:setTopBottom( true, false, -11, 659 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local WeaponAttributes = CoD.WeaponAttributes_Internal.new( menu, controller )
	WeaponAttributes:setLeftRight( true, false, 388, 760 )
	WeaponAttributes:setTopBottom( false, true, -167, -83 )
	self:addElement( WeaponAttributes )
	self.WeaponAttributes = WeaponAttributes
	
	local cacWpnLvl0 = CoD.cac_WpnLvl.new( menu, controller )
	cacWpnLvl0:setLeftRight( true, false, 780, 1195 )
	cacWpnLvl0:setTopBottom( false, true, -123, -83 )
	cacWpnLvl0.levelLabel.Label1:setText( Engine.Localize( "LEVEL" ) )
	cacWpnLvl0.levelLabel.Label1:setTTF( "fonts/escom.ttf" )
	self:addElement( cacWpnLvl0 )
	self.cacWpnLvl0 = cacWpnLvl0
	
	local highlightedDescription = LUI.UIText.new()
	highlightedDescription:setLeftRight( false, false, -252, 122 )
	highlightedDescription:setTopBottom( false, false, -177, -155 )
	highlightedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription:setLineSpacing( 0.5 )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highlightedDescription )
	self.highlightedDescription = highlightedDescription
	
	local LockIcon = CoD.WeaponBuildKitsLockIcon.new( menu, controller )
	LockIcon:setLeftRight( true, false, 732, 828 )
	LockIcon:setTopBottom( true, false, 14, 684 )
	LockIcon:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller )
			end
		}
	} )
	LockIcon:linkToElementModel( "itemIndex", true, function ( model )
		menu:updateElementState( LockIcon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	itemName:linkToElementModel( weaponList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	itemName:linkToElementModel( variantSelector.variantList, "variantNameBig", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	attachmentList:linkToElementModel( variantSelector.variantList, "listDataSource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachmentList:setDataSource( modelValue )
		end
	end )
	WeaponAttributes:linkToElementModel( weaponList, "weaponAttributes", false, function ( model )
		WeaponAttributes:setModel( model, controller )
	end )
	cacWpnLvl0:linkToElementModel( weaponList, nil, false, function ( model )
		cacWpnLvl0:setModel( model, controller )
	end )
	cacWpnLvl0:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacWpnLvl0.nextLevel:setText( Engine.Localize( GetNextWeaponLevel( controller, modelValue ) ) )
		end
	end )
	cacWpnLvl0:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacWpnLvl0.currentLevelBacking:setText( Engine.Localize( GetCurrentWeaponLevel( controller, modelValue ) ) )
		end
	end )
	cacWpnLvl0:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacWpnLvl0.currentLevel:setText( Engine.Localize( GetCurrentWeaponLevel( controller, modelValue ) ) )
		end
	end )
	cacWpnLvl0:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacWpnLvl0.cacWpnLvlMeter0.Meter:setShaderVector( 0, GetCurrentWeaponXP( controller, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) ) )
		end
	end )
	highlightedDescription:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			highlightedDescription:setText( Engine.Localize( GetUnlockDescription( controller, modelValue ) ) )
		end
	end )
	LockIcon:linkToElementModel( weaponList, nil, false, function ( model )
		LockIcon:setModel( model, controller )
	end )
	weaponList.navigation = {
		left = variantSelector,
		right = attachmentList
	}
	variantSelector.navigation = {
		right = weaponList
	}
	attachmentList.navigation = {
		left = weaponList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 368 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				TabBacking:completeAnimation()
				self.TabBacking:setAlpha( 1 )
				self.clipFinished( TabBacking, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 1 )
				self.clipFinished( weaponList, {} )
				variantSelector:completeAnimation()
				self.variantSelector:setAlpha( 0 )
				self.clipFinished( variantSelector, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 387.5, 768.5 )
				self.itemName:setTopBottom( true, false, 137, 171 )
				self.itemName:setAlpha( 1 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
				tabList:completeAnimation()
				self.tabList:setAlpha( 1 )
				self.clipFinished( tabList, {} )
				CategoryListLine0:completeAnimation()
				self.CategoryListLine0:setAlpha( 1 )
				self.clipFinished( CategoryListLine0, {} )
				cacElemsSideListBoxes0:completeAnimation()
				self.cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
				self.cacElemsSideListBoxes0:setTopBottom( true, false, -12, 658 )
				self.cacElemsSideListBoxes0:setAlpha( 0 )
				self.clipFinished( cacElemsSideListBoxes0, {} )
				ElemsSideList:completeAnimation()
				self.ElemsSideList:setLeftRight( true, false, 4.13, 72 )
				self.ElemsSideList:setTopBottom( true, false, -11, 659 )
				self.ElemsSideList:setAlpha( 1 )
				self.clipFinished( ElemsSideList, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )
			end,
			ShowVariants = function ()
				self:setupElementClipCounter( 7 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 428 )
					LeftPanel:setTopBottom( true, false, 85, 667 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 368 )
				self.LeftPanel:setTopBottom( true, false, 85, 667 )
				LeftPanelFrame2( LeftPanel, {} )
				local TabBackingFrame2 = function ( TabBacking, event )
					if not event.interrupted then
						TabBacking:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					TabBacking:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TabBacking, event )
					else
						TabBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabBacking:completeAnimation()
				self.TabBacking:setAlpha( 1 )
				TabBackingFrame2( TabBacking, {} )
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
				local variantSelectorFrame2 = function ( variantSelector, event )
					if not event.interrupted then
						variantSelector:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					variantSelector:setLeftRight( true, false, 72, 389 )
					variantSelector:setTopBottom( true, false, 129, 655 )
					variantSelector:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( variantSelector, event )
					else
						variantSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				variantSelector:completeAnimation()
				self.variantSelector:setLeftRight( true, false, -314, 3 )
				self.variantSelector:setTopBottom( true, false, 129, 655 )
				self.variantSelector:setAlpha( 0 )
				variantSelectorFrame2( variantSelector, {} )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						itemName.weaponNameWithVariant.variantName:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Linear )
					end
					itemName:setLeftRight( true, false, 449, 830 )
					itemName:setTopBottom( true, false, 137, 171 )
					itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 388, 769 )
				self.itemName:setTopBottom( true, false, 137, 171 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				itemNameFrame2( itemName, {} )
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
				local cacElemsSideListBoxes0Frame2 = function ( cacElemsSideListBoxes0, event )
					if not event.interrupted then
						cacElemsSideListBoxes0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					cacElemsSideListBoxes0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( cacElemsSideListBoxes0, event )
					else
						cacElemsSideListBoxes0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cacElemsSideListBoxes0:completeAnimation()
				self.cacElemsSideListBoxes0:setAlpha( 0 )
				cacElemsSideListBoxes0Frame2( cacElemsSideListBoxes0, {} )
			end
		},
		ShowVariants = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
				self.clipFinished( LeftPanel, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				self.clipFinished( weaponList, {} )
				variantSelector:completeAnimation()
				self.variantSelector:setLeftRight( true, false, 72, 309 )
				self.variantSelector:setTopBottom( true, false, 129, 655 )
				self.variantSelector:setAlpha( 1 )
				self.clipFinished( variantSelector, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 449.5, 830.5 )
				self.itemName:setTopBottom( true, false, 137, 171 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				cacElemsSideListBoxes0:completeAnimation()
				self.cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
				self.cacElemsSideListBoxes0:setTopBottom( true, false, -11, 659 )
				self.cacElemsSideListBoxes0:setAlpha( 1 )
				self.clipFinished( cacElemsSideListBoxes0, {} )
				ElemsSideList:completeAnimation()
				self.ElemsSideList:setLeftRight( true, false, 4.13, 72 )
				self.ElemsSideList:setTopBottom( true, false, -11, 659 )
				self.ElemsSideList:setAlpha( 0 )
				self.clipFinished( ElemsSideList, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 8 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 289, false, true, CoD.TweenType.Linear )
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
				local TabBackingFrame2 = function ( TabBacking, event )
					if not event.interrupted then
						TabBacking:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					TabBacking:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TabBacking, event )
					else
						TabBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabBacking:completeAnimation()
				self.TabBacking:setAlpha( 0 )
				TabBackingFrame2( TabBacking, {} )
				local weaponListFrame2 = function ( weaponList, event )
					if not event.interrupted then
						weaponList:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					weaponList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weaponList, event )
					else
						weaponList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				weaponListFrame2( weaponList, {} )
				local variantSelectorFrame2 = function ( variantSelector, event )
					if not event.interrupted then
						variantSelector:beginAnimation( "keyframe", 280, false, true, CoD.TweenType.Linear )
					end
					variantSelector:setLeftRight( true, false, -312.87, 4.13 )
					variantSelector:setTopBottom( true, false, 129, 620 )
					variantSelector:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( variantSelector, event )
					else
						variantSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				variantSelector:completeAnimation()
				self.variantSelector:setLeftRight( true, false, 72, 389 )
				self.variantSelector:setTopBottom( true, false, 127, 622 )
				self.variantSelector:setAlpha( 1 )
				variantSelectorFrame2( variantSelector, {} )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Linear )
						itemName.weaponNameWithVariant.variantName:beginAnimation( "subkeyframe", 250, true, true, CoD.TweenType.Linear )
					end
					itemName:setLeftRight( true, false, 388, 769 )
					itemName:setTopBottom( true, false, 137, 171 )
					itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 442, 823 )
				self.itemName:setTopBottom( true, false, 137, 171 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				itemNameFrame2( itemName, {} )
				local tabListFrame2 = function ( tabList, event )
					if not event.interrupted then
						tabList:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					tabList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( tabList, event )
					else
						tabList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tabList:completeAnimation()
				self.tabList:setAlpha( 0 )
				tabListFrame2( tabList, {} )
				local cacElemsSideListBoxes0Frame2 = function ( cacElemsSideListBoxes0, event )
					if not event.interrupted then
						cacElemsSideListBoxes0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					cacElemsSideListBoxes0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( cacElemsSideListBoxes0, event )
					else
						cacElemsSideListBoxes0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cacElemsSideListBoxes0:completeAnimation()
				self.cacElemsSideListBoxes0:setAlpha( 1 )
				cacElemsSideListBoxes0Frame2( cacElemsSideListBoxes0, {} )
				local ElemsSideListFrame2 = function ( ElemsSideList, event )
					if not event.interrupted then
						ElemsSideList:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
					end
					ElemsSideList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ElemsSideList, event )
					else
						ElemsSideList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ElemsSideList:completeAnimation()
				self.ElemsSideList:setAlpha( 0 )
				ElemsSideListFrame2( ElemsSideList, {} )
			end
		}
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Gunsmith.Mode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Gunsmith.Mode"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, menu, true )
		ShowHeaderKickerAndIcon( menu )
		SetElementStateByElementName( self, "cac3dTitleIntermediary0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "cac3dTitleIntermediary0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST ) then
			SendClientScriptMenuChangeNotify( controller, menu, false )
			GoBack( self, controller )
			Gunsmith_Back( self, element, controller )
			ClearSavedState( self, controller )
			return true
		elseif IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_VARIANTS ) then
			Gunsmith_ChooseWeaponList( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		if IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST ) then
			return true
		elseif IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_VARIANTS ) then
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	weaponList.id = "weaponList"
	variantSelector.id = "variantSelector"
	attachmentList.id = "attachmentList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.weaponList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.weaponList:close()
		self.variantSelector:close()
		self.cac3dTitleIntermediary0:close()
		self.itemName:close()
		self.tabList:close()
		self.attachmentList:close()
		self.cacElemsSideListBoxes0:close()
		self.ElemsSideList:close()
		self.WeaponAttributes:close()
		self.cacWpnLvl0:close()
		self.LockIcon:close()
		self.highlightedDescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WeaponBuildKits.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

