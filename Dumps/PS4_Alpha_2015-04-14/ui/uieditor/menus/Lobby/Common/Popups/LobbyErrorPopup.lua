require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.widgets.GenericPopups.ButtonPrompts" )
require( "ui.uieditor.widgets.GenericPopups.Generic_Frame_Pop_up" )

local LobbyErrorPopupSetMessage = function ( self, event )
	local model = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyErrorMsg" )
	Engine.SetModelValue( model, event.message )
	if event ~= nil and event.message ~= nil then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyErrorPopup: Setting lobby error message '" .. event.message .. "'.\n" )
	else
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyErrorPopup: Tried to set a null message.\n" )
	end
end

local PostLoadFunc = function ( self )
	self.disableDarkenElement = true
	self.disableBlur = true
	self:registerEventHandler( "lobby_error_popup_message", LobbyErrorPopupSetMessage )
	local model = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyErrorMsg" )
	local message = Engine.GetModelValue( model )
	if message ~= nil then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyErrorPopup: Opened with '" .. message .. "'.\n" )
	else
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyErrorPopup: Opened with no message.\n" )
	end
end

LUI.createMenu.LobbyErrorPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LobbyErrorPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local BackgroundDarken = CoD.DialogBackground.new( self, controller )
	BackgroundDarken:setLeftRight( false, false, -640, 640 )
	BackgroundDarken:setTopBottom( false, false, -363, 360 )
	BackgroundDarken:setRGB( 0.4, 0.4, 0.4 )
	BackgroundDarken:setAlpha( 0.45 )
	self:addElement( BackgroundDarken )
	self.BackgroundDarken = BackgroundDarken
	
	local BackGround = CoD.DialogBackground.new( self, controller )
	BackGround:setLeftRight( true, false, 405, 933.5 )
	BackGround:setTopBottom( true, false, 225.5, 464.5 )
	BackGround:setRGB( 1, 1, 1 )
	BackGround:setAlpha( 0.9 )
	self:addElement( BackGround )
	self.BackGround = BackGround
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 405, 933.5 )
	Image0:setTopBottom( true, false, 225.25, 462 )
	Image0:setRGB( 0.15, 0.16, 0.2 )
	Image0:setAlpha( 0.5 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	scorestreakVignetteContainer:setRGB( 1, 1, 1 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local lblErrorTitle = LUI.UITightText.new()
	lblErrorTitle:setLeftRight( true, false, 431.5, 531.5 )
	lblErrorTitle:setTopBottom( true, false, 234.5, 282.5 )
	lblErrorTitle:setRGB( 1, 1, 1 )
	lblErrorTitle:setText( Engine.Localize( "MENU_ERROR" ) )
	lblErrorTitle:setTTF( "fonts/escom.ttf" )
	self:addElement( lblErrorTitle )
	self.lblErrorTitle = lblErrorTitle
	
	local txtErrorMsg = LUI.UIText.new()
	txtErrorMsg:setLeftRight( true, false, 431.5, 916 )
	txtErrorMsg:setTopBottom( true, false, 282.5, 307.5 )
	txtErrorMsg:setRGB( 1, 1, 1 )
	txtErrorMsg:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	txtErrorMsg:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtErrorMsg:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	txtErrorMsg:subscribeToGlobalModel( controller, "LobbyGlobal", "lobbyErrorMsg", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			txtErrorMsg:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( txtErrorMsg )
	self.txtErrorMsg = txtErrorMsg
	
	local btnOK = CoD.button.new( self, controller )
	btnOK:setLeftRight( true, false, 431.5, 515.5 )
	btnOK:setTopBottom( true, false, 420, 450 )
	btnOK:setRGB( 1, 1, 1 )
	btnOK.buttoninternal0.Text0:setText( Engine.Localize( "MENU_OK" ) )
	btnOK:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		LobbyClearError( self, controller )
		GoBack( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( btnOK )
	self.btnOK = btnOK
	
	local ButtonPrompts = CoD.ButtonPrompts.new( self, controller )
	ButtonPrompts:setLeftRight( true, false, 429.5, 750.5 )
	ButtonPrompts:setTopBottom( true, false, 472, 503 )
	ButtonPrompts:setRGB( 1, 1, 1 )
	ButtonPrompts:setAlpha( 0.66 )
	self:addElement( ButtonPrompts )
	self.ButtonPrompts = ButtonPrompts
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 428, 904 )
	CategoryListLine:setTopBottom( true, false, 400, 406 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setAlpha( 0.85 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 951, 987 )
	Image5:setTopBottom( false, false, -134, -130.5 )
	Image5:setRGB( 1, 1, 1 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 352, 388 )
	Image1:setTopBottom( false, false, -134.75, -131.25 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 352, 388 )
	Image10:setTopBottom( false, false, 100.25, 103.75 )
	Image10:setRGB( 1, 1, 1 )
	Image10:setZRot( 180 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image50 = LUI.UIImage.new()
	Image50:setLeftRight( true, false, 951, 987 )
	Image50:setTopBottom( false, false, 101, 104.5 )
	Image50:setRGB( 1, 1, 1 )
	Image50:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image50:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image50 )
	self.Image50 = Image50
	
	local Image500 = LUI.UIImage.new()
	Image500:setLeftRight( true, false, 917, 953 )
	Image500:setTopBottom( false, false, 133, 136.5 )
	Image500:setRGB( 1, 1, 1 )
	Image500:setZRot( -90 )
	Image500:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image500:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image500 )
	self.Image500 = Image500
	
	local Image5000 = LUI.UIImage.new()
	Image5000:setLeftRight( true, false, 387, 423 )
	Image5000:setTopBottom( false, false, 133, 136.5 )
	Image5000:setRGB( 1, 1, 1 )
	Image5000:setZRot( -90 )
	Image5000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5000:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5000 )
	self.Image5000 = Image5000
	
	local Image5001 = LUI.UIImage.new()
	Image5001:setLeftRight( true, false, 917, 953 )
	Image5001:setTopBottom( false, false, -167, -163.5 )
	Image5001:setRGB( 1, 1, 1 )
	Image5001:setZRot( -270 )
	Image5001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5001:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5001 )
	self.Image5001 = Image5001
	
	local Image50010 = LUI.UIImage.new()
	Image50010:setLeftRight( true, false, 385, 421 )
	Image50010:setTopBottom( false, false, -169, -165.5 )
	Image50010:setRGB( 1, 1, 1 )
	Image50010:setZRot( -270 )
	Image50010:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image50010:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image50010 )
	self.Image50010 = Image50010
	
	local Trame = LUI.UIImage.new()
	Trame:setLeftRight( true, false, 749, 906 )
	Trame:setTopBottom( true, false, 238, 395 )
	Trame:setRGB( 1, 1, 1 )
	Trame:setAlpha( 0.25 )
	Trame:setImage( RegisterImage( "uie_img_t7_menu_popup_trame" ) )
	Trame:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Trame )
	self.Trame = Trame
	
	local Trame0 = LUI.UIImage.new()
	Trame0:setLeftRight( true, false, 590, 747 )
	Trame0:setTopBottom( true, false, 238, 395 )
	Trame0:setRGB( 1, 1, 1 )
	Trame0:setAlpha( 0.25 )
	Trame0:setImage( RegisterImage( "uie_img_t7_menu_popup_trame" ) )
	Trame0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Trame0 )
	self.Trame0 = Trame0
	
	local Trame00 = LUI.UIImage.new()
	Trame00:setLeftRight( true, false, 431, 588 )
	Trame00:setTopBottom( true, false, 239, 395 )
	Trame00:setRGB( 1, 1, 1 )
	Trame00:setAlpha( 0.25 )
	Trame00:setImage( RegisterImage( "uie_img_t7_menu_popup_trame" ) )
	Trame00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Trame00 )
	self.Trame00 = Trame00
	
	local GenericFramePopup0 = CoD.Generic_Frame_Pop_up.new( self, controller )
	GenericFramePopup0:setLeftRight( true, false, 403, 935 )
	GenericFramePopup0:setTopBottom( true, true, 225.5, -255.5 )
	GenericFramePopup0:setRGB( 1, 1, 1 )
	GenericFramePopup0:setAlpha( 0.73 )
	self:addElement( GenericFramePopup0 )
	self.GenericFramePopup0 = GenericFramePopup0
	
	btnOK.navigation = {
		up = GenericFramePopup0,
		right = GenericFramePopup0
	}
	GenericFramePopup0.navigation = {
		left = btnOK,
		down = btnOK
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
			LobbyClearError( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	btnOK.id = "btnOK"
	GenericFramePopup0.id = "GenericFramePopup0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.btnOK:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.BackgroundDarken:close()
		self.BackGround:close()
		self.scorestreakVignetteContainer:close()
		self.btnOK:close()
		self.ButtonPrompts:close()
		self.GenericFramePopup0:close()
		self.txtErrorMsg:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

