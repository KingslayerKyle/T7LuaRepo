require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WildcardItemButton" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_TitlePopup" )

local GetEquippedBonusCardLoudoutSlot = function ( self, controller, itemIndex )
	for index = 1, CoD.CACUtility.maxBonusCards, 1 do
		local slotName = "bonuscard" .. index
		local model = self:getModel( controller, slotName .. ".itemIndex" )
		if model then
			local modelValue = Engine.GetModelValue( model )
			if itemIndex and modelValue == itemIndex then
				return slotName
			end
		end
	end
end

local PreLoadFunc = function ( self, controller )
	CoD.GenericCACSelectionPreLoadFunc( self, controller, "bonuscard", CoD.perController[controller].weaponCategory )
end

local PostLoadFunc = function ( self, controller )
	self.getEquippedLoadoutSlot = GetEquippedBonusCardLoudoutSlot
	if IsCACContextualWildcardOpen( controller ) then
		self.selectionList.m_disableNavigation = true
	end
end

LUI.createMenu.WildcardSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WildcardSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Wildcard"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background:setRGB( 1, 1, 1 )
	self:addElement( background )
	self.background = background
	
	local selectionList = LUI.UIList.new( self, controller, 10, 0, function ( model )
		return Engine.GetModelValue( Engine.GetModel( model, "group" ) ) == "bonuscard"
	end, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( false, false, -454, 448 )
	selectionList:setTopBottom( true, false, 246.25, 388.25 )
	selectionList:setRGB( 1, 1, 1 )
	selectionList:setDataSource( "Unlockables" )
	selectionList:setWidgetType( CoD.WildcardItemButton )
	selectionList:setHorizontalCount( 8 )
	selectionList:setSpacing( 10 )
	selectionList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsCACItemLocked( self, element, controller ) then
			SetClassItem( self, element, controller )
		end
		return retVal
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( self, controller )
	StartMenuTitlePopup:setLeftRight( true, false, -51, 527 )
	StartMenuTitlePopup:setTopBottom( true, false, 112, 258 )
	StartMenuTitlePopup:setRGB( 1, 1, 1 )
	StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "MENU_WILDCARDS_CAPS" ) )
	self:addElement( StartMenuTitlePopup )
	self.StartMenuTitlePopup = StartMenuTitlePopup
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 1093, 1129 )
	Image5:setTopBottom( false, false, -114, -110.5 )
	Image5:setRGB( 1, 1, 1 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 1093, 1129 )
	Image0:setTopBottom( false, false, 24.25, 27.75 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 147, 183 )
	Image1:setTopBottom( false, false, -114.75, -111.25 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 57, 93 )
	Image3:setTopBottom( false, false, 136.56, 140.06 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 57, 93 )
	Image4:setTopBottom( false, false, -114.69, -111.19 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 72.5, 77.5 )
	LineSide0:setTopBottom( true, false, 258, 488.38 )
	LineSide0:setRGB( 1, 1, 1 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( true, false, 54, 70 )
	Image40:setTopBottom( true, false, 361.06, 413.06 )
	Image40:setRGB( 1, 1, 1 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 192.83, 200.5 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 147, 183 )
	Image10:setTopBottom( false, false, 22.5, 26 )
	Image10:setRGB( 1, 1, 1 )
	Image10:setZRot( 180 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, 0, 1280 )
	CategoryListLine0:setTopBottom( true, false, 533.83, 541.5 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.25 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 1186, 1222 )
	Image30:setTopBottom( false, false, 137.38, 141.06 )
	Image30:setRGB( 1, 1, 1 )
	Image30:setZRot( 360 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( true, false, 1186, 1222 )
	Image41:setTopBottom( false, false, -113.75, -110.25 )
	Image41:setRGB( 1, 1, 1 )
	Image41:setZRot( 360 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( true, false, 1201.5, 1206.5 )
	LineSide00:setTopBottom( true, false, 259.06, 489.44 )
	LineSide00:setRGB( 1, 1, 1 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local Image400 = LUI.UIImage.new()
	Image400:setLeftRight( true, false, 1209, 1225 )
	Image400:setTopBottom( true, false, 360, 412 )
	Image400:setRGB( 1, 1, 1 )
	Image400:setZoom( -5 )
	Image400:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image400:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image400 )
	self.Image400 = Image400
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( true, false, 0, 1280 )
	CategoryListLine00:setTopBottom( true, false, 580.83, 588.5 )
	CategoryListLine00:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine00:setAlpha( 0.25 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	local CategoryListLine01 = LUI.UIImage.new()
	CategoryListLine01:setLeftRight( true, false, 0, 1280 )
	CategoryListLine01:setTopBottom( true, false, 130.83, 138.5 )
	CategoryListLine01:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine01:setAlpha( 0.25 )
	CategoryListLine01:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine01:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine01 )
	self.CategoryListLine01 = CategoryListLine01
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
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
			PlaySoundSetSound( self, "menu_no_selection" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	selectionList.id = "selectionList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.background:close()
		self.selectionList:close()
		self.StartMenuTitlePopup:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

