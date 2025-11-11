require( "ui.uieditor.widgets.MP.FirstTimeFlow.WelcomeMenu_Button" )

local TestHasOfflineProgression = function ( controller )
	local stats = nil
	if Engine.IsCampaignModeZombies() then
		stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_STATS_NIGHTMARE_OFFLINE )
	else
		stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_STATS_OFFLINE )
	end
	local offlineFirstTimeDone = stats.completedFirstTimeFlow:get()
	if offlineFirstTimeDone > 0 then
		return true
	else
		return false
	end
end

local LoadedEventHandler = function ( self, event )
	if CoD.isOnlineGame() and TestHasOfflineProgression( event.controller ) then
		CoD.OverlayUtility.CreateOverlay( event.controller, self, "CampaignOfflineToOnlineWarning" )
	end
end

local PreLoadFunc = function ( self, controller )
	self:registerEventHandler( "menu_opened", LoadedEventHandler )
end

LUI.createMenu.CPWelcomeMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPWelcomeMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPWelcomeMenu.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.9 )
	self:addElement( background )
	self.background = background
	
	local TextureBackground = LUI.UIImage.new()
	TextureBackground:setLeftRight( 0, 0, -1, 1920 )
	TextureBackground:setTopBottom( 0, 0, 0, 1080 )
	TextureBackground:setAlpha( 0.9 )
	TextureBackground:setImage( RegisterImage( "uie_t7_menu_welcome_bg" ) )
	self:addElement( TextureBackground )
	self.TextureBackground = TextureBackground
	
	local WelcomeTitle0 = LUI.UIText.new()
	WelcomeTitle0:setLeftRight( 0, 0, 936, 1787 )
	WelcomeTitle0:setTopBottom( 0, 0, 302, 356 )
	WelcomeTitle0:setRGB( 1, 0.41, 0 )
	WelcomeTitle0:setText( Engine.Localize( "CPUI_WELCOME_TO_CAMPAIGN" ) )
	WelcomeTitle0:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WelcomeTitle0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WelcomeTitle0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WelcomeTitle0 )
	self.WelcomeTitle0 = WelcomeTitle0
	
	local TextBox00 = LUI.UIText.new()
	TextBox00:setLeftRight( 0, 0, 939, 1787 )
	TextBox00:setTopBottom( 0, 0, 356, 384 )
	TextBox00:setYRot( 1 )
	TextBox00:setText( Engine.Localize( "CPUI_WELCOME_MESSAGE" ) )
	TextBox00:setTTF( "fonts/escom.ttf" )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox00 )
	self.TextBox00 = TextBox00
	
	local FEFocusBarSolid = LUI.UIImage.new()
	FEFocusBarSolid:setLeftRight( 0, 1, -31, 37 )
	FEFocusBarSolid:setTopBottom( 0.5, 0.5, -381, -369 )
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
	FEFocusBarAdd:setTopBottom( 0.5, 0.5, -381, -369 )
	FEFocusBarAdd:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd:setAlpha( 0.99 )
	FEFocusBarAdd:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarAdd:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarAdd )
	self.FEFocusBarAdd = FEFocusBarAdd
	
	local CPImage = LUI.UIImage.new()
	CPImage:setLeftRight( 0, 0, 202, 1158 )
	CPImage:setTopBottom( 0, 0, 130, 1087 )
	CPImage:setAlpha( 0.9 )
	CPImage:setImage( RegisterImage( "uie_t7_menu_welcome_cp" ) )
	self:addElement( CPImage )
	self.CPImage = CPImage
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( 0, 1, -178, 144 )
	Glow2:setTopBottom( 0, 0, 154, 176 )
	Glow2:setRGB( 1, 0.99, 0 )
	Glow2:setAlpha( 0.7 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
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
	
	local WelcomeMenuButton0 = CoD.WelcomeMenu_Button.new( self, controller )
	WelcomeMenuButton0:setLeftRight( 0, 0, 1006, 1140 )
	WelcomeMenuButton0:setTopBottom( 0, 0, 746, 813 )
	WelcomeMenuButton0.TextBox2:setText( Engine.Localize( "MENU_CONTINUE_CAPS" ) )
	self:addElement( WelcomeMenuButton0 )
	self.WelcomeMenuButton0 = WelcomeMenuButton0
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenGenders( self, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.WelcomeMenuButton0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPWelcomeMenu.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

