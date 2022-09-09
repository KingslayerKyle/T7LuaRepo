-- 0310ad347dab942e5b55f9c76d753a64
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_CardWidget" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Challenges.Challenges_CallingCardProfiler" )

DataSources.CallingCardsDefault = DataSourceHelpers.ListSetup( "CallingCardsDefault", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = Engine.GetBackgroundsForCategoryName( f1_arg0, "default" )
	local f1_local2 = function ( f2_arg0, f2_arg1 )
		if f2_arg0.models.isPackage ~= f2_arg1.models.isPackage then
			return f2_arg0.models.isPackage
		elseif f2_arg0.models.isPackage and f2_arg0.properties.packageSortIndex and f2_arg1.properties.packageSortIndex then
			return f2_arg0.properties.packageSortIndex < f2_arg1.properties.packageSortIndex
		elseif f2_arg0.models.isLocked ~= f2_arg1.models.isLocked then
			return f2_arg1.models.isLocked
		else
			return f2_arg0.models.iconId < f2_arg1.models.iconId
		end
	end
	
	local f1_local3 = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4 )
		CallingCards_SetPlayerBackground( f3_arg4, f3_arg1, f3_arg2 )
	end
	
	local f1_local4 = function ( f4_arg0 )
		if f4_arg0.isContractBg then
			
		else
			
		end
	end
	
	for f1_local16, f1_local17 in ipairs( f1_local1 ) do
		local f1_local8 = Engine.Localize( f1_local17.description )
		local f1_local9 = ""
		if f1_local17.isContractBg and f1_local17.isBGLocked then
			f1_local8 = CoD.BlackMarketUtility.ClassifiedName()
			f1_local9 = Engine.Localize( "MPUI_CONTRACT_ITEM_CLASSIFIED_DESC", "MENU_CALLING_CARD" )
		end
		for f1_local14, f1_local15 in ipairs( CoD.SpecialCallingCards ) do
			if f1_local17.description == f1_local15.backgroundDescription then
				local f1_local13 = Engine.GetInventoryItemQuantity( f1_arg0, f1_local15.itemId )
				if not f1_local13 or f1_local13 == 0 then
					f1_local17.isBGLocked = true
				end
			end
		end
		if not f1_local17.isBGLocked or f1_local17.isContractBg and IsLive() then
			table.insert( f1_local0, {
				models = {
					title = f1_local8,
					description = f1_local9,
					iconId = f1_local17.id,
					isLocked = f1_local17.isBGLocked,
					isContractBg = f1_local17.isContractBg,
					isPackage = false
				},
				properties = {
					action = f1_local3
				}
			} )
		end
	end
	if InFrontend() and AreCodPointsEnabled( f1_arg0 ) then
		for f1_local16, f1_local17 in ipairs( CoD.StoreUtility.CWLPackages ) do
			if not CoD.StoreUtility.IsCWLV2Package( f1_local17 ) and CoD.StoreUtility.IsInventoryItemVisible( f1_arg0, f1_local17 ) and not CoD.StoreUtility.IsInventoryItemPurchased( f1_arg0, f1_local17 ) then
				local f1_local8 = CoD.StoreUtility.GetCWLPackageCallingCardModel( f1_arg0, f1_local17 )
				f1_local8.properties.packageSortIndex = f1_local16
				table.insert( f1_local0, f1_local8 )
			end
		end
	end
	table.sort( f1_local0, f1_local2 )
	return f1_local0
