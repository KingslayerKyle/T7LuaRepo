require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.CAC.cac_PrimaryWeaponDescription" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameLabel" )
require( "ui.uieditor.widgets.Prestige.Prestige_ButtonInfopane" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )

local PreLoadFunc = function ( self, controller )
	CoD.UnlockablesTable = nil
end

LUI.createMenu.Prestige_PermanentUnlocks = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Prestige_PermanentUnlocks" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Prestige_PermanentUnlocks.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 0, 0 )
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
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setAlpha( 0.65 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, false, -11, 1285 )
	FEButtonPanelShaderContainer0:setTopBottom( true, false, 115.91, 733.91 )
	FEButtonPanelShaderContainer0:setAlpha( 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local MenuTitleBackground = LUI.UIImage.new()
	MenuTitleBackground:setLeftRight( true, true, 0, 0 )
	MenuTitleBackground:setTopBottom( false, false, -336, -276 )
	MenuTitleBackground:setRGB( 0.12, 0.13, 0.19 )
	MenuTitleBackground:setAlpha( 0 )
	self:addElement( MenuTitleBackground )
	self.MenuTitleBackground = MenuTitleBackground
	
	local TitleText = LUI.UIText.new()
	TitleText:setLeftRight( true, false, 64, 1280 )
	TitleText:setTopBottom( true, false, 31, 75 )
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
	self:addElement( ButtonBarBackground )
	self.ButtonBarBackground = ButtonBarBackground
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_PERMANENT_UNLOCKS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PERMANENT_UNLOCKS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 24, 84 )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local ContentCategoryList = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	ContentCategoryList:makeFocusable()
	ContentCategoryList:setLeftRight( true, false, 120, 400 )
	ContentCategoryList:setTopBottom( true, false, 136.91, 424.91 )
	ContentCategoryList:setDataSource( "PermanentUnlockCategoryList" )
	ContentCategoryList:setWidgetType( CoD.FE_List1ButtonLarge_PH )
	ContentCategoryList:setVerticalCount( 9 )
	ContentCategoryList:setSpacing( 0 )
	ContentCategoryList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	ContentCategoryList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	self:AddButtonCallbackFunction( ContentCategoryList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ContentCategoryList )
	self.ContentCategoryList = ContentCategoryList
	
	local CategoryDescTextBox = CoD.cac_PrimaryWeaponDescription.new( self, controller )
	CategoryDescTextBox:setLeftRight( true, false, 118, 483 )
	CategoryDescTextBox:setTopBottom( true, false, 449.95, 471.95 )
	self:addElement( CategoryDescTextBox )
	self.CategoryDescTextBox = CategoryDescTextBox
	
	local CategoryTitle = CoD.InfoPaneItemNameLabel.new( self, controller )
	CategoryTitle:setLeftRight( true, false, 446.75, 721.75 )
	CategoryTitle:setTopBottom( true, false, 467.5, 501.5 )
	CategoryTitle:setAlpha( 0 )
	self:addElement( CategoryTitle )
	self.CategoryTitle = CategoryTitle
	
	local CategoryImage = LUI.UIImage.new()
	CategoryImage:setLeftRight( true, false, 678.38, 934.38 )
	CategoryImage:setTopBottom( true, false, 152.5, 408.5 )
	CategoryImage:setAlpha( 0 )
	self:addElement( CategoryImage )
	self.CategoryImage = CategoryImage
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( true, false, 568.5, 1030.25 )
	BoxButtonLrgIdle:setTopBottom( true, false, 132, 424.91 )
	BoxButtonLrgIdle:setAlpha( 0.3 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( true, true, 573.75, -255.75 )
	Border:setTopBottom( true, true, 135, -299.09 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0.01, 0.01, 0, 0 )
	Border:setupNineSliceShader( 4, 4 )
	self:addElement( Border )
	self.Border = Border
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, 99, 107 )
	Arrow:setTopBottom( true, false, 456, 464 )
	Arrow:setZoom( 10 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 118, 452 )
	Image:setTopBottom( true, false, 447.02, 448.02 )
	Image:setAlpha( 0.25 )
	self:addElement( Image )
	self.Image = Image
	
	local InfopaneBottom = CoD.Prestige_ButtonInfopane.new( self, controller )
	InfopaneBottom:setLeftRight( true, false, 574.75, 917.75 )
	InfopaneBottom:setTopBottom( true, false, 443.5, 627.5 )
	InfopaneBottom.Body:setText( Engine.Localize( "MENU_PRESTIGE_INFOPANE_PERMANENT_UNLOCKS" ) )
	InfopaneBottom.Title:setText( Engine.Localize( "MENU_PERMANENT_UNLOCKS_CAPS" ) )
	InfopaneBottom:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( InfopaneBottom )
	self.InfopaneBottom = InfopaneBottom
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( self, controller )
	PermanentUnlockTokensWidget:setLeftRight( false, true, -1160, -879 )
	PermanentUnlockTokensWidget:setTopBottom( true, false, 524.5, 569.5 )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 672, 928 )
	Image1:setTopBottom( true, false, 143.63, 399.63 )
	Image1:setScale( 0.9 )
	Image1:setImage( RegisterImage( "uie_t7_icons_prestige_mp_permanentunlock" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	CategoryDescTextBox:linkToElementModel( ContentCategoryList, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			CategoryDescTextBox.weaponDescTextBox:setText( Engine.Localize( description ) )
		end
	end )
	CategoryTitle:linkToElementModel( ContentCategoryList, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			CategoryTitle.itemName:setText( Engine.Localize( displayText ) )
		end
	end )
	CategoryImage:linkToElementModel( ContentCategoryList, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			CategoryImage:setImage( RegisterImage( image ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		DefaultStateZM = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ContentCategoryList:completeAnimation()
				self.ContentCategoryList:setLeftRight( true, false, 120, 400 )
				self.ContentCategoryList:setTopBottom( true, false, 136.91, 198.91 )
				self.clipFinished( ContentCategoryList, {} )
				CategoryDescTextBox:completeAnimation()
				self.CategoryDescTextBox:setLeftRight( true, false, 120, 485 )
				self.CategoryDescTextBox:setTopBottom( true, false, 227.95, 249.95 )
				self.clipFinished( CategoryDescTextBox, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 100, 108 )
				self.Arrow:setTopBottom( true, false, 234, 242 )
				self.clipFinished( Arrow, {} )
				Image:completeAnimation()
				self.Image:setLeftRight( true, false, 119, 453 )
				self.Image:setTopBottom( true, false, 225.02, 226.02 )
				self.clipFinished( Image, {} )
				InfopaneBottom:completeAnimation()
				InfopaneBottom.Body:completeAnimation()
				self.InfopaneBottom.Body:setText( Engine.Localize( "MENU_ZM_PRESTIGE_INFOPANE_PERMANENT_UNLOCKS" ) )
				self.clipFinished( InfopaneBottom, {} )
				PermanentUnlockTokensWidget:completeAnimation()
				self.PermanentUnlockTokensWidget:setLeftRight( false, true, -1158, -877 )
				self.PermanentUnlockTokensWidget:setTopBottom( true, false, 302.5, 347.5 )
				self.clipFinished( PermanentUnlockTokensWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DefaultStateZM",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualToEnum( element, controller, "prestigeGameMode", Enum.eModes.MODE_ZOMBIES )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "prestigeGameMode" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "prestigeGameMode"
		} )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f16_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		if not f16_local0 then
			f16_local0 = self:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		ClosePermanentUnlockMenu( self, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	ContentCategoryList.id = "ContentCategoryList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ContentCategoryList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.FEButtonPanelShaderContainer0:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.FEMenuLeftGraphics:close()
		element.ContentCategoryList:close()
		element.CategoryDescTextBox:close()
		element.CategoryTitle:close()
		element.InfopaneBottom:close()
		element.PermanentUnlockTokensWidget:close()
		element.CategoryImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Prestige_PermanentUnlocks.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

