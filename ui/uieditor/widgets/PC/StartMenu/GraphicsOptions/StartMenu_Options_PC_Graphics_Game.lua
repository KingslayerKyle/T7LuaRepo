-- b250ddf01d1a6fa31242ffacc8d8d058
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.PC.Utility.OptionInfoWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Graphics_ColorBlindMinimapPreview" )

local PostLoadFunc = function ( self, controller, menu )
	self:dispatchEventToChildren( {
		name = "options_refresh",
		controller = controller
	} )
	self.graphicsList.m_managedItemPriority = true
	self:registerEventHandler( "dropdown_triggered", function ( element, event )
		for f2_local0 = 1, element.graphicsList.requestedRowCount, 1 do
			local f2_local3 = element.graphicsList:getItemAtPosition( f2_local0, 1 )
			if event.inUse then
				if f2_local3 ~= event.widget then
					f2_local3.m_inputDisabled = true
				end
			end
			f2_local3.m_inputDisabled = false
		end
	end )
end

CoD.StartMenu_Options_PC_Graphics_Game = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_PC_Graphics_Game.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_PC_Graphics_Game )
	self.id = "StartMenu_Options_PC_Graphics_Game"
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
	graphicsList:setWidgetType( CoD.OptionDropdown )
	graphicsList:setVerticalCount( 14 )
	graphicsList:setSpacing( 0 )
	graphicsList:setDataSource( "OptionGraphicsGame" )
	self:addElement( graphicsList )
	self.graphicsList = graphicsList
	
	local optionInfo = CoD.OptionInfoWidget.new( menu, controller )
	optionInfo:setLeftRight( true, false, 550, 950 )
	optionInfo:setTopBottom( true, false, 30, 330 )
	self:addElement( optionInfo )
	self.optionInfo = optionInfo
	
	local StartMenuOptionsGraphicsColorBlindMinimapPreview0 = CoD.StartMenu_Options_Graphics_ColorBlindMinimapPreview.new( menu, controller )
	StartMenuOptionsGraphicsColorBlindMinimapPreview0:setLeftRight( false, false, 0, 500 )
	StartMenuOptionsGraphicsColorBlindMinimapPreview0:setTopBottom( true, false, 200, 460 )
	self:addElement( StartMenuOptionsGraphicsColorBlindMinimapPreview0 )
	self.StartMenuOptionsGraphicsColorBlindMinimapPreview0 = StartMenuOptionsGraphicsColorBlindMinimapPreview0
	
	optionInfo:linkToElementModel( graphicsList, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			optionInfo.description:setText( Engine.Localize( description ) )
		end
	end )
	optionInfo:linkToElementModel( graphicsList, "label", true, function ( model )
		local label = Engine.GetModelValue( model )
		if label then
			optionInfo.title.itemName:setText( Engine.Localize( label ) )
		end
	end )
	StartMenuOptionsGraphicsColorBlindMinimapPreview0:linkToElementModel( graphicsList, "minimapAlpha", true, function ( model )
		local minimapAlpha = Engine.GetModelValue( model )
		if minimapAlpha then
			StartMenuOptionsGraphicsColorBlindMinimapPreview0:setAlpha( minimapAlpha )
		end
	end )
	graphicsList.id = "graphicsList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.graphicsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.graphicsList:close()
		element.optionInfo:close()
		element.StartMenuOptionsGraphicsColorBlindMinimapPreview0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

