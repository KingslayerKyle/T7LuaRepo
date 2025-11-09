require( "ui.uieditor.widgets.GameSettings.GameSettings_OptionsButton" )
require( "ui.uieditor.widgets.Footer.fe_footerRighSlideIn" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = f1_arg3.input
	local f1_local1 = CoD.perController[f1_arg2].classNum
	if f1_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_CUSTOM_CLASS then
		if f1_local0 ~= nil then
			local f1_local2 = CoD.CACUtility.GetLoadoutNameFromIndex( f1_arg2, f1_local1 )
			f1_local2:set( f1_local0 )
		end
		GoBack( f1_arg0, f1_arg2 )
		CoD.CACUtility.UpdateAllClasses( f1_arg2 )
	elseif f1_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_CLASS_SET then
		if f1_local0 ~= nil then
			Engine.SetClassSetName( f1_arg2, Engine.GetCurrentClassSetIndex( f1_arg2 ), f1_local0 )
		end
		local f1_local2 = GoBack( f1_arg0, f1_arg2 )
		f1_local2:dispatchEventToChildren( {
			name = "class_set_name_change",
			controller = f1_arg2
		} )
	end
end

local PreLoadFunc = function ( self, controller )
	if not Engine.IsSplitscreen() then
		self.animateInFromOffset = 340
	end
	self:setModel( CoD.perController[controller].classModel )
	self.handleKeyboardComplete = f0_local0
end

CoD.OverlayUtility.AddSystemOverlay( "CopyClass", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_ClassOptionsFrame",
	title = Engine.Localize( "MPUI_COPY_CUSTOM_CLASS_TITLE_CAPS" ),
	description = function ( f3_arg0 )
		local f3_local0 = ""
		DataSources.CustomClassMenu.getModel( f3_arg0 )
		local f3_local1 = Engine.GetModel( Engine.GetModelForController( f3_arg0 ), "CustomClassMenu" )
		if f3_local1 then
			f3_local0 = CoD.SafeGetModelValue( f3_local1, "currentClassName" ) or ""
		end
		return Engine.Localize( "MPUI_COPY_CUSTOM_CLASS_DESC", f3_local0 )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = "ChooseClassList",
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
	[CoD.OverlayUtility.ProcessActionPropertyName] = function ()
		return function ( f5_arg0, f5_arg1, f5_arg2 )
			ClassOptionsCopyLoadout( f5_arg0, f5_arg1, f5_arg2 )
		end
		
	end
} )
CoD.OverlayUtility.AddSystemOverlay( "ResetToDefault", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_ClassOptionsFrame",
	title = Engine.Localize( "MENU_WHICH_DEFAULT_CLASS_TITLE_CAPS" ),
	description = function ( f6_arg0 )
		local f6_local0 = ""
		DataSources.CustomClassMenu.getModel( f6_arg0 )
		local f6_local1 = Engine.GetModel( Engine.GetModelForController( f6_arg0 ), "CustomClassMenu" )
		if f6_local1 then
			f6_local0 = CoD.SafeGetModelValue( f6_local1, "currentClassName" ) or ""
		end
		return Engine.Localize( "MENU_WHICH_DEFAULT_CLASS_DESC", f6_local0 )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = "ResetDefaultClass",
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
	[CoD.OverlayUtility.ProcessActionPropertyName] = function ()
		return function ( f8_arg0, f8_arg1, f8_arg2 )
			ClassOptionsResetToDefault( f8_arg0, f8_arg1, f8_arg2 )
		end
		
	end
} )
CoD.OverlayUtility.AddSystemOverlay( "CopyClassSet", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_ClassOptionsFrame",
	title = Engine.Localize( "MPUI_COPY_CUSTOM_CLASS_SET_TITLE_CAPS" ),
	description = Engine.Localize( "MPUI_COPY_CUSTOM_CLASS_SET_DESC" ),
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = "ClassSetTabs",
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
	[CoD.OverlayUtility.ProcessActionPropertyName] = function ()
		return function ( f10_arg0, f10_arg1, f10_arg2 )
			ClassOptionsCopyClassSet( f10_arg0, f10_arg1, f10_arg2 )
		end
		
	end
} )
local f0_local2 = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
	OpenCodPointsStore( f11_arg0, f11_arg1, f11_arg2, "ExtraSlotsCPStore", f11_arg4 )
end

