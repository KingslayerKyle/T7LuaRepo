-- f6e205d1a80a58cc334738d43b536ee9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.buttonprompt_small" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )
require( "ui.uieditor.widgets.MOTD.MOTD_TitleAndBodyText" )
require( "ui.uieditor.widgets.PC.Utility.GenericClickButton" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.continueButton:setButton( Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	f1_arg0.backButton:setButton( Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	f1_arg0.actionButton:setButton( Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	if CoD.isPC then
		f0_local0( f2_arg0, f2_arg1 )
	end
end

LUI.createMenu.CRMPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CRMPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_EditLoadout"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CRMPopup.buttonPrompts" )
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
	
	local PromptAction = CoD.buttonprompt_small.new( f3_local1, controller )
	PromptAction:setLeftRight( true, false, 452, 666 )
	PromptAction:setTopBottom( true, false, 516, 547 )
	PromptAction:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			PromptAction.buttonPromptImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	PromptAction:subscribeToGlobalModel( controller, "CRMPopup", "action_title", function ( model )
		local actionTitle = Engine.GetModelValue( model )
		if actionTitle then
			PromptAction.label:setText( Engine.Localize( actionTitle ) )
		end
	end )
	self:addElement( PromptAction )
	self.PromptAction = PromptAction
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, false, 652, 1094 )
	image:setTopBottom( true, false, 61, 552.5 )
	image:subscribeToGlobalModel( controller, "CRMPopup", "popup_image", function ( model )
		local popupImage = Engine.GetModelValue( model )
		if popupImage then
			image:setImage( RegisterImage( popupImage ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
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
	
	local TitleAndBodyText = CoD.MOTD_TitleAndBodyText.new( f3_local1, controller )
	TitleAndBodyText:setLeftRight( true, false, 209, 640 )
	TitleAndBodyText:setTopBottom( true, false, 83, 448 )
	TitleAndBodyText:subscribeToGlobalModel( controller, "CRMPopup", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			TitleAndBodyText.TitleLbl0:setText( Engine.Localize( title ) )
		end
	end )
	TitleAndBodyText:subscribeToGlobalModel( controller, "CRMPopup", "content_long", function ( model )
		local contentLong = Engine.GetModelValue( model )
		if contentLong then
			TitleAndBodyText.txtDescription:setText( Engine.Localize( contentLong ) )
		end
	end )
	self:addElement( TitleAndBodyText )
	self.TitleAndBodyText = TitleAndBodyText
	
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
	
	local actionButton = CoD.GenericClickButton.new( f3_local1, controller )
	actionButton:setLeftRight( true, false, 451, 550 )
	actionButton:setTopBottom( true, false, 515, 549 )
	actionButton:setAlpha( 0 )
	actionButton:subscribeToGlobalModel( controller, "CRMPopup", "action_title", function ( model )
		local actionTitle = Engine.GetModelValue( model )
		if actionTitle then
			actionButton.label:setText( Engine.Localize( actionTitle ) )
		end
	end )
	self:addElement( actionButton )
	self.actionButton = actionButton
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				PromptSelect:completeAnimation()
				self.PromptSelect:setAlpha( 1 )
				self.clipFinished( PromptSelect, {} )
				PromptBack:completeAnimation()
				self.PromptBack:setAlpha( 1 )
				self.clipFinished( PromptBack, {} )
				PromptAction:completeAnimation()
				self.PromptAction:setAlpha( 0 )
				self.clipFinished( PromptAction, {} )
				continueButton:completeAnimation()
				self.continueButton:setAlpha( 0 )
				self.clipFinished( continueButton, {} )
				backButton:completeAnimation()
				self.backButton:setAlpha( 0 )
				self.clipFinished( backButton, {} )
				actionButton:completeAnimation()
				self.actionButton:setAlpha( 0 )
				self.clipFinished( actionButton, {} )
			end
		},
		KBMouseAction = {
			DefaultClip = function ()
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
		KBMouse = {
			DefaultClip = function ()
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
				self.actionButton:setAlpha( 0 )
				self.clipFinished( actionButton, {} )
			end
		},
		Action = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				PromptSelect:completeAnimation()
				self.PromptSelect:setAlpha( 1 )
				self.clipFinished( PromptSelect, {} )
				PromptBack:completeAnimation()
				self.PromptBack:setAlpha( 1 )
				self.clipFinished( PromptBack, {} )
				PromptAction:completeAnimation()
				self.PromptAction:setAlpha( 1 )
				self.clipFinished( PromptAction, {} )
				continueButton:completeAnimation()
				self.continueButton:setAlpha( 0 )
				self.clipFinished( continueButton, {} )
				backButton:completeAnimation()
				self.backButton:setAlpha( 0 )
				self.clipFinished( backButton, {} )
				actionButton:completeAnimation()
				self.actionButton:setAlpha( 0 )
				self.clipFinished( actionButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KBMouseAction",
			condition = function ( menu, element, event )
				local f16_local0
				if not IsGamepad( controller ) and not IsGlobalModelValueEqualTo( element, controller, "CRMPopup.action", "" ) then
					f16_local0 = not IsGlobalModelValueEqualTo( element, controller, "CRMPopup.action", "expand" )
				else
					f16_local0 = false
				end
				return f16_local0
			end
		},
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		},
		{
			stateName = "Action",
			condition = function ( menu, element, event )
				local f18_local0
				if not IsGlobalModelValueEqualTo( element, controller, "CRMPopup.action", "" ) then
					f18_local0 = not IsGlobalModelValueEqualTo( element, controller, "CRMPopup.action", "expand" )
				else
					f18_local0 = false
				end
				return f18_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "CRMPopup.action" ), function ( model )
		f3_local1:updateElementState( self, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CRMPopup.action"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "CRMPopup.actionSource" ), function ( model )
		local f22_local0 = self
		local f22_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CRMPopup.actionSource"
		}
		CoD.Menu.UpdateButtonShownState( f22_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		GoBack( self, f23_arg2 )
		return true
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		if IsGlobalModelValueEqualTo( f25_arg0, f25_arg2, "CRMPopup.actionSource", "Featured" ) then
			GoBack( self, f25_arg2 )
			return true
		elseif IsGlobalModelValueEqualTo( f25_arg0, f25_arg2, "CRMPopup.actionSource", "MOTDBanner" ) then
			GoToModeSelectFromCRMPopup( self, f25_arg2, f25_arg1 )
			return true
		else
			
		end
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		if IsGlobalModelValueEqualTo( f26_arg0, f26_arg2, "CRMPopup.actionSource", "Featured" ) then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
			return true
		elseif IsGlobalModelValueEqualTo( f26_arg0, f26_arg2, "CRMPopup.actionSource", "MOTDBanner" ) then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		CRMFeaturedPopupActionHandler( self, f27_arg0, f27_arg2, "", f27_arg1 )
		return true
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SELECT" )
		return true
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
		element.PromptAction:close()
		element.FEFeaturedFrame0:close()
		element.TitleAndBodyText:close()
		element.continueButton:close()
		element.backButton:close()
		element.actionButton:close()
		element.image:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CRMPopup.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

