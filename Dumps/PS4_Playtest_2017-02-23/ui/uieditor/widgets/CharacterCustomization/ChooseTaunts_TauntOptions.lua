require( "ui.uieditor.widgets.CharacterCustomization.ChooseTaunt_TauntOptionButton" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseTaunts_TauntOptionInfo" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

CoD.ChooseTaunts_TauntOptions = InheritFrom( LUI.UIElement )
CoD.ChooseTaunts_TauntOptions.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseTaunts_TauntOptions )
	self.id = "ChooseTaunts_TauntOptions"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 312 )
	self:setTopBottom( 0, 0, 0, 846 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local optionsList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	optionsList:makeFocusable()
	optionsList:mergeStateConditions( {
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return IsCurrentTauntNew( self, element, controller )
			end
		}
	} )
	optionsList:linkToElementModel( optionsList, "isBMClassified", true, function ( model )
		menu:updateElementState( optionsList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	optionsList:setLeftRight( 0, 0, 0, 313 )
	optionsList:setTopBottom( 0, 0, 40, 778 )
	optionsList:setWidgetType( CoD.ChooseTaunt_TauntOptionButton )
	optionsList:setVerticalCount( 9 )
	optionsList:setSpacing( 0 )
	optionsList:linkToElementModel( self, "optionsDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			optionsList:setDataSource( modelValue )
		end
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	optionsList:linkToElementModel( optionsList, "canPreview", true, function ( model )
		local element = optionsList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "canPreview"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	optionsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsCurrentTauntNew( self, element, controller ) then
			SetHeroTauntAsOld( self, element, controller )
			UpdateSelfElementState( menu, element, controller )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
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
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			TauntItemSelected( menu, element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
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
	menu:AddButtonCallbackFunction( optionsList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) and IsSelfModelValueTrue( element, controller, "canPreview" ) then
			PreviewTaunt( controller, element )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) and IsSelfModelValueTrue( element, controller, "canPreview" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	local categoryName = LUI.UITightText.new()
	categoryName:setLeftRight( 0, 0, 0, 108 )
	categoryName:setTopBottom( 0, 0, 0, 38 )
	categoryName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	categoryName:linkToElementModel( self, "categoryName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local verticalCounter0 = CoD.verticalCounter.new( menu, controller )
	verticalCounter0:setLeftRight( 0, 0, 6, 306 )
	verticalCounter0:setTopBottom( 0, 0, 780, 818 )
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
	
	local ChooseTauntsTauntOptionInfo0 = CoD.ChooseTaunts_TauntOptionInfo.new( menu, controller )
	ChooseTauntsTauntOptionInfo0:setLeftRight( 0, 0, 354, 926 )
	ChooseTauntsTauntOptionInfo0:setTopBottom( 0, 0, 37.5, 88.5 )
	self:addElement( ChooseTauntsTauntOptionInfo0 )
	self.ChooseTauntsTauntOptionInfo0 = ChooseTauntsTauntOptionInfo0
	
	ChooseTauntsTauntOptionInfo0:linkToElementModel( optionsList, nil, false, function ( model )
		ChooseTauntsTauntOptionInfo0:setModel( model, controller )
	end )
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
		self.ChooseTauntsTauntOptionInfo0:close()
		self.categoryName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

