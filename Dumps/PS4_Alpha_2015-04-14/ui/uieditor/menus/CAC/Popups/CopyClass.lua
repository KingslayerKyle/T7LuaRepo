require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.CAC.List1ButtonChooseClass" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )

local PostLoadFunc = function ( self )
	local controller = self:getOwner()
	self:setModel( CoD.perController[controller].classModel )
	local menuModel = self:getModel()
	if menuModel then
		for i = 1, #self.customClassList.layoutItems, 1 do
			local currentItem = self.customClassList.layoutItems[i][1]
			local currentItemModel = currentItem:getModel()
			if currentItem and menuModel == currentItemModel then
				currentItem:setState( "Disabled" )
				break
			end
		end
	end
	self.customClassList:processEvent( {
		name = "gain_focus",
		controller = controller
	} )
end

LUI.createMenu.CopyClass = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CopyClass" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, false, -640, 640 )
	Background:setTopBottom( false, false, -360, 360 )
	Background:setRGB( 1, 1, 1 )
	Background:setAlpha( 0 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version5_backdrop720p" ) )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 1280 )
	Image0:setTopBottom( true, false, 0, 720 )
	Image0:setRGB( 0.31, 0.31, 0.31 )
	Image0:setAlpha( 0.48 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	scorestreakVignetteContainer:setRGB( 1, 1, 1 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local topBorder = LUI.UIImage.new()
	topBorder:setLeftRight( true, true, 0, 0 )
	topBorder:setTopBottom( true, false, 216, 497 )
	topBorder:setRGB( 0, 0, 0 )
	topBorder:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( topBorder )
	self.topBorder = topBorder
	
	local copyTitle = LUI.UITightText.new()
	copyTitle:setLeftRight( true, false, 86.07, 720.07 )
	copyTitle:setTopBottom( true, false, 240.85, 265.85 )
	copyTitle:setRGB( 1, 1, 1 )
	copyTitle:setText( Engine.Localize( "MPUI_COPY_CUSTOM_CLASS_TITLE" ) )
	copyTitle:setTTF( "fonts/default.ttf" )
	self:addElement( copyTitle )
	self.copyTitle = copyTitle
	
	local customClassList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	customClassList:makeFocusable()
	customClassList:setLeftRight( true, false, 86.07, 366.07 )
	customClassList:setTopBottom( true, false, 289.25, 457.25 )
	customClassList:setRGB( 1, 1, 1 )
	customClassList:setDataSource( "ChooseClassList" )
	customClassList:setWidgetType( CoD.List1ButtonChooseClass )
	customClassList:setVerticalCount( 5 )
	customClassList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ClassOptionsCopyLoadout( self, element, controller )
		return retVal
	end )
	customClassList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsCurrentClassSelectedClass( self, element ) then
			SetElementState( self, element, controller, "Disabled" )
			PlayClipOnListItemElement( self, element, controller, "Focus" )
		end
		return retVal
	end )
	self:addElement( customClassList )
	self.customClassList = customClassList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 212, 220 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -1, 1280 )
	CategoryListLine0:setTopBottom( true, false, 493, 501 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 0, 67.87 )
	ElemsSideList:setTopBottom( true, false, 0, 720 )
	ElemsSideList:setRGB( 1, 1, 1 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK_CAPS" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	customClassList.id = "customClassList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.customClassList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.scorestreakVignetteContainer:close()
		self.customClassList:close()
		self.ElemsSideList:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

