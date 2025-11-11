require( "ui.uieditor.widgets.CallingCards.CallingCards_BlackMarket_Set_Widget" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

DataSources.CallingCardSetBlackMarket = DataSourceHelpers.ListSetup( "CallingCardSetBlackMarket", function ( controller )
	local returnTable = {}
	local OpenStickerbookAction = function ( self, element, controller, actionParam, menu )
		CoD.perController[controller].BlackMarketUtility_CurrentCallingCardSetName = actionParam.setName
		local popup = OpenPopup( menu, "CallingCards_BlackMarket", controller )
		popup.callingCardShowcaseSlot = menu.callingCardShowcaseSlot
	end
	
	local commonOwnedCount, commonSetCountString, newCommonCount = CoD.BlackMarketUtility.BuildCallingCardSets( controller )
	local isCommonBMClassified = true
	if commonOwnedCount > 0 then
		isCommonBMClassified = false
	end
	table.insert( returnTable, {
		models = {
			title = "",
			setCount = commonSetCountString,
			["rarityType.rarity"] = "MPUI_BM_COMMON",
			iconId = 0,
			isSetBMClassified = isCommonBMClassified,
			newCount = newCommonCount
		},
		properties = {
			commonSet = true,
			action = OpenStickerbookAction,
			actionParam = {}
		}
	} )
	for index, infoTable in pairs( CoD.BlackMarketUtility.CallingCardsTable ) do
		local f1_local3 = infoTable.iconId
		if infoTable.isBMClassified == false then
			f1_local3 = infoTable.masterCardIconId
		end
		table.insert( returnTable, {
			models = {
				title = infoTable.title .. "_SET",
				setCount = infoTable.setCount,
				["rarityType.rarity"] = infoTable.rarity,
				iconId = f1_local3,
				isSetBMClassified = infoTable.isSetBMClassified,
				newCount = infoTable.newCount
			},
			properties = {
				action = OpenStickerbookAction,
				actionParam = {
					setName = infoTable.name
				}
			}
		} )
	end
	return returnTable
end )
CoD.CallingCards_Set_BlackMarket = InheritFrom( LUI.UIElement )
CoD.CallingCards_Set_BlackMarket.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_Set_BlackMarket )
	self.id = "CallingCards_Set_BlackMarket"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardSet = LUI.UIList.new( menu, controller, 15, 0, nil, true, false, 0, 0, false, false )
	CallingCardSet:makeFocusable()
	CallingCardSet:setLeftRight( 0.5, 0.5, -694.5, 694.5 )
	CallingCardSet:setTopBottom( 0, 0, 55, 691 )
	CallingCardSet:setWidgetType( CoD.CallingCards_BlackMarket_Set_Widget )
	CallingCardSet:setHorizontalCount( 3 )
	CallingCardSet:setVerticalCount( 3 )
	CallingCardSet:setSpacing( 15 )
	CallingCardSet:setVerticalCounter( CoD.verticalCounter )
	CallingCardSet:setDataSource( "CallingCardSetBlackMarket" )
	CallingCardSet:linkToElementModel( CallingCardSet, "isSetBMClassified", true, function ( model )
		local element = CallingCardSet
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isSetBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	CallingCardSet:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CallingCardSet:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CallingCardSet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isSetBMClassified" ) then
			CopyElementToPerControllerTable( controller, element, "currentCallingCardBlackMarketElement" )
			ProcessListAction( self, element, controller )
			PlaySoundSetSound( self, "action" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueTrue( element, controller, "isSetBMClassified" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CallingCardSet )
	self.CallingCardSet = CallingCardSet
	
	CallingCardSet.id = "CallingCardSet"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.CallingCardSet:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardSet:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

