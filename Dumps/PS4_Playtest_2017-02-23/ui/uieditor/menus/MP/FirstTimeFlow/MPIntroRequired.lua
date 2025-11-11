require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CharacterCustomization.list1ButtonNewStyle" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader" )

LUI.createMenu.MPIntroRequired = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MPIntroRequired" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MPIntroRequired.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.9 )
	self:addElement( background )
	self.background = background
	
	local FEButtonPanel = CoD.FE_ButtonPanelShader.new( self, controller )
	FEButtonPanel:setLeftRight( 0, 1, -36, 32 )
	FEButtonPanel:setTopBottom( 0, 1, 158, -158 )
	FEButtonPanel:setRGB( 0.38, 0.38, 0.38 )
	FEButtonPanel:setAlpha( 0 )
	FEButtonPanel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	FEButtonPanel:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( FEButtonPanel )
	self.FEButtonPanel = FEButtonPanel
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( 0, 1, 0, 0 )
	Black:setTopBottom( 0, 1, 157, -161 )
	Black:setRGB( 0.1, 0.1, 0.1 )
	Black:setAlpha( 0.7 )
	self:addElement( Black )
	self.Black = Black
	
	local TextureBackground = LUI.UIImage.new()
	TextureBackground:setLeftRight( 0, 0, -1, 1920 )
	TextureBackground:setTopBottom( 0, 0, 0, 1080 )
	TextureBackground:setAlpha( 0.9 )
	TextureBackground:setImage( RegisterImage( "uie_t7_menu_welcome_bg2" ) )
	self:addElement( TextureBackground )
	self.TextureBackground = TextureBackground
	
	local Characters2b = LUI.UIImage.new()
	Characters2b:setLeftRight( 0, 0, -2, 948 )
	Characters2b:setTopBottom( 0, 0, 167, 915 )
	Characters2b:setImage( RegisterImage( "uie_t7_menu_welcome_characters3" ) )
	self:addElement( Characters2b )
	self.Characters2b = Characters2b
	
	local WelcomeTitle = LUI.UIText.new()
	WelcomeTitle:setLeftRight( 0, 0, 945, 1811 )
	WelcomeTitle:setTopBottom( 0, 0, 288, 348 )
	WelcomeTitle:setRGB( 1, 0.41, 0 )
	WelcomeTitle:setText( Engine.Localize( "MPUI_MP_INTRO_REQUIRED" ) )
	WelcomeTitle:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WelcomeTitle )
	self.WelcomeTitle = WelcomeTitle
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 0, 0, 945, 1793 )
	TextBox0:setTopBottom( 0, 0, 356, 384 )
	TextBox0:setText( Engine.Localize( "MPUI_MP_INTRO_REQUIRED_DESC" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TokenBox = CoD.cac_ButtonBoxLrgInactiveStroke.new( self, controller )
	TokenBox:setLeftRight( 0.5, 0.5, -134, 60 )
	TokenBox:setTopBottom( 0.5, 0.5, -26, 166 )
	TokenBox:setAlpha( 0 )
	self:addElement( TokenBox )
	self.TokenBox = TokenBox
	
	local FEFocusBarSolid = LUI.UIImage.new()
	FEFocusBarSolid:setLeftRight( 0, 1, -31, 37 )
	FEFocusBarSolid:setTopBottom( 0.5, 0.5, -381, -369 )
	FEFocusBarSolid:setRGB( 0, 0, 0 )
	FEFocusBarSolid:setAlpha( 0.7 )
	FEFocusBarSolid:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarSolid:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarSolid )
	self.FEFocusBarSolid = FEFocusBarSolid
	
	local FEFocusBarAdd = LUI.UIImage.new()
	FEFocusBarAdd:setLeftRight( 0, 1, -36, 38 )
	FEFocusBarAdd:setTopBottom( 0.5, 0.5, -381, -369 )
	FEFocusBarAdd:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd:setAlpha( 0.99 )
	FEFocusBarAdd:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarAdd:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarAdd )
	self.FEFocusBarAdd = FEFocusBarAdd
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( 0, 1, -178, 144 )
	Glow2:setTopBottom( 0, 0, 154, 176 )
	Glow2:setRGB( 1, 0.99, 0 )
	Glow2:setAlpha( 0.7 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local FEFocusBarSolid0 = LUI.UIImage.new()
	FEFocusBarSolid0:setLeftRight( 0, 1, -31, 37 )
	FEFocusBarSolid0:setTopBottom( 0.5, 0.5, 373, 385 )
	FEFocusBarSolid0:setRGB( 0, 0, 0 )
	FEFocusBarSolid0:setAlpha( 0.7 )
	FEFocusBarSolid0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid0:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarSolid0:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarSolid0 )
	self.FEFocusBarSolid0 = FEFocusBarSolid0
	
	local FEFocusBarAdd0 = LUI.UIImage.new()
	FEFocusBarAdd0:setLeftRight( 0, 1, -36, 38 )
	FEFocusBarAdd0:setTopBottom( 0.5, 0.5, 373, 385 )
	FEFocusBarAdd0:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd0:setAlpha( 0.99 )
	FEFocusBarAdd0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd0:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarAdd0:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarAdd0 )
	self.FEFocusBarAdd0 = FEFocusBarAdd0
	
	local Glow20 = LUI.UIImage.new()
	Glow20:setLeftRight( 0, 1, -178, 144 )
	Glow20:setTopBottom( 0, 0, 905, 927 )
	Glow20:setRGB( 1, 0.99, 0 )
	Glow20:setAlpha( 0.7 )
	Glow20:setXRot( 180 )
	Glow20:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow20 )
	self.Glow20 = Glow20
	
	local Characters = LUI.UIImage.new()
	Characters:setLeftRight( 0, 0, 55, 877 )
	Characters:setTopBottom( 0, 0, 151, 973 )
	Characters:setAlpha( 0 )
	Characters:setImage( RegisterImage( "uie_t7_menu_welcome_characters" ) )
	self:addElement( Characters )
	self.Characters = Characters
	
	local StartIntroButton = CoD.list1ButtonNewStyle.new( self, controller )
	StartIntroButton:setLeftRight( 0, 0, 960, 1380 )
	StartIntroButton:setTopBottom( 0, 0, 661, 709 )
	StartIntroButton.btnDisplayText:setText( Engine.Localize( "MPUI_START_MULTIPLAYER_INTRODUCTION" ) )
	StartIntroButton.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_START_MULTIPLAYER_INTRODUCTION" ) )
	StartIntroButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	StartIntroButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( StartIntroButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBack( self, controller )
		OpenMPFirstTimeFlow( self, element, controller, "goBackFirst", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( StartIntroButton )
	self.StartIntroButton = StartIntroButton
	
	local CancelButton = CoD.list1ButtonNewStyle.new( self, controller )
	CancelButton:setLeftRight( 0, 0, 960, 1380 )
	CancelButton:setTopBottom( 0, 0, 729, 777 )
	CancelButton.btnDisplayText:setText( Engine.Localize( "MENU_CANCEL" ) )
	CancelButton.btnDisplayTextStroke:setText( Engine.Localize( "MENU_CANCEL" ) )
	CancelButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CancelButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( CancelButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( CancelButton )
	self.CancelButton = CancelButton
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	buttons:setLeftRight( 0, 0, 822, 1470 )
	buttons:setTopBottom( 1, 1, -155, -107 )
	self:addElement( buttons )
	self.buttons = buttons
	
	StartIntroButton.navigation = {
		down = CancelButton
	}
	CancelButton.navigation = {
		up = StartIntroButton
	}
	self:mergeStateConditions( {
		{
			stateName = "KeyboardAndMouse",
			condition = function ( menu, element, event )
				return IsPC() and not IsGamepad( controller )
			end
		},
		{
			stateName = "Gamepad",
			condition = function ( menu, element, event )
				return IsGamepad( controller )
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
	StartIntroButton.id = "StartIntroButton"
	CancelButton.id = "CancelButton"
	buttons:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.StartIntroButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel:close()
		self.TokenBox:close()
		self.StartIntroButton:close()
		self.CancelButton:close()
		self.buttons:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MPIntroRequired.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

