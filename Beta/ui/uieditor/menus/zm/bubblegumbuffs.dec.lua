require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPack" )
require( "ui.uieditor.menus.ZM.BubblegumPacks" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.menus.ZM.BubblegumPackEdit" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumFootnote" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMember" )

local PostLoadFunc = function ( self, controller )
	self.disableBlur = true
	if self.LobbyList then
		self.LobbyList:makeNotFocusable()
	end
end

LUI.createMenu.BubblegumBuffs = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BubblegumBuffs" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BubblegumBuffs.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( menu, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local EquippedBuffsLabel = LUI.UITightText.new()
	EquippedBuffsLabel:setLeftRight( true, false, 64, 264 )
	EquippedBuffsLabel:setTopBottom( true, false, 120, 145 )
	EquippedBuffsLabel:setText( Engine.Localize( "MENU_EQUIPPED_BUBBLEGUM_PACK_CAPS" ) )
	EquippedBuffsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( EquippedBuffsLabel )
	self.EquippedBuffsLabel = EquippedBuffsLabel
	
	local EquippedBubbleGumPack = CoD.BubbleGumPack.new( menu, controller )
	EquippedBubbleGumPack:setLeftRight( true, false, 64, 432 )
	EquippedBubbleGumPack:setTopBottom( true, false, 152, 301 )
	EquippedBubbleGumPack:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	EquippedBubbleGumPack:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( EquippedBubbleGumPack, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "BubblegumPacks", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( EquippedBubbleGumPack )
	self.EquippedBubbleGumPack = EquippedBubbleGumPack
	
	local List1ButtonLargePH0 = CoD.List1ButtonLarge_PH.new( menu, controller )
	List1ButtonLargePH0:setLeftRight( true, false, 64, 344 )
	List1ButtonLargePH0:setTopBottom( true, false, 308, 340 )
	List1ButtonLargePH0.btnDisplayText:setText( Engine.Localize( "MENU_EDIT_BUBBLEGUM_PACK" ) )
	List1ButtonLargePH0.btnDisplayTextStroke:setText( Engine.Localize( "MENU_EDIT_BUBBLEGUM_PACK" ) )
	List1ButtonLargePH0:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	List1ButtonLargePH0:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( List1ButtonLargePH0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "BubblegumPackEdit", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( List1ButtonLargePH0 )
	self.List1ButtonLargePH0 = List1ButtonLargePH0
	
	local BubbleGumFootnote = CoD.BubbleGumFootnote.new( menu, controller )
	BubbleGumFootnote:setLeftRight( true, false, 578, 1216 )
	BubbleGumFootnote:setTopBottom( true, false, 552, 658 )
	BubbleGumFootnote.FootnoteTextBox:setText( Engine.Localize( "MENU_EQUIPPED_BGB_FOOTNOTE" ) )
	self:addElement( BubbleGumFootnote )
	self.BubbleGumFootnote = BubbleGumFootnote
	
	local LobbyList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	LobbyList:makeFocusable()
	LobbyList:setLeftRight( false, true, -554, -64 )
	LobbyList:setTopBottom( true, false, 120, 234 )
	LobbyList:setDataSource( "LobbyList" )
	LobbyList:setWidgetType( CoD.LobbyMember )
	LobbyList:setVerticalCount( 4 )
	self:addElement( LobbyList )
	self.LobbyList = LobbyList
	
	EquippedBubbleGumPack.navigation = {
		right = LobbyList,
		down = List1ButtonLargePH0
	}
	List1ButtonLargePH0.navigation = {
		up = EquippedBubbleGumPack
	}
	LobbyList.navigation = {
		left = EquippedBubbleGumPack
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, menu, true )
		ShowHeaderKickerAndIcon( menu )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "GenericMenuFrame0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		SaveLoadout( self, controller )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	EquippedBubbleGumPack.id = "EquippedBubbleGumPack"
	List1ButtonLargePH0.id = "List1ButtonLargePH0"
	LobbyList.id = "LobbyList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.EquippedBubbleGumPack:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GenericMenuFrame0:close()
		self.EquippedBubbleGumPack:close()
		self.List1ButtonLargePH0:close()
		self.BubbleGumFootnote:close()
		self.LobbyList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BubblegumBuffs.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

