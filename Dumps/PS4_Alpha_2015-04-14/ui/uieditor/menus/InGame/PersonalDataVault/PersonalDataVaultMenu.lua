require( "ui.uieditor.widgets.PersonalDataVault.genericVaultBackground" )
require( "ui.uieditor.widgets.PersonalDataVault.genericVaultList" )

LUI.createMenu.PersonalDataVaultMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PersonalDataVaultMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local BDcolor = LUI.UIImage.new()
	BDcolor:setLeftRight( true, false, -14.68, 1293.32 )
	BDcolor:setTopBottom( true, false, -12, 735 )
	BDcolor:setRGB( 0, 0, 0 )
	BDcolor:setAlpha( 0.5 )
	BDcolor:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( BDcolor )
	self.BDcolor = BDcolor
	
	local ImgMonitorCover = LUI.UIImage.new()
	ImgMonitorCover:setLeftRight( true, false, 0, 1280 )
	ImgMonitorCover:setTopBottom( true, false, 0, 720 )
	ImgMonitorCover:setRGB( 1, 1, 1 )
	ImgMonitorCover:setAlpha( 0 )
	ImgMonitorCover:setImage( RegisterImage( "uie_img_t7_menu_collectibles_tempmonitorcover" ) )
	ImgMonitorCover:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ImgMonitorCover )
	self.ImgMonitorCover = ImgMonitorCover
	
	local ImgVignetteFull = LUI.UIImage.new()
	ImgVignetteFull:setLeftRight( true, false, 0, 1280 )
	ImgVignetteFull:setTopBottom( true, false, 0, 720 )
	ImgVignetteFull:setRGB( 1, 1, 1 )
	ImgVignetteFull:setImage( RegisterImage( "uie_img_t7_hud_fx_vignette_fullblue" ) )
	ImgVignetteFull:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( ImgVignetteFull )
	self.ImgVignetteFull = ImgVignetteFull
	
	local genericVaultBackground0 = CoD.genericVaultBackground.new( self, controller )
	genericVaultBackground0:setLeftRight( true, false, 0, 1280 )
	genericVaultBackground0:setTopBottom( true, false, 0, 720 )
	genericVaultBackground0:setRGB( 1, 1, 1 )
	genericVaultBackground0.minorTitle:setText( Engine.Localize( "CPUI_COALESCENE_DATA_SYSTEMS_COPYWRITE" ) )
	genericVaultBackground0.title:setText( Engine.Localize( "CPUI_PERSONAL_DATA_VAULT" ) )
	genericVaultBackground0.playerGreeting:setText( Engine.Localize( "CPUI_PLAYER_GREETING" ) )
	self:addElement( genericVaultBackground0 )
	self.genericVaultBackground0 = genericVaultBackground0
	
	local genericVaultList0 = CoD.genericVaultList.new( self, controller )
	genericVaultList0:setLeftRight( true, false, 64, 368 )
	genericVaultList0:setTopBottom( true, false, 116, 916 )
	genericVaultList0:setRGB( 1, 1, 1 )
	genericVaultList0.listHeader:setText( Engine.Localize( "CPUI_CAREER_DATA" ) )
	self:addElement( genericVaultList0 )
	self.genericVaultList0 = genericVaultList0
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			PDV_DataVaultClosed( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ProcessListAction( self, element, controller )
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		PDV_DataVaultOpened( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	genericVaultList0.id = "genericVaultList0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.genericVaultList0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.genericVaultBackground0:close()
		self.genericVaultList0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

