require( "ui.uieditor.widgets.PersonalDataVault.genericVaultBackground" )
require( "ui.uieditor.widgets.PersonalDataVault.collectibleListItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )

local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].inspectingMap = nil
end

LUI.createMenu.PersonalDataVault_SelectCollectible = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PersonalDataVault_SelectCollectible" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local ImgTabBackdrop = LUI.UIImage.new()
	ImgTabBackdrop:setLeftRight( true, false, -36.72, 1315.28 )
	ImgTabBackdrop:setTopBottom( true, false, 620, 748 )
	ImgTabBackdrop:setRGB( 0, 0, 0 )
	ImgTabBackdrop:setAlpha( 0.85 )
	ImgTabBackdrop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ImgTabBackdrop )
	self.ImgTabBackdrop = ImgTabBackdrop
	
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
	
	local collectiblesList = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	collectiblesList:makeFocusable()
	collectiblesList:setLeftRight( true, false, 405, 875 )
	collectiblesList:setTopBottom( true, false, 136, 606 )
	collectiblesList:setRGB( 1, 1, 1 )
	collectiblesList:setDataSource( "CollectiblesList" )
	collectiblesList:setWidgetType( CoD.collectibleListItem )
	collectiblesList:setHorizontalCount( 3 )
	collectiblesList:setVerticalCount( 3 )
	collectiblesList:setSpacing( 10 )
	collectiblesList:setVerticalScrollbar( CoD.verticalScrollbar )
	collectiblesList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		PDV_PlaceCollectible( self, element, controller )
		return retVal
	end )
	self:addElement( collectiblesList )
	self.collectiblesList = collectiblesList
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK_CAPS" ), "ESCAPE", element )
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
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	collectiblesList.id = "collectiblesList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.collectiblesList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.genericVaultBackground0:close()
		self.collectiblesList:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

