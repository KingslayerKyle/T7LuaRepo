-- e15d1ba454e2d65bf7336fc5d61ded1e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CharacterCustomization.list1ButtonNewStyle" )
require( "ui.uieditor.menus.MP.FirstTimeFlow.FirstTimeBrightnessSetting" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isDurango then
		self.XboxGamerTag:setText( Engine.Localize( "XBOXLIVE_SIGNEDINAS", Engine.GetGamertagForController( 0 ) ) )
	else
		self.XboxGamerTag:setText( "" )
	end
end

LUI.createMenu.FirstTimeGraphicContentSetting = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FirstTimeGraphicContentSetting" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FirstTimeGraphicContentSetting.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local NEWBGIMAGE = LUI.UIImage.new()
	NEWBGIMAGE:setLeftRight( true, true, -3.82, 3.82 )
	NEWBGIMAGE:setTopBottom( true, true, 107.5, -107.5 )
	NEWBGIMAGE:setImage( RegisterImage( "uie_t7_menu_welcome_bg3" ) )
	NEWBGIMAGE:setupUIStreamedImage( 0 )
	self:addElement( NEWBGIMAGE )
	self.NEWBGIMAGE = NEWBGIMAGE
	
	local WelcomeTitle = LUI.UIText.new()
	WelcomeTitle:setLeftRight( true, false, 467.24, 1216 )
	WelcomeTitle:setTopBottom( true, false, 143.45, 201.45 )
	WelcomeTitle:setText( Engine.Localize( "MENU_GRAPHIC_CONTENT" ) )
	WelcomeTitle:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WelcomeTitle )
	self.WelcomeTitle = WelcomeTitle
	
	local DescText = LUI.UIText.new()
	DescText:setLeftRight( true, false, 467.24, 1178 )
	DescText:setTopBottom( true, false, 201.45, 220.45 )
	DescText:setText( Engine.Localize( "MENU_GRAPHIC_CONTENT_ENABLE" ) )
	DescText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DescText )
	self.DescText = DescText
	
	local YesButton = CoD.list1ButtonNewStyle.new( f2_local1, controller )
	YesButton:setLeftRight( true, false, 467.24, 747.24 )
	YesButton:setTopBottom( true, false, 342.75, 374.75 )
	YesButton.btnDisplayText:setText( Engine.Localize( "MENU_YES_CAPS" ) )
	YesButton.btnDisplayTextStroke:setText( Engine.Localize( "MENU_YES_CAPS" ) )
	YesButton:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	YesButton:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	f2_local1:AddButtonCallbackFunction( YesButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		SetProfileVar( f5_arg2, "cg_mature", 1 )
		UpdateGamerprofile( self, f5_arg0, f5_arg2 )
		OpenOverlay( self, "FirstTimeBrightnessSetting", f5_arg2, "", "" )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( YesButton )
	self.YesButton = YesButton
	
	local NoButton = CoD.list1ButtonNewStyle.new( f2_local1, controller )
	NoButton:setLeftRight( true, false, 467.24, 747.24 )
	NoButton:setTopBottom( true, false, 387.75, 419.75 )
	NoButton.btnDisplayText:setText( Engine.Localize( "MENU_NO_CAPS" ) )
	NoButton.btnDisplayTextStroke:setText( Engine.Localize( "MENU_NO_CAPS" ) )
	NoButton:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	NoButton:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	f2_local1:AddButtonCallbackFunction( NoButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		SetProfileVar( f9_arg2, "cg_mature", 0 )
		UpdateGamerprofile( self, f9_arg0, f9_arg2 )
		OpenOverlay( self, "FirstTimeBrightnessSetting", f9_arg2, "", "" )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( NoButton )
	self.NoButton = NoButton
	
	local FEFocusBarSolid = LUI.UIImage.new()
	FEFocusBarSolid:setLeftRight( true, true, -20.86, 25.14 )
	FEFocusBarSolid:setTopBottom( false, false, -256.5, -248.5 )
	FEFocusBarSolid:setRGB( 0, 0, 0 )
	FEFocusBarSolid:setAlpha( 0.7 )
	FEFocusBarSolid:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid:setShaderVector( 0, 0.04, 0.5, 0, 0 )
	FEFocusBarSolid:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarSolid )
	self.FEFocusBarSolid = FEFocusBarSolid
	
	local FEFocusBarAdd = LUI.UIImage.new()
	FEFocusBarAdd:setLeftRight( true, true, -23.86, 25.14 )
	FEFocusBarAdd:setTopBottom( false, false, -256.5, -248.5 )
	FEFocusBarAdd:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd:setShaderVector( 0, 0.04, 0.5, 0, 0 )
	FEFocusBarAdd:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarAdd )
	self.FEFocusBarAdd = FEFocusBarAdd
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -118.86, 96.14 )
	Glow2:setTopBottom( true, false, 102.29, 116.71 )
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
	
	local NEWGRAPHICIMAGE = LUI.UIImage.new()
	NEWGRAPHICIMAGE:setLeftRight( true, false, -3.14, 492.24 )
	NEWGRAPHICIMAGE:setTopBottom( true, false, 128.86, 433.71 )
	NEWGRAPHICIMAGE:setAlpha( 0.5 )
	NEWGRAPHICIMAGE:setImage( RegisterImage( "uie_t7_menu_welcome_graphic" ) )
	NEWGRAPHICIMAGE:setupUIStreamedImage( 0 )
	self:addElement( NEWGRAPHICIMAGE )
	self.NEWGRAPHICIMAGE = NEWGRAPHICIMAGE
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( f2_local1, controller )
	buttons:setLeftRight( true, false, 467.24, 899.24 )
	buttons:setTopBottom( true, false, 571.29, 603.29 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local XboxGamerTag = LUI.UIText.new()
	XboxGamerTag:setLeftRight( true, false, 467.24, 688.24 )
	XboxGamerTag:setTopBottom( true, false, 281.28, 307.28 )
	XboxGamerTag:setText( Engine.Localize( "XboxGamerTag" ) )
	XboxGamerTag:setTTF( "fonts/default.ttf" )
	XboxGamerTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XboxGamerTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( XboxGamerTag )
	self.XboxGamerTag = XboxGamerTag
	
	YesButton.navigation = {
		down = NoButton
	}
	NoButton.navigation = {
		up = YesButton
	}
	CoD.Menu.AddNavigationHandler( f2_local1, self, controller )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		GoBack( self, f11_arg2 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	YesButton.id = "YesButton"
	NoButton.id = "NoButton"
	buttons:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.YesButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.YesButton:close()
		element.NoButton:close()
		element.buttons:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FirstTimeGraphicContentSetting.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

