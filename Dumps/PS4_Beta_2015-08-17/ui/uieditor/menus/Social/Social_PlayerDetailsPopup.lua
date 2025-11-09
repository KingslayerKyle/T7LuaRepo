require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.Social.Social_InfoPane" )

LUI.createMenu.Social_PlayerDetailsPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Social_PlayerDetailsPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Social_PlayerDetailsPopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( self, controller )
	VignetteBack:setLeftRight( true, true, 0, 0 )
	VignetteBack:setTopBottom( true, true, 0, 0 )
	VignetteBack:setAlpha( 0.75 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( true, true, 0, 0 )
	darkbg:setTopBottom( true, true, 0, 0 )
	darkbg:setRGB( 0.12, 0.12, 0.12 )
	darkbg:setAlpha( 0.7 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( true, true, 0, 0 )
	Black:setTopBottom( true, true, 105, -107 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0.9 )
	self:addElement( Black )
	self.Black = Black
	
	local TextureBackground = LUI.UIImage.new()
	TextureBackground:setLeftRight( true, false, -0.5, 1280 )
	TextureBackground:setTopBottom( true, false, 0, 720.28 )
	TextureBackground:setAlpha( 0.2 )
	TextureBackground:setImage( RegisterImage( "uie_t7_menu_welcome_bg2" ) )
	self:addElement( TextureBackground )
	self.TextureBackground = TextureBackground
	
	local FEFocusBarSolid = LUI.UIImage.new()
	FEFocusBarSolid:setLeftRight( true, true, -21, 25 )
	FEFocusBarSolid:setTopBottom( false, false, -254, -246 )
	FEFocusBarSolid:setRGB( 0, 0, 0 )
	FEFocusBarSolid:setAlpha( 0.7 )
	FEFocusBarSolid:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid:setShaderVector( 0, 0.04, 0.5, 0, 0 )
	FEFocusBarSolid:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarSolid )
	self.FEFocusBarSolid = FEFocusBarSolid
	
	local FEFocusBarAdd = LUI.UIImage.new()
	FEFocusBarAdd:setLeftRight( true, true, -24, 25 )
	FEFocusBarAdd:setTopBottom( false, false, -257, -249 )
	FEFocusBarAdd:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd:setAlpha( 0.99 )
	FEFocusBarAdd:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd:setShaderVector( 0, 0.04, 0.5, 0, 0 )
	FEFocusBarAdd:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarAdd )
	self.FEFocusBarAdd = FEFocusBarAdd
	
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
	
	local Buttons = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Buttons:makeFocusable()
	Buttons:setLeftRight( true, false, 64, 344 )
	Buttons:setTopBottom( true, false, 208, 478 )
	Buttons:setDataSource( "SocialPlayerDetailsButtons" )
	Buttons:setWidgetType( CoD.List1ButtonLarge_PH )
	Buttons:setVerticalCount( 8 )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( Buttons )
	self.Buttons = Buttons
	
	local playerInfo = CoD.Social_InfoPane.new( self, controller )
	playerInfo:setLeftRight( false, true, -913, -166 )
	playerInfo:setTopBottom( true, false, 210, 510 )
	playerInfo.friendship:setAlpha( 0 )
	playerInfo:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		playerInfo:setModel( model, controller )
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
	PlayerDetails:setLeftRight( true, false, 63, 528 )
	PlayerDetails:setTopBottom( true, false, 152, 184 )
	PlayerDetails:setText( Engine.Localize( "MPUI_PLAYER_DETAILS" ) )
	PlayerDetails:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( PlayerDetails )
	self.PlayerDetails = PlayerDetails
	
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	Buttons.id = "Buttons"
	playerInfo.id = "playerInfo"
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Social_PlayerDetailsPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

