require( "ui.uieditor.widgets.Groups.GroupsRosterRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

CoD.AdminTabGroupApplicationsFrame = InheritFrom( LUI.UIElement )
CoD.AdminTabGroupApplicationsFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AdminTabGroupApplicationsFrame )
	self.id = "AdminTabGroupApplicationsFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1086 )
	self:setTopBottom( 0, 0, 0, 625 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local applicationsList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	applicationsList:makeFocusable()
	applicationsList:setLeftRight( 0, 0, 0, 561 )
	applicationsList:setTopBottom( 0, 0, 3, 553 )
	applicationsList:setWidgetType( CoD.GroupsRosterRow )
	applicationsList:setVerticalCount( 6 )
	applicationsList:setVerticalCounter( CoD.verticalCounter )
	applicationsList:setDataSource( "SocialPlayersList" )
	applicationsList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	applicationsList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( applicationsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessGroupApplication( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( applicationsList )
	self.applicationsList = applicationsList
	
	applicationsList.id = "applicationsList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.applicationsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.applicationsList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

