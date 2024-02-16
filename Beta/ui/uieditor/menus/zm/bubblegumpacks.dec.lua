require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackListItem" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackListItem" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackPreview" )

LUI.createMenu.BubblegumPacks = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BubblegumPacks" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BubblegumPacks.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local bkg = LUI.UIImage.new()
	bkg:setLeftRight( true, false, 0, 1280 )
	bkg:setTopBottom( true, false, -28, 739 )
	bkg:setRGB( 0, 0, 0 )
	bkg:setAlpha( 0 )
	self:addElement( bkg )
	self.bkg = bkg
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( menu, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_CHOOSE_BUBBLEGUM_PACK_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CHOOSE_BUBBLEGUM_PACK_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local BubbleGumPacks = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	BubbleGumPacks:makeFocusable()
	BubbleGumPacks:setLeftRight( true, false, 64, 344 )
	BubbleGumPacks:setTopBottom( true, true, 142, -240 )
	BubbleGumPacks:setDataSource( "BubbleGumPacks" )
	BubbleGumPacks:setWidgetType( CoD.BubbleGumPackListItem )
	BubbleGumPacks:setVerticalCount( 10 )
	BubbleGumPacks:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( BubbleGumPacks, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		EquipBubblegumPack( self, element, controller )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BubbleGumPacks )
	self.BubbleGumPacks = BubbleGumPacks
	
	local BubbleGumPackPreview = CoD.BubbleGumPackPreview.new( menu, controller )
	BubbleGumPackPreview:setLeftRight( true, true, 436.5, -64 )
	BubbleGumPackPreview:setTopBottom( true, true, 142, -36 )
	self:addElement( BubbleGumPackPreview )
	self.BubbleGumPackPreview = BubbleGumPackPreview
	
	BubbleGumPackPreview:linkToElementModel( BubbleGumPacks, nil, false, function ( model )
		BubbleGumPackPreview:setModel( model, controller )
	end )
	BubbleGumPacks.navigation = {
		right = BubbleGumPackPreview
	}
	BubbleGumPackPreview.navigation = {
		left = BubbleGumPacks
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderIconOnly( menu )
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
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	BubbleGumPacks.id = "BubbleGumPacks"
	BubbleGumPackPreview.id = "BubbleGumPackPreview"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.BubbleGumPacks:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GenericMenuFrame0:close()
		self.BubbleGumPacks:close()
		self.BubbleGumPackPreview:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BubblegumPacks.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

