require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_PrivacySettings_CheckBoxButton" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_PrivacySettingsPageCounter" )

local PreLoadFunc = function ( self, controller )
	DataSources.PrivacySettingManagementForm.getModel( controller )
end

LUI.createMenu.StartMenu_Options_PrivacySettings = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_PrivacySettings" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_PrivacySettings.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, -2, -2 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( false, false, -651, 653 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local PrivacySettingsTitle = LUI.UIText.new()
	PrivacySettingsTitle:setLeftRight( true, false, 115, 638 )
	PrivacySettingsTitle:setTopBottom( true, false, 140, 176 )
	PrivacySettingsTitle:setText( Engine.Localize( "MENU_PRIVACY_SETTINGS" ) )
	PrivacySettingsTitle:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	PrivacySettingsTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PrivacySettingsTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PrivacySettingsTitle )
	self.PrivacySettingsTitle = PrivacySettingsTitle
	
	local PrivacySettingsDesc = LUI.UIText.new()
	PrivacySettingsDesc:setLeftRight( false, false, -525, -21 )
	PrivacySettingsDesc:setTopBottom( true, false, 176, 198 )
	PrivacySettingsDesc:setText( Engine.Localize( "MENU_PRIVACY_SETTINGS_DESC" ) )
	PrivacySettingsDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PrivacySettingsDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PrivacySettingsDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PrivacySettingsDesc )
	self.PrivacySettingsDesc = PrivacySettingsDesc
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( false, false, -525, -21 )
	ButtonList:setTopBottom( true, false, 249.5, 490.5 )
	ButtonList:setWidgetType( CoD.StartMenu_Options_PrivacySettings_CheckBoxButton )
	ButtonList:setVerticalCount( 9 )
	ButtonList:setDataSource( "PrivacySettingOptionList" )
	ButtonList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		OnPrivacySettingItemFocusChange( controller, element, self )
		return f3_local0
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	self:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local DescriptionText = LUI.UIText.new()
	DescriptionText:setLeftRight( false, false, 24, 566 )
	DescriptionText:setTopBottom( true, false, 144, 166 )
	DescriptionText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	DescriptionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DescriptionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	DescriptionText:subscribeToGlobalModel( controller, "PrivacySettingManagementForm", "descText", function ( model )
		local descText = Engine.GetModelValue( model )
		if descText then
			DescriptionText:setText( Engine.Localize( descText ) )
		end
	end )
	self:addElement( DescriptionText )
	self.DescriptionText = DescriptionText
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, true, -11, 13 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local CategoryListLineVertical = LUI.UIImage.new()
	CategoryListLineVertical:setLeftRight( true, false, 381, 917 )
	CategoryListLineVertical:setTopBottom( true, false, 382, 390 )
	CategoryListLineVertical:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLineVertical:setZRot( 90 )
	CategoryListLineVertical:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLineVertical )
	self.CategoryListLineVertical = CategoryListLineVertical
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( LocalizeToUpperString( "MENU_PRIVACY_SETTINGS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeToUpperString( "MENU_PRIVACY_SETTINGS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics0:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics0:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	local PageCounter = CoD.StartMenu_Options_PrivacySettingsPageCounter.new( self, controller )
	PageCounter:setLeftRight( false, true, -385, -305 )
	PageCounter:setTopBottom( false, true, -169.5, -151.5 )
	self:addElement( PageCounter )
	self.PageCounter = PageCounter
	
	self:registerEventHandler( "<datasourceChange>PrivacySettingManagementForm.currentPage", function ( self, event )
		CoD.Menu.UpdateButtonShownState( self, self, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	self:registerEventHandler( "<datasourceChange>PrivacySettingManagementForm.lastPage", function ( self, event )
		CoD.Menu.UpdateButtonShownState( self, self, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "PrivacySettingManagementForm.currentPage" ), function ( model )
		local f11_local0 = self
		local f11_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "PrivacySettingManagementForm.currentPage"
		}
		CoD.Menu.UpdateButtonShownState( f11_local0, self, controller, Enum.LUIButton.LUI_KEY_LB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "PrivacySettingManagementForm.lastPage" ), function ( model )
		local f12_local0 = self
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "PrivacySettingManagementForm.lastPage"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, self, controller, Enum.LUIButton.LUI_KEY_LB )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f13_local0 = nil
		ShowHeaderIconOnly( self )
		if not f13_local0 then
			f13_local0 = self:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		if not IsOnLastPrivacySettingsDescPage( controller ) then
			ChangePrivacySettingDescPage( controller, menu, "1" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsOnLastPrivacySettingsDescPage( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "PLATFORM_CHANGE_PAGES" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		if IsModelValueGreaterThan( controller, "PrivacySettingManagementForm.currentPage", 1 ) then
			ChangePrivacySettingDescPage( controller, menu, "-1" )
			return true
		elseif IsModelValueGreaterThan( controller, "PrivacySettingManagementForm.lastPage", 1 ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsModelValueGreaterThan( controller, "PrivacySettingManagementForm.currentPage", 1 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "PLATFORM_CHANGE_PAGES" )
			return true
		elseif IsModelValueGreaterThan( controller, "PrivacySettingManagementForm.lastPage", 1 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "PLATFORM_CHANGE_PAGES" )
			return true
		else
			return false
		end
	end, false )
	ButtonList.id = "ButtonList"
	MenuFrame:setModel( self.buttonModel, controller )
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
		element.ButtonList:close()
		element.MenuFrame:close()
		element.FEMenuLeftGraphics0:close()
		element.PageCounter:close()
		element.DescriptionText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_PrivacySettings.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

