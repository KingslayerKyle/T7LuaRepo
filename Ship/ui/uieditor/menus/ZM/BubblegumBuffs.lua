-- e2322f2b8914314d566dfb9f3f42922a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPack" )
require( "ui.uieditor.menus.ZM.BubblegumPacks" )
require( "ui.uieditor.widgets.Lobby.Common.FE_List1ButtonLarge_PH" )
require( "ui.uieditor.menus.ZM.BubblegumPackEdit" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMember" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumFootnote" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumBuffTitle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if CoD.useMouse then
		f1_arg0.LobbyList.m_mouseDisabled = true
	end
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.disableBlur = true
	if f2_arg0.LobbyList then
		f2_arg0.LobbyList:makeNotFocusable()
	end
	f0_local0( f2_arg0, f2_arg1 )
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BubblegumBuffs.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( f3_local1, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local EquippedBubbleGumPack = CoD.BubbleGumPack.new( f3_local1, controller )
	EquippedBubbleGumPack:setLeftRight( true, false, 64, 432 )
	EquippedBubbleGumPack:setTopBottom( true, false, 144, 293 )
	EquippedBubbleGumPack:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	EquippedBubbleGumPack:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	f3_local1:AddButtonCallbackFunction( EquippedBubbleGumPack, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		NavigateToMenu( self, "BubblegumPacks", true, f6_arg2 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( EquippedBubbleGumPack )
	self.EquippedBubbleGumPack = EquippedBubbleGumPack
	
	local FEList1ButtonLargePH0 = CoD.FE_List1ButtonLarge_PH.new( f3_local1, controller )
	FEList1ButtonLargePH0:setLeftRight( true, false, 64, 344 )
	FEList1ButtonLargePH0:setTopBottom( true, false, 304, 336 )
	FEList1ButtonLargePH0.btnDisplayText:setText( Engine.Localize( "MENU_EDIT_BUBBLEGUM_PACK" ) )
	FEList1ButtonLargePH0.btnDisplayTextStroke:setText( Engine.Localize( "MENU_EDIT_BUBBLEGUM_PACK" ) )
	FEList1ButtonLargePH0:registerEventHandler( "menu_loaded", function ( element, event )
		local f8_local0 = nil
		SetElementProperty( element, "isBreadcrumbNew", IsCACAnyBubblegumNew( controller ) )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	FEList1ButtonLargePH0:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	FEList1ButtonLargePH0:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	f3_local1:AddButtonCallbackFunction( FEList1ButtonLargePH0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		NavigateToMenu( self, "BubblegumPackEdit", true, f11_arg2 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( FEList1ButtonLargePH0 )
	self.FEList1ButtonLargePH0 = FEList1ButtonLargePH0
	
	local LobbyList = LUI.UIList.new( f3_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	LobbyList:makeFocusable()
	LobbyList:setLeftRight( false, true, -554, -64 )
	LobbyList:setTopBottom( true, false, 142, 256 )
	LobbyList:setDataSource( "LobbyList" )
	LobbyList:setWidgetType( CoD.LobbyMember )
	LobbyList:setVerticalCount( 4 )
	self:addElement( LobbyList )
	self.LobbyList = LobbyList
	
	local BubbleGumFootnote = CoD.BubbleGumFootnote.new( f3_local1, controller )
	BubbleGumFootnote:setLeftRight( false, true, -576, -64 )
	BubbleGumFootnote:setTopBottom( false, true, -175, -79 )
	BubbleGumFootnote.FootnoteTextBox:setText( Engine.Localize( "MENU_EQUIPPED_BGB_FOOTNOTE" ) )
	self:addElement( BubbleGumFootnote )
	self.BubbleGumFootnote = BubbleGumFootnote
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( f3_local1, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 50.9, 53.9 )
	LineSide:setTopBottom( true, false, 84, 676 )
	LineSide:setAlpha( 0.5 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local BubbleGumBuffTitle = CoD.BubbleGumBuffTitle.new( f3_local1, controller )
	BubbleGumBuffTitle:setLeftRight( true, false, 64, 318 )
	BubbleGumBuffTitle:setTopBottom( true, false, 105, 130 )
	self:addElement( BubbleGumBuffTitle )
	self.BubbleGumBuffTitle = BubbleGumBuffTitle
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f3_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
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
	CoD.Menu.AddNavigationHandler( f3_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f13_local0 = nil
		SendClientScriptMenuChangeNotify( controller, f3_local1, true )
		ShowHeaderKickerAndIcon( f3_local1 )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "GenericMenuFrame0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		SetHeadingKickerText( "MENU_PLAY_LOCAL" )
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f14_local0 = nil
		if not IsLAN() then
			SetHeadingKickerText( "MPUI_PUBLIC_MATCH_LOBBY" )
		end
		if not f14_local0 then
			f14_local0 = element:dispatchEventToChildren( event )
		end
		return f14_local0
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		SendClientScriptMenuChangeNotify( f15_arg2, f15_arg1, false )
		SaveLoadout( self, f15_arg2 )
		GoBack( self, f15_arg2 )
		ClearMenuSavedState( f15_arg1 )
		SetPerControllerTableProperty( f15_arg2, "updateNewBreadcrumbs", true )
		ForceLobbyButtonUpdate( f15_arg2 )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
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
		menu = f3_local1
	} )
	if not self:restoreState() then
		self.EquippedBubbleGumPack:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.scorestreakVignetteContainer:close()
		element.EquippedBubbleGumPack:close()
		element.FEList1ButtonLargePH0:close()
		element.LobbyList:close()
		element.BubbleGumFootnote:close()
		element.GenericMenuFrame0:close()
		element.BubbleGumBuffTitle:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BubblegumBuffs.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

