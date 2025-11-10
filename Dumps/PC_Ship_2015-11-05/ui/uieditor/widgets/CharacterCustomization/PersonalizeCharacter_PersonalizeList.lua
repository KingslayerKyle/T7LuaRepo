require( "ui.uieditor.menus.CharacterCustomization.ChooseGender" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_ListButton" )

CoD.PersonalizeCharacter_PersonalizeList = InheritFrom( LUI.UIElement )
CoD.PersonalizeCharacter_PersonalizeList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeCharacter_PersonalizeList )
	self.id = "PersonalizeCharacter_PersonalizeList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 632 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local customizationList = LUI.UIList.new( menu, controller, 3.5, 0, nil, false, false, 0, 0, false, false )
	customizationList:makeFocusable()
	customizationList:setLeftRight( true, false, 0, 335 )
	customizationList:setTopBottom( true, false, 0, 721 )
	customizationList:setDataSource( "CharacterCustomizationButtonList" )
	customizationList:setWidgetType( CoD.PersonalizeCharacter_ListButton )
	customizationList:setVerticalCount( 7 )
	customizationList:setSpacing( 3.5 )
	customizationList:linkToElementModel( customizationList, "disabled", true, function ( model )
		local f2_local0 = customizationList
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	customizationList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	customizationList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( customizationList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) and IsElementPropertyValue( element, "headItem", true ) then
			NavigateToMenu( self, "ChooseGender", true, controller )
			return true
		elseif not IsDisabled( element, controller ) then
			BeginEdittingHeroOption( menu, element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( element, controller ) and IsElementPropertyValue( element, "headItem", true ) then
			return true
		elseif not IsDisabled( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( customizationList )
	self.customizationList = customizationList
	
	customizationList.id = "customizationList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.customizationList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.customizationList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

