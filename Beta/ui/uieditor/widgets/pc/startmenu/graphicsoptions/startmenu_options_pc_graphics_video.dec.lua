require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.PC.Utility.TitleTextWidget" )
require( "ui.uieditor.widgets.PC.Utility.DescriptionTextWidget" )

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
	self:setLeftRight( true, false, 0, 1100 )
	self:setTopBottom( true, false, 0, 600 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local graphicsList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	graphicsList:makeFocusable()
	graphicsList:setLeftRight( true, false, 0, 500 )
	graphicsList:setTopBottom( true, false, 30, 506 )
	graphicsList:setDataSource( "OptionGraphicsVideo" )
	graphicsList:setWidgetType( CoD.OptionDropdown )
	graphicsList:setVerticalCount( 14 )
	graphicsList:setSpacing( 0 )
	self:addElement( graphicsList )
	self.graphicsList = graphicsList
	
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
	
	titleText:linkToElementModel( graphicsList, "label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			titleText.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	descriptionText:linkToElementModel( graphicsList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			descriptionText.text:setText( Engine.Localize( modelValue ) )
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
		self.titleText:close()
		self.descriptionText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

