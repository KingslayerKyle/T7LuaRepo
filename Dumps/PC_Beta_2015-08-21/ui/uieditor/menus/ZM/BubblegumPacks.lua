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
	self.anyChildUsesUpdateState = true
	
	local bkg = LUI.UIImage.new()
	bkg:setLeftRight( true, false, 0, 1280 )
	bkg:setTopBottom( true, false, -28, 739 )
	bkg:setRGB( 0, 0, 0 )
	bkg:setAlpha( 0 )
	self:addElement( bkg )
	self.bkg = bkg
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_CHOOSE_BUBBLEGUM_PACK_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CHOOSE_BUBBLEGUM_PACK_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local BubbleGumPacks = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	BubbleGumPacks:makeFocusable()
	BubbleGumPacks:setLeftRight( true, false, 64, 344 )
	BubbleGumPacks:setTopBottom( true, true, 142, -240 )
	BubbleGumPacks:setDataSource( "BubbleGumPacks" )
	BubbleGumPacks:setWidgetType( CoD.BubbleGumPackListItem )
	BubbleGumPacks:setVerticalCount( 10 )
	BubbleGumPacks:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	BubbleGumPacks:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	self:AddButtonCallbackFunction( BubbleGumPacks, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
	
	local BubbleGumPackPreview = CoD.BubbleGumPackPreview.new( self, controller )
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f7_local0 = nil
		ShowHeaderIconOnly( self )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "GenericMenuFrame0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not f7_local0 then
			f7_local0 = self:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
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
		menu = self
	} )
	if not self:restoreState() then
		self.BubbleGumPacks:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GenericMenuFrame0:close()
		element.BubbleGumPacks:close()
		element.BubbleGumPackPreview:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BubblegumPacks.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

