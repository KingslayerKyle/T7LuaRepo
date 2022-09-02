-- e332c717fe39315076dd6b9add918c5e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.PC.Utility.OptionInfoWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:dispatchEventToChildren( {
		name = "options_refresh",
		controller = f1_arg1
	} )
	f1_arg0.voiceOptionsList.m_managedItemPriority = true
	f1_arg0:registerEventHandler( "dropdown_triggered", function ( element, event )
		for f2_local0 = 1, element.voiceOptionsList.requestedRowCount, 1 do
			local f2_local3 = element.voiceOptionsList:getItemAtPosition( f2_local0, 1 )
			if event.inUse then
				if f2_local3 ~= event.widget then
					f2_local3.m_inputDisabled = true
				end
			end
			f2_local3.m_inputDisabled = false
		end
	end )
end

CoD.StartMenu_Options_PC_Voice_Voice = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_PC_Voice_Voice.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_PC_Voice_Voice )
	self.id = "StartMenu_Options_PC_Voice_Voice"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1100 )
	self:setTopBottom( true, false, 0, 600 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local voiceOptionsList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	voiceOptionsList:makeFocusable()
	voiceOptionsList:setLeftRight( true, false, 0, 500 )
	voiceOptionsList:setTopBottom( true, false, 30, 370 )
	voiceOptionsList:setDataSource( "OptionVoiceVoice" )
	voiceOptionsList:setWidgetType( CoD.OptionDropdown )
	voiceOptionsList:setVerticalCount( 10 )
	voiceOptionsList:setSpacing( 0 )
	self:addElement( voiceOptionsList )
	self.voiceOptionsList = voiceOptionsList
	
	local optionInfo = CoD.OptionInfoWidget.new( menu, controller )
	optionInfo:setLeftRight( true, false, 550, 950 )
	optionInfo:setTopBottom( true, false, 30, 330 )
	self:addElement( optionInfo )
	self.optionInfo = optionInfo
	
	optionInfo:linkToElementModel( voiceOptionsList, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			optionInfo.description:setText( Engine.Localize( description ) )
		end
	end )
	optionInfo:linkToElementModel( voiceOptionsList, "label", true, function ( model )
		local label = Engine.GetModelValue( model )
		if label then
			optionInfo.title.itemName:setText( Engine.Localize( label ) )
		end
	end )
	voiceOptionsList.id = "voiceOptionsList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.voiceOptionsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.voiceOptionsList:close()
		element.optionInfo:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

