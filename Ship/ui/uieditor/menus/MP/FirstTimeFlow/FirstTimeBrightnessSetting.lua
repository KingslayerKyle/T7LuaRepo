-- e1d334792c4ec0a2953a75ef0a324062
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Graphics_SafeArea" )
require( "ui.uieditor.widgets.MP.FirstTimeFlow.FirstTimeBrightnessListWidget" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.PC.Utility.GenericClickButton" )

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		self.continueButton:registerEventHandler( "button_action", function ( element, event )
			UpdateGamerprofile( self, self, controller )
			if IsMainFirstTimeSetup( controller ) then
				SetProfileVar( controller, "com_first_time", 0 )
				ForceNotifyGlobalModel( controller, "mainFirstTimeFlowComplete" )
			else
				GoBack( self, controller )
				ClearMenuSavedState( self )
			end
		end )
	end
	if CoD.isDurango then
		self.XboxGamerTag:setText( Engine.Localize( "XBOXLIVE_SIGNEDINAS", Engine.GetGamertagForController( 0 ) ) )
	else
		self.XboxGamerTag:setText( "" )
	end
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FirstTimeBrightnessSetting.buttonPrompts" )
	local f3_local1 = self
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
	WelcomeTitle:setLeftRight( true, false, 461.24, 1210 )
	WelcomeTitle:setTopBottom( true, false, 143.45, 201.45 )
	WelcomeTitle:setRGB( 1, 0.41, 0 )
	WelcomeTitle:setText( Engine.Localize( "MENU_BRIGHTNESS" ) )
	WelcomeTitle:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WelcomeTitle )
	self.WelcomeTitle = WelcomeTitle
	
	local DescText = LUI.UIText.new()
	DescText:setLeftRight( true, false, 467.24, 1210 )
	DescText:setTopBottom( true, false, 201.45, 220.45 )
	DescText:setText( Engine.Localize( "MENU_ADJUST_BRIGHTNESS_FIRSTTIME" ) )
	DescText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DescText )
	self.DescText = DescText
	
	local BrightnessSettingsPipsList = LUI.UIList.new( f3_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	BrightnessSettingsPipsList:makeFocusable()
	BrightnessSettingsPipsList:setLeftRight( true, false, 467.24, 705.24 )
	BrightnessSettingsPipsList:setTopBottom( true, false, 259.38, 279.38 )
	BrightnessSettingsPipsList:setDataSource( "BrightnessSelector" )
	BrightnessSettingsPipsList:setWidgetType( CoD.FirstTimeBrightnessListWidget )
	BrightnessSettingsPipsList:setHorizontalCount( 20 )
	BrightnessSettingsPipsList:registerEventHandler( "input_source_changed", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BrightnessSettingsPipsList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		local f5_local0 = BrightnessSettingsPipsList
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BrightnessSettingsPipsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f6_local0 = nil
		AdjustBrightness( element, controller )
		UpdateState( self, event )
		return f6_local0
	end )
	BrightnessSettingsPipsList:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	BrightnessSettingsPipsList:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	f3_local1:AddButtonCallbackFunction( BrightnessSettingsPipsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if not IsMainFirstTimeSetup( f9_arg2 ) then
			UpdateGamerprofile( self, f9_arg0, f9_arg2 )
			GoBack( self, f9_arg2 )
			ClearMenuSavedState( f9_arg1 )
			return true
		elseif IsPC() and not IsMouse( f9_arg2 ) then
			SetProfileVar( f9_arg2, "com_first_time", 0 )
			UpdateGamerprofile( self, f9_arg0, f9_arg2 )
			ForceNotifyGlobalModel( f9_arg2, "mainFirstTimeFlowComplete" )
			ClearMenuSavedState( f9_arg1 )
			return true
		elseif not IsPC() then
			OpenOverlay( self, "StartMenu_Options_Graphics_SafeArea", f9_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsMainFirstTimeSetup( f10_arg2 ) then
			return true
		elseif IsPC() and not IsMouse( f10_arg2 ) then
			return true
		elseif not IsPC() then
			return true
		else
			return false
		end
	end, false )
	self:addElement( BrightnessSettingsPipsList )
	self.BrightnessSettingsPipsList = BrightnessSettingsPipsList
	
	local NEWWHITEIMAGE = LUI.UIImage.new()
	NEWWHITEIMAGE:setLeftRight( true, false, 125.31, 406.24 )
	NEWWHITEIMAGE:setTopBottom( true, false, 153.45, 454.45 )
	NEWWHITEIMAGE:setImage( RegisterImage( "uie_t7_menu_welcome_whitelogo" ) )
	NEWWHITEIMAGE:setupUIStreamedImage( 0 )
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
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( f3_local1, controller )
	buttons:setLeftRight( true, false, 467.24, 899.24 )
	buttons:setTopBottom( true, false, 571.29, 603.29 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local continueButton = CoD.GenericClickButton.new( f3_local1, controller )
	continueButton:setLeftRight( true, false, 467.24, 602.24 )
	continueButton:setTopBottom( true, false, 360, 400 )
	continueButton:setAlpha( 0 )
	continueButton.label:setText( Engine.Localize( "MENU_CONTINUE" ) )
	self:addElement( continueButton )
	self.continueButton = continueButton
	
	local XboxGamerTag = LUI.UIText.new()
	XboxGamerTag:setLeftRight( true, false, 467, 688 )
	XboxGamerTag:setTopBottom( true, false, 323, 349 )
	XboxGamerTag:setText( Engine.Localize( "XboxGamerTag" ) )
	XboxGamerTag:setTTF( "fonts/default.ttf" )
	XboxGamerTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XboxGamerTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( XboxGamerTag )
	self.XboxGamerTag = XboxGamerTag
	
	NEWWHITEIMAGE:linkToElementModel( BrightnessSettingsPipsList, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			NEWWHITEIMAGE:setRGB( color )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				buttons:completeAnimation()
				self.buttons:setAlpha( 1 )
				self.clipFinished( buttons, {} )
				continueButton:completeAnimation()
				self.continueButton:setAlpha( 0 )
				self.clipFinished( continueButton, {} )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				buttons:completeAnimation()
				self.buttons:setAlpha( 0 )
				self.clipFinished( buttons, {} )
				continueButton:completeAnimation()
				self.continueButton:setAlpha( 1 )
				self.clipFinished( continueButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				return IsPC() and IsMouse( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f3_local17 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or f3_local1
			element:updateState( event )
			return f3_local17( element, event )
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
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		GoBack( self, f17_arg2 )
		ClearMenuSavedState( f17_arg1 )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	BrightnessSettingsPipsList.id = "BrightnessSettingsPipsList"
	buttons:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	if not self:restoreState() then
		self.BrightnessSettingsPipsList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BrightnessSettingsPipsList:close()
		element.buttons:close()
		element.continueButton:close()
		element.NEWWHITEIMAGE:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FirstTimeBrightnessSetting.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

