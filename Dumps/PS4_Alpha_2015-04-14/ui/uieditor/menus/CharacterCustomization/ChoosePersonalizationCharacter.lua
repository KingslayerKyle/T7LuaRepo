require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.menus.CharacterCustomization.PersonalizeCharacter" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacterCarouselItem" )
require( "ui.uieditor.widgets.onOffText" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Heroes.PersonalizeElemsSideList" )

local PostLoadFunc = function ( self, controller )
	self.characterCarousel.m_disableNavigation = true
end

LUI.createMenu.ChoosePersonalizationCharacter = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChoosePersonalizationCharacter" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, false, -2, 1278 )
	GenericMenuFrame0:setTopBottom( true, false, -4, 716 )
	GenericMenuFrame0:setRGB( 1, 1, 1 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( AppendString( "HEROES_PERSONALIZE_HERO_NAME_CAPS", "_CAPS" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "HEROES_PERSONALIZE_SPECIALISTS_CAPS" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local characterCarousel = LUI.UIList.new( self, controller, 4, 200, nil, false, true, 232, 0, false, false )
	characterCarousel:makeFocusable()
	characterCarousel:setLeftRight( true, false, 0, 7608 )
	characterCarousel:setTopBottom( true, false, 137, 637 )
	characterCarousel:setRGB( 1, 1, 1 )
	characterCarousel:setDataSource( "HeroesList" )
	characterCarousel:setWidgetType( CoD.PersonalizeCharacterCarouselItem )
	characterCarousel:setHorizontalCount( 9 )
	characterCarousel:setSpacing( 4 )
	characterCarousel:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		UpdateEditingHero( element, controller )
		UpdateElementState( self, "leftBumper", controller )
		UpdateElementState( self, "rightBumper", controller )
		return retVal
	end )
	characterCarousel:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsDisabled( element, controller ) then
			NavigateToMenu( self, "PersonalizeCharacter", true, controller )
		end
		return retVal
	end )
	characterCarousel:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if IsSelectNextTabEvent( event ) then
			SelectNextItemIfPossible( self, element, controller )
		elseif IsSelectPreviousTabEvent( event ) then
			SelectPreviousItemIfPossible( self, element, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( characterCarousel )
	self.characterCarousel = characterCarousel
	
	local leftBumper = CoD.onOffText.new( self, controller )
	leftBumper:setLeftRight( true, false, 237, 464 )
	leftBumper:setTopBottom( true, false, 106, 131 )
	leftBumper:setRGB( 1, 1, 1 )
	leftBumper.lbText:setRGB( 1, 1, 1 )
	leftBumper.lbText:setText( Engine.Localize( "^BBUTTON_LUI_SHOULDERL^" ) )
	leftBumper.lbText:setTTF( "fonts/default.ttf" )
	leftBumper.lbText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	leftBumper:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsListAtStart( self, "characterCarousel", event )
			end
		}
	} )
	if leftBumper.m_eventHandlers.list_focus_changed then
		local currentEv = leftBumper.m_eventHandlers.list_focus_changed
		leftBumper:registerEventHandler( "list_focus_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		leftBumper:registerEventHandler( "list_focus_changed", LUI.UIElement.updateState )
	end
	self:addElement( leftBumper )
	self.leftBumper = leftBumper
	
	local currentEv = CoD.onOffText.new( self, controller )
	currentEv:setLeftRight( true, false, 806, 1043 )
	currentEv:setTopBottom( true, false, 106, 131 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv.lbText:setRGB( 1, 1, 1 )
	currentEv.lbText:setText( Engine.Localize( "^BBUTTON_LUI_SHOULDERR^" ) )
	currentEv.lbText:setTTF( "fonts/default.ttf" )
	currentEv.lbText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	currentEv:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsListAtEnd( self, "characterCarousel", event )
			end
		}
	} )
	if currentEv.m_eventHandlers.list_focus_changed then
		local currentEv = currentEv.m_eventHandlers.list_focus_changed
		currentEv:registerEventHandler( "list_focus_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "list_focus_changed", LUI.UIElement.updateState )
	end
	self:addElement( currentEv )
	self.rightBumper = currentEv
	
	local currentEv = CoD.FE_TitleNumBrdr.new( self, controller )
	currentEv:setLeftRight( true, true, 232, -232 )
	currentEv:setTopBottom( false, false, -256, -227 )
	currentEv:setRGB( 1, 1, 1 )
	self:addElement( currentEv )
	self.FETitleNumBrdr0 = currentEv
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 191, 227 )
	Image0:setTopBottom( false, false, -257.75, -254.25 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setZRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 191, 227 )
	Image1:setTopBottom( false, false, -229, -226 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 1053, 1089 )
	Image2:setTopBottom( false, false, -257.75, -254.25 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 1053, 1089 )
	Image3:setTopBottom( false, false, -228.5, -225 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 191, 227 )
	Image4:setTopBottom( false, false, 273.5, 276.5 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 1053, 1089 )
	Image5:setTopBottom( false, false, 275, 278.5 )
	Image5:setRGB( 1, 1, 1 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local PersonalizeElemsSideList = CoD.PersonalizeElemsSideList.new( self, controller )
	PersonalizeElemsSideList:setLeftRight( true, false, 0, 68 )
	PersonalizeElemsSideList:setTopBottom( true, false, 78, 748 )
	PersonalizeElemsSideList:setRGB( 1, 1, 1 )
	self:addElement( PersonalizeElemsSideList )
	self.PersonalizeElemsSideList = PersonalizeElemsSideList
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT_CAPS" ), "ESCAPE", element )
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
		elseif not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ESCAPE" then
			
		else
			
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
			ClearSavedHeroForEdits( controller )
			ClearSavedState( self, controller )
			SendOwnMenuResponse( self, controller, "closed" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendOwnMenuResponse( self, controller, "opened" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	characterCarousel.id = "characterCarousel"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.characterCarousel:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.GenericMenuFrame0:close()
		self.characterCarousel:close()
		self.leftBumper:close()
		self.rightBumper:close()
		self.FETitleNumBrdr0:close()
		self.PersonalizeElemsSideList:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

