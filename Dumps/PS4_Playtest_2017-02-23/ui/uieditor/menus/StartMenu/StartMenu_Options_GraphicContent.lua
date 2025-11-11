require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )

local CreateModels_GraphicContent = function ( controller )
	local profileVar = "cg_mature"
	local toggle = {
		{
			name = Engine.Localize( "MENU_DISABLED" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_ENABLED" ),
			value = 1
		}
	}
	local listInfo = {
		models = {
			name = "MENU_GRAPHIC_CONTENT",
			desc = "MENU_GRAPHIC_CONTENT_DESC",
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "GraphicsOptions_GraphicContent", toggle, profileVar ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, toggle, profileVar )
		},
		properties = {
			disabled = Dvar.ui_execdemo:get()
		}
	}
	return listInfo
end

local CreateModels_UserGeneratedContent = function ( controller )
	local f2_local0 = Engine.IsDeviceRestrictingContent
	if f2_local0 then
		local deviceRestrictingContent = Engine.IsDeviceRestrictingContent( controller )
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
		return CoD.OptionsUtility.CreateEnabledDisabledProfileVar( controller, "MENU_USER_GENERATED_CONTENT", "MENU_USER_GENERATED_CONTENT_DESC", "cg_enableUGC", "GraphicsOptions_UserGeneratedContent" )
	end
end

local CreateModels_ResetZombies = function ( controller )
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_RESET_ZOMBIES" ),
			desc = Engine.Localize( "MENU_RESET_ZOMBIES_DESC" ),
			altText = "MENU_RESET",
			image = RegisterMaterial( "" ),
			action = function ( self, element, controller, param, menu )
				menu:OpenModalDialog( self, controller, "MENU_WARNING", "MENU_RESET_ZOMBIES_WARNING", {
					"MPUI_YES",
					"MPUI_NO"
				}, function ( modalResult )
					if modalResult == 0 then
						local data = {
							controller = Engine.GetPrimaryController(),
							signoutUsers = false
						}
						Engine.LobbyEvent( "OnErrorShutdown", data )
					end
					return true
				end )
			end
		},
		properties = {
			disabled = not CoD.isFrontend
		}
	}
	return listInfo
end

local PrepareGraphicContentOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CreateModels_GraphicContent( controller ) )
	table.insert( optionsTable, CreateModels_UserGeneratedContent( controller ) )
	return optionsTable
end

DataSources.OptionGraphicContentList = DataSourceHelpers.ListSetup( "OptionGraphicContentList", PrepareGraphicContentOptions, true )
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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_GraphicContent.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( 0.5, 0.5, 201, 570 )
	Desc:setTopBottom( 0, 0, 270, 303 )
	Desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 1, -16, 20 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0.5, 0.5, -912, 93 )
	ButtonList:setTopBottom( 0, 0, 212, 882 )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 8 )
	ButtonList:setDataSource( "OptionGraphicContentList" )
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
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 1, -16, 20 )
	CategoryListLine0:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local StartMenuOptionHighlight = CoD.StartMenu_OptionHighlight.new( self, controller )
	StartMenuOptionHighlight:setLeftRight( 0.5, 0.5, 201, 420 )
	StartMenuOptionHighlight:setTopBottom( 0, 0, 212, 272 )
	self:addElement( StartMenuOptionHighlight )
	self.StartMenuOptionHighlight = StartMenuOptionHighlight
	
	local StartMenuOptionIconContainer = CoD.StartMenu_Option_IconContainer.new( self, controller )
	StartMenuOptionIconContainer:setLeftRight( 0.5, 0.5, 29, 189 )
	StartMenuOptionIconContainer:setTopBottom( 0, 0, 210, 370 )
	self:addElement( StartMenuOptionIconContainer )
	self.StartMenuOptionIconContainer = StartMenuOptionIconContainer
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( LocalizeToUpperString( "MENU_CONTENT_FILTER" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeToUpperString( "MENU_CONTENT_FILTER" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics0:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics0:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	Desc:linkToElementModel( ButtonList, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Desc:setText( Engine.Localize( modelValue ) )
		end
	end )
	StartMenuOptionHighlight:linkToElementModel( ButtonList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuOptionHighlight.DescTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderIconOnly( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		UpdateGamerprofile( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonList:close()
		self.StartMenuOptionHighlight:close()
		self.StartMenuOptionIconContainer:close()
		self.MenuFrame:close()
		self.FEMenuLeftGraphics0:close()
		self.Desc:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_GraphicContent.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

