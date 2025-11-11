require( "ui.uieditor.widgets.buttonprompt_small" )
require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.MOTD.MOTD_TitleAndBodyText" )
require( "ui.uieditor.widgets.PC.Utility.GenericClickButton" )

LUI.createMenu.CRMPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CRMPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_EditLoadout"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CRMPopup.buttonPrompts" )
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
	
	local PromptAction = CoD.buttonprompt_small.new( self, controller )
	PromptAction:setLeftRight( 0, 0, 677.5, 998.5 )
	PromptAction:setTopBottom( 0, 0, 774, 820 )
	PromptAction:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PromptAction.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	PromptAction:subscribeToGlobalModel( controller, "CRMPopup", "action_title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PromptAction.label:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( PromptAction )
	self.PromptAction = PromptAction
	
	local image = LUI.UIImage.new()
	image:setLeftRight( 0, 0, 978, 1641 )
	image:setTopBottom( 0, 0, 92, 829 )
	image:subscribeToGlobalModel( controller, "CRMPopup", "popup_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
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
	
	local TitleAndBodyText = CoD.MOTD_TitleAndBodyText.new( self, controller )
	TitleAndBodyText:setLeftRight( 0, 0, 314, 960 )
	TitleAndBodyText:setTopBottom( 0, 0, 124, 672 )
	TitleAndBodyText:subscribeToGlobalModel( controller, "CRMPopup", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TitleAndBodyText.TitleLbl0:setText( Engine.Localize( modelValue ) )
		end
	end )
	TitleAndBodyText:subscribeToGlobalModel( controller, "CRMPopup", "content_long", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TitleAndBodyText.txtDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TitleAndBodyText )
	self.TitleAndBodyText = TitleAndBodyText
	
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
	
	local actionButton = CoD.GenericClickButton.new( self, controller )
	actionButton:setLeftRight( 0, 0, 677, 825 )
	actionButton:setTopBottom( 0, 0, 772, 823 )
	actionButton:setAlpha( 0 )
	actionButton:subscribeToGlobalModel( controller, "CRMPopup", "action_title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			actionButton.label:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( actionButton )
	self.actionButton = actionButton
	
	self.resetProperties = function ()
		PromptAction:completeAnimation()
		backButton:completeAnimation()
		continueButton:completeAnimation()
		PromptBack:completeAnimation()
		PromptSelect:completeAnimation()
		actionButton:completeAnimation()
		PromptAction:setAlpha( 1 )
		backButton:setAlpha( 0 )
		continueButton:setAlpha( 0 )
		PromptBack:setAlpha( 1 )
		PromptSelect:setAlpha( 1 )
		actionButton:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PromptAction:completeAnimation()
				self.PromptAction:setAlpha( 0 )
				self.clipFinished( PromptAction, {} )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				PromptSelect:completeAnimation()
				self.PromptSelect:setAlpha( 0 )
				self.clipFinished( PromptSelect, {} )
				PromptBack:completeAnimation()
				self.PromptBack:setAlpha( 0 )
				self.clipFinished( PromptBack, {} )
				PromptAction:completeAnimation()
				self.PromptAction:setAlpha( 0 )
				self.clipFinished( PromptAction, {} )
				continueButton:completeAnimation()
				self.continueButton:setAlpha( 1 )
				self.clipFinished( continueButton, {} )
				backButton:completeAnimation()
				self.backButton:setAlpha( 1 )
				self.clipFinished( backButton, {} )
			end
		},
		KBMouseAction = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				PromptSelect:completeAnimation()
				self.PromptSelect:setAlpha( 0 )
				self.clipFinished( PromptSelect, {} )
				PromptBack:completeAnimation()
				self.PromptBack:setAlpha( 0 )
				self.clipFinished( PromptBack, {} )
				PromptAction:completeAnimation()
				self.PromptAction:setAlpha( 0 )
				self.clipFinished( PromptAction, {} )
				continueButton:completeAnimation()
				self.continueButton:setAlpha( 1 )
				self.clipFinished( continueButton, {} )
				backButton:completeAnimation()
				self.backButton:setAlpha( 1 )
				self.clipFinished( backButton, {} )
				actionButton:completeAnimation()
				self.actionButton:setAlpha( 1 )
				self.clipFinished( actionButton, {} )
			end
		},
		Action = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				local f15_local0
				if not IsGamepad( controller ) then
					f15_local0 = IsPC()
				else
					f15_local0 = false
				end
				return f15_local0
			end
		},
		{
			stateName = "KBMouseAction",
			condition = function ( menu, element, event )
				local f16_local0
				if not IsGamepad( controller ) and not IsGlobalModelValueEqualTo( element, controller, "CRMPopup.action", "" ) and not IsGlobalModelValueEqualTo( element, controller, "CRMPopup.action", "expand" ) then
					f16_local0 = IsPC()
				else
					f16_local0 = false
				end
				return f16_local0
			end
		},
		{
			stateName = "Action",
			condition = function ( menu, element, event )
				local f17_local0
				if not IsGlobalModelValueEqualTo( element, controller, "CRMPopup.action", "" ) then
					f17_local0 = not IsGlobalModelValueEqualTo( element, controller, "CRMPopup.action", "expand" )
				else
					f17_local0 = false
				end
				return f17_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "CRMPopup.action" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CRMPopup.action"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "CRMPopup.actionSource" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CRMPopup.actionSource"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsGlobalModelValueEqualTo( element, controller, "CRMPopup.actionSource", "Featured" ) then
			GoBack( self, controller )
			return true
		elseif IsGlobalModelValueEqualTo( element, controller, "CRMPopup.actionSource", "MOTDBanner" ) then
			GoToModeSelectFromCRMPopup( self, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsGlobalModelValueEqualTo( element, controller, "CRMPopup.actionSource", "Featured" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE", nil )
			return true
		elseif IsGlobalModelValueEqualTo( element, controller, "CRMPopup.actionSource", "MOTDBanner" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		CRMFeaturedPopupActionHandler( self, element, controller, "", menu )
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
		self.PromptAction:close()
		self.FEFeaturedFrame0:close()
		self.TitleAndBodyText:close()
		self.continueButton:close()
		self.backButton:close()
		self.actionButton:close()
		self.image:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CRMPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

