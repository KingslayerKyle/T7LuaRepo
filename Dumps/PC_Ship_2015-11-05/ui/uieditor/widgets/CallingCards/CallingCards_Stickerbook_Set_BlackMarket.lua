require( "ui.uieditor.widgets.CallingCards.CallingCards_BlackMarketMasterCardWidget" )
require( "ui.uieditor.widgets.CallingCards.CallingCardsSet_BlackMarketWidget" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_BlackMarket_Profiler" )

DataSources.CallingCardsBlackMarketMasterCard = {
	getModel = function ( f1_arg0 )
		local f1_local0 = Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "CallingCardsBlackMarketMasterCard" )
		if f1_local0 == nil then
			f1_local0 = Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "CallingCardsBlackMarketMasterCard" )
			Engine.CreateModel( f1_local0, "title" )
			Engine.CreateModel( f1_local0, "description" )
			Engine.CreateModel( f1_local0, "rarityType.rarity" )
			Engine.CreateModel( f1_local0, "iconId" )
			Engine.CreateModel( f1_local0, "isBMClassified" )
		end
		return f1_local0
	end,
	setModelValues = function ( f2_arg0, f2_arg1 )
		local f2_local0 = Engine.GetModel( Engine.GetModelForController( f2_arg0 ), "CallingCardsBlackMarketMasterCard" )
		if f2_local0 == nil then
			f2_local0 = DataSources.CallingCardsBlackMarketMasterCard.getModel( f2_arg0 )
		end
		local f2_local1 = f2_arg1.title
		local f2_local2 = ""
		if f2_arg1.isBMClassified then
			f2_local1 = CoD.BlackMarketUtility.ClassifiedName()
			f2_local2 = Engine.Localize( "MPUI_BM_MASTER_CALLING_CARD_DESC", f2_arg1.totalSetCount )
		end
		Engine.SetModelValue( Engine.GetModel( f2_local0, "title" ), Engine.Localize( f2_local1 ) )
		Engine.SetModelValue( Engine.GetModel( f2_local0, "description" ), f2_local2 )
		Engine.SetModelValue( Engine.GetModel( f2_local0, "rarityType.rarity" ), f2_arg1.rarity )
		Engine.SetModelValue( Engine.GetModel( f2_local0, "iconId" ), f2_arg1.masterCardIconId )
		Engine.SetModelValue( Engine.GetModel( f2_local0, "isBMClassified" ), f2_arg1.isBMClassified )
	end
}
DataSources.CallingCardsBlackMarketCardSet = DataSourceHelpers.ListSetup( "CallingCardsBlackMarketCardSet", function ( f3_arg0 )
	local f3_local0 = {}
	local f3_local1 = {}
	local f3_local2 = {}
	if CoD.perController[f3_arg0].BlackMarketUtility_CurrentCallingCardSetName then
		f3_local1 = CoD.BlackMarketUtility.GetCallingCardSetTable( CoD.perController[f3_arg0].BlackMarketUtility_CurrentCallingCardSetName )
		if f3_local1 then
			f3_local2 = f3_local1.callingCards
		end
	end
	if f3_local2 then
		for f3_local8, f3_local9 in ipairs( f3_local2 ) do
			local f3_local6 = f3_local9.title
			local f3_local7 = Engine.Localize( "MPUI_BM_SET_PIECE_X_OF_Y", f3_local8, f3_local1.totalSetCount )
			if f3_local9.isBMClassified then
				f3_local6 = CoD.BlackMarketUtility.ClassifiedName()
				f3_local7 = Engine.Localize( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MENU_CALLING_CARD" )
			end
			table.insert( f3_local0, {
				models = {
					title = Engine.Localize( f3_local6 ),
					description = f3_local7,
					["rarityType.rarity"] = f3_local9.rarity,
					iconId = f3_local9.iconId,
					isBMClassified = f3_local9.isBMClassified
				}
			} )
		end
	end
	if not LuaUtils.IsTableEmpty( f3_local1 ) then
		DataSources.CallingCardsBlackMarketMasterCard.setModelValues( f3_arg0, f3_local1 )
	end
	return f3_local0
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
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MasterCallingCardWidget = CoD.CallingCards_BlackMarketMasterCardWidget.new( menu, controller )
	MasterCallingCardWidget:setLeftRight( true, false, 8, 758 )
	MasterCallingCardWidget:setTopBottom( false, true, -121, -23 )
	MasterCallingCardWidget:subscribeToGlobalModel( controller, "CallingCardsBlackMarketMasterCard", nil, function ( model )
		MasterCallingCardWidget:setModel( model, controller )
	end )
	MasterCallingCardWidget:subscribeToGlobalModel( controller, "CallingCardsBlackMarketMasterCard", nil, function ( model )
		MasterCallingCardWidget.MasterCallingCardIcon:setModel( model, controller )
	end )
	MasterCallingCardWidget:linkToElementModel( MasterCallingCardWidget, "isBMClassified", true, function ( model )
		local f7_local0 = MasterCallingCardWidget
		local f7_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f7_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	MasterCallingCardWidget:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		if IsElementInState( element, "New" ) then
			CallingCards_SetOld( element, controller )
			UpdateSelfElementState( menu, element, controller )
			SetElementModelToFocusedElementModel( self, element, "CallingCardsBlackMarketProfiler" )
		else
			SetElementModelToFocusedElementModel( self, element, "CallingCardsBlackMarketProfiler" )
			CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		end
		return f8_local0
	end )
	MasterCallingCardWidget:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	menu:AddButtonCallbackFunction( MasterCallingCardWidget, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CallingCards_SetPlayerBackground( menu, element, controller )
			PlaySoundSetSound( self, "action" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( MasterCallingCardWidget )
	self.MasterCallingCardWidget = MasterCallingCardWidget
	
	local CallingCardGrid = LUI.UIList.new( menu, controller, 13, 0, nil, true, false, 0, 0, false, false )
	CallingCardGrid:makeFocusable()
	CallingCardGrid:setLeftRight( true, false, 10, 756 )
	CallingCardGrid:setTopBottom( true, false, 16, 391 )
	CallingCardGrid:setDataSource( "CallingCardsBlackMarketCardSet" )
	CallingCardGrid:setWidgetType( CoD.CallingCardsSet_BlackMarketWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 4 )
	CallingCardGrid:setSpacing( 13 )
	CallingCardGrid:linkToElementModel( CallingCardGrid, "isBMClassified", true, function ( model )
		local f12_local0 = CallingCardGrid
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	CallingCardGrid:registerEventHandler( "gain_focus", function ( element, event )
		local f13_local0 = nil
		if element.gainFocus then
			f13_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f13_local0 = element.super:gainFocus( event )
		end
		SetElementModelToFocusedElementModel( self, element, "CallingCardsBlackMarketProfiler" )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f13_local0
	end )
	CallingCardGrid:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f14_local0 = nil
		if IsElementInState( element, "New" ) then
			CallingCards_SetOld( element, controller )
			UpdateSelfElementState( menu, element, controller )
			SetElementModelToFocusedElementModel( self, element, "CallingCardsBlackMarketProfiler" )
		else
			SetElementModelToFocusedElementModel( self, element, "CallingCardsBlackMarketProfiler" )
		end
		return f14_local0
	end )
	CallingCardGrid:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	menu:AddButtonCallbackFunction( CallingCardGrid, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CallingCards_SetPlayerBackground( menu, element, controller )
			PlaySoundSetSound( self, "action" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
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
	
	MasterCallingCardWidget.navigation = {
		up = CallingCardGrid
	}
	CallingCardGrid.navigation = {
		down = MasterCallingCardWidget
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	MasterCallingCardWidget.id = "MasterCallingCardWidget"
	CallingCardGrid.id = "CallingCardGrid"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.CallingCardGrid:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MasterCallingCardWidget:close()
		element.CallingCardGrid:close()
		element.CallingCardsBlackMarketProfiler:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

