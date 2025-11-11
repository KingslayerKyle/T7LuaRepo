require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.MP.FirstTimeFlow.FirstTimeBrightnessListWidget" )
require( "ui.uieditor.widgets.PC.Utility.GenericClickButton" )

if IsOrbis() or IsDurango() then
	require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Graphics_SafeArea" )
end
local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		self.continueButton:registerEventHandler( "button_action", function ( element, event )
			SetProfileVar( controller, "com_first_time", 0 )
			UpdateGamerprofile( self, self, controller )
			ForceNotifyGlobalModel( controller, "mainFirstTimeFlowComplete" )
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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FirstTimeBrightnessSetting.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local NEWBGIMAGE = LUI.UIImage.new()
	NEWBGIMAGE:setLeftRight( 0, 1, -6, 6 )
	NEWBGIMAGE:setTopBottom( 0, 1, 161, -161 )
	NEWBGIMAGE:setImage( RegisterImage( "uie_t7_menu_welcome_bg3" ) )
	NEWBGIMAGE:setupUIStreamedImage( 0 )
	self:addElement( NEWBGIMAGE )
	self.NEWBGIMAGE = NEWBGIMAGE
	
	local WelcomeTitle = LUI.UIText.new()
	WelcomeTitle:setLeftRight( 0, 0, 692, 1815 )
	WelcomeTitle:setTopBottom( 0, 0, 215, 302 )
	WelcomeTitle:setRGB( 1, 0.41, 0 )
	WelcomeTitle:setText( Engine.Localize( "MENU_BRIGHTNESS" ) )
	WelcomeTitle:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WelcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WelcomeTitle )
	self.WelcomeTitle = WelcomeTitle
	
	local DescText = LUI.UIText.new()
	DescText:setLeftRight( 0, 0, 701, 1815 )
	DescText:setTopBottom( 0, 0, 302, 330 )
	DescText:setText( Engine.Localize( "MENU_ADJUST_BRIGHTNESS_FIRSTTIME" ) )
	DescText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DescText )
	self.DescText = DescText
	
	local BrightnessSettingsPipsList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	BrightnessSettingsPipsList:makeFocusable()
	BrightnessSettingsPipsList:setLeftRight( 0, 0, 710, 1048 )
	BrightnessSettingsPipsList:setTopBottom( 0, 0, 389, 419 )
	BrightnessSettingsPipsList:setWidgetType( CoD.FirstTimeBrightnessListWidget )
	BrightnessSettingsPipsList:setHorizontalCount( 20 )
	BrightnessSettingsPipsList:setDataSource( "BrightnessSelector" )
	BrightnessSettingsPipsList:registerEventHandler( "input_source_changed", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	BrightnessSettingsPipsList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		local element = BrightnessSettingsPipsList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
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
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	self:AddButtonCallbackFunction( BrightnessSettingsPipsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsMainFirstTimeSetup( controller ) then
			UpdateGamerprofile( self, element, controller )
			GoBack( self, controller )
			ClearMenuSavedState( menu )
			return true
		elseif IsPC() and not IsMouse( controller ) then
			SetProfileVar( controller, "com_first_time", 0 )
			UpdateGamerprofile( self, element, controller )
			ForceNotifyGlobalModel( controller, "mainFirstTimeFlowComplete" )
			ClearMenuSavedState( menu )
			return true
		elseif not IsPC() then
			OpenOverlay( self, "StartMenu_Options_Graphics_SafeArea", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsMainFirstTimeSetup( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif IsPC() and not IsMouse( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif not IsPC() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( BrightnessSettingsPipsList )
	self.BrightnessSettingsPipsList = BrightnessSettingsPipsList
	
	local NEWWHITEIMAGE = LUI.UIImage.new()
	NEWWHITEIMAGE:setLeftRight( 0, 0, 188, 609 )
	NEWWHITEIMAGE:setTopBottom( 0, 0, 230, 682 )
	NEWWHITEIMAGE:setImage( RegisterImage( "uie_t7_menu_welcome_whitelogo" ) )
	NEWWHITEIMAGE:setupUIStreamedImage( 0 )
	self:addElement( NEWWHITEIMAGE )
	self.NEWWHITEIMAGE = NEWWHITEIMAGE
	
	local FEFocusBarSolid = LUI.UIImage.new()
	FEFocusBarSolid:setLeftRight( 0, 1, -31, 37 )
	FEFocusBarSolid:setTopBottom( 0.5, 0.5, -385, -373 )
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
	FEFocusBarAdd:setTopBottom( 0.5, 0.5, -385, -373 )
	FEFocusBarAdd:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarAdd:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarAdd )
	self.FEFocusBarAdd = FEFocusBarAdd
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( 0, 1, -178, 144 )
	Glow2:setTopBottom( 0, 0, 153, 175 )
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
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	buttons:setLeftRight( 0, 0, 701, 1349 )
	buttons:setTopBottom( 0, 0, 857, 905 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local continueButton = CoD.GenericClickButton.new( self, controller )
	continueButton:setLeftRight( 0, 0, 701, 904 )
	continueButton:setTopBottom( 0, 0, 540, 600 )
	continueButton:setAlpha( 0 )
	continueButton.label:setText( Engine.Localize( "MENU_CONTINUE" ) )
	self:addElement( continueButton )
	self.continueButton = continueButton
	
	local XboxGamerTag = LUI.UIText.new()
	XboxGamerTag:setLeftRight( 0, 0, 700, 1032 )
	XboxGamerTag:setTopBottom( 0, 0, 484, 523 )
	XboxGamerTag:setText( Engine.Localize( "XboxGamerTag" ) )
	XboxGamerTag:setTTF( "fonts/default.ttf" )
	XboxGamerTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XboxGamerTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( XboxGamerTag )
	self.XboxGamerTag = XboxGamerTag
	
	NEWWHITEIMAGE:linkToElementModel( BrightnessSettingsPipsList, "color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NEWWHITEIMAGE:setRGB( modelValue )
		end
	end )
	self.resetProperties = function ()
		buttons:completeAnimation()
		continueButton:completeAnimation()
		buttons:setAlpha( 1 )
		continueButton:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self.resetProperties()
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
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
		menu = self
	} )
	if not self:restoreState() then
		self.BrightnessSettingsPipsList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BrightnessSettingsPipsList:close()
		self.buttons:close()
		self.continueButton:close()
		self.NEWWHITEIMAGE:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FirstTimeBrightnessSetting.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

