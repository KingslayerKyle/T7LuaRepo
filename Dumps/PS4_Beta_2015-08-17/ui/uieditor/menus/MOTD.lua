require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.buttonprompt_small" )
require( "ui.uieditor.widgets.AccountLink.MOTD_Footer" )
require( "ui.uieditor.widgets.MOTD.MOTD_MainImgContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )

local PostLoadFunc = function ( self, controller )
	self.txtDescription:hasHTMLContent( true )
end

LUI.createMenu.MOTD = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MOTD" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MOTD.buttonPrompts" )
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
	
	local txtDescription = LUI.UIText.new()
	txtDescription:setLeftRight( true, true, 211, -640 )
	txtDescription:setTopBottom( false, false, -198, -178 )
	txtDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	txtDescription:subscribeToGlobalModel( controller, "MtxCommsMOTD", "content_long", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			txtDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( txtDescription )
	self.txtDescription = txtDescription
	
	local PromptSelect = CoD.buttonprompt_small.new( self, controller )
	PromptSelect:setLeftRight( true, false, 208, 422 )
	PromptSelect:setTopBottom( true, false, 516, 547 )
	PromptSelect.label:setText( Engine.Localize( "MENU_CONTINUE" ) )
	PromptSelect:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PromptSelect.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( PromptSelect )
	self.PromptSelect = PromptSelect
	
	local PromptBack = CoD.buttonprompt_small.new( self, controller )
	PromptBack:setLeftRight( true, false, 330, 544 )
	PromptBack:setTopBottom( true, false, 516, 547 )
	PromptBack.label:setText( Engine.Localize( "MENU_BACK" ) )
	PromptBack:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PromptBack.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( PromptBack )
	self.PromptBack = PromptBack
	
	local motdFooter = CoD.MOTD_Footer.new( self, controller )
	motdFooter:setLeftRight( true, false, 182, 1093 )
	motdFooter:setTopBottom( true, false, 563, 663 )
	motdFooter:subscribeToGlobalModel( controller, "MtxCommsRegistration", "image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			motdFooter.MOTDFooterImageContainer.image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( motdFooter )
	self.motdFooter = motdFooter
	
	local MOTDMainImgContainer = CoD.MOTD_MainImgContainer.new( self, controller )
	MOTDMainImgContainer:setLeftRight( true, false, 652, 1094 )
	MOTDMainImgContainer:setTopBottom( true, false, 61, 552.5 )
	MOTDMainImgContainer:subscribeToGlobalModel( controller, "MtxCommsMOTD", "image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MOTDMainImgContainer.PopupImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( MOTDMainImgContainer )
	self.MOTDMainImgContainer = MOTDMainImgContainer
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 147, 175 )
	Image1:setTopBottom( false, false, -299, -296 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local FEFeaturedFrame0 = CoD.FE_FeaturedFrame.new( self, controller )
	FEFeaturedFrame0:setLeftRight( true, false, 181, 1094 )
	FEFeaturedFrame0:setTopBottom( true, false, 61, 553 )
	FEFeaturedFrame0:setAlpha( 0.5 )
	self:addElement( FEFeaturedFrame0 )
	self.FEFeaturedFrame0 = FEFeaturedFrame0
	
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
	
	local FEFeaturedFrame00 = CoD.FE_FeaturedFrame.new( self, controller )
	FEFeaturedFrame00:setLeftRight( true, false, 181, 1094 )
	FEFeaturedFrame00:setTopBottom( true, false, 562, 664 )
	FEFeaturedFrame00:setAlpha( 0.5 )
	self:addElement( FEFeaturedFrame00 )
	self.FEFeaturedFrame00 = FEFeaturedFrame00
	
	local pixelLL1 = LUI.UIImage.new()
	pixelLL1:setLeftRight( true, false, 147, 175 )
	pixelLL1:setTopBottom( false, false, 301, 304 )
	pixelLL1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL1 )
	self.pixelLL1 = pixelLL1
	
	local pixelLL10 = LUI.UIImage.new()
	pixelLL10:setLeftRight( true, false, 147, 175 )
	pixelLL10:setTopBottom( false, false, 201, 204 )
	pixelLL10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL10 )
	self.pixelLL10 = pixelLL10
	
	local pixelLL00 = LUI.UIImage.new()
	pixelLL00:setLeftRight( true, false, 1098, 1126 )
	pixelLL00:setTopBottom( false, false, 201, 204 )
	pixelLL00:setZRot( 180 )
	pixelLL00:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL00 )
	self.pixelLL00 = pixelLL00
	
	local pixelLL000 = LUI.UIImage.new()
	pixelLL000:setLeftRight( true, false, 1098, 1126 )
	pixelLL000:setTopBottom( false, false, 302, 305 )
	pixelLL000:setZRot( 180 )
	pixelLL000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL000 )
	self.pixelLL000 = pixelLL000
	
	local TitleLbl0 = LUI.UITightText.new()
	TitleLbl0:setLeftRight( true, false, 209, 637.5 )
	TitleLbl0:setTopBottom( true, false, 89, 132 )
	TitleLbl0:setTTF( "fonts/escom.ttf" )
	TitleLbl0:subscribeToGlobalModel( controller, "MtxCommsMOTD", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TitleLbl0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TitleLbl0 )
	self.TitleLbl0 = TitleLbl0
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		MOTDPopupAcceptAction( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		OpenRegistrationFlow( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SELECT" )
		return true
	end, false )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BackgroundDarken:close()
		self.scorestreakVignetteContainer:close()
		self.LobbyMemberBackingMask0:close()
		self.PromptSelect:close()
		self.PromptBack:close()
		self.motdFooter:close()
		self.MOTDMainImgContainer:close()
		self.FEFeaturedFrame0:close()
		self.FEFeaturedFrame00:close()
		self.txtDescription:close()
		self.TitleLbl0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MOTD.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

