require( "ui.uieditor.widgets.Footer.fe_footerRighSlideIn" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_OptionsButton" )

local HandleKeyboardComplete = function ( self, element, controller, event )
	local customClassName = event.input
	local classNum = CoD.perController[controller].classNum
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_CUSTOM_CLASS then
		if customClassName ~= nil then
			local f1_local0 = CoD.CACUtility.GetLoadoutNameFromIndex( controller, classNum )
			f1_local0:set( customClassName )
		end
		GoBack( self, controller )
		CoD.CACUtility.UpdateAllClasses( controller )
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_CLASS_SET then
		if customClassName ~= nil then
			local currentClassSetIndex = Engine.GetCurrentClassSetIndex( controller )
			Engine.SetClassSetName( controller, currentClassSetIndex, customClassName )
		end
		local previousMenu = GoBack( self, controller )
		previousMenu:dispatchEventToChildren( {
			name = "class_set_name_change",
			controller = controller
		} )
	end
end

local PreLoadFunc = function ( self, controller )
	if not Engine.IsSplitscreen() then
		self.animateInFromOffset = 340
	end
	self:setModel( CoD.perController[controller].classModel )
	self.handleKeyboardComplete = HandleKeyboardComplete
end

CoD.OverlayUtility.AddSystemOverlay( "CopyClass", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_ClassOptionsFrame",
	title = Engine.Localize( "MPUI_COPY_CUSTOM_CLASS_TITLE_CAPS" ),
	description = function ( controller )
		local className = ""
		DataSources.CustomClassMenu.getModel( controller )
		local classModel = Engine.GetModel( Engine.GetModelForController( controller ), "CustomClassMenu" )
		if classModel then
			className = CoD.SafeGetModelValue( classModel, "currentClassName" ) or ""
		end
		return Engine.Localize( "MPUI_COPY_CUSTOM_CLASS_DESC", className )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = "ChooseClassList",
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
	[CoD.OverlayUtility.ProcessActionPropertyName] = function ()
		return function ( self, element, controller )
			ClassOptionsCopyLoadout( self, element, controller )
		end
		
	end
} )
CoD.OverlayUtility.AddSystemOverlay( "ResetToDefault", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_ClassOptionsFrame",
	title = Engine.Localize( "MENU_WHICH_DEFAULT_CLASS_TITLE_CAPS" ),
	description = function ( controller )
		local className = ""
		DataSources.CustomClassMenu.getModel( controller )
		local classModel = Engine.GetModel( Engine.GetModelForController( controller ), "CustomClassMenu" )
		if classModel then
			className = CoD.SafeGetModelValue( classModel, "currentClassName" ) or ""
		end
		return Engine.Localize( "MENU_WHICH_DEFAULT_CLASS_DESC", className )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = "ResetDefaultClass",
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
	[CoD.OverlayUtility.ProcessActionPropertyName] = function ()
		return function ( self, element, controller )
			ClassOptionsResetToDefault( self, element, controller )
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
		return function ( self, element, controller )
			ClassOptionsCopyClassSet( self, element, controller )
		end
		
	end
} )
local GoBackAndPurchaseCodpointsAction = function ( self, element, controller, actionParam, menu )
	GoBackAndOpenOverlayOnParent( menu, "Store_CodPoints", controller )
end

