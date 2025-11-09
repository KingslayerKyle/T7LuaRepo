require( "ui.uieditor.menus.CAC.CustomClass" )
require( "ui.uieditor.widgets.CAC.List1ButtonChooseClass" )

CoD.chooseClassButtonList = InheritFrom( LUI.UIElement )
CoD.chooseClassButtonList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.chooseClassButtonList )
	self.id = "chooseClassButtonList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 338 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local buttonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 0, 280 )
	buttonList:setTopBottom( true, false, 0, 338 )
	buttonList:setWidgetType( CoD.List1ButtonChooseClass )
	buttonList:setVerticalCount( 10 )
	buttonList:setDataSource( "ChooseClassList" )
	buttonList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f2_local0 = nil
		SetCustomParentClassNum( self, element, controller )
		ResetCustomClassStartingFocus( self, element, controller, false )
		return f2_local0
	end )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsMenuInState( menu, "ExtraSlots" ) then
			SetCustomParentClassNum( self, element, controller )
			NavigateToMenu( self, "CustomClass", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsMenuInState( menu, "ExtraSlots" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	buttonList.id = "buttonList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.buttonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttonList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

