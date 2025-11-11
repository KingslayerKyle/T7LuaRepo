require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.cac_CustomClassDecscription" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponVariantIcon" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithSlotsFull" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantSelector" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithWeaponList" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

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
	local weaponCategoryWidget = self.tabList.Tabs.grid:getItemAtPosition( 1, lastIndex, false )
	if weaponCategoryWidget then
		self.tabList.Tabs.grid:setActiveItem( weaponCategoryWidget )
	end
end

local PostLoadFunc = function ( self, controller )
	self.disableDarkenElement = true
	self.disableBlur = true
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
	CoD.SetCustomization( controller, customizationType, "type" )
	self.updateMode = function ( self, mode, element )
		SetGunsmithModeValue( controller, mode )
		if mode == Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST then
			self.tabList.Tabs.m_disableNavigation = false
			SetFocusOnLastSelectedWeaponCategory( self, controller )
			CoD.SwapFocusableElements( controller, self.variantSelector, self.weaponList )
			SetFocusOnLastSelectedWeapon( self, controller )
			self:setState( "DefaultState" )
		elseif mode == Enum.GunsmithMode.GUNSMITHMODE_VARIANTS then
			self.tabList.Tabs.m_disableNavigation = true
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
	Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.UpdateDataSource" )
end

LUI.createMenu.Gunsmith = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Gunsmith" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackTransition = LUI.UIImage.new()
	BlackTransition:setLeftRight( 0, 1, 0, 0 )
	BlackTransition:setTopBottom( 0, 1, 0, 0 )
	BlackTransition:setRGB( 0, 0, 0 )
	BlackTransition:setAlpha( 0 )
	self:addElement( BlackTransition )
	self.BlackTransition = BlackTransition
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 552 )
	LeftPanel:setTopBottom( 0, 1, 117, -79 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local TabBacking = LUI.UIImage.new()
	TabBacking:setLeftRight( 0, 1, 0, 0 )
	TabBacking:setTopBottom( 0, 0, 186, 124 )
	TabBacking:setRGB( 0, 0, 0 )
	self:addElement( TabBacking )
	self.TabBacking = TabBacking
	
	local weaponList = LUI.UIList.new( self, controller, 10, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( 0, 0, 115, 535 )
	weaponList:setTopBottom( 0, 0, 208.5, 947.5 )
	weaponList:setWidgetType( CoD.GunsmithWeaponList )
	weaponList:setVerticalCount( 7 )
	weaponList:setSpacing( 10 )
	weaponList:setDataSource( "CraftWeaponList" )
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
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			Gunsmith_BrowseVariants( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	local weaponAttributes = CoD.WeaponAttributes.new( self, controller )
	weaponAttributes:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	weaponAttributes:setLeftRight( 0, 0, 674, 1316 )
	weaponAttributes:setTopBottom( 1, 1, -250, -94 )
	self:addElement( weaponAttributes )
	self.weaponAttributes = weaponAttributes
	
	local variantSelector = CoD.GunsmithVariantSelector.new( self, controller )
	variantSelector:setLeftRight( 0, 0, 108, 642 )
	variantSelector:setTopBottom( 0, 0, 193, 982 )
	variantSelector:setAlpha( 0 )
	self:addElement( variantSelector )
	self.variantSelector = variantSelector
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 1, 129, -25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 1, -16, 20 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( 0, 1, -13, 7 )
	TitleBacking0:setTopBottom( 0, 0, -1, 128 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local itemName = CoD.InfoPaneItemName.new( self, controller )
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
	itemName:setLeftRight( 0, 0, 582, 1154 )
	itemName:setTopBottom( 0, 0, 205.5, 256.5 )
	itemName:linkToElementModel( self, nil, false, function ( model )
		itemName:setModel( model, controller )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local attachmentList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	attachmentList:makeFocusable()
	attachmentList:setLeftRight( 0, 0, 679, 1127 )
	attachmentList:setTopBottom( 0, 0, 274, 322 )
	attachmentList:setAlpha( 0 )
	attachmentList:setWidgetType( CoD.WeaponVariantIcon )
	attachmentList:setHorizontalCount( 9 )
	self:addElement( attachmentList )
	self.attachmentList = attachmentList
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 1, -16, 20 )
	CategoryListLine0:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_GUNSMITH" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_GUNSMITH_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
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
	tabList:setLeftRight( 0, 1, 0, 1824 )
	tabList:setTopBottom( 0, 0, 128, 180 )
	tabList.Tabs.grid:setHorizontalCount( 8 )
	tabList.Tabs.grid:setDataSource( "GunsmithWeaponTabType" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		Gunsmith_TabChanged( self, element, controller )
		return retVal
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local slotsTracker = CoD.GunsmithSlotsFull.new( self, controller )
	slotsTracker:mergeStateConditions( {
		{
			stateName = "SlotsFull",
			condition = function ( menu, element, event )
				return CraftSlotsFullByStorageType( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
			end
		}
	} )
	slotsTracker:setLeftRight( 0, 0, 674, 851 )
	slotsTracker:setTopBottom( 0, 0, 891, 972 )
	slotsTracker:setAlpha( 0 )
	slotsTracker:subscribeToGlobalModel( controller, "PerController", "Gunsmith.UpdateDataSource", function ( model )
		local element = slotsTracker
		UpdateSelfElementState( self, element, controller )
	end )
	self:addElement( slotsTracker )
	self.slotsTracker = slotsTracker
	
	local weaponDescription = CoD.cac_CustomClassDecscription.new( self, controller )
	weaponDescription:setLeftRight( 0, 0, 582, 1120 )
	weaponDescription:setTopBottom( 0, 0, 274.5, 307.5 )
	self:addElement( weaponDescription )
	self.weaponDescription = weaponDescription
	
	local categoryName = LUI.UIText.new()
	categoryName:setLeftRight( 0, 0, 582, 966 )
	categoryName:setTopBottom( 0, 0, 172, 200 )
	categoryName:setRGB( 0.97, 0.32, 0.05 )
	categoryName:setAlpha( 0 )
	categoryName:setText( LocalizeToUpperString( "MENU_VARIANT" ) )
	categoryName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	categoryName:setLetterSpacing( 1 )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( 1, 1, -1230, 0 )
	XCamMouseControl:setTopBottom( 0, 1, 341, -109 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local weaponVerticalCounter = CoD.verticalCounter.new( self, controller )
	weaponVerticalCounter:setLeftRight( 0, 0, 174, 474 )
	weaponVerticalCounter:setTopBottom( 0, 0, 960, 998 )
	weaponVerticalCounter:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetAsListVerticalCounter( self, element, "weaponList" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( weaponVerticalCounter )
	self.weaponVerticalCounter = weaponVerticalCounter
	
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
	weaponDescription:linkToElementModel( weaponList, nil, false, function ( model )
		weaponDescription:setModel( model, controller )
	end )
	weaponDescription:linkToElementModel( weaponList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponDescription.weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	weaponList.navigation = {
		right = variantSelector,
		down = variantSelector
	}
	variantSelector.navigation = {
		left = weaponList,
		up = weaponList,
		right = attachmentList,
		down = weaponVerticalCounter
	}
	attachmentList.navigation = {
		left = variantSelector
	}
	weaponVerticalCounter.navigation = {
		up = variantSelector,
		right = variantSelector
	}
	self.resetProperties = function ()
		itemName:completeAnimation()
		weaponAttributes:completeAnimation()
		slotsTracker:completeAnimation()
		weaponDescription:completeAnimation()
		tabList:completeAnimation()
		weaponList:completeAnimation()
		variantSelector:completeAnimation()
		TabBacking:completeAnimation()
		LeftPanel:completeAnimation()
		categoryName:completeAnimation()
		weaponVerticalCounter:completeAnimation()
		BlackTransition:completeAnimation()
		attachmentList:completeAnimation()
		itemName:setLeftRight( 0, 0, 582, 1154 )
		itemName:setTopBottom( 0, 0, 205.5, 256.5 )
		itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
		weaponAttributes:setLeftRight( 0, 0, 674, 1316 )
		weaponAttributes:setTopBottom( 1, 1, -250, -94 )
		slotsTracker:setLeftRight( 0, 0, 674, 851 )
		slotsTracker:setTopBottom( 0, 0, 891, 972 )
		slotsTracker:setAlpha( 0 )
		weaponDescription:setLeftRight( 0, 0, 582, 1120 )
		weaponDescription:setTopBottom( 0, 0, 274.5, 307.5 )
		weaponDescription:setRGB( 1, 1, 1 )
		weaponDescription:setAlpha( 1 )
		tabList:setAlpha( 1 )
		weaponList:setAlpha( 1 )
		variantSelector:setLeftRight( 0, 0, 108, 642 )
		variantSelector:setTopBottom( 0, 0, 193, 982 )
		variantSelector:setAlpha( 0 )
		TabBacking:setAlpha( 1 )
		LeftPanel:setLeftRight( 0, 0, 96, 552 )
		LeftPanel:setTopBottom( 0, 1, 117, -79 )
		categoryName:setLeftRight( 0, 0, 582, 966 )
		categoryName:setTopBottom( 0, 0, 172, 200 )
		categoryName:setAlpha( 0 )
		weaponVerticalCounter:setAlpha( 1 )
		BlackTransition:setAlpha( 0 )
		attachmentList:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				weaponAttributes:completeAnimation()
				self.weaponAttributes:setLeftRight( 0, 0, 581, 1223 )
				self.weaponAttributes:setTopBottom( 1, 1, -250, -94 )
				self.clipFinished( weaponAttributes, {} )
				itemName:completeAnimation()
				self.itemName:setLeftRight( 0, 0, 581, 1153 )
				self.itemName:setTopBottom( 0, 0, 205.5, 256.5 )
				self.clipFinished( itemName, {} )
				slotsTracker:completeAnimation()
				self.slotsTracker:setLeftRight( 0, 0, 582, 759 )
				self.slotsTracker:setTopBottom( 0, 0, 890, 971 )
				self.clipFinished( slotsTracker, {} )
				weaponDescription:completeAnimation()
				self.weaponDescription:setLeftRight( 0, 0, 581, 1119 )
				self.weaponDescription:setTopBottom( 0, 0, 274.5, 307.5 )
				self.clipFinished( weaponDescription, {} )
			end,
			ShowVariants = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( 0, 0, 96, 642 )
					LeftPanel:setTopBottom( 0, 1, 128, -80 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 552 )
				self.LeftPanel:setTopBottom( 0, 1, 128, -80 )
				LeftPanelFrame2( LeftPanel, {} )
				local TabBackingFrame2 = function ( TabBacking, event )
					if not event.interrupted then
						TabBacking:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
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
						weaponList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
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
						weaponAttributes:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					weaponAttributes:setLeftRight( 0, 0, 673, 1315 )
					weaponAttributes:setTopBottom( 1, 1, -250, -94 )
					if event.interrupted then
						self.clipFinished( weaponAttributes, event )
					else
						weaponAttributes:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponAttributes:completeAnimation()
				self.weaponAttributes:setLeftRight( 0, 0, 582, 1224 )
				self.weaponAttributes:setTopBottom( 1, 1, -250, -94 )
				weaponAttributesFrame2( weaponAttributes, {} )
				local variantSelectorFrame2 = function ( variantSelector, event )
					if not event.interrupted then
						variantSelector:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					variantSelector:setLeftRight( 0, 0, 116, 624 )
					variantSelector:setTopBottom( 0, 0, 193.5, 933.5 )
					variantSelector:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( variantSelector, event )
					else
						variantSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				variantSelector:completeAnimation()
				self.variantSelector:setLeftRight( 0, 0, -471, 5 )
				self.variantSelector:setTopBottom( 0, 0, 193.5, 933.5 )
				self.variantSelector:setAlpha( 0 )
				variantSelectorFrame2( variantSelector, {} )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
						itemName.weaponNameWithVariant.variantName:beginAnimation( "subkeyframe", 200, false, true, CoD.TweenType.Linear )
					end
					itemName:setLeftRight( 0, 0, 673, 1245 )
					itemName:setTopBottom( 0, 0, 205.5, 256.5 )
					itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( 0, 0, 582, 1154 )
				self.itemName:setTopBottom( 0, 0, 205.5, 256.5 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				itemNameFrame2( itemName, {} )
				local tabListFrame2 = function ( tabList, event )
					if not event.interrupted then
						tabList:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
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
				local slotsTrackerFrame2 = function ( slotsTracker, event )
					if not event.interrupted then
						slotsTracker:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					slotsTracker:setLeftRight( 0, 0, 675.5, 851.5 )
					slotsTracker:setTopBottom( 0, 0, 891, 972 )
					slotsTracker:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( slotsTracker, event )
					else
						slotsTracker:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				slotsTracker:completeAnimation()
				self.slotsTracker:setLeftRight( 0, 0, 582, 759 )
				self.slotsTracker:setTopBottom( 0, 0, 890, 971 )
				self.slotsTracker:setAlpha( 0 )
				slotsTrackerFrame2( slotsTracker, {} )
				local weaponDescriptionFrame2 = function ( weaponDescription, event )
					if not event.interrupted then
						weaponDescription:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
					end
					weaponDescription:setLeftRight( 0, 0, 628, 1166 )
					weaponDescription:setTopBottom( 0, 0, 274.5, 307.5 )
					weaponDescription:setRGB( 1, 1, 1 )
					weaponDescription:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weaponDescription, event )
					else
						weaponDescription:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponDescription:completeAnimation()
				self.weaponDescription:setLeftRight( 0, 0, 582, 1120 )
				self.weaponDescription:setTopBottom( 0, 0, 274.5, 307.5 )
				self.weaponDescription:setRGB( 1, 1, 1 )
				self.weaponDescription:setAlpha( 1 )
				weaponDescriptionFrame2( weaponDescription, {} )
				local categoryNameFrame2 = function ( categoryName, event )
					local categoryNameFrame3 = function ( categoryName, event )
						if not event.interrupted then
							categoryName:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						end
						categoryName:setLeftRight( 0, 0, 674.5, 1059.5 )
						categoryName:setTopBottom( 0, 0, 172, 200 )
						categoryName:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( categoryName, event )
						else
							categoryName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						categoryNameFrame3( categoryName, event )
						return 
					else
						categoryName:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						categoryName:setLeftRight( 0, 0, 628.25, 1012.75 )
						categoryName:registerEventHandler( "transition_complete_keyframe", categoryNameFrame3 )
					end
				end
				
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( 0, 0, 582, 966 )
				self.categoryName:setTopBottom( 0, 0, 172, 200 )
				self.categoryName:setAlpha( 0 )
				categoryNameFrame2( categoryName, {} )
				local weaponVerticalCounterFrame2 = function ( weaponVerticalCounter, event )
					if not event.interrupted then
						weaponVerticalCounter:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					weaponVerticalCounter:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weaponVerticalCounter, event )
					else
						weaponVerticalCounter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponVerticalCounter:completeAnimation()
				self.weaponVerticalCounter:setAlpha( 1 )
				weaponVerticalCounterFrame2( weaponVerticalCounter, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local BlackTransitionFrame2 = function ( BlackTransition, event )
					local BlackTransitionFrame3 = function ( BlackTransition, event )
						if not event.interrupted then
							BlackTransition:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						end
						BlackTransition:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BlackTransition, event )
						else
							BlackTransition:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackTransitionFrame3( BlackTransition, event )
						return 
					else
						BlackTransition:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						BlackTransition:registerEventHandler( "transition_complete_keyframe", BlackTransitionFrame3 )
					end
				end
				
				BlackTransition:completeAnimation()
				self.BlackTransition:setAlpha( 1 )
				BlackTransitionFrame2( BlackTransition, {} )
				weaponAttributes:completeAnimation()
				self.weaponAttributes:setLeftRight( 0, 0, 581, 1223 )
				self.weaponAttributes:setTopBottom( 1, 1, -250, -94 )
				self.clipFinished( weaponAttributes, {} )
				itemName:completeAnimation()
				self.itemName:setLeftRight( 0, 0, 581, 1153 )
				self.itemName:setTopBottom( 0, 0, 205.5, 256.5 )
				self.clipFinished( itemName, {} )
				slotsTracker:completeAnimation()
				self.slotsTracker:setLeftRight( 0, 0, 582, 759 )
				self.slotsTracker:setTopBottom( 0, 0, 890, 971 )
				self.clipFinished( slotsTracker, {} )
				weaponDescription:completeAnimation()
				self.weaponDescription:setLeftRight( 0, 0, 581, 1119 )
				self.weaponDescription:setTopBottom( 0, 0, 274.5, 307.5 )
				self.clipFinished( weaponDescription, {} )
			end
		},
		ShowVariants = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 642 )
				self.LeftPanel:setTopBottom( 0, 1, 117, -79 )
				self.clipFinished( LeftPanel, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				self.clipFinished( weaponList, {} )
				variantSelector:completeAnimation()
				self.variantSelector:setLeftRight( 0, 0, 116, 624 )
				self.variantSelector:setTopBottom( 0, 0, 193.5, 933.5 )
				self.variantSelector:setAlpha( 1 )
				self.clipFinished( variantSelector, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( 0, 0, 674, 1246 )
				self.itemName:setTopBottom( 0, 0, 205.5, 256.5 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				attachmentList:completeAnimation()
				self.attachmentList:setAlpha( 1 )
				self.clipFinished( attachmentList, {} )
				slotsTracker:completeAnimation()
				self.slotsTracker:setAlpha( 1 )
				self.clipFinished( slotsTracker, {} )
				weaponDescription:completeAnimation()
				self.weaponDescription:setAlpha( 0 )
				self.clipFinished( weaponDescription, {} )
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( 0, 0, 674, 1058 )
				self.categoryName:setTopBottom( 0, 0, 172, 200 )
				self.categoryName:setAlpha( 1 )
				self.clipFinished( categoryName, {} )
				weaponVerticalCounter:completeAnimation()
				self.weaponVerticalCounter:setAlpha( 0 )
				self.clipFinished( weaponVerticalCounter, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( 0, 0, 96, 552 )
					LeftPanel:setTopBottom( 0, 1, 117, -79 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 642 )
				self.LeftPanel:setTopBottom( 0, 1, 117, -79 )
				LeftPanelFrame2( LeftPanel, {} )
				local TabBackingFrame2 = function ( TabBacking, event )
					if not event.interrupted then
						TabBacking:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
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
						weaponList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
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
						weaponAttributes:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					weaponAttributes:setLeftRight( 0, 0, 582, 1224 )
					weaponAttributes:setTopBottom( 1, 1, -250, -94 )
					if event.interrupted then
						self.clipFinished( weaponAttributes, event )
					else
						weaponAttributes:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponAttributes:completeAnimation()
				self.weaponAttributes:setLeftRight( 0, 0, 663, 1305 )
				self.weaponAttributes:setTopBottom( 1, 1, -250, -94 )
				weaponAttributesFrame2( weaponAttributes, {} )
				local variantSelectorFrame2 = function ( variantSelector, event )
					if not event.interrupted then
						variantSelector:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					variantSelector:setLeftRight( 0, 0, -470, 6 )
					variantSelector:setTopBottom( 0, 0, 193.5, 933.5 )
					variantSelector:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( variantSelector, event )
					else
						variantSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				variantSelector:completeAnimation()
				self.variantSelector:setLeftRight( 0, 0, 116, 624 )
				self.variantSelector:setTopBottom( 0, 0, 193.5, 933.5 )
				self.variantSelector:setAlpha( 1 )
				variantSelectorFrame2( variantSelector, {} )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
						itemName.weaponNameWithVariant.variantName:beginAnimation( "subkeyframe", 200, false, true, CoD.TweenType.Linear )
					end
					itemName:setLeftRight( 0, 0, 582, 1154 )
					itemName:setTopBottom( 0, 0, 205.5, 256.5 )
					itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( 0, 0, 674, 1246 )
				self.itemName:setTopBottom( 0, 0, 205.5, 256.5 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				itemNameFrame2( itemName, {} )
				local attachmentListFrame2 = function ( attachmentList, event )
					if not event.interrupted then
						attachmentList:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
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
				local tabListFrame2 = function ( tabList, event )
					if not event.interrupted then
						tabList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
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
				local slotsTrackerFrame2 = function ( slotsTracker, event )
					local slotsTrackerFrame3 = function ( slotsTracker, event )
						if not event.interrupted then
							slotsTracker:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						end
						slotsTracker:setLeftRight( 0, 0, 582, 759 )
						slotsTracker:setTopBottom( 0, 0, 890, 971 )
						slotsTracker:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( slotsTracker, event )
						else
							slotsTracker:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						slotsTrackerFrame3( slotsTracker, event )
						return 
					else
						slotsTracker:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						slotsTracker:setLeftRight( 0, 0, 628, 805 )
						slotsTracker:setTopBottom( 0, 0, 890.5, 971.5 )
						slotsTracker:setAlpha( 0 )
						slotsTracker:registerEventHandler( "transition_complete_keyframe", slotsTrackerFrame3 )
					end
				end
				
				slotsTracker:completeAnimation()
				self.slotsTracker:setLeftRight( 0, 0, 674, 851 )
				self.slotsTracker:setTopBottom( 0, 0, 891, 972 )
				self.slotsTracker:setAlpha( 1 )
				slotsTrackerFrame2( slotsTracker, {} )
				local weaponDescriptionFrame2 = function ( weaponDescription, event )
					if not event.interrupted then
						weaponDescription:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					weaponDescription:setLeftRight( 0, 0, 581, 1059 )
					weaponDescription:setTopBottom( 0, 0, 274.5, 307.5 )
					weaponDescription:setRGB( 1, 1, 1 )
					weaponDescription:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weaponDescription, event )
					else
						weaponDescription:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponDescription:completeAnimation()
				self.weaponDescription:setLeftRight( 0, 0, 675, 1213 )
				self.weaponDescription:setTopBottom( 0, 0, 274.5, 307.5 )
				self.weaponDescription:setRGB( 1, 1, 1 )
				self.weaponDescription:setAlpha( 0 )
				weaponDescriptionFrame2( weaponDescription, {} )
				local categoryNameFrame2 = function ( categoryName, event )
					local categoryNameFrame3 = function ( categoryName, event )
						if not event.interrupted then
							categoryName:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						end
						categoryName:setLeftRight( 0, 0, 581.5, 954.5 )
						categoryName:setTopBottom( 0, 0, 172, 200 )
						categoryName:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( categoryName, event )
						else
							categoryName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						categoryNameFrame3( categoryName, event )
						return 
					else
						categoryName:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						categoryName:setLeftRight( 0, 0, 628, 1001 )
						categoryName:setAlpha( 0 )
						categoryName:registerEventHandler( "transition_complete_keyframe", categoryNameFrame3 )
					end
				end
				
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( 0, 0, 674.5, 1047.5 )
				self.categoryName:setTopBottom( 0, 0, 172, 200 )
				self.categoryName:setAlpha( 1 )
				categoryNameFrame2( categoryName, {} )
				local weaponVerticalCounterFrame2 = function ( weaponVerticalCounter, event )
					if not event.interrupted then
						weaponVerticalCounter:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					weaponVerticalCounter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weaponVerticalCounter, event )
					else
						weaponVerticalCounter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponVerticalCounter:completeAnimation()
				self.weaponVerticalCounter:setAlpha( 0 )
				weaponVerticalCounterFrame2( weaponVerticalCounter, {} )
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
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderIconOnly( self )
		SetElementStateByElementName( self, "MenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "MenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		SetHeadingKickerText( "MENU_GUNSMITH" )
		SetPerControllerTableProperty( controller, "editingWeaponBuildKits", nil )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST ) then
			SendClientScriptMenuChangeNotify( controller, menu, false )
			GoBack( self, controller )
			Gunsmith_Back( self, element, controller )
			ClearSavedState( self, controller )
			SendClientScriptNotifyForAdjustedClient( controller, "CustomClass_closed", "" )
			return true
		elseif IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_VARIANTS ) then
			Gunsmith_ChooseWeaponList( self, element, controller )
			PlaySoundSetSound( self, "menu_go_back" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		elseif IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_VARIANTS ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if AlwaysFalse() then
			UpdateState( self, event )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_GUNSMITH_VARIANT_OPTIONS", nil )
			return true
		else
			return false
		end
	end, false )
	weaponList.id = "weaponList"
	variantSelector.id = "variantSelector"
	attachmentList.id = "attachmentList"
	MenuFrame:setModel( self.buttonModel, controller )
	weaponVerticalCounter.id = "weaponVerticalCounter"
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
		self.weaponList:close()
		self.weaponAttributes:close()
		self.variantSelector:close()
		self.FEMenuLeftGraphics:close()
		self.itemName:close()
		self.attachmentList:close()
		self.MenuFrame:close()
		self.tabList:close()
		self.slotsTracker:close()
		self.weaponDescription:close()
		self.XCamMouseControl:close()
		self.weaponVerticalCounter:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Gunsmith.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

