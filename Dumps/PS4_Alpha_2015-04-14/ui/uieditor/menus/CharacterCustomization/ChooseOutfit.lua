require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseOutfitButton" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseOutfitInfoArea" )

local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	self.disableDarkenElement = true
end

LUI.createMenu.ChooseOutfit = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseOutfit" )
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
	gridBacking:setAlpha( 0.05 )
	gridBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( gridBacking )
	self.gridBacking = gridBacking
	
	local renderBacking = LUI.UIImage.new()
	renderBacking:setLeftRight( true, false, 464, 1280 )
	renderBacking:setTopBottom( true, false, 93, 659 )
	renderBacking:setRGB( 1, 1, 1 )
	renderBacking:setAlpha( 0.2 )
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
	
	local outfitGrid = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	outfitGrid:makeFocusable()
	outfitGrid:setLeftRight( true, false, 64, 434 )
	outfitGrid:setTopBottom( true, false, 112, 607 )
	outfitGrid:setRGB( 1, 1, 1 )
	outfitGrid:setDataSource( "HeroesList" )
	outfitGrid:setWidgetType( CoD.ChooseOutfitButton )
	outfitGrid:setHorizontalCount( 3 )
	outfitGrid:setVerticalCount( 4 )
	outfitGrid:setSpacing( 5 )
	outfitGrid:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsDisabled( element, controller ) then
			SelectHero( self, element, controller )
			UploadStats( self, controller )
			SendOwnMenuResponse( self, controller, "closed" )
			SendClientScriptNotify( controller, "updateHero", "refresh" )
			SetEdittingHeroFromStats( controller )
			GoBack( self, controller )
		end
		return retVal
	end )
	outfitGrid:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		UpdateEditingHero( element, controller )
		return retVal
	end )
	self:addElement( outfitGrid )
	self.outfitGrid = outfitGrid
	
	local infoArea = CoD.ChooseOutfitInfoArea.new( self, controller )
	infoArea:setLeftRight( true, false, 484, 784 )
	infoArea:setTopBottom( true, false, 112, 262 )
	infoArea:setRGB( 1, 1, 1 )
	self:addElement( infoArea )
	self.infoArea = infoArea
	
	infoArea:linkToElementModel( outfitGrid, nil, false, function ( model )
		infoArea:setModel( model, controller )
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendOwnMenuResponse( self, controller, "opened" )
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
			GoBack( self, controller )
			ClearSavedState( self, controller )
			SendOwnMenuResponse( self, controller, "closed" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	outfitGrid.id = "outfitGrid"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.outfitGrid:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.GenericMenuFrame0:close()
		self.outfitGrid:close()
		self.infoArea:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

