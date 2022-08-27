-- 7910eba523851c890b7f13e53343ea85
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.MP.FirstTimeFlow.WelcomeMenu_Button" )
require( "ui.uieditor.menus.MP.FirstTimeFlow.FirstTimeBrightnessSetting" )
require( "ui.uieditor.menus.MP.FirstTimeFlow.FirstTimeGraphicContentSetting" )

LUI.createMenu.WelcomeMenuMain = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WelcomeMenuMain" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WelcomeMenuMain.buttonPrompts" )
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
	TextureBackground:setImage( RegisterImage( "uie_t7_menu_welcome_bg" ) )
	self:addElement( TextureBackground )
	self.TextureBackground = TextureBackground
	
	local WelcomeTitle = LUI.UIText.new()
	WelcomeTitle:setLeftRight( true, false, 619.53, 1212.71 )
	WelcomeTitle:setTopBottom( true, false, 201.19, 237.45 )
	WelcomeTitle:setRGB( 1, 0.41, 0 )
	WelcomeTitle:setText( Engine.Localize( "MENU_SETUP_CAPS" ) )
	WelcomeTitle:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WelcomeTitle )
	self.WelcomeTitle = WelcomeTitle
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 621.53, 1186.71 )
	TextBox0:setTopBottom( true, false, 237.45, 256.45 )
	TextBox0:setYRot( 1 )
	TextBox0:setText( Engine.Localize( "MENU_WELCOME_MENU_DESC" ) )
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
	FEFocusBarSolid:setShaderVector( 0, 0, 0.5, 0, 0 )
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
	FEFocusBarAdd:setShaderVector( 0, 0, 0.5, 0, 0 )
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
	FEFocusBarSolid0:setShaderVector( 0, 0, 0.5, 0, 0 )
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
	FEFocusBarAdd0:setShaderVector( 0, 0, 0.5, 0, 0 )
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
	
	local Character = LUI.UIImage.new()
	Character:setLeftRight( true, false, 14.38, 621.53 )
	Character:setTopBottom( true, false, 112, 605.3 )
	Character:setImage( RegisterImage( "uie_t7_menu_welcome_bo3banner" ) )
	self:addElement( Character )
	self.Character = Character
	
	local logo = LUI.UIImage.new()
	logo:setLeftRight( true, false, 180.46, 459.46 )
	logo:setTopBottom( true, false, 315.96, 438.33 )
	logo:setAlpha( 0 )
	logo:setImage( RegisterImage( "uie_t7_menu_welcome_bo3logo" ) )
	self:addElement( logo )
	self.logo = logo
	
	local WelcomeMenuButton0 = CoD.WelcomeMenu_Button.new( f1_local1, controller )
	WelcomeMenuButton0:setLeftRight( true, false, 663.68, 797.19 )
	WelcomeMenuButton0:setTopBottom( true, false, 498.36, 543.36 )
	WelcomeMenuButton0.TextBox2:setText( Engine.Localize( "MENU_WELCOME_MENU_GOT_IT" ) )
	WelcomeMenuButton0:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	WelcomeMenuButton0:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	f1_local1:AddButtonCallbackFunction( WelcomeMenuButton0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		if IsBooleanDvarSet( "ui_execdemo_beta" ) then
			GoBackAndOpenOverlayOnParent( self, "FirstTimeBrightnessSetting", f4_arg2 )
			return true
		else
			GoBackAndOpenOverlayOnParent( self, "FirstTimeGraphicContentSetting", f4_arg2 )
			return true
		end
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( WelcomeMenuButton0 )
	self.WelcomeMenuButton0 = WelcomeMenuButton0
	
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		GoBack( self, f6_arg2 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel:close()
		element.TokenBox:close()
		element.WelcomeMenuButton0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WelcomeMenuMain.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

