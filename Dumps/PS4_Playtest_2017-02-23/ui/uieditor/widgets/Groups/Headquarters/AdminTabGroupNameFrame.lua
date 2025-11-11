require( "ui.uieditor.widgets.Challenges.Challenges_Title" )
require( "ui.uieditor.widgets.Groups.GroupsInputButton" )

CoD.AdminTabGroupNameFrame = InheritFrom( LUI.UIElement )
CoD.AdminTabGroupNameFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AdminTabGroupNameFrame )
	self.id = "AdminTabGroupNameFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1086 )
	self:setTopBottom( 0, 0, 0, 625 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local GroupsInputButton = CoD.GroupsInputButton.new( menu, controller )
	GroupsInputButton:setLeftRight( 0, 0, 0, 578 )
	GroupsInputButton:setTopBottom( 0, 0, 59, 113 )
	GroupsInputButton:subscribeToGlobalModel( controller, "SelectedGroup", "name", function ( model )
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
	
	local ChallengesTitle0 = CoD.Challenges_Title.new( menu, controller )
	ChallengesTitle0:setLeftRight( 0, 0, 0, 300 )
	ChallengesTitle0:setTopBottom( 0, 0, 0, 50 )
	self:addElement( ChallengesTitle0 )
	self.ChallengesTitle0 = ChallengesTitle0
	
	self.ChallengesTitle0:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChallengesTitle0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
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
		self.ChallengesTitle0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

