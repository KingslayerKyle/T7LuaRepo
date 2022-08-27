-- 1889a85208bc9b9996090881cfc9d844
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Heroes.heroCustomizationOption" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

CoD.heroSelectOptionList = InheritFrom( LUI.UIElement )
CoD.heroSelectOptionList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.heroSelectOptionList )
	self.id = "heroSelectOptionList"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 564 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local optionsList = LUI.UIList.new( menu, controller, 7, 0, nil, true, false, 0, 0, false, false )
	optionsList:makeFocusable()
	optionsList:setLeftRight( true, false, 10, 348 )
	optionsList:setTopBottom( true, false, 0, 453 )
	optionsList:setWidgetType( CoD.heroCustomizationOption )
	optionsList:setHorizontalCount( 3 )
	optionsList:setVerticalCount( 4 )
	optionsList:setSpacing( 7 )
	optionsList:setDataSource( "HeroChooseOptionButtonList" )
	optionsList:linkToElementModel( optionsList, "optionIndex", true, function ( model )
		local f2_local0 = optionsList
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "optionIndex"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	optionsList:linkToElementModel( optionsList, "isBMClassified", true, function ( model )
		local f3_local0 = optionsList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	optionsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f4_local0 = nil
		if IsCurrentNewHeroOption( self, element, controller ) then
			HeroOptionHighlighted( menu, element, controller )
			PlaySoundSetSound( self, "list_up" )
			SetHeroItemOptionAsOld( menu, element, controller )
			UpdateSelfElementState( menu, element, controller )
		else
			HeroOptionHighlighted( menu, element, controller )
			PlaySoundSetSound( self, "list_up" )
		end
		return f4_local0
	end )
	optionsList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	optionsList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( optionsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if not IsCurrentLockedHeroOption( f7_arg0, f7_arg2 ) and not IsSelfModelValueTrue( f7_arg0, f7_arg2, "isBMClassified" ) then
			HeroOptionSelected( f7_arg1, f7_arg0, f7_arg2 )
			PlaySoundSetSound( self, "equip_item" )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if not IsCurrentLockedHeroOption( f8_arg0, f8_arg2 ) and not IsSelfModelValueTrue( f8_arg0, f8_arg2, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	local verticalCounter0 = CoD.verticalCounter.new( menu, controller )
	verticalCounter0:setLeftRight( true, false, 74, 274 )
	verticalCounter0:setTopBottom( true, false, 468.26, 493.26 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local f9_local0 = nil
		SetAsListVerticalCounter( self, element, "optionsList" )
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	optionsList.id = "optionsList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.optionsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.optionsList:close()
		element.verticalCounter0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

