-- a34307083c119e0cda71ead1dc81ce60
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.Social.Social_InfoPane" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_TitlePopup" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	if f1_arg0.playerInfo and f1_arg0.playerInfo.presence and f1_arg0.playerInfo.presence.joinable then
		SetProperty( f1_arg0.playerInfo.presence.joinable, "hideJoinButton", true )
		f1_arg0.playerInfo.presence.joinable:processEvent( {
			name = "update_state",
			menu = f1_arg0
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Social_PlayerDetailsPopup.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( true, true, 0, 0 )
	darkbg:setTopBottom( true, true, 0, 0 )
	darkbg:setRGB( 0.12, 0.12, 0.12 )
	darkbg:setAlpha( 0.95 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( f2_local1, controller )
	VignetteBack:setLeftRight( true, true, 0, 0 )
	VignetteBack:setTopBottom( true, true, 0, 0 )
	VignetteBack:setAlpha( 0.75 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( true, true, 0, 0 )
	Black:setTopBottom( true, true, 117, -81 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0.9 )
	self:addElement( Black )
	self.Black = Black
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 180, -125.83 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local TextureBackground = LUI.UIImage.new()
	TextureBackground:setLeftRight( true, false, 0, 1280 )
	TextureBackground:setTopBottom( true, false, 80, 684 )
	TextureBackground:setAlpha( 0 )
	TextureBackground:setImage( RegisterImage( "uie_t7_menu_welcome_bg2" ) )
	self:addElement( TextureBackground )
	self.TextureBackground = TextureBackground
	
	local FEFocusBarAdd = LUI.UIImage.new()
	FEFocusBarAdd:setLeftRight( true, true, -24, 25 )
	FEFocusBarAdd:setTopBottom( false, false, -186, -178 )
	FEFocusBarAdd:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd:setAlpha( 0.99 )
	FEFocusBarAdd:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd:setShaderVector( 0, 0, 0.5, 0, 0 )
	FEFocusBarAdd:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarAdd )
	self.FEFocusBarAdd = FEFocusBarAdd
	
	local Buttons = LUI.UIList.new( f2_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Buttons:makeFocusable()
	Buttons:setLeftRight( true, false, 99, 379 )
	Buttons:setTopBottom( true, false, 209, 547 )
	Buttons:setWidgetType( CoD.List1ButtonLarge_PH )
	Buttons:setVerticalCount( 10 )
	Buttons:setDataSource( "SocialPlayerDetailsButtons" )
	Buttons:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	Buttons:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	f2_local1:AddButtonCallbackFunction( Buttons, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		ProcessListAction( self, f5_arg0, f5_arg2 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	Buttons:subscribeToGlobalModel( controller, "SocialRoot", "recentPlayers.update", function ( model )
		UpdateDataSource( self, Buttons, controller )
	end )
	self:addElement( Buttons )
	self.Buttons = Buttons
	
	local playerInfo = CoD.Social_InfoPane.new( f2_local1, controller )
	playerInfo:setLeftRight( false, true, -876, -94 )
	playerInfo:setTopBottom( true, false, 210, 684 )
	playerInfo.friendship:setAlpha( 0 )
	playerInfo:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		playerInfo:setModel( model, controller )
	end )
	playerInfo:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		playerInfo.presence:setModel( model, controller )
	end )
	playerInfo:mergeStateConditions( {
		{
			stateName = "PlayerDetails",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( playerInfo )
	self.playerInfo = playerInfo
	
	local PlayerDetails = LUI.UITightText.new()
	PlayerDetails:setLeftRight( true, false, 96, 561 )
	PlayerDetails:setTopBottom( true, false, 125, 173 )
	PlayerDetails:setText( Engine.Localize( "MPUI_PLAYER_DETAILS" ) )
	PlayerDetails:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	PlayerDetails:setLetterSpacing( -2.2 )
	self:addElement( PlayerDetails )
	self.PlayerDetails = PlayerDetails
	
	local buttonBacking = LUI.UIImage.new()
	buttonBacking:setLeftRight( true, true, 0, 0 )
	buttonBacking:setTopBottom( false, true, -147.5, -111.5 )
	buttonBacking:setRGB( 0.13, 0.11, 0.12 )
	buttonBacking:setAlpha( 0 )
	self:addElement( buttonBacking )
	self.buttonBacking = buttonBacking
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( f2_local1, controller )
	buttons:setLeftRight( true, false, 96, 528 )
	buttons:setTopBottom( false, true, -120.5, -88.5 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( f2_local1, controller )
	StartMenuTitlePopup:setLeftRight( false, false, -691, -113 )
	StartMenuTitlePopup:setTopBottom( true, false, 90, 236 )
	StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "" ) )
	self:addElement( StartMenuTitlePopup )
	self.StartMenuTitlePopup = StartMenuTitlePopup
	
	local CategoryListLineTopBottom0 = LUI.UIImage.new()
	CategoryListLineTopBottom0:setLeftRight( true, true, 0, 0 )
	CategoryListLineTopBottom0:setTopBottom( true, false, 590.83, 597.5 )
	CategoryListLineTopBottom0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineTopBottom0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineTopBottom0 )
	self.CategoryListLineTopBottom0 = CategoryListLineTopBottom0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f2_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 0, 52 )
	FEMenuLeftGraphics:setTopBottom( true, false, 109, 547 )
	FEMenuLeftGraphics:setScale( 0.7 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( f2_local1, controller )
	FEMenuLeftGraphics0:setLeftRight( true, false, 1228, 1280 )
	FEMenuLeftGraphics0:setTopBottom( true, false, 109, 547 )
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				playerInfo:completeAnimation()
				self.clipFinished( playerInfo, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( f2_local1, self, controller )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		GoBack( self, f12_arg2 )
		return true
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.Buttons:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VignetteBack:close()
		element.Buttons:close()
		element.playerInfo:close()
		element.buttons:close()
		element.StartMenuTitlePopup:close()
		element.FEMenuLeftGraphics:close()
		element.FEMenuLeftGraphics0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Social_PlayerDetailsPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

