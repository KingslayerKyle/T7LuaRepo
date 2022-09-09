-- 4a37fdd172a6f9e06a40662d613d7b78
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.PC.Utility.OptionInfoWidget" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )

CoD.StartMenu_Options_PC_Voice_Text = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_PC_Voice_Text.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_PC_Voice_Text )
	self.id = "StartMenu_Options_PC_Voice_Text"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1100 )
	self:setTopBottom( true, false, 0, 600 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local optionInfo = CoD.OptionInfoWidget.new( menu, controller )
	optionInfo:setLeftRight( true, false, 550, 950 )
	optionInfo:setTopBottom( true, false, 30, 330 )
	self:addElement( optionInfo )
	self.optionInfo = optionInfo
	
	local textOptionsList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	textOptionsList:makeFocusable()
	textOptionsList:setLeftRight( true, false, 0, 500 )
	textOptionsList:setTopBottom( true, false, 30, 370 )
	textOptionsList:setDataSource( "OptionVoiceText" )
	textOptionsList:setWidgetType( CoD.OptionDropdown )
	textOptionsList:setVerticalCount( 10 )
	textOptionsList:setSpacing( 0 )
	self:addElement( textOptionsList )
	self.textOptionsList = textOptionsList
	
	local ChannelText = LUI.UIText.new()
	ChannelText:setLeftRight( true, false, 0, 500 )
	ChannelText:setTopBottom( true, false, 66, 96 )
	ChannelText:setText( Engine.Localize( "PLATFORM_CHAT_CHANNEL_CAPS" ) )
	ChannelText:setTTF( "fonts/default.ttf" )
	ChannelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ChannelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ChannelText )
	self.ChannelText = ChannelText
	
	local PrefixText = LUI.UIText.new()
	PrefixText:setLeftRight( true, false, 0, 500 )
	PrefixText:setTopBottom( true, false, 201, 231 )
	PrefixText:setText( Engine.Localize( "PLATFORM_CHAT_PREFIX_CAPS" ) )
	PrefixText:setTTF( "fonts/default.ttf" )
	PrefixText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PrefixText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PrefixText )
	self.PrefixText = PrefixText
	
	optionInfo:linkToElementModel( textOptionsList, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			optionInfo.description:setText( Engine.Localize( description ) )
		end
	end )
	optionInfo:linkToElementModel( textOptionsList, "label", true, function ( model )
		local label = Engine.GetModelValue( model )
		if label then
			optionInfo.title.itemName:setText( Engine.Localize( label ) )
		end
	end )
	textOptionsList.id = "textOptionsList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.textOptionsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.optionInfo:close()
		element.textOptionsList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
