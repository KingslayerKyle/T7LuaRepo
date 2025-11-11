require( "ui.uieditor.widgets.CallingCards.CallingCards_BlackMarket_Profiler" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_CardWidget" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

DataSources.CallingCardsBlackMarket = DataSourceHelpers.ListSetup( "CallingCardsBlackMarket", function ( controller )
	local returnTable = {}
	for _, callingCard in ipairs( CoD.BlackMarketUtility.CommonCallingCardsTable ) do
		local f1_local3 = callingCard.title
		local f1_local4 = ""
		if callingCard.isBMClassified then
			f1_local3 = CoD.BlackMarketUtility.ClassifiedName()
			f1_local4 = Engine.Localize( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MENU_CALLING_CARD" )
		end
		table.insert( returnTable, {
			models = {
				title = Engine.Localize( f1_local3 ),
				description = f1_local4,
				rarityType = {
					rarity = callingCard.rarity,
					duplicateCount = callingCard.duplicateCount
				},
				iconId = callingCard.iconId,
				isBMClassified = callingCard.isBMClassified
			}
		} )
	end
	table.sort( returnTable, CoD.BlackMarketUtility.SortUnlocksModelIconId )
	return returnTable
end )
CoD.CallingCards_Stickerbook_BlackMarket = InheritFrom( LUI.UIElement )
CoD.CallingCards_Stickerbook_BlackMarket.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_Stickerbook_BlackMarket )
	self.id = "CallingCards_Stickerbook_BlackMarket"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardGrid = LUI.UIList.new( menu, controller, 15, 0, nil, true, false, 0, 0, false, false )
	CallingCardGrid:makeFocusable()
	CallingCardGrid:setLeftRight( 0, 0, 15, 1125 )
	CallingCardGrid:setTopBottom( 0, 0, 24, 744 )
	CallingCardGrid:setWidgetType( CoD.CallingCards_CardWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 7 )
	CallingCardGrid:setSpacing( 15 )
	CallingCardGrid:setVerticalCounter( CoD.verticalCounter )
	CallingCardGrid:setDataSource( "CallingCardsBlackMarket" )
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
	CallingCardGrid:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsElementInState( element, "New" ) then
			CallingCards_SetOld( element, controller )
			UpdateSelfElementState( menu, element, controller )
		end
		return retVal
	end )
	CallingCardGrid:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	
	CallingCardsBlackMarketProfiler:linkToElementModel( CallingCardGrid, nil, false, function ( model )
		CallingCardsBlackMarketProfiler:setModel( model, controller )
	end )
	CallingCardGrid.navigation = {
		right = CallingCardsBlackMarketProfiler
	}
	CallingCardsBlackMarketProfiler.navigation = {
		left = CallingCardGrid
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
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
		self.CallingCardGrid:close()
		self.CallingCardsBlackMarketProfiler:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

