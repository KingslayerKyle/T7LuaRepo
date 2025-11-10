require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.MP.FirstTimeFlow.WelcomeMenu_Button" )

LUI.createMenu.WelcomeMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WelcomeMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WelcomeMenu.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local FEButtonPanel = CoD.FE_ButtonPanelShader.new( self, controller )
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
	WelcomeTitle:setLeftRight( true, false, 629.87, 1195.06 )
	WelcomeTitle:setTopBottom( true, false, 144.15, 196.45 )
	WelcomeTitle:setRGB( 1, 0.41, 0 )
	WelcomeTitle:setText( Engine.Localize( "MENU_WELCOME_TO_MP" ) )
	WelcomeTitle:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WelcomeTitle )
	self.WelcomeTitle = WelcomeTitle
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 629.87, 1195.06 )
	TextBox0:setTopBottom( true, false, 201.45, 219.45 )
	TextBox0:setText( Engine.Localize( "MENU_WELCOME_TO_MP_DESC" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local Token = LUI.UIImage.new()
	Token:setLeftRight( true, false, 621.79, 740.55 )
	Token:setTopBottom( true, false, 347.47, 466.23 )
	Token:setAlpha( 0 )
	Token:setImage( RegisterImage( "uie_img_t7_menu_welcome_icontokenxlarge" ) )
	Token:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Token )
	self.Token = Token
	
	local TokenBox = CoD.cac_ButtonBoxLrgInactiveStroke.new( self, controller )
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
	
	local Glow21 = LUI.UIImage.new()
	Glow21:setLeftRight( true, true, 599.36, -492.12 )
	Glow21:setTopBottom( true, false, 521.76, 609.5 )
	Glow21:setAlpha( 0.8 )
	Glow21:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow21:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow21 )
	self.Glow21 = Glow21
	
	local Characters = LUI.UIImage.new()
	Characters:setLeftRight( true, false, 36.5, 584.38 )
	Characters:setTopBottom( true, false, 101, 648.88 )
	Characters:setAlpha( 0 )
	Characters:setImage( RegisterImage( "uie_t7_menu_welcome_characters" ) )
	self:addElement( Characters )
	self.Characters = Characters
	
	local WelcomeMenuButton0 = CoD.WelcomeMenu_Button.new( self, controller )
	WelcomeMenuButton0:setLeftRight( true, false, 616.73, 751.73 )
	WelcomeMenuButton0:setTopBottom( true, false, 545.45, 590.45 )
	WelcomeMenuButton0.TextBox2:setText( Engine.Localize( "MENU_LETS_GO" ) )
	self:addElement( WelcomeMenuButton0 )
	self.WelcomeMenuButton0 = WelcomeMenuButton0
	
	local logo = LUI.UIImage.new()
	logo:setLeftRight( true, false, 134.46, 441.34 )
	logo:setTopBottom( true, false, 296, 430.6 )
	logo:setAlpha( 0.95 )
	logo:setImage( RegisterImage( "uie_t7_menu_welcome_bo3logo" ) )
	self:addElement( logo )
	self.logo = logo
	
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
		local f1_local21 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return f1_local21( self, event )
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenChooseCharacterFromFirstTimeFlow( self, element, controller, "", menu )
		PlaySoundSetSound( self, "list_action" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
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
		element.FEButtonPanel:close()
		element.TokenBox:close()
		element.WelcomeMenuButton0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WelcomeMenu.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

