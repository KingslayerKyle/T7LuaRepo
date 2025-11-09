require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.buttonprompt_small" )
require( "ui.uieditor.widgets.MOTD.MOTD_Button" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )
require( "ui.uieditor.widgets.MOTD.MOTD_TitleAndBodyText" )

LUI.createMenu.InGameOptIn = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "InGameOptIn" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "InGameOptIn.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BackgroundDarken = CoD.DialogBackground.new( self, controller )
	BackgroundDarken:setLeftRight( true, true, 0, 0 )
	BackgroundDarken:setTopBottom( true, true, 0, 0 )
	BackgroundDarken:setRGB( 0.4, 0.4, 0.4 )
	BackgroundDarken:setAlpha( 0.45 )
	self:addElement( BackgroundDarken )
	self.BackgroundDarken = BackgroundDarken
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( true, true, 0, 0 )
	scorestreakVignetteContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local overlayBg = LUI.UIImage.new()
	overlayBg:setLeftRight( true, true, 0, 0 )
	overlayBg:setTopBottom( true, true, 0, 0 )
	overlayBg:setRGB( 0, 0, 0 )
	overlayBg:setAlpha( 0 )
	self:addElement( overlayBg )
	self.overlayBg = overlayBg
	
	local BlackBack = LUI.UIImage.new()
	BlackBack:setLeftRight( true, false, 181, 1094 )
	BlackBack:setTopBottom( true, false, 61, 553 )
	BlackBack:setRGB( 0, 0, 0 )
	BlackBack:setAlpha( 0.85 )
	self:addElement( BlackBack )
	self.BlackBack = BlackBack
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( self, controller )
	LobbyMemberBackingMask0:setLeftRight( true, true, 181, -186 )
	LobbyMemberBackingMask0:setTopBottom( false, false, -298, 193 )
	LobbyMemberBackingMask0:setRGB( 0, 0, 0 )
	self:addElement( LobbyMemberBackingMask0 )
	self.LobbyMemberBackingMask0 = LobbyMemberBackingMask0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 147, 175 )
	Image1:setTopBottom( false, false, -299, -296 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local pixelLL = LUI.UIImage.new()
	pixelLL:setLeftRight( true, false, 147, 175 )
	pixelLL:setTopBottom( false, false, 191, 194 )
	pixelLL:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL )
	self.pixelLL = pixelLL
	
	local pixelLL0 = LUI.UIImage.new()
	pixelLL0:setLeftRight( true, false, 1098, 1126 )
	pixelLL0:setTopBottom( false, false, 191, 194 )
	pixelLL0:setZRot( 180 )
	pixelLL0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL0 )
	self.pixelLL0 = pixelLL0
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 1098, 1126 )
	Image10:setTopBottom( false, false, -300, -297 )
	Image10:setZRot( 180 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local PromptSelect = CoD.buttonprompt_small.new( self, controller )
	PromptSelect:setLeftRight( true, false, 208, 422 )
	PromptSelect:setTopBottom( true, false, 515.5, 546.5 )
	PromptSelect.label:setText( Engine.Localize( "MENU_SELECT" ) )
	PromptSelect:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			PromptSelect.buttonPromptImage:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	self:addElement( PromptSelect )
	self.PromptSelect = PromptSelect
	
	local PromptBack = CoD.buttonprompt_small.new( self, controller )
	PromptBack:setLeftRight( true, false, 330, 544 )
	PromptBack:setTopBottom( true, false, 515.5, 546.5 )
	PromptBack.label:setText( Engine.Localize( "MENU_BACK" ) )
	PromptBack:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			PromptBack.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	self:addElement( PromptBack )
	self.PromptBack = PromptBack
	
	local skipbtn = CoD.MOTD_Button.new( self, controller )
	skipbtn:setLeftRight( true, false, 216, 430 )
	skipbtn:setTopBottom( true, false, 425.5, 455.5 )
	skipbtn.btnDisplayText:setText( Engine.Localize( "ACCOUNT_LINK_SKIP" ) )
	skipbtn.btnDisplayTextStroke:setText( Engine.Localize( "ACCOUNT_LINK_SKIP" ) )
	skipbtn:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	skipbtn:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	self:AddButtonCallbackFunction( skipbtn, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		FinishRegistrationFlow( self, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( skipbtn )
	self.skipbtn = skipbtn
	
	local optinbtn = CoD.MOTD_Button.new( self, controller )
	optinbtn:setLeftRight( true, false, 216, 430 )
	optinbtn:setTopBottom( true, false, 392.5, 422.5 )
	optinbtn.btnDisplayText:setText( Engine.Localize( "ACCOUNT_LINK_OPTIN" ) )
	optinbtn.btnDisplayTextStroke:setText( Engine.Localize( "ACCOUNT_LINK_OPTIN" ) )
	optinbtn:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	optinbtn:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	self:AddButtonCallbackFunction( optinbtn, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OptInToEmailMarketing( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( optinbtn )
	self.optinbtn = optinbtn
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 651.45, 1094 )
	Image0:setTopBottom( true, false, 61, 553.94 )
	Image0:setImage( RegisterImage( "uie_t7_motd_account_img" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local FEFeaturedFrame0 = CoD.FE_FeaturedFrame.new( self, controller )
	FEFeaturedFrame0:setLeftRight( true, false, 181, 1094 )
	FEFeaturedFrame0:setTopBottom( true, false, 61, 553 )
	FEFeaturedFrame0:setAlpha( 0.5 )
	self:addElement( FEFeaturedFrame0 )
	self.FEFeaturedFrame0 = FEFeaturedFrame0
	
	local MOTDTitleAndBodyText = CoD.MOTD_TitleAndBodyText.new( self, controller )
	MOTDTitleAndBodyText:setLeftRight( true, false, 209, 640 )
	MOTDTitleAndBodyText:setTopBottom( true, false, 89, 437 )
	MOTDTitleAndBodyText:subscribeToGlobalModel( controller, "MtxCommsRegistration", "content_long", function ( model )
		local contentLong = Engine.GetModelValue( model )
		if contentLong then
			MOTDTitleAndBodyText.txtDescription:setText( Engine.Localize( contentLong ) )
		end
	end )
	MOTDTitleAndBodyText:subscribeToGlobalModel( controller, "MtxCommsRegistration", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			MOTDTitleAndBodyText.TitleLbl0:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( MOTDTitleAndBodyText )
	self.MOTDTitleAndBodyText = MOTDTitleAndBodyText
	
	skipbtn.navigation = {
		up = optinbtn
	}
	optinbtn.navigation = {
		down = skipbtn
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ENTER", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	skipbtn.id = "skipbtn"
	optinbtn.id = "optinbtn"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.optinbtn:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BackgroundDarken:close()
		element.scorestreakVignetteContainer:close()
		element.LobbyMemberBackingMask0:close()
		element.PromptSelect:close()
		element.PromptBack:close()
		element.skipbtn:close()
		element.optinbtn:close()
		element.FEFeaturedFrame0:close()
		element.MOTDTitleAndBodyText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "InGameOptIn.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

