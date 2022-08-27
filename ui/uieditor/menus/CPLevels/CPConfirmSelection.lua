-- 5f3b7f562783f085e3d6a2ff3100772d
-- This hash is used for caching, delete to decompile the file again

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
	local f6_local1 = self
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
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f6_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 378 )
	LeftPanel:setTopBottom( true, true, 78, 23 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Buttons = LUI.UIList.new( f6_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Buttons:makeFocusable()
	Buttons:setLeftRight( true, false, 79, 359 )
	Buttons:setTopBottom( true, false, 144, 312 )
	Buttons:setWidgetType( CoD.List1ButtonConfirmSelection )
	Buttons:setVerticalCount( 5 )
	Buttons:setDataSource( "ConfirmCharacterList" )
	Buttons:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	f6_local1:AddButtonCallbackFunction( Buttons, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		ProcessListAction( self, f9_arg0, f9_arg2 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( Buttons )
	self.Buttons = Buttons
	
	local MenuFrame = CoD.GenericMenuFrame.new( f6_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 1, 1 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_FINALIZE_OPERATIVE_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FINALIZE_OPERATIVE_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_customgames" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local CPConfirmSelectionBox0 = CoD.CP_ConfirmSelection_Box.new( f6_local1, controller )
	CPConfirmSelectionBox0:setLeftRight( true, false, 943.71, 1212.21 )
	CPConfirmSelectionBox0:setTopBottom( true, false, 452.75, 654.75 )
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
	
	local CPConfirmSelectionBox = CoD.CP_ConfirmSelection_Box.new( f6_local1, controller )
	CPConfirmSelectionBox:setLeftRight( true, false, 943.71, 1212.21 )
	CPConfirmSelectionBox:setTopBottom( true, false, 130, 326 )
	self:addElement( CPConfirmSelectionBox )
	self.CPConfirmSelectionBox = CPConfirmSelectionBox
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f6_local1, controller )
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
	
	local FELabelSubHeadingE1 = CoD.FE_LabelSubHeadingE.new( f6_local1, controller )
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
	
	local SaveDataHintText = LUI.UIText.new()
	SaveDataHintText:setLeftRight( true, false, 984.37, 1202.21 )
	SaveDataHintText:setTopBottom( true, false, 472.08, 491.08 )
	SaveDataHintText:setAlpha( 0.9 )
	SaveDataHintText:setText( Engine.Localize( "PLATFORM_SAVE_DATA_WARNING" ) )
	SaveDataHintText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SaveDataHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SaveDataHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SaveDataHintText )
	self.SaveDataHintText = SaveDataHintText
	
	local WarningTriangle2 = LUI.UIImage.new()
	WarningTriangle2:setLeftRight( true, false, 956.62, 978.12 )
	WarningTriangle2:setTopBottom( false, true, -246.92, -228.92 )
	WarningTriangle2:setRGB( 0.95, 0.89, 0.03 )
	WarningTriangle2:setImage( RegisterImage( "uie_warning_triangle" ) )
	self:addElement( WarningTriangle2 )
	self.WarningTriangle2 = WarningTriangle2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				CPConfirmSelectionBox0:completeAnimation()
				self.CPConfirmSelectionBox0:setLeftRight( true, false, 943.71, 1212.21 )
				self.CPConfirmSelectionBox0:setTopBottom( true, false, 515.75, 654.75 )
				self.clipFinished( CPConfirmSelectionBox0, {} )
				SaveDataHintText:completeAnimation()
				self.SaveDataHintText:setAlpha( 0 )
				self.clipFinished( SaveDataHintText, {} )
				WarningTriangle2:completeAnimation()
				self.WarningTriangle2:setAlpha( 0 )
				self.clipFinished( WarningTriangle2, {} )
			end
		},
		Durango = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				CPConfirmSelectionBox0:completeAnimation()
				self.CPConfirmSelectionBox0:setLeftRight( true, false, 943.71, 1212.21 )
				self.CPConfirmSelectionBox0:setTopBottom( true, false, 452.75, 654.75 )
				self.clipFinished( CPConfirmSelectionBox0, {} )
				SaveDataHintText:completeAnimation()
				self.SaveDataHintText:setAlpha( 0.9 )
				self.clipFinished( SaveDataHintText, {} )
				WarningTriangle2:completeAnimation()
				self.WarningTriangle2:setAlpha( 1 )
				self.clipFinished( WarningTriangle2, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Durango",
			condition = function ( menu, element, event )
				return IsDurango()
			end
		}
	} )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f16_local0 = nil
		SetGlobalModelValueTrue( "firstTimeFlowCPConfirm" )
		if not f16_local0 then
			f16_local0 = element:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f17_local0 = nil
		SendClientScriptMenuChangeNotify( controller, f6_local1, true )
		SetElementStateByElementName( self, "MenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "MenuFrame",
			clipName = "Intro"
		}, controller )
		ShowHeaderIconOnly( f6_local1 )
		if not f17_local0 then
			f17_local0 = element:dispatchEventToChildren( event )
		end
		return f17_local0
	end )
	f6_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		ProcessListAction( self, f18_arg0, f18_arg2 )
		return true
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f6_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		return true
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		menu = f6_local1
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

