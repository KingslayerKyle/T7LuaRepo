require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.PC.Utility.TitleTextWidget" )
require( "ui.uieditor.widgets.PC.Utility.DescriptionTextWidget" )

local PostLoadFunc = function ( self, controller )
	self:dispatchEventToChildren( {
		name = "options_refresh",
		controller = controller
	} )
	self.voiceOptionsList.m_managedItemPriority = true
	self:registerEventHandler( "dropdown_triggered", function ( self, event )
		for row = 1, self.voiceOptionsList.requestedRowCount, 1 do
			local widget = self.voiceOptionsList:getItemAtPosition( row, 1 )
			if event.inUse then
				if widget ~= event.widget then
					widget.m_inputDisabled = true
				end
			end
			widget.m_inputDisabled = false
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
	voiceOptionsList:setTopBottom( true, false, 30, 166 )
	voiceOptionsList:setDataSource( "OptionVoiceVoice" )
	voiceOptionsList:setWidgetType( CoD.OptionDropdown )
	voiceOptionsList:setVerticalCount( 4 )
	voiceOptionsList:setSpacing( 0 )
	self:addElement( voiceOptionsList )
	self.voiceOptionsList = voiceOptionsList
	
	local titleText = CoD.TitleTextWidget.new( menu, controller )
	titleText:setLeftRight( true, false, 550, 950 )
	titleText:setTopBottom( true, false, 30, 65 )
	self:addElement( titleText )
	self.titleText = titleText
	
	local descriptionText = CoD.DescriptionTextWidget.new( menu, controller )
	descriptionText:setLeftRight( true, false, 550, 950 )
	descriptionText:setTopBottom( true, false, 71.5, 106.5 )
	self:addElement( descriptionText )
	self.descriptionText = descriptionText
	
	titleText:linkToElementModel( voiceOptionsList, "label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			titleText.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	descriptionText:linkToElementModel( voiceOptionsList, "label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			descriptionText.text:setText( Engine.Localize( modelValue ) )
		end
	end )
	voiceOptionsList.id = "voiceOptionsList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.voiceOptionsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.voiceOptionsList:close()
		self.titleText:close()
		self.descriptionText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

