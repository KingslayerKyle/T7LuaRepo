-- b5dc42582e053040e4ab9e4b502487e3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.Lobby.Common.Popups.LiveEventViewer" )
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

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.continueButton:setButton( Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	f1_arg0.backButton:setButton( Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.MOTDTitleAndBodyText.txtDescription:hasHTMLContent( true )
	if CoD.isPC then
		f0_local0( f2_arg0, f2_arg1 )
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
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local BackgroundDarken = CoD.DialogBackground.new( f3_local1, controller )
	BackgroundDarken:setLeftRight( true, true, 0, 0 )
	BackgroundDarken:setTopBottom( true, true, 0, 0 )
	BackgroundDarken:setRGB( 0.4, 0.4, 0.4 )
	BackgroundDarken:setAlpha( 0.45 )
	self:addElement( BackgroundDarken )
	self.BackgroundDarken = BackgroundDarken
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( f3_local1, controller )
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
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( f3_local1, controller )
	LobbyMemberBackingMask0:setLeftRight( true, true, 181, -186 )
	LobbyMemberBackingMask0:setTopBottom( false, false, -298, 193 )
	LobbyMemberBackingMask0:setRGB( 0, 0, 0 )
	self:addElement( LobbyMemberBackingMask0 )
	self.LobbyMemberBackingMask0 = LobbyMemberBackingMask0
	
	local PromptSelect = CoD.buttonprompt_small.new( f3_local1, controller )
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
	
	local PromptBack = CoD.buttonprompt_small.new( f3_local1, controller )
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
	
	local motdFooter = CoD.MOTD_Footer.new( f3_local1, controller )
	motdFooter:setLeftRight( true, false, 181, 1094 )
	motdFooter:setTopBottom( true, false, 563, 663 )
	motdFooter:subscribeToGlobalModel( controller, "MtxCommsRegistration", "image", function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			motdFooter.MOTDFooterImageContainer.image:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( motdFooter )
	self.motdFooter = motdFooter
	
	local MOTDMainImgContainer = CoD.MOTD_MainImgContainer.new( f3_local1, controller )
	MOTDMainImgContainer:setLeftRight( true, false, 652, 1094 )
	MOTDMainImgContainer:setTopBottom( true, false, 61, 552.5 )
	MOTDMainImgContainer.TwitchStream0:setupTwitchStreamPlayback( "" )
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
	
	local FEFeaturedFrame0 = CoD.FE_FeaturedFrame.new( f3_local1, controller )
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
	
	local MOTDTitleAndBodyText = CoD.MOTD_TitleAndBodyText.new( f3_local1, controller )
	MOTDTitleAndBodyText:setLeftRight( true, false, 209, 640 )
	MOTDTitleAndBodyText:setTopBottom( true, false, 83, 448 )
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
	
	local MOTDLegal = CoD.MOTD_Legal.new( f3_local1, controller )
	MOTDLegal:setLeftRight( true, false, 209, 638 )
	MOTDLegal:setTopBottom( true, false, 452, 468 )
	MOTDLegal:setAlpha( 0 )
	MOTDLegal.TxtLegal:setText( Engine.Localize( "MENU_MOTD_LEGAL" ) )
	self:addElement( MOTDLegal )
	self.MOTDLegal = MOTDLegal
	
	local continueButton = CoD.GenericClickButton.new( f3_local1, controller )
	continueButton:setLeftRight( true, false, 209, 308 )
	continueButton:setTopBottom( true, false, 515, 549 )
	continueButton:setAlpha( 0 )
	continueButton.label:setText( Engine.Localize( "MENU_CONTINUE" ) )
	self:addElement( continueButton )
	self.continueButton = continueButton
	
	local backButton = CoD.GenericClickButton.new( f3_local1, controller )
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
		local f3_local20 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or f3_local1
			element:updateState( event )
			return f3_local20( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		f3_local1:updateElementState( self, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "mtxCommsMOTD.type" ), function ( model )
		local f15_local0 = self
		local f15_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "mtxCommsMOTD.type"
		}
		CoD.Menu.UpdateButtonShownState( f15_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		GoBack( self, f16_arg2 )
		ResetThumbnailViewer( f16_arg2 )
		return true
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		MOTDPopupAcceptAction( self, f18_arg0, f18_arg2, "", f18_arg1 )
		ResetThumbnailViewer( f18_arg2 )
		return true
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
		return true
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "W", function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		if IsGlobalModelValueEqualTo( f20_arg0, f20_arg2, "mtxCommsMOTD.type", "liveevent" ) then
			OpenPopup( self, "LiveEventViewer", f20_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		if IsGlobalModelValueEqualTo( f21_arg0, f21_arg2, "mtxCommsMOTD.type", "liveevent" ) then
			CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		else
			return false
		end
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		if ShouldPresentMOTDBanner( f22_arg2, "" ) then
			OpenRegistrationFlow( self, f22_arg0, f22_arg2, f22_arg1 )
			ResetThumbnailViewer( f22_arg2 )
			return true
		else
			
		end
	end, function ( f23_arg0, f23_arg1, f23_arg2 )
		if ShouldPresentMOTDBanner( f23_arg2, "" ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
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

