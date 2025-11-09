require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_ColorOptionList" )

CoD.PersonalizeCharacter_ColorsList = InheritFrom( LUI.UIElement )
CoD.PersonalizeCharacter_ColorsList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeCharacter_ColorsList )
	self.id = "PersonalizeCharacter_ColorsList"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 471 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, false, 0, 194 )
	BlackBox:setTopBottom( true, false, 8, 38 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local FETitleNumBrdr1 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr1:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr1:setTopBottom( false, false, -235.5, 235.5 )
	FETitleNumBrdr1:setAlpha( 0 )
	self:addElement( FETitleNumBrdr1 )
	self.FETitleNumBrdr1 = FETitleNumBrdr1
	
	local colorsList = LUI.UIList.new( menu, controller, 7, 0, nil, true, false, 0, 0, false, false )
	colorsList:makeFocusable()
	colorsList:setLeftRight( true, false, 3, 338 )
	colorsList:setTopBottom( true, false, 46, 360 )
	colorsList:setDataSource( "CharacterCustomizationColorSetList" )
	colorsList:setWidgetType( CoD.PersonalizeCharacter_ColorOptionList )
	colorsList:setVerticalCount( 3 )
	colorsList:setSpacing( 7 )
	colorsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f2_local0 = nil
		HeroColorSectionHighlighted( menu, element, controller )
		return f2_local0
	end )
	colorsList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	colorsList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( colorsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		HeroColorsSelected( menu, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( colorsList )
	self.colorsList = colorsList
	
	local categoryName = LUI.UITightText.new()
	categoryName:setLeftRight( true, false, 5, 333 )
	categoryName:setTopBottom( true, false, 20, 40 )
	categoryName:setText( Engine.Localize( "MENU_NEW" ) )
	categoryName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local GrayBoxBackground = LUI.UIImage.new()
	GrayBoxBackground:setLeftRight( false, false, -174, 0 )
	GrayBoxBackground:setTopBottom( true, false, 10, 42 )
	GrayBoxBackground:setRGB( 0.82, 0.82, 0.82 )
	GrayBoxBackground:setAlpha( 0 )
	self:addElement( GrayBoxBackground )
	self.GrayBoxBackground = GrayBoxBackground
	
	colorsList.id = "colorsList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.colorsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FETitleNumBrdr1:close()
		element.colorsList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

