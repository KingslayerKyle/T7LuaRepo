require( "ui.uieditor.widgets.GameSettings.GameSettings_Description" )
require( "ui.uieditor.widgets.Controls.Slider_Small" )

local PrepareGlobalSettingsOptions = function ( controller )
	local optionsTable = {}
	local gametype = Dvar.ui_gametype:get()
	local settingInfo = nil
	local globalSettings = CoD.GameOptions.GlobalSettings
	if globalSettings and #globalSettings > 0 then
		for index, setting in ipairs( globalSettings ) do
			settingInfo = CoD.GameOptions.GameSettings[setting]
			table.insert( optionsTable, CoD.OptionsUtility.CreateListOptions( controller, settingInfo.name, settingInfo.hintText, setting, settingInfo, "GameTypeOptionsList_" .. REG9 ) )
		end
	end
	return optionsTable
end

DataSources.GlobalSettings = DataSourceHelpers.ListSetup( "GlobalSettings", PrepareGlobalSettingsOptions, nil, nil, nil )
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
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	List0:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingsDescription0:close()
		self.List0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

