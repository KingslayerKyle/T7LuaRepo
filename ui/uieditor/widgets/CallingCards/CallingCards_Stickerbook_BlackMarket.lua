-- 148443e11f5faf20b000bf126d82e58b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_CardWidget" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_BlackMarket_Profiler" )

DataSources.CallingCardsBlackMarket = DataSourceHelpers.ListSetup( "CallingCardsBlackMarket", function ( f1_arg0 )
	local f1_local0 = {}
	for f1_local6, f1_local7 in ipairs( CoD.BlackMarketUtility.CommonCallingCardsTable ) do
		local f1_local4 = f1_local7.title
		local f1_local5 = ""
		if f1_local7.isBMClassified then
			f1_local4 = CoD.BlackMarketUtility.ClassifiedName()
			f1_local5 = Engine.Localize( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MENU_CALLING_CARD" )
		end
		table.insert( f1_local0, {
			models = {
				title = Engine.Localize( f1_local4 ),
				description = f1_local5,
				rarityType = {
					rarity = f1_local7.rarity,
					duplicateCount = f1_local7.duplicateCount
				},
				iconId = f1_local7.iconId,
				isBMClassified = f1_local7.isBMClassified
			}
		} )
	end
	table.sort( f1_local0, CoD.BlackMarketUtility.SortUnlocksModelIconId )
	return f1_local0
end, true )
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
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardGrid = LUI.UIList.new( menu, controller, 10, 0, nil, true, false, 0, 0, false, false )
	CallingCardGrid:makeFocusable()
	CallingCardGrid:setLeftRight( true, false, 10, 750 )
	CallingCardGrid:setTopBottom( true, false, 16, 496 )
	CallingCardGrid:setDataSource( "CallingCardsBlackMarket" )
	CallingCardGrid:setWidgetType( CoD.CallingCards_CardWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 7 )
	CallingCardGrid:setSpacing( 10 )
	CallingCardGrid:setVerticalCounter( CoD.verticalCounter )
	CallingCardGrid:linkToElementModel( CallingCardGrid, "isBMClassified", true, function ( model )
		local f3_local0 = CallingCardGrid
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	CallingCardGrid:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f4_local0 = nil
		if IsElementInState( element, "New" ) then
			CallingCards_SetOld( element, controller )
			UpdateSelfElementState( menu, element, controller )
		end
		return f4_local0
	end )
	CallingCardGrid:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	CallingCardGrid:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( CallingCardGrid, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if not IsSelfModelValueTrue( f7_arg0, f7_arg2, "isBMClassified" ) then
			CallingCards_SetPlayerBackground( f7_arg1, f7_arg0, f7_arg2 )
			PlaySoundSetSound( self, "action" )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsSelfModelValueTrue( f8_arg0, f8_arg2, "isBMClassified" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( CallingCardGrid )
	self.CallingCardGrid = CallingCardGrid
	
	local CallingCardsBlackMarketProfiler = CoD.CallingCards_BlackMarket_Profiler.new( menu, controller )
	CallingCardsBlackMarketProfiler:setLeftRight( false, true, -379, -29 )
	CallingCardsBlackMarketProfiler:setTopBottom( true, true, 14, -24 )
	self:addElement( CallingCardsBlackMarketProfiler )
	self.CallingCardsBlackMarketProfiler = CallingCardsBlackMarketProfiler
	
	CallingCardsBlackMarketProfiler:linkToElementModel( CallingCardGrid, nil, false, function ( model )
		CallingCardsBlackMarketProfiler:setModel( model, controller )
	end )
	CallingCardGrid.id = "CallingCardGrid"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.CallingCardGrid:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardGrid:close()
		element.CallingCardsBlackMarketProfiler:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

