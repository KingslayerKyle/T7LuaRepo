-- 63ed6335a033ef8d9cd728a5b201cd37
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_KeyBinder" )
require( "ui.uieditor.widgets.PC.Utility.OptionInfoWidget" )

local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].controlsCategoryPC = "move"
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0:dispatchEventToChildren( {
		name = "options_refresh",
		controller = f2_arg1
	} )
end

CoD.StartMenu_Options_PC_MoveControls = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_PC_MoveControls.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_PC_MoveControls )
	self.id = "StartMenu_Options_PC_MoveControls"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1100 )
	self:setTopBottom( true, false, 0, 600 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local keybindList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	keybindList:makeFocusable()
	keybindList:setLeftRight( true, false, 0, 500 )
	keybindList:setTopBottom( true, false, 30, 506 )
	keybindList:setDataSource( "OptionKeyBindings" )
	keybindList:setWidgetType( CoD.StartMenu_Options_KeyBinder )
	keybindList:setVerticalCount( 14 )
	keybindList:setSpacing( 0 )
	self:addElement( keybindList )
	self.keybindList = keybindList
	
	local keybindText = LUI.UIText.new()
	keybindText:setLeftRight( true, false, 0, 200 )
	keybindText:setTopBottom( true, false, 0, 30 )
	keybindText:setText( Engine.Localize( "MENU_KEYBINDS" ) )
	keybindText:setTTF( "fonts/default.ttf" )
	keybindText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	keybindText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( keybindText )
	self.keybindText = keybindText
	
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

