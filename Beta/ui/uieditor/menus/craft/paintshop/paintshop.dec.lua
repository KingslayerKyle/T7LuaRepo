require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopWeaponListButtonNew" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintjobSelector" )
require( "ui.uieditor.widgets.TabbedWidgets.craftTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopSlotsFull" )

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
	local weaponCategoryWidget = self.tabList.grid:getItemAtPosition( 1, lastIndex, false )
	if weaponCategoryWidget then
		self.tabList.grid:setActiveItem( weaponCategoryWidget )
	end
end

local PostLoadFunc = function ( self )
	self.disableDarkenElement = true
	self.disableBlur = true
	local controller = self.m_ownerController
	CoD.Menu.SetButtonLabel( self, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
	self.updateMode = function ( self, mode, element )
		SetPaintshoModeValue( controller, mode )
		if mode == Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST then
			self.tabList.m_disableNavigation = false
			SetFocusOnLastSelectedWeaponCategory( self, controller )
			CoD.SwapFocusableElements( controller, self.paintjobSelector, self.weaponList )
			SetFocusOnLastSelectedWeapon( self, controller )
			self:setState( "DefaultState" )
		elseif mode == Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS then
			self.tabList.m_disableNavigation = true
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( menu, controller )
	TitleDotsWidget0:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget0:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, 64, 367 )
	LeftPanel:setTopBottom( true, false, 91, 718 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local WeaponListBacking = LUI.UIImage.new()
	WeaponListBacking:setLeftRight( true, false, 78.87, 379.37 )
	WeaponListBacking:setTopBottom( true, false, 176, 674 )
	WeaponListBacking:setRGB( 0.74, 0.82, 0.86 )
	WeaponListBacking:setAlpha( 0 )
	self:addElement( WeaponListBacking )
	self.WeaponListBacking = WeaponListBacking
	
	local weaponList = LUI.UIList.new( menu, controller, 5, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( true, false, 83.5, 422.5 )
	weaponList:setTopBottom( true, false, 159, 714 )
	weaponList:setDataSource( "Unlockables" )
	weaponList:setWidgetType( CoD.PaintshopWeaponListButtonNew )
	weaponList:setVerticalCount( 8 )
	weaponList:setSpacing( 5 )
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
		PaintshopWeaponList_ChooseWeapon( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	local paintjobSelector = CoD.PaintjobSelector.new( menu, controller )
	paintjobSelector:setLeftRight( true, false, 20, 356 )
	paintjobSelector:setTopBottom( true, false, 140.5, 652 )
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
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local tabList = CoD.craftTabList.new( menu, controller )
	tabList:setLeftRight( true, false, 39, 1129 )
	tabList:setTopBottom( true, false, 84, 120 )
	tabList.grid:setDataSource( "PaintshopWeaponTabType" )
	tabList.grid:setWidgetType( CoD.paintshopTabWidget )
	tabList.grid:setHorizontalCount( 8 )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		PaintshopWeaponList_TabChanged( self, element, controller )
		return retVal
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( menu, controller )
	ElemsSideList:setLeftRight( true, false, 11, 78.87 )
	ElemsSideList:setTopBottom( true, false, 48, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local itemName = CoD.InfoPaneItemName.new( menu, controller )
	itemName:setLeftRight( true, false, 386.5, 767.5 )
	itemName:setTopBottom( true, false, 159, 193 )
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
	
	local MenuFrame = CoD.GenericMenuFrame.new( menu, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_paintshop" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local slotsFull = CoD.PaintshopSlotsFull.new( menu, controller )
	slotsFull:setLeftRight( true, false, 441.37, 987.37 )
	slotsFull:setTopBottom( true, false, 588, 682 )
	slotsFull:setAlpha( 0 )
	slotsFull:subscribeToGlobalModel( controller, "PerController", "Paintshop.UpdateDataSource", function ( model )
		local element = slotsFull
		UpdateSelfElementState( menu, element, controller )
	end )
	slotsFull:mergeStateConditions( {
		{
			stateName = "SlotsFull",
			condition = function ( menu, element, event )
				return Paintjobs_SlotsFull()
			end
		}
	} )
	self:addElement( slotsFull )
	self.slotsFull = slotsFull
	
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
		left = paintjobSelector,
		up = paintjobSelector
	}
	paintjobSelector.navigation = {
		right = weaponList,
		down = weaponList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 367 )
				self.LeftPanel:setTopBottom( true, false, 91, 680 )
				self.clipFinished( LeftPanel, {} )
				WeaponListBacking:completeAnimation()
				self.WeaponListBacking:setLeftRight( true, false, 79.5, 380 )
				self.WeaponListBacking:setTopBottom( true, false, 174.5, 672.5 )
				self.WeaponListBacking:setAlpha( 0 )
				self.clipFinished( WeaponListBacking, {} )
				weaponList:completeAnimation()
				self.weaponList:setLeftRight( true, false, 83.5, 422.5 )
				self.weaponList:setTopBottom( true, false, 159, 714 )
				self.weaponList:setAlpha( 1 )
				self.clipFinished( weaponList, {} )
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, 64, 400 )
				self.paintjobSelector:setTopBottom( true, false, 141.5, 652 )
				self.paintjobSelector:setAlpha( 0 )
				self.clipFinished( paintjobSelector, {} )
				tabList:completeAnimation()
				self.tabList:setAlpha( 1 )
				self.clipFinished( tabList, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 386.5, 767.5 )
				self.itemName:setTopBottom( true, false, 159, 193 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
				slotsFull:completeAnimation()
				self.slotsFull:setAlpha( 0 )
				self.clipFinished( slotsFull, {} )
			end,
			ShowPaintjobs = function ()
				self:setupElementClipCounter( 4 )
				local WeaponListBackingFrame2 = function ( WeaponListBacking, event )
					if not event.interrupted then
						WeaponListBacking:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					WeaponListBacking:setLeftRight( true, false, 79.5, 340.5 )
					WeaponListBacking:setTopBottom( true, false, 174.5, 634.5 )
					WeaponListBacking:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( WeaponListBacking, event )
					else
						WeaponListBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WeaponListBacking:completeAnimation()
				self.WeaponListBacking:setLeftRight( true, false, 78.87, 373.87 )
				self.WeaponListBacking:setTopBottom( true, false, 171, 665 )
				self.WeaponListBacking:setAlpha( 0 )
				WeaponListBackingFrame2( WeaponListBacking, {} )
				local weaponListFrame2 = function ( weaponList, event )
					if not event.interrupted then
						weaponList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					weaponList:setLeftRight( true, false, 83.5, 316.5 )
					weaponList:setTopBottom( true, false, 159, 265 )
					weaponList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weaponList, event )
					else
						weaponList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:completeAnimation()
				self.weaponList:setLeftRight( true, false, 83.5, 316.5 )
				self.weaponList:setTopBottom( true, false, 159, 265 )
				self.weaponList:setAlpha( 1 )
				weaponListFrame2( weaponList, {} )
				local paintjobSelectorFrame2 = function ( paintjobSelector, event )
					local paintjobSelectorFrame3 = function ( paintjobSelector, event )
						if not event.interrupted then
							paintjobSelector:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						paintjobSelector:setLeftRight( true, false, -36.5, 386.5 )
						paintjobSelector:setTopBottom( true, false, 159, 545 )
						paintjobSelector:setRGB( 1, 1, 1 )
						paintjobSelector:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( paintjobSelector, event )
						else
							paintjobSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						paintjobSelectorFrame3( paintjobSelector, event )
						return 
					else
						paintjobSelector:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						paintjobSelector:setLeftRight( true, false, -222.5, 200.5 )
						paintjobSelector:registerEventHandler( "transition_complete_keyframe", paintjobSelectorFrame3 )
					end
				end
				
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, -599, -176 )
				self.paintjobSelector:setTopBottom( true, false, 159, 545 )
				self.paintjobSelector:setRGB( 1, 1, 1 )
				self.paintjobSelector:setAlpha( 1 )
				paintjobSelectorFrame2( paintjobSelector, {} )
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
		ShowPaintjobs = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, false, 91, 680 )
				self.clipFinished( LeftPanel, {} )
				WeaponListBacking:completeAnimation()
				self.WeaponListBacking:setAlpha( 0 )
				self.clipFinished( WeaponListBacking, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				self.clipFinished( weaponList, {} )
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, 52, 388 )
				self.paintjobSelector:setTopBottom( true, false, 150.5, 664 )
				self.paintjobSelector:setAlpha( 1 )
				self.clipFinished( paintjobSelector, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 456.75, 837.75 )
				self.itemName:setTopBottom( true, false, 159, 193 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				slotsFull:completeAnimation()
				self.slotsFull:setLeftRight( true, false, 443.37, 989.37 )
				self.slotsFull:setTopBottom( true, false, 557, 651 )
				self.slotsFull:setAlpha( 1 )
				self.clipFinished( slotsFull, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
				local WeaponListBackingFrame2 = function ( WeaponListBacking, event )
					if not event.interrupted then
						WeaponListBacking:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					WeaponListBacking:setAlpha( 0.03 )
					if event.interrupted then
						self.clipFinished( WeaponListBacking, event )
					else
						WeaponListBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WeaponListBacking:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				WeaponListBacking:setAlpha( 0 )
				WeaponListBacking:registerEventHandler( "transition_complete_keyframe", WeaponListBackingFrame2 )
				local weaponListFrame2 = function ( weaponList, event )
					if not event.interrupted then
						weaponList:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					weaponList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weaponList, event )
					else
						weaponList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				weaponList:setAlpha( 0 )
				weaponList:registerEventHandler( "transition_complete_keyframe", weaponListFrame2 )
				local paintjobSelectorFrame2 = function ( paintjobSelector, event )
					if not event.interrupted then
						paintjobSelector:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					paintjobSelector:setLeftRight( true, false, -420, 3 )
					paintjobSelector:setTopBottom( true, false, 141.5, 561 )
					paintjobSelector:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( paintjobSelector, event )
					else
						paintjobSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, 64, 487 )
				self.paintjobSelector:setTopBottom( true, false, 141.5, 561 )
				self.paintjobSelector:setAlpha( 1 )
				paintjobSelectorFrame2( paintjobSelector, {} )
				local tabListFrame2 = function ( tabList, event )
					if not event.interrupted then
						tabList:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					tabList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( tabList, event )
					else
						tabList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tabList:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				tabList:setAlpha( 0 )
				tabList:registerEventHandler( "transition_complete_keyframe", tabListFrame2 )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, menu, true )
		ShowHeaderIconOnly( menu )
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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST ) then
			PaintshopWeaponList_Back( self, element, controller )
			ClearSavedState( self, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			GoBack( self, controller )
			return true
		elseif IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS ) then
			PaintshopWeaponList_PressBackOnPaintjobsSelector( self, element, controller )
			PlaySoundSetSound( self, "list_back" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST ) then
			return true
		elseif IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS ) then
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
	paintjobSelector.id = "paintjobSelector"
	MenuFrame:setModel( self.buttonModel, controller )
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
		self.TitleDotsWidget0:close()
		self.LeftPanel:close()
		self.weaponList:close()
		self.paintjobSelector:close()
		self.tabList:close()
		self.ElemsSideList:close()
		self.itemName:close()
		self.MenuFrame:close()
		self.slotsFull:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Paintshop.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

