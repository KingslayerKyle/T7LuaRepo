require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropContainer3x4" )
require( "ui.uieditor.widgets.CAC.Customization.CustomizationItem_ND" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropSymbols" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CAC.BlackMarketItemDescription" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.TabbedWidgets.WeaponGroupsTabWidget" )
require( "ui.uieditor.widgets.CAC.Customization.ChallengeProgressionInfo" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameLeft" )
require( "ui.uieditor.widgets.CAC.ModeIconName" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].customizationType = Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE
	self:setModel( CoD.perController[controller].gunsmithReticleIndexModel )
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg0.selectionList and f2_arg1.filterString then
		DataSources.GunsmithWeaponOptions.setCurrentFilterItem( "reticle" .. "_" .. f2_arg1.filterString )
		f2_arg0.selectionList:updateDataSource()
		f2_arg0.selectionList:setActiveItem( f2_arg0.selectionList:getItemAt( 1 ) )
	end
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	f3_arg0.tabChanged = f0_local1
	local f3_local0 = CoD.perController[f3_arg1].gunsmithVariantModel
	if f3_local0 then
		local f3_local1 = Engine.GetModel( f3_local0, "attachment1" )
		if f3_local1 then
			local f3_local2 = Engine.GetModelValue( f3_local1 )
			local f3_local3 = Engine.GetAttachmentRefByIndex( f3_local2 )
			local f3_local4 = CoD.GetCustomization( f3_arg1, "weapon_index" )
			CoD.GunsmithWeaponOptionsTable = {}
			CoD.GetWeaponOptionsTableForCategory( f3_arg1, CoD.GunsmithWeaponOptionsTable, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE, f3_local4, f3_local2, true )
			for f3_local8, f3_local9 in ipairs( CoD.GunsmithWeaponOptionsTable.reticle ) do
				local f3_local10 = Engine.GetModelValue( Engine.GetModel( f3_local9, "weaponOptionSubIndex" ) )
				local f3_local11 = Engine.GetModel( f3_local9, "name" )
				local f3_local12 = Engine.GetModel( f3_local9, "image" )
				local f3_local13 = Engine.GetModel( f3_local9, "isBMClassified" )
				if f3_local13 and not Engine.GetModelValue( f3_local13 ) then
					Engine.SetModelValue( f3_local11, "MPUI_RETICLE_" .. f3_local3 .. "_" .. f3_local10 )
					Engine.SetModelValue( f3_local12, f3_local3 .. "_" .. f3_local10 )
				end
			end
			f3_local5 = Engine.CurrentSessionMode()
			if f3_local5 == Enum.eModes.MODE_INVALID then
				f3_local5 = Enum.eModes.MODE_MULTIPLAYER
			end
			f3_local6 = "reticle"
			f3_local7 = CoD.WeaponOptionFilterToString( f3_local5 )
			f3_local8 = f3_arg0.categoryTabs.Tabs.grid:findItem( nil, {
				filterEnum = f3_local5
			}, false, nil )
			if f3_local8 then
				f3_arg0.categoryTabs.Tabs.grid:setActiveItem( f3_local8 )
			else
				f3_local9 = f3_arg0.categoryTabs.Tabs.grid:getItemAt( 2 )
				f3_arg0.categoryTabs.Tabs.grid:setActiveItem( f3_local9 )
				f3_local7 = CoD.WeaponOptionFilterToString( f3_local9.filterEnum )
			end
			for f3_local9 = Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_FIRST, Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_COUNT - 1, 1 do
				local f3_local13 = f3_arg0.categoryTabs.Tabs.grid:findItem( nil, {
					filterEnum = f3_local9
				}, false, nil )
				if f3_local13 and (f3_local3 ~= "ir" or f3_local9 ~= Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_EXTRAS) then
					local f3_local14 = f3_local13:getModel( f3_arg1, "breadcrumbCount" )
					local f3_local15 = CoD.CACUtility.GetWeaponOptionTypeForName( f3_local6 )
					if f3_local14 then
						local f3_local16 = 0
						if f3_local9 < Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MODE_COUNT then
							f3_local16 = Engine.WeaponOptionNewItemCount( f3_arg1, f3_local2, f3_local15, f3_local13.filterEnum )
						else
							f3_local16 = Engine.WeaponOptionNewModeAgnosticItemCount( f3_arg1, f3_local2, f3_local15, f3_local13.filterEnum )
						end
						Engine.SetModelValue( f3_local14, f3_local16 )
					end
				end
			end
			DataSources.GunsmithWeaponOptions.setCurrentFilterItem( f3_local6 .. "_" .. f3_local7 )
		end
	end
end

LUI.createMenu.GunsmithReticleSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithReticleSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithReticleSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 427 )
	LeftPanel:setTopBottom( true, false, 126, 720 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local GridItemButtonBackdropContainer3x4 = CoD.GridItemButtonBackdropContainer3x4.new( self, controller )
	GridItemButtonBackdropContainer3x4:setLeftRight( true, false, 99, 443 )
	GridItemButtonBackdropContainer3x4:setTopBottom( true, false, 145.5, 601.5 )
	GridItemButtonBackdropContainer3x4:setAlpha( 0 )
	self:addElement( GridItemButtonBackdropContainer3x4 )
	self.GridItemButtonBackdropContainer3x4 = GridItemButtonBackdropContainer3x4
	
	local selectionList = LUI.UIList.new( self, controller, 8, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 74.5, 414.5 )
	selectionList:setTopBottom( true, false, 137, 593 )
	selectionList:setWidgetType( CoD.CustomizationItem_ND )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 8 )
	selectionList:setDataSource( "GunsmithWeaponOptions" )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local f5_local0 = selectionList
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:linkToElementModel( selectionList, "isBMClassified", true, function ( model )
		local f6_local0 = selectionList
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:linkToElementModel( selectionList, "isChallengeClassified", true, function ( model )
		local f7_local0 = selectionList
		local f7_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isChallengeClassified"
		}
		CoD.Menu.UpdateButtonShownState( f7_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f8_local0 = nil
		if Gunsmith_IsReticleNew( self, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) and not IsSelfModelValueTrue( element, controller, "isChallengeClassified" ) then
			Gunsmith_SetWeaponOptionAsOld( self, element, controller )
			UpdateSelfElementState( self, element, controller )
			Gunsmith_FocusReticle( self, element, controller )
		else
			Gunsmith_FocusReticle( self, element, controller )
		end
		return f8_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsGunsmithItemWeaponOptionLocked( menu, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) and not IsSelfModelValueTrue( element, controller, "isChallengeClassified" ) then
			Gunsmith_SelectReticle( self, element, controller )
			GoBack( self, controller )
			ClearMenuSavedState( menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsGunsmithItemWeaponOptionLocked( menu, element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) and not IsSelfModelValueTrue( element, controller, "isChallengeClassified" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	selectionList:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return Gunsmith_IsReticleEquipped( menu, element, controller )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return Gunsmith_IsReticleNew( menu, element, controller )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsGunsmithItemWeaponOptionLocked( menu, element, controller )
			end
		}
	} )
	selectionList:linkToElementModel( selectionList, "isBMClassified", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "isChallengeClassified", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isChallengeClassified"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "isPackage", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPackage"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local GridItemButtonBackdropSymbols = CoD.GridItemButtonBackdropSymbols.new( self, controller )
	GridItemButtonBackdropSymbols:setLeftRight( true, false, 98, 1192.67 )
	GridItemButtonBackdropSymbols:setTopBottom( true, false, 144.5, 601.5 )
	GridItemButtonBackdropSymbols:setAlpha( 0 )
	GridItemButtonBackdropSymbols:setZoom( -7.02 )
	self:addElement( GridItemButtonBackdropSymbols )
	self.GridItemButtonBackdropSymbols = GridItemButtonBackdropSymbols
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 4.13, 72 )
	ElemsSideList:setTopBottom( true, false, -11, 659 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( self, controller )
	WeaponNameWidget0:setLeftRight( true, false, 449, 782 )
	WeaponNameWidget0:setTopBottom( true, false, 137, 171 )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	local itemDescription = CoD.BlackMarketItemDescription.new( self, controller )
	itemDescription:setLeftRight( true, false, 447, 831 )
	itemDescription:setTopBottom( true, false, 175, 197 )
	itemDescription.weaponDescTextBox:setText( LocalizeIntoString( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MPUI_RETICLE" ) )
	itemDescription:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		}
	} )
	itemDescription:linkToElementModel( itemDescription, "isBMClassified", true, function ( model )
		self:updateElementState( itemDescription, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:addElement( itemDescription )
	self.itemDescription = itemDescription
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	MenuFrame:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			MenuFrame.titleLabel:setText( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_RETICLE_SELECT_TITLE", "mp", controller, weaponIndex ) )
		end
	end )
	MenuFrame:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_RETICLE_SELECT_TITLE", "mp", controller, weaponIndex ) )
		end
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local categoryTabs = CoD.FE_TabBar.new( self, controller )
	categoryTabs:setLeftRight( true, false, 0, 2497 )
	categoryTabs:setTopBottom( true, false, 85, 126 )
	categoryTabs.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	categoryTabs.Tabs.grid:setHorizontalCount( 7 )
	categoryTabs.Tabs.grid:setDataSource( "CACCustomizationTabs" )
	categoryTabs:registerEventHandler( "list_active_changed", function ( element, event )
		local f24_local0 = nil
		CallCustomElementFunction_Self( self, "tabChanged", element, controller )
		return f24_local0
	end )
	self:addElement( categoryTabs )
	self.categoryTabs = categoryTabs
	
	local progressionInfo = CoD.ChallengeProgressionInfo.new( self, controller )
	progressionInfo:setLeftRight( true, false, 439, 859 )
	progressionInfo:setTopBottom( false, true, -162, -78 )
	progressionInfo.requirementTitle:setText( Engine.Localize( "MENU_RETICLE_REQUIREMENTS" ) )
	progressionInfo.completedTitle:setText( Engine.Localize( "MENU_RETICLE_COMPLETE" ) )
	progressionInfo:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return ShouldHideItemWeaponOptionInGunsmith( element, controller )
			end
		},
		{
			stateName = "bmComtracts",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return not IsGunsmithItemWeaponOptionLocked( menu, element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "unlockProgressAndTarget" )
			end
		}
	} )
	progressionInfo:linkToElementModel( progressionInfo, "itemIndex", true, function ( model )
		self:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	progressionInfo:linkToElementModel( progressionInfo, "unlockProgressAndTarget", true, function ( model )
		self:updateElementState( progressionInfo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "unlockProgressAndTarget"
		} )
	end )
	self:addElement( progressionInfo )
	self.progressionInfo = progressionInfo
	
	local CryptokeyTypeNameLeft = CoD.CryptokeyTypeNameLeft.new( self, controller )
	CryptokeyTypeNameLeft:setLeftRight( true, false, 439, 550 )
	CryptokeyTypeNameLeft:setTopBottom( false, true, -101, -79 )
	CryptokeyTypeNameLeft:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f31_local0 = AlwaysTrue()
				if f31_local0 then
					if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
						f31_local0 = IsSelfModelValueNonEmptyString( element, controller, "rarity" )
					else
						f31_local0 = false
					end
				end
				return f31_local0
			end
		}
	} )
	CryptokeyTypeNameLeft:linkToElementModel( CryptokeyTypeNameLeft, "isBMClassified", true, function ( model )
		self:updateElementState( CryptokeyTypeNameLeft, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	CryptokeyTypeNameLeft:linkToElementModel( CryptokeyTypeNameLeft, "rarity", true, function ( model )
		self:updateElementState( CryptokeyTypeNameLeft, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rarity"
		} )
	end )
	self:addElement( CryptokeyTypeNameLeft )
	self.CryptokeyTypeNameLeft = CryptokeyTypeNameLeft
	
	local ModeIconName = CoD.ModeIconName.new( self, controller )
	ModeIconName:setLeftRight( true, false, 891, 1181 )
	ModeIconName:setTopBottom( false, true, -162, -111 )
	self:addElement( ModeIconName )
	self.ModeIconName = ModeIconName
	
	local f4_local15 = nil
	if IsPC() then
		f4_local15 = CoD.XCamMouseControl.new( self, controller )
	else
		f4_local15 = LUI.UIElement.createFake()
	end
	f4_local15:setLeftRight( true, false, 449, 1216 )
	f4_local15:setTopBottom( true, false, 200, 546 )
	if IsPC() then
		self:addElement( f4_local15 )
	end
	self.XCamMouseControl = f4_local15
	WeaponNameWidget0:linkToElementModel( selectionList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( name ) )
		end
	end )
	itemDescription:linkToElementModel( selectionList, nil, false, function ( model )
		itemDescription:setModel( model, controller )
	end )
	progressionInfo:linkToElementModel( selectionList, nil, false, function ( model )
		progressionInfo:setModel( model, controller )
	end )
	CryptokeyTypeNameLeft:linkToElementModel( selectionList, "rarityType", false, function ( model )
		CryptokeyTypeNameLeft:setModel( model, controller )
	end )
	ModeIconName:linkToElementModel( selectionList, nil, false, function ( model )
		ModeIconName:setModel( model, controller )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f39_local0 = nil
		ShowHeaderKickerAndIcon( self )
		if not f39_local0 then
			f39_local0 = self:dispatchEventToChildren( event )
		end
		return f39_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		SetPerControllerTableProperty( controller, "customizationType", nil )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if CACShowRotatePrompt( self, element, controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CACShowRotatePrompt( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
			return true
		else
			return false
		end
	end, false )
	selectionList.id = "selectionList"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.GridItemButtonBackdropContainer3x4:close()
		element.selectionList:close()
		element.GridItemButtonBackdropSymbols:close()
		element.ElemsSideList:close()
		element.WeaponNameWidget0:close()
		element.itemDescription:close()
		element.MenuFrame:close()
		element.categoryTabs:close()
		element.progressionInfo:close()
		element.CryptokeyTypeNameLeft:close()
		element.ModeIconName:close()
		element.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithReticleSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

