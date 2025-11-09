require( "ui.uieditor.widgets.MP.FirstTimeFlow.WelcomeMenu_Button" )

LUI.createMenu.CPWelcomeMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPWelcomeMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPWelcomeMenu.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.9 )
	self:addElement( background )
	self.background = background
	
	local TextureBackground = LUI.UIImage.new()
	TextureBackground:setLeftRight( true, false, -0.5, 1280 )
	TextureBackground:setTopBottom( true, false, 0, 720.28 )
	TextureBackground:setAlpha( 0.9 )
	TextureBackground:setImage( RegisterImage( "uie_t7_menu_welcome_bg" ) )
	self:addElement( TextureBackground )
	self.TextureBackground = TextureBackground
	
	local WelcomeTitle0 = LUI.UIText.new()
	WelcomeTitle0:setLeftRight( true, false, 624.36, 1217.54 )
	WelcomeTitle0:setTopBottom( true, false, 201.19, 237.45 )
	WelcomeTitle0:setRGB( 1, 0.41, 0 )
	WelcomeTitle0:setText( Engine.Localize( "CPUI_WELCOME_TO_CAMPAIGN" ) )
	WelcomeTitle0:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WelcomeTitle0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WelcomeTitle0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WelcomeTitle0 )
	self.WelcomeTitle0 = WelcomeTitle0
	
	local TextBox00 = LUI.UIText.new()
	TextBox00:setLeftRight( true, false, 626.36, 1086.54 )
	TextBox00:setTopBottom( true, false, 237.45, 256.45 )
	TextBox00:setYRot( 1 )
	TextBox00:setText( Engine.Localize( "CPUI_WELCOME_MESSAGE" ) )
	TextBox00:setTTF( "fonts/escom.ttf" )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox00 )
	self.TextBox00 = TextBox00
	
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
	
	local CPImage = LUI.UIImage.new()
	CPImage:setLeftRight( true, false, 134.48, 771.87 )
	CPImage:setTopBottom( true, false, 86.56, 724.28 )
	CPImage:setAlpha( 0.9 )
	CPImage:setImage( RegisterImage( "uie_t7_menu_welcome_cp" ) )
	self:addElement( CPImage )
	self.CPImage = CPImage
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -119, 96 )
	Glow2:setTopBottom( true, false, 102.79, 117.21 )
	Glow2:setRGB( 1, 0.99, 0 )
	Glow2:setAlpha( 0.7 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
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
	
	local WelcomeMenuButton0 = CoD.WelcomeMenu_Button.new( self, controller )
	WelcomeMenuButton0:setLeftRight( true, false, 620.36, 771.87 )
	WelcomeMenuButton0:setTopBottom( true, false, 498.36, 543.36 )
	WelcomeMenuButton0.TextBox2:setText( Engine.Localize( "MENU_CONTINUE_CAPS" ) )
	self:addElement( WelcomeMenuButton0 )
	self.WelcomeMenuButton0 = WelcomeMenuButton0
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenGenders( self, controller, menu )
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
		element.WelcomeMenuButton0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPWelcomeMenu.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

