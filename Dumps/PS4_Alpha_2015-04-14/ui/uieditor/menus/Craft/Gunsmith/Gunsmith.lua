require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithWeaponList" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantSelector" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.TabbedWidgets.craftTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListBoxes" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )

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
	local weaponWidget = self.weaponList:getItemAt( lastIndex )
	if weaponWidget then
		self.weaponList:setActiveItem( weaponWidget )
	end
end

local SetFocusOnLastSelectedWeaponCategory = function ( self, controller )
	local lastIndex = 2
	if CoD.perController[controller].gunsmithWeaponCategoryIndex ~= nil then
		lastIndex = CoD.perController[controller].gunsmithWeaponCategoryIndex
	end
	CoD.perController[controller].gunsmithWeaponCategoryRestored = true
	local weaponCategoryWidget = self.tabList.grid:getItemAt( lastIndex )
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

LUI.createMenu.Gunsmith = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Gunsmith" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 368 )
	LeftPanel:setTopBottom( true, false, 85, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local TabBacking = LUI.UIImage.new()
	TabBacking:setLeftRight( true, true, 0, 0 )
	TabBacking:setTopBottom( true, false, 123, 82 )
	TabBacking:setRGB( 0, 0, 0 )
	TabBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TabBacking )
	self.TabBacking = TabBacking
	
	local weaponList = LUI.UIList.new( self, controller, 7, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( true, false, 76.5, 356.5 )
	weaponList:setTopBottom( true, false, 137, 634 )
	weaponList:setRGB( 1, 1, 1 )
	weaponList:setDataSource( "Unlockables" )
	weaponList:setWidgetType( CoD.GunsmithWeaponList )
	weaponList:setVerticalCount( 7 )
	weaponList:setSpacing( 7 )
	weaponList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		Gunsmith_GainFocus( self, element, controller )
		return retVal
	end )
	weaponList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		Gunsmith_BrowseVariants( self, element, controller )
		return retVal
	end )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	local weaponAttributes = CoD.WeaponAttributes.new( self, controller )
	weaponAttributes:setLeftRight( true, false, 388, 816 )
	weaponAttributes:setTopBottom( false, true, -167, -63 )
	weaponAttributes:setRGB( 1, 1, 1 )
	weaponAttributes:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( weaponAttributes )
	self.weaponAttributes = weaponAttributes
	
	local variantSelector = CoD.GunsmithVariantSelector.new( self, controller )
	variantSelector:setLeftRight( true, false, -314, 3 )
	variantSelector:setTopBottom( true, false, 129, 655 )
	variantSelector:setRGB( 1, 1, 1 )
	variantSelector:setAlpha( 0 )
	self:addElement( variantSelector )
	self.variantSelector = variantSelector
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	TitleBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0:setRGB( 1, 1, 1 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_GUNSMITH" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local itemName = CoD.InfoPaneItemName.new( self, controller )
	itemName:setLeftRight( true, false, 388, 769 )
	itemName:setTopBottom( true, false, 137, 171 )
	itemName:setRGB( 1, 1, 1 )
	itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
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
	
	local tabList = CoD.craftTabList.new( self, controller )
	tabList:setLeftRight( true, false, 64, 1304 )
	tabList:setTopBottom( true, false, 84, 124 )
	tabList:setRGB( 1, 1, 1 )
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
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local weaponDescTextBox = LUI.UIText.new()
	weaponDescTextBox:setLeftRight( true, false, 393, 649 )
	weaponDescTextBox:setTopBottom( true, false, 182, 201 )
	weaponDescTextBox:setRGB( 1, 1, 1 )
	weaponDescTextBox:setAlpha( 0.7 )
	weaponDescTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( weaponDescTextBox )
	self.weaponDescTextBox = weaponDescTextBox
	
	local cacElemsSideListBoxes0 = CoD.cac_ElemsSideListBoxes.new( self, controller )
	cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
	cacElemsSideListBoxes0:setTopBottom( true, false, -12, 658 )
	cacElemsSideListBoxes0:setRGB( 1, 1, 1 )
	cacElemsSideListBoxes0:setAlpha( 0 )
	self:addElement( cacElemsSideListBoxes0 )
	self.cacElemsSideListBoxes0 = cacElemsSideListBoxes0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 4.13, 72 )
	ElemsSideList:setTopBottom( true, false, -11, 659 )
	ElemsSideList:setRGB( 1, 1, 1 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
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
	weaponDescTextBox:linkToElementModel( weaponList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	weaponList.navigation = {
		left = variantSelector
	}
	variantSelector.navigation = {
		right = weaponList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
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
				weaponAttributes:completeAnimation()
				self.weaponAttributes:setLeftRight( true, false, 387.5, 815.5 )
				self.weaponAttributes:setTopBottom( false, true, -167, -63 )
				self.weaponAttributes:setAlpha( 1 )
				self.clipFinished( weaponAttributes, {} )
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
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setLeftRight( true, false, 392.5, 648.5 )
				self.weaponDescTextBox:setTopBottom( true, false, 182, 201 )
				self.weaponDescTextBox:setAlpha( 0.7 )
				self.clipFinished( weaponDescTextBox, {} )
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
			end,
			ShowVariants = function ()
				self:setupElementClipCounter( 9 )
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
				local weaponAttributesFrame2 = function ( weaponAttributes, event )
					if not event.interrupted then
						weaponAttributes:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					weaponAttributes:setLeftRight( true, false, 449, 877 )
					weaponAttributes:setTopBottom( false, true, -167, -63 )
					if event.interrupted then
						self.clipFinished( weaponAttributes, event )
					else
						weaponAttributes:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponAttributes:completeAnimation()
				self.weaponAttributes:setLeftRight( true, false, 388, 816 )
				self.weaponAttributes:setTopBottom( false, true, -167, -63 )
				weaponAttributesFrame2( weaponAttributes, {} )
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
				local weaponDescTextBoxFrame2 = function ( weaponDescTextBox, event )
					if not event.interrupted then
						weaponDescTextBox:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					weaponDescTextBox:setLeftRight( true, false, 451, 707 )
					weaponDescTextBox:setTopBottom( true, false, 182, 201 )
					if event.interrupted then
						self.clipFinished( weaponDescTextBox, event )
					else
						weaponDescTextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setLeftRight( true, false, 393, 649 )
				self.weaponDescTextBox:setTopBottom( true, false, 182, 201 )
				weaponDescTextBoxFrame2( weaponDescTextBox, {} )
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
				self:setupElementClipCounter( 8 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
				self.clipFinished( LeftPanel, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				self.clipFinished( weaponList, {} )
				weaponAttributes:completeAnimation()
				self.weaponAttributes:setLeftRight( true, false, 449.5, 877.5 )
				self.weaponAttributes:setTopBottom( false, true, -167, -63 )
				self.clipFinished( weaponAttributes, {} )
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
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setLeftRight( true, false, 451.5, 710.5 )
				self.weaponDescTextBox:setTopBottom( true, false, 182, 201 )
				self.clipFinished( weaponDescTextBox, {} )
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
				self:setupElementClipCounter( 10 )
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
				local weaponAttributesFrame2 = function ( weaponAttributes, event )
					if not event.interrupted then
						weaponAttributes:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
					end
					weaponAttributes:setLeftRight( true, false, 388, 816 )
					weaponAttributes:setTopBottom( false, true, -167, -63 )
					if event.interrupted then
						self.clipFinished( weaponAttributes, event )
					else
						weaponAttributes:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponAttributes:completeAnimation()
				self.weaponAttributes:setLeftRight( true, false, 442, 870 )
				self.weaponAttributes:setTopBottom( false, true, -167, -63 )
				weaponAttributesFrame2( weaponAttributes, {} )
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
				local weaponDescTextBoxFrame2 = function ( weaponDescTextBox, event )
					if not event.interrupted then
						weaponDescTextBox:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Linear )
					end
					weaponDescTextBox:setLeftRight( true, false, 390, 649 )
					weaponDescTextBox:setTopBottom( true, false, 182, 201 )
					if event.interrupted then
						self.clipFinished( weaponDescTextBox, event )
					else
						weaponDescTextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setLeftRight( true, false, 444, 700 )
				self.weaponDescTextBox:setTopBottom( true, false, 182, 201 )
				weaponDescTextBoxFrame2( weaponDescTextBox, {} )
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
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		if IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST ) then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE", element )
			return true
		elseif IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_VARIANTS ) then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE", element )
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Gunsmith.Mode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Gunsmith.Mode"
		}
		if not element.buttonPromptAddFunctions.secondary( self, element, event ) then
			self:removeButtonPrompt( "secondary", element )
		end
		if not element.buttonPromptAddFunctions.secondary( self, element, event ) then
			self:removeButtonPrompt( "secondary", element )
		end
	end )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			if IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST ) then
				GoBack( self, controller )
				Gunsmith_Back( self, element, controller )
				ClearSavedState( self, controller )
			elseif IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_VARIANTS ) then
				Gunsmith_ChooseWeaponList( self, element, controller )
				SendClientScriptNotify( controller, "CustomClass_closed", "" )
			end
		end
		if not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	weaponList.id = "weaponList"
	variantSelector.id = "variantSelector"
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
	self.close = function ( self )
		self.LeftPanel:close()
		self.weaponList:close()
		self.weaponAttributes:close()
		self.variantSelector:close()
		self.cac3dTitleIntermediary0:close()
		self.itemName:close()
		self.tabList:close()
		self.cacElemsSideListBoxes0:close()
		self.ElemsSideList:close()
		self.weaponDescTextBox:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