CoD.OverlayUtility.AddSystemOverlay( "PurchaseExtraSlotsConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_ExtraSlots",
	title = function ( controller, params )
		if params.itemCODPointCost > 0 and Engine.GetCoDPoints( controller ) < params.itemCODPointCost then
			return "MPUI_BM_NO_CURRENCY"
		else
			return Engine.ToUpper( Engine.Localize( "ZMUI_CONFIRM_TRADE" ) )
		end
	end,
	description = function ( controller, params )
		if params.itemCODPointCost > 0 and Engine.GetCoDPoints( controller ) < params.itemCODPointCost then
			return Engine.Localize( "MPUI_BM_NO_CODPOINTS_DESCRIPTION", params.displayText )
		else
			return Engine.Localize( "MPUI_BM_CODPOINTS_PURCHASE_CONFIRMATION_TEXT", params.displayText )
		end
	end,
	codpointcost = function ( controller, params )
		return params.itemCODPointCost
	end,
	codpointcostString = function ( controller, params )
		if params.itemCODPointCost > 0 and Engine.GetCoDPoints( controller ) < params.itemCODPointCost then
			return Engine.Localize( "MENU_CODPOINT_COST", params.itemCODPointCost )
		else
			return ""
		end
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( controller, params )
		DataSources.PurchaseExtraSlotsMenuList = DataSourceHelpers.ListSetup( "PurchaseExtraSlotsMenuList", function ( controller, list )
			local buttonsList = {}
			if list.purchasingExtraSlots then
				return {}
			end
			local addItemListButton = function ( displayText, action, selected, disabled )
				return {
					models = {
						displayText = displayText,
						disabled = disabled
					},
					properties = {
						action = action,
						actionParam = params,
						selectIndex = selected
					}
				}
			end
			
			local PurchaseExtraSlotsAction = function ( self, element, controller, actionParam, menu )
				if not DoesPlayerHaveExtraSlotsItem( controller ) then
					local skuId = Dvar.extra_slots_id:get()
					if skuId == 0 or not Engine.PurchaseDWSKU( controller, skuId ) then
						LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_EXTRASLOTS_PURCHASE_FAILED", "" )
						GoBack( menu, controller )
						return 
					end
					self:setState( "Purchasing" )
					self.PurchasingWidget:playClip( "StartPurchasing" )
					self.PurchasingWidget.nextClip = "Purchasing"
					list.purchasingExtraSlots = true
					list:updateDataSource()
					menu[CoD.OverlayUtility.GoBackPropertyName] = nil
					list.disabled = true
					CoD.Menu.UpdateAllButtonPrompts( menu, controller )
					self.PurchasingWidget:registerEventHandler( "clip_over", function ( element, event )
						if Engine.IsInventoryBusy( controller ) or Engine.GetPurchaseDWSKUResult( controller ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
							LUI.UIElement.clipOver( element, event )
						else
							element:playClip( "StopPurchasing" )
							element:registerEventHandler( "clip_over", function ( element, event )
								element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
								self:setState( "DefaultState" )
								if Engine.GetPurchaseDWSKUResult( controller ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_SUCCESS then
									local previousMenu = GoBack( menu, controller )
									CoD.OverlayUtility.CreateOverlay( controller, previousMenu, "PurchaseExtraSlotsComplete", controller )
								else
									LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_EXTRASLOTS_PURCHASE_FAILED", "" )
									GoBack( menu, controller )
								end
							end )
						end
					end )
				end
			end
			
			local CancelPurchaseAction = function ( self, element, controller, actionParam, menu )
				GoBack( menu, controller )
			end
			
			if params.itemCODPointCost > 0 and Engine.GetCoDPoints( controller ) < params.itemCODPointCost then
				table.insert( buttonsList, addItemListButton( "MPUI_PURCHASE_CODPOINTS_CAPS", GoBackAndPurchaseCodpointsAction, true, false ) )
			elseif params.itemCODPointCost > 0 then
				table.insert( buttonsList, addItemListButton( Engine.Localize( "MPUI_BM_TRADE_COD_POINTS", CoD.CACUtility.GetExtraSlotCODPointCost() ), PurchaseExtraSlotsAction, true, false ) )
			end
			table.insert( buttonsList, addItemListButton( "MENU_CANCEL_CAPS", CancelPurchaseAction, false, false ) )
			return buttonsList
		end, true )
		return "PurchaseExtraSlotsMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PurchaseExtraSlotsComplete", {
	menuName = "SystemOverlay_Compact",
	frameWidget = "CoD.SystemOverlay_ExtraSlotsPurchased",
	title = function ( controller, params )
		return Engine.Localize( "MENU_CONGRATULATIONS_CAPS" )
	end,
	description = function ( controller, params )
		return Engine.Localize( "MENU_EXTRASLOTS_PURCHASE_COMPLETE_DESC" )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	image = "uie_t7_icon_unlock_generic_square_overlays",
	listDatasource = function ( controller, params )
		DataSources.PurchaseExtraSlotsCompleteMenuList = DataSourceHelpers.ListSetup( "PurchaseExtraSlotsCompleteMenuList", function ( controller )
			local list = {}
			local addItemListButton = function ( displayText, action, selected, disabled )
				return {
					models = {
						displayText = displayText,
						disabled = disabled
					},
					properties = {
						action = action,
						actionParam = params,
						selectIndex = selected
					}
				}
			end
			
			local ContinueAction = function ( self, element, controller, actionParam, menu )
				local classSetsUpdatedModel = Engine.GetModel( Engine.GetModelForController( controller ), "classSetsUpdated" )
				if classSetsUpdatedModel then
					Engine.ForceNotifyModelSubscriptions( classSetsUpdatedModel )
				end
				GoBack( menu, controller )
			end
			
			table.insert( list, addItemListButton( "MENU_OK", ContinueAction, true, false ) )
			return list
		end, true )
		return "PurchaseExtraSlotsCompleteMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = function ()
		return function ( self, element, controller, menu )
			local classSetsUpdatedModel = Engine.GetModel( Engine.GetModelForController( controller ), "classSetsUpdated" )
			if classSetsUpdatedModel then
				Engine.ForceNotifyModelSubscriptions( classSetsUpdatedModel )
			end
			GoBack( menu, controller )
		end
		
	end
} )
local ClassOptionsListPrepare = function ( controller )
	local list = {}
	local addItemListButton = function ( displayText, icon, description, action, actionParam )
		return {
			models = {
				displayText = displayText,
				icon = icon,
				description = Engine.Localize( description )
			},
			properties = {
				action = action,
				actionParam = actionParam
			}
		}
	end
	
	local RenameAction = function ( self, element, controller, actionParam, menu )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_CUSTOM_CLASS" )
	end
	
	local CopyAction = function ( self, element, controller, actionParam, menu )
		CoD.OverlayUtility.CreateOverlay( controller, menu, "CopyClass", controller )
	end
	
	local ResetToDefaultAction = function ( self, element, controller, actionParam, menu )
		CoD.OverlayUtility.CreateOverlay( controller, menu, "ResetToDefault", controller )
	end
	
	local ClearAction = function ( self, element, controller, actionParam, menu )
		if not IsCampaign() then
			ClassOptionsClearLoadout( self, element, controller )
			GoBack( self, controller )
			ClearSavedState( self, controller )
		end
	end
	
	table.insert( list, addItemListButton( "MENU_RENAME_LOADOUT_CAPS", "t7_icon_menu_simple_rename", "MENU_RENAME_CLASS_LOADOUT_DESC", RenameAction ) )
	table.insert( list, addItemListButton( "MENU_COPY_CAPS", "t7_icon_menu_simple_copy", "MENU_COPY_CLASS_DESC", CopyAction ) )
	table.insert( list, addItemListButton( "MENU_RESET_TO_DEFAULT_CAPS", "t7_icon_menu_simple_revertsetting", "MENU_RESET_CLASS_TO_DEFAULT_DESC", ResetToDefaultAction ) )
	if not IsCampaign() then
		table.insert( list, addItemListButton( "MENU_CLEAR_LOADOUT_CAPS", "t7_icon_menu_simple_delete", "MENU_CLEAR_LOADOUT_DESC", ClearAction ) )
	end
	return list
end

local ClassSetOptionsListPrepare = function ( controller )
	local list = {}
	local addItemListButton = function ( displayText, icon, description, action, actionParam )
		return {
			models = {
				displayText = displayText,
				icon = icon,
				description = Engine.Localize( description )
			},
			properties = {
				action = action,
				actionParam = actionParam
			}
		}
	end
	
	local RenameClassSetAction = function ( self, element, controller, actionParam, menu )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_CLASS_SET" )
	end
	
	local CopyClassSetAction = function ( self, element, controller, actionParam, menu )
		CoD.OverlayUtility.CreateOverlay( controller, menu, "CopyClassSet", controller )
	end
	
	table.insert( list, addItemListButton( "MENU_RENAME_CLASS_SET_CAPS", "t7_icon_menu_simple_rename", "MENU_RENAME_CLASS_SET_DESC", RenameClassSetAction ) )
	table.insert( list, addItemListButton( "MENU_COPY_CLASS_SET_CAPS", "t7_icon_menu_simple_copy", "MENU_COPY_CLASS_SET_DESC", CopyClassSetAction ) )
	return list
end

DataSources.CACClassOptions = DataSourceHelpers.ListSetup( "CACClassOptions", ClassOptionsListPrepare, true )
DataSources.CACClassSetOptions = DataSourceHelpers.ListSetup( "CACClassSetOptions", ClassSetOptionsListPrepare, true )
LUI.createMenu.ClassOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ClassOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ClassOptions.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Blackfade = LUI.UIImage.new()
	Blackfade:setLeftRight( 0, 1, -393, 17 )
	Blackfade:setTopBottom( 0, 1, 0, 0 )
	Blackfade:setRGB( 0, 0, 0 )
	Blackfade:setAlpha( 0.35 )
	self:addElement( Blackfade )
	self.Blackfade = Blackfade
	
	local leftBackground = LUI.UIImage.new()
	leftBackground:setLeftRight( 1, 1, -532, 0 )
	leftBackground:setTopBottom( 0, 1, 0, 0 )
	leftBackground:setRGB( 0.04, 0.04, 0.04 )
	leftBackground:setAlpha( 0.98 )
	self:addElement( leftBackground )
	self.leftBackground = leftBackground
	
	local tileTexture = LUI.UIImage.new()
	tileTexture:setLeftRight( 1, 1, -533, 4 )
	tileTexture:setTopBottom( 0, 1, 0, 0 )
	tileTexture:setAlpha( 0.5 )
	tileTexture:setImage( RegisterImage( "uie_t7_tile_texture" ) )
	tileTexture:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	tileTexture:setShaderVector( 0, 30, 55, 0, 0 )
	tileTexture:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( tileTexture )
	self.tileTexture = tileTexture
	
	local classOptionsList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	classOptionsList:makeFocusable()
	classOptionsList:setLeftRight( 1, 1, -483, -101 )
	classOptionsList:setTopBottom( 0, 0, 202, 424 )
	classOptionsList:setWidgetType( CoD.GameSettings_OptionsButton )
	classOptionsList:setVerticalCount( 4 )
	classOptionsList:setDataSource( "CACClassOptions" )
	classOptionsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		ClassOptionsSetHintText( self, element, controller )
		return retVal
	end )
	classOptionsList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	classOptionsList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( classOptionsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( classOptionsList )
	self.classOptionsList = classOptionsList
	
	local customClassNameTitile = LUI.UIText.new()
	customClassNameTitile:setLeftRight( 1, 1, -484, -150 )
	customClassNameTitile:setTopBottom( 0, 0, 144, 183 )
	customClassNameTitile:setRGB( 1, 0.47, 0 )
	customClassNameTitile:setTTF( "fonts/escom.ttf" )
	customClassNameTitile:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	customClassNameTitile:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	customClassNameTitile:subscribeToGlobalModel( controller, "CustomClassMenu", "customClassName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			customClassNameTitile:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( customClassNameTitile )
	self.customClassNameTitile = customClassNameTitile
	
	local fefooterRighSlideIn = CoD.fe_footerRighSlideIn.new( self, controller )
	fefooterRighSlideIn:setLeftRight( 1, 1, -696, -48 )
	fefooterRighSlideIn:setTopBottom( 1, 1, -112, -64 )
	self:addElement( fefooterRighSlideIn )
	self.fefooterRighSlideIn = fefooterRighSlideIn
	
	local Border0 = LUI.UIImage.new()
	Border0:setLeftRight( 1, 1, -534, -532 )
	Border0:setTopBottom( 0, 1, 0, 0 )
	Border0:setAlpha( 0.42 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local Border00 = LUI.UIImage.new()
	Border00:setLeftRight( 1, 1, -534, -532 )
	Border00:setTopBottom( 0, 1, 0, 0 )
	Border00:setAlpha( 0.42 )
	self:addElement( Border00 )
	self.Border00 = Border00
	
	local classSetOptionsList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	classSetOptionsList:makeFocusable()
	classSetOptionsList:setLeftRight( 1, 1, -483, -101 )
	classSetOptionsList:setTopBottom( 0, 0, 676, 786 )
	classSetOptionsList:setWidgetType( CoD.GameSettings_OptionsButton )
	classSetOptionsList:setVerticalCount( 2 )
	classSetOptionsList:setDataSource( "CACClassSetOptions" )
	classSetOptionsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		ClassOptionsSetHintText( self, element, controller )
		return retVal
	end )
	classSetOptionsList:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if not IsClassSetsAvailableForCurrentGameMode() then
			MakeNotFocusable( element, controller )
		elseif not DoesPlayerHaveExtraSlotsItem( controller ) then
			MakeNotFocusable( element, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	classSetOptionsList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	classSetOptionsList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( classSetOptionsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( classSetOptionsList )
	self.classSetOptionsList = classSetOptionsList
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 1, 1, -484, -150 )
	TextBox0:setTopBottom( 0, 0, 624, 663 )
	TextBox0:setRGB( 1, 0.47, 0 )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:subscribeToGlobalModel( controller, "CustomClassMenu", "customClassSetName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local description1 = LUI.UIText.new()
	description1:setLeftRight( 1, 1, -461, -124 )
	description1:setTopBottom( 0, 0, 822, 852 )
	description1:setTTF( "fonts/default.ttf" )
	description1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	description1:subscribeToGlobalModel( controller, "CustomClassMenu", "customClassOptionsHintText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			description1:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( description1 )
	self.description1 = description1
	
	local Arrow1 = LUI.UIImage.new()
	Arrow1:setLeftRight( 1, 1, -484, -470 )
	Arrow1:setTopBottom( 0, 0, 830, 844 )
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
	self.resetProperties = function ()
		TextBox0:completeAnimation()
		classSetOptionsList:completeAnimation()
		TextBox0:setAlpha( 1 )
		classSetOptionsList:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		CallCustomElementFunction_Self( self, "handleKeyboardComplete", element, controller, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.classOptionsList:close()
		self.fefooterRighSlideIn:close()
		self.classSetOptionsList:close()
		self.customClassNameTitile:close()
		self.TextBox0:close()
		self.description1:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ClassOptions.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

