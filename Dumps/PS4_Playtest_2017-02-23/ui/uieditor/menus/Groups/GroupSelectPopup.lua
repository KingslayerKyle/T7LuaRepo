require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.Groups.GroupSelectListItemRow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbarNew" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_alertStatusBar" )

LUI.createMenu.GroupSelectPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GroupSelectPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupSelectPopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 0, 0, 1920 )
	background:setTopBottom( 0, 0, 3, 1080 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( 0, 1, 0, 0 )
	darkbg:setTopBottom( 0, 1, -30, 0 )
	darkbg:setRGB( 0.17, 0.16, 0.16 )
	darkbg:setAlpha( 0.95 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local topBar = LUI.UIImage.new()
	topBar:setLeftRight( 0, 1, 0, 0 )
	topBar:setTopBottom( 0, 0, 201, 865 )
	topBar:setRGB( 0, 0, 0 )
	self:addElement( topBar )
	self.topBar = topBar
	
	local Smokebkg = LUI.UIImage.new()
	Smokebkg:setLeftRight( 0.5, 0.5, -960, 960 )
	Smokebkg:setTopBottom( 0, 0, 201, 806 )
	Smokebkg:setRGB( 0.63, 0.61, 0.61 )
	Smokebkg:setAlpha( 0.75 )
	Smokebkg:setImage( RegisterImage( "uie_t7_icon_master_overlays_bkg" ) )
	self:addElement( Smokebkg )
	self.Smokebkg = Smokebkg
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( 0, 1, 4, 0 )
	scorestreakVignetteContainer:setTopBottom( 0, 1, 0, 0 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 200, -274 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local ButtonList = LUI.UIList.new( self, controller, 10, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0, 0, 183, 717 )
	ButtonList:setTopBottom( 0, 0, 377, 767 )
	ButtonList:setWidgetType( CoD.GroupSelectListItemRow )
	ButtonList:setVerticalCount( 5 )
	ButtonList:setSpacing( 10 )
	ButtonList:setVerticalScrollbar( CoD.verticalScrollbarNew )
	ButtonList:setDataSource( "GroupsInviteButtonList" )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( 0, 0, 183, 483 )
	Title:setTopBottom( 0, 0, 242, 293 )
	Title:setText( Engine.Localize( "GROUPS_CHOOSE_GROUP_CAPS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 0, 0, 183, 1521 )
	TextBox0:setTopBottom( 0, 0, 298, 328 )
	TextBox0:setText( Engine.Localize( "GROUPS_CHOOSE_GROUP_MESSAGE" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local alertStatusBar = CoD.systemOverlay_alertStatusBar.new( self, controller )
	alertStatusBar:setLeftRight( 0, 1, 0, 0 )
	alertStatusBar:setTopBottom( 0, 0, 193, 199 )
	alertStatusBar:linkToElementModel( self, nil, false, function ( model )
		alertStatusBar:setModel( model, controller )
	end )
	self:addElement( alertStatusBar )
	self.alertStatusBar = alertStatusBar
	
	local CategoryListLineTopBottom0 = LUI.UIImage.new()
	CategoryListLineTopBottom0:setLeftRight( 0, 1, 0, 0 )
	CategoryListLineTopBottom0:setTopBottom( 0, 0, 801, 811 )
	CategoryListLineTopBottom0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineTopBottom0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineTopBottom0 )
	self.CategoryListLineTopBottom0 = CategoryListLineTopBottom0
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	buttons:setLeftRight( 0, 0, 154, 802 )
	buttons:setTopBottom( 1, 1, -268, -220 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 0, 78 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 84, 741 )
	FEMenuLeftGraphics:setScale( 0.7 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics0:setLeftRight( 0, 0, 1842, 1920 )
	FEMenuLeftGraphics0:setTopBottom( 0, 0, 83, 740 )
	FEMenuLeftGraphics0:setYRot( 180 )
	FEMenuLeftGraphics0:setScale( 0.7 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	ButtonList.id = "ButtonList"
	buttons:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.scorestreakVignetteContainer:close()
		self.ButtonList:close()
		self.alertStatusBar:close()
		self.buttons:close()
		self.FEMenuLeftGraphics:close()
		self.FEMenuLeftGraphics0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupSelectPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

