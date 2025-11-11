require( "ui.uieditor.widgets.MP.EscalationSelect.EscalationSelectListItem" )

CoD.EscalationSelectInventoryList = InheritFrom( LUI.UIElement )
CoD.EscalationSelectInventoryList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EscalationSelectInventoryList )
	self.id = "EscalationSelectInventoryList"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 178 )
	self:setTopBottom( 0, 0, 0, 370 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local possibleItemsList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	possibleItemsList:makeFocusable()
	possibleItemsList:setLeftRight( 0, 0, 0, 178 )
	possibleItemsList:setTopBottom( 0, 0, 34, 370 )
	possibleItemsList:setWidgetType( CoD.EscalationSelectListItem )
	possibleItemsList:setVerticalCount( 4 )
	possibleItemsList:setSpacing( 0 )
	possibleItemsList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	possibleItemsList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( possibleItemsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsLoadoutEscalationItemEquipped( menu, element, controller ) then
			ProcessListAction( self, element, controller )
			UpdateDataSource( self, self.possibleItemsList, controller )
			return true
		else
			ProcessListAction( self, element, controller )
			UpdateDataSource( self, self.possibleItemsList, controller )
			return true
		end
	end, function ( element, menu, controller )
		if IsLoadoutEscalationItemEquipped( menu, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MPUI_CLEAR", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MPUI_EQUIP", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
			return true
		end
	end, false )
	self:addElement( possibleItemsList )
	self.possibleItemsList = possibleItemsList
	
	local HeaderTextBox = LUI.UIText.new()
	HeaderTextBox:setLeftRight( 0, 0, 2, 298 )
	HeaderTextBox:setTopBottom( 0, 0, 7, 34 )
	HeaderTextBox:setAlpha( 0.7 )
	HeaderTextBox:setText( Engine.Localize( "MENU_NEW" ) )
	HeaderTextBox:setTTF( "fonts/UnitedSansSmCdLt_0.ttf" )
	HeaderTextBox:setLetterSpacing( 1 )
	HeaderTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HeaderTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HeaderTextBox )
	self.HeaderTextBox = HeaderTextBox
	
	local UseStringTextBox = LUI.UIText.new()
	UseStringTextBox:setLeftRight( 0, 0, 0, 176 )
	UseStringTextBox:setTopBottom( 0, 0, 7, 34 )
	UseStringTextBox:setAlpha( 0.7 )
	UseStringTextBox:setText( Engine.Localize( "MENU_NEW" ) )
	UseStringTextBox:setTTF( "fonts/UnitedSansSmCdLt_0.ttf" )
	UseStringTextBox:setLetterSpacing( 1 )
	UseStringTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	UseStringTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( UseStringTextBox )
	self.UseStringTextBox = UseStringTextBox
	
	possibleItemsList.id = "possibleItemsList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.possibleItemsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.possibleItemsList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

