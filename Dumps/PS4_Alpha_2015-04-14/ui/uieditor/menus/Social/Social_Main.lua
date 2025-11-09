require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.Social.Social_Friends" )
require( "ui.uieditor.widgets.Social.Social_Party" )
require( "ui.uieditor.widgets.Social.Social_Groups" )
require( "ui.uieditor.widgets.Social.Social_RecentPlayers" )

LUI.createMenu.Social_Main = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Social_Main" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local TabFrame = LUI.UIFrame.new( self, controller, 0, 0 )
	TabFrame:setLeftRight( false, false, -574, 576 )
	TabFrame:setTopBottom( false, false, -225, 295 )
	TabFrame:setRGB( 1, 1, 1 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	CategoryListPanel:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local ButtonBarBackground0 = LUI.UIImage.new()
	ButtonBarBackground0:setLeftRight( true, true, -3.63, 0 )
	ButtonBarBackground0:setTopBottom( false, false, 302, 332 )
	ButtonBarBackground0:setRGB( 0.12, 0.13, 0.19 )
	ButtonBarBackground0:setAlpha( 0 )
	ButtonBarBackground0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ButtonBarBackground0 )
	self.ButtonBarBackground0 = ButtonBarBackground0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0:setRGB( 1, 1, 1 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SOCIAL_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local Tabs = CoD.basicTabList.new( self, controller )
	Tabs:setLeftRight( true, false, 64, 1216 )
	Tabs:setTopBottom( true, false, 84, 124 )
	Tabs:setRGB( 1, 1, 1 )
	Tabs.grid:setDataSource( "SocialTabs" )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	Tabs:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		SetSocialTab( self, element, controller )
		FetchOnlineFriendsData( self, element, controller )
		PlaySoundSetSound( self, "tab_changed" )
		return retVal
	end )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 33.5, 41.5 )
	LineSide:setTopBottom( true, false, -12, 658 )
	LineSide:setRGB( 1, 1, 1 )
	LineSide:setAlpha( 0.8 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 18.5, 23.5 )
	LineSide0:setTopBottom( true, false, -12, 240 )
	LineSide0:setRGB( 1, 1, 1 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image0000 = LUI.UIImage.new()
	Image0000:setLeftRight( true, false, 36.87, 52.87 )
	Image0000:setTopBottom( true, false, 194, 202 )
	Image0000:setRGB( 1, 1, 1 )
	Image0000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000 )
	self.Image0000 = Image0000
	
	local Image00000 = LUI.UIImage.new()
	Image00000:setLeftRight( true, false, 36.87, 52.87 )
	Image00000:setTopBottom( true, false, 205, 213 )
	Image00000:setRGB( 1, 1, 1 )
	Image00000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000 )
	self.Image00000 = Image00000
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( true, false, 36.87, 72.87 )
	Pixel2:setTopBottom( true, false, 137, 141 )
	Pixel2:setRGB( 1, 1, 1 )
	Pixel2:setYRot( -180 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local Pixel20 = LUI.UIImage.new()
	Pixel20:setLeftRight( true, false, 36.87, 72.87 )
	Pixel20:setTopBottom( true, false, 630, 634 )
	Pixel20:setRGB( 1, 1, 1 )
	Pixel20:setYRot( -180 )
	Pixel20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20 )
	self.Pixel20 = Pixel20
	
	local pixelc = LUI.UIImage.new()
	pixelc:setLeftRight( true, false, 3, 19 )
	pixelc:setTopBottom( true, false, 143, 195 )
	pixelc:setRGB( 1, 1, 1 )
	pixelc:setZoom( -5 )
	pixelc:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc )
	self.pixelc = pixelc
	
	local pixelc0 = LUI.UIImage.new()
	pixelc0:setLeftRight( true, false, 3, 19 )
	pixelc0:setTopBottom( true, false, 143, 195 )
	pixelc0:setRGB( 1, 1, 1 )
	pixelc0:setZoom( -5 )
	pixelc0:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc0 )
	self.pixelc0 = pixelc0
	
	local pixelc1 = LUI.UIImage.new()
	pixelc1:setLeftRight( true, false, 3, 19 )
	pixelc1:setTopBottom( true, false, 286, 338 )
	pixelc1:setRGB( 1, 1, 1 )
	pixelc1:setZoom( -5 )
	pixelc1:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc1 )
	self.pixelc1 = pixelc1
	
	local pixelc00 = LUI.UIImage.new()
	pixelc00:setLeftRight( true, false, 3, 19 )
	pixelc00:setTopBottom( true, false, 286, 338 )
	pixelc00:setRGB( 1, 1, 1 )
	pixelc00:setZoom( -5 )
	pixelc00:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc00 )
	self.pixelc00 = pixelc00
	
	local pixelc10 = LUI.UIImage.new()
	pixelc10:setLeftRight( true, false, 3, 19 )
	pixelc10:setTopBottom( true, false, 427, 479 )
	pixelc10:setRGB( 1, 1, 1 )
	pixelc10:setZoom( -5 )
	pixelc10:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc10 )
	self.pixelc10 = pixelc10
	
	local pixelc000 = LUI.UIImage.new()
	pixelc000:setLeftRight( true, false, 3, 19 )
	pixelc000:setTopBottom( true, false, 427, 479 )
	pixelc000:setRGB( 1, 1, 1 )
	pixelc000:setZoom( -5 )
	pixelc000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc000 )
	self.pixelc000 = pixelc000
	
	local pixelc100 = LUI.UIImage.new()
	pixelc100:setLeftRight( true, false, 3, 19 )
	pixelc100:setTopBottom( true, false, 571, 623 )
	pixelc100:setRGB( 1, 1, 1 )
	pixelc100:setZoom( -5 )
	pixelc100:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc100 )
	self.pixelc100 = pixelc100
	
	local pixelc0000 = LUI.UIImage.new()
	pixelc0000:setLeftRight( true, false, 3, 19 )
	pixelc0000:setTopBottom( true, false, 571, 623 )
	pixelc0000:setRGB( 1, 1, 1 )
	pixelc0000:setZoom( -5 )
	pixelc0000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc0000 )
	self.pixelc0000 = pixelc0000
	
	local Image00001 = LUI.UIImage.new()
	Image00001:setLeftRight( true, false, 36.87, 52.87 )
	Image00001:setTopBottom( true, false, 267, 275 )
	Image00001:setRGB( 1, 1, 1 )
	Image00001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00001 )
	self.Image00001 = Image00001
	
	local Image000000 = LUI.UIImage.new()
	Image000000:setLeftRight( true, false, 36.87, 52.87 )
	Image000000:setTopBottom( true, false, 278, 286 )
	Image000000:setRGB( 1, 1, 1 )
	Image000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000000 )
	self.Image000000 = Image000000
	
	local Image000010 = LUI.UIImage.new()
	Image000010:setLeftRight( true, false, 36.87, 52.87 )
	Image000010:setTopBottom( true, false, 339, 347 )
	Image000010:setRGB( 1, 1, 1 )
	Image000010:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000010 )
	self.Image000010 = Image000010
	
	local Image0000000 = LUI.UIImage.new()
	Image0000000:setLeftRight( true, false, 36.87, 52.87 )
	Image0000000:setTopBottom( true, false, 350, 358 )
	Image0000000:setRGB( 1, 1, 1 )
	Image0000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000000 )
	self.Image0000000 = Image0000000
	
	local Image0000100 = LUI.UIImage.new()
	Image0000100:setLeftRight( true, false, 36.87, 52.87 )
	Image0000100:setTopBottom( true, false, 411, 419 )
	Image0000100:setRGB( 1, 1, 1 )
	Image0000100:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000100 )
	self.Image0000100 = Image0000100
	
	local Image00000000 = LUI.UIImage.new()
	Image00000000:setLeftRight( true, false, 36.87, 52.87 )
	Image00000000:setTopBottom( true, false, 422, 430 )
	Image00000000:setRGB( 1, 1, 1 )
	Image00000000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00000000 )
	self.Image00000000 = Image00000000
	
	local Image00002 = LUI.UIImage.new()
	Image00002:setLeftRight( true, false, 36.87, 52.87 )
	Image00002:setTopBottom( true, false, 482.94, 490.94 )
	Image00002:setRGB( 1, 1, 1 )
	Image00002:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00002:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00002 )
	self.Image00002 = Image00002
	
	local Image000001 = LUI.UIImage.new()
	Image000001:setLeftRight( true, false, 36.87, 52.87 )
	Image000001:setTopBottom( true, false, 493.94, 501.94 )
	Image000001:setRGB( 1, 1, 1 )
	Image000001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000001 )
	self.Image000001 = Image000001
	
	local Image000011 = LUI.UIImage.new()
	Image000011:setLeftRight( true, false, 36.87, 52.87 )
	Image000011:setTopBottom( true, false, 554.94, 562.94 )
	Image000011:setRGB( 1, 1, 1 )
	Image000011:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000011:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000011 )
	self.Image000011 = Image000011
	
	local Image0000001 = LUI.UIImage.new()
	Image0000001:setLeftRight( true, false, 36.87, 52.87 )
	Image0000001:setTopBottom( true, false, 565.94, 573.94 )
	Image0000001:setRGB( 1, 1, 1 )
	Image0000001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000001 )
	self.Image0000001 = Image0000001
	
	local Image00003 = LUI.UIImage.new()
	Image00003:setLeftRight( true, false, 1211, 1227 )
	Image00003:setTopBottom( true, false, 416, 422.53 )
	Image00003:setRGB( 1, 1, 1 )
	Image00003:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00003:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00003 )
	self.Image00003 = Image00003
	
	local Pixel21 = LUI.UIImage.new()
	Pixel21:setLeftRight( true, false, 1211, 1247 )
	Pixel21:setTopBottom( true, false, 136.47, 139 )
	Pixel21:setRGB( 1, 1, 1 )
	Pixel21:setYRot( 360 )
	Pixel21:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel21:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel21 )
	self.Pixel21 = Pixel21
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( true, false, 1212.63, 1248.63 )
	Pixel200:setTopBottom( true, false, 643.47, 647.47 )
	Pixel200:setRGB( 1, 1, 1 )
	Pixel200:setYRot( 360 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local Image000012 = LUI.UIImage.new()
	Image000012:setLeftRight( true, false, 1211, 1227 )
	Image000012:setTopBottom( true, false, 266.47, 273 )
	Image000012:setRGB( 1, 1, 1 )
	Image000012:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000012:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000012 )
	self.Image000012 = Image000012
	
	local Image0000002 = LUI.UIImage.new()
	Image0000002:setLeftRight( true, false, 1211, 1227 )
	Image0000002:setTopBottom( true, false, 278.47, 285 )
	Image0000002:setRGB( 1, 1, 1 )
	Image0000002:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000002:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000002 )
	self.Image0000002 = Image0000002
	
	TabFrame:linkToElementModel( Tabs.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TabFrame:changeFrameWidget( modelValue )
		end
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
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
	TabFrame.id = "TabFrame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.TabFrame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.cac3dTitleIntermediary0:close()
		self.Tabs:close()
		self.TabFrame:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

