-- 704b6bd80990537fe0eb78f0b732b109
-- This hash is used for caching, delete to decompile the file again

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
	keybindList:setTopBottom( true, false, 30, 540 )
	keybindList:setDataSource( "OptionGamepadSettingsPC" )
	keybindList:setWidgetType( CoD.StartMenu_Options_CheckBoxOption )
	keybindList:setVerticalCount( 15 )
	keybindList:setSpacing( 0 )
	self:addElement( keybindList )
	self.keybindList = keybindList
	
	local optionInfo = CoD.OptionInfoWidget.new( menu, controller )
	optionInfo:setLeftRight( true, false, 550, 950 )
	optionInfo:setTopBottom( true, false, 30, 330 )
	self:addElement( optionInfo )
	self.optionInfo = optionInfo
	
	local splitscreenText = LUI.UIText.new()
	splitscreenText:setLeftRight( true, false, 0, 500 )
	splitscreenText:setTopBottom( true, false, 328, 358 )
	splitscreenText:setText( Engine.Localize( "PLATFORM_SPLITSCREEN" ) )
	splitscreenText:setTTF( "fonts/default.ttf" )
	splitscreenText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	splitscreenText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( splitscreenText )
	self.splitscreenText = splitscreenText
	
	local gamepadText = LUI.UIText.new()
	gamepadText:setLeftRight( true, false, 0, 500 )
	gamepadText:setTopBottom( true, false, 0, 30 )
	gamepadText:setText( Engine.Localize( "PLATFORM_GAMEPAD" ) )
	gamepadText:setTTF( "fonts/default.ttf" )
	gamepadText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	gamepadText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( gamepadText )
	self.gamepadText = gamepadText
	
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.keybindList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
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
