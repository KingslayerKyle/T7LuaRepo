require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingE" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.StartGameFlow.CP_ConfirmSelection_Box" )
require( "ui.uieditor.widgets.StartGameFlow.List1ButtonConfirmSelection" )

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
					SendClientScriptMenuChangeNotify( controller, menu, false )
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
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPConfirmSelection.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local NoiseOverlay = LUI.UIImage.new()
	NoiseOverlay:setLeftRight( 0, 1, 5, 5 )
	NoiseOverlay:setTopBottom( 0, 1, -9, -9 )
	NoiseOverlay:setAlpha( 0.3 )
	NoiseOverlay:setImage( RegisterImage( "uie_t7_menu_frontend_textureoverlaya" ) )
	NoiseOverlay:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NoiseOverlay )
	self.NoiseOverlay = NoiseOverlay
	
	local Vignette = LUI.UIImage.new()
	Vignette:setLeftRight( 0.5, 0.5, -992, 991 )
	Vignette:setTopBottom( 0.5, 0.5, -2072, 638 )
	Vignette:setXRot( 180 )
	Vignette:setImage( RegisterImage( "uie_frontend_vingette_c" ) )
	Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Vignette )
	self.Vignette = Vignette
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 567 )
	LeftPanel:setTopBottom( 0, 1, 117, 35 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Buttons = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Buttons:makeFocusable()
	Buttons:setLeftRight( 0, 0, 118, 538 )
	Buttons:setTopBottom( 0, 0, 218, 466 )
	Buttons:setWidgetType( CoD.List1ButtonConfirmSelection )
	Buttons:setVerticalCount( 5 )
	Buttons:setDataSource( "ConfirmCharacterList" )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( Buttons )
	self.Buttons = Buttons
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 1, 1 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_FINALIZE_OPERATIVE_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FINALIZE_OPERATIVE_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_customgames" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local CPConfirmSelectionBox0 = CoD.CP_ConfirmSelection_Box.new( self, controller )
	CPConfirmSelectionBox0:setLeftRight( 0, 0, 1415, 1818 )
	CPConfirmSelectionBox0:setTopBottom( 0, 0, 774, 982 )
	self:addElement( CPConfirmSelectionBox0 )
	self.CPConfirmSelectionBox0 = CPConfirmSelectionBox0
	
	local DifficultySettingHint = LUI.UIText.new()
	DifficultySettingHint:setLeftRight( 0, 0, 1476, 1803 )
	DifficultySettingHint:setTopBottom( 0, 0, 798, 826 )
	DifficultySettingHint:setAlpha( 0.9 )
	DifficultySettingHint:setText( Engine.Localize( "MENU_DIFFICULTY_SETTING_HINT" ) )
	DifficultySettingHint:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	DifficultySettingHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DifficultySettingHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DifficultySettingHint )
	self.DifficultySettingHint = DifficultySettingHint
	
	local CPConfirmSelectionBox = CoD.CP_ConfirmSelection_Box.new( self, controller )
	CPConfirmSelectionBox:setLeftRight( 0, 0, 1415, 1818 )
	CPConfirmSelectionBox:setTopBottom( 0, 0, 195, 489 )
	self:addElement( CPConfirmSelectionBox )
	self.CPConfirmSelectionBox = CPConfirmSelectionBox
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 126, 1052 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local GenderSettingsHint = LUI.UIText.new()
	GenderSettingsHint:setLeftRight( 0, 0, 1476, 1803 )
	GenderSettingsHint:setTopBottom( 0, 0, 891, 919 )
	GenderSettingsHint:setAlpha( 0.9 )
	GenderSettingsHint:setText( Engine.Localize( "MENU_GENDER_SETTING_HINT" ) )
	GenderSettingsHint:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	GenderSettingsHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GenderSettingsHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GenderSettingsHint )
	self.GenderSettingsHint = GenderSettingsHint
	
	local DifficulyIcon = LUI.UIImage.new()
	DifficulyIcon:setLeftRight( 1, 1, -434, -171 )
	DifficulyIcon:setTopBottom( 0, 0, 210, 473 )
	DifficulyIcon:subscribeToGlobalModel( controller, "CampaignSettings", "difficultyIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			DifficulyIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( DifficulyIcon )
	self.DifficulyIcon = DifficulyIcon
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( 0, 0, 1824, 1828 )
	LineSide:setTopBottom( 0, 0, -45, 1023 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local FELabelSubHeadingE1 = CoD.FE_LabelSubHeadingE.new( self, controller )
	FELabelSubHeadingE1:setLeftRight( 0, 0, 1419, 1530 )
	FELabelSubHeadingE1:setTopBottom( 0, 0, 454, 488 )
	FELabelSubHeadingE1.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	FELabelSubHeadingE1:subscribeToGlobalModel( controller, "CampaignSettings", "difficulty", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FELabelSubHeadingE1.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FELabelSubHeadingE1 )
	self.FELabelSubHeadingE1 = FELabelSubHeadingE1
	
	local WarningTriangle0 = LUI.UIImage.new()
	WarningTriangle0:setLeftRight( 0, 0, 1435, 1467 )
	WarningTriangle0:setTopBottom( 1, 1, -280, -253 )
	WarningTriangle0:setRGB( 0.95, 0.89, 0.03 )
	self:addElement( WarningTriangle0 )
	self.WarningTriangle0 = WarningTriangle0
	
	local WarningTriangle00 = LUI.UIImage.new()
	WarningTriangle00:setLeftRight( 0, 0, 1435, 1467 )
	WarningTriangle00:setTopBottom( 1, 1, -191, -164 )
	WarningTriangle00:setRGB( 0.95, 0.89, 0.03 )
	self:addElement( WarningTriangle00 )
	self.WarningTriangle00 = WarningTriangle00
	
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
		SendClientScriptMenuChangeNotify( controller, self, true )
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
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
		self.LeftPanel:close()
		self.Buttons:close()
		self.MenuFrame:close()
		self.CPConfirmSelectionBox0:close()
		self.CPConfirmSelectionBox:close()
		self.FEMenuLeftGraphics:close()
		self.FELabelSubHeadingE1:close()
		self.DifficulyIcon:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPConfirmSelection.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

