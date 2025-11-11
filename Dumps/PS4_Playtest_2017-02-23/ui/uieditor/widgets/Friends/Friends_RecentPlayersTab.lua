require( "ui.uieditor.widgets.Friends.FriendsListRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )

CoD.Friends_RecentPlayersTab = InheritFrom( LUI.UIElement )
CoD.Friends_RecentPlayersTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Friends_RecentPlayersTab )
	self.id = "Friends_RecentPlayersTab"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 846 )
	self:setTopBottom( 0, 0, 0, 690 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local listRecent = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	listRecent:makeFocusable()
	listRecent:setLeftRight( 0, 0, 48, 798 )
	listRecent:setTopBottom( 0.5, 0.5, -293, 293 )
	listRecent:setWidgetType( CoD.FriendsListRow )
	listRecent:setVerticalCount( 6 )
	listRecent:setVerticalScrollbar( CoD.verticalScrollbar )
	listRecent:setDataSource( "LobbyFriends" )
	listRecent:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local element = listRecent
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	listRecent:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	listRecent:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( listRecent, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsInTheaterMode() then
			SetFileShareOverrideXuid( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsInTheaterMode() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( listRecent )
	self.listRecent = listRecent
	
	listRecent.id = "listRecent"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.listRecent:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.listRecent:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

