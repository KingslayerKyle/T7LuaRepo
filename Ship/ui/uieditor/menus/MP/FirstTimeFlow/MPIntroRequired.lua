-- 8973e915f41e1fbebb065032f5485417
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CharacterCustomization.list1ButtonNewStyle" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

LUI.createMenu.MPIntroRequired = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MPIntroRequired" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MPIntroRequired.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.9 )
	self:addElement( background )
	self.background = background
	
	local FEButtonPanel = CoD.FE_ButtonPanelShader.new( f1_local1, controller )
	FEButtonPanel:setLeftRight( true, true, -24, 21 )
	FEButtonPanel:setTopBottom( true, true, 105, -105 )
	FEButtonPanel:setRGB( 0.38, 0.38, 0.38 )
	FEButtonPanel:setAlpha( 0 )
	FEButtonPanel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	FEButtonPanel:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( FEButtonPanel )
	self.FEButtonPanel = FEButtonPanel
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( true, true, 0, 0 )
	Black:setTopBottom( true, true, 105, -107.5 )
	Black:setRGB( 0.1, 0.1, 0.1 )
	Black:setAlpha( 0.7 )
	self:addElement( Black )
	self.Black = Black
	
	local TextureBackground = LUI.UIImage.new()
	TextureBackground:setLeftRight( true, false, -0.5, 1280 )
	TextureBackground:setTopBottom( true, false, 0, 720.28 )
	TextureBackground:setAlpha( 0.9 )
	TextureBackground:setImage( RegisterImage( "uie_t7_menu_welcome_bg2" ) )
	self:addElement( TextureBackground )
	self.TextureBackground = TextureBackground
	
	local Characters2b = LUI.UIImage.new()
	Characters2b:setLeftRight( true, false, -1.77, 631.79 )
	Characters2b:setTopBottom( true, false, 111.52, 610.44 )
	Characters2b:setImage( RegisterImage( "uie_t7_menu_welcome_characters3" ) )
	self:addElement( Characters2b )
	self.Characters2b = Characters2b
	
	local WelcomeTitle = LUI.UIText.new()
	WelcomeTitle:setLeftRight( true, false, 629.79, 1206.92 )
	WelcomeTitle:setTopBottom( true, false, 192.15, 232.45 )
	WelcomeTitle:setRGB( 1, 0.41, 0 )
	WelcomeTitle:setText( Engine.Localize( "MPUI_MP_INTRO_REQUIRED" ) )
	WelcomeTitle:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WelcomeTitle )
	self.WelcomeTitle = WelcomeTitle
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 629.79, 1194.97 )
	TextBox0:setTopBottom( true, false, 237.45, 256.45 )
	TextBox0:setText( Engine.Localize( "MPUI_MP_INTRO_REQUIRED_DESC" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TokenBox = CoD.cac_ButtonBoxLrgInactiveStroke.new( f1_local1, controller )
	TokenBox:setLeftRight( false, false, -89.11, 40.15 )
	TokenBox:setTopBottom( false, false, -17, 110.7 )
	TokenBox:setAlpha( 0 )
	self:addElement( TokenBox )
	self.TokenBox = TokenBox
	
	local FEFocusBarSolid = LUI.UIImage.new()
	FEFocusBarSolid:setLeftRight( true, true, -21, 25 )
	FEFocusBarSolid:setTopBottom( false, false, -254, -246 )
	FEFocusBarSolid:setRGB( 0, 0, 0 )
	FEFocusBarSolid:setAlpha( 0.7 )
	FEFocusBarSolid:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid:setShaderVector( 0, 0.04, 0.5, 0, 0 )
	FEFocusBarSolid:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarSolid )
	self.FEFocusBarSolid = FEFocusBarSolid
	
	local FEFocusBarAdd = LUI.UIImage.new()
	FEFocusBarAdd:setLeftRight( true, true, -24, 25 )
	FEFocusBarAdd:setTopBottom( false, false, -254, -246 )
	FEFocusBarAdd:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd:setAlpha( 0.99 )
	FEFocusBarAdd:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd:setShaderVector( 0, 0.04, 0.5, 0, 0 )
	FEFocusBarAdd:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarAdd )
	self.FEFocusBarAdd = FEFocusBarAdd
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -119, 96 )
	Glow2:setTopBottom( true, false, 102.79, 117.21 )
	Glow2:setRGB( 1, 0.99, 0 )
	Glow2:setAlpha( 0.7 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local FEFocusBarSolid0 = LUI.UIImage.new()
	FEFocusBarSolid0:setLeftRight( true, true, -21, 25 )
	FEFocusBarSolid0:setTopBottom( false, false, 248.5, 256.5 )
	FEFocusBarSolid0:setRGB( 0, 0, 0 )
	FEFocusBarSolid0:setAlpha( 0.7 )
	FEFocusBarSolid0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid0:setShaderVector( 0, 0.04, 0.5, 0, 0 )
	FEFocusBarSolid0:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarSolid0 )
	self.FEFocusBarSolid0 = FEFocusBarSolid0
	
	local FEFocusBarAdd0 = LUI.UIImage.new()
	FEFocusBarAdd0:setLeftRight( true, true, -24, 25 )
	FEFocusBarAdd0:setTopBottom( false, false, 248.5, 256.5 )
	FEFocusBarAdd0:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd0:setAlpha( 0.99 )
	FEFocusBarAdd0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd0:setShaderVector( 0, 0.04, 0.5, 0, 0 )
	FEFocusBarAdd0:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarAdd0 )
	self.FEFocusBarAdd0 = FEFocusBarAdd0
	
	local Glow20 = LUI.UIImage.new()
	Glow20:setLeftRight( true, true, -119, 96 )
	Glow20:setTopBottom( true, false, 603.29, 617.71 )
	Glow20:setRGB( 1, 0.99, 0 )
	Glow20:setAlpha( 0.7 )
	Glow20:setXRot( 180 )
	Glow20:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow20 )
	self.Glow20 = Glow20
	
	local Characters = LUI.UIImage.new()
	Characters:setLeftRight( true, false, 36.5, 584.38 )
	Characters:setTopBottom( true, false, 101, 648.88 )
	Characters:setAlpha( 0 )
	Characters:setImage( RegisterImage( "uie_t7_menu_welcome_characters" ) )
	self:addElement( Characters )
	self.Characters = Characters
	
	local StartIntroButton = CoD.list1ButtonNewStyle.new( f1_local1, controller )
	StartIntroButton:setLeftRight( true, false, 639.75, 919.75 )
	StartIntroButton:setTopBottom( true, false, 440.75, 472.75 )
	StartIntroButton.btnDisplayText:setText( Engine.Localize( "MPUI_START_MULTIPLAYER_INTRODUCTION" ) )
	StartIntroButton.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_START_MULTIPLAYER_INTRODUCTION" ) )
	StartIntroButton:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	StartIntroButton:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	f1_local1:AddButtonCallbackFunction( StartIntroButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		GoBack( self, f4_arg2 )
		OpenMPFirstTimeFlow( self, f4_arg0, f4_arg2, "goBackFirst", f4_arg1 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( StartIntroButton )
	self.StartIntroButton = StartIntroButton
	
	local CancelButton = CoD.list1ButtonNewStyle.new( f1_local1, controller )
	CancelButton:setLeftRight( true, false, 639.75, 919.75 )
	CancelButton:setTopBottom( true, false, 485.75, 517.75 )
	CancelButton.btnDisplayText:setText( Engine.Localize( "MENU_CANCEL" ) )
	CancelButton.btnDisplayTextStroke:setText( Engine.Localize( "MENU_CANCEL" ) )
	CancelButton:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	CancelButton:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	f1_local1:AddButtonCallbackFunction( CancelButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		GoBack( self, f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( CancelButton )
	self.CancelButton = CancelButton
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( f1_local1, controller )
	buttons:setLeftRight( true, false, 547.89, 979.89 )
	buttons:setTopBottom( false, true, -103.5, -71.5 )
	self:addElement( buttons )
	self.buttons = buttons
	
	StartIntroButton.navigation = {
		down = CancelButton
	}
	CancelButton.navigation = {
		up = StartIntroButton
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		KeyboardAndMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Gamepad = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
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
		local f1_local20 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or f1_local1
			element:updateState( event )
			return f1_local20( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	CoD.Menu.AddNavigationHandler( f1_local1, self, controller )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		GoBack( self, f17_arg2 )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
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
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.StartIntroButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel:close()
		element.TokenBox:close()
		element.StartIntroButton:close()
		element.CancelButton:close()
		element.buttons:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MPIntroRequired.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

