require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectMenuWidgetNew" )
require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.CAC.WeaponItemListButtonNew" )
require( "ui.uieditor.widgets.CAC.GridItemVariantButton" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponVariantIcon" )
require( "ui.uieditor.widgets.TabbedWidgets.craftTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].classModel )
	DataSources.Unlockables.setCurrentFilterItem( "secondary" )
	self.performingSetup = true
	self.restoreState = function ( self )
		local classModel = self:getModel()
		local loadoutSlotName = CoD.perController[controller].weaponCategory
		local secondaryGroupCategory = CoD.CACUtility.SecondaryWeaponGroupNames
		local selectedItemIndex = Engine.GetModelValue( self:getModel( controller, loadoutSlotName .. ".itemIndex" ) )
		self.lastSelectionTable = {}
		for _, category in ipairs( secondaryGroupCategory ) do
			local group = category.weapon_category
			self.lastSelectionTable[group] = 1
		end
		local focusedWidget = self.weaponList:findItem( {
			itemIndex = selectedItemIndex
		}, nil, false, nil )
		local groupValue = nil
		if focusedWidget then
			local groupModel = focusedWidget:getModel( controller, "group" )
			if groupModel then
				groupValue = Engine.GetModelValue( groupModel )
				DataSources.Unlockables.setCurrentFilterItem( groupValue )
				self.weaponCategoryList.grid:findItem( nil, {
					filter = groupValue
				}, true, nil )
				self.weaponList:updateDataSource( true )
				focusedWidget = self.weaponList:findItem( {
					itemIndex = selectedItemIndex
				}, nil, false, nil )
			end
		else
			DataSources.Unlockables.setCurrentFilterItem( secondaryGroupCategory[1].weapon_category )
			self.weaponCategoryList.grid:setActiveItem( self.weaponCategoryList.grid:getItemAt( 2 ) )
			self.weaponList:updateDataSource( true )
			focusedWidget = self.weaponList:getFirstSelectableItem()
		end
		if focusedWidget then
			self.weaponList:processEvent( {
				name = "gain_focus",
				controller = controller,
				selectIndex = focusedWidget.gridInfoTable.zeroBasedIndex
			} )
			if groupValue then
				self.lastSelectionTable[groupValue] = focusedWidget.gridInfoTable.zeroBasedIndex + 1
			end
		end
		self.performingSetup = false
		return true
	end
	
	CoD.perController[controller].weaponIndexForVariant = 0
end

local PostLoadFunc = function ( self, controller )
	self.updateMode = function ( self, element )
		local newMode = Engine.GetModelValue( DataSources.WGSV_Category )
		self.currentMode = newMode
		if self.currentMode == CoD.WGSV_Category.WEAPON then
			self.weaponCategoryList.m_disableNavigation = false
			CoD.CACUtility.WeaponSelectFocusOnLastSelectedCategory( self, element, controller )
			CoD.SwapFocusableElements( controller, self.variantList, self.weaponList )
			self:setState( "DefaultState" )
		elseif self.currentMode == CoD.WGSV_Category.GUNSMITH_VARIANT then
			self.weaponCategoryList.m_disableNavigation = true
			self.variantList:updateDataSource()
			CoD.SwapFocusableElements( controller, self.weaponList, self.variantList )
			CoD.CACUtility.WeaponSelectFocusOnLastSelectedWeapon( self, controller )
			self:setState( "ShowVariants" )
		end
	end
	
end

LUI.createMenu.SecondaryWeaponSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SecondaryWeaponSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_SecondaryWeapon"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SecondaryWeaponSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 368 )
	LeftPanel:setTopBottom( true, false, 78, 720 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local selectMenuWidget = CoD.SelectMenuWidgetNew.new( self, controller )
	selectMenuWidget:setLeftRight( true, true, 0, 0 )
	selectMenuWidget:setTopBottom( true, true, 0, 0 )
	selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_SECONDARY_CAPS" ) )
	selectMenuWidget:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	selectMenuWidget:mergeStateConditions( {
		{
			stateName = "GridLayout",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "WGSV_Category", CoD.WGSV_Category.GUNSMITH_VARIANT )
			end
		}
	} )
	selectMenuWidget:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "WGSV_Category" ), function ( model )
		self:updateElementState( selectMenuWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "WGSV_Category"
		} )
	end )
	self:addElement( selectMenuWidget )
	self.selectMenuWidget = selectMenuWidget
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local weaponList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( true, false, 77, 357 )
	weaponList:setTopBottom( true, false, 136, 633 )
	weaponList:setDataSource( "Unlockables" )
	weaponList:setWidgetType( CoD.WeaponItemListButtonNew )
	weaponList:setVerticalCount( 7 )
	weaponList:setSpacing( 7 )
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
	weaponList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsCACItemNew( element, controller ) then
			SetCACItemAsOld( element, controller )
			UpdateSelfElementState( self, element, controller )
			FocusWeapon( self, element, controller )
		else
			FocusWeapon( self, element, controller )
		end
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
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) then
			SetUnlockConfirmationInfo( element, controller )
			OpenPopup( self, "OutOfUnlockTokens", controller )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) then
			OpenUnlockClassItemDialog( menu, element, controller )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and IsCACWeaponVariantAvailable( element, controller ) then
			SetGlobalModelValueArg( "WGSV_Category", CoD.WGSV_Category.GUNSMITH_VARIANT )
			CallCustomElementFunction_Self( self, "updateMode", element )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) then
			SetClassItem( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) then
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) then
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and IsCACWeaponVariantAvailable( element, controller ) then
			return true
		elseif not IsCACItemLocked( menu, element, controller ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	local variantList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	variantList:makeFocusable()
	variantList:setLeftRight( true, false, 77, 415 )
	variantList:setTopBottom( true, false, 136, 589 )
	variantList:setAlpha( 0 )
	variantList:setDataSource( "WeaponVariantList" )
	variantList:setWidgetType( CoD.GridItemVariantButton )
	variantList:setHorizontalCount( 3 )
	variantList:setVerticalCount( 4 )
	variantList:setSpacing( 7 )
	variantList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		FocusWeaponVariant( self, element, controller )
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
		SetWeaponVariant( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, true )
	self:AddButtonCallbackFunction( variantList, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SetGlobalModelValueArg( "WGSV_Category", CoD.WGSV_Category.WEAPON )
		CallCustomElementFunction_Self( self, "updateMode", element )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( variantList )
	self.variantList = variantList
	
	local attachmentList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	attachmentList:makeFocusable()
	attachmentList:setLeftRight( true, false, 450, 754 )
	attachmentList:setTopBottom( true, false, 183, 215 )
	attachmentList:setAlpha( 0 )
	attachmentList:setWidgetType( CoD.WeaponVariantIcon )
	attachmentList:setHorizontalCount( 9 )
	self:addElement( attachmentList )
	self.attachmentList = attachmentList
	
	local weaponCategoryList = CoD.craftTabList.new( self, controller )
	weaponCategoryList:setLeftRight( true, false, 64, 1304 )
	weaponCategoryList:setTopBottom( true, false, 84, 124 )
	weaponCategoryList.grid:setDataSource( "WeaponGroups" )
	weaponCategoryList.grid:setWidgetType( CoD.paintshopTabWidget )
	weaponCategoryList.grid:setHorizontalCount( 8 )
	weaponCategoryList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		CAC_TabChanged( self, element, controller )
		return retVal
	end )
	weaponCategoryList:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( weaponCategoryList )
	self.weaponCategoryList = weaponCategoryList
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
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
	variantName:setText( Engine.Localize( "MENU_VARIANTS_CAPS" ) )
	variantName:setTTF( "fonts/default.ttf" )
	variantName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	variantName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( variantName )
	self.variantName = variantName
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "WeaponSelect",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	selectMenuWidget:linkToElementModel( weaponList, nil, false, function ( model )
		selectMenuWidget:setModel( model, controller )
	end )
	selectMenuWidget:linkToElementModel( variantList, "variantNameBig", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	selectMenuWidget:linkToElementModel( weaponList, "weaponAttributes", false, function ( model )
		selectMenuWidget.selectionInfoWidget.WeaponAttributesInternal:setModel( model, controller )
	end )
	attachmentList:linkToElementModel( variantList, "listDataSource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachmentList:setDataSource( modelValue )
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
				self:setupElementClipCounter( 8 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 368 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
				self.clipFinished( LeftPanel, {} )
				selectMenuWidget:completeAnimation()
				selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				self.clipFinished( selectMenuWidget, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 1 )
				self.clipFinished( weaponList, {} )
				variantList:completeAnimation()
				self.variantList:setAlpha( 0 )
				self.clipFinished( variantList, {} )
				attachmentList:completeAnimation()
				self.attachmentList:setAlpha( 0 )
				self.clipFinished( attachmentList, {} )
				weaponCategoryList:completeAnimation()
				self.weaponCategoryList:setAlpha( 1 )
				self.clipFinished( weaponCategoryList, {} )
				BlackHeader:completeAnimation()
				self.BlackHeader:setAlpha( 0 )
				self.clipFinished( BlackHeader, {} )
				variantName:completeAnimation()
				self.variantName:setAlpha( 0 )
				self.clipFinished( variantName, {} )
			end,
			ShowVariants = function ()
				self:setupElementClipCounter( 7 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
				local weaponCategoryListFrame2 = function ( weaponCategoryList, event )
					if not event.interrupted then
						weaponCategoryList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					weaponCategoryList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weaponCategoryList, event )
					else
						weaponCategoryList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponCategoryList:completeAnimation()
				self.weaponCategoryList:setAlpha( 1 )
				weaponCategoryListFrame2( weaponCategoryList, {} )
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
			end
		},
		ShowVariants = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
				self.clipFinished( LeftPanel, {} )
				CategoryListPanel:completeAnimation()
				self.CategoryListPanel:setAlpha( 0 )
				self.clipFinished( CategoryListPanel, {} )
				selectMenuWidget:completeAnimation()
				selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				self.clipFinished( selectMenuWidget, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				self.clipFinished( weaponList, {} )
				variantList:completeAnimation()
				self.variantList:setAlpha( 1 )
				self.clipFinished( variantList, {} )
				attachmentList:completeAnimation()
				self.attachmentList:setAlpha( 1 )
				self.clipFinished( attachmentList, {} )
				weaponCategoryList:completeAnimation()
				self.weaponCategoryList:setAlpha( 0 )
				self.clipFinished( weaponCategoryList, {} )
				BlackHeader:completeAnimation()
				self.BlackHeader:setAlpha( 0.44 )
				self.clipFinished( BlackHeader, {} )
				variantName:completeAnimation()
				self.variantName:setAlpha( 1 )
				self.clipFinished( variantName, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 7 )
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
				local weaponCategoryListFrame2 = function ( weaponCategoryList, event )
					if not event.interrupted then
						weaponCategoryList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					weaponCategoryList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weaponCategoryList, event )
					else
						weaponCategoryList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponCategoryList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				weaponCategoryList:setAlpha( 0 )
				weaponCategoryList:registerEventHandler( "transition_complete_keyframe", weaponCategoryListFrame2 )
				local BlackHeaderFrame2 = function ( BlackHeader, event )
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
				
				BlackHeader:completeAnimation()
				self.BlackHeader:setAlpha( 0.44 )
				BlackHeaderFrame2( BlackHeader, {} )
				local variantNameFrame2 = function ( variantName, event )
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
				
				variantName:completeAnimation()
				self.variantName:setAlpha( 1 )
				variantNameFrame2( variantName, {} )
			end
		}
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "WGSV_Category" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "WGSV_Category"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		SetGlobalModelValueArg( "WGSV_Category", CoD.WGSV_Category.WEAPON )
		CallCustomElementFunction_Self( self, "updateMode", element )
		ShowHeaderKickerAndIcon( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsGlobalModelValueEqualTo( element, controller, "WGSV_Category", CoD.WGSV_Category.WEAPON ) then
			GoBack( self, controller )
			PlaySoundSetSound( self, "menu_no_selection" )
			return true
		else
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	weaponList.id = "weaponList"
	variantList.id = "variantList"
	attachmentList.id = "attachmentList"
	feFooterContainer:setModel( self.buttonModel, controller )
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
		self.selectMenuWidget:close()
		self.weaponList:close()
		self.variantList:close()
		self.attachmentList:close()
		self.weaponCategoryList:close()
		self.ElemsSideList:close()
		self.feFooterContainer:close()
		self.PregameTimerOverlay:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SecondaryWeaponSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

