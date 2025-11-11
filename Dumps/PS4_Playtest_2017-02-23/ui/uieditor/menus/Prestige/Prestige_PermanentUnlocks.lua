require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.cac_PrimaryWeaponDescription" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameLabel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Prestige.Prestige_ButtonInfopane" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )

local PreLoadFunc = function ( self, controller )
	CoD.CACUtility.UnlockablesTable = nil
end

LUI.createMenu.Prestige_PermanentUnlocks = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Prestige_PermanentUnlocks" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Prestige_PermanentUnlocks.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	StartMenuBackground0:setLeftRight( 0, 1, 0, 0 )
	StartMenuBackground0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setAlpha( 0.65 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	FEButtonPanelShaderContainer0:setLeftRight( 0, 0, -16, 1928 )
	FEButtonPanelShaderContainer0:setTopBottom( 0, 0, 174, 1101 )
	FEButtonPanelShaderContainer0:setAlpha( 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local MenuTitleBackground = LUI.UIImage.new()
	MenuTitleBackground:setLeftRight( 0, 1, 0, 0 )
	MenuTitleBackground:setTopBottom( 0.5, 0.5, -504, -414 )
	MenuTitleBackground:setRGB( 0.12, 0.13, 0.19 )
	MenuTitleBackground:setAlpha( 0 )
	self:addElement( MenuTitleBackground )
	self.MenuTitleBackground = MenuTitleBackground
	
	local TitleText = LUI.UIText.new()
	TitleText:setLeftRight( 0, 0, 96, 1920 )
	TitleText:setTopBottom( 0, 0, 47, 113 )
	TitleText:setAlpha( 0 )
	TitleText:setText( Engine.Localize( "Menu" ) )
	TitleText:setTTF( "fonts/escom.ttf" )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local ButtonBarBackground = LUI.UIImage.new()
	ButtonBarBackground:setLeftRight( 0, 1, -6, 0 )
	ButtonBarBackground:setTopBottom( 0.5, 0.5, 453, 498 )
	ButtonBarBackground:setRGB( 0.12, 0.13, 0.19 )
	ButtonBarBackground:setAlpha( 0 )
	self:addElement( ButtonBarBackground )
	self.ButtonBarBackground = ButtonBarBackground
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_PERMANENT_UNLOCKS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PERMANENT_UNLOCKS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( 1, 1, -652, -138 )
	SelfIdentityBadge:setTopBottom( 0, 0, 36, 126 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 27, 105 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 136, 1062 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local ContentCategoryList = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	ContentCategoryList:makeFocusable()
	ContentCategoryList:setLeftRight( 0, 0, 232, 548 )
	ContentCategoryList:setTopBottom( 0, 0, 106, 736 )
	ContentCategoryList:setWidgetType( CoD.FE_List1ButtonLarge_PH )
	ContentCategoryList:setVerticalCount( 9 )
	ContentCategoryList:setSpacing( 0 )
	ContentCategoryList:setDataSource( "PermanentUnlockCategoryList" )
	ContentCategoryList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ContentCategoryList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( ContentCategoryList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( ContentCategoryList )
	self.ContentCategoryList = ContentCategoryList
	
	local CategoryDescTextBox = CoD.cac_PrimaryWeaponDescription.new( self, controller )
	CategoryDescTextBox:setLeftRight( 0, 0, 177, 725 )
	CategoryDescTextBox:setTopBottom( 0, 0, 674.5, 707.5 )
	self:addElement( CategoryDescTextBox )
	self.CategoryDescTextBox = CategoryDescTextBox
	
	local CategoryTitle = CoD.InfoPaneItemNameLabel.new( self, controller )
	CategoryTitle:setLeftRight( 0, 0, 670, 1082 )
	CategoryTitle:setTopBottom( 0, 0, 701, 752 )
	CategoryTitle:setAlpha( 0 )
	self:addElement( CategoryTitle )
	self.CategoryTitle = CategoryTitle
	
	local CategoryImage = LUI.UIImage.new()
	CategoryImage:setLeftRight( 0, 0, 1018, 1402 )
	CategoryImage:setTopBottom( 0, 0, 229, 613 )
	CategoryImage:setAlpha( 0 )
	self:addElement( CategoryImage )
	self.CategoryImage = CategoryImage
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( 0, 0, 853, 1546 )
	BoxButtonLrgIdle:setTopBottom( 0, 0, 198, 637 )
	BoxButtonLrgIdle:setAlpha( 0.3 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( 0, 1, 860, -384 )
	Border:setTopBottom( 0, 1, 203, -449 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0, 0, 0, 0 )
	Border:setupNineSliceShader( 6, 6 )
	self:addElement( Border )
	self.Border = Border
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( 0, 0, 148, 160 )
	Arrow:setTopBottom( 0, 0, 684, 696 )
	Arrow:setZoom( 10 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 0, 177, 678 )
	Image:setTopBottom( 0, 0, 670, 672 )
	Image:setAlpha( 0.25 )
	self:addElement( Image )
	self.Image = Image
	
	local InfopaneBottom = CoD.Prestige_ButtonInfopane.new( self, controller )
	InfopaneBottom:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	InfopaneBottom:setLeftRight( 0, 0, 862, 1376 )
	InfopaneBottom:setTopBottom( 0, 0, 665, 941 )
	InfopaneBottom.Body:setText( Engine.Localize( "MENU_PRESTIGE_INFOPANE_PERMANENT_UNLOCKS" ) )
	InfopaneBottom.Title:setText( Engine.Localize( "MENU_PERMANENT_UNLOCKS_CAPS" ) )
	self:addElement( InfopaneBottom )
	self.InfopaneBottom = InfopaneBottom
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( self, controller )
	PermanentUnlockTokensWidget:setLeftRight( 1, 1, -1740, -1318 )
	PermanentUnlockTokensWidget:setTopBottom( 0, 0, 786, 854 )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 1008, 1392 )
	Image1:setTopBottom( 0, 0, 215, 599 )
	Image1:setScale( 0.9 )
	Image1:setImage( RegisterImage( "t7_icons_prestige_mp_permanentunlock" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	CategoryDescTextBox:linkToElementModel( ContentCategoryList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CategoryDescTextBox.weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	CategoryTitle:linkToElementModel( ContentCategoryList, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CategoryTitle.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	CategoryImage:linkToElementModel( ContentCategoryList, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CategoryImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	SelfIdentityBadge.navigation = {
		left = ContentCategoryList
	}
	ContentCategoryList.navigation = {
		right = SelfIdentityBadge
	}
	self.resetProperties = function ()
		InfopaneBottom:completeAnimation()
		ContentCategoryList:completeAnimation()
		PermanentUnlockTokensWidget:completeAnimation()
		Image:completeAnimation()
		Arrow:completeAnimation()
		CategoryDescTextBox:completeAnimation()
		InfopaneBottom.Body:setText( Engine.Localize( "MENU_PRESTIGE_INFOPANE_PERMANENT_UNLOCKS" ) )
		ContentCategoryList:setLeftRight( 0, 0, 232, 548 )
		ContentCategoryList:setTopBottom( 0, 0, 106, 736 )
		PermanentUnlockTokensWidget:setLeftRight( 1, 1, -1740, -1318 )
		PermanentUnlockTokensWidget:setTopBottom( 0, 0, 786, 854 )
		Image:setLeftRight( 0, 0, 177, 678 )
		Image:setTopBottom( 0, 0, 670, 672 )
		Arrow:setLeftRight( 0, 0, 148, 160 )
		Arrow:setTopBottom( 0, 0, 684, 696 )
		CategoryDescTextBox:setLeftRight( 0, 0, 177, 725 )
		CategoryDescTextBox:setTopBottom( 0, 0, 674.5, 707.5 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		DefaultStateZM = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				ContentCategoryList:completeAnimation()
				self.ContentCategoryList:setLeftRight( 0, 0, 180, 600 )
				self.ContentCategoryList:setTopBottom( 0, 0, 205.5, 298.5 )
				self.clipFinished( ContentCategoryList, {} )
				CategoryDescTextBox:completeAnimation()
				self.CategoryDescTextBox:setLeftRight( 0, 0, 180, 728 )
				self.CategoryDescTextBox:setTopBottom( 0, 0, 341.5, 374.5 )
				self.clipFinished( CategoryDescTextBox, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( 0, 0, 150, 162 )
				self.Arrow:setTopBottom( 0, 0, 351, 363 )
				self.clipFinished( Arrow, {} )
				Image:completeAnimation()
				self.Image:setLeftRight( 0, 0, 179, 680 )
				self.Image:setTopBottom( 0, 0, 337, 339 )
				self.clipFinished( Image, {} )
				InfopaneBottom:completeAnimation()
				InfopaneBottom.Body:completeAnimation()
				self.InfopaneBottom.Body:setText( Engine.Localize( "MENU_ZM_PRESTIGE_INFOPANE_PERMANENT_UNLOCKS" ) )
				self.clipFinished( InfopaneBottom, {} )
				PermanentUnlockTokensWidget:completeAnimation()
				self.PermanentUnlockTokensWidget:setLeftRight( 1, 1, -1737, -1315 )
				self.PermanentUnlockTokensWidget:setTopBottom( 0, 0, 454, 522 )
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsZombiesCombatRecordMode() then
			SendCustomClientScriptMenuChangeNotify( controller, "WeaponBuildKits", true )
		else
			SendClientScriptMenuChangeNotify( controller, self, true )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		if IsZombiesCombatRecordMode() then
			SendCustomClientScriptMenuChangeNotify( controller, "WeaponBuildKits", false )
			ClosePermanentUnlockMenu( self, controller, menu )
			return true
		else
			SendClientScriptMenuChangeNotify( controller, menu, false )
			ClosePermanentUnlockMenu( self, controller, menu )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	SelfIdentityBadge.id = "SelfIdentityBadge"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.FEButtonPanelShaderContainer0:close()
		self.MenuFrame:close()
		self.SelfIdentityBadge:close()
		self.FEMenuLeftGraphics:close()
		self.ContentCategoryList:close()
		self.CategoryDescTextBox:close()
		self.CategoryTitle:close()
		self.InfopaneBottom:close()
		self.PermanentUnlockTokensWidget:close()
		self.CategoryImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Prestige_PermanentUnlocks.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

