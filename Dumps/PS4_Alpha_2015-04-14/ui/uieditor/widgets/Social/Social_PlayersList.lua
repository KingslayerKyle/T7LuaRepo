require( "ui.uieditor.widgets.Social.Social_PlayersListButton" )
require( "ui.uieditor.widgets.Social.Social_PlayersListButton_Offline" )

CoD.Social_PlayersList = InheritFrom( LUI.UIElement )
CoD.Social_PlayersList.new = function ( menu, controller )
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
	self:setClass( CoD.Social_PlayersList )
	self.id = "Social_PlayersList"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 620 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local onlineList = LUI.UIList.new( menu, controller, 7, 0, nil, false, false, 0, 0, false, false )
	onlineList:makeFocusable()
	onlineList:setLeftRight( true, false, 10, 390 )
	onlineList:setTopBottom( true, false, 0, 497 )
	onlineList:setRGB( 1, 1, 1 )
	onlineList:setDataSource( "SocialOnlinePlayersList" )
	onlineList:setWidgetType( CoD.Social_PlayersListButton )
	onlineList:setVerticalCount( 7 )
	onlineList:setSpacing( 7 )
	onlineList.buttonPromptAddFunctions = {}
	onlineList.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	onlineList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		CopyModelFindElement( menu, element, "playerInfo" )
		return retVal
	end )
	onlineList:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			LobbyQuickJoin( self, element, controller, Enum.JoinType.JOIN_TYPE_FRIEND, true )
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	onlineList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.alt1( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	onlineList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "alt1", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	onlineList:updateButtonPromptEventHandlers()
	self:addElement( onlineList )
	self.onlineList = onlineList
	
	local divider0 = LUI.UIImage.new()
	divider0:setLeftRight( true, true, 0, 0 )
	divider0:setTopBottom( true, false, 497, 512 )
	divider0:setRGB( 1, 1, 1 )
	divider0:setAlpha( 0 )
	divider0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( divider0 )
	self.divider0 = divider0
	
	local offlineLabel = LUI.UITightText.new()
	offlineLabel:setLeftRight( true, true, -1, -1 )
	offlineLabel:setTopBottom( true, false, 512, 537 )
	offlineLabel:setRGB( 1, 1, 1 )
	offlineLabel:setAlpha( 0 )
	offlineLabel:setText( Engine.Localize( "MENU_OFFLINE" ) )
	offlineLabel:setTTF( "fonts/Entovo.ttf" )
	self:addElement( offlineLabel )
	self.offlineLabel = offlineLabel
	
	local offlineList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	offlineList:makeFocusable()
	offlineList:setLeftRight( true, false, 9, 389 )
	offlineList:setTopBottom( true, false, 537, 602 )
	offlineList:setRGB( 1, 1, 1 )
	offlineList:setAlpha( 0 )
	offlineList:setWidgetType( CoD.Social_PlayersListButton_Offline )
	self:addElement( offlineList )
	self.offlineList = offlineList
	
	local divider1 = LUI.UIImage.new()
	divider1:setLeftRight( true, true, 0, 0 )
	divider1:setTopBottom( true, false, 602, 606 )
	divider1:setRGB( 1, 1, 1 )
	divider1:setAlpha( 0 )
	divider1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( divider1 )
	self.divider1 = divider1
	
	local divider2 = LUI.UIImage.new()
	divider2:setLeftRight( true, true, 0, 0 )
	divider2:setTopBottom( true, false, 606, 620 )
	divider2:setRGB( 1, 1, 1 )
	divider2:setAlpha( 0 )
	divider2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( divider2 )
	self.divider2 = divider2
	
	onlineList.navigation = {
		down = offlineList
	}
	offlineList.navigation = {
		up = onlineList
	}
	onlineList.id = "onlineList"
	offlineList.id = "offlineList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.onlineList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.onlineList:close()
		self.offlineList:close()
		CoD.Social_PlayersList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

