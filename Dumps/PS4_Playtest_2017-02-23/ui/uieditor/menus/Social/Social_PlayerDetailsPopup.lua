require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.Social.Social_InfoPane" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_TitlePopup" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )

local PostLoadFunc = function ( self, controller )
	if self.playerInfo and self.playerInfo.presence and self.playerInfo.presence.joinable then
		SetProperty( self.playerInfo.presence.joinable, "hideJoinButton", true )
		self.playerInfo.presence.joinable:processEvent( {
			name = "update_state",
			menu = self
		} )
	end
end

LUI.createMenu.Social_PlayerDetailsPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Social_PlayerDetailsPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Social_PlayerDetailsPopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( 0, 1, 0, 0 )
	darkbg:setTopBottom( 0, 1, 0, 0 )
	darkbg:setRGB( 0.12, 0.12, 0.12 )
	darkbg:setAlpha( 0.95 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( self, controller )
	VignetteBack:setLeftRight( 0, 1, 0, 0 )
	VignetteBack:setTopBottom( 0, 1, 0, 0 )
	VignetteBack:setAlpha( 0.75 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( 0, 1, 0, 0 )
	Black:setTopBottom( 0, 1, 175, -121 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0.9 )
	self:addElement( Black )
	self.Black = Black
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 270, -188 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local TextureBackground = LUI.UIImage.new()
	TextureBackground:setLeftRight( 0, 0, 0, 1920 )
	TextureBackground:setTopBottom( 0, 0, 120, 1026 )
	TextureBackground:setAlpha( 0 )
	TextureBackground:setImage( RegisterImage( "uie_t7_menu_welcome_bg2" ) )
	self:addElement( TextureBackground )
	self.TextureBackground = TextureBackground
	
	local FEFocusBarAdd = LUI.UIImage.new()
	FEFocusBarAdd:setLeftRight( 0, 1, -36, 38 )
	FEFocusBarAdd:setTopBottom( 0.5, 0.5, -279, -267 )
	FEFocusBarAdd:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd:setAlpha( 0.99 )
	FEFocusBarAdd:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarAdd:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarAdd )
	self.FEFocusBarAdd = FEFocusBarAdd
	
	local Buttons = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Buttons:makeFocusable()
	Buttons:setLeftRight( 0, 0, 148, 568 )
	Buttons:setTopBottom( 0, 0, 317, 715 )
	Buttons:setWidgetType( CoD.List1ButtonLarge_PH )
	Buttons:setVerticalCount( 8 )
	Buttons:setDataSource( "SocialPlayerDetailsButtons" )
	Buttons:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Buttons:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( Buttons, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	Buttons:subscribeToGlobalModel( controller, "SocialRoot", "recentPlayers.update", function ( model )
		local element = Buttons
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( Buttons )
	self.Buttons = Buttons
	
	local playerInfo = CoD.Social_InfoPane.new( self, controller )
	playerInfo:mergeStateConditions( {
		{
			stateName = "PlayerDetails",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	playerInfo:setLeftRight( 1, 1, -1314, -141 )
	playerInfo:setTopBottom( 0, 0, 315, 1026 )
	playerInfo.friendship:setAlpha( 0 )
	playerInfo:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		playerInfo:setModel( model, controller )
	end )
	playerInfo:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		playerInfo.presence:setModel( model, controller )
	end )
	self:addElement( playerInfo )
	self.playerInfo = playerInfo
	
	local PlayerDetails = LUI.UITightText.new()
	PlayerDetails:setLeftRight( 0, 0, 144, 842 )
	PlayerDetails:setTopBottom( 0, 0, 188, 260 )
	PlayerDetails:setText( Engine.Localize( "MPUI_PLAYER_DETAILS" ) )
	PlayerDetails:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	PlayerDetails:setLetterSpacing( -2.2 )
	self:addElement( PlayerDetails )
	self.PlayerDetails = PlayerDetails
	
	local buttonBacking = LUI.UIImage.new()
	buttonBacking:setLeftRight( 0, 1, 0, 0 )
	buttonBacking:setTopBottom( 1, 1, -221, -167 )
	buttonBacking:setRGB( 0.13, 0.11, 0.12 )
	buttonBacking:setAlpha( 0 )
	self:addElement( buttonBacking )
	self.buttonBacking = buttonBacking
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	buttons:setLeftRight( 0, 0, 144, 792 )
	buttons:setTopBottom( 1, 1, -181, -133 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( self, controller )
	StartMenuTitlePopup:setLeftRight( 0.5, 0.5, -1036.5, -169.5 )
	StartMenuTitlePopup:setTopBottom( 0, 0, 134.5, 353.5 )
	StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "" ) )
	self:addElement( StartMenuTitlePopup )
	self.StartMenuTitlePopup = StartMenuTitlePopup
	
	local CategoryListLineTopBottom0 = LUI.UIImage.new()
	CategoryListLineTopBottom0:setLeftRight( 0, 1, 0, 0 )
	CategoryListLineTopBottom0:setTopBottom( 0, 0, 886, 896 )
	CategoryListLineTopBottom0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineTopBottom0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineTopBottom0 )
	self.CategoryListLineTopBottom0 = CategoryListLineTopBottom0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 0, 78 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 163, 820 )
	FEMenuLeftGraphics:setScale( 0.7 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics0:setLeftRight( 0, 0, 1842, 1920 )
	FEMenuLeftGraphics0:setTopBottom( 0, 0, 163, 820 )
	FEMenuLeftGraphics0:setYRot( 180 )
	FEMenuLeftGraphics0:setScale( 0.7 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	Buttons.navigation = {
		right = playerInfo
	}
	playerInfo.navigation = {
		left = Buttons
	}
	self.resetProperties = function ()
		
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				playerInfo:completeAnimation()
				self.clipFinished( playerInfo, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	Buttons.id = "Buttons"
	playerInfo.id = "playerInfo"
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
		self.Buttons:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.VignetteBack:close()
		self.Buttons:close()
		self.playerInfo:close()
		self.buttons:close()
		self.StartMenuTitlePopup:close()
		self.FEMenuLeftGraphics:close()
		self.FEMenuLeftGraphics0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Social_PlayerDetailsPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

