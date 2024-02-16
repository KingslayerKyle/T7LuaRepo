-- 214678c0fb4e26be4bbb357530f4603b
-- This hash is used for caching, delete to decompile the file again

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
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( f2_local1, controller )
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
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( f2_local1, controller )
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
	
	local MenuFrame = CoD.GenericMenuFrame.new( f2_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_PERMANENT_UNLOCKS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PERMANENT_UNLOCKS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f2_local1, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 24, 84 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f2_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local ContentCategoryList = LUI.UIList.new( f2_local1, controller, 0, 0, nil, false, false, 0, 0, false, false )
	ContentCategoryList:makeFocusable()
	ContentCategoryList:setLeftRight( true, false, 120, 400 )
	ContentCategoryList:setTopBottom( true, false, 136.91, 424.91 )
	ContentCategoryList:setWidgetType( CoD.FE_List1ButtonLarge_PH )
	ContentCategoryList:setVerticalCount( 9 )
	ContentCategoryList:setSpacing( 0 )
	ContentCategoryList:setDataSource( "PermanentUnlockCategoryList" )
	ContentCategoryList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	ContentCategoryList:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	f2_local1:AddButtonCallbackFunction( ContentCategoryList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		ProcessListAction( self, f8_arg0, f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ContentCategoryList )
	self.ContentCategoryList = ContentCategoryList
	
	local CategoryDescTextBox = CoD.cac_PrimaryWeaponDescription.new( f2_local1, controller )
	CategoryDescTextBox:setLeftRight( true, false, 118, 483 )
	CategoryDescTextBox:setTopBottom( true, false, 449.95, 471.95 )
	self:addElement( CategoryDescTextBox )
	self.CategoryDescTextBox = CategoryDescTextBox
	
	local CategoryTitle = CoD.InfoPaneItemNameLabel.new( f2_local1, controller )
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
	
	local InfopaneBottom = CoD.Prestige_ButtonInfopane.new( f2_local1, controller )
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
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( f2_local1, controller )
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
		f2_local1:updateElementState( self, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "prestigeGameMode"
		} )
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f18_local0 = nil
		if IsZombiesCombatRecordMode() then
			SendCustomClientScriptMenuChangeNotify( controller, "WeaponBuildKits", true )
		else
			SendClientScriptMenuChangeNotify( controller, f2_local1, true )
		end
		if not f18_local0 then
			f18_local0 = element:dispatchEventToChildren( event )
		end
		return f18_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if IsZombiesCombatRecordMode() then
			SendCustomClientScriptMenuChangeNotify( f19_arg2, "WeaponBuildKits", false )
			ClosePermanentUnlockMenu( self, f19_arg2, f19_arg1 )
			return true
		else
			SendClientScriptMenuChangeNotify( f19_arg2, f19_arg1, false )
			ClosePermanentUnlockMenu( self, f19_arg2, f19_arg1 )
			return true
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f2_local1
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

