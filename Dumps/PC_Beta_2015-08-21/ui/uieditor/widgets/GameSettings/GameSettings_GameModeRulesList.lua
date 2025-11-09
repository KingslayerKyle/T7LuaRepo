require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.Controls.Slider_Small" )
require( "ui.uieditor.widgets.PC.Utility.VerticalListSpacer" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )

CoD.GameSettings_GameModeRulesList = InheritFrom( LUI.UIElement )
CoD.GameSettings_GameModeRulesList.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_GameModeRulesList )
	self.id = "GameSettings_GameModeRulesList"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 615 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local StartMenuOptionHighlight0 = CoD.StartMenu_OptionHighlight.new( menu, controller )
	StartMenuOptionHighlight0:setLeftRight( true, false, 27.5, 173.5 )
	StartMenuOptionHighlight0:setTopBottom( true, false, 0, 40 )
	StartMenuOptionHighlight0.DescTitle:setRGB( 1, 1, 1 )
	StartMenuOptionHighlight0.DescTitle:setText( Engine.Localize( "" ) )
	self:addElement( StartMenuOptionHighlight0 )
	self.StartMenuOptionHighlight0 = StartMenuOptionHighlight0
	
	local List0 = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	List0:makeFocusable()
	List0:setLeftRight( true, false, -9.5, 660.5 )
	List0:setTopBottom( true, false, 40, 358 )
	List0:setWidgetType( CoD.Slider_Small )
	List0:setVerticalCount( 10 )
	List0:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	List0:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( List0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( List0 )
	self.List0 = List0
	
	local VerticalListSpacer0 = CoD.VerticalListSpacer.new( menu, controller )
	VerticalListSpacer0:setLeftRight( true, false, 19.5, 519.5 )
	VerticalListSpacer0:setTopBottom( true, false, 358, 384 )
	self:addElement( VerticalListSpacer0 )
	self.VerticalListSpacer0 = VerticalListSpacer0
	
	local List1 = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	List1:makeFocusable()
	List1:setLeftRight( true, false, 27.5, 307.5 )
	List1:setTopBottom( true, false, 384, 722 )
	List1:setWidgetType( CoD.List1ButtonLarge_PH )
	List1:setVerticalCount( 10 )
	List1:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	List1:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	menu:AddButtonCallbackFunction( List1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( List1 )
	self.List1 = List1
	
	List0.navigation = {
		down = List1
	}
	List1.navigation = {
		up = List0
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	List0.id = "List0"
	List1.id = "List1"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.List0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuOptionHighlight0:close()
		element.List0:close()
		element.VerticalListSpacer0:close()
		element.List1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

