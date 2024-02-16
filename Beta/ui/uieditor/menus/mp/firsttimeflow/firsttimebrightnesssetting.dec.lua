require( "ui.uieditor.widgets.ButtonIcon" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Graphics_SafeArea" )
require( "ui.uieditor.widgets.MP.FirstTimeFlow.FirstTimeBrightnessListWidget" )

local PreLoadFunc = function ( self, controller )
	self.anyControllerAllowed = true
	self.unusedControllerAllowed = true
end

LUI.createMenu.FirstTimeBrightnessSetting = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FirstTimeBrightnessSetting" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FirstTimeBrightnessSetting.buttonPrompts" )
	local menu = self
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
	WelcomeTitle:setRGB( 1, 0.41, 0 )
	WelcomeTitle:setText( Engine.Localize( "MENU_BRIGHTNESS" ) )
	WelcomeTitle:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WelcomeTitle )
	self.WelcomeTitle = WelcomeTitle
	
	local DescText = LUI.UIText.new()
	DescText:setLeftRight( true, false, 467.24, 1178 )
	DescText:setTopBottom( true, false, 201.45, 220.45 )
	DescText:setText( Engine.Localize( "MENU_ADJUST_BRIGHTNESS_FIRSTTIME" ) )
	DescText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DescText )
	self.DescText = DescText
	
	local ButtonPromptText = LUI.UIText.new()
	ButtonPromptText:setLeftRight( true, false, 503.24, 640 )
	ButtonPromptText:setTopBottom( true, false, 533.83, 552.83 )
	ButtonPromptText:setText( Engine.Localize( "MENU_SELECT" ) )
	ButtonPromptText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	ButtonPromptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ButtonPromptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ButtonPromptText )
	self.ButtonPromptText = ButtonPromptText
	
	local ButtonIcon = CoD.ButtonIcon.new( menu, controller )
	ButtonIcon:setLeftRight( true, false, 461.24, 493.24 )
	ButtonIcon:setTopBottom( true, false, 527.33, 559.33 )
	ButtonIcon:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ButtonIcon.buttonImage:setImage( RegisterImage( modelValue ) )
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
	
	local BrightnessSettingsPipsList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	BrightnessSettingsPipsList:makeFocusable()
	BrightnessSettingsPipsList:setLeftRight( true, false, 467.24, 705.24 )
	BrightnessSettingsPipsList:setTopBottom( true, false, 259.38, 279.38 )
	BrightnessSettingsPipsList:setDataSource( "BrightnessSelector" )
	BrightnessSettingsPipsList:setWidgetType( CoD.FirstTimeBrightnessListWidget )
	BrightnessSettingsPipsList:setHorizontalCount( 20 )
	BrightnessSettingsPipsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		AdjustBrightness( element, controller )
		UpdateState( self, event )
		return retVal
	end )
	BrightnessSettingsPipsList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	BrightnessSettingsPipsList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( BrightnessSettingsPipsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenOverlay( self, "StartMenu_Options_Graphics_SafeArea", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BrightnessSettingsPipsList )
	self.BrightnessSettingsPipsList = BrightnessSettingsPipsList
	
	local NEWWHITEIMAGE = LUI.UIImage.new()
	NEWWHITEIMAGE:setLeftRight( true, false, 125.31, 406.24 )
	NEWWHITEIMAGE:setTopBottom( true, false, 153.45, 454.45 )
	NEWWHITEIMAGE:setImage( RegisterImage( "uie_t7_menu_welcome_whitelogo" ) )
	NEWWHITEIMAGE:setupUIStreamedImage( 0 )
	NEWWHITEIMAGE:subscribeToGlobalModel( controller, "BrightnessSettingsImageColor", "imageColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NEWWHITEIMAGE:setRGB( modelValue )
		end
	end )
	self:addElement( NEWWHITEIMAGE )
	self.NEWWHITEIMAGE = NEWWHITEIMAGE
	
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
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	BrightnessSettingsPipsList.id = "BrightnessSettingsPipsList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.BrightnessSettingsPipsList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonIcon:close()
		self.BrightnessSettingsPipsList:close()
		self.NEWWHITEIMAGE:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FirstTimeBrightnessSetting.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

