require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Heroes.heroCarouselItem" )
require( "ui.uieditor.menus.Heroes.personalizeHero_v1" )

local ChooseHeroesPrepare = function ( controller )
	return {
		{
			models = {
				displayText = "HEROES_PERSONALIZE",
				action = function ( self, element, controller, param, menu )
					NavigateToMenu( menu, "personalizeHero_v1", true, controller )
				end
				
			},
			properties = {
				disabled = false
			}
		},
		{
			models = {
				displayText = "HEROES_INSPECTION_POSE"
			},
			properties = {
				disabled = true
			}
		},
		{
			models = {
				displayText = "HEROES_SHOWCASE_WEAPON"
			},
			properties = {
				disabled = true
			}
		}
	}
end

DataSources.ChooseHeroesOptions = DataSourceHelpers.ListSetup( "ChooseHeroesOptions", ChooseHeroesPrepare, true )
local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	self.restoreState = function ( self )
		if not self.super:restoreState() then
			local f4_local0 = CoD.CCUtility.Heroes.HeroIndexForEdits
			if not f4_local0 then
				local findHero = Engine.GetEquippedHero( controller )
			end
			local focusedWidget = self.heroCarousel:findItem( nil, {
				heroIndex = f4_local0
			}, nil, false )
			if focusedWidget then
				self.heroCarousel:processEvent( {
					name = "gain_focus",
					controller = controller,
					selectIndex = focusedWidget.gridInfoTable.zeroBasedIndex
				} )
			else
				self.heroCarousel:processEvent( {
					name = "gain_focus",
					controller = controller
				} )
			end
		end
		return true
	end
	
end

LUI.createMenu.ChooseHero_v1 = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseHero_v1" )
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
	GenericMenuFrame0:setLeftRight( true, false, 0, 1280 )
	GenericMenuFrame0:setTopBottom( true, false, 0, 720 )
	GenericMenuFrame0:setRGB( 1, 1, 1 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "HEROES_CHOOSE_HERO" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local heroCarousel = LUI.UIList.new( self, controller, 4, 200, nil, false, true, 232, 0, false, true )
	heroCarousel:makeFocusable()
	heroCarousel:setLeftRight( true, false, 0, 7608 )
	heroCarousel:setTopBottom( true, false, 143.5, 604.5 )
	heroCarousel:setRGB( 1, 1, 1 )
	heroCarousel:setDataSource( "HeroesList" )
	heroCarousel:setWidgetType( CoD.heroCarouselItem )
	heroCarousel:setHorizontalCount( 9 )
	heroCarousel:setSpacing( 4 )
	heroCarousel:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		UpdateEditingHero( element, controller )
		return retVal
	end )
	heroCarousel:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsDisabled( element, controller ) then
			ProcessChooseHeroButtonPress( self, element, controller )
		end
		return retVal
	end )
	heroCarousel:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local retVal = nil
		DoneEdittingHero( self, element, controller )
		return retVal
	end )
	self:addElement( heroCarousel )
	self.heroCarousel = heroCarousel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				GenericMenuFrame0:completeAnimation()
				GenericMenuFrame0.titleLabel:completeAnimation()
				self.GenericMenuFrame0.titleLabel:setText( Engine.Localize( "HEROES_CHOOSE_HERO" ) )
				self.clipFinished( GenericMenuFrame0, {} )
			end
		},
		Outfit = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				GenericMenuFrame0:completeAnimation()
				GenericMenuFrame0.titleLabel:completeAnimation()
				self.GenericMenuFrame0.titleLabel:setText( Engine.Localize( "HEROES_CHOOSE_OUTFIT" ) )
				self.clipFinished( GenericMenuFrame0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Outfit",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT_CAPS" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		if IsEdittingLoadoutForHero() then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
			return true
		elseif IsInGame() then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
			return true
		else
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
			return true
		end
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
			if IsEdittingLoadoutForHero() then
				DoneEdittingHeroLoadout( controller )
			elseif IsInGame() then
				LockInput( self, controller, false )
				Close( self, controller )
				ClearSavedHeroForEdits( controller )
				SendMenuResponse( self, "ChooseHero", "closed", controller )
				ClearSavedState( self, controller )
			else
				GoBack( self, controller )
				ClearSavedHeroForEdits( controller )
				SendMenuResponse( self, "ChooseHero", "closed", controller )
				ClearSavedState( self, controller )
			end
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsInGame() then
			LockInput( self, controller, true )
			SendMenuResponse( self, "ChooseHero", "opened", controller )
		else
			SendMenuResponse( self, "ChooseHero", "opened", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	heroCarousel.id = "heroCarousel"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.heroCarousel:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.GenericMenuFrame0:close()
		self.heroCarousel:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

