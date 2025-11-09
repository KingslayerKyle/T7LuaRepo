require( "ui.uieditor.widgets.CharacterCustomization.ChooseTaunt_TauntOptionButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseTaunts_GestureOptionInfo" )

CoD.ChooseTaunts_GestureOptions = InheritFrom( LUI.UIElement )
CoD.ChooseTaunts_GestureOptions.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseTaunts_GestureOptions )
	self.id = "ChooseTaunts_GestureOptions"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 208 )
	self:setTopBottom( true, false, 0, 564 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local optionsList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	optionsList:makeFocusable()
	optionsList:setLeftRight( true, false, 0, 209 )
	optionsList:setTopBottom( true, false, 25, 520 )
	optionsList:setWidgetType( CoD.ChooseTaunt_TauntOptionButton )
	optionsList:setVerticalCount( 9 )
	optionsList:setSpacing( 0 )
	optionsList:linkToElementModel( self, "optionsDatasource", true, function ( model )
		local optionsDatasource = Engine.GetModelValue( model )
		if optionsDatasource then
			optionsList:setDataSource( optionsDatasource )
		end
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
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	optionsList:linkToElementModel( optionsList, "canPreview", true, function ( model )
		local f4_local0 = optionsList
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "canPreview"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	optionsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		if IsCurrentGestureNew( self, element, controller ) then
			SetHeroGestureAsOld( self, element, controller )
			UpdateSelfElementState( menu, element, controller )
		end
		return f5_local0
	end )
	optionsList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f6_local0
	end )
	optionsList:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	menu:AddButtonCallbackFunction( optionsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			GestureItemSelected( menu, element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
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
	menu:AddButtonCallbackFunction( optionsList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) and IsSelfModelValueTrue( element, controller, "canPreview" ) then
			PreviewGesture( controller, element )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "HEROES_PREVIEW_GESTURE" )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) and IsSelfModelValueTrue( element, controller, "canPreview" ) then
			return true
		else
			return false
		end
	end, false )
	optionsList:mergeStateConditions( {
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return IsCurrentGestureNew( self, element, controller )
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
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	local categoryName = LUI.UITightText.new()
	categoryName:setLeftRight( true, false, 0, 72 )
	categoryName:setTopBottom( true, false, 0, 25 )
	categoryName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	categoryName:linkToElementModel( self, "categoryName", true, function ( model )
		local _categoryName = Engine.GetModelValue( model )
		if _categoryName then
			categoryName:setText( LocalizeIntoString( "HEROES_X_GESTURES", _categoryName ) )
		end
	end )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local verticalCounter0 = CoD.verticalCounter.new( menu, controller )
	verticalCounter0:setLeftRight( true, false, 4, 204 )
	verticalCounter0:setTopBottom( true, false, 520, 545 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local f15_local0 = nil
		SetAsListVerticalCounter( self, element, "optionsList" )
		if not f15_local0 then
			f15_local0 = element:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local ChooseTauntsGestureOptionInfo0 = CoD.ChooseTaunts_GestureOptionInfo.new( menu, controller )
	ChooseTauntsGestureOptionInfo0:setLeftRight( true, false, 236, 617 )
	ChooseTauntsGestureOptionInfo0:setTopBottom( true, false, 25, 59 )
	self:addElement( ChooseTauntsGestureOptionInfo0 )
	self.ChooseTauntsGestureOptionInfo0 = ChooseTauntsGestureOptionInfo0
	
	ChooseTauntsGestureOptionInfo0:linkToElementModel( optionsList, nil, false, function ( model )
		ChooseTauntsGestureOptionInfo0:setModel( model, controller )
	end )
	optionsList.id = "optionsList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.optionsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.optionsList:close()
		element.verticalCounter0:close()
		element.ChooseTauntsGestureOptionInfo0:close()
		element.categoryName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

