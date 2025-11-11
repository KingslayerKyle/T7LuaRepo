require( "ui.uieditor.menus.AccountLink.UmbrellaSignIn" )
require( "ui.uieditor.widgets.buttonprompt_small" )
require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.MOTD.MOTD_Button" )
require( "ui.uieditor.widgets.MOTD.MOTD_TitleAndBodyText" )

LUI.createMenu.InGameRegistration = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "InGameRegistration" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "InGameRegistration.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BackgroundDarken = CoD.DialogBackground.new( self, controller )
	BackgroundDarken:setLeftRight( 0, 1, 0, 0 )
	BackgroundDarken:setTopBottom( 0, 1, 0, 0 )
	BackgroundDarken:setRGB( 0.4, 0.4, 0.4 )
	BackgroundDarken:setAlpha( 0.45 )
	self:addElement( BackgroundDarken )
	self.BackgroundDarken = BackgroundDarken
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( 0, 1, 0, 0 )
	scorestreakVignetteContainer:setTopBottom( 0, 1, 0, 0 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local overlayBg = LUI.UIImage.new()
	overlayBg:setLeftRight( 0, 1, 0, 0 )
	overlayBg:setTopBottom( 0, 1, 0, 0 )
	overlayBg:setRGB( 0, 0, 0 )
	overlayBg:setAlpha( 0 )
	self:addElement( overlayBg )
	self.overlayBg = overlayBg
	
	local BlackBack = LUI.UIImage.new()
	BlackBack:setLeftRight( 0, 0, 271, 1641 )
	BlackBack:setTopBottom( 0, 0, 91, 829 )
	BlackBack:setRGB( 0, 0, 0 )
	BlackBack:setAlpha( 0.85 )
	self:addElement( BlackBack )
	self.BlackBack = BlackBack
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( self, controller )
	LobbyMemberBackingMask0:setLeftRight( 0, 1, 271, -279 )
	LobbyMemberBackingMask0:setTopBottom( 0.5, 0.5, -447, 289 )
	LobbyMemberBackingMask0:setRGB( 0, 0, 0 )
	self:addElement( LobbyMemberBackingMask0 )
	self.LobbyMemberBackingMask0 = LobbyMemberBackingMask0
	
	local featlineleft = LUI.UIImage.new()
	featlineleft:setLeftRight( 0, 0, 703, 709 )
	featlineleft:setTopBottom( 0, 0, 321, 1213 )
	featlineleft:setZRot( -90 )
	featlineleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft )
	self.featlineleft = featlineleft
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 221, 263 )
	Image1:setTopBottom( 0.5, 0.5, -448, -444 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local pixelLL = LUI.UIImage.new()
	pixelLL:setLeftRight( 0, 0, 221, 263 )
	pixelLL:setTopBottom( 0.5, 0.5, 287, 291 )
	pixelLL:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL )
	self.pixelLL = pixelLL
	
	local pixelLL0 = LUI.UIImage.new()
	pixelLL0:setLeftRight( 0, 0, 1647, 1689 )
	pixelLL0:setTopBottom( 0.5, 0.5, 287, 291 )
	pixelLL0:setZRot( 180 )
	pixelLL0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL0 )
	self.pixelLL0 = pixelLL0
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( 0, 0, 1647, 1689 )
	Image10:setTopBottom( 0.5, 0.5, -450, -446 )
	Image10:setZRot( 180 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local signinbtn = CoD.MOTD_Button.new( self, controller )
	signinbtn:setLeftRight( 0, 0, 316, 736 )
	signinbtn:setTopBottom( 0, 0, 582.5, 627.5 )
	signinbtn.btnDisplayText:setText( Engine.Localize( "ACCOUNT_LINK_SIGNIN" ) )
	signinbtn.btnDisplayTextStroke:setText( Engine.Localize( "ACCOUNT_LINK_SIGNIN" ) )
	signinbtn:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	signinbtn:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( signinbtn, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBackAndOpenOverlayOnParent( self, "UmbrellaSignIn", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( signinbtn )
	self.signinbtn = signinbtn
	
	local registerbtn = CoD.MOTD_Button.new( self, controller )
	registerbtn:setLeftRight( 0, 0, 316, 736 )
	registerbtn:setTopBottom( 0, 0, 630.5, 675.5 )
	registerbtn.btnDisplayText:setText( Engine.Localize( "ACCOUNT_LINK_CREATE" ) )
	registerbtn.btnDisplayTextStroke:setText( Engine.Localize( "ACCOUNT_LINK_CREATE" ) )
	registerbtn:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	registerbtn:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( registerbtn, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenRegistrationBrowser( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( registerbtn )
	self.registerbtn = registerbtn
	
	local skipbtn = CoD.MOTD_Button.new( self, controller )
	skipbtn:setLeftRight( 0, 0, 316, 736 )
	skipbtn:setTopBottom( 0, 0, 678.5, 723.5 )
	skipbtn.btnDisplayText:setText( Engine.Localize( "ACCOUNT_LINK_SKIP" ) )
	skipbtn.btnDisplayTextStroke:setText( Engine.Localize( "ACCOUNT_LINK_SKIP" ) )
	skipbtn:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	skipbtn:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( skipbtn, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		FinishRegistrationFlow( self, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( skipbtn )
	self.skipbtn = skipbtn
	
	local PromptSelect = CoD.buttonprompt_small.new( self, controller )
	PromptSelect:setLeftRight( 0, 0, 311.5, 632.5 )
	PromptSelect:setTopBottom( 0, 0, 773, 819 )
	PromptSelect.label:setText( Engine.Localize( "MENU_SELECT" ) )
	PromptSelect:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PromptSelect.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( PromptSelect )
	self.PromptSelect = PromptSelect
	
	local PromptBack = CoD.buttonprompt_small.new( self, controller )
	PromptBack:setLeftRight( 0, 0, 495.5, 816.5 )
	PromptBack:setTopBottom( 0, 0, 774, 820 )
	PromptBack.label:setText( Engine.Localize( "MENU_BACK" ) )
	PromptBack:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PromptBack.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( PromptBack )
	self.PromptBack = PromptBack
	
	local FEFeaturedFrame0 = CoD.FE_FeaturedFrame.new( self, controller )
	FEFeaturedFrame0:setLeftRight( 0, 0, 271, 1641 )
	FEFeaturedFrame0:setTopBottom( 0, 0, 91, 829 )
	FEFeaturedFrame0:setAlpha( 0.5 )
	self:addElement( FEFeaturedFrame0 )
	self.FEFeaturedFrame0 = FEFeaturedFrame0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0, 0, 976, 1639 )
	Image00:setTopBottom( 0, 0, 92, 828 )
	Image00:setImage( RegisterImage( "uie_t7_motd_account_img" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local MOTDTitleAndBodyText = CoD.MOTD_TitleAndBodyText.new( self, controller )
	MOTDTitleAndBodyText:setLeftRight( 0, 0, 314, 960 )
	MOTDTitleAndBodyText:setTopBottom( 0, 0, 133, 655 )
	MOTDTitleAndBodyText:subscribeToGlobalModel( controller, "MtxCommsRegistration", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MOTDTitleAndBodyText.TitleLbl0:setText( Engine.Localize( modelValue ) )
		end
	end )
	MOTDTitleAndBodyText:subscribeToGlobalModel( controller, "MtxCommsRegistration", "content_long", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MOTDTitleAndBodyText.txtDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MOTDTitleAndBodyText )
	self.MOTDTitleAndBodyText = MOTDTitleAndBodyText
	
	signinbtn.navigation = {
		down = registerbtn
	}
	registerbtn.navigation = {
		up = signinbtn,
		down = skipbtn
	}
	skipbtn.navigation = {
		up = registerbtn
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	signinbtn.id = "signinbtn"
	registerbtn.id = "registerbtn"
	skipbtn.id = "skipbtn"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.signinbtn:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BackgroundDarken:close()
		self.scorestreakVignetteContainer:close()
		self.LobbyMemberBackingMask0:close()
		self.signinbtn:close()
		self.registerbtn:close()
		self.skipbtn:close()
		self.PromptSelect:close()
		self.PromptBack:close()
		self.FEFeaturedFrame0:close()
		self.MOTDTitleAndBodyText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "InGameRegistration.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

