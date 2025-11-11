require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.PC.Utility.OptionInfoWidget" )

local PostLoadFunc = function ( self, controller )
	self:dispatchEventToChildren( {
		name = "options_refresh",
		controller = controller
	} )
	self.graphicsList.m_managedItemPriority = true
	self:registerEventHandler( "dropdown_triggered", function ( self, event )
		for row = 1, self.graphicsList.requestedRowCount, 1 do
			local widget = self.graphicsList:getItemAtPosition( row, 1 )
			if event.inUse then
				if widget ~= event.widget then
					widget.m_inputDisabled = true
				end
			end
			widget.m_inputDisabled = false
		end
	end )
end

CoD.StartMenu_Options_PC_Graphics_Video = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_PC_Graphics_Video.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_PC_Graphics_Video )
	self.id = "StartMenu_Options_PC_Graphics_Video"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1650 )
	self:setTopBottom( 0, 0, 0, 900 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local graphicsList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	graphicsList:makeFocusable()
	graphicsList:setLeftRight( 0, 0, 0, 750 )
	graphicsList:setTopBottom( 0, 0, 45, 759 )
	graphicsList:setWidgetType( CoD.OptionDropdown )
	graphicsList:setVerticalCount( 14 )
	graphicsList:setSpacing( 0 )
	graphicsList:setDataSource( "OptionGraphicsVideo" )
	self:addElement( graphicsList )
	self.graphicsList = graphicsList
	
	local optionInfo = CoD.OptionInfoWidget.new( menu, controller )
	optionInfo:setLeftRight( 0, 0, 825, 1425 )
	optionInfo:setTopBottom( 0, 0, 45, 495 )
	self:addElement( optionInfo )
	self.optionInfo = optionInfo
	
	optionInfo:linkToElementModel( graphicsList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			optionInfo.description:setText( Engine.Localize( modelValue ) )
		end
	end )
	optionInfo:linkToElementModel( graphicsList, "label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			optionInfo.title.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	graphicsList.id = "graphicsList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.graphicsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.graphicsList:close()
		self.optionInfo:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

