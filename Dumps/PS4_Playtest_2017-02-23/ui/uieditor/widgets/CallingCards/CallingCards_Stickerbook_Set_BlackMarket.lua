require( "ui.uieditor.widgets.CallingCards.CallingCards_BlackMarket_Profiler" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_BlackMarketMasterCardWidget" )
require( "ui.uieditor.widgets.CallingCards.CallingCardsSet_BlackMarketWidget" )

DataSources.CallingCardsBlackMarketMasterCard = {
	getModel = function ( controller )
		local masterBMCallingCardModel = Engine.GetModel( Engine.GetModelForController( controller ), "CallingCardsBlackMarketMasterCard" )
		if masterBMCallingCardModel == nil then
			masterBMCallingCardModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CallingCardsBlackMarketMasterCard" )
			Engine.CreateModel( masterBMCallingCardModel, "title" )
			Engine.CreateModel( masterBMCallingCardModel, "description" )
			Engine.CreateModel( masterBMCallingCardModel, "rarityType.rarity" )
			Engine.CreateModel( masterBMCallingCardModel, "iconId" )
			Engine.CreateModel( masterBMCallingCardModel, "isBMClassified" )
		end
		return masterBMCallingCardModel
	end,
	setModelValues = function ( controller, callingCardSetTable )
		local masterBMCallingCardModel = Engine.GetModel( Engine.GetModelForController( controller ), "CallingCardsBlackMarketMasterCard" )
		if masterBMCallingCardModel == nil then
			masterBMCallingCardModel = DataSources.CallingCardsBlackMarketMasterCard.getModel( controller )
		end
		local title = callingCardSetTable.title
		local description = ""
		if callingCardSetTable.isBMClassified then
			title = CoD.BlackMarketUtility.ClassifiedName()
			description = Engine.Localize( "MPUI_BM_MASTER_CALLING_CARD_DESC", callingCardSetTable.totalSetCount )
		end
		Engine.SetModelValue( Engine.GetModel( masterBMCallingCardModel, "title" ), Engine.Localize( title ) )
		Engine.SetModelValue( Engine.GetModel( masterBMCallingCardModel, "description" ), description )
		Engine.SetModelValue( Engine.GetModel( masterBMCallingCardModel, "rarityType.rarity" ), callingCardSetTable.rarity )
		Engine.SetModelValue( Engine.GetModel( masterBMCallingCardModel, "iconId" ), callingCardSetTable.masterCardIconId )
		Engine.SetModelValue( Engine.GetModel( masterBMCallingCardModel, "isBMClassified" ), callingCardSetTable.isBMClassified )
	end
}
DataSources.CallingCardsBlackMarketCardSet = DataSourceHelpers.ListSetup( "CallingCardsBlackMarketCardSet", function ( controller )
	local returnTable = {}
	local callingCardSetTable = {}
	local callingCardTable = {}
	if CoD.perController[controller].BlackMarketUtility_CurrentCallingCardSetName then
		callingCardSetTable = CoD.BlackMarketUtility.GetCallingCardSetTable( CoD.perController[controller].BlackMarketUtility_CurrentCallingCardSetName )
		if callingCardSetTable then
			callingCardTable = callingCardSetTable.callingCards
		end
	end
	if callingCardTable then
		for index, callingCard in ipairs( callingCardTable ) do
			local f3_local3 = callingCard.title
			local f3_local4 = Engine.Localize( "MPUI_BM_SET_PIECE_X_OF_Y", index, callingCardSetTable.totalSetCount )
			if callingCard.isBMClassified then
				f3_local3 = CoD.BlackMarketUtility.ClassifiedName()
				f3_local4 = Engine.Localize( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MENU_CALLING_CARD" )
			end
			table.insert( returnTable, {
				models = {
					title = Engine.Localize( f3_local3 ),
					description = f3_local4,
					rarityType = {
						rarity = callingCard.rarity,
						duplicateCount = callingCard.duplicateCount
					},
					iconId = callingCard.iconId,
					isBMClassified = callingCard.isBMClassified
				}
			} )
		end
	end
	if not LuaUtils.IsTableEmpty( callingCardSetTable ) then
		DataSources.CallingCardsBlackMarketMasterCard.setModelValues( controller, callingCardSetTable )
	end
	return returnTable
end )
CoD.CallingCards_Stickerbook_Set_BlackMarket = InheritFrom( LUI.UIElement )
CoD.CallingCards_Stickerbook_Set_BlackMarket.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_Stickerbook_Set_BlackMarket )
	self.id = "CallingCards_Stickerbook_Set_BlackMarket"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MasterCallingCardWidget = CoD.CallingCards_BlackMarketMasterCardWidget.new( menu, controller )
	MasterCallingCardWidget:setLeftRight( 0, 0, 12, 1137 )
	MasterCallingCardWidget:setTopBottom( 1, 1, -181.5, -34.5 )
	MasterCallingCardWidget:subscribeToGlobalModel( controller, "CallingCardsBlackMarketMasterCard", nil, function ( model )
		MasterCallingCardWidget:setModel( model, controller )
	end )
	MasterCallingCardWidget:subscribeToGlobalModel( controller, "CallingCardsBlackMarketMasterCard", nil, function ( model )
		MasterCallingCardWidget.MasterCallingCardIcon:setModel( model, controller )
	end )
	MasterCallingCardWidget:linkToElementModel( MasterCallingCardWidget, "isBMClassified", true, function ( model )
		local element = MasterCallingCardWidget
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	MasterCallingCardWidget:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		if IsElementInState( element, "New" ) then
			CallingCards_SetOld( element, controller )
			UpdateSelfElementState( menu, element, controller )
			SetElementModelToFocusedElementModel( self, element, "CallingCardsBlackMarketProfiler" )
		else
			SetElementModelToFocusedElementModel( self, element, "CallingCardsBlackMarketProfiler" )
			CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		end
		return retVal
	end )
	MasterCallingCardWidget:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( MasterCallingCardWidget, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CallingCards_SetPlayerBackground( menu, element, controller )
			PlaySoundSetSound( self, "action" )
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
	self:addElement( MasterCallingCardWidget )
	self.MasterCallingCardWidget = MasterCallingCardWidget
	
	local CallingCardGrid = LUI.UIList.new( menu, controller, 20, 0, nil, true, false, 0, 0, false, false )
	CallingCardGrid:makeFocusable()
	CallingCardGrid:setLeftRight( 0, 0, 14.5, 1134.5 )
	CallingCardGrid:setTopBottom( 0, 0, 23, 587 )
	CallingCardGrid:setWidgetType( CoD.CallingCardsSet_BlackMarketWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 4 )
	CallingCardGrid:setSpacing( 20 )
	CallingCardGrid:setDataSource( "CallingCardsBlackMarketCardSet" )
	CallingCardGrid:linkToElementModel( CallingCardGrid, "isBMClassified", true, function ( model )
		local element = CallingCardGrid
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	CallingCardGrid:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		SetElementModelToFocusedElementModel( self, element, "CallingCardsBlackMarketProfiler" )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CallingCardGrid:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsElementInState( element, "New" ) then
			CallingCards_SetOld( element, controller )
			UpdateSelfElementState( menu, element, controller )
			SetElementModelToFocusedElementModel( self, element, "CallingCardsBlackMarketProfiler" )
		else
			SetElementModelToFocusedElementModel( self, element, "CallingCardsBlackMarketProfiler" )
		end
		return retVal
	end )
	CallingCardGrid:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CallingCardGrid, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CallingCards_SetPlayerBackground( menu, element, controller )
			PlaySoundSetSound( self, "action" )
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
	self:addElement( CallingCardGrid )
	self.CallingCardGrid = CallingCardGrid
	
	local CallingCardsBlackMarketProfiler = CoD.CallingCards_BlackMarket_Profiler.new( menu, controller )
	CallingCardsBlackMarketProfiler:setLeftRight( 1, 1, -568.5, -43.5 )
	CallingCardsBlackMarketProfiler:setTopBottom( 0, 1, 20, -36 )
	self:addElement( CallingCardsBlackMarketProfiler )
	self.CallingCardsBlackMarketProfiler = CallingCardsBlackMarketProfiler
	
	MasterCallingCardWidget.navigation = {
		up = CallingCardGrid,
		right = CallingCardsBlackMarketProfiler
	}
	CallingCardGrid.navigation = {
		right = CallingCardsBlackMarketProfiler,
		down = MasterCallingCardWidget
	}
	CallingCardsBlackMarketProfiler.navigation = {
		left = MasterCallingCardWidget
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	MasterCallingCardWidget.id = "MasterCallingCardWidget"
	CallingCardGrid.id = "CallingCardGrid"
	CallingCardsBlackMarketProfiler.id = "CallingCardsBlackMarketProfiler"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.CallingCardGrid:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MasterCallingCardWidget:close()
		self.CallingCardGrid:close()
		self.CallingCardsBlackMarketProfiler:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

