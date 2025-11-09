require( "ui.uieditor.widgets.Heroes.heroCustomizationOption" )

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
	
	local optionsList = LUI.UIList.new( menu, controller, 7, 0, nil, false, false, 0, 0, false, false )
	optionsList:makeFocusable()
	optionsList:setLeftRight( true, false, 10, 348 )
	optionsList:setTopBottom( true, false, 43, 496 )
	optionsList:setDataSource( "HeroChooseOptionButtonList" )
	optionsList:setWidgetType( CoD.heroCustomizationOption )
	optionsList:setHorizontalCount( 3 )
	optionsList:setVerticalCount( 4 )
	optionsList:setSpacing( 7 )
	optionsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f2_local0 = nil
		HeroOptionHighlighted( menu, element, controller )
		return f2_local0
	end )
	optionsList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	optionsList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( optionsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		HeroOptionSelected( menu, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	local GrayBoxBackground = LUI.UIImage.new()
	GrayBoxBackground:setLeftRight( false, false, -167, -103 )
	GrayBoxBackground:setTopBottom( true, false, 10, 42 )
	GrayBoxBackground:setRGB( 0.82, 0.82, 0.82 )
	GrayBoxBackground:setAlpha( 0 )
	self:addElement( GrayBoxBackground )
	self.GrayBoxBackground = GrayBoxBackground
	
	local categoryName = LUI.UITightText.new()
	categoryName:setLeftRight( true, false, 12, 12 )
	categoryName:setTopBottom( true, false, 18, 38 )
	categoryName:setText( Engine.Localize( "" ) )
	categoryName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
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
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

