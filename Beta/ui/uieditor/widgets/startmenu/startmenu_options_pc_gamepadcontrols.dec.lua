require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_CheckBoxOption" )
require( "ui.uieditor.widgets.PC.Utility.TitleTextWidget" )
require( "ui.uieditor.widgets.PC.Utility.DescriptionTextWidget" )

local PostLoadFunc = function ( self, controller )
	self:dispatchEventToChildren( {
		name = "options_refresh",
		controller = controller
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
	self:setTopBottom( true, false, 0, 500 )
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
	
	local titleText = CoD.TitleTextWidget.new( menu, controller )
	titleText:setLeftRight( true, false, 550, 950 )
	titleText:setTopBottom( true, false, 30, 65 )
	self:addElement( titleText )
	self.titleText = titleText
	
	local descriptionText = CoD.DescriptionTextWidget.new( menu, controller )
	descriptionText:setLeftRight( true, false, 550, 850 )
	descriptionText:setTopBottom( true, false, 71.5, 106.5 )
	self:addElement( descriptionText )
	self.descriptionText = descriptionText
	
	titleText:linkToElementModel( keybindList, "label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			titleText.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	descriptionText:linkToElementModel( keybindList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			descriptionText.text:setText( Engine.Localize( modelValue ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.keybindList:close()
		self.titleText:close()
		self.descriptionText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

