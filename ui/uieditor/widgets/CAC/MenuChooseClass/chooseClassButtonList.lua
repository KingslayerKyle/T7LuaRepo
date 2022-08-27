-- b35058a7c252033a8289909e0b191063
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.CAC.CustomClass" )
require( "ui.uieditor.widgets.CAC.List1ButtonChooseClass" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

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
		local f4_local0 = nil
		SetCustomParentClassNum( self, element, controller )
		ResetCustomClassStartingFocus( self, element, controller, false )
		return f4_local0
	end )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if not IsMenuInState( f7_arg1, "ExtraSlots" ) then
			SetCustomParentClassNum( self, f7_arg0, f7_arg2 )
			NavigateToMenu( self, "CustomClass", true, f7_arg2 )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if not IsMenuInState( f8_arg1, "ExtraSlots" ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.buttonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
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

