require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintjobSelector" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopSlotsFull" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopWeaponListButtonNew" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local GetPaintshopModeValue = function ( controller )
	local paintshopModeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.Mode" )
	local modeValue = Engine.GetModelValue( paintshopModeModel )
	return modeValue
end

local SetPaintshoModeValue = function ( controller, value )
	local paintshopModeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.Mode" )
	local modeValue = Engine.SetModelValue( paintshopModeModel, value )
	return modeValue
end

local SetFocusOnLastSelectedWeapon = function ( self, controller )
	local lastIndex = 1
	if CoD.perController[controller].paintshopWeaponListIndex ~= nil then
		lastIndex = CoD.perController[controller].paintshopWeaponListIndex
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
	local weaponCategoryWidget = self.tabList.Tabs.grid:getItemAtPosition( 1, lastIndex, false )
	if weaponCategoryWidget then
		self.tabList.Tabs.grid:setActiveItem( weaponCategoryWidget )
	end
end

local PostLoadFunc = function ( self )
	self.disableDarkenElement = true
	self.disableBlur = true
	self.disablePopupOpenCloseAnim = true
	local controller = self.m_ownerController
	CoD.Menu.SetButtonLabel( self, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
	self.updateMode = function ( self, mode, element )
		SetPaintshoModeValue( controller, mode )
		if mode == Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST then
			self.tabList.Tabs.m_disableNavigation = false
			SetFocusOnLastSelectedWeaponCategory( self, controller )
			CoD.SwapFocusableElements( controller, self.paintjobSelector, self.weaponList )
			SetFocusOnLastSelectedWeapon( self, controller )
			self:setState( "DefaultState" )
		elseif mode == Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS then
			self.tabList.Tabs.m_disableNavigation = true
			CoD.SwapFocusableElements( controller, self.weaponList, self.paintjobSelector )
			self:setState( "ShowPaintjobs" )
		end
	end
	
	local modeValue = GetPaintshopModeValue( controller )
	self:updateMode( modeValue )
end

local PreLoadFunc = function ( self, controller )
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.UpdateDataSource" ), function ( model )
		local selectedPaintjobModel = CoD.perController[controller].selectedpaintjobModel
		if selectedPaintjobModel then
			local paintjobIndex = Engine.GetModelValue( Engine.GetModel( selectedPaintjobModel, "paintjobIndex" ) )
			local paintjobSlot = Engine.GetModelValue( Engine.GetModel( selectedPaintjobModel, "paintjobSlot" ) )
			if self.paintjobSelector ~= nil then
				self.paintjobSelector.paintjobsList:updateDataSource( true )
				self.paintjobSelector.paintjobsList:findItem( {
					paintjobIndex = paintjobIndex,
					paintjobSlot = paintjobSlot
				}, nil, true, nil )
			end
		end
	end )
end

