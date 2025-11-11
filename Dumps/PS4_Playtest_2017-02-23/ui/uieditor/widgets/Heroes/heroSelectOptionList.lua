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
	self:setLeftRight( 0, 0, 0, 522 )
	self:setTopBottom( 0, 0, 0, 846 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local optionsList = LUI.UIList.new( menu, controller, 10, 0, nil, true, false, 0, 0, false, false )
	optionsList:makeFocusable()
	optionsList:setLeftRight( 0, 0, 15.5, 521.5 )
	optionsList:setTopBottom( 0, 0, 1, 679 )
	optionsList:setWidgetType( CoD.heroCustomizationOption )
	optionsList:setHorizontalCount( 3 )
	optionsList:setVerticalCount( 4 )
	optionsList:setSpacing( 10 )
	optionsList:setDataSource( "HeroChooseOptionButtonList" )
	optionsList:linkToElementModel( optionsList, "optionIndex", true, function ( model )
		local element = optionsList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "optionIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	optionsList:linkToElementModel( optionsList, "isBMClassified", true, function ( model )
		local element = optionsList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	optionsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsCurrentNewHeroOption( self, element, controller ) then
			HeroOptionHighlighted( menu, element, controller )
			PlaySoundSetSound( self, "list_up" )
			SetHeroItemOptionAsOld( menu, element, controller )
			UpdateSelfElementState( menu, element, controller )
		else
			HeroOptionHighlighted( menu, element, controller )
			PlaySoundSetSound( self, "list_up" )
		end
		return retVal
	end )
	optionsList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	optionsList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( optionsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsCurrentLockedHeroOption( element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			HeroOptionSelected( menu, element, controller )
			PlaySoundSetSound( self, "equip_item" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsCurrentLockedHeroOption( element, controller ) and not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	local verticalCounter0 = CoD.verticalCounter.new( menu, controller )
	verticalCounter0:setLeftRight( 0, 0, 111, 411 )
	verticalCounter0:setTopBottom( 0, 0, 702, 740 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetAsListVerticalCounter( self, element, "optionsList" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	optionsList.navigation = {
		down = verticalCounter0
	}
	verticalCounter0.navigation = {
		up = optionsList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	optionsList.id = "optionsList"
	verticalCounter0.id = "verticalCounter0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.optionsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.optionsList:close()
		self.verticalCounter0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

