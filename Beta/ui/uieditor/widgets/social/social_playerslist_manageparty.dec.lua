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
	self:setLeftRight( true, false, 0, 641 )
	self:setTopBottom( true, false, 0, 499 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local onlineList = LUI.UIList.new( menu, controller, 5, 0, function ( model )
		return Engine.GetModelValue( Engine.GetModel( model, "isLocal" ) ) == "0"
	end, false, false, 0, 0, false, false )
	onlineList:makeFocusable()
	onlineList:setLeftRight( true, false, 9, 640 )
	onlineList:setTopBottom( true, false, 0, 450 )
	onlineList:setDataSource( "SocialOnlinePlayersList" )
	onlineList:setWidgetType( CoD.Social_PlayersListButton_ManageParty )
	onlineList:setVerticalCount( 7 )
	onlineList:setSpacing( 5 )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
		return false
	end, false )
	self:addElement( onlineList )
	self.onlineList = onlineList
	
	local divider0 = LUI.UIImage.new()
	divider0:setLeftRight( true, true, 0, 0 )
	divider0:setTopBottom( true, false, 450, 465 )
	divider0:setAlpha( 0 )
	self:addElement( divider0 )
	self.divider0 = divider0
	
	local offlineLabel = LUI.UITightText.new()
	offlineLabel:setLeftRight( true, true, -1, -1 )
	offlineLabel:setTopBottom( true, false, 465, 490 )
	offlineLabel:setAlpha( 0 )
	offlineLabel:setText( Engine.Localize( "MENU_OFFLINE" ) )
	offlineLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( offlineLabel )
	self.offlineLabel = offlineLabel
	
	local offlineList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	offlineList:makeFocusable()
	offlineList:setLeftRight( true, false, 9, 383 )
	offlineList:setTopBottom( true, false, 490, 550 )
	offlineList:setAlpha( 0 )
	offlineList:setWidgetType( CoD.Social_PlayersListButton_Offline )
	self:addElement( offlineList )
	self.offlineList = offlineList
	
	local divider1 = LUI.UIImage.new()
	divider1:setLeftRight( true, true, 0, 0 )
	divider1:setTopBottom( true, false, 550, 554 )
	divider1:setAlpha( 0 )
	self:addElement( divider1 )
	self.divider1 = divider1
	
	local divider2 = LUI.UIImage.new()
	divider2:setLeftRight( true, true, 0, 0 )
	divider2:setTopBottom( true, false, 554, 568 )
	divider2:setAlpha( 0 )
	self:addElement( divider2 )
	self.divider2 = divider2
	
	onlineList.navigation = {
		down = offlineList
	}
	offlineList.navigation = {
		up = onlineList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				onlineList:completeAnimation()
				self.onlineList:setAlpha( 1 )
				self.clipFinished( onlineList, {} )
				divider0:completeAnimation()
				self.divider0:setAlpha( 0 )
				self.clipFinished( divider0, {} )
				offlineLabel:completeAnimation()
				self.offlineLabel:setAlpha( 0 )
				self.clipFinished( offlineLabel, {} )
				offlineList:completeAnimation()
				self.offlineList:setAlpha( 0 )
				self.clipFinished( offlineList, {} )
				divider1:completeAnimation()
				self.divider1:setAlpha( 0 )
				self.clipFinished( divider1, {} )
				divider2:completeAnimation()
				self.divider2:setAlpha( 0 )
				self.clipFinished( divider2, {} )
			end
		}
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

