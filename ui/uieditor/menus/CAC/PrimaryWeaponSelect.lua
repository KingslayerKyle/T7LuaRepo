-- 72ad01227c27963fbaecf5fb3683995b
-- This hash is used for caching, delete to decompile the file again

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
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PreLoadFunc = function ( self, controller )
	if IsCampaign() then
		self.disableBlur = true
	end
	self:setModel( CoD.perController[controller].classModel )
	DataSources.Unlockables.setCurrentFilterItem( "primary" )
	self.performingSetup = true
	self.restoreState = function ( f2_arg0 )
		local f2_local0 = f2_arg0:getModel()
		local f2_local1 = CoD.perController[controller].weaponCategory
		local f2_local2 = CoD.CACUtility.PrimaryWeaponGroupNames
		local f2_local3 = Engine.GetModelValue( f2_arg0:getModel( controller, f2_local1 .. ".itemIndex" ) )
		f2_arg0.lastSelectionTable = {}
		for f2_local7, f2_local8 in ipairs( f2_local2 ) do
			f2_arg0.lastSelectionTable[f2_local8.weapon_category] = 1
		end
		f2_local4 = f2_arg0.weaponList:findItem( {
			itemIndex = f2_local3
		}, nil, false, false )
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
				}, nil, false, false )
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

local f0_local1 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = f3_arg2:getModel( f3_arg1, "weaponAttributes" )
	if f3_local0 then
		f3_arg0.selectMenuWidget.selectionInfoWidget.WeaponAttributesInternal:setModel( f3_local0, f3_arg1 )
	end
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		f4_arg0.weaponCategoryList.Tabs.grid:setDataSource( "GunsmithWeaponTabType" )
		f4_arg0.selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ) )
	end
	f4_arg0.selectMenuWidget:linkToElementModel( f4_arg0.variantList, "weaponAttributes", false, function ( model )
		f4_arg0.selectMenuWidget.selectionInfoWidget.WeaponAttributesInternal:setModel( model, f4_arg1 )
	end )
	f4_arg0.updateMode = function ( f6_arg0, f6_arg1 )
		f6_arg0.currentMode = Engine.GetModelValue( DataSources.WGSV_Category )
		if f6_arg0.currentMode == CoD.WGSV_Category.WEAPON then
			f6_arg0.weaponCategoryList.Tabs.m_disableNavigation = false
			CoD.CACUtility.WeaponSelectFocusOnLastSelectedCategory( f6_arg0, f6_arg1, f4_arg1 )
			CoD.SwapFocusableElements( f4_arg1, f6_arg0.variantList, f6_arg0.weaponList )
			f0_local1( f6_arg0, f4_arg1, f6_arg0.weaponList )
			f6_arg0:setState( "DefaultState" )
		elseif f6_arg0.currentMode == CoD.WGSV_Category.GUNSMITH_VARIANT then
			f6_arg0.weaponCategoryList.Tabs.m_disableNavigation = true
			f6_arg0.variantList:updateDataSource()
			CoD.SwapFocusableElements( f4_arg1, f6_arg0.weaponList, f6_arg0.variantList )
			f0_local1( f6_arg0, f4_arg1, f6_arg0.variantList )
			CoD.CACUtility.WeaponSelectFocusOnLastSelectedWeapon( f6_arg0, f4_arg1 )
			f6_arg0:setState( "ShowVariants" )
		end
	end
	
end