CoD.OverlayUtility.AddSystemOverlay( "PurchaseExtraSlotsConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_ExtraSlots",
	title = function ( f12_arg0, f12_arg1 )
		if f12_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f12_arg0 ) < f12_arg1.itemCODPointCost then
			return "MPUI_BM_NO_CURRENCY"
		else
			return Engine.ToUpper( Engine.Localize( "ZMUI_CONFIRM_TRADE" ) )
		end
	end,
	description = function ( f13_arg0, f13_arg1 )
		if f13_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f13_arg0 ) < f13_arg1.itemCODPointCost then
			return Engine.Localize( "MPUI_BM_NO_CODPOINTS_DESCRIPTION", f13_arg1.displayText )
		else
			return Engine.Localize( "MPUI_BM_CODPOINTS_PURCHASE_CONFIRMATION_TEXT", f13_arg1.displayText )
		end
	end,
	codpointcost = function ( f14_arg0, f14_arg1 )
		return f14_arg1.itemCODPointCost
	end,
	codpointcostString = function ( f15_arg0, f15_arg1 )
		if f15_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f15_arg0 ) < f15_arg1.itemCODPointCost then
			return Engine.Localize( "MENU_CODPOINT_COST", f15_arg1.itemCODPointCost )
		else
			return ""
		end
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( f16_arg0, f16_arg1 )
		DataSources.PurchaseExtraSlotsMenuList = DataSourceHelpers.ListSetup( "PurchaseExtraSlotsMenuList", function ( f17_arg0, f17_arg1 )
			local f17_local0 = {}
			if f17_arg1.purchasingExtraSlots then
				return {}
			end
			local f17_local1 = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
				return {
					models = {
						displayText = f18_arg0,
						disabled = f18_arg3
					},
					properties = {
						action = f18_arg1,
						actionParam = f16_arg1,
						selectIndex = f18_arg2
					}
				}
			end
			
			local f17_local2 = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4 )
				if not DoesPlayerHaveExtraSlotsItem( f19_arg2 ) then
					local f19_local0 = tonumber( CoD.StoreUtility.GetInventoryItemValueByItemName( CoD.StoreUtility.ExtraSlotsProductDesc, CoD.StoreUtility.InventoryItems.itemIdColumn ) )
					if f19_local0 == 0 or not Engine.PurchaseDWSKU( f19_arg2, f19_local0 ) then
						LuaUtils.UI_ShowErrorMessageDialog( f19_arg2, "MENU_EXTRASLOTS_PURCHASE_FAILED", "" )
						GoBack( f19_arg4, f19_arg2 )
						return 
					end
					f19_arg0:setState( "Purchasing" )
					f19_arg0.PurchasingWidget:playClip( "StartPurchasing" )
					f19_arg0.PurchasingWidget.nextClip = "Purchasing"
					f17_arg1.purchasingExtraSlots = true
					f17_arg1:updateDataSource()
					f19_arg4[CoD.OverlayUtility.GoBackPropertyName] = nil
					f17_arg1.disabled = true
					CoD.Menu.UpdateAllButtonPrompts( f19_arg4, f19_arg2 )
					f19_arg0.PurchasingWidget:registerEventHandler( "clip_over", function ( element, event )
						if Engine.IsInventoryBusy( f19_arg2 ) or Engine.GetPurchaseDWSKUResult( f19_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
							LUI.UIElement.clipOver( element, event )
						else
							element:playClip( "StopPurchasing" )
							element:registerEventHandler( "clip_over", function ( element, event )
								element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
								f19_arg0:setState( "DefaultState" )
								if Engine.GetPurchaseDWSKUResult( f19_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_SUCCESS then
									CoD.OverlayUtility.CreateOverlay( f19_arg2, GoBack( f19_arg4, f19_arg2 ), "PurchaseExtraSlotsComplete", f19_arg2 )
									LUI.CoDMetrics.InventoryItemPurchased( f19_arg2, f19_arg3.productDesc, f19_arg3.purchaseSource, f19_arg3.itemCODPointCost )
								else
									LuaUtils.UI_ShowErrorMessageDialog( f19_arg2, "MENU_EXTRASLOTS_PURCHASE_FAILED", "" )
									GoBack( f19_arg4, f19_arg2 )
								end
							end )
						end
					end )
				end
			end
			
			local f17_local3 = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
				GoBack( f22_arg4, f22_arg2 )
			end
			
			if f16_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f17_arg0 ) < f16_arg1.itemCODPointCost then
				table.insert( f17_local0, f17_local1( "MPUI_PURCHASE_CODPOINTS_CAPS", f0_local2, true, false ) )
			elseif f16_arg1.itemCODPointCost > 0 then
				table.insert( f17_local0, f17_local1( Engine.Localize( "MPUI_BM_TRADE_COD_POINTS", tonumber( CoD.StoreUtility.GetInventoryItemValueByItemName( CoD.StoreUtility.ExtraSlotsProductDesc, CoD.StoreUtility.InventoryItems.costColumn ) ) ), f17_local2, true, false ) )
			end
			table.insert( f17_local0, f17_local1( "MENU_CANCEL_CAPS", f17_local3, false, false ) )
			return f17_local0
		end, true )
		return "PurchaseExtraSlotsMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PurchaseExtraSlotsComplete", {
	menuName = "SystemOverlay_Compact",
	frameWidget = "CoD.SystemOverlay_ExtraSlotsPurchased",
	title = function ( f23_arg0, f23_arg1 )
		return Engine.Localize( "MENU_CONGRATULATIONS_CAPS" )
	end,
	description = function ( f24_arg0, f24_arg1 )
		return Engine.Localize( "MENU_EXTRASLOTS_PURCHASE_COMPLETE_DESC" )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	image = "uie_t7_icon_unlock_generic_square_overlays",
	listDatasource = function ( f25_arg0, f25_arg1 )
		DataSources.PurchaseExtraSlotsCompleteMenuList = DataSourceHelpers.ListSetup( "PurchaseExtraSlotsCompleteMenuList", function ( f26_arg0 )
			local f26_local0 = {}
			local f26_local1 = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
				return {
					models = {
						displayText = f27_arg0,
						disabled = f27_arg3
					},
					properties = {
						action = f27_arg1,
						actionParam = f25_arg1,
						selectIndex = f27_arg2
					}
				}
			end
			
			table.insert( f26_local0, f26_local1( "MENU_OK", function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3, f28_arg4 )
				local f28_local0 = Engine.GetModel( Engine.GetModelForController( f28_arg2 ), "classSetsUpdated" )
				if f28_local0 then
					Engine.ForceNotifyModelSubscriptions( f28_local0 )
				end
				CoD.FileshareUtility.SetDirty()
				MediaManagerMarkDirty( f28_arg2 )
				GoBack( f28_arg4, f28_arg2 )
			end, true, false ) )
			return f26_local0
		end, true )
		return "PurchaseExtraSlotsCompleteMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = function ()
		return function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3 )
			local f30_local0 = Engine.GetModel( Engine.GetModelForController( f30_arg2 ), "classSetsUpdated" )
			if f30_local0 then
				Engine.ForceNotifyModelSubscriptions( f30_local0 )
			end
			GoBack( f30_arg3, f30_arg2 )
		end
		
	end
} )
CoD.OverlayUtility.AddSystemOverlay( "PurchaseInventoryItemComplete", {
	menuName = "SystemOverlay_Compact",
	frameWidget = "CoD.SystemOverlay_ExtraSlotsPurchased",
	title = function ( f31_arg0, f31_arg1 )
		return Engine.Localize( "MENU_CONGRATULATIONS_CAPS" )
	end,
	description = function ( f32_arg0, f32_arg1 )
		return Engine.Localize( "MENU_PURCHASE_COMPLETE", f32_arg1.itemName )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	image = function ( f33_arg0, f33_arg1 )
		return f33_arg1.image
	end,
	listDatasource = function ( f34_arg0, f34_arg1 )
		DataSources.PurchaseInventoryItemCompleteMenuList = DataSourceHelpers.ListSetup( "PurchaseInventoryItemCompleteMenuList", function ( f35_arg0 )
			local f35_local0 = {}
			local f35_local1 = function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
				return {
					models = {
						displayText = f36_arg0,
						disabled = f36_arg3
					},
					properties = {
						action = f36_arg1,
						actionParam = f34_arg1,
						selectIndex = f36_arg2
					}
				}
			end
			
			table.insert( f35_local0, f35_local1( "MENU_OK", function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3, f37_arg4 )
				ForceNotifyControllerModel( f37_arg2, "StoreRoot.ready" )
				GoBack( f37_arg4, f37_arg2 )
			end, true, false ) )
			return f35_local0
		end, true )
		return "PurchaseInventoryItemCompleteMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = function ()
		return function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
			ForceNotifyControllerModel( f39_arg2, "StoreRoot.ready" )
			GoBack( f39_arg3, f39_arg2 )
		end
		
	end
} )
local f0_local3 = function ( f40_arg0 )
	local f40_local0 = {}
	local f40_local1 = function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3, f41_arg4 )
		return {
			models = {
				displayText = f41_arg0,
				icon = f41_arg1,
				description = Engine.Localize( f41_arg2 )
			},
			properties = {
				action = f41_arg3,
				actionParam = f41_arg4
			}
		}
	end
	
	local f40_local2 = function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3, f42_arg4 )
		ShowKeyboard( f42_arg0, f42_arg1, f42_arg2, "KEYBOARD_TYPE_CUSTOM_CLASS" )
	end
	
	local f40_local3 = function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3, f43_arg4 )
		CoD.OverlayUtility.CreateOverlay( f43_arg2, f43_arg4, "CopyClass", f43_arg2 )
	end
	
	local f40_local4 = function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3, f44_arg4 )
		CoD.OverlayUtility.CreateOverlay( f44_arg2, f44_arg4, "ResetToDefault", f44_arg2 )
	end
	
	local f40_local5 = function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3, f45_arg4 )
		if not IsCampaign() then
			ClassOptionsClearLoadout( f45_arg0, f45_arg1, f45_arg2 )
			GoBack( f45_arg0, f45_arg2 )
			ClearSavedState( f45_arg0, f45_arg2 )
		end
	end
	
	table.insert( f40_local0, f40_local1( "MENU_RENAME_LOADOUT_CAPS", "t7_icon_menu_simple_rename", "MENU_RENAME_CLASS_LOADOUT_DESC", f40_local2 ) )
	table.insert( f40_local0, f40_local1( "MENU_COPY_CAPS", "t7_icon_menu_simple_copy", "MENU_COPY_CLASS_DESC", f40_local3 ) )
	table.insert( f40_local0, f40_local1( "MENU_RESET_TO_DEFAULT_CAPS", "t7_icon_menu_simple_revertsetting", "MENU_RESET_CLASS_TO_DEFAULT_DESC", f40_local4 ) )
	if not IsCampaign() then
		table.insert( f40_local0, f40_local1( "MENU_CLEAR_LOADOUT_CAPS", "t7_icon_menu_simple_delete", "MENU_CLEAR_LOADOUT_DESC", f40_local5 ) )
	end
	return f40_local0
