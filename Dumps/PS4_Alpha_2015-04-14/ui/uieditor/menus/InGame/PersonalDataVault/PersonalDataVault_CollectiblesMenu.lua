require( "ui.uieditor.menus.InGame.PersonalDataVault.PersonalDataVault_PlaceCollectibleLocations" )
require( "ui.uieditor.widgets.PersonalDataVault.genericVaultBackground" )
require( "ui.uieditor.widgets.PersonalDataVault.genericVaultList" )
require( "ui.uieditor.widgets.PersonalDataVault.collectiblesListArea" )
require( "ui.uieditor.widgets.PersonalDataVault.collectiblesInspectionArea" )

CoD.PDV_Collectibles = {}
CoD.PDV_Collectibles.Modes = {
	SELECTING_MISSION = 1,
	SELECTING_COLLECTIBLE = 2,
	INSPECTING_COLLECTIBLE = 3
}
CoD.PDV_Collectibles.ModeToOpenIn = CoD.PDV_Collectibles.Modes.SELECTING_MISSION
local PostLoadFunc = function ( self )
	local controller = self.m_ownerController
	CoD.perController[controller].selectingCollectibleSlot = nil
	self.updateMode = function ( self, mode, element )
		if self.currentMode == CoD.PDV_Collectibles.Modes.SELECTING_MISSION and element then
			CoD.perController[controller].inspectingMap = element.map_name
			self.collectiblesListArea0.collectiblesList:updateDataSource()
		end
		self.currentMode = mode
		CoD.PDV_Collectibles.ModeToOpenIn = mode
		if mode == CoD.PDV_Collectibles.Modes.SELECTING_MISSION then
			self:setState( "DefaultState" )
			self.collectiblesListArea0:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
			self.collectiblesListArea0:makeNotFocusable()
			self.collectiblesListArea0.collectiblesList.savedActiveIndex = nil
			self.genericVaultList0:makeFocusableWithoutResettingNavigation()
			self.genericVaultList0:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
		elseif mode == CoD.PDV_Collectibles.Modes.SELECTING_COLLECTIBLE then
			self:setState( "SelectingCollectible" )
			self.genericVaultList0:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
			self.genericVaultList0:makeNotFocusable()
			self.collectiblesListArea0:makeFocusableWithoutResettingNavigation()
			self.collectiblesListArea0:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
		elseif mode == CoD.PDV_Collectibles.Modes.INSPECTING_COLLECTIBLE then
			self:setState( "InspectingCollectible" )
			self.genericVaultList0:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
			self.genericVaultList0:makeNotFocusable()
			self.collectiblesListArea0:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
			self.collectiblesListArea0:makeNotFocusable()
		end
	end
	
	self:updateMode( CoD.PDV_Collectibles.ModeToOpenIn )
end

