require( "ui.uieditor.menus.Lobby.Common.Popups.LiveEventViewer" )
require( "ui.uieditor.widgets.AccountLink.MOTD_Footer" )
require( "ui.uieditor.widgets.buttonprompt_small" )
require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.MOTD.MOTD_Legal" )
require( "ui.uieditor.widgets.MOTD.MOTD_MainImgContainer" )
require( "ui.uieditor.widgets.MOTD.MOTD_TitleAndBodyText" )
require( "ui.uieditor.widgets.PC.Utility.GenericClickButton" )

local SetupPC = function ( self, controller )
	self.continueButton:setButton( Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	self.backButton:setButton( Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
end

local PostLoadFunc = function ( self, controller )
	self.MOTDTitleAndBodyText.txtDescription:hasHTMLContent( true )
	if CoD.isPC then
		SetupPC( self, controller )
	end
end

LUI.createMenu.MOTD = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MOTD" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MOTD.buttonPrompts" )
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
	
	local PromptSelect = CoD.buttonprompt_small.new( self, controller )
	PromptSelect:setLeftRight( 0, 0, 311.5, 632.5 )
	PromptSelect:setTopBottom( 0, 0, 774, 820 )
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
	
	local motdFooter = CoD.MOTD_Footer.new( self, controller )
	motdFooter:setLeftRight( 0, 0, 271, 1641 )
	motdFooter:setTopBottom( 0, 0, 845, 995 )
	motdFooter:subscribeToGlobalModel( controller, "MtxCommsRegistration", "image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			motdFooter.MOTDFooterImageContainer.image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( motdFooter )
	self.motdFooter = motdFooter
	
	local MOTDMainImgContainer = CoD.MOTD_MainImgContainer.new( self, controller )
	MOTDMainImgContainer:setLeftRight( 0, 0, 978.5, 1641.5 )
	MOTDMainImgContainer:setTopBottom( 0, 0, 92, 829 )
	MOTDMainImgContainer.TwitchStream0:setupTwitchStreamPlayback( "" )
	MOTDMainImgContainer:subscribeToGlobalModel( controller, "MtxCommsMOTD", "image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MOTDMainImgContainer.PopupImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( MOTDMainImgContainer )
	self.MOTDMainImgContainer = MOTDMainImgContainer
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 221, 263 )
	Image1:setTopBottom( 0.5, 0.5, -448, -444 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local FEFeaturedFrame0 = CoD.FE_FeaturedFrame.new( self, controller )
	FEFeaturedFrame0:setLeftRight( 0, 0, 271, 1641 )
	FEFeaturedFrame0:setTopBottom( 0, 0, 91, 829 )
	FEFeaturedFrame0:setAlpha( 0.5 )
	self:addElement( FEFeaturedFrame0 )
	self.FEFeaturedFrame0 = FEFeaturedFrame0
	
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
	
	local MOTDTitleAndBodyText = CoD.MOTD_TitleAndBodyText.new( self, controller )
	MOTDTitleAndBodyText:setLeftRight( 0, 0, 314, 960 )
	MOTDTitleAndBodyText:setTopBottom( 0, 0, 124, 672 )
	MOTDTitleAndBodyText:subscribeToGlobalModel( controller, "MtxCommsMOTD", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MOTDTitleAndBodyText.TitleLbl0:setText( Engine.Localize( modelValue ) )
		end
	end )
	MOTDTitleAndBodyText:subscribeToGlobalModel( controller, "MtxCommsMOTD", "content_long", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MOTDTitleAndBodyText.txtDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MOTDTitleAndBodyText )
	self.MOTDTitleAndBodyText = MOTDTitleAndBodyText
	
	local MOTDLegal = CoD.MOTD_Legal.new( self, controller )
	MOTDLegal:setLeftRight( 0, 0, 313, 957 )
	MOTDLegal:setTopBottom( 0, 0, 678, 702 )
	MOTDLegal:setAlpha( 0 )
	MOTDLegal.TxtLegal:setText( Engine.Localize( "MENU_MOTD_LEGAL" ) )
	self:addElement( MOTDLegal )
	self.MOTDLegal = MOTDLegal
	
	local continueButton = CoD.GenericClickButton.new( self, controller )
	continueButton:setLeftRight( 0, 0, 314, 462 )
	continueButton:setTopBottom( 0, 0, 772, 823 )
	continueButton:setAlpha( 0 )
	continueButton.label:setText( Engine.Localize( "MENU_CONTINUE" ) )
	self:addElement( continueButton )
	self.continueButton = continueButton
	
	local backButton = CoD.GenericClickButton.new( self, controller )
	backButton:setLeftRight( 0, 0, 495, 643 )
	backButton:setTopBottom( 0, 0, 772, 823 )
	backButton:setAlpha( 0 )
	backButton.label:setText( Engine.Localize( "MENU_BACK" ) )
	self:addElement( backButton )
	self.backButton = backButton
	
	self.resetProperties = function ()
		backButton:completeAnimation()
		continueButton:completeAnimation()
		PromptBack:completeAnimation()
		PromptSelect:completeAnimation()
		backButton:setAlpha( 0 )
		continueButton:setAlpha( 0 )
		PromptBack:setAlpha( 1 )
		PromptSelect:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self.resetProperties()
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
				local f13_local0
				if not IsGamepad( controller ) then
					f13_local0 = IsPC()
				else
					f13_local0 = false
				end
				return f13_local0
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return currentEv( self, event )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "mtxCommsMOTD.type" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "mtxCommsMOTD.type"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ResetThumbnailViewer( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		MOTDPopupAcceptAction( self, element, controller, "", menu )
		ResetThumbnailViewer( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "W", function ( element, menu, controller, model )
		if IsGlobalModelValueEqualTo( element, controller, "mtxCommsMOTD.type", "liveevent" ) then
			OpenPopup( self, "LiveEventViewer", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsGlobalModelValueEqualTo( element, controller, "mtxCommsMOTD.type", "liveevent" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		OpenRegistrationFlow( self, element, controller, menu )
		ResetThumbnailViewer( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SELECT", nil )
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
		self.MOTDTitleAndBodyText:close()
		self.MOTDLegal:close()
		self.continueButton:close()
		self.backButton:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MOTD.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