end

local f0_local4 = function ( f46_arg0 )
	local f46_local0 = {}
	local f46_local1 = function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3, f47_arg4 )
		return {
			models = {
				displayText = f47_arg0,
				icon = f47_arg1,
				description = Engine.Localize( f47_arg2 )
			},
			properties = {
				action = f47_arg3,
				actionParam = f47_arg4
			}
		}
	end
	
	local f46_local2 = function ( f48_arg0, f48_arg1, f48_arg2, f48_arg3, f48_arg4 )
		ShowKeyboard( f48_arg0, f48_arg1, f48_arg2, "KEYBOARD_TYPE_CLASS_SET" )
	end
	
	local f46_local3 = function ( f49_arg0, f49_arg1, f49_arg2, f49_arg3, f49_arg4 )
		CoD.OverlayUtility.CreateOverlay( f49_arg2, f49_arg4, "CopyClassSet", f49_arg2 )
	end
	
	table.insert( f46_local0, f46_local1( "MENU_RENAME_CLASS_SET_CAPS", "t7_icon_menu_simple_rename", "MENU_RENAME_CLASS_SET_DESC", f46_local2 ) )
	table.insert( f46_local0, f46_local1( "MENU_COPY_CLASS_SET_CAPS", "t7_icon_menu_simple_copy", "MENU_COPY_CLASS_SET_DESC", f46_local3 ) )
	return f46_local0
