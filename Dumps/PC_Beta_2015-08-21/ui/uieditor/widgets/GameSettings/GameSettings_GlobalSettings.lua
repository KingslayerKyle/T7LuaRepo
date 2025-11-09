require( "ui.uieditor.widgets.GameSettings.GameSettings_Description" )
require( "ui.uieditor.widgets.Controls.Slider_Small" )

DataSources.GlobalSettings = DataSourceHelpers.ListSetup( "GlobalSettings", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = Dvar.ui_gametype:get()
	local f1_local2 = nil
	local f1_local3 = CoD.GameOptions.GlobalSettings
	if f1_local3 and #f1_local3 > 0 then
		for f1_local7, f1_local8 in ipairs( f1_local3 ) do
			f1_local2 = CoD.GameOptions.GameSettings[f1_local8]
			table.insert( f1_local0, CoD.OptionsUtility.CreateListOptions( f1_arg0, f1_local2.name, f1_local2.hintText, f1_local8, f1_local2, "GameTypeOptionsList_" .. f1_local8 ) )
		end
	end
	return f1_local0
end, nil, nil, nil )
CoD.GameSettings_GlobalSettings = InheritFrom( LUI.UIElement )
CoD.GameSettings_GlobalSettings.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_GlobalSettings )
	self.id = "GameSettings_GlobalSettings"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local GameSettingsDescription0 = CoD.GameSettings_Description.new( menu, controller )
	GameSettingsDescription0:setLeftRight( true, false, 638.5, 1127.5 )
	GameSettingsDescription0:setTopBottom( true, false, 35.5, 170.5 )
	self:addElement( GameSettingsDescription0 )
	self.GameSettingsDescription0 = GameSettingsDescription0
	
	local List0 = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	List0:makeFocusable()
	List0:setLeftRight( true, false, -34.5, 635.5 )
	List0:setTopBottom( true, false, 17, 358 )
	List0:setDataSource( "GlobalSettings" )
	List0:setWidgetType( CoD.Slider_Small )
	List0:setVerticalCount( 10 )
	List0:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	List0:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( List0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( List0 )
	self.List0 = List0
	
	List0.id = "List0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.List0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingsDescription0:close()
		element.List0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

