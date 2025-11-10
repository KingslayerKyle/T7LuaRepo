require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.buttonprompt_small" )
require( "ui.uieditor.widgets.AccountLink.MOTD_Footer" )
require( "ui.uieditor.widgets.MOTD.MOTD_MainImgContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )
require( "ui.uieditor.widgets.MOTD.MOTD_TitleAndBodyText" )
require( "ui.uieditor.widgets.MOTD.MOTD_Legal" )
require( "ui.uieditor.widgets.PC.Utility.GenericClickButton" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.continueButton:setButton( Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	f1_arg0.backButton:setButton( Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
end

local PostLoadFunc = function ( self, controller, menu )
	self.MOTDTitleAndBodyText.txtDescription:hasHTMLContent( true )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
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
	self:playSound( "menu_open", controller )
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
	
	local PromptSelect = CoD.buttonprompt_small.new( self, controller )
	PromptSelect:setLeftRight( true, false, 208, 422 )
	PromptSelect:setTopBottom( true, false, 516, 547 )
	PromptSelect.label:setText( Engine.Localize( "MENU_CONTINUE" ) )
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
	PromptBack:setTopBottom( true, false, 516, 547 )
	PromptBack.label:setText( Engine.Localize( "MENU_BACK" ) )
	PromptBack:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			PromptBack.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	self:addElement( PromptBack )
	self.PromptBack = PromptBack
	
	local motdFooter = CoD.MOTD_Footer.new( self, controller )
	motdFooter:setLeftRight( true, false, 182, 1093 )
	motdFooter:setTopBottom( true, false, 563, 663 )
	motdFooter:subscribeToGlobalModel( controller, "MtxCommsRegistration", "image", function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			motdFooter.MOTDFooterImageContainer.image:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( motdFooter )
	self.motdFooter = motdFooter
	
	local MOTDMainImgContainer = CoD.MOTD_MainImgContainer.new( self, controller )
	MOTDMainImgContainer:setLeftRight( true, false, 652, 1094 )
	MOTDMainImgContainer:setTopBottom( true, false, 61, 552.5 )
	MOTDMainImgContainer:subscribeToGlobalModel( controller, "MtxCommsMOTD", "image", function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			MOTDMainImgContainer.PopupImage:setImage( RegisterImage( image ) )
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
	
	local MOTDTitleAndBodyText = CoD.MOTD_TitleAndBodyText.new( self, controller )
	MOTDTitleAndBodyText:setLeftRight( true, false, 209, 640 )
	MOTDTitleAndBodyText:setTopBottom( true, false, 83, 500 )
	MOTDTitleAndBodyText:subscribeToGlobalModel( controller, "MtxCommsMOTD", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			MOTDTitleAndBodyText.TitleLbl0:setText( Engine.Localize( title ) )
		end
	end )
	MOTDTitleAndBodyText:subscribeToGlobalModel( controller, "MtxCommsMOTD", "content_long", function ( model )
		local contentLong = Engine.GetModelValue( model )
		if contentLong then
			MOTDTitleAndBodyText.txtDescription:setText( Engine.Localize( contentLong ) )
		end
	end )
	self:addElement( MOTDTitleAndBodyText )
	self.MOTDTitleAndBodyText = MOTDTitleAndBodyText
	
	local MOTDLegal = CoD.MOTD_Legal.new( self, controller )
	MOTDLegal:setLeftRight( true, false, 209, 638 )
	MOTDLegal:setTopBottom( true, false, 452, 468 )
	MOTDLegal:setAlpha( 0 )
	MOTDLegal.TxtLegal:setText( Engine.Localize( "MENU_MOTD_LEGAL" ) )
	self:addElement( MOTDLegal )
	self.MOTDLegal = MOTDLegal
	
	local continueButton = CoD.GenericClickButton.new( self, controller )
	continueButton:setLeftRight( true, false, 209, 308 )
	continueButton:setTopBottom( true, false, 515, 549 )
	continueButton:setAlpha( 0 )
	continueButton.label:setText( Engine.Localize( "MENU_CONTINUE" ) )
	self:addElement( continueButton )
	self.continueButton = continueButton
	
	local backButton = CoD.GenericClickButton.new( self, controller )
	backButton:setLeftRight( true, false, 330, 429 )
	backButton:setTopBottom( true, false, 515, 549 )
	backButton:setAlpha( 0 )
	backButton.label:setText( Engine.Localize( "MENU_BACK" ) )
	self:addElement( backButton )
	self.backButton = backButton
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				PromptSelect:completeAnimation()
				self.PromptSelect:setAlpha( 1 )
				self.clipFinished( PromptSelect, {} )
				PromptBack:completeAnimation()
				self.PromptBack:setAlpha( 1 )
				self.clipFinished( PromptBack, {} )
				continueButton:completeAnimation()
				self.continueButton:setAlpha( 0 )
				self.clipFinished( continueButton, {} )
				backButton:completeAnimation()
				self.backButton:setAlpha( 0 )
				self.clipFinished( backButton, {} )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				PromptSelect:completeAnimation()
				self.PromptSelect:setAlpha( 0 )
				self.clipFinished( PromptSelect, {} )
				PromptBack:completeAnimation()
				self.PromptBack:setAlpha( 0 )
				self.clipFinished( PromptBack, {} )
				continueButton:completeAnimation()
				self.continueButton:setAlpha( 1 )
				self.clipFinished( continueButton, {} )
				backButton:completeAnimation()
				self.backButton:setAlpha( 1 )
				self.clipFinished( backButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f3_local25 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return f3_local25( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BackgroundDarken:close()
		element.scorestreakVignetteContainer:close()
		element.LobbyMemberBackingMask0:close()
		element.PromptSelect:close()
		element.PromptBack:close()
		element.motdFooter:close()
		element.MOTDMainImgContainer:close()
		element.FEFeaturedFrame0:close()
		element.FEFeaturedFrame00:close()
		element.MOTDTitleAndBodyText:close()
		element.MOTDLegal:close()
		element.continueButton:close()
		element.backButton:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MOTD.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

