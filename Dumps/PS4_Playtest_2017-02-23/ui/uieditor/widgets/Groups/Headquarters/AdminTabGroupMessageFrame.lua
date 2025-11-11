require( "ui.uieditor.widgets.Groups.GroupsInputButton" )

CoD.AdminTabGroupMessageFrame = InheritFrom( LUI.UIElement )
CoD.AdminTabGroupMessageFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AdminTabGroupMessageFrame )
	self.id = "AdminTabGroupMessageFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1086 )
	self:setTopBottom( 0, 0, 0, 625 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local GroupsInputButton = CoD.GroupsInputButton.new( menu, controller )
	GroupsInputButton:setLeftRight( 0, 0, 255, 833 )
	GroupsInputButton:setTopBottom( 0, 0, 39, 264 )
	GroupsInputButton:subscribeToGlobalModel( controller, "SelectedGroup", "message", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupsInputButton.Text:setText( modelValue )
		end
	end )
	GroupsInputButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	GroupsInputButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( GroupsInputButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
		return false
	end, false )
	self:addElement( GroupsInputButton )
	self.GroupsInputButton = GroupsInputButton
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 259, 833 )
	Title:setTopBottom( 0, 0, -1, 37 )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	self.Title:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	GroupsInputButton.id = "GroupsInputButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.GroupsInputButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupsInputButton:close()
		self.Title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

