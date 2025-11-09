require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Texture" )
require( "ui.uieditor.widgets.CAC.cac_BlackFadeIn" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassWidget" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListCustomClass" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfopanePreviewWidget" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.CAC.List1ButtonChooseClass" )
require( "ui.uieditor.menus.CAC.CustomClass" )
require( "ui.uieditor.widgets.CAC.cac_TrainingSimNameLabel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CAC.cac_TrainingSimRating" )

local PreLoadFunc = function ( self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "setModel", function ( element, controller )
		element:processEvent( {
			name = "update_state",
			menu = element
		} )
	end )
	CoD.CACUtility.SetDefaultCACRoot( controller )
	self.customClassModel = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( controller ), "CustomClassList" ), "class" .. 1 )
	CoD.CACUtility.GetCustomClassModel( controller, 9, self.customClassModel )
	if Gunsmith_IsEnabled( self, controller ) then
		CoD.CraftUtility.Gunsmith.ParseDDL( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	f3_arg0:playSound( "cac_enter" )
	f3_arg0.chooseClassWidget:subscribeToModel( f3_arg0.customClassModel, function ( model )
		f3_arg0.chooseClassWidget:setModel( model, f3_arg1 )
	end )
	f3_arg0:processEvent( {
		name = "update_state",
		controller = f3_arg1
	} )
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( f3_arg1 )
	end
	CoD.CACUtility.CreateUnlockTokenModels( f3_arg1 )
	CoD.CACUtility.SetCACMenuHeroInfoModels( f3_arg1 )
	f3_arg0.CustomizeLoadout.navigation.right = nil
	f3_arg0.BeginCombatImmersion.navigation.right = nil
	f3_arg0.chooseClassWidget.m_inputDisabled = true
	local f3_local0 = Engine.GetPlayerStats( f3_arg1 )
	local f3_local1 = f3_local0.trainingSimStats.highestScore:get()
	local f3_local2 = f3_local0.trainingSimStats.highestRound:get()
	f3_arg0.bestScore:setText( f3_local1 )
	f3_arg0.highestRound:setText( f3_local2 )
	CoD.perController[f3_arg1].playedTrainingSim = true
end

LUI.createMenu.chooseClass_TrainingSim = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "chooseClass_TrainingSim" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "chooseClass_TrainingSim.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local blackimage = LUI.UIImage.new()
	blackimage:setLeftRight( true, true, 0, 0 )
	blackimage:setTopBottom( true, true, 0, 0 )
	blackimage:setRGB( 0, 0, 0 )
	self:addElement( blackimage )
	self.blackimage = blackimage
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, -15, -15 )
	Background:setScale( 1 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local blackImage = LUI.UIImage.new()
	blackImage:setLeftRight( true, true, 0, 0 )
	blackImage:setTopBottom( true, true, 0, 0 )
	blackImage:setRGB( 0, 0, 0 )
	blackImage:setAlpha( 0.5 )
	self:addElement( blackImage )
	self.blackImage = blackImage
	
	local Texture = CoD.AbilityWheel_Texture.new( self, controller )
	Texture:setLeftRight( false, false, -140, 640 )
	Texture:setTopBottom( true, false, 134, 655 )
	self:addElement( Texture )
	self.Texture = Texture
	
	local cacBlackFadeIn = CoD.cac_BlackFadeIn.new( self, controller )
	cacBlackFadeIn:setLeftRight( true, true, 0, 0 )
	cacBlackFadeIn:setTopBottom( true, true, 0, 0 )
	self:addElement( cacBlackFadeIn )
	self.cacBlackFadeIn = cacBlackFadeIn
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( false, false, -576, -262 )
	LeftPanel:setTopBottom( true, false, 78, 137.98 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( false, false, -576, -266 )
	Backing:setTopBottom( true, false, 97, 720 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0.8 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local chooseClassWidget = CoD.chooseClassWidget.new( self, controller )
	chooseClassWidget:setLeftRight( false, false, -244.5, 96.5 )
	chooseClassWidget:setTopBottom( true, false, 80, 684 )
	self:addElement( chooseClassWidget )
	self.chooseClassWidget = chooseClassWidget
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "CP_SH_CAIRO_TRAINING" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "CP_SH_CAIRO_TRAINING" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_combatimmersion" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, true, -11, -1027.18 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setAlpha( 0 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local cacElemsSideListCustomClass0 = CoD.cac_ElemsSideListCustomClass.new( self, controller )
	cacElemsSideListCustomClass0:setLeftRight( false, false, -625, -227 )
	cacElemsSideListCustomClass0:setTopBottom( true, false, -12, 658 )
	self:addElement( cacElemsSideListCustomClass0 )
	self.cacElemsSideListCustomClass0 = cacElemsSideListCustomClass0
	
	local CustomClasspreviewWidget = CoD.InfopanePreviewWidget.new( self, controller )
	CustomClasspreviewWidget:setLeftRight( false, false, 71, 921 )
	CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
	CustomClasspreviewWidget:setAlpha( 0.43 )
	CustomClasspreviewWidget:linkToElementModel( self, nil, false, function ( model )
		CustomClasspreviewWidget:setModel( model, controller )
	end )
	self:addElement( CustomClasspreviewWidget )
	self.CustomClasspreviewWidget = CustomClasspreviewWidget
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "ChooseClass",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local BeginCombatImmersion = CoD.List1ButtonChooseClass.new( self, controller )
	BeginCombatImmersion:setLeftRight( false, false, -563, -283 )
	BeginCombatImmersion:setTopBottom( true, false, 314.5, 346.5 )
	BeginCombatImmersion.btnDisplayText:setText( Engine.Localize( "CPUI_BEGIN_COMBAT_IMMERSION_CAPS" ) )
	BeginCombatImmersion.btnDisplayTextStroke:setText( Engine.Localize( "CPUI_BEGIN_COMBAT_IMMERSION_CAPS" ) )
	BeginCombatImmersion:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	BeginCombatImmersion:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	self:AddButtonCallbackFunction( BeginCombatImmersion, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ChangeClass_TrainingSim( self, element, controller )
		SetMenuState( menu, "DisableCustomizedLoadout" )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		SaveLoadout( self, controller )
		UploadStats( self, controller )
		PrepareCloseMenuInSafehouse( controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BeginCombatImmersion )
	self.BeginCombatImmersion = BeginCombatImmersion
	
	local CustomizeLoadout = CoD.List1ButtonChooseClass.new( self, controller )
	CustomizeLoadout:setLeftRight( false, false, -563, -283 )
	CustomizeLoadout:setTopBottom( true, false, 282.5, 314.5 )
	CustomizeLoadout.btnDisplayText:setText( Engine.Localize( "CPUI_CUSTOMIZE_LOADOUT_CAPS" ) )
	CustomizeLoadout.btnDisplayTextStroke:setText( Engine.Localize( "CPUI_CUSTOMIZE_LOADOUT_CAPS" ) )
	CustomizeLoadout:registerEventHandler( "gain_focus", function ( element, event )
		local f13_local0 = nil
		if element.gainFocus then
			f13_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f13_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f13_local0
	end )
	CustomizeLoadout:registerEventHandler( "lose_focus", function ( element, event )
		local f14_local0 = nil
		if element.loseFocus then
			f14_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f14_local0 = element.super:loseFocus( event )
		end
		return f14_local0
	end )
	self:AddButtonCallbackFunction( CustomizeLoadout, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsMenuInState( menu, "DefaultState" ) then
			SetCustomClassNum_TrainingSim( self, element, controller )
			NavigateToMenu( self, "CustomClass", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsMenuInState( menu, "DefaultState" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( CustomizeLoadout )
	self.CustomizeLoadout = CustomizeLoadout
	
	local combatImmersionDesc = LUI.UIText.new()
	combatImmersionDesc:setLeftRight( false, false, -560, -275 )
	combatImmersionDesc:setTopBottom( true, false, 184.77, 204.77 )
	combatImmersionDesc:setText( Engine.Localize( "CPUI_TRAINING_SIM_DESC" ) )
	combatImmersionDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	combatImmersionDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	combatImmersionDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( combatImmersionDesc )
	self.combatImmersionDesc = combatImmersionDesc
	
	local cacTrainingSimNameLabel0 = CoD.cac_TrainingSimNameLabel.new( self, controller )
	cacTrainingSimNameLabel0:setLeftRight( false, false, 147.13, 422.5 )
	cacTrainingSimNameLabel0:setTopBottom( true, false, 145.48, 172.48 )
	cacTrainingSimNameLabel0.TextBox0:setText( Engine.Localize( "CPUI_IMMERSION_OVERVIEW_CAPS" ) )
	self:addElement( cacTrainingSimNameLabel0 )
	self.cacTrainingSimNameLabel0 = cacTrainingSimNameLabel0
	
	local immersionOverviewFight = LUI.UIText.new()
	immersionOverviewFight:setLeftRight( false, false, 150.13, 558.13 )
	immersionOverviewFight:setTopBottom( true, false, 198.22, 218.22 )
	immersionOverviewFight:setText( Engine.Localize( "CPUI_TRAINING_SIM_FIGHT" ) )
	immersionOverviewFight:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	immersionOverviewFight:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	immersionOverviewFight:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( immersionOverviewFight )
	self.immersionOverviewFight = immersionOverviewFight
	
	local immersionOverviewScoreBonus = LUI.UIText.new()
	immersionOverviewScoreBonus:setLeftRight( false, false, 150.13, 558.13 )
	immersionOverviewScoreBonus:setTopBottom( true, false, 236.77, 256.77 )
	immersionOverviewScoreBonus:setText( Engine.Localize( "CPUI_TRAINING_SIM_SCORE" ) )
	immersionOverviewScoreBonus:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	immersionOverviewScoreBonus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	immersionOverviewScoreBonus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( immersionOverviewScoreBonus )
	self.immersionOverviewScoreBonus = immersionOverviewScoreBonus
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( self, controller )
	FEButtonPanel0:setLeftRight( false, false, 280.88, 410.31 )
	FEButtonPanel0:setTopBottom( true, false, 318, 373.52 )
	FEButtonPanel0:setRGB( 0.13, 0.14, 0.16 )
	FEButtonPanel0:setAlpha( 0.65 )
	FEButtonPanel0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local bestScoreTitle = LUI.UIText.new()
	bestScoreTitle:setLeftRight( false, false, 121, 252 )
	bestScoreTitle:setTopBottom( true, false, 283.5, 308.5 )
	bestScoreTitle:setRGB( 0.95, 0.89, 0.03 )
	bestScoreTitle:setText( Engine.Localize( "CPUI_HIGHEST_ROUND_CAPS" ) )
	bestScoreTitle:setTTF( "fonts/default.ttf" )
	bestScoreTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	bestScoreTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( bestScoreTitle )
	self.bestScoreTitle = bestScoreTitle
	
	local FEButtonPanel00 = CoD.FE_ButtonPanel.new( self, controller )
	FEButtonPanel00:setLeftRight( false, false, 124.88, 254.31 )
	FEButtonPanel00:setTopBottom( true, false, 318, 373.52 )
	FEButtonPanel00:setRGB( 0.13, 0.14, 0.16 )
	FEButtonPanel00:setAlpha( 0.65 )
	FEButtonPanel00:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( FEButtonPanel00 )
	self.FEButtonPanel00 = FEButtonPanel00
	
	local highestRoundTitle = LUI.UIText.new()
	highestRoundTitle:setLeftRight( false, false, 278, 409 )
	highestRoundTitle:setTopBottom( true, false, 283.5, 308.5 )
	highestRoundTitle:setRGB( 0.95, 0.89, 0.03 )
	highestRoundTitle:setText( Engine.Localize( "MPUI_HIGHEST_SCORE_CAPS" ) )
	highestRoundTitle:setTTF( "fonts/default.ttf" )
	highestRoundTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highestRoundTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highestRoundTitle )
	self.highestRoundTitle = highestRoundTitle
	
	local highestRound = LUI.UIText.new()
	highestRound:setLeftRight( false, false, 129, 250 )
	highestRound:setTopBottom( true, false, 320.75, 369.25 )
	highestRound:setText( Engine.Localize( "9999" ) )
	highestRound:setTTF( "fonts/default.ttf" )
	highestRound:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highestRound:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highestRound )
	self.highestRound = highestRound
	
	local bestScore = LUI.UIText.new()
	bestScore:setLeftRight( false, false, 287, 408 )
	bestScore:setTopBottom( true, false, 321.51, 370.01 )
	bestScore:setText( Engine.Localize( "13" ) )
	bestScore:setTTF( "fonts/default.ttf" )
	bestScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	bestScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( bestScore )
	self.bestScore = bestScore
	
	local HighestScoreStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( self, controller )
	HighestScoreStroke:setLeftRight( false, false, 118.38, 260.81 )
	HighestScoreStroke:setTopBottom( true, false, 311, 380 )
	self:addElement( HighestScoreStroke )
	self.HighestScoreStroke = HighestScoreStroke
	
	local BestScoreStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( self, controller )
	BestScoreStroke:setLeftRight( false, false, 274.38, 416.81 )
	BestScoreStroke:setTopBottom( true, false, 311.76, 380.76 )
	self:addElement( BestScoreStroke )
	self.BestScoreStroke = BestScoreStroke
	
	local SecTitleBG = LUI.UIImage.new()
	SecTitleBG:setLeftRight( false, false, -576, -266 )
	SecTitleBG:setTopBottom( true, false, 135.15, 182.22 )
	SecTitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_titlebig_bg" ) )
	self:addElement( SecTitleBG )
	self.SecTitleBG = SecTitleBG
	
	local SecTitleBG0 = LUI.UIImage.new()
	SecTitleBG0:setLeftRight( false, false, 116.59, 558.59 )
	SecTitleBG0:setTopBottom( true, false, 135.15, 182.22 )
	SecTitleBG0:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_titlebig_bg" ) )
	self:addElement( SecTitleBG0 )
	self.SecTitleBG0 = SecTitleBG0
	
	local LineDot = LUI.UIImage.new()
	LineDot:setLeftRight( false, false, 117.63, 145.63 )
	LineDot:setTopBottom( true, false, 136, 140 )
	LineDot:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot )
	self.LineDot = LineDot
	
	local LineDot1 = LUI.UIImage.new()
	LineDot1:setLeftRight( false, false, 117.63, 145.63 )
	LineDot1:setTopBottom( true, false, 178, 182 )
	LineDot1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot1 )
	self.LineDot1 = LineDot1
	
	local List0 = LUI.UIList.new( self, controller, 12, 0, nil, false, false, 0, 0, false, true )
	List0:makeFocusable()
	List0:setLeftRight( false, false, 118.63, 571.63 )
	List0:setTopBottom( true, false, 403.76, 643.76 )
	List0:setDataSource( "TrainingSimRatingInfo" )
	List0:setWidgetType( CoD.cac_TrainingSimRating )
	List0:setHorizontalCount( 3 )
	List0:setSpacing( 12 )
	List0:mergeStateConditions( {
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "completed" )
			end
		}
	} )
	List0:linkToElementModel( List0, "completed", true, function ( model )
		self:updateElementState( List0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completed"
		} )
	end )
	self:addElement( List0 )
	self.List0 = List0
	
	local SecTitleBG00 = LUI.UIImage.new()
	SecTitleBG00:setLeftRight( false, false, 116.59, 558.59 )
	SecTitleBG00:setTopBottom( true, false, 135.15, 182.22 )
	SecTitleBG00:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_titlebig_bg" ) )
	self:addElement( SecTitleBG00 )
	self.SecTitleBG00 = SecTitleBG00
	
	local SecTitleBG1 = LUI.UIImage.new()
	SecTitleBG1:setLeftRight( false, false, -576, -266 )
	SecTitleBG1:setTopBottom( true, false, 135.15, 182.22 )
	SecTitleBG1:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_titlebig_bg" ) )
	self:addElement( SecTitleBG1 )
	self.SecTitleBG1 = SecTitleBG1
	
	local cacTrainingSimNameLabel00 = CoD.cac_TrainingSimNameLabel.new( self, controller )
	cacTrainingSimNameLabel00:setLeftRight( false, false, -563, -287.63 )
	cacTrainingSimNameLabel00:setTopBottom( true, false, 145.48, 172.48 )
	cacTrainingSimNameLabel00.TextBox0:setText( Engine.Localize( "CPUI_COMBAT_GEAR_CAPS" ) )
	self:addElement( cacTrainingSimNameLabel00 )
	self.cacTrainingSimNameLabel00 = cacTrainingSimNameLabel00
	
	chooseClassWidget.navigation = {
		left = {
			CustomizeLoadout,
			BeginCombatImmersion
		},
		right = List0
	}
	BeginCombatImmersion.navigation = {
		up = CustomizeLoadout,
		right = chooseClassWidget
	}
	CustomizeLoadout.navigation = {
		right = chooseClassWidget,
		down = BeginCombatImmersion
	}
	List0.navigation = {
		left = chooseClassWidget
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( false, false, -576, -262 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( false, false, -244.5, 96.5 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 684 )
				self.chooseClassWidget:setAlpha( 1 )
				self.chooseClassWidget:setZoom( 0 )
				self.clipFinished( chooseClassWidget, {} )
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setLeftRight( true, true, -11, 13 )
				self.CategoryListLine:setTopBottom( true, false, 80, 88 )
				self.clipFinished( CategoryListLine, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setAlpha( 0 )
				self.clipFinished( CustomClasspreviewWidget, {} )
				immersionOverviewFight:completeAnimation()
				self.immersionOverviewFight:setAlpha( 1 )
				self.clipFinished( immersionOverviewFight, {} )
				immersionOverviewScoreBonus:completeAnimation()
				self.immersionOverviewScoreBonus:setAlpha( 1 )
				self.clipFinished( immersionOverviewScoreBonus, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 6 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					local LeftPanelFrame3 = function ( LeftPanel, event )
						local LeftPanelFrame4 = function ( LeftPanel, event )
							local LeftPanelFrame5 = function ( LeftPanel, event )
								if not event.interrupted then
									LeftPanel:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								end
								LeftPanel:setLeftRight( false, false, -576, 117.5 )
								LeftPanel:setTopBottom( true, false, 756, 84 )
								LeftPanel:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( LeftPanel, event )
								else
									LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								LeftPanelFrame5( LeftPanel, event )
								return 
							else
								LeftPanel:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Linear )
								LeftPanel:setTopBottom( true, false, 756, 84 )
								LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame5 )
							end
						end
						
						if event.interrupted then
							LeftPanelFrame4( LeftPanel, event )
							return 
						else
							LeftPanel:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
							LeftPanel:setTopBottom( true, false, 573, 84 )
							LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame4 )
						end
					end
					
					if event.interrupted then
						LeftPanelFrame3( LeftPanel, event )
						return 
					else
						LeftPanel:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						LeftPanel:setLeftRight( false, false, -576, 117.5 )
						LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame3 )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( false, false, -576, -262 )
				self.LeftPanel:setTopBottom( true, false, 78, 84 )
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				Backing:beginAnimation( "keyframe", 1039, false, false, CoD.TweenType.Linear )
				Backing:setAlpha( 0.45 )
				Backing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					local chooseClassWidgetFrame3 = function ( chooseClassWidget, event )
						local chooseClassWidgetFrame4 = function ( chooseClassWidget, event )
							if not event.interrupted then
								chooseClassWidget:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Bounce )
							end
							chooseClassWidget:setLeftRight( false, false, -244.5, 96.5 )
							chooseClassWidget:setTopBottom( true, false, 80, 668 )
							chooseClassWidget:setAlpha( 1 )
							chooseClassWidget:setZoom( 0 )
							if event.interrupted then
								self.clipFinished( chooseClassWidget, event )
							else
								chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							chooseClassWidgetFrame4( chooseClassWidget, event )
							return 
						else
							chooseClassWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
							chooseClassWidget:setAlpha( 1 )
							chooseClassWidget:registerEventHandler( "transition_complete_keyframe", chooseClassWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						chooseClassWidgetFrame3( chooseClassWidget, event )
						return 
					else
						chooseClassWidget:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", chooseClassWidgetFrame3 )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( false, false, -244.5, 96.5 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 668 )
				self.chooseClassWidget:setAlpha( 0 )
				self.chooseClassWidget:setZoom( 0 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local CategoryListLineFrame2 = function ( CategoryListLine, event )
					if not event.interrupted then
						CategoryListLine:beginAnimation( "keyframe", 1039, false, true, CoD.TweenType.Linear )
					end
					CategoryListLine:setLeftRight( true, true, -11, 13 )
					CategoryListLine:setTopBottom( true, false, 80, 88 )
					if event.interrupted then
						self.clipFinished( CategoryListLine, event )
					else
						CategoryListLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setLeftRight( true, true, -11, -1278 )
				self.CategoryListLine:setTopBottom( true, false, 80, 88 )
				CategoryListLineFrame2( CategoryListLine, {} )
				cacElemsSideListCustomClass0:completeAnimation()
				self.cacElemsSideListCustomClass0:setLeftRight( false, false, -621, 117.5 )
				self.cacElemsSideListCustomClass0:setTopBottom( true, false, -12, 658 )
				self.clipFinished( cacElemsSideListCustomClass0, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( false, false, 71, 921 )
				self.CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
				self.clipFinished( CustomClasspreviewWidget, {} )
			end,
			Back = function ()
				self:setupElementClipCounter( 5 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					local LeftPanelFrame3 = function ( LeftPanel, event )
						local LeftPanelFrame4 = function ( LeftPanel, event )
							if not event.interrupted then
								LeftPanel:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Linear )
							end
							LeftPanel:setLeftRight( false, false, -576, 117.5 )
							LeftPanel:setTopBottom( true, false, 756, 84 )
							LeftPanel:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( LeftPanel, event )
							else
								LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LeftPanelFrame4( LeftPanel, event )
							return 
						else
							LeftPanel:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
							LeftPanel:setTopBottom( true, false, 573, 84 )
							LeftPanel:setAlpha( 0.5 )
							LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame4 )
						end
					end
					
					if event.interrupted then
						LeftPanelFrame3( LeftPanel, event )
						return 
					else
						LeftPanel:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						LeftPanel:setLeftRight( false, false, -576, 117.5 )
						LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame3 )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( false, false, -576, -262 )
				self.LeftPanel:setTopBottom( true, false, 78, 84 )
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					if not event.interrupted then
						chooseClassWidget:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
					end
					chooseClassWidget:setLeftRight( false, false, -244.5, 96.5 )
					chooseClassWidget:setTopBottom( true, false, 80, 663 )
					chooseClassWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( chooseClassWidget, event )
					else
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( false, false, -244.5, 96.5 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 684 )
				self.chooseClassWidget:setAlpha( 1 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local CategoryListLineFrame2 = function ( CategoryListLine, event )
					if not event.interrupted then
						CategoryListLine:beginAnimation( "keyframe", 1039, false, true, CoD.TweenType.Linear )
					end
					CategoryListLine:setLeftRight( true, true, -11, 13 )
					CategoryListLine:setTopBottom( true, false, 80, 88 )
					if event.interrupted then
						self.clipFinished( CategoryListLine, event )
					else
						CategoryListLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setLeftRight( true, true, -11, -1278 )
				self.CategoryListLine:setTopBottom( true, false, 80, 88 )
				CategoryListLineFrame2( CategoryListLine, {} )
				cacElemsSideListCustomClass0:completeAnimation()
				self.cacElemsSideListCustomClass0:setLeftRight( false, false, -621, 108 )
				self.cacElemsSideListCustomClass0:setTopBottom( true, false, -12, 658 )
				self.clipFinished( cacElemsSideListCustomClass0, {} )
				local CustomClasspreviewWidgetFrame2 = function ( CustomClasspreviewWidget, event )
					if not event.interrupted then
						CustomClasspreviewWidget:beginAnimation( "keyframe", 370, true, false, CoD.TweenType.Linear )
					end
					CustomClasspreviewWidget:setLeftRight( false, false, 73, 923 )
					CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
					CustomClasspreviewWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CustomClasspreviewWidget, event )
					else
						CustomClasspreviewWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( false, false, -210, 640 )
				self.CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
				self.CustomClasspreviewWidget:setAlpha( 1 )
				CustomClasspreviewWidgetFrame2( CustomClasspreviewWidget, {} )
			end,
			Close = function ()
				self:setupElementClipCounter( 35 )
				blackimage:completeAnimation()
				self.blackimage:setAlpha( 0 )
				self.clipFinished( blackimage, {} )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				blackImage:completeAnimation()
				self.blackImage:setAlpha( 0 )
				self.clipFinished( blackImage, {} )
				Texture:completeAnimation()
				self.Texture:setAlpha( 0 )
				self.clipFinished( Texture, {} )
				cacBlackFadeIn:completeAnimation()
				self.cacBlackFadeIn:setAlpha( 0 )
				self.clipFinished( cacBlackFadeIn, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				self.clipFinished( LeftPanel, {} )
				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setAlpha( 0 )
				self.clipFinished( chooseClassWidget, {} )
				GenericMenuFrame0:completeAnimation()
				self.GenericMenuFrame0:setAlpha( 0 )
				self.clipFinished( GenericMenuFrame0, {} )
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setAlpha( 0 )
				self.clipFinished( CategoryListLine, {} )
				cacElemsSideListCustomClass0:completeAnimation()
				self.cacElemsSideListCustomClass0:setAlpha( 0 )
				self.clipFinished( cacElemsSideListCustomClass0, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setAlpha( 0 )
				self.clipFinished( CustomClasspreviewWidget, {} )
				PregameTimerOverlay:completeAnimation()
				self.PregameTimerOverlay:setAlpha( 0 )
				self.clipFinished( PregameTimerOverlay, {} )
				BeginCombatImmersion:completeAnimation()
				self.BeginCombatImmersion:setAlpha( 0 )
				self.clipFinished( BeginCombatImmersion, {} )
				CustomizeLoadout:completeAnimation()
				self.CustomizeLoadout:setAlpha( 0 )
				self.clipFinished( CustomizeLoadout, {} )
				combatImmersionDesc:completeAnimation()
				self.combatImmersionDesc:setAlpha( 0 )
				self.clipFinished( combatImmersionDesc, {} )
				cacTrainingSimNameLabel0:completeAnimation()
				self.cacTrainingSimNameLabel0:setAlpha( 0 )
				self.clipFinished( cacTrainingSimNameLabel0, {} )
				immersionOverviewFight:completeAnimation()
				self.immersionOverviewFight:setAlpha( 0 )
				self.clipFinished( immersionOverviewFight, {} )
				immersionOverviewScoreBonus:completeAnimation()
				self.immersionOverviewScoreBonus:setAlpha( 0 )
				self.clipFinished( immersionOverviewScoreBonus, {} )
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				self.clipFinished( FEButtonPanel0, {} )
				bestScoreTitle:completeAnimation()
				self.bestScoreTitle:setAlpha( 0 )
				self.clipFinished( bestScoreTitle, {} )
				FEButtonPanel00:completeAnimation()
				self.FEButtonPanel00:setAlpha( 0 )
				self.clipFinished( FEButtonPanel00, {} )
				highestRoundTitle:completeAnimation()
				self.highestRoundTitle:setAlpha( 0 )
				self.clipFinished( highestRoundTitle, {} )
				highestRound:completeAnimation()
				self.highestRound:setAlpha( 0 )
				self.clipFinished( highestRound, {} )
				bestScore:completeAnimation()
				self.bestScore:setAlpha( 0 )
				self.clipFinished( bestScore, {} )
				HighestScoreStroke:completeAnimation()
				self.HighestScoreStroke:setAlpha( 0 )
				self.clipFinished( HighestScoreStroke, {} )
				BestScoreStroke:completeAnimation()
				self.BestScoreStroke:setAlpha( 0 )
				self.clipFinished( BestScoreStroke, {} )
				SecTitleBG:completeAnimation()
				self.SecTitleBG:setAlpha( 0 )
				self.clipFinished( SecTitleBG, {} )
				SecTitleBG0:completeAnimation()
				self.SecTitleBG0:setAlpha( 0 )
				self.clipFinished( SecTitleBG0, {} )
				LineDot:completeAnimation()
				self.LineDot:setAlpha( 0 )
				self.clipFinished( LineDot, {} )
				LineDot1:completeAnimation()
				self.LineDot1:setAlpha( 0 )
				self.clipFinished( LineDot1, {} )
				List0:completeAnimation()
				self.List0:setAlpha( 0 )
				self.clipFinished( List0, {} )
				SecTitleBG00:completeAnimation()
				self.SecTitleBG00:setAlpha( 0 )
				self.clipFinished( SecTitleBG00, {} )
				SecTitleBG1:completeAnimation()
				self.SecTitleBG1:setAlpha( 0 )
				self.clipFinished( SecTitleBG1, {} )
				cacTrainingSimNameLabel00:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				cacTrainingSimNameLabel00:setAlpha( 0 )
				cacTrainingSimNameLabel00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end
		},
		Campaign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		DisableCustomizedLoadout = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f39_local0 = nil
		if TestAndSetFirstTimeMenu( controller, "com_firsttime_combattraining" ) then
			OpenGenericLargePopup( self, controller, "MENU_FIRSTTIME_COMBATTRAINING", "MENU_FIRSTTIME_COMBATTRAINING2", "com_firsttime_combattraining_image", "MENU_FIRSTTIME_COMBATTRAINING_BUTTONTEXT", "", "" )
			DisableProgressionCP( controller )
		else
			SetElementStateByElementName( self, "background", controller, "Intro" )
			PlayClipOnElement( self, {
				elementName = "cacElemsSideListCustomClass0",
				clipName = "Intro"
			}, controller )
			PlayClip( self, "Intro", controller )
			SaveLoadout( self, controller )
			UploadStats( self, controller )
			DisableProgressionCP( controller )
		end
		if not f39_local0 then
			f39_local0 = self:dispatchEventToChildren( event )
		end
		return f39_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f40_local0 = nil
		SetElementStateByElementName( self, "background", controller, "Update" )
		PlayClip( self, "Back", controller )
		SendClientScriptMenuChangeNotify( controller, self, true )
		PlayClipOnElement( self, {
			elementName = "cacBlackFadeIn",
			clipName = "Intro"
		}, controller )
		ShowHeaderKickerAndIcon( self )
		PrepareOpenMenuInSafehouse( controller )
		SetHeadingKickerText( "MENU_CAMPAIGN" )
		SetCustomClassNum_TrainingSim( self, self, controller )
		if not f40_local0 then
			f40_local0 = self:dispatchEventToChildren( event )
		end
		return f40_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendOwnMenuResponse( menu, controller, "cancel" )
		ClearSavedState( self, controller )
		PrepareCloseMenuInSafehouse( controller )
		SaveLoadout( self, controller )
		UploadStats( self, controller )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		CloseChangeClass_TrainingSim( self, element, controller )
		EnableProgressionCP( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	chooseClassWidget.id = "chooseClassWidget"
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	BeginCombatImmersion.id = "BeginCombatImmersion"
	CustomizeLoadout.id = "CustomizeLoadout"
	List0.id = "List0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.CustomizeLoadout:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Texture:close()
		element.cacBlackFadeIn:close()
		element.LeftPanel:close()
		element.chooseClassWidget:close()
		element.GenericMenuFrame0:close()
		element.cacElemsSideListCustomClass0:close()
		element.CustomClasspreviewWidget:close()
		element.PregameTimerOverlay:close()
		element.BeginCombatImmersion:close()
		element.CustomizeLoadout:close()
		element.cacTrainingSimNameLabel0:close()
		element.FEButtonPanel0:close()
		element.FEButtonPanel00:close()
		element.HighestScoreStroke:close()
		element.BestScoreStroke:close()
		element.List0:close()
		element.cacTrainingSimNameLabel00:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "chooseClass_TrainingSim.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

