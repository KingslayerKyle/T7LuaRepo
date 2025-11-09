require( "ui.uieditor.widgets.PersonalDataVault.genericVaultBackground" )
require( "ui.uieditor.widgets.PersonalDataVault.CollectiblePlacementWidgets.smallCollectibles" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.PersonalDataVault.CollectiblePlacementWidgets.smallCollectibles" )
require( "ui.uieditor.widgets.PersonalDataVault.CollectiblePlacementWidgets.mediumCollectibles" )
require( "ui.uieditor.widgets.PersonalDataVault.CollectiblePlacementWidgets.largeCollectibles" )

LUI.createMenu.PersonalDataVault_PlaceCollectibleLocations = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PersonalDataVault_PlaceCollectibleLocations" )
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
	ImgTabBackdrop:setLeftRight( true, false, -63.29, 1334.71 )
	ImgTabBackdrop:setTopBottom( true, false, 577.5, 736.5 )
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
	genericVaultBackground0.minorTitle:setText( Engine.Localize( "" ) )
	genericVaultBackground0.title:setText( Engine.Localize( "Display Collectible" ) )
	genericVaultBackground0.emblem:setAlpha( 0 )
	genericVaultBackground0.playerGreeting:setText( Engine.Localize( "" ) )
	self:addElement( genericVaultBackground0 )
	self.genericVaultBackground0 = genericVaultBackground0
	
	local frame = LUI.UIFrame.new( self, controller, 0, 0 )
	frame:setLeftRight( true, false, 65.5, 1214.5 )
	frame:setTopBottom( true, false, 167.5, 624.5 )
	frame:setRGB( 1, 1, 1 )
	frame:subscribeToGlobalModel( controller, "CollectiblesLayout", nil, function ( model )
		frame:setModel( model, controller )
	end )
	self:addElement( frame )
	self.frame = frame
	
	local basicTabList = CoD.basicTabList.new( self, controller )
	basicTabList:setLeftRight( false, false, -414.5, 734.5 )
	basicTabList:setTopBottom( true, false, 597.5, 637.5 )
	basicTabList:setRGB( 1, 1, 1 )
	basicTabList.grid:setDataSource( "PlaceCollectiblesTabs" )
	basicTabList.grid:setWidgetType( CoD.paintshopTabWidget )
	basicTabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		PDV_ChangeCollectibleArea( self, element, controller )
		return retVal
	end )
	self:addElement( basicTabList )
	self.basicTabList = basicTabList
	
	frame:linkToElementModel( basicTabList.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			frame:changeFrameWidget( modelValue )
		end
	end )
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
			PDV_ClosePlaceCollectiblesMenu( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if not PDV_IsDataVaultOpen( controller ) then
			LockInput( self, controller, true )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	frame.id = "frame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.frame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.genericVaultBackground0:close()
		self.basicTabList:close()
		self.frame:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

