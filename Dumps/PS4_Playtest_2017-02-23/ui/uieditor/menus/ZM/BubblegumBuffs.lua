require( "ui.uieditor.menus.ZM.BubblegumPackEdit" )
require( "ui.uieditor.menus.ZM.BubblegumPacks" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumBuffTitle" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumFootnote" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPack" )
require( "ui.uieditor.widgets.Lobby.Common.FE_List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMember" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )

local SetupForPC = function ( self, controller )
	if CoD.useMouse then
		self.LobbyList.m_mouseDisabled = true
	end
end

local PostLoadFunc = function ( self, controller )
	self.disableBlur = true
	if self.LobbyList then
		self.LobbyList:makeNotFocusable()
	end
	SetupForPC( self, controller )
end

LUI.createMenu.BubblegumBuffs = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BubblegumBuffs" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BubblegumBuffs.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( 0, 0, 0, 1920 )
	scorestreakVignetteContainer:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local EquippedBubbleGumPack = CoD.BubbleGumPack.new( self, controller )
	EquippedBubbleGumPack:setLeftRight( 0, 0, 96, 648 )
	EquippedBubbleGumPack:setTopBottom( 0, 0, 216, 440 )
	EquippedBubbleGumPack:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	self:AddButtonCallbackFunction( EquippedBubbleGumPack, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "BubblegumPacks", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( EquippedBubbleGumPack )
	self.EquippedBubbleGumPack = EquippedBubbleGumPack
	
	local FEList1ButtonLargePH0 = CoD.FE_List1ButtonLarge_PH.new( self, controller )
	FEList1ButtonLargePH0:setLeftRight( 0, 0, 148, 464 )
	FEList1ButtonLargePH0:setTopBottom( 0, 0, 445, 515 )
	FEList1ButtonLargePH0.btnDisplayText:setText( Engine.Localize( "MENU_EDIT_BUBBLEGUM_PACK" ) )
	FEList1ButtonLargePH0:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetElementProperty( element, "isBreadcrumbNew", IsCACAnyBubblegumNew( controller ) )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	FEList1ButtonLargePH0:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	FEList1ButtonLargePH0:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( FEList1ButtonLargePH0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "BubblegumPackEdit", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( FEList1ButtonLargePH0 )
	self.FEList1ButtonLargePH0 = FEList1ButtonLargePH0
	
	local LobbyList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	LobbyList:makeFocusable()
	LobbyList:setLeftRight( 1, 1, -831, -96 )
	LobbyList:setTopBottom( 0, 0, 215, 381 )
	LobbyList:setWidgetType( CoD.LobbyMember )
	LobbyList:setVerticalCount( 4 )
	LobbyList:setDataSource( "LobbyList" )
	self:addElement( LobbyList )
	self.LobbyList = LobbyList
	
	local BubbleGumFootnote = CoD.BubbleGumFootnote.new( self, controller )
	BubbleGumFootnote:setLeftRight( 1, 1, -864, -96 )
	BubbleGumFootnote:setTopBottom( 1, 1, -262, -118 )
	BubbleGumFootnote.FootnoteTextBox:setText( Engine.Localize( "MENU_EQUIPPED_BGB_FOOTNOTE" ) )
	self:addElement( BubbleGumFootnote )
	self.BubbleGumFootnote = BubbleGumFootnote
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( 0, 1, 0, 0 )
	GenericMenuFrame0:setTopBottom( 0, 1, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( 0, 0, 77, 81 )
	LineSide:setTopBottom( 0, 0, 126, 1014 )
	LineSide:setAlpha( 0.5 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local BubbleGumBuffTitle = CoD.BubbleGumBuffTitle.new( self, controller )
	BubbleGumBuffTitle:setLeftRight( 0, 0, 96, 477 )
	BubbleGumBuffTitle:setTopBottom( 0, 0, 157, 195 )
	self:addElement( BubbleGumBuffTitle )
	self.BubbleGumBuffTitle = BubbleGumBuffTitle
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	EquippedBubbleGumPack.navigation = {
		right = LobbyList,
		down = FEList1ButtonLargePH0
	}
	FEList1ButtonLargePH0.navigation = {
		up = EquippedBubbleGumPack
	}
	LobbyList.navigation = {
		left = EquippedBubbleGumPack
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderKickerAndIcon( self )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "GenericMenuFrame0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		SetHeadingKickerText( "MENU_PLAY_LOCAL" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		if not IsLAN() then
			SetHeadingKickerText( "MPUI_PUBLIC_MATCH_LOBBY" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		SaveLoadout( self, controller )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		SetPerControllerTableProperty( controller, "updateNewBreadcrumbs", true )
		ForceLobbyButtonUpdate( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
		return true
	end, false )
	EquippedBubbleGumPack.id = "EquippedBubbleGumPack"
	FEList1ButtonLargePH0.id = "FEList1ButtonLargePH0"
	LobbyList.id = "LobbyList"
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.EquippedBubbleGumPack:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.scorestreakVignetteContainer:close()
		self.EquippedBubbleGumPack:close()
		self.FEList1ButtonLargePH0:close()
		self.LobbyList:close()
		self.BubbleGumFootnote:close()
		self.GenericMenuFrame0:close()
		self.BubbleGumBuffTitle:close()
		self.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BubblegumBuffs.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

