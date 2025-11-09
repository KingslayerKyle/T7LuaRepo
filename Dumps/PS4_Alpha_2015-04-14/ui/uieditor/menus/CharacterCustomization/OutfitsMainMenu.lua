require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.menus.CharacterCustomization.ChooseOutfit" )
require( "ui.uieditor.menus.CharacterCustomization.PersonalizeCharacter" )
require( "ui.uieditor.menus.CharacterCustomization.ChooseGender" )
require( "ui.T7.Utility.CCUtility" )

local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	self.disableDarkenElement = true
end

LUI.createMenu.OutfitsMainMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "OutfitsMainMenu" )
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
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "HEROES_OUTFITS" ) ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local gridBacking = LUI.UIImage.new()
	gridBacking:setLeftRight( true, false, 0, 464 )
	gridBacking:setTopBottom( true, false, 93, 659 )
	gridBacking:setRGB( 1, 1, 1 )
	gridBacking:setAlpha( 0.2 )
	gridBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( gridBacking )
	self.gridBacking = gridBacking
	
	local renderBacking = LUI.UIImage.new()
	renderBacking:setLeftRight( true, false, 464, 1280 )
	renderBacking:setTopBottom( true, false, 93, 659 )
	renderBacking:setRGB( 1, 1, 1 )
	renderBacking:setAlpha( 0.4 )
	renderBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( renderBacking )
	self.renderBacking = renderBacking
	
	local liveRender = LUI.UIImage.new()
	liveRender:setLeftRight( false, true, -1132, 0 )
	liveRender:setTopBottom( true, false, 93, 659 )
	liveRender:setRGB( 1, 1, 1 )
	liveRender:setMaterial( LUI.UIImage.GetCachedMaterial( "extracam_2" ) )
	liveRender:setShaderVector( 0, 0, 0, 1, 1 )
	liveRender:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( liveRender )
	self.liveRender = liveRender
	
	local button0 = CoD.button.new( self, controller )
	button0:setLeftRight( true, false, 64, 674 )
	button0:setTopBottom( true, false, 215, 245 )
	button0:setRGB( 1, 1, 1 )
	button0.buttoninternal0.Text0:setText( Engine.Localize( "Change Outfit" ) )
	button0:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenOverlay( self, "ChooseOutfit", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( button0 )
	self.button0 = button0
	
	local button1 = CoD.button.new( self, controller )
	button1:setLeftRight( true, false, 64, 674 )
	button1:setTopBottom( true, false, 245, 275 )
	button1:setRGB( 1, 1, 1 )
	button1.buttoninternal0.Text0:setText( Engine.Localize( "Customize Outfit" ) )
	button1:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenOverlay( self, "PersonalizeCharacter", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	button1:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetEdittingHeroFromStats( controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( button1 )
	self.button1 = button1
	
	local button2 = CoD.button.new( self, controller )
	button2:setLeftRight( true, false, 64, 674 )
	button2:setTopBottom( true, false, 275, 305 )
	button2:setRGB( 1, 1, 1 )
	button2.buttoninternal0.Text0:setText( Engine.Localize( "Change Character" ) )
	button2:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenOverlay( self, "ChooseGender", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( button2 )
	self.button2 = button2
	
	button0.navigation = {
		down = button1
	}
	button1.navigation = {
		up = button0,
		down = button2
	}
	button2.navigation = {
		up = button1
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		if IsInGame() then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
			return true
		else
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
			return true
		end
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsInGame() then
			SendOwnMenuResponse( self, controller, "opened" )
			SendClientScriptNotify( controller, "updateHero", "refresh" )
			LockInput( self, controller, true )
		else
			SendOwnMenuResponse( self, controller, "opened" )
			SendClientScriptNotify( controller, "updateHero", "refresh" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			if IsInGame() then
				SendOwnMenuResponse( self, controller, "closed" )
				Close( self, controller )
				LockInput( self, controller, false )
			else
				SendOwnMenuResponse( self, controller, "closed" )
				GoBack( self, controller )
			end
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	button0.id = "button0"
	button1.id = "button1"
	button2.id = "button2"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.button0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.GenericMenuFrame0:close()
		self.button0:close()
		self.button1:close()
		self.button2:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

