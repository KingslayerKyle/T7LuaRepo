require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_CheckBoxOption" )
require( "ui.uieditor.widgets.PC.Utility.OptionInfoWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:dispatchEventToChildren( {
		name = "options_refresh",
		controller = f1_arg1
	} )
end

CoD.StartMenu_Options_PC_GamepadControls = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_PC_GamepadControls.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_PC_GamepadControls )
	self.id = "StartMenu_Options_PC_GamepadControls"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1100 )
	self:setTopBottom( true, false, 0, 600 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local keybindList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	keybindList:makeFocusable()
	keybindList:setLeftRight( true, false, 0, 500 )
	keybindList:setTopBottom( true, false, 30, 268 )
	keybindList:setDataSource( "OptionGamepadSettingsPC" )
	keybindList:setWidgetType( CoD.StartMenu_Options_CheckBoxOption )
	keybindList:setVerticalCount( 7 )
	keybindList:setSpacing( 0 )
	self:addElement( keybindList )
	self.keybindList = keybindList
	
	local optionInfo = CoD.OptionInfoWidget.new( menu, controller )
	optionInfo:setLeftRight( true, false, 550, 950 )
	optionInfo:setTopBottom( true, false, 30, 330 )
	self:addElement( optionInfo )
	self.optionInfo = optionInfo
	
	optionInfo:linkToElementModel( keybindList, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			optionInfo.description:setText( Engine.Localize( description ) )
		end
	end )
	optionInfo:linkToElementModel( keybindList, "label", true, function ( model )
		local label = Engine.GetModelValue( model )
		if label then
			optionInfo.title.itemName:setText( Engine.Localize( label ) )
		end
	end )
	keybindList.id = "keybindList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.keybindList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.keybindList:close()
		element.optionInfo:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

