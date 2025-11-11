require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.CAC.GridItemVariantButton" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectMenuWidgetNew" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponVariantIcon" )
require( "ui.uieditor.widgets.CAC.WeaponItemListButtonNew" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.TabbedWidgets.WeaponGroupsTabWidget" )

local PreLoadFunc = function ( self, controller )
	if IsCampaign() then
		self.disableBlur = true
	end
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
				if groupValue == "weapon_wrench" or groupValue == "weapon_knuckles" then
					groupValue = "weapon_knife"
				end
				DataSources.Unlockables.setCurrentFilterItem( groupValue )
				self.weaponCategoryList.Tabs.grid:findItem( nil, {
					filter = groupValue
				}, true, nil )
				self.weaponList:updateDataSource( true )
				focusedWidget = self.weaponList:findItem( {
					itemIndex = selectedItemIndex
				}, nil, false, nil )
			end
		else
			DataSources.Unlockables.setCurrentFilterItem( secondaryGroupCategory[1].weapon_category )
			self.weaponCategoryList.Tabs.grid:setActiveItem( self.weaponCategoryList.Tabs.grid:getItemAt( 2 ) )
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

local SetWeaponAttributesModel = function ( self, controller, list )
	local listAttributesModel = list:getModel( controller, "weaponAttributes" )
	if listAttributesModel then
		self.selectMenuWidget.selectionInfoWidget.WeaponAttributesInternal:setModel( listAttributesModel, controller )
	end
end

local PostLoadFunc = function ( self, controller )
	self.selectMenuWidget:linkToElementModel( self.variantList, "weaponAttributes", false, function ( model )
		self.selectMenuWidget.selectionInfoWidget.WeaponAttributesInternal:setModel( model, controller )
	end )
	self.updateMode = function ( self, element )
		local newMode = Engine.GetModelValue( DataSources.WGSV_Category )
		self.currentMode = newMode
		if self.currentMode == CoD.WGSV_Category.WEAPON then
			self.weaponCategoryList.Tabs.m_disableNavigation = false
			CoD.CACUtility.WeaponSelectFocusOnLastSelectedCategory( self, element, controller )
			CoD.SwapFocusableElements( controller, self.variantList, self.weaponList )
			SetWeaponAttributesModel( self, controller, self.weaponList )
			self:setState( "DefaultState" )
		elseif self.currentMode == CoD.WGSV_Category.GUNSMITH_VARIANT then
			self.weaponCategoryList.Tabs.m_disableNavigation = true
			self.variantList:updateDataSource()
			CoD.SwapFocusableElements( controller, self.weaponList, self.variantList )
			SetWeaponAttributesModel( self, controller, self.variantList )
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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SecondaryWeaponSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 552 )
	LeftPanel:setTopBottom( 0, 1, 116, 0 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( 0, 1, 0, 0 )
	CategoryListPanel:setTopBottom( 0, 0, 126, 184 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local selectMenuWidget = CoD.SelectMenuWidgetNew.new( self, controller )
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
	selectMenuWidget:setLeftRight( 0, 1, 0, 0 )
	selectMenuWidget:setTopBottom( 0, 1, 0, 0 )
	selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_SECONDARY_CAPS" ) )
	selectMenuWidget:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( selectMenuWidget )
	self.selectMenuWidget = selectMenuWidget
	
	local weaponList = LUI.UIList.new( self, controller, 10, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( 0, 0, 116, 536 )
	weaponList:setTopBottom( 0, 0, 207.5, 946.5 )
	weaponList:setWidgetType( CoD.WeaponItemListButtonNew )
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
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		if IsCACItemNew( element, controller ) then
			SetCACWeaponAsOld( self, element, controller )
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
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			SetUnlockConfirmationInfo( element, controller )
			OpenPopup( self, "OutOfUnlockTokens", controller, "", "" )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			OpenUnlockClassItemDialog( menu, element, controller )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and IsCACWeaponVariantAvailable( element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			SetGlobalModelValueArg( "WGSV_Category", CoD.WGSV_Category.GUNSMITH_VARIANT )
			CallCustomElementFunction_Self( self, "updateMode", element )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			SetClassItem( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and IsCACWeaponVariantAvailable( element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			return true
		else
			return false
		end
	end, true )
	self:AddButtonCallbackFunction( weaponList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if CanPrestigeWeapon( element, controller ) then
			PrestigeWeapon( menu, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CanPrestigeWeapon( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
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
	variantList:setWidgetType( CoD.GridItemVariantButton )
	variantList:setHorizontalCount( 3 )
	variantList:setVerticalCount( 4 )
	variantList:setSpacing( 10 )
	variantList:setDataSource( "WeaponVariantList" )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, true )
	self:AddButtonCallbackFunction( variantList, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SetGlobalModelValueArg( "WGSV_Category", CoD.WGSV_Category.WEAPON )
		CallCustomElementFunction_Self( self, "updateMode", element )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:addElement( variantList )
	self.variantList = variantList
	
	local attachmentList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	attachmentList:makeFocusable()
	attachmentList:setLeftRight( 0, 0, 679, 1127 )
	attachmentList:setTopBottom( 0, 0, 274, 322 )
	attachmentList:setAlpha( 0 )
	attachmentList:setWidgetType( CoD.WeaponVariantIcon )
	attachmentList:setHorizontalCount( 9 )
	self:addElement( attachmentList )
	self.attachmentList = attachmentList
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( 0, 1, 0, 0 )
	feFooterContainer:setTopBottom( 1, 1, -98, 0 )
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
	PregameTimerOverlay:setLeftRight( 0, 1, 0, 0 )
	PregameTimerOverlay:setTopBottom( 0, 1, 0, 0 )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local weaponCategoryList = CoD.FE_TabBar.new( self, controller )
	weaponCategoryList:setLeftRight( 0, 1, 0, 1824 )
	weaponCategoryList:setTopBottom( 0, 0, 126, 190 )
	weaponCategoryList.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	weaponCategoryList.Tabs.grid:setDataSource( "WeaponGroups" )
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
	
	local categoryName = LUI.UIText.new()
	categoryName:setLeftRight( 0, 0, 674, 1058 )
	categoryName:setTopBottom( 0, 0, 170, 198 )
	categoryName:setRGB( 0.97, 0.32, 0.05 )
	categoryName:setText( LocalizeToUpperString( "MENU_VARIANT" ) )
	categoryName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	categoryName:setLetterSpacing( 1 )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
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
		attachmentList:completeAnimation()
		LeftPanel:completeAnimation()
		categoryName:completeAnimation()
		weaponList:completeAnimation()
		CategoryListPanel:completeAnimation()
		weaponCategoryList:completeAnimation()
		variantList:completeAnimation()
		selectMenuWidget:completeAnimation()
		attachmentList:setLeftRight( 0, 0, 679, 1127 )
		attachmentList:setTopBottom( 0, 0, 274, 322 )
		attachmentList:setAlpha( 0 )
		LeftPanel:setLeftRight( 0, 0, 96, 552 )
		LeftPanel:setTopBottom( 0, 1, 116, 0 )
		categoryName:setLeftRight( 0, 0, 674, 1058 )
		categoryName:setTopBottom( 0, 0, 170, 198 )
		categoryName:setAlpha( 1 )
		weaponList:setAlpha( 1 )
		CategoryListPanel:setAlpha( 1 )
		weaponCategoryList:setAlpha( 1 )
		variantList:setLeftRight( 0, 0, 116.5, 622.5 )
		variantList:setTopBottom( 0, 0, 205, 883 )
		variantList:setAlpha( 0 )
		selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 552 )
				self.LeftPanel:setTopBottom( 0, 1, 117, -79 )
				self.clipFinished( LeftPanel, {} )
				attachmentList:completeAnimation()
				self.attachmentList:setLeftRight( 0, 0, 586, 1042 )
				self.attachmentList:setTopBottom( 0, 0, 274, 322 )
				self.clipFinished( attachmentList, {} )
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( 0, 0, 586, 970 )
				self.categoryName:setTopBottom( 0, 0, 170, 198 )
				self.categoryName:setAlpha( 0 )
				self.clipFinished( categoryName, {} )
			end,
			ShowVariants = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( 0, 0, 96, 642 )
					LeftPanel:setTopBottom( 0, 1, 117, -79 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 552 )
				self.LeftPanel:setTopBottom( 0, 1, 117, -79 )
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
				local categoryNameFrame2 = function ( categoryName, event )
					if not event.interrupted then
						categoryName:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					categoryName:setLeftRight( 0, 0, 674, 1058 )
					categoryName:setTopBottom( 0, 0, 170, 198 )
					categoryName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryName, event )
					else
						categoryName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( 0, 0, 586, 970 )
				self.categoryName:setTopBottom( 0, 0, 170, 198 )
				self.categoryName:setAlpha( 0 )
				categoryNameFrame2( categoryName, {} )
			end
		},
		ShowVariants = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 642 )
				self.LeftPanel:setTopBottom( 0, 1, 117, -79 )
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
				self.attachmentList:setLeftRight( 0, 0, 674, 1130 )
				self.attachmentList:setTopBottom( 0, 0, 274, 322 )
				self.attachmentList:setAlpha( 1 )
				self.clipFinished( attachmentList, {} )
				weaponCategoryList:completeAnimation()
				self.weaponCategoryList:setAlpha( 0 )
				self.clipFinished( weaponCategoryList, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
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
					local attachmentListFrame3 = function ( attachmentList, event )
						if not event.interrupted then
							attachmentList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						attachmentList:setLeftRight( 0, 0, 586, 1042 )
						attachmentList:setTopBottom( 0, 0, 274, 322 )
						attachmentList:setAlpha( 0 )
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
						attachmentList:setAlpha( 0 )
						attachmentList:registerEventHandler( "transition_complete_keyframe", attachmentListFrame3 )
					end
				end
				
				attachmentList:completeAnimation()
				self.attachmentList:setLeftRight( 0, 0, 674, 1130 )
				self.attachmentList:setTopBottom( 0, 0, 274, 322 )
				self.attachmentList:setAlpha( 1 )
				attachmentListFrame2( attachmentList, {} )
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
				local categoryNameFrame2 = function ( categoryName, event )
					if not event.interrupted then
						categoryName:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					categoryName:setLeftRight( 0, 0, 586, 970 )
					categoryName:setTopBottom( 0, 0, 170, 198 )
					categoryName:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( categoryName, event )
					else
						categoryName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( 0, 0, 674, 1058 )
				self.categoryName:setTopBottom( 0, 0, 170, 198 )
				self.categoryName:setAlpha( 1 )
				categoryNameFrame2( categoryName, {} )
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
		self.FEMenuLeftGraphics:close()
		self.selectMenuWidget:close()
		self.weaponList:close()
		self.variantList:close()
		self.attachmentList:close()
		self.feFooterContainer:close()
		self.PregameTimerOverlay:close()
		self.weaponCategoryList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SecondaryWeaponSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

