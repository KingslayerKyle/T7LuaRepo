-- d5e8d72db6b19af0bbaa388b1f29506a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.CP.StartMenu_list1buttonGameOptions" )
require( "ui.uieditor.widgets.Utilities.ProgressBar_Rank" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Objectives" )
require( "ui.uieditor.widgets.NetworkStats.NetworkStatsRowWidgetContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_ScoreAndMissionRunTime" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Collectables" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_DifficultyIcon" )
require( "ui.uieditor.widgets.StartMenu.Startmenu_MapLocationDate" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Heading" )

CoD.StartMenu_GameOptions_CP = InheritFrom( LUI.UIElement )
CoD.StartMenu_GameOptions_CP.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_GameOptions_CP )
	self.id = "StartMenu_GameOptions_CP"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local buttonList = LUI.UIList.new( menu, controller, 4, 0, nil, false, false, 0, 0, false, false )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 1, 245 )
	buttonList:setTopBottom( true, false, 102, 278 )
	buttonList:setWidgetType( CoD.StartMenu_list1buttonGameOptions )
	buttonList:setVerticalCount( 5 )
	buttonList:setSpacing( 4 )
	buttonList:setDataSource( "StartMenuGameOptions" )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		ProcessListAction( self, f4_arg0, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local rankProgress = CoD.ProgressBar_Rank.new( menu, controller )
	rankProgress:setLeftRight( true, false, 1, 1117.51 )
	rankProgress:setTopBottom( true, false, 454, 520 )
	rankProgress:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	rankProgress:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "XPProgressionBar.nextRank" ), function ( model )
		menu:updateElementState( rankProgress, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "XPProgressionBar.nextRank"
		} )
	end )
	rankProgress:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( rankProgress, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( rankProgress )
	self.rankProgress = rankProgress
	
	local StartMenuObjectives = CoD.StartMenu_Objectives.new( menu, controller )
	StartMenuObjectives:setLeftRight( true, false, 333, 796 )
	StartMenuObjectives:setTopBottom( true, false, 93, 482 )
	StartMenuObjectives:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsCampaign()
			end
		}
	} )
	StartMenuObjectives:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( StartMenuObjectives, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( StartMenuObjectives )
	self.StartMenuObjectives = StartMenuObjectives
	
	local NetworkStatsRowWidgetContainer0 = CoD.NetworkStatsRowWidgetContainer.new( menu, controller )
	NetworkStatsRowWidgetContainer0:setLeftRight( true, false, 0, 302 )
	NetworkStatsRowWidgetContainer0:setTopBottom( true, false, 341.37, 493.37 )
	NetworkStatsRowWidgetContainer0:setAlpha( 0 )
	self:addElement( NetworkStatsRowWidgetContainer0 )
	self.NetworkStatsRowWidgetContainer0 = NetworkStatsRowWidgetContainer0
	
	local StartMenuScoreAndMissionRunTime = CoD.StartMenu_ScoreAndMissionRunTime.new( menu, controller )
	StartMenuScoreAndMissionRunTime:setLeftRight( true, false, 852.51, 951.9 )
	StartMenuScoreAndMissionRunTime:setTopBottom( true, false, 180.37, 240.37 )
	self:addElement( StartMenuScoreAndMissionRunTime )
	self.StartMenuScoreAndMissionRunTime = StartMenuScoreAndMissionRunTime
	
	local StartMenuCollectables = CoD.StartMenu_Collectables.new( menu, controller )
	StartMenuCollectables:setLeftRight( true, false, 850.51, 1106.76 )
	StartMenuCollectables:setTopBottom( true, false, 252.23, 444.61 )
	StartMenuCollectables:mergeStateConditions( {
		{
			stateName = "CP_PauseMenu",
			condition = function ( menu, element, event )
				return IsCampaign() and not IsCPAndInSafehouse()
			end
		},
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	StartMenuCollectables:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( StartMenuCollectables, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( StartMenuCollectables )
	self.StartMenuCollectables = StartMenuCollectables
	
	local StartMenuDifficultyIcon0 = CoD.StartMenu_DifficultyIcon.new( menu, controller )
	StartMenuDifficultyIcon0:setLeftRight( true, false, 1000, 1097 )
	StartMenuDifficultyIcon0:setTopBottom( true, false, 173, 245 )
	self:addElement( StartMenuDifficultyIcon0 )
	self.StartMenuDifficultyIcon0 = StartMenuDifficultyIcon0
	
	local TitleBG = LUI.UIImage.new()
	TitleBG:setLeftRight( true, false, -85.5, 1237.5 )
	TitleBG:setTopBottom( true, false, 5, 75 )
	TitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_pri_title_bg" ) )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local StartmenuMapLocationDate = CoD.Startmenu_MapLocationDate.new( menu, controller )
	StartmenuMapLocationDate:setLeftRight( true, false, 10, 313.59 )
	StartmenuMapLocationDate:setTopBottom( true, false, 43, 75 )
	self:addElement( StartmenuMapLocationDate )
	self.StartmenuMapLocationDate = StartmenuMapLocationDate
	
	local Title = CoD.MissionRecordVault_Heading.new( menu, controller )
	Title:setLeftRight( true, false, -9, 1278 )
	Title:setTopBottom( true, false, -3, 100 )
	Title:subscribeToGlobalModel( controller, "MapInfo", "mapName", function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			Title.Title:setText( Engine.Localize( mapName ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local SecTitleBG = LUI.UIImage.new()
	SecTitleBG:setLeftRight( true, false, 811, 1264 )
	SecTitleBG:setTopBottom( true, false, 94, 142 )
	SecTitleBG:setAlpha( 0.65 )
	SecTitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG )
	self.SecTitleBG = SecTitleBG
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 815, 843 )
	Image3:setTopBottom( true, false, 93, 97 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 815, 843 )
	Image30:setTopBottom( true, false, 138, 142 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 850, 1105.76 )
	Label0:setTopBottom( true, false, 107, 129 )
	Label0:setText( Engine.Localize( "MENU_PERFORMANCE_CAPS" ) )
	Label0:setTTF( "fonts/escom.ttf" )
	Label0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Label0:setShaderVector( 0, 0.06, 0, 0, 0 )
	Label0:setShaderVector( 1, 0.02, 0, 0, 0 )
	Label0:setShaderVector( 2, 1, 0, 0, 0 )
	Label0:setLetterSpacing( 2 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Score = LUI.UIText.new()
	Score:setLeftRight( true, false, 851.76, 950.9 )
	Score:setTopBottom( true, false, 143.25, 165.25 )
	Score:setRGB( 0.95, 0.89, 0.03 )
	Score:setText( Engine.Localize( "MPUI_SCORE_CAPS" ) )
	Score:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Score:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Score:setShaderVector( 0, 0.06, 0, 0, 0 )
	Score:setShaderVector( 1, 0.02, 0, 0, 0 )
	Score:setShaderVector( 2, 1, 0, 0, 0 )
	Score:setLetterSpacing( 1 )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Score )
	self.Score = Score
	
	local line0 = LUI.UIImage.new()
	line0:setLeftRight( true, false, 959.9, 960.9 )
	line0:setTopBottom( true, false, 188.16, 222.16 )
	line0:setAlpha( 0.5 )
	self:addElement( line0 )
	self.line0 = line0
	
	local DifficultyCompleteText = LUI.UIText.new()
	DifficultyCompleteText:setLeftRight( true, false, 999, 1105.76 )
	DifficultyCompleteText:setTopBottom( true, false, 143, 165 )
	DifficultyCompleteText:setRGB( 0.95, 0.89, 0.03 )
	DifficultyCompleteText:setText( Engine.Localize( "MENU_DIFFICULTY_CAPS" ) )
	DifficultyCompleteText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	DifficultyCompleteText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	DifficultyCompleteText:setShaderVector( 0, 0.06, 0, 0, 0 )
	DifficultyCompleteText:setShaderVector( 1, 0.02, 0, 0, 0 )
	DifficultyCompleteText:setShaderVector( 2, 1, 0, 0, 0 )
	DifficultyCompleteText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DifficultyCompleteText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DifficultyCompleteText )
	self.DifficultyCompleteText = DifficultyCompleteText
	
	buttonList.navigation = {
		right = StartMenuObjectives
	}
	StartMenuObjectives.navigation = {
		left = buttonList,
		right = StartMenuCollectables
	}
	StartMenuCollectables.navigation = {
		left = StartMenuObjectives
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				StartMenuScoreAndMissionRunTime:completeAnimation()
				self.StartMenuScoreAndMissionRunTime:setAlpha( 1 )
				self.clipFinished( StartMenuScoreAndMissionRunTime, {} )

				line0:completeAnimation()
				self.line0:setAlpha( 0.5 )
				self.clipFinished( line0, {} )
			end
		},
		cpzm = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				rankProgress:completeAnimation()
				self.rankProgress:setAlpha( 0 )
				self.clipFinished( rankProgress, {} )

				StartMenuObjectives:completeAnimation()
				self.StartMenuObjectives:setAlpha( 0 )
				self.clipFinished( StartMenuObjectives, {} )

				StartMenuCollectables:completeAnimation()
				self.StartMenuCollectables:setAlpha( 0 )
				self.clipFinished( StartMenuCollectables, {} )
			end
		},
		hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				StartMenuScoreAndMissionRunTime:completeAnimation()
				self.StartMenuScoreAndMissionRunTime:setAlpha( 0 )
				self.clipFinished( StartMenuScoreAndMissionRunTime, {} )

				StartMenuDifficultyIcon0:completeAnimation()
				self.StartMenuDifficultyIcon0:setLeftRight( true, false, 849.51, 946.51 )
				self.StartMenuDifficultyIcon0:setTopBottom( true, false, 170.25, 242.25 )
				self.clipFinished( StartMenuDifficultyIcon0, {} )

				Score:completeAnimation()
				self.Score:setAlpha( 0 )
				self.clipFinished( Score, {} )

				line0:completeAnimation()
				self.line0:setAlpha( 0 )
				self.clipFinished( line0, {} )

				DifficultyCompleteText:completeAnimation()
				self.DifficultyCompleteText:setLeftRight( true, false, 853.14, 959.9 )
				self.DifficultyCompleteText:setTopBottom( true, false, 146.25, 168.25 )
				self.clipFinished( DifficultyCompleteText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "cpzm",
			condition = function ( menu, element, event )
				return IsCampaignZombies()
			end
		},
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return IsCPAndInSafehouse()
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	buttonList.id = "buttonList"
	StartMenuObjectives.id = "StartMenuObjectives"
	StartMenuCollectables.id = "StartMenuCollectables"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.buttonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttonList:close()
		element.rankProgress:close()
		element.StartMenuObjectives:close()
		element.NetworkStatsRowWidgetContainer0:close()
		element.StartMenuScoreAndMissionRunTime:close()
		element.StartMenuCollectables:close()
		element.StartMenuDifficultyIcon0:close()
		element.StartmenuMapLocationDate:close()
		element.Title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
