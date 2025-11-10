require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local f0_local0 = function ( f1_arg0 )
	local f1_local0 = "cg_mature"
	local f1_local1 = {
		{
			name = Engine.Localize( "MENU_DISABLED" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_ENABLED" ),
			value = 1
		}
	}
	return {
		models = {
			name = "MENU_GRAPHIC_CONTENT",
			desc = "MENU_GRAPHIC_CONTENT_DESC",
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f1_arg0, "GraphicsOptions_GraphicContent", f1_local1, f1_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f1_arg0, f1_local1, f1_local0 )
		},
		properties = {
			disabled = Dvar.ui_execdemo:get()
		}
	}
end

local f0_local1 = function ( f2_arg0 )
	local f2_local0 = Engine.IsDeviceRestrictingContent
	if f2_local0 then
		f2_local0 = Engine.IsDeviceRestrictingContent( f2_arg0 )
	end
	if f2_local0 then
		return {
			models = {
				name = "MENU_USER_GENERATED_CONTENT",
				desc = "PLATFORM_USER_GENERATED_CONTENT_DISABLED",
				image = RegisterMaterial( "" ),
				altText = "MENU_NOT_AVAILABLE"
			}
		}
	else
		return CoD.OptionsUtility.CreateEnabledDisabledProfileVar( f2_arg0, "MENU_USER_GENERATED_CONTENT", "MENU_USER_GENERATED_CONTENT_DESC", "cg_enableUGC", "GraphicsOptions_UserGeneratedContent" )
	end
end

local f0_local2 = function ( f3_arg0 )
	return {
		models = {
			name = Engine.Localize( "MENU_RESET_ZOMBIES" ),
			desc = Engine.Localize( "MENU_RESET_ZOMBIES_DESC" ),
			altText = "MENU_RESET",
			image = RegisterMaterial( "" ),
			action = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
				f4_arg4:OpenModalDialog( f4_arg0, f4_arg2, "MENU_WARNING", "MENU_RESET_ZOMBIES_WARNING", {
					"MPUI_YES",
					"MPUI_NO"
				}, function ( f5_arg0 )
					if f5_arg0 == 0 then
						Engine.LobbyVM_CallFunc( "ErrorShutdown", {
							controller = Engine.GetPrimaryController(),
							signoutUsers = false
						} )
					end
					return true
				end )
			end
			
		},
		properties = {
			disabled = not CoD.isFrontend
		}
	}
end

DataSources.OptionGraphicContentList = DataSourceHelpers.ListSetup( "OptionGraphicContentList", function ( f6_arg0 )
	local f6_local0 = {}
	table.insert( f6_local0, f0_local0( f6_arg0 ) )
	table.insert( f6_local0, f0_local1( f6_arg0 ) )
	return f6_local0
end, true )
local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

LUI.createMenu.StartMenu_Options_GraphicContent = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_GraphicContent" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_GraphicContent.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
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
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( false, false, 134, 380 )
	Desc:setTopBottom( true, false, 180, 202 )
	Desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, true, -11, 13 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( false, false, -608, 62 )
	ButtonList:setTopBottom( true, false, 137.5, 591.5 )
	ButtonList:setDataSource( "OptionGraphicContentList" )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 8 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
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
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, true, -11, 13 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local StartMenuOptionHighlight = CoD.StartMenu_OptionHighlight.new( self, controller )
	StartMenuOptionHighlight:setLeftRight( false, false, 134, 280 )
	StartMenuOptionHighlight:setTopBottom( true, false, 141.5, 181.5 )
	self:addElement( StartMenuOptionHighlight )
	self.StartMenuOptionHighlight = StartMenuOptionHighlight
	
	local StartMenuOptionIconContainer = CoD.StartMenu_Option_IconContainer.new( self, controller )
	StartMenuOptionIconContainer:setLeftRight( false, false, 19, 126 )
	StartMenuOptionIconContainer:setTopBottom( true, false, 139.5, 246.5 )
	self:addElement( StartMenuOptionIconContainer )
	self.StartMenuOptionIconContainer = StartMenuOptionIconContainer
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "MENU_CONTENT_FILTER" ) ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( "MENU_CONTENT_FILTER" ) ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics0:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics0:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	Desc:linkToElementModel( ButtonList, "desc", true, function ( model )
		local desc = Engine.GetModelValue( model )
		if desc then
			Desc:setText( Engine.Localize( desc ) )
		end
	end )
	StartMenuOptionHighlight:linkToElementModel( ButtonList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			StartMenuOptionHighlight.DescTitle:setText( Engine.Localize( name ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f15_local0 = nil
		ShowHeaderIconOnly( self )
		if not f15_local0 then
			f15_local0 = self:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		UpdateGamerprofile( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
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
		element.StartMenuOptionHighlight:close()
		element.StartMenuOptionIconContainer:close()
		element.MenuFrame:close()
		element.FEMenuLeftGraphics0:close()
		element.Desc:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_GraphicContent.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

