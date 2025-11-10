require( "ui.uieditor.widgets.CallingCards.CallingCards_BlackMarket_Set_Widget" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

DataSources.CallingCardSetBlackMarket = DataSourceHelpers.ListSetup( "CallingCardSetBlackMarket", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
		CoD.perController[f2_arg2].BlackMarketUtility_CurrentCallingCardSetName = f2_arg3.setName
		OpenPopup( f2_arg4, "CallingCards_BlackMarket", f2_arg2 )
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
		if f1_local11.isBMClassified == false then
			f1_local9 = f1_local11.masterCardIconId
		end
		table.insert( f1_local0, {
			models = {
				title = f1_local11.title .. "_SET",
				setCount = f1_local11.setCount,
				["rarityType.rarity"] = f1_local11.rarity,
				iconId = f1_local9,
				isSetBMClassified = f1_local11.isSetBMClassified,
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
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardSet = LUI.UIList.new( menu, controller, 10, 0, nil, true, false, 0, 0, false, false )
	CallingCardSet:makeFocusable()
	CallingCardSet:setLeftRight( false, false, -460, 460 )
	CallingCardSet:setTopBottom( true, false, 36, 461 )
	CallingCardSet:setDataSource( "CallingCardSetBlackMarket" )
	CallingCardSet:setWidgetType( CoD.CallingCards_BlackMarket_Set_Widget )
	CallingCardSet:setHorizontalCount( 3 )
	CallingCardSet:setVerticalCount( 3 )
	CallingCardSet:setSpacing( 10 )
	CallingCardSet:setVerticalCounter( CoD.verticalCounter )
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
	CallingCardSet:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	CallingCardSet:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsSelfModelValueTrue( element, controller, "isSetBMClassified" ) then
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardSet:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

