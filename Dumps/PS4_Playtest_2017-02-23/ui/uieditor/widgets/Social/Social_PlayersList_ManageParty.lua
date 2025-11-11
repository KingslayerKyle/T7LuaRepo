require( "ui.uieditor.widgets.Social.Social_PlayersListButton_ManageParty" )
require( "ui.uieditor.widgets.Social.Social_PlayersListButton_Offline" )

CoD.Social_PlayersList_ManageParty = InheritFrom( LUI.UIElement )
CoD.Social_PlayersList_ManageParty.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_PlayersList_ManageParty )
	self.id = "Social_PlayersList_ManageParty"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 961 )
	self:setTopBottom( 0, 0, 0, 748 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local onlineList = LUI.UIList.new( menu, controller, 8, 0, function ( model )
		
	end, false, false, 0, 0, false, false )
	onlineList:makeFocusable()
	onlineList:setLeftRight( 0, 0, 14, 960 )
	onlineList:setTopBottom( 0, 0, -1.5, 676.5 )
	onlineList:setWidgetType( CoD.Social_PlayersListButton_ManageParty )
	onlineList:setVerticalCount( 7 )
	onlineList:setSpacing( 8 )
	onlineList:setDataSource( "SocialOnlinePlayersList" )
	onlineList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		CopyModelFindElement( menu, element, "playerInfo" )
		return retVal
	end )
	onlineList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	onlineList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( onlineList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "J", function ( element, menu, controller, model )
		LobbyQuickJoin( self, element, controller, Enum.JoinType.JOIN_TYPE_FRIEND, true )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "", nil )
		return false
	end, false )
	self:addElement( onlineList )
	self.onlineList = onlineList
	
	local divider0 = LUI.UIImage.new()
	divider0:setLeftRight( 0, 1, 0, 0 )
	divider0:setTopBottom( 0, 0, 675, 697 )
	divider0:setAlpha( 0 )
	self:addElement( divider0 )
	self.divider0 = divider0
	
	local offlineLabel = LUI.UITightText.new()
	offlineLabel:setLeftRight( 0, 1, -2, -2 )
	offlineLabel:setTopBottom( 0, 0, 697, 735 )
	offlineLabel:setAlpha( 0 )
	offlineLabel:setText( Engine.Localize( "MENU_OFFLINE" ) )
	offlineLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( offlineLabel )
	self.offlineLabel = offlineLabel
	
	local offlineList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	offlineList:makeFocusable()
	offlineList:setLeftRight( 0, 0, 13, 574 )
	offlineList:setTopBottom( 0, 0, 735, 825 )
	offlineList:setAlpha( 0 )
	offlineList:setWidgetType( CoD.Social_PlayersListButton_Offline )
	self:addElement( offlineList )
	self.offlineList = offlineList
	
	local divider1 = LUI.UIImage.new()
	divider1:setLeftRight( 0, 1, 0, 0 )
	divider1:setTopBottom( 0, 0, 825, 831 )
	divider1:setAlpha( 0 )
	self:addElement( divider1 )
	self.divider1 = divider1
	
	local divider2 = LUI.UIImage.new()
	divider2:setLeftRight( 0, 1, 0, 0 )
	divider2:setTopBottom( 0, 0, 831, 852 )
	divider2:setAlpha( 0 )
	self:addElement( divider2 )
	self.divider2 = divider2
	
	onlineList.navigation = {
		down = offlineList
	}
	offlineList.navigation = {
		up = onlineList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	onlineList.id = "onlineList"
	offlineList.id = "offlineList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.onlineList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.onlineList:close()
		self.offlineList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

