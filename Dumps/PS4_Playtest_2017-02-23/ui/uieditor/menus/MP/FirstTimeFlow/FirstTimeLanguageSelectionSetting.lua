require( "ui.uieditor.widgets.ButtonIcon" )
require( "ui.uieditor.widgets.MP.FirstTimeFlow.FirstTimeLanguageSelectionListWidget" )
require( "ui.uieditor.widgets.MP.FirstTimeFlow.FirstTimeLanguageSelectLanguageWidget" )

local PostLoadFunc = function ( self, controller )
	if CoD.isDurango then
		self.XboxGamerTag:setText( Engine.Localize( "XBOXLIVE_SIGNEDINAS", Engine.GetGamertagForController( 0 ) ) )
	else
		self.XboxGamerTag:setText( "" )
	end
end

LUI.createMenu.FirstTimeLanguageSelectionSetting = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FirstTimeLanguageSelectionSetting" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FirstTimeLanguageSelectionSetting.buttonPrompts" )
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
	
	local WelcomeTitle0 = LUI.UIText.new()
	WelcomeTitle0:setLeftRight( 0, 0, 701, 1824 )
	WelcomeTitle0:setTopBottom( 0, 0, 215, 302 )
	WelcomeTitle0:setText( Engine.Localize( "MENU_CHOOSE_LANGUAGE" ) )
	WelcomeTitle0:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WelcomeTitle0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WelcomeTitle0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WelcomeTitle0 )
	self.WelcomeTitle0 = WelcomeTitle0
	
	local FirstTimeLanguageSelectLanguageWidget = CoD.FirstTimeLanguageSelectLanguageWidget.new( self, controller )
	FirstTimeLanguageSelectLanguageWidget:setLeftRight( 0, 0, 686, 977 )
	FirstTimeLanguageSelectLanguageWidget:setTopBottom( 0, 0, 309, 388 )
	FirstTimeLanguageSelectLanguageWidget:setAlpha( 0 )
	self:addElement( FirstTimeLanguageSelectLanguageWidget )
	self.FirstTimeLanguageSelectLanguageWidget = FirstTimeLanguageSelectLanguageWidget
	
	local DescText = LUI.UIText.new()
	DescText:setLeftRight( 0, 0, 701, 1767 )
	DescText:setTopBottom( 0, 0, 302, 330 )
	DescText:setAlpha( 0 )
	DescText:setText( Engine.Localize( "" ) )
	DescText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DescText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DescText )
	self.DescText = DescText
	
	local ButtonPromptText = LUI.UITightText.new()
	ButtonPromptText:setLeftRight( 0, 0, 764, 1095 )
	ButtonPromptText:setTopBottom( 0, 0, 867, 895 )
	ButtonPromptText:setText( Engine.Localize( "MENU_SELECT" ) )
	ButtonPromptText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	self:addElement( ButtonPromptText )
	self.ButtonPromptText = ButtonPromptText
	
	local XboxGamerTag = LUI.UIText.new()
	XboxGamerTag:setLeftRight( 0, 0, 710, 1042 )
	XboxGamerTag:setTopBottom( 0, 0, 316, 356 )
	XboxGamerTag:setAlpha( 0 )
	XboxGamerTag:setText( Engine.Localize( "XboxGamerTag" ) )
	XboxGamerTag:setTTF( "fonts/default.ttf" )
	XboxGamerTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XboxGamerTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( XboxGamerTag )
	self.XboxGamerTag = XboxGamerTag
	
	local buttonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	buttonList:makeFocusable()
	buttonList:setLeftRight( 0, 0, 710, 888 )
	buttonList:setTopBottom( 0, 0, 464, 612 )
	buttonList:setWidgetType( CoD.FirstTimeLanguageSelectionListWidget )
	buttonList:setVerticalCount( 3 )
	buttonList:setDataSource( "FirstTimeLanguageSelection" )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
		return false
	end, false )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local ButtonIcon = CoD.ButtonIcon.new( self, controller )
	ButtonIcon:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	ButtonIcon:setLeftRight( 0, 0, 719, 757 )
	ButtonIcon:setTopBottom( 0, 0, 862, 900 )
	ButtonIcon:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ButtonIcon.buttonImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ButtonIcon )
	self.ButtonIcon = ButtonIcon
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
	buttonList.id = "buttonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FirstTimeLanguageSelectLanguageWidget:close()
		self.buttonList:close()
		self.ButtonIcon:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FirstTimeLanguageSelectionSetting.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

