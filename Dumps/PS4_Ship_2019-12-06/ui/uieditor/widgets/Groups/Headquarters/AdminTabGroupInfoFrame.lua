require( "ui.uieditor.widgets.Groups.GroupsInputButton" )
require( "ui.uieditor.widgets.Challenges.Challenges_Title" )

CoD.AdminTabGroupInfoFrame = InheritFrom( LUI.UIElement )
CoD.AdminTabGroupInfoFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AdminTabGroupInfoFrame )
	self.id = "AdminTabGroupInfoFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 724 )
	self:setTopBottom( true, false, 0, 417 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local GroupsInputButton = CoD.GroupsInputButton.new( menu, controller )
	GroupsInputButton:setLeftRight( true, false, 0, 385 )
	GroupsInputButton:setTopBottom( true, false, 38.22, 72.22 )
	GroupsInputButton:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	GroupsInputButton:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( GroupsInputButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( GroupsInputButton )
	self.GroupsInputButton = GroupsInputButton
	
	local ChallengesTitle0 = CoD.Challenges_Title.new( menu, controller )
	ChallengesTitle0:setLeftRight( true, false, 3, 199 )
	ChallengesTitle0:setTopBottom( true, false, 0, 32.25 )
	self:addElement( ChallengesTitle0 )
	self.ChallengesTitle0 = ChallengesTitle0
	
	self.GroupsInputButton:linkToElementModel( self, "currentText", true, function ( model )
		local currentText = Engine.GetModelValue( model )
		if currentText then
			GroupsInputButton.Text:setText( currentText )
		end
	end )
	self.ChallengesTitle0:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			ChallengesTitle0.weaponNameLabel:setText( Engine.Localize( displayText ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsInputButton:close()
		element.ChallengesTitle0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

