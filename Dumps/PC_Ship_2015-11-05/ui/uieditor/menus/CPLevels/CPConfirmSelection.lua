require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.StartGameFlow.List1ButtonConfirmSelection" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartGameFlow.CP_ConfirmSelection_Box" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingE" )

DataSources.ConfirmCharacterList = DataSourceHelpers.ListSetup( "ConfirmCharacterList", function ( f1_arg0 )
	return {
		{
			models = {
				displayText = Engine.Localize( "MENU_CONFIRM_CAPS" ),
				desc = ""
			},
			properties = {
				difficulty = 0,
				action = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
					SetFirstTimeSetupComplete( f2_arg0, f2_arg1, f2_arg2 )
					GoBackToMenu( f2_arg4, f2_arg2, "Lobby" )
					SendClientScriptMenuChangeNotify( f2_arg2, f2_arg4, false )
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
				action = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4 )
					NavigateToMenu( f3_arg4, "ChooseGender", true, f3_arg2 )
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
				action = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
					NavigateToMenu( f4_arg4, "ChooseHead", true, f4_arg2 )
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
				action = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
					NavigateToMenu( f5_arg4, "CPSelectDifficulty", true, f5_arg2 )
				end
				
			}
		}
	}
end, true )
LUI.createMenu.CPConfirmSelection = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPConfirmSelection" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPConfirmSelection.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local NoiseOverlay = LUI.UIImage.new()
	NoiseOverlay:setLeftRight( true, true, 3.35, 3.35 )
	NoiseOverlay:setTopBottom( true, true, -5.92, -5.92 )
	NoiseOverlay:setAlpha( 0.3 )
	NoiseOverlay:setImage( RegisterImage( "uie_t7_menu_frontend_textureoverlaya" ) )
	NoiseOverlay:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NoiseOverlay )
	self.NoiseOverlay = NoiseOverlay
	
	local Vignette = LUI.UIImage.new()
	Vignette:setLeftRight( false, false, -661, 660.71 )
	Vignette:setTopBottom( false, false, -1381.5, 425.5 )
	Vignette:setXRot( 180 )
	Vignette:setImage( RegisterImage( "uie_frontend_vingette_c" ) )
	Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Vignette )
	self.Vignette = Vignette
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 378 )
	LeftPanel:setTopBottom( true, true, 78, 23 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Buttons = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Buttons:makeFocusable()
	Buttons:setLeftRight( true, false, 79, 359 )
	Buttons:setTopBottom( true, false, 144, 312 )
	Buttons:setDataSource( "ConfirmCharacterList" )
	Buttons:setWidgetType( CoD.List1ButtonConfirmSelection )
	Buttons:setVerticalCount( 5 )
	Buttons:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	Buttons:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
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
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 1, 1 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_FINALIZE_OPERATIVE_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FINALIZE_OPERATIVE_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_customgames" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local CPConfirmSelectionBox0 = CoD.CP_ConfirmSelection_Box.new( self, controller )
	CPConfirmSelectionBox0:setLeftRight( true, false, 943.71, 1212.21 )
	CPConfirmSelectionBox0:setTopBottom( true, false, 515.75, 654.75 )
	self:addElement( CPConfirmSelectionBox0 )
	self.CPConfirmSelectionBox0 = CPConfirmSelectionBox0
	
	local DifficultySettingHint = LUI.UIText.new()
	DifficultySettingHint:setLeftRight( true, false, 984.37, 1202.21 )
	DifficultySettingHint:setTopBottom( true, false, 532.08, 551.08 )
	DifficultySettingHint:setAlpha( 0.9 )
	DifficultySettingHint:setText( Engine.Localize( "MENU_DIFFICULTY_SETTING_HINT" ) )
	DifficultySettingHint:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	DifficultySettingHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DifficultySettingHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DifficultySettingHint )
	self.DifficultySettingHint = DifficultySettingHint
	
	local CPConfirmSelectionBox = CoD.CP_ConfirmSelection_Box.new( self, controller )
	CPConfirmSelectionBox:setLeftRight( true, false, 943.71, 1212.21 )
	CPConfirmSelectionBox:setTopBottom( true, false, 130, 326 )
	self:addElement( CPConfirmSelectionBox )
	self.CPConfirmSelectionBox = CPConfirmSelectionBox
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local GenderSettingsHint = LUI.UIText.new()
	GenderSettingsHint:setLeftRight( true, false, 984.37, 1202.21 )
	GenderSettingsHint:setTopBottom( true, false, 593.87, 612.87 )
	GenderSettingsHint:setAlpha( 0.9 )
	GenderSettingsHint:setText( Engine.Localize( "MENU_GENDER_SETTING_HINT" ) )
	GenderSettingsHint:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	GenderSettingsHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GenderSettingsHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GenderSettingsHint )
	self.GenderSettingsHint = GenderSettingsHint
	
	local DifficulyIcon = LUI.UIImage.new()
	DifficulyIcon:setLeftRight( false, true, -289.29, -113.79 )
	DifficulyIcon:setTopBottom( true, false, 140.25, 315.75 )
	DifficulyIcon:subscribeToGlobalModel( controller, "CampaignSettings", "difficultyIcon", function ( model )
		local difficultyIcon = Engine.GetModelValue( model )
		if difficultyIcon then
			DifficulyIcon:setImage( RegisterImage( difficultyIcon ) )
		end
	end )
	self:addElement( DifficulyIcon )
	self.DifficulyIcon = DifficulyIcon
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 1216, 1219 )
	LineSide:setTopBottom( true, false, -30, 682 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local FELabelSubHeadingE1 = CoD.FE_LabelSubHeadingE.new( self, controller )
	FELabelSubHeadingE1:setLeftRight( true, false, 945.71, 1019.71 )
	FELabelSubHeadingE1:setTopBottom( true, false, 302.5, 325.5 )
	FELabelSubHeadingE1.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	FELabelSubHeadingE1:subscribeToGlobalModel( controller, "CampaignSettings", "difficulty", function ( model )
		local difficulty = Engine.GetModelValue( model )
		if difficulty then
			FELabelSubHeadingE1.Label0:setText( Engine.Localize( difficulty ) )
		end
	end )
	self:addElement( FELabelSubHeadingE1 )
	self.FELabelSubHeadingE1 = FELabelSubHeadingE1
	
	local WarningTriangle0 = LUI.UIImage.new()
	WarningTriangle0:setLeftRight( true, false, 956.62, 978.12 )
	WarningTriangle0:setTopBottom( false, true, -186.92, -168.92 )
	WarningTriangle0:setRGB( 0.95, 0.89, 0.03 )
	WarningTriangle0:setImage( RegisterImage( "uie_warning_triangle" ) )
	self:addElement( WarningTriangle0 )
	self.WarningTriangle0 = WarningTriangle0
	
	local WarningTriangle00 = LUI.UIImage.new()
	WarningTriangle00:setLeftRight( true, false, 956.62, 978.12 )
	WarningTriangle00:setTopBottom( false, true, -127.13, -109.13 )
	WarningTriangle00:setRGB( 0.95, 0.89, 0.03 )
	WarningTriangle00:setImage( RegisterImage( "uie_warning_triangle" ) )
	self:addElement( WarningTriangle00 )
	self.WarningTriangle00 = WarningTriangle00
	
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f13_local0 = nil
		SetGlobalModelValueTrue( "firstTimeFlowCPConfirm" )
		if not f13_local0 then
			f13_local0 = self:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f14_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetElementStateByElementName( self, "MenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "MenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		ShowHeaderIconOnly( self )
		if not f14_local0 then
			f14_local0 = self:dispatchEventToChildren( event )
		end
		return f14_local0
	end )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.Buttons:close()
		element.MenuFrame:close()
		element.CPConfirmSelectionBox0:close()
		element.CPConfirmSelectionBox:close()
		element.FEMenuLeftGraphics:close()
		element.FELabelSubHeadingE1:close()
		element.DifficulyIcon:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPConfirmSelection.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