LUI.createMenu.PersonalDataVault_CollectiblesMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PersonalDataVault_CollectiblesMenu" )
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
	BDcolor:setLeftRight( true, false, -19.6, 1304.4 )
	BDcolor:setTopBottom( true, false, -21.8, 732.2 )
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
	genericVaultBackground0.minorTitle:setText( Engine.Localize( "" ) )
	genericVaultBackground0.title:setText( Engine.Localize( "CPUI_NARRATIVE_COLLECTIBLES" ) )
	genericVaultBackground0.playerGreeting:setText( Engine.Localize( "CPUI_PLAYER_GREETING" ) )
	self:addElement( genericVaultBackground0 )
	self.genericVaultBackground0 = genericVaultBackground0
	
	local genericVaultList0 = CoD.genericVaultList.new( self, controller )
	genericVaultList0:setLeftRight( true, false, 64, 292 )
	genericVaultList0:setTopBottom( true, false, 116, 916 )
	genericVaultList0:setRGB( 1, 1, 1 )
	genericVaultList0.selectionList:setDataSource( "PersonalDataVault_MissionLocations" )
	genericVaultList0.listHeader:setText( Engine.Localize( "CPUI_CAREER_DATA" ) )
	genericVaultList0:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsDisabled( element, controller ) then
			PDV_SetChoosingCollectible( self, element, controller )
		end
		return retVal
	end )
	self:addElement( genericVaultList0 )
	self.genericVaultList0 = genericVaultList0
	
	local collectiblesListArea0 = CoD.collectiblesListArea.new( self, controller )
	collectiblesListArea0:setLeftRight( true, false, 348, 1208 )
	collectiblesListArea0:setTopBottom( true, false, 163, 617 )
	collectiblesListArea0:setRGB( 1, 1, 1 )
	collectiblesListArea0:setAlpha( 0 )
	collectiblesListArea0:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsDisabled( element, controller ) then
			PDV_SetInspectingCollectible( self, element, controller )
		end
		return retVal
	end )
	self:addElement( collectiblesListArea0 )
	self.collectiblesListArea0 = collectiblesListArea0
	
	local collectiblesInspectionArea0 = CoD.collectiblesInspectionArea.new( self, controller )
	collectiblesInspectionArea0:setLeftRight( true, false, 348, 1195 )
	collectiblesInspectionArea0:setTopBottom( true, false, 163, 633 )
	collectiblesInspectionArea0:setRGB( 1, 1, 1 )
	collectiblesInspectionArea0:setAlpha( 0 )
	self:addElement( collectiblesInspectionArea0 )
	self.collectiblesInspectionArea0 = collectiblesInspectionArea0
	
	collectiblesInspectionArea0:linkToElementModel( collectiblesListArea0.collectiblesList, nil, false, function ( model )
		collectiblesInspectionArea0:setModel( model, controller )
	end )
	genericVaultList0.navigation = {
		right = collectiblesListArea0
	}
	collectiblesListArea0.navigation = {
		left = genericVaultList0
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				collectiblesListArea0:completeAnimation()
				self.collectiblesListArea0:setAlpha( 0 )
				self.clipFinished( collectiblesListArea0, {} )
				collectiblesInspectionArea0:completeAnimation()
				self.collectiblesInspectionArea0:setAlpha( 0 )
				self.clipFinished( collectiblesInspectionArea0, {} )
			end
		},
		InspectingCollectible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				collectiblesListArea0:completeAnimation()
				self.collectiblesListArea0:setAlpha( 0 )
				self.clipFinished( collectiblesListArea0, {} )
				collectiblesInspectionArea0:completeAnimation()
				self.collectiblesInspectionArea0:setAlpha( 1 )
				self.clipFinished( collectiblesInspectionArea0, {} )
			end
		},
		SelectingCollectible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				collectiblesListArea0:completeAnimation()
				self.collectiblesListArea0:setAlpha( 1 )
				self.clipFinished( collectiblesListArea0, {} )
				collectiblesInspectionArea0:completeAnimation()
				self.collectiblesInspectionArea0:setAlpha( 0 )
				self.clipFinished( collectiblesInspectionArea0, {} )
			end
		}
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		if PDV_SelectingMap( menu ) then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
			return true
		elseif PDV_SelectingCollectible( menu ) then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
			return true
		elseif PDV_InspectingCollectible( menu ) then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		menu:addButtonPrompt( "alt1", Engine.Localize( "Display In Bunk" ), "X", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.alt1( self, self, {
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
			if PDV_SelectingMap( self ) then
				GoBack( self, controller )
				ClearSavedState( self, controller )
			elseif PDV_SelectingCollectible( self ) then
				PDV_SetChoosingMap( self, element, controller )
			elseif PDV_InspectingCollectible( self ) then
				PDV_SetChoosingCollectible( self, element, controller )
			end
		end
		if not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "X") then
			NavigateToMenu( self, "PersonalDataVault_PlaceCollectibleLocations", true, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	genericVaultList0.id = "genericVaultList0"
	collectiblesListArea0.id = "collectiblesListArea0"
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
		self.collectiblesListArea0:close()
		self.collectiblesInspectionArea0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

