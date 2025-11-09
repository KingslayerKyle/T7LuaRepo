require( "ui.uieditor.widgets.CharacterCustomization.list1ButtonNewStyle" )
require( "ui.uieditor.widgets.CPLevels.CPFrame" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local PrepareConfirmCharacterList = function ( controller )
	local values = {
		{
			models = {
				displayText = Engine.Localize( "MENU_CONFIRM_CAPS" ),
				desc = ""
			},
			properties = {
				difficulty = 0,
				action = function ( self, element, controller, actionParam, menu )
					SetFirstTimeSetupComplete( self, element, controller )
					GoBackToMenu( menu, controller, "Lobby" )
					NavigateToLobby_FirstTimeFlowCP( self, element, controller, menu )
				end
			}
		},
		{
			models = {
				displayText = Engine.Localize( "MENU_CHANGE_GENDER" ),
				desc = ""
			},
			properties = {
				difficulty = 1,
				action = function ( self, element, controller, actionParam, menu )
					NavigateToMenu( menu, "ChooseGender", true, controller )
				end
			}
		},
		{
			models = {
				displayText = Engine.Localize( "MENU_CHANGE_FACE" ),
				desc = ""
			},
			properties = {
				difficulty = 2,
				action = function ( self, element, controller, actionParam, menu )
					NavigateToMenu( menu, "ChooseHead", true, controller )
				end
			}
		},
		{
			models = {
				displayText = Engine.Localize( "MENU_CHANGE_DIFFICULTY" ),
				desc = ""
			},
			properties = {
				difficulty = 3,
				action = function ( self, element, controller, actionParam, menu )
					NavigateToMenu( menu, "CPSelectDifficulty", true, controller )
				end
			}
		}
	}
	return values
end

DataSources.ConfirmCharacterList = DataSourceHelpers.ListSetup( "ConfirmCharacterList", PrepareConfirmCharacterList, true )
LUI.createMenu.CPConfirmSelection = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPConfirmSelection" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPConfirmSelection.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, -16, 0 )
	black:setTopBottom( true, true, -13, -9 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.95 )
	self:addElement( black )
	self.black = black
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, -67, 38.33 )
	background:setTopBottom( true, true, -36, 17.38 )
	background:setAlpha( 0.74 )
	background:setImage( RegisterImage( "uie_t7_menu_cp_bg_image" ) )
	self:addElement( background )
	self.background = background
	
	local Buttons = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Buttons:makeFocusable()
	Buttons:setLeftRight( true, false, 75, 355 )
	Buttons:setTopBottom( true, false, 144, 312 )
	Buttons:setDataSource( "ConfirmCharacterList" )
	Buttons:setWidgetType( CoD.list1ButtonNewStyle )
	Buttons:setVerticalCount( 5 )
	Buttons:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Buttons:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( Buttons, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( Buttons )
	self.Buttons = Buttons
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 928.45, 1216 )
	Image:setTopBottom( true, false, 144, 385.5 )
	self:addElement( Image )
	self.Image = Image
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 959, 1153.5 )
	Title:setTopBottom( true, false, 408.78, 428.78 )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Title:setShaderVector( 0, 0.06, 0, 0, 0 )
	Title:setShaderVector( 1, 0.02, 0, 0, 0 )
	Title:setShaderVector( 2, 1, 0, 0, 0 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local SecTitleBG0 = LUI.UIImage.new()
	SecTitleBG0:setLeftRight( false, true, -355.55, -64 )
	SecTitleBG0:setTopBottom( true, false, 394.67, 442.89 )
	SecTitleBG0:setAlpha( 0.65 )
	SecTitleBG0:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG0 )
	self.SecTitleBG0 = SecTitleBG0
	
	local SubTitle = LUI.UIText.new()
	SubTitle:setLeftRight( true, false, 959, 1153.5 )
	SubTitle:setTopBottom( true, false, 452.78, 471.78 )
	SubTitle:setAlpha( 0.55 )
	SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SubTitle )
	self.SubTitle = SubTitle
	
	local Image31 = LUI.UIImage.new()
	Image31:setLeftRight( false, true, -351.55, -323.55 )
	Image31:setTopBottom( true, false, 393.67, 397.89 )
	Image31:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image31:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image31 )
	self.Image31 = Image31
	
	local Image300 = LUI.UIImage.new()
	Image300:setLeftRight( false, true, -351.55, -323.55 )
	Image300:setTopBottom( true, false, 438.67, 442.89 )
	Image300:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image300:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image300 )
	self.Image300 = Image300
	
	local CPFrame = CoD.CPFrame.new( self, controller )
	CPFrame:setLeftRight( true, false, 928.45, 1216 )
	CPFrame:setTopBottom( true, false, 144, 385.5 )
	self:addElement( CPFrame )
	self.CPFrame = CPFrame
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CONFIRM_SELECTION_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CONFIRM_SELECTION_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_customgames" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	Image:linkToElementModel( Buttons, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image:setImage( RegisterImage( modelValue ) )
		end
	end )
	Title:linkToElementModel( Buttons, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	SubTitle:linkToElementModel( Buttons, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SubTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		SetGlobalModelValueTrue( "firstTimeFlowCPConfirm" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetElementStateByElementName( self, "MenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "MenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		ShowHeaderIconOnly( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SetGlobalModelValueFalse( "firstTimeFlowCPConfirm" )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	Buttons.id = "Buttons"
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
		self.Buttons:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Buttons:close()
		self.CPFrame:close()
		self.MenuFrame:close()
		self.FEMenuLeftGraphics:close()
		self.Image:close()
		self.Title:close()
		self.SubTitle:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPConfirmSelection.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

