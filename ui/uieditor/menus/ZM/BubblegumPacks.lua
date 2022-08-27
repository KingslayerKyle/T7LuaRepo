-- a3e04fbb6954618d49b3bf268acfed48
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.ZM.BubblegumPackOptions" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackListItem" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackListItem" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackPreview" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	if f1_arg0.BubbleGumPackPreview then
		f1_arg0.BubbleGumPackPreview:makeNotFocusable()
	end
end

LUI.createMenu.BubblegumPacks = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BubblegumPacks" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BubblegumPacks.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f2_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 658 )
	LeftPanel:setTopBottom( true, false, 78, 738 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( true, false, 64, 658 )
	Black:setTopBottom( true, false, 78, 738 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0.48 )
	self:addElement( Black )
	self.Black = Black
	
	local BubbleGumPacks = LUI.UIList.new( f2_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	BubbleGumPacks:makeFocusable()
	BubbleGumPacks:setLeftRight( true, false, 87, 367 )
	BubbleGumPacks:setTopBottom( true, false, 285, 623 )
	BubbleGumPacks:setDataSource( "BubbleGumPacks" )
	BubbleGumPacks:setWidgetType( CoD.BubbleGumPackListItem )
	BubbleGumPacks:setVerticalCount( 10 )
	BubbleGumPacks:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		SetBubblegumPackIndex( self, element, controller )
		return f3_local0
	end )
	BubbleGumPacks:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	BubbleGumPacks:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	f2_local1:AddButtonCallbackFunction( BubbleGumPacks, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		SetBubblegumPackIndex( self, f6_arg0, f6_arg2 )
		EquipBubblegumPack( self, f6_arg0, f6_arg2 )
		SendClientScriptMenuChangeNotify( f6_arg2, f6_arg1, false )
		GoBack( self, f6_arg2 )
		ClearMenuSavedState( f6_arg1 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BubbleGumPacks )
	self.BubbleGumPacks = BubbleGumPacks
	
	local BubbleGumPackPreview = CoD.BubbleGumPackPreview.new( f2_local1, controller )
	BubbleGumPackPreview:setLeftRight( true, false, 77, 645 )
	BubbleGumPackPreview:setTopBottom( true, false, 136, 589 )
	self:addElement( BubbleGumPackPreview )
	self.BubbleGumPackPreview = BubbleGumPackPreview
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( f2_local1, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_CHOOSE_BUBBLEGUM_PACK_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CHOOSE_BUBBLEGUM_PACK_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f2_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	BubbleGumPackPreview:linkToElementModel( BubbleGumPacks, nil, false, function ( model )
		BubbleGumPackPreview:setModel( model, controller )
	end )
	BubbleGumPacks.navigation = {
		up = BubbleGumPackPreview,
		right = BubbleGumPackPreview
	}
	BubbleGumPackPreview.navigation = {
		left = BubbleGumPacks,
		down = BubbleGumPacks
	}
	CoD.Menu.AddNavigationHandler( f2_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f9_local0 = nil
		SendClientScriptMenuChangeNotify( controller, f2_local1, true )
		ShowHeaderIconOnly( f2_local1 )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "GenericMenuFrame0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		SendClientScriptMenuChangeNotify( f10_arg2, f10_arg1, false )
		GoBack( self, f10_arg2 )
		ClearMenuSavedState( f10_arg1 )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		NavigateToMenu( self, "BubblegumPackOptions", true, f12_arg2 )
		PlaySoundSetSound( self, "menu_sub" )
		return true
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_BGB_PACK_OPTIONS" )
		return true
	end, false )
	BubbleGumPacks.id = "BubbleGumPacks"
	BubbleGumPackPreview.id = "BubbleGumPackPreview"
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.BubbleGumPacks:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.BubbleGumPacks:close()
		element.BubbleGumPackPreview:close()
		element.GenericMenuFrame0:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BubblegumPacks.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