end, true )
CoD.CallingCards_Stickerbook_Default = InheritFrom( LUI.UIElement )
CoD.CallingCards_Stickerbook_Default.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_Stickerbook_Default )
	self.id = "CallingCards_Stickerbook_Default"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardGrid = LUI.UIList.new( menu, controller, 10, 0, nil, true, false, 0, 0, false, false )
	CallingCardGrid:makeFocusable()
	CallingCardGrid:setLeftRight( true, false, 10, 750 )
	CallingCardGrid:setTopBottom( true, false, 16, 496 )
	CallingCardGrid:setWidgetType( CoD.CallingCards_CardWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 7 )
	CallingCardGrid:setSpacing( 10 )
	CallingCardGrid:setVerticalCounter( CoD.verticalCounter )
	CallingCardGrid:setDataSource( "CallingCardsDefault" )
	CallingCardGrid:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f6_local0 = nil
		if IsElementInState( element, "New" ) then
			CallingCards_SetOld( element, controller )
			UpdateSelfElementState( menu, element, controller )
		end
		return f6_local0
	end )
	CallingCardGrid:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	CallingCardGrid:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	menu:AddButtonCallbackFunction( CallingCardGrid, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if not IsElementInState( f9_arg0, "Locked" ) and not IsElementInState( f9_arg0, "ContractClassified" ) then
			ProcessListAction( self, f9_arg0, f9_arg2 )
			PlaySoundSetSound( self, "action" )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		if not IsElementInState( f10_arg0, "Locked" ) and not IsElementInState( f10_arg0, "ContractClassified" ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	CallingCardGrid:subscribeToGlobalModel( controller, "PerController", "StoreRoot.InventoryItemPurchaseSuccessful", function ( model )
		local f11_local0 = CallingCardGrid
		UpdateDataSource( self, f11_local0, controller )
		CallingCards_SetOld( f11_local0, controller )
	end )
	CallingCardGrid:mergeStateConditions( {
		{
			stateName = "ContractClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" ) and IsSelfModelValueTrue( element, controller, "isContractBg" )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	CallingCardGrid:linkToElementModel( CallingCardGrid, "isBMClassified", true, function ( model )
		menu:updateElementState( CallingCardGrid, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	CallingCardGrid:linkToElementModel( CallingCardGrid, "isLocked", true, function ( model )
		menu:updateElementState( CallingCardGrid, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		} )
	end )
	CallingCardGrid:linkToElementModel( CallingCardGrid, "isContractBg", true, function ( model )
		menu:updateElementState( CallingCardGrid, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isContractBg"
		} )
	end )
	CallingCardGrid:linkToElementModel( CallingCardGrid, "isPackage", true, function ( model )
		menu:updateElementState( CallingCardGrid, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPackage"
		} )
	end )
	self:addElement( CallingCardGrid )
	self.CallingCardGrid = CallingCardGrid
	
	local CallingCardProfiler = CoD.Challenges_CallingCardProfiler.new( menu, controller )
	CallingCardProfiler:setLeftRight( false, true, -379, -29 )
	CallingCardProfiler:setTopBottom( true, true, 14, -22 )
	CallingCardProfiler:mergeStateConditions( {
		{
			stateName = "ContractClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" ) and IsSelfModelValueTrue( element, controller, "isContractBg" )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "LockedOneTier",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	CallingCardProfiler:linkToElementModel( CallingCardProfiler, "isBMClassified", true, function ( model )
		menu:updateElementState( CallingCardProfiler, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	CallingCardProfiler:linkToElementModel( CallingCardProfiler, "isLocked", true, function ( model )
		menu:updateElementState( CallingCardProfiler, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		} )
	end )
	CallingCardProfiler:linkToElementModel( CallingCardProfiler, "isContractBg", true, function ( model )
		menu:updateElementState( CallingCardProfiler, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isContractBg"
		} )
	end )
	CallingCardProfiler:linkToElementModel( CallingCardProfiler, "hideProgress", true, function ( model )
		menu:updateElementState( CallingCardProfiler, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideProgress"
		} )
	end )
	self:addElement( CallingCardProfiler )
	self.CallingCardProfiler = CallingCardProfiler
	
	CallingCardProfiler:linkToElementModel( CallingCardGrid, nil, false, function ( model )
		CallingCardProfiler:setModel( model, controller )
	end )
	CallingCardGrid.navigation = {
		right = CallingCardProfiler
	}
	CallingCardProfiler.navigation = {
		left = CallingCardGrid
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	CallingCardGrid.id = "CallingCardGrid"
	CallingCardProfiler.id = "CallingCardProfiler"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.CallingCardGrid:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardGrid:close()
		element.CallingCardProfiler:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