LUI.createMenu.Paintshop = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Paintshop" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Paintshop"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackTransition = LUI.UIImage.new()
	BlackTransition:setLeftRight( 0, 1, 0, 0 )
	BlackTransition:setTopBottom( 0, 1, 0, 0 )
	BlackTransition:setRGB( 0, 0, 0 )
	BlackTransition:setAlpha( 0 )
	self:addElement( BlackTransition )
	self.BlackTransition = BlackTransition
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( 0, 0, 5, 793 )
	TitleDotsWidget0:setTopBottom( 0, 0, -97.5, 139.5 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 552 )
	LeftPanel:setTopBottom( 0, 0, 137, 1077 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local weaponList = LUI.UIList.new( self, controller, 8, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( 0, 0, 113, 533 )
	weaponList:setTopBottom( 0, 0, 205.5, 932.5 )
	weaponList:setWidgetType( CoD.PaintshopWeaponListButtonNew )
	weaponList:setVerticalCount( 7 )
	weaponList:setSpacing( 8 )
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
		PaintshopWeaponList_GainFocus( self, element, controller )
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
			PaintshopWeaponList_ChooseWeapon( self, element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
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
	
	local paintjobSelector = CoD.PaintjobSelector.new( self, controller )
	paintjobSelector:setLeftRight( 0, 0, 113, 617 )
	paintjobSelector:setTopBottom( 0, 0, 205, 993 )
	paintjobSelector:setAlpha( 0 )
	paintjobSelector:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		UpdateElementState( self, "slotsFull", controller )
		return retVal
	end )
	self:addElement( paintjobSelector )
	self.paintjobSelector = paintjobSelector
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( 0.5, 0.5, -960, 960 )
	CategoryListPanel:setTopBottom( 0.5, 0.5, -412, -354 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( 0, 0, 16, 118 )
	ElemsSideList:setTopBottom( 0, 0, 71.5, 1076.5 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
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
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_paintshop" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local slotsFull = CoD.PaintshopSlotsFull.new( self, controller )
	slotsFull:mergeStateConditions( {
		{
			stateName = "SlotsFull",
			condition = function ( menu, element, event )
				return CraftSlotsFullByStorageType( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
			end
		}
	} )
	slotsFull:setLeftRight( 0, 0, 674, 851 )
	slotsFull:setTopBottom( 0, 0, 891, 972 )
	slotsFull:setAlpha( 0 )
	slotsFull:subscribeToGlobalModel( controller, "PerController", "Paintshop.UpdateDataSource", function ( model )
		local element = slotsFull
		UpdateSelfElementState( self, element, controller )
	end )
	self:addElement( slotsFull )
	self.slotsFull = slotsFull
	
	local tabList = CoD.FE_TabBar.new( self, controller )
	tabList:setLeftRight( 0, 0, 0, 3744 )
	tabList:setTopBottom( 0, 0, 127, 189 )
	tabList.Tabs.grid:setHorizontalCount( 8 )
	tabList.Tabs.grid:setDataSource( "PaintshopWeaponTabType" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		PaintshopWeaponList_TabChanged( self, element, controller )
		return retVal
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local categoryName = LUI.UIText.new()
	categoryName:setLeftRight( 0, 0, 582, 967 )
	categoryName:setTopBottom( 0, 0, 172, 200 )
	categoryName:setRGB( 0.97, 0.32, 0.05 )
	categoryName:setAlpha( 0 )
	categoryName:setText( LocalizeToUpperString( "MENU_PAINTJOB" ) )
	categoryName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	categoryName:setLetterSpacing( 1 )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local weaponVerticalCounter = CoD.verticalCounter.new( self, controller )
	weaponVerticalCounter:setLeftRight( 0, 0, 173, 473 )
	weaponVerticalCounter:setTopBottom( 0, 0, 939, 977 )
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
	itemName:linkToElementModel( paintjobSelector.paintjobsList, "paintjobName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	weaponList.navigation = {
		down = paintjobSelector
	}
	paintjobSelector.navigation = {
		left = weaponVerticalCounter,
		up = weaponList,
		down = weaponVerticalCounter
	}
	weaponVerticalCounter.navigation = {
		up = paintjobSelector,
		right = paintjobSelector
	}
	self.resetProperties = function ()
		paintjobSelector:completeAnimation()
		LeftPanel:completeAnimation()
		itemName:completeAnimation()
		weaponList:completeAnimation()
		tabList:completeAnimation()
		CategoryListPanel:completeAnimation()
		slotsFull:completeAnimation()
		categoryName:completeAnimation()
		weaponVerticalCounter:completeAnimation()
		BlackTransition:completeAnimation()
		paintjobSelector:setLeftRight( 0, 0, 113, 617 )
		paintjobSelector:setTopBottom( 0, 0, 205, 993 )
		paintjobSelector:setAlpha( 0 )
		LeftPanel:setLeftRight( 0, 0, 96, 552 )
		LeftPanel:setTopBottom( 0, 0, 137, 1077 )
		itemName:setLeftRight( 0, 0, 582, 1154 )
		itemName:setTopBottom( 0, 0, 205.5, 256.5 )
		itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
		weaponList:setAlpha( 1 )
		tabList:setAlpha( 1 )
		CategoryListPanel:setAlpha( 1 )
		slotsFull:setLeftRight( 0, 0, 674, 851 )
		slotsFull:setTopBottom( 0, 0, 891, 972 )
		slotsFull:setAlpha( 0 )
		categoryName:setLeftRight( 0, 0, 582, 967 )
		categoryName:setTopBottom( 0, 0, 172, 200 )
		categoryName:setAlpha( 0 )
		weaponVerticalCounter:setAlpha( 1 )
		BlackTransition:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 552 )
				self.LeftPanel:setTopBottom( 0, 0, 136, 1020 )
				self.clipFinished( LeftPanel, {} )
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( 0, 0, 114, 622 )
				self.paintjobSelector:setTopBottom( 0, 0, 205, 993 )
				self.clipFinished( paintjobSelector, {} )
				itemName:completeAnimation()
				self.itemName:setLeftRight( 0, 0, 582.5, 1151.5 )
				self.itemName:setTopBottom( 0, 0, 206.5, 257.5 )
				self.clipFinished( itemName, {} )
			end,
			ShowPaintjobs = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( 0, 0, 96.5, 639.5 )
					LeftPanel:setTopBottom( 0, 0, 129, 1077 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 552 )
				self.LeftPanel:setTopBottom( 0, 0, 129, 1077 )
				LeftPanelFrame2( LeftPanel, {} )
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
				local paintjobSelectorFrame2 = function ( paintjobSelector, event )
					if not event.interrupted then
						paintjobSelector:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					paintjobSelector:setLeftRight( 0, 0, 114, 622 )
					paintjobSelector:setTopBottom( 0, 0, 205, 993 )
					paintjobSelector:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( paintjobSelector, event )
					else
						paintjobSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( 0, 0, -471.5, -0.5 )
				self.paintjobSelector:setTopBottom( 0, 0, 205, 993 )
				self.paintjobSelector:setAlpha( 0 )
				paintjobSelectorFrame2( paintjobSelector, {} )
				local CategoryListPanelFrame2 = function ( CategoryListPanel, event )
					if not event.interrupted then
						CategoryListPanel:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
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
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					itemName:setLeftRight( 0, 0, 673, 1241 )
					itemName:setTopBottom( 0, 0, 206.5, 257.5 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				self.itemName:setLeftRight( 0, 0, 582, 1154 )
				self.itemName:setTopBottom( 0, 0, 206.5, 257.5 )
				itemNameFrame2( itemName, {} )
				local slotsFullFrame2 = function ( slotsFull, event )
					if not event.interrupted then
						slotsFull:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					slotsFull:setLeftRight( 0, 0, 674, 851 )
					slotsFull:setTopBottom( 0, 0, 891, 972 )
					slotsFull:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( slotsFull, event )
					else
						slotsFull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				slotsFull:completeAnimation()
				self.slotsFull:setLeftRight( 0, 0, 582, 759 )
				self.slotsFull:setTopBottom( 0, 0, 893, 974 )
				self.slotsFull:setAlpha( 0 )
				slotsFullFrame2( slotsFull, {} )
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
				local categoryNameFrame2 = function ( categoryName, event )
					local categoryNameFrame3 = function ( categoryName, event )
						if not event.interrupted then
							categoryName:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						end
						categoryName:setLeftRight( 0, 0, 674, 1059 )
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
						categoryName:setLeftRight( 0, 0, 628, 1013 )
						categoryName:registerEventHandler( "transition_complete_keyframe", categoryNameFrame3 )
					end
				end
				
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( 0, 0, 582, 967 )
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
				self:setupElementClipCounter( 1 )
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
			end
		},
		ShowPaintjobs = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96.5, 639.5 )
				self.LeftPanel:setTopBottom( 0, 0, 128.5, 1019.5 )
				self.clipFinished( LeftPanel, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				self.clipFinished( weaponList, {} )
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( 0, 0, 114, 622 )
				self.paintjobSelector:setTopBottom( 0, 0, 205, 993 )
				self.paintjobSelector:setAlpha( 1 )
				self.clipFinished( paintjobSelector, {} )
				CategoryListPanel:completeAnimation()
				self.CategoryListPanel:setAlpha( 0 )
				self.clipFinished( CategoryListPanel, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( 0, 0, 673.5, 1256.5 )
				self.itemName:setTopBottom( 0, 0, 206.5, 257.5 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				slotsFull:completeAnimation()
				self.slotsFull:setAlpha( 1 )
				self.clipFinished( slotsFull, {} )
				tabList:completeAnimation()
				self.tabList:setAlpha( 0 )
				self.clipFinished( tabList, {} )
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( 0, 0, 674, 1059 )
				self.categoryName:setTopBottom( 0, 0, 172, 200 )
				self.categoryName:setAlpha( 1 )
				self.clipFinished( categoryName, {} )
				weaponVerticalCounter:completeAnimation()
				self.weaponVerticalCounter:setAlpha( 0 )
				self.clipFinished( weaponVerticalCounter, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( 0, 0, 96, 552 )
					LeftPanel:setTopBottom( 0, 0, 129, 1077 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96.5, 639.5 )
				self.LeftPanel:setTopBottom( 0, 0, 129, 1077 )
				LeftPanelFrame2( LeftPanel, {} )
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
				local paintjobSelectorFrame2 = function ( paintjobSelector, event )
					if not event.interrupted then
						paintjobSelector:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					paintjobSelector:setLeftRight( 0, 0, -471.5, -0.5 )
					paintjobSelector:setTopBottom( 0, 0, 205, 993 )
					paintjobSelector:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( paintjobSelector, event )
					else
						paintjobSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( 0, 0, 114, 622 )
				self.paintjobSelector:setTopBottom( 0, 0, 205, 993 )
				self.paintjobSelector:setAlpha( 1 )
				paintjobSelectorFrame2( paintjobSelector, {} )
				local CategoryListPanelFrame2 = function ( CategoryListPanel, event )
					if not event.interrupted then
						CategoryListPanel:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					CategoryListPanel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CategoryListPanel, event )
					else
						CategoryListPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListPanel:completeAnimation()
				self.CategoryListPanel:setAlpha( 0 )
				CategoryListPanelFrame2( CategoryListPanel, {} )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					itemName:setLeftRight( 0, 0, 581.5, 1004.5 )
					itemName:setTopBottom( 0, 0, 206.5, 257.5 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				self.itemName:setLeftRight( 0, 0, 673.5, 1246.5 )
				self.itemName:setTopBottom( 0, 0, 206.5, 257.5 )
				itemNameFrame2( itemName, {} )
				local slotsFullFrame2 = function ( slotsFull, event )
					if not event.interrupted then
						slotsFull:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					slotsFull:setLeftRight( 0, 0, 582, 759 )
					slotsFull:setTopBottom( 0, 0, 893, 974 )
					slotsFull:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( slotsFull, event )
					else
						slotsFull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				slotsFull:completeAnimation()
				self.slotsFull:setLeftRight( 0, 0, 674, 851 )
				self.slotsFull:setTopBottom( 0, 0, 891, 972 )
				self.slotsFull:setAlpha( 1 )
				slotsFullFrame2( slotsFull, {} )
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
				local categoryNameFrame2 = function ( categoryName, event )
					local categoryNameFrame3 = function ( categoryName, event )
						if not event.interrupted then
							categoryName:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						end
						categoryName:setLeftRight( 0, 0, 582, 967 )
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
						categoryName:setLeftRight( 0, 0, 628, 1013 )
						categoryName:setAlpha( 0 )
						categoryName:registerEventHandler( "transition_complete_keyframe", categoryNameFrame3 )
					end
				end
				
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( 0, 0, 674, 1059 )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Paintshop.Mode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Paintshop.Mode"
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
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST ) then
			PaintshopWeaponList_Back( self, element, controller )
			ClearSavedState( self, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			GoBack( self, controller )
			SendClientScriptNotifyForAdjustedClient( controller, "CustomClass_closed", "" )
			return true
		elseif IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS ) then
			PaintshopWeaponList_PressBackOnPaintjobsSelector( self, element, controller )
			PlaySoundSetSound( self, "list_back" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		elseif IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
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
	weaponList.id = "weaponList"
	paintjobSelector.id = "paintjobSelector"
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
		self.TitleDotsWidget0:close()
		self.LeftPanel:close()
		self.weaponList:close()
		self.paintjobSelector:close()
		self.ElemsSideList:close()
		self.itemName:close()
		self.MenuFrame:close()
		self.slotsFull:close()
		self.tabList:close()
		self.weaponVerticalCounter:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Paintshop.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

