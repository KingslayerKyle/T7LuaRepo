require( "ui.uieditor.menus.Social.Social_Main" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics2" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_GameOptions" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Community" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Party" )

LUI.createMenu.StartMenu_Main = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Main" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 0, 0 )
	StartMenuBackground0:setRGB( 1, 1, 1 )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, false, -11, 1285 )
	FEButtonPanelShaderContainer0:setTopBottom( true, false, 115.91, 733.91 )
	FEButtonPanelShaderContainer0:setRGB( 1, 1, 1 )
	FEButtonPanelShaderContainer0:setAlpha( 0 )
	FEButtonPanelShaderContainer0.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	TitleBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0:setRGB( 1, 1, 1 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	CategoryListPanel:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local StartMenulineGraphics0 = CoD.StartMenu_lineGraphics.new( self, controller )
	StartMenulineGraphics0:setLeftRight( true, false, 2, 70 )
	StartMenulineGraphics0:setTopBottom( true, false, -13, 657 )
	StartMenulineGraphics0:setRGB( 1, 1, 1 )
	self:addElement( StartMenulineGraphics0 )
	self.StartMenulineGraphics0 = StartMenulineGraphics0
	
	local MenuTitleBackground = LUI.UIImage.new()
	MenuTitleBackground:setLeftRight( true, true, 0, 0 )
	MenuTitleBackground:setTopBottom( false, false, -336, -276 )
	MenuTitleBackground:setRGB( 0.12, 0.13, 0.19 )
	MenuTitleBackground:setAlpha( 0 )
	MenuTitleBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( MenuTitleBackground )
	self.MenuTitleBackground = MenuTitleBackground
	
	local TitleText = LUI.UIText.new()
	TitleText:setLeftRight( true, false, 64, 1280 )
	TitleText:setTopBottom( true, false, 31, 75 )
	TitleText:setRGB( 1, 1, 1 )
	TitleText:setAlpha( 0 )
	TitleText:setText( Engine.Localize( "Menu" ) )
	TitleText:setTTF( "fonts/escom.ttf" )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local ButtonBarBackground = LUI.UIImage.new()
	ButtonBarBackground:setLeftRight( true, true, -3.63, 0 )
	ButtonBarBackground:setTopBottom( false, false, 302, 332 )
	ButtonBarBackground:setRGB( 0.12, 0.13, 0.19 )
	ButtonBarBackground:setAlpha( 0 )
	ButtonBarBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ButtonBarBackground )
	self.ButtonBarBackground = ButtonBarBackground
	
	local TabFrame = LUI.UIFrame.new( self, controller, 0, 0 )
	TabFrame:setLeftRight( false, false, -574, 576 )
	TabFrame:setTopBottom( false, false, -225, 295 )
	TabFrame:setRGB( 1, 1, 1 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	local TabsBackups = CoD.basicTabList.new( self, controller )
	TabsBackups:setLeftRight( true, false, 64, 1216 )
	TabsBackups:setTopBottom( true, false, 95, 135 )
	TabsBackups:setRGB( 1, 1, 1 )
	TabsBackups:setAlpha( 0 )
	TabsBackups.grid:setDataSource( "StartMenuTabs" )
	TabsBackups.grid:setWidgetType( CoD.paintshopTabWidget )
	TabsBackups.grid:setHorizontalCount( 7 )
	self:addElement( TabsBackups )
	self.TabsBackups = TabsBackups
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local StartMenulineGraphics20 = CoD.StartMenu_lineGraphics2.new( self, controller )
	StartMenulineGraphics20:setLeftRight( true, false, 1203, 1267 )
	StartMenulineGraphics20:setTopBottom( true, false, 112, 698.94 )
	StartMenulineGraphics20:setRGB( 1, 1, 1 )
	self:addElement( StartMenulineGraphics20 )
	self.StartMenulineGraphics20 = StartMenulineGraphics20
	
	local Tabs = CoD.basicTabList.new( self, controller )
	Tabs:setLeftRight( true, false, 64, 1216 )
	Tabs:setTopBottom( true, false, 84, 124 )
	Tabs:setRGB( 1, 1, 1 )
	Tabs.grid:setDataSource( "StartMenuTabs" )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	Tabs.grid:setHorizontalCount( 7 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
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
	
	self.buttonPromptAddFunctions.start = function ( menu, element, event )
		menu:addButtonPrompt( "start", Engine.Localize( "MENU_DISMISS_MENU" ), "M", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		if IsPC() then
			menu:addButtonPrompt( "alt2", Engine.Localize( "MENU_OPTIONS_CAPS" ), "O", element )
			return true
		elseif IsInGame() then
			menu:addButtonPrompt( "alt2", Engine.Localize( "MENU_SOCIAL" ), "S", element )
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.start( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.alt2( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			RefreshLobbyRoom( self, controller )
			StartMenuGoBack( self, controller )
		end
		if not self.occludedBy and (event.button == "start" or event.button == "key_shortcut" and event.key == "M") then
			RefreshLobbyRoom( self, controller )
			StartMenuResumeGame( self, controller )
			GoBack( self, controller )
		end
		if not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "ENTER") then
			PlaySoundSetSound( self, "list_action" )
		end
		if not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "O") and IsPC() then
			OpenPopupMenuByNameParam( self, element, controller, "OptionsMenu", self )
		end
		if not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "S") and IsInGame() then
			OpenPopup( self, "Social_Main", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		PlaySoundSetSound( self, "menu_enter" )
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
		self.StartMenuBackground0:close()
		self.FEButtonPanelShaderContainer0:close()
		self.cac3dTitleIntermediary0:close()
		self.StartMenulineGraphics0:close()
		self.TabsBackups:close()
		self.StartMenulineGraphics20:close()
		self.Tabs:close()
		self.TabFrame:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

