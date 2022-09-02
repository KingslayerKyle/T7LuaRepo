-- 8a833a3d4dc2c3a0fc6f23ebdbc7016c
-- This hash is used for caching, delete to decompile the file again

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
	menu:AddButtonCallbackFunction( customizationList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		if not IsDisabled( f5_arg0, f5_arg2 ) and IsElementPropertyValue( f5_arg0, "headItem", true ) then
			NavigateToMenu( self, "ChooseGender", true, f5_arg2 )
			return true
		elseif not IsDisabled( f5_arg0, f5_arg2 ) then
			BeginEdittingHeroOption( f5_arg1, f5_arg0, f5_arg2 )
			PlaySoundAlias( "uin_paint_decal_nav" )
			EnableMouseOnMenuElement( f5_arg1, "optionsList", f5_arg2 )
			return true
		else
			
		end
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f6_arg0, f6_arg2 ) and IsElementPropertyValue( f6_arg0, "headItem", true ) then
			return true
		elseif not IsDisabled( f6_arg0, f6_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( customizationList )
	self.customizationList = customizationList
	
	customizationList.id = "customizationList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.customizationList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
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

