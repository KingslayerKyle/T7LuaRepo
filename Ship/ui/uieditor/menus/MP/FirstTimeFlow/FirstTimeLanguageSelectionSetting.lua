-- 127d2171fb82ea33c46330d419d8609b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MP.FirstTimeFlow.FirstTimeLanguageSelectLanguageWidget" )
require( "ui.uieditor.widgets.MP.FirstTimeFlow.FirstTimeLanguageSelectionListWidget" )
require( "ui.uieditor.widgets.ButtonIcon" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	if CoD.isDurango then
		f1_arg0.XboxGamerTag:setText( Engine.Localize( "XBOXLIVE_SIGNEDINAS", Engine.GetGamertagForController( 0 ) ) )
	else
		f1_arg0.XboxGamerTag:setText( "" )
	end
end

LUI.createMenu.FirstTimeLanguageSelectionSetting = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FirstTimeLanguageSelectionSetting" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FirstTimeLanguageSelectionSetting.buttonPrompts" )
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
	
	local WelcomeTitle0 = LUI.UIText.new()
	WelcomeTitle0:setLeftRight( true, false, 467.24, 1216 )
	WelcomeTitle0:setTopBottom( true, false, 143.45, 201.45 )
	WelcomeTitle0:setText( Engine.Localize( "MENU_CHOOSE_LANGUAGE" ) )
	WelcomeTitle0:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WelcomeTitle0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WelcomeTitle0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WelcomeTitle0 )
	self.WelcomeTitle0 = WelcomeTitle0
	
	local FirstTimeLanguageSelectLanguageWidget = CoD.FirstTimeLanguageSelectLanguageWidget.new( f2_local1, controller )
	FirstTimeLanguageSelectLanguageWidget:setLeftRight( true, false, 457.24, 651.24 )
	FirstTimeLanguageSelectLanguageWidget:setTopBottom( true, false, 205.8, 258.75 )
	FirstTimeLanguageSelectLanguageWidget:setAlpha( 0 )
	self:addElement( FirstTimeLanguageSelectLanguageWidget )
	self.FirstTimeLanguageSelectLanguageWidget = FirstTimeLanguageSelectLanguageWidget
	
	local DescText = LUI.UIText.new()
	DescText:setLeftRight( true, false, 467.24, 1178 )
	DescText:setTopBottom( true, false, 201.45, 220.45 )
	DescText:setAlpha( 0 )
	DescText:setText( Engine.Localize( "" ) )
	DescText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DescText )
	self.DescText = DescText
	
	local ButtonPromptText = LUI.UITightText.new()
	ButtonPromptText:setLeftRight( true, false, 509.36, 730.12 )
	ButtonPromptText:setTopBottom( true, false, 578, 597 )
	ButtonPromptText:setText( Engine.Localize( "MENU_SELECT" ) )
	ButtonPromptText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	self:addElement( ButtonPromptText )
	self.ButtonPromptText = ButtonPromptText
	
	local XboxGamerTag = LUI.UIText.new()
	XboxGamerTag:setLeftRight( true, false, 473.24, 694.24 )
	XboxGamerTag:setTopBottom( true, false, 210.8, 237.28 )
	XboxGamerTag:setAlpha( 0 )
	XboxGamerTag:setText( Engine.Localize( "XboxGamerTag" ) )
	XboxGamerTag:setTTF( "fonts/default.ttf" )
	XboxGamerTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XboxGamerTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( XboxGamerTag )
	self.XboxGamerTag = XboxGamerTag
	
	local buttonList = LUI.UIList.new( f2_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 473.24, 592.24 )
	buttonList:setTopBottom( true, false, 308.75, 408.75 )
	buttonList:setDataSource( "FirstTimeLanguageSelection" )
	buttonList:setWidgetType( CoD.FirstTimeLanguageSelectionListWidget )
	buttonList:setVerticalCount( 3 )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	f2_local1:AddButtonCallbackFunction( buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		ProcessListAction( self, f5_arg0, f5_arg2 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local ButtonIcon = CoD.ButtonIcon.new( f2_local1, controller )
	ButtonIcon:setLeftRight( true, false, 479.65, 504.83 )
	ButtonIcon:setTopBottom( true, false, 574.82, 600 )
	ButtonIcon:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			ButtonIcon.buttonImage:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	ButtonIcon:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ButtonIcon )
	self.ButtonIcon = ButtonIcon
	
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		GoBack( self, f9_arg2 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	buttonList.id = "buttonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FirstTimeLanguageSelectLanguageWidget:close()
		element.buttonList:close()
		element.ButtonIcon:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FirstTimeLanguageSelectionSetting.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