LUI.createMenu.PrimaryWeaponSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PrimaryWeaponSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_PrimaryWeapon"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PrimaryWeaponSelect.buttonPrompts" )
	local f7_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f7_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 368 )
	LeftPanel:setTopBottom( true, true, 78, 24 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( true, true, 0, 0 )
	CategoryListPanel:setTopBottom( true, false, 86, 125 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f7_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, true, 86, -16.75 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local selectMenuWidget = CoD.SelectMenuWidgetNew.new( f7_local1, controller )
	selectMenuWidget:setLeftRight( true, true, 0, 0 )
	selectMenuWidget:setTopBottom( true, true, 0, 0 )
	selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
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
		f7_local1:updateElementState( selectMenuWidget, {
			name = "model_validation",
			menu = f7_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "WGSV_Category"
		} )
	end )
	self:addElement( selectMenuWidget )
	self.selectMenuWidget = selectMenuWidget
	
	local weaponList = LUI.UIList.new( f7_local1, controller, 7, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( true, false, 77, 357 )
	weaponList:setTopBottom( true, false, 136, 633 )
	weaponList:setWidgetType( CoD.WeaponItemListButtonNew )
	weaponList:setVerticalCount( 7 )
	weaponList:setSpacing( 7 )
	weaponList:setDataSource( "Unlockables" )
	weaponList:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local f11_local0 = weaponList
		local f11_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f11_local0, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f11_local0, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	weaponList:linkToElementModel( weaponList, "isBMClassified", true, function ( model )
		local f12_local0 = weaponList
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	weaponList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f13_local0 = nil
		if IsCACItemNew( element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			SetCACWeaponAsOld( self, element, controller )
			UpdateSelfElementState( f7_local1, element, controller )
			FocusWeapon( self, element, controller )
		else
			FocusWeapon( self, element, controller )
		end
		return f13_local0
	end )
	weaponList:registerEventHandler( "used_permanent_unlock_token", function ( element, event )
		local f14_local0 = nil
		FocusWeapon( self, element, controller )
		if not f14_local0 then
			f14_local0 = element:dispatchEventToChildren( event )
		end
		return f14_local0
	end )
	weaponList:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f15_local0
	end )
	weaponList:registerEventHandler( "lose_focus", function ( element, event )
		local f16_local0 = nil
		if element.loseFocus then
			f16_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f16_local0 = element.super:loseFocus( event )
		end
		return f16_local0
	end )
	f7_local1:AddButtonCallbackFunction( weaponList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		if not IsCACItemLocked( f17_arg1, f17_arg0, f17_arg2 ) and not IsCACItemPurchased( f17_arg0, f17_arg2 ) and not IsCACHaveTokens( f17_arg2 ) and not IsInPermanentUnlockMenu( f17_arg2 ) and not IsSelfModelValueTrue( f17_arg0, f17_arg2, "isBMClassified" ) then
			SetUnlockConfirmationInfo( f17_arg0, f17_arg2 )
			OpenPopup( self, "OutOfUnlockTokens", f17_arg2, "", "" )
			return true
		elseif not IsCACItemLocked( f17_arg1, f17_arg0, f17_arg2 ) and not IsCACItemPurchased( f17_arg0, f17_arg2 ) and IsCACHaveTokens( f17_arg2 ) and not IsInPermanentUnlockMenu( f17_arg2 ) and not IsSelfModelValueTrue( f17_arg0, f17_arg2, "isBMClassified" ) then
			OpenUnlockClassItemDialog( f17_arg1, f17_arg0, f17_arg2 )
			return true
		elseif not IsCACItemLocked( f17_arg1, f17_arg0, f17_arg2 ) and IsCACItemPurchased( f17_arg0, f17_arg2 ) and IsCACWeaponVariantAvailable( f17_arg0, f17_arg2 ) and not IsInPermanentUnlockMenu( f17_arg2 ) and not IsSelfModelValueTrue( f17_arg0, f17_arg2, "isBMClassified" ) then
			SetGlobalModelValueArg( "WGSV_Category", CoD.WGSV_Category.GUNSMITH_VARIANT )
			CallCustomElementFunction_Self( self, "updateMode", f17_arg0 )
			return true
		elseif not IsCACItemLocked( f17_arg1, f17_arg0, f17_arg2 ) and IsCACItemPurchased( f17_arg0, f17_arg2 ) and not IsCACWeaponVariantAvailable( f17_arg0, f17_arg2 ) and not IsInPermanentUnlockMenu( f17_arg2 ) and not IsSelfModelValueTrue( f17_arg0, f17_arg2, "isBMClassified" ) then
			SetClassItem( self, f17_arg0, f17_arg2 )
			return true
		elseif IsInPermanentUnlockMenu( f17_arg2 ) and not IsPermanentlyUnlocked( f17_arg0, f17_arg2 ) and HavePermanentUnlockTokens( f17_arg2 ) and not IsSelfModelValueTrue( f17_arg0, f17_arg2, "isBMClassified" ) then
			OpenPermanentUnlockClassItemDialog( f17_arg1, f17_arg0, f17_arg2 )
			return true
		else
			
		end
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		if not IsCACItemLocked( f18_arg1, f18_arg0, f18_arg2 ) and not IsCACItemPurchased( f18_arg0, f18_arg2 ) and not IsCACHaveTokens( f18_arg2 ) and not IsInPermanentUnlockMenu( f18_arg2 ) and not IsSelfModelValueTrue( f18_arg0, f18_arg2, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsCACItemLocked( f18_arg1, f18_arg0, f18_arg2 ) and not IsCACItemPurchased( f18_arg0, f18_arg2 ) and IsCACHaveTokens( f18_arg2 ) and not IsInPermanentUnlockMenu( f18_arg2 ) and not IsSelfModelValueTrue( f18_arg0, f18_arg2, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsCACItemLocked( f18_arg1, f18_arg0, f18_arg2 ) and IsCACItemPurchased( f18_arg0, f18_arg2 ) and IsCACWeaponVariantAvailable( f18_arg0, f18_arg2 ) and not IsInPermanentUnlockMenu( f18_arg2 ) and not IsSelfModelValueTrue( f18_arg0, f18_arg2, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsCACItemLocked( f18_arg1, f18_arg0, f18_arg2 ) and IsCACItemPurchased( f18_arg0, f18_arg2 ) and not IsCACWeaponVariantAvailable( f18_arg0, f18_arg2 ) and not IsInPermanentUnlockMenu( f18_arg2 ) and not IsSelfModelValueTrue( f18_arg0, f18_arg2, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif IsInPermanentUnlockMenu( f18_arg2 ) and not IsPermanentlyUnlocked( f18_arg0, f18_arg2 ) and HavePermanentUnlockTokens( f18_arg2 ) and not IsSelfModelValueTrue( f18_arg0, f18_arg2, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	f7_local1:AddButtonCallbackFunction( weaponList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if CanPrestigeWeapon( f19_arg0, f19_arg2 ) then
			PrestigeWeapon( f19_arg1, f19_arg0, f19_arg2 )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if CanPrestigeWeapon( f20_arg0, f20_arg2 ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	local variantList = LUI.UIList.new( f7_local1, controller, 7, 0, nil, true, false, 0, 0, false, false )
	variantList:makeFocusable()
	variantList:setLeftRight( true, false, 77, 415 )
	variantList:setTopBottom( true, false, 136, 589 )
	variantList:setAlpha( 0 )
	variantList:setWidgetType( CoD.GridItemVariantButton )
	variantList:setHorizontalCount( 3 )
	variantList:setVerticalCount( 4 )
	variantList:setSpacing( 7 )
	variantList:setDataSource( "WeaponVariantList" )
	variantList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f21_local0 = nil
		FocusWeaponVariant( self, element, controller )
		return f21_local0
	end )
	variantList:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
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
	f7_local1:AddButtonCallbackFunction( variantList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		SetWeaponVariant( self, f24_arg0, f24_arg2 )
		return true
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f7_local1:AddButtonCallbackFunction( variantList, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		SetGlobalModelValueArg( "WGSV_Category", CoD.WGSV_Category.WEAPON )
		CallCustomElementFunction_Self( self, "updateMode", f26_arg0 )
		return true
	end, function ( f27_arg0, f27_arg1, f27_arg2 )
		CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:addElement( variantList )
	self.variantList = variantList
	
	local attachmentList = LUI.UIList.new( f7_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	attachmentList:makeFocusable()
	attachmentList:setLeftRight( true, false, 449, 753 )
	attachmentList:setTopBottom( true, false, 183, 215 )
	attachmentList:setAlpha( 0 )
	attachmentList:setWidgetType( CoD.WeaponVariantIcon )
	attachmentList:setHorizontalCount( 9 )
	self:addElement( attachmentList )
	self.attachmentList = attachmentList
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( f7_local1, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f28_local0 = nil
		SizeToSafeArea( element, controller )
		if not f28_local0 then
			f28_local0 = element:dispatchEventToChildren( event )
		end
		return f28_local0
	end )
	feFooterContainer:mergeStateConditions( {
		{
			stateName = "WithHeroesHead",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( f7_local1, controller )
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
		f7_local1:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = f7_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local weaponCategoryList = CoD.FE_TabBar.new( f7_local1, controller )
	weaponCategoryList:setLeftRight( true, true, 0, 1280 )
	weaponCategoryList:setTopBottom( true, false, 85, 126 )
	weaponCategoryList.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	weaponCategoryList.Tabs.grid:setHorizontalCount( 8 )
	weaponCategoryList.Tabs.grid:setDataSource( "WeaponGroups" )
	weaponCategoryList:registerEventHandler( "list_active_changed", function ( element, event )
		local f32_local0 = nil
		CAC_TabChanged( self, element, controller )
		return f32_local0
	end )
	self:addElement( weaponCategoryList )
	self.weaponCategoryList = weaponCategoryList
	
	local categoryName = LUI.UIText.new()
	categoryName:setLeftRight( true, false, 391, 647 )
	categoryName:setTopBottom( true, false, 113.5, 132.5 )
	categoryName:setRGB( 0.97, 0.32, 0.05 )
	categoryName:setAlpha( 0 )
	categoryName:setText( LocalizeToUpperString( "MENU_VARIANT" ) )
	categoryName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	categoryName:setLetterSpacing( 1 )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local weaponListCounter = CoD.verticalCounter.new( f7_local1, controller )
	weaponListCounter:setLeftRight( true, false, 116, 316 )
	weaponListCounter:setTopBottom( true, false, 631.5, 656.5 )
	weaponListCounter:registerEventHandler( "menu_loaded", function ( element, event )
		local f33_local0 = nil
		SetAsListVerticalCounter( self, element, "weaponList" )
		if not f33_local0 then
			f33_local0 = element:dispatchEventToChildren( event )
		end
		return f33_local0
	end )
	self:addElement( weaponListCounter )
	self.weaponListCounter = weaponListCounter
	
	selectMenuWidget:linkToElementModel( weaponList, nil, false, function ( model )
		selectMenuWidget:setModel( model, controller )
	end )
	selectMenuWidget:linkToElementModel( variantList, "variantNameBig", true, function ( model )
		local variantNameBig = Engine.GetModelValue( model )
		if variantNameBig then
			selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.variantName.itemName:setText( variantNameBig )
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
				self:setupElementClipCounter( 8 )
				CategoryListPanel:completeAnimation()
				self.CategoryListPanel:setAlpha( 1 )
				self.clipFinished( CategoryListPanel, {} )
				selectMenuWidget:completeAnimation()
				selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				self.clipFinished( selectMenuWidget, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 1 )
				self.clipFinished( weaponList, {} )
				variantList:completeAnimation()
				self.variantList:setLeftRight( true, false, -274, 64 )
				self.variantList:setTopBottom( true, false, 136, 589 )
				self.variantList:setAlpha( 0 )
				self.clipFinished( variantList, {} )
				attachmentList:completeAnimation()
				self.attachmentList:setLeftRight( true, false, 449, 753 )
				self.attachmentList:setTopBottom( true, false, 183, 215 )
				self.attachmentList:setAlpha( 0 )
				self.clipFinished( attachmentList, {} )
				weaponCategoryList:completeAnimation()
				self.weaponCategoryList:setAlpha( 1 )
				self.clipFinished( weaponCategoryList, {} )
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( true, false, 391, 647 )
				self.categoryName:setTopBottom( true, false, 113.5, 132.5 )
				self.clipFinished( categoryName, {} )
				weaponListCounter:completeAnimation()
				self.weaponListCounter:setAlpha( 1 )
				self.clipFinished( weaponListCounter, {} )
			end,
			ShowVariants = function ()
				self:setupElementClipCounter( 8 )
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
				local weaponListCounterFrame2 = function ( weaponListCounter, event )
					if not event.interrupted then
						weaponListCounter:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					weaponListCounter:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weaponListCounter, event )
					else
						weaponListCounter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponListCounter:completeAnimation()
				self.weaponListCounter:setAlpha( 1 )
				weaponListCounterFrame2( weaponListCounter, {} )
			end
		},
		ShowVariants = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
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
				weaponListCounter:completeAnimation()
				self.weaponListCounter:setAlpha( 0 )
				self.clipFinished( weaponListCounter, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 8 )
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
				local f51_local1 = function ( f53_arg0, f53_arg1 )
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
				
				CategoryListPanel:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				CategoryListPanel:setAlpha( 0 )
				CategoryListPanel:registerEventHandler( "transition_complete_keyframe", f51_local1 )
				local f51_local2 = function ( f54_arg0, f54_arg1 )
					if not f54_arg1.interrupted then
						f54_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					f54_arg0:setAlpha( 1 )
					if f54_arg1.interrupted then
						self.clipFinished( f54_arg0, f54_arg1 )
					else
						f54_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				weaponList:setAlpha( 0 )
				weaponList:registerEventHandler( "transition_complete_keyframe", f51_local2 )
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
						attachmentList:setAlpha( 0 )
						attachmentList:registerEventHandler( "transition_complete_keyframe", attachmentListFrame3 )
					end
				end
				
				attachmentList:completeAnimation()
				self.attachmentList:setLeftRight( true, false, 391, 695 )
				self.attachmentList:setTopBottom( true, false, 183, 215 )
				self.attachmentList:setAlpha( 1 )
				attachmentListFrame2( attachmentList, {} )
				local f51_local5 = function ( f59_arg0, f59_arg1 )
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
				
				weaponCategoryList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				weaponCategoryList:setAlpha( 0 )
				weaponCategoryList:registerEventHandler( "transition_complete_keyframe", f51_local5 )
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
				local f51_local7 = function ( f61_arg0, f61_arg1 )
					if not f61_arg1.interrupted then
						f61_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					f61_arg0:setAlpha( 1 )
					if f61_arg1.interrupted then
						self.clipFinished( f61_arg0, f61_arg1 )
					else
						f61_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponListCounter:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				weaponListCounter:setAlpha( 0 )
				weaponListCounter:registerEventHandler( "transition_complete_keyframe", f51_local7 )
			end
		}
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "WGSV_Category" ), function ( model )
		local f62_local0 = self
		local f62_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "WGSV_Category"
		}
		CoD.Menu.UpdateButtonShownState( f62_local0, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( f7_local1, self, controller )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f63_local0 = nil
		SetGlobalModelValueArg( "WGSV_Category", CoD.WGSV_Category.WEAPON )
		CallCustomElementFunction_Self( self, "updateMode", element )
		if not f63_local0 then
			f63_local0 = element:dispatchEventToChildren( event )
		end
		return f63_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f64_local0 = nil
		ShowHeaderKickerAndIcon( f7_local1 )
		if not f64_local0 then
			f64_local0 = element:dispatchEventToChildren( event )
		end
		return f64_local0
	end )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f65_arg0, f65_arg1, f65_arg2, f65_arg3 )
		if IsGlobalModelValueEqualTo( f65_arg0, f65_arg2, "WGSV_Category", CoD.WGSV_Category.WEAPON ) then
			GoBack( self, f65_arg2 )
			PlaySoundSetSound( self, "menu_no_selection" )
			return true
		else
			return true
		end
	end, function ( f66_arg0, f66_arg1, f66_arg2 )
		CoD.Menu.SetButtonLabel( f66_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3 )
		if CACShowRotatePrompt( self, f67_arg0, f67_arg2 ) then
			return true
		else
			
		end
	end, function ( f68_arg0, f68_arg1, f68_arg2 )
		if CACShowRotatePrompt( self, f68_arg0, f68_arg2 ) then
			CoD.Menu.SetButtonLabel( f68_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
			return true
		else
			return false
		end
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
		menu = f7_local1
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
		element.weaponListCounter:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PrimaryWeaponSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

