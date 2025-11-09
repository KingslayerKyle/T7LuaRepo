require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.BlackMarket.BM_LogoContracts" )
require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_CallingCardContracts_Stickerbook" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disablePopupOpenCloseAnim = true
end

LUI.createMenu.BM_SpecialContracts_CallingCardContracts = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BM_SpecialContracts_CallingCardContracts" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BM_SpecialContracts_CallingCardContracts.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Screen = LUI.UIImage.new()
	Screen:setLeftRight( true, true, 0, 0 )
	Screen:setTopBottom( true, true, 0, 0 )
	Screen:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bg_1080" ) )
	self:addElement( Screen )
	self.Screen = Screen
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( false, true, -453, -110 )
	SelfIdentityBadge:setTopBottom( true, false, 15, 75 )
	SelfIdentityBadge:setAlpha( 0 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainerNOTLobby:setLeftRight( true, true, 1, -1 )
	feFooterContainerNOTLobby:setTopBottom( false, true, -67, 0 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_opened", function ( element, event )
		local f5_local0 = nil
		SizeToSafeArea( element, controller )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local BMLogoContracts = CoD.BM_LogoContracts.new( self, controller )
	BMLogoContracts:setLeftRight( true, false, 33.04, 424.04 )
	BMLogoContracts:setTopBottom( true, false, 5, 126 )
	BMLogoContracts:setScale( 0.95 )
	BMLogoContracts.RecentItems:setText( Engine.Localize( "CONTRACT_SPECIAL_MENU_TITLE" ) )
	self:addElement( BMLogoContracts )
	self.BMLogoContracts = BMLogoContracts
	
	local CallingCardContractsStickerbook = CoD.SpecialContracts_CallingCardContracts_Stickerbook.new( self, controller )
	CallingCardContractsStickerbook:setLeftRight( false, false, -571, 579 )
	CallingCardContractsStickerbook:setTopBottom( false, false, -260, 260 )
	self:addElement( CallingCardContractsStickerbook )
	self.CallingCardContractsStickerbook = CallingCardContractsStickerbook
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	CallingCardContractsStickerbook.id = "CallingCardContractsStickerbook"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.CallingCardContractsStickerbook:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SelfIdentityBadge:close()
		element.feFooterContainerNOTLobby:close()
		element.BMLogoContracts:close()
		element.CallingCardContractsStickerbook:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BM_SpecialContracts_CallingCardContracts.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

