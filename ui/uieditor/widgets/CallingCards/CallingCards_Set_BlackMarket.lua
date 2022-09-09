-- 9fbda07bf10af47b52feeb15fd95ee70
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_BlackMarket_Set_Widget" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

DataSources.CallingCardSetBlackMarket = DataSourceHelpers.ListSetup( "CallingCardSetBlackMarket", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
		CoD.perController[f2_arg2].BlackMarketUtility_CurrentCallingCardSetName = f2_arg3.setName
		local f2_local0 = OpenPopup( f2_arg4, "CallingCards_BlackMarket", f2_arg2 )
		f2_local0.callingCardShowcaseSlot = f2_arg4.callingCardShowcaseSlot
	end
	
	local f1_local2, f1_local3, f1_local4 = CoD.BlackMarketUtility.BuildCallingCardSets( f1_arg0 )
	local f1_local5 = true
	if f1_local2 > 0 then
		f1_local5 = false
	end
	table.insert( f1_local0, {
		models = {
			title = "",
			setCount = f1_local3,
			["rarityType.rarity"] = "MPUI_BM_COMMON",
			iconId = 0,
			isSetBMClassified = f1_local5,
			isSetContractClassified = false,
			newCount = f1_local4
		},
		properties = {
			commonSet = true,
			action = f1_local1,
			actionParam = {}
		}
	} )
	for f1_local10, f1_local11 in pairs( CoD.BlackMarketUtility.CallingCardsTable ) do
		local f1_local9 = f1_local11.iconId
		if f1_local11.isBMClassified == false and not f1_local11.isContractClassified and not BlackMarketHideMasterCallingCards() then
			f1_local9 = f1_local11.masterCardIconId
		end
		table.insert( f1_local0, {
			models = {
				title = f1_local11.title .. "_SET",
				setCount = f1_local11.setCount,
				["rarityType.rarity"] = f1_local11.rarity,
				iconId = f1_local9,
				isSetBMClassified = f1_local11.isSetBMClassified,
				isSetContractClassified = f1_local11.isSetContractClassified,
				newCount = f1_local11.newCount
			},
			properties = {
				action = f1_local1,
				actionParam = {
					setName = f1_local11.name
				}
			}
		} )
	end
	return f1_local0
end, true )
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
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardSet = LUI.UIList.new( menu, controller, 10, 0, nil, true, false, 0, 0, false, false )
	CallingCardSet:makeFocusable()
	CallingCardSet:setLeftRight( false, false, -463, 463 )
	CallingCardSet:setTopBottom( true, false, 36, 461 )
	CallingCardSet:setWidgetType( CoD.CallingCards_BlackMarket_Set_Widget )
	CallingCardSet:setHorizontalCount( 3 )
	CallingCardSet:setVerticalCount( 3 )
	CallingCardSet:setSpacing( 10 )
	CallingCardSet:setVerticalCounter( CoD.verticalCounter )
	CallingCardSet:setDataSource( "CallingCardSetBlackMarket" )
	CallingCardSet:linkToElementModel( CallingCardSet, "isSetBMClassified", true, function ( model )
		local f4_local0 = CallingCardSet
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isSetBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	CallingCardSet:linkToElementModel( CallingCardSet, "isSetContractClassified", true, function ( model )
		local f5_local0 = CallingCardSet
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isSetContractClassified"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	CallingCardSet:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	CallingCardSet:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	menu:AddButtonCallbackFunction( CallingCardSet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if not IsSelfModelValueTrue( f8_arg0, f8_arg2, "isSetBMClassified" ) and not IsSelfModelValueTrue( f8_arg0, f8_arg2, "isSetContractClassified" ) then
			CopyElementToPerControllerTable( f8_arg2, f8_arg0, "currentCallingCardBlackMarketElement" )
			ProcessListAction( self, f8_arg0, f8_arg2 )
			PlaySoundSetSound( self, "action" )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if not IsSelfModelValueTrue( f9_arg0, f9_arg2, "isSetBMClassified" ) and not IsSelfModelValueTrue( f9_arg0, f9_arg2, "isSetContractClassified" ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CallingCardSet )
	self.CallingCardSet = CallingCardSet
	
	CallingCardSet.id = "CallingCardSet"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.CallingCardSet:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardSet:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
