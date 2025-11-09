require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.Groups.GroupSelectListItemRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_alertStatusBar" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

LUI.createMenu.GroupSelectPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GroupSelectPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupSelectPopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 2, 720 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( true, true, 0, 0 )
	darkbg:setTopBottom( true, true, -20, 0 )
	darkbg:setRGB( 0.17, 0.16, 0.16 )
	darkbg:setAlpha( 0.95 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local topBar = LUI.UIImage.new()
	topBar:setLeftRight( true, true, 0, 0 )
	topBar:setTopBottom( true, false, 134, 577 )
	topBar:setRGB( 0, 0, 0 )
	self:addElement( topBar )
	self.topBar = topBar
	
	local Smokebkg = LUI.UIImage.new()
	Smokebkg:setLeftRight( false, false, -640, 640 )
	Smokebkg:setTopBottom( true, false, 134, 537.17 )
	Smokebkg:setRGB( 0.63, 0.61, 0.61 )
	Smokebkg:setAlpha( 0.75 )
	Smokebkg:setImage( RegisterImage( "uie_t7_icon_master_overlays_bkg" ) )
	self:addElement( Smokebkg )
	self.Smokebkg = Smokebkg
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( true, true, 2, 0 )
	scorestreakVignetteContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 133, -182.83 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local ButtonList = LUI.UIList.new( self, controller, 7, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 122, 478 )
	ButtonList:setTopBottom( true, false, 227, 490 )
	ButtonList:setWidgetType( CoD.GroupSelectListItemRow )
	ButtonList:setVerticalCount( 5 )
	ButtonList:setSpacing( 7 )
	ButtonList:setVerticalCounter( CoD.verticalCounter )
	ButtonList:setDataSource( "GroupsInviteButtonList" )
	ButtonList:linkToElementModel( ButtonList, "inviteSent", true, function ( model )
		local f2_local0 = ButtonList
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "inviteSent"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	self:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "inviteSent" ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueTrue( element, controller, "inviteSent" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 122, 322 )
	Title:setTopBottom( true, false, 151.5, 185.5 )
	Title:setText( Engine.Localize( "GROUPS_CHOOSE_GROUP_CAPS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 122, 1014 )
	TextBox0:setTopBottom( true, false, 188.5, 208.5 )
	TextBox0:setText( Engine.Localize( "GROUPS_CHOOSE_GROUP_MESSAGE" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local alertStatusBar = CoD.systemOverlay_alertStatusBar.new( self, controller )
	alertStatusBar:setLeftRight( true, true, 0, 0 )
	alertStatusBar:setTopBottom( true, false, 129, 133 )
	alertStatusBar:linkToElementModel( self, nil, false, function ( model )
		alertStatusBar:setModel( model, controller )
	end )
	self:addElement( alertStatusBar )
	self.alertStatusBar = alertStatusBar
	
	local CategoryListLineTopBottom0 = LUI.UIImage.new()
	CategoryListLineTopBottom0:setLeftRight( true, true, 0, 0 )
	CategoryListLineTopBottom0:setTopBottom( true, false, 533.83, 540.5 )
	CategoryListLineTopBottom0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineTopBottom0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineTopBottom0 )
	self.CategoryListLineTopBottom0 = CategoryListLineTopBottom0
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	buttons:setLeftRight( true, false, 103, 535 )
	buttons:setTopBottom( false, true, -178.83, -146.83 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 0, 52 )
	FEMenuLeftGraphics:setTopBottom( true, false, 56, 494 )
	FEMenuLeftGraphics:setScale( 0.7 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics0:setLeftRight( true, false, 1228, 1280 )
	FEMenuLeftGraphics0:setTopBottom( true, false, 55, 493 )
	FEMenuLeftGraphics0:setYRot( 180 )
	FEMenuLeftGraphics0:setScale( 0.7 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.scorestreakVignetteContainer:close()
		element.ButtonList:close()
		element.alertStatusBar:close()
		element.buttons:close()
		element.FEMenuLeftGraphics:close()
		element.FEMenuLeftGraphics0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupSelectPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

