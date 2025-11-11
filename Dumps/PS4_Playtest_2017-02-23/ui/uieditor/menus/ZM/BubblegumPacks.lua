require( "ui.uieditor.menus.ZM.BubblegumPackOptions" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackListItem" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackPreview" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackListItem" )

local PostLoadFunc = function ( self, controller )
	if self.BubbleGumPackPreview then
		self.BubbleGumPackPreview:makeNotFocusable()
	end
end

LUI.createMenu.BubblegumPacks = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BubblegumPacks" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BubblegumPacks.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 987 )
	LeftPanel:setTopBottom( 0, 0, 117, 1107 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( 0, 0, 96, 987 )
	Black:setTopBottom( 0, 0, 117, 1107 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0.48 )
	self:addElement( Black )
	self.Black = Black
	
	local BubbleGumPacks = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	BubbleGumPacks:makeFocusable()
	BubbleGumPacks:setLeftRight( 0, 0, 130, 550 )
	BubbleGumPacks:setTopBottom( 0, 0, 432, 930 )
	BubbleGumPacks:setWidgetType( CoD.BubbleGumPackListItem )
	BubbleGumPacks:setVerticalCount( 10 )
	BubbleGumPacks:setDataSource( "BubbleGumPacks" )
	BubbleGumPacks:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetBubblegumPackIndex( self, element, controller )
		return retVal
	end )
	BubbleGumPacks:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	BubbleGumPacks:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( BubbleGumPacks, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SetBubblegumPackIndex( self, element, controller )
		EquipBubblegumPack( self, element, controller )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( BubbleGumPacks )
	self.BubbleGumPacks = BubbleGumPacks
	
	local BubbleGumPackPreview = CoD.BubbleGumPackPreview.new( self, controller )
	BubbleGumPackPreview:setLeftRight( 0, 0, 116, 968 )
	BubbleGumPackPreview:setTopBottom( 0, 0, 204, 884 )
	self:addElement( BubbleGumPackPreview )
	self.BubbleGumPackPreview = BubbleGumPackPreview
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( 0, 1, 0, 0 )
	GenericMenuFrame0:setTopBottom( 0, 1, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_CHOOSE_BUBBLEGUM_PACK_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CHOOSE_BUBBLEGUM_PACK_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderIconOnly( self )
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		NavigateToMenu( self, "BubblegumPackOptions", true, controller )
		PlaySoundSetSound( self, "menu_sub" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_BGB_PACK_OPTIONS", nil )
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
		menu = self
	} )
	if not self:restoreState() then
		self.BubbleGumPacks:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.BubbleGumPacks:close()
		self.BubbleGumPackPreview:close()
		self.GenericMenuFrame0:close()
		self.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BubblegumPacks.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

