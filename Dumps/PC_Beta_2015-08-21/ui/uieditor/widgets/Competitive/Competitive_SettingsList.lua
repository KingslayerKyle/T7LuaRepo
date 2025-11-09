require( "ui.uieditor.widgets.Controls.Slider_Small" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )

CoD.Competitive_SettingsList = InheritFrom( LUI.UIElement )
CoD.Competitive_SettingsList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Competitive_SettingsList )
	self.id = "Competitive_SettingsList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 670 )
	self:setTopBottom( true, false, 0, 118 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ButtonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 0, 670 )
	ButtonList:setTopBottom( true, false, 45, 107 )
	ButtonList:setWidgetType( CoD.Slider_Small )
	ButtonList:setVerticalCount( 2 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local Title = CoD.StartMenu_OptionHighlight.new( menu, controller )
	Title:setLeftRight( true, false, 40, 382 )
	Title:setTopBottom( true, false, 0, 40 )
	Title:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Title.DescTitle:setRGB( 1, 1, 1 )
	Title.DescTitle:setText( Engine.Localize( "DRAFT SETTINGS" ) )
	self:addElement( Title )
	self.Title = Title
	
	ButtonList.id = "ButtonList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.Title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

