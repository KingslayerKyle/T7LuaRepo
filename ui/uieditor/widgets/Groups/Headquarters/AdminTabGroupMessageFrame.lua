-- 7b319a1f7cea5fec972528e32baac776
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 724 )
	self:setTopBottom( true, false, 0, 417 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local GroupsInputButton = CoD.GroupsInputButton.new( menu, controller )
	GroupsInputButton:setLeftRight( true, false, 170.5, 555.5 )
	GroupsInputButton:setTopBottom( true, false, 26.22, 176.22 )
	GroupsInputButton:subscribeToGlobalModel( controller, "SelectedGroup", "message", function ( model )
		local message = Engine.GetModelValue( model )
		if message then
			GroupsInputButton.Text:setText( message )
		end
	end )
	GroupsInputButton:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	GroupsInputButton:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( GroupsInputButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		ProcessListAction( self, f5_arg0, f5_arg2 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( GroupsInputButton )
	self.GroupsInputButton = GroupsInputButton
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 172.5, 555.5 )
	Title:setTopBottom( true, false, -0.32, 24.68 )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	self.Title:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			Title:setText( Engine.Localize( displayText ) )
		end
	end )
	GroupsInputButton.id = "GroupsInputButton"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.GroupsInputButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsInputButton:close()
		element.Title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