end

DataSources.CACClassOptions = DataSourceHelpers.ListSetup( "CACClassOptions", f0_local3, true )
DataSources.CACClassSetOptions = DataSourceHelpers.ListSetup( "CACClassSetOptions", f0_local4, true )
LUI.createMenu.ClassOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ClassOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ClassOptions.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Blackfade = LUI.UIImage.new()
	Blackfade:setLeftRight( true, true, -262, 11 )
	Blackfade:setTopBottom( true, true, 0, 0 )
	Blackfade:setRGB( 0, 0, 0 )
	Blackfade:setAlpha( 0.35 )
	self:addElement( Blackfade )
	self.Blackfade = Blackfade
	
	local leftBackground = LUI.UIImage.new()
	leftBackground:setLeftRight( false, true, -355, 0 )
	leftBackground:setTopBottom( true, true, 0, 0 )
	leftBackground:setRGB( 0.04, 0.04, 0.04 )
	leftBackground:setAlpha( 0.98 )
	self:addElement( leftBackground )
	self.leftBackground = leftBackground
	
	local tileTexture = LUI.UIImage.new()
	tileTexture:setLeftRight( false, true, -355, 3 )
	tileTexture:setTopBottom( true, true, 0, 0 )
	tileTexture:setAlpha( 0.5 )
	tileTexture:setImage( RegisterImage( "uie_t7_tile_texture" ) )
	tileTexture:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	tileTexture:setShaderVector( 0, 30, 55, 0, 0 )
	tileTexture:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( tileTexture )
	self.tileTexture = tileTexture
	
	local classOptionsList = LUI.UIList.new( self, controller, 1, 0, nil, false, false, 0, 0, false, false )
	classOptionsList:makeFocusable()
	classOptionsList:setLeftRight( false, true, -322.5, -67.5 )
	classOptionsList:setTopBottom( true, false, 135, 282 )
	classOptionsList:setWidgetType( CoD.GameSettings_OptionsButton )
	classOptionsList:setVerticalCount( 4 )
	classOptionsList:setSpacing( 1 )
	classOptionsList:setDataSource( "CACClassOptions" )
	classOptionsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f51_local0 = nil
		ClassOptionsSetHintText( self, element, controller )
		return f51_local0
	end )
	classOptionsList:registerEventHandler( "gain_focus", function ( element, event )
		local f52_local0 = nil
		if element.gainFocus then
			f52_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f52_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f52_local0
	end )
	classOptionsList:registerEventHandler( "lose_focus", function ( element, event )
		local f53_local0 = nil
		if element.loseFocus then
			f53_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f53_local0 = element.super:loseFocus( event )
		end
		return f53_local0
	end )
	self:AddButtonCallbackFunction( classOptionsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( classOptionsList )
	self.classOptionsList = classOptionsList
	
	local customClassNameTitile = LUI.UIText.new()
	customClassNameTitile:setLeftRight( false, true, -322.5, -100 )
	customClassNameTitile:setTopBottom( true, false, 96, 122 )
	customClassNameTitile:setRGB( 1, 0.47, 0 )
	customClassNameTitile:setTTF( "fonts/escom.ttf" )
	customClassNameTitile:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	customClassNameTitile:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	customClassNameTitile:subscribeToGlobalModel( controller, "CustomClassMenu", "customClassName", function ( model )
		local customClassName = Engine.GetModelValue( model )
		if customClassName then
			customClassNameTitile:setText( customClassName )
		end
	end )
	self:addElement( customClassNameTitile )
	self.customClassNameTitile = customClassNameTitile
	
	local fefooterRighSlideIn = CoD.fe_footerRighSlideIn.new( self, controller )
	fefooterRighSlideIn:setLeftRight( false, true, -464, -32 )
	fefooterRighSlideIn:setTopBottom( false, true, -75, -43 )
	self:addElement( fefooterRighSlideIn )
	self.fefooterRighSlideIn = fefooterRighSlideIn
	
	local Border0 = LUI.UIImage.new()
	Border0:setLeftRight( false, true, -356, -355 )
	Border0:setTopBottom( true, true, 0, 0 )
	Border0:setAlpha( 0.42 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local Border00 = LUI.UIImage.new()
	Border00:setLeftRight( false, true, -356, -355 )
	Border00:setTopBottom( true, true, 0, 0 )
	Border00:setAlpha( 0.42 )
	self:addElement( Border00 )
	self.Border00 = Border00
	
	local classSetOptionsList = LUI.UIList.new( self, controller, 1, 0, nil, false, false, 0, 0, false, false )
	classSetOptionsList:makeFocusable()
	classSetOptionsList:setLeftRight( false, true, -322.5, -67.5 )
	classSetOptionsList:setTopBottom( true, false, 451, 524 )
	classSetOptionsList:setWidgetType( CoD.GameSettings_OptionsButton )
	classSetOptionsList:setVerticalCount( 2 )
	classSetOptionsList:setSpacing( 1 )
	classSetOptionsList:setDataSource( "CACClassSetOptions" )
	classSetOptionsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f57_local0 = nil
		ClassOptionsSetHintText( self, element, controller )
		return f57_local0
	end )
	classSetOptionsList:registerEventHandler( "menu_loaded", function ( element, event )
		local f58_local0 = nil
		if not IsClassSetsAvailableForCurrentGameMode() then
			MakeNotFocusable( element )
		elseif not DoesPlayerHaveExtraSlotsItem( controller ) then
			MakeNotFocusable( element )
		end
		if not f58_local0 then
			f58_local0 = element:dispatchEventToChildren( event )
		end
		return f58_local0
	end )
	classSetOptionsList:registerEventHandler( "gain_focus", function ( element, event )
		local f59_local0 = nil
		if element.gainFocus then
			f59_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f59_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f59_local0
	end )
	classSetOptionsList:registerEventHandler( "lose_focus", function ( element, event )
		local f60_local0 = nil
		if element.loseFocus then
			f60_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f60_local0 = element.super:loseFocus( event )
		end
		return f60_local0
	end )
	self:AddButtonCallbackFunction( classSetOptionsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( classSetOptionsList )
	self.classSetOptionsList = classSetOptionsList
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( false, true, -322.5, -100 )
	TextBox0:setTopBottom( true, false, 416, 442 )
	TextBox0:setRGB( 1, 0.47, 0 )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:subscribeToGlobalModel( controller, "CustomClassMenu", "customClassSetName", function ( model )
		local customClassSetName = Engine.GetModelValue( model )
		if customClassSetName then
			TextBox0:setText( Engine.Localize( customClassSetName ) )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local description1 = LUI.UIText.new()
	description1:setLeftRight( false, true, -307.25, -82.5 )
	description1:setTopBottom( true, false, 548, 568 )
	description1:setTTF( "fonts/default.ttf" )
	description1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	description1:subscribeToGlobalModel( controller, "CustomClassMenu", "customClassOptionsHintText", function ( model )
		local customClassOptionsHintText = Engine.GetModelValue( model )
		if customClassOptionsHintText then
			description1:setText( Engine.Localize( customClassOptionsHintText ) )
		end
	end )
	self:addElement( description1 )
	self.description1 = description1
	
	local Arrow1 = LUI.UIImage.new()
	Arrow1:setLeftRight( false, true, -322.5, -313.5 )
	Arrow1:setTopBottom( true, false, 553.5, 562.5 )
	Arrow1:setAlpha( 0.6 )
	Arrow1:setImage( RegisterImage( "uie_t7_menu_gunsmith_arrow_white" ) )
	self:addElement( Arrow1 )
	self.Arrow1 = Arrow1
	
	classOptionsList.navigation = {
		down = classSetOptionsList
	}
	classSetOptionsList.navigation = {
		up = classOptionsList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				classSetOptionsList:completeAnimation()
				self.classSetOptionsList:setAlpha( 0 )
				self.clipFinished( classSetOptionsList, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
			end
		},
		Campaign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				classSetOptionsList:completeAnimation()
				self.classSetOptionsList:setAlpha( 0 )
				self.clipFinished( classSetOptionsList, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
			end
		},
		ClassSets = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				classSetOptionsList:completeAnimation()
				self.classSetOptionsList:setAlpha( 1 )
				self.clipFinished( classSetOptionsList, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				self.clipFinished( TextBox0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Campaign",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		},
		{
			stateName = "ClassSets",
			condition = function ( menu, element, event )
				return IsClassSetsAvailableForCurrentGameMode() and DoesPlayerHaveExtraSlotsItem( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( self, event )
		local f71_local0 = nil
		CallCustomElementFunction_Self( self, "handleKeyboardComplete", self, controller, event )
		if not f71_local0 then
			f71_local0 = self:dispatchEventToChildren( event )
		end
		return f71_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	classOptionsList.id = "classOptionsList"
	fefooterRighSlideIn.buttons:setModel( self.buttonModel, controller )
	classSetOptionsList.id = "classSetOptionsList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.classOptionsList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.classOptionsList:close()
		element.fefooterRighSlideIn:close()
		element.classSetOptionsList:close()
		element.customClassNameTitile:close()
		element.TextBox0:close()
		element.description1:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ClassOptions.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

