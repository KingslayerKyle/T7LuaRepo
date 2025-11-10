require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectMenuWidgetNew" )
require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.CAC.WeaponItemListButtonNew" )
require( "ui.uieditor.widgets.CAC.GridItemVariantButton" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponVariantIcon" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.TabbedWidgets.WeaponGroupsTabWidget" )

local PreLoadFunc = function ( self, controller )
	if IsCampaign() then
		self.disableBlur = true
	end
	self:setModel( CoD.perController[controller].classModel )
	DataSources.Unlockables.setCurrentFilterItem( "secondary" )
	self.performingSetup = true
	self.restoreState = function ( f2_arg0 )
		local f2_local0 = f2_arg0:getModel()
		local f2_local1 = CoD.perController[controller].weaponCategory
		local f2_local2 = CoD.CACUtility.SecondaryWeaponGroupNames
		local f2_local3 = Engine.GetModelValue( f2_arg0:getModel( controller, f2_local1 .. ".itemIndex" ) )
		f2_arg0.lastSelectionTable = {}
		for f2_local7, f2_local8 in ipairs( f2_local2 ) do
			f2_arg0.lastSelectionTable[f2_local8.weapon_category] = 1
		end
		f2_local4 = f2_arg0.weaponList:findItem( {
			itemIndex = f2_local3
		}, nil, false, nil )
		f2_local5 = nil
		if f2_local4 then
			f2_local6 = f2_local4:getModel( controller, "group" )
			if f2_local6 then
				f2_local5 = Engine.GetModelValue( f2_local6 )
				DataSources.Unlockables.setCurrentFilterItem( f2_local5 )
				f2_arg0.weaponCategoryList.Tabs.grid:findItem( nil, {
					filter = f2_local5
				}, true, nil )
				f2_arg0.weaponList:updateDataSource( true )
				f2_local4 = f2_arg0.weaponList:findItem( {
					itemIndex = f2_local3
				}, nil, false, nil )
			end
		else
			DataSources.Unlockables.setCurrentFilterItem( f2_local2[1].weapon_category )
			f2_arg0.weaponCategoryList.Tabs.grid:setActiveItem( f2_arg0.weaponCategoryList.Tabs.grid:getItemAt( 2 ) )
			f2_arg0.weaponList:updateDataSource( true )
			f2_local4 = f2_arg0.weaponList:getFirstSelectableItem()
		end
		if f2_local4 then
			f2_arg0.weaponList:processEvent( {
				name = "gain_focus",
				controller = controller,
				selectIndex = f2_local4.gridInfoTable.zeroBasedIndex
			} )
			if f2_local5 then
				f2_arg0.lastSelectionTable[f2_local5] = f2_local4.gridInfoTable.zeroBasedIndex + 1
			end
		end
		f2_arg0.performingSetup = false
		return true
	end
	
	CoD.perController[controller].weaponIndexForVariant = 0
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	f3_arg0.updateMode = function ( f4_arg0, f4_arg1 )
		f4_arg0.currentMode = Engine.GetModelValue( DataSources.WGSV_Category )
		if f4_arg0.currentMode == CoD.WGSV_Category.WEAPON then
			f4_arg0.weaponCategoryList.Tabs.m_disableNavigation = false
			CoD.CACUtility.WeaponSelectFocusOnLastSelectedCategory( f4_arg0, f4_arg1, f3_arg1 )
			CoD.SwapFocusableElements( f3_arg1, f4_arg0.variantList, f4_arg0.weaponList )
			f4_arg0:setState( "DefaultState" )
		elseif f4_arg0.currentMode == CoD.WGSV_Category.GUNSMITH_VARIANT then
			f4_arg0.weaponCategoryList.Tabs.m_disableNavigation = true
			f4_arg0.variantList:updateDataSource()
			CoD.SwapFocusableElements( f3_arg1, f4_arg0.weaponList, f4_arg0.variantList )
			CoD.CACUtility.WeaponSelectFocusOnLastSelectedWeapon( f4_arg0, f3_arg1 )
			f4_arg0:setState( "ShowVariants" )
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SecondaryWeaponSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 368 )
	LeftPanel:setTopBottom( true, true, 78, 0 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( true, true, 0, 0 )
	CategoryListPanel:setTopBottom( true, false, 84, 123 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local selectMenuWidget = CoD.SelectMenuWidgetNew.new( self, controller )
	selectMenuWidget:setLeftRight( true, true, 0, 0 )
	selectMenuWidget:setTopBottom( true, true, 0, 0 )
	selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_SECONDARY_CAPS" ) )
	selectMenuWidget:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( name ) )
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
	
	local weaponList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( true, false, 77, 357 )
	weaponList:setTopBottom( true, false, 136, 633 )
	weaponList:setDataSource( "Unlockables" )
	weaponList:setWidgetType( CoD.WeaponItemListButtonNew )
	weaponList:setVerticalCount( 7 )
	weaponList:setSpacing( 7 )
	weaponList:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local f9_local0 = weaponList
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f9_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	weaponList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f10_local0 = nil
		if IsCACItemNew( element, controller ) then
			SetCACWeaponAsOld( self, element, controller )
			UpdateSelfElementState( self, element, controller )
			FocusWeapon( self, element, controller )
		else
			FocusWeapon( self, element, controller )
		end
		return f10_local0
	end )
	weaponList:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f11_local0
	end )
	weaponList:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
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
	self:AddButtonCallbackFunction( weaponList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if CanPrestigeWeapon( element, controller ) then
			PrestigeWeapon( menu, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_PRESTIGE_WEAPON" )
		if CanPrestigeWeapon( element, controller ) then
			return true
		else
			return false
		end
	end, false )
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
		local f17_local0 = nil
		FocusWeaponVariant( self, element, controller )
		return f17_local0
	end )
	variantList:registerEventHandler( "gain_focus", function ( element, event )
		local f18_local0 = nil
		if element.gainFocus then
			f18_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f18_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f18_local0
	end )
	variantList:registerEventHandler( "lose_focus", function ( element, event )
		local f19_local0 = nil
		if element.loseFocus then
			f19_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f19_local0 = element.super:loseFocus( event )
		end
		return f19_local0
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
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f24_local0 = nil
		SizeToSafeArea( element, controller )
		if not f24_local0 then
			f24_local0 = element:dispatchEventToChildren( event )
		end
		return f24_local0
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
	
	local weaponCategoryList = CoD.FE_TabBar.new( self, controller )
	weaponCategoryList:setLeftRight( true, true, 0, 1216 )
	weaponCategoryList:setTopBottom( true, false, 84, 127 )
	weaponCategoryList.Tabs.grid:setDataSource( "WeaponGroups" )
	weaponCategoryList.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	weaponCategoryList:registerEventHandler( "list_active_changed", function ( element, event )
		local f27_local0 = nil
		CAC_TabChanged( self, element, controller )
		return f27_local0
	end )
	weaponCategoryList:registerEventHandler( "menu_loaded", function ( element, event )
		local f28_local0 = nil
		ShowHeaderKickerAndIcon( self )
		if not f28_local0 then
			f28_local0 = element:dispatchEventToChildren( event )
		end
		return f28_local0
	end )
	self:addElement( weaponCategoryList )
	self.weaponCategoryList = weaponCategoryList
	
	local categoryName = LUI.UIText.new()
	categoryName:setLeftRight( true, false, 449, 705 )
	categoryName:setTopBottom( true, false, 113.5, 132.5 )
	categoryName:setRGB( 0.97, 0.32, 0.05 )
	categoryName:setText( Engine.Localize( LocalizeToUpperString( "MENU_VARIANT" ) ) )
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
		local variantNameBig = Engine.GetModelValue( model )
		if variantNameBig then
			selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( variantNameBig ) )
		end
	end )
	selectMenuWidget:linkToElementModel( weaponList, "weaponAttributes", false, function ( model )
		selectMenuWidget.selectionInfoWidget.WeaponAttributesInternal:setModel( model, controller )
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
				self:setupElementClipCounter( 7 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 368 )
				self.LeftPanel:setTopBottom( true, true, 78, -53 )
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
				self.attachmentList:setLeftRight( true, false, 391, 695 )
				self.attachmentList:setTopBottom( true, false, 183, 215 )
				self.attachmentList:setAlpha( 0 )
				self.clipFinished( attachmentList, {} )
				weaponCategoryList:completeAnimation()
				self.weaponCategoryList:setAlpha( 1 )
				self.clipFinished( weaponCategoryList, {} )
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( true, false, 391, 647 )
				self.categoryName:setTopBottom( true, false, 113.5, 132.5 )
				self.categoryName:setAlpha( 0 )
				self.clipFinished( categoryName, {} )
			end,
			ShowVariants = function ()
				self:setupElementClipCounter( 7 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 428 )
					LeftPanel:setTopBottom( true, true, 78, -53 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 368 )
				self.LeftPanel:setTopBottom( true, true, 78, -53 )
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
					categoryName:setLeftRight( true, false, 449, 705 )
					categoryName:setTopBottom( true, false, 113.5, 132.5 )
					categoryName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryName, event )
					else
						categoryName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( true, false, 391, 647 )
				self.categoryName:setTopBottom( true, false, 113.5, 132.5 )
				self.categoryName:setAlpha( 0 )
				categoryNameFrame2( categoryName, {} )
			end
		},
		ShowVariants = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, true, 78, -53 )
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
				self.attachmentList:setLeftRight( true, false, 449, 753 )
				self.attachmentList:setTopBottom( true, false, 183, 215 )
				self.attachmentList:setAlpha( 1 )
				self.clipFinished( attachmentList, {} )
				weaponCategoryList:completeAnimation()
				self.weaponCategoryList:setAlpha( 0 )
				self.clipFinished( weaponCategoryList, {} )
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( true, false, 449, 705 )
				self.categoryName:setTopBottom( true, false, 113.5, 132.5 )
				self.categoryName:setAlpha( 1 )
				self.clipFinished( categoryName, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 7 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 368 )
					LeftPanel:setTopBottom( true, true, 78, -53 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, true, 78, -53 )
				LeftPanelFrame2( LeftPanel, {} )
				local f45_local1 = function ( f47_arg0, f47_arg1 )
					if not f47_arg1.interrupted then
						f47_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					f47_arg0:setAlpha( 1 )
					if f47_arg1.interrupted then
						self.clipFinished( f47_arg0, f47_arg1 )
					else
						f47_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListPanel:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				CategoryListPanel:setAlpha( 0 )
				CategoryListPanel:registerEventHandler( "transition_complete_keyframe", f45_local1 )
				local f45_local2 = function ( f48_arg0, f48_arg1 )
					if not f48_arg1.interrupted then
						f48_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					f48_arg0:setAlpha( 1 )
					if f48_arg1.interrupted then
						self.clipFinished( f48_arg0, f48_arg1 )
					else
						f48_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				weaponList:setAlpha( 0 )
				weaponList:registerEventHandler( "transition_complete_keyframe", f45_local2 )
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
					local attachmentListFrame3 = function ( attachmentList, event )
						if not event.interrupted then
							attachmentList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						attachmentList:setLeftRight( true, false, 391, 695 )
						attachmentList:setTopBottom( true, false, 183, 215 )
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
						attachmentList:setLeftRight( true, false, 420, 724 )
						attachmentList:setAlpha( 0 )
						attachmentList:registerEventHandler( "transition_complete_keyframe", attachmentListFrame3 )
					end
				end
				
				attachmentList:completeAnimation()
				self.attachmentList:setLeftRight( true, false, 449, 753 )
				self.attachmentList:setTopBottom( true, false, 183, 215 )
				self.attachmentList:setAlpha( 1 )
				attachmentListFrame2( attachmentList, {} )
				local f45_local5 = function ( f53_arg0, f53_arg1 )
					if not f53_arg1.interrupted then
						f53_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					f53_arg0:setAlpha( 1 )
					if f53_arg1.interrupted then
						self.clipFinished( f53_arg0, f53_arg1 )
					else
						f53_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponCategoryList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				weaponCategoryList:setAlpha( 0 )
				weaponCategoryList:registerEventHandler( "transition_complete_keyframe", f45_local5 )
				local categoryNameFrame2 = function ( categoryName, event )
					if not event.interrupted then
						categoryName:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					categoryName:setLeftRight( true, false, 391, 647 )
					categoryName:setTopBottom( true, false, 113.5, 132.5 )
					categoryName:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( categoryName, event )
					else
						categoryName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( true, false, 449, 705 )
				self.categoryName:setTopBottom( true, false, 113.5, 132.5 )
				self.categoryName:setAlpha( 1 )
				categoryNameFrame2( categoryName, {} )
			end
		}
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "WGSV_Category" ), function ( model )
		local f55_local0 = self
		local f55_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "WGSV_Category"
		}
		CoD.Menu.UpdateButtonShownState( f55_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f56_local0 = nil
		SetGlobalModelValueArg( "WGSV_Category", CoD.WGSV_Category.WEAPON )
		CallCustomElementFunction_Self( self, "updateMode", self )
		ShowHeaderKickerAndIcon( self )
		if not f56_local0 then
			f56_local0 = self:dispatchEventToChildren( event )
		end
		return f56_local0
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FEMenuLeftGraphics:close()
		element.selectMenuWidget:close()
		element.weaponList:close()
		element.variantList:close()
		element.attachmentList:close()
		element.feFooterContainer:close()
		element.PregameTimerOverlay:close()
		element.weaponCategoryList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SecondaryWeaponSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

