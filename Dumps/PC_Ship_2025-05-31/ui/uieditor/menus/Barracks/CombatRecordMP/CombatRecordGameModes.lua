require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordFriendSidebar" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordLeftTitleWithBackground" )
require( "ui.uieditor.widgets.Barracks.CombatRecordGameModeStat" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Barracks.CombatRecordWinnersCircleStat" )
require( "ui.uieditor.widgets.Barracks.CombatRecordComparingPlayerInfo" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatRing" )

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

LUI.createMenu.CombatRecordGameModes = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordGameModes" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordGameModes.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
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
	BlackBG:setAlpha( 0.9 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( false, false, -576, -265 )
	BlackTint:setTopBottom( false, false, -276, 302 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CHALLENGES_GAME_MODES" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CHALLENGES_GAME_MODES" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_logowhite" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ItemList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ItemList:makeFocusable()
	ItemList:setLeftRight( true, false, 81, 361 )
	ItemList:setTopBottom( true, false, 157.5, 625.5 )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	ItemList:setDataSource( "CombatRecordGameModeList" )
	ItemList:subscribeToGlobalModel( controller, "OtherPlayerStats", "InProgress", function ( model )
		UpdateDataSource( self, ItemList, controller )
	end )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local WeaponLabel = LUI.UITightText.new()
	WeaponLabel:setLeftRight( true, false, 81, 128 )
	WeaponLabel:setTopBottom( true, false, 123, 148 )
	WeaponLabel:setText( Engine.Localize( "MENU_GAME_MODE_CAPS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( true, false, 247, 429 )
	StatLabel:setTopBottom( true, false, 123, 148 )
	StatLabel:setText( Engine.Localize( "MENU_WINS_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local WinsStat = CoD.CombatRecordStatHeader.new( self, controller )
	WinsStat:setLeftRight( true, false, 816, 940 )
	WinsStat:setTopBottom( true, false, 157.5, 213.5 )
	WinsStat.StatLabel:setText( Engine.Localize( "MENU_WINS_CAPS" ) )
	self:addElement( WinsStat )
	self.WinsStat = WinsStat
	
	local KDRatioStat = CoD.CombatRecordStatHeader.new( self, controller )
	KDRatioStat:setLeftRight( true, false, 940, 1064 )
	KDRatioStat:setTopBottom( true, false, 157.5, 213.5 )
	KDRatioStat.StatLabel:setText( Engine.Localize( "MENU_KDRATIO_CAPS" ) )
	self:addElement( KDRatioStat )
	self.KDRatioStat = KDRatioStat
	
	local SPMStat = CoD.CombatRecordStatHeader.new( self, controller )
	SPMStat:setLeftRight( true, false, 1064, 1188 )
	SPMStat:setTopBottom( true, false, 157.5, 213.5 )
	SPMStat.StatLabel:setText( Engine.Localize( "MENU_SPM_SHORT" ) )
	self:addElement( SPMStat )
	self.SPMStat = SPMStat
	
	local GameModeName = CoD.CombatRecordLeftTitleWithBackground.new( self, controller )
	GameModeName:setLeftRight( true, false, 472.29, 629.29 )
	GameModeName:setTopBottom( true, false, 157.5, 187.5 )
	self:addElement( GameModeName )
	self.GameModeName = GameModeName
	
	local RecordLabel = LUI.UIText.new()
	RecordLabel:setLeftRight( false, true, -318.01, -154 )
	RecordLabel:setTopBottom( true, false, 286.5, 310.5 )
	RecordLabel:setText( Engine.Localize( "MENU_COMBAT_RECORD_RECORD" ) )
	RecordLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	RecordLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RecordLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RecordLabel )
	self.RecordLabel = RecordLabel
	
	local Streak = CoD.CombatRecordGameModeStat.new( self, controller )
	Streak:setLeftRight( false, true, -320.01, -154 )
	Streak:setTopBottom( true, false, 375, 409 )
	Streak.WinsColorImage:setRGB( 1, 0.12, 0 )
	Streak.WinsLabel:setText( Engine.Localize( "MENU_STREAK" ) )
	self:addElement( Streak )
	self.Streak = Streak
	
	local LossRecord = CoD.CombatRecordGameModeStat.new( self, controller )
	LossRecord:setLeftRight( false, true, -320.01, -154 )
	LossRecord:setTopBottom( true, false, 343, 377 )
	LossRecord.WinsColorImage:setRGB( 0.38, 0.38, 0.38 )
	LossRecord.WinsLabel:setText( Engine.Localize( "MPUI_LOSSES" ) )
	self:addElement( LossRecord )
	self.LossRecord = LossRecord
	
	local WinsRecord = CoD.CombatRecordGameModeStat.new( self, controller )
	WinsRecord:setLeftRight( false, true, -320.01, -154 )
	WinsRecord:setTopBottom( true, false, 311.5, 345.5 )
	WinsRecord.WinsLabel:setText( Engine.Localize( "MENU_WINS" ) )
	self:addElement( WinsRecord )
	self.WinsRecord = WinsRecord
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( self, controller )
	StartMenuframenoBG0:setLeftRight( false, false, -252.5, -167.71 )
	StartMenuframenoBG0:setTopBottom( false, false, -204.5, -119.95 )
	StartMenuframenoBG0:setAlpha( 0.8 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local GameModeImage = LUI.UIImage.new()
	GameModeImage:setLeftRight( true, false, 394.04, 467 )
	GameModeImage:setTopBottom( true, false, 160.5, 233.42 )
	self:addElement( GameModeImage )
	self.GameModeImage = GameModeImage
	
	local WinnersCircleLabel = LUI.UIText.new()
	WinnersCircleLabel:setLeftRight( false, true, -256.01, -92 )
	WinnersCircleLabel:setTopBottom( true, false, 435.63, 459.63 )
	WinnersCircleLabel:setAlpha( 0 )
	WinnersCircleLabel:setText( Engine.Localize( "MENU_TIMES_IN_WINNERS_CIRCLE" ) )
	WinnersCircleLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	WinnersCircleLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WinnersCircleLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WinnersCircleLabel )
	self.WinnersCircleLabel = WinnersCircleLabel
	
	local Place3Record = CoD.CombatRecordWinnersCircleStat.new( self, controller )
	Place3Record:setLeftRight( false, true, -148.01, -93.01 )
	Place3Record:setTopBottom( true, false, 461.63, 563.63 )
	Place3Record:setAlpha( 0 )
	Place3Record.RibbonImage:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon3" ) )
	Place3Record.StatValue:setText( Engine.Localize( "888" ) )
	self:addElement( Place3Record )
	self.Place3Record = Place3Record
	
	local Place2Record = CoD.CombatRecordWinnersCircleStat.new( self, controller )
	Place2Record:setLeftRight( false, true, -203.01, -148.01 )
	Place2Record:setTopBottom( true, false, 461.63, 563.63 )
	Place2Record:setAlpha( 0 )
	Place2Record.RibbonImage:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon2" ) )
	Place2Record.StatValue:setText( Engine.Localize( "888" ) )
	self:addElement( Place2Record )
	self.Place2Record = Place2Record
	
	local Place1Record = CoD.CombatRecordWinnersCircleStat.new( self, controller )
	Place1Record:setLeftRight( false, true, -258.01, -203.01 )
	Place1Record:setTopBottom( true, false, 461.63, 563.63 )
	Place1Record:setAlpha( 0 )
	Place1Record.RibbonImage:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon1" ) )
	Place1Record.StatValue:setText( Engine.Localize( "888" ) )
	self:addElement( Place1Record )
	self.Place1Record = Place1Record
	
	local CombatRecordComparingPlayerInfo = CoD.CombatRecordComparingPlayerInfo.new( self, controller )
	CombatRecordComparingPlayerInfo:setLeftRight( false, true, -870, -458 )
	CombatRecordComparingPlayerInfo:setTopBottom( true, false, 23, 83 )
	self:addElement( CombatRecordComparingPlayerInfo )
	self.CombatRecordComparingPlayerInfo = CombatRecordComparingPlayerInfo
	
	local CombatRecordStatRing = CoD.CombatRecordStatRing.new( self, controller )
	CombatRecordStatRing:setLeftRight( true, false, 568, 824 )
	CombatRecordStatRing:setTopBottom( true, false, 293.63, 549.63 )
	CombatRecordStatRing.WLRatioLabel:setText( Engine.Localize( "MENU_WLRATIO_CAPS" ) )
	self:addElement( CombatRecordStatRing )
	self.CombatRecordStatRing = CombatRecordStatRing
	
	WinsStat:linkToElementModel( ItemList, "stat", true, function ( model )
		local stat = Engine.GetModelValue( model )
		if stat then
			WinsStat.StatValue:setText( Engine.Localize( stat ) )
		end
	end )
	WinsStat:linkToElementModel( ItemList, "statComparison", true, function ( model )
		local statComparison = Engine.GetModelValue( model )
		if statComparison then
			WinsStat.ComparedStatValue:setText( Engine.Localize( statComparison ) )
		end
	end )
	KDRatioStat:linkToElementModel( ItemList, "kdRatio", true, function ( model )
		local kdRatio = Engine.GetModelValue( model )
		if kdRatio then
			KDRatioStat.StatValue:setText( Engine.Localize( kdRatio ) )
		end
	end )
	KDRatioStat:linkToElementModel( ItemList, "kdRatioComparison", true, function ( model )
		local kdRatioComparison = Engine.GetModelValue( model )
		if kdRatioComparison then
			KDRatioStat.ComparedStatValue:setText( Engine.Localize( kdRatioComparison ) )
		end
	end )
	SPMStat:linkToElementModel( ItemList, "spm", true, function ( model )
		local spm = Engine.GetModelValue( model )
		if spm then
			SPMStat.StatValue:setText( Engine.Localize( spm ) )
		end
	end )
	SPMStat:linkToElementModel( ItemList, "spmComparison", true, function ( model )
		local spmComparison = Engine.GetModelValue( model )
		if spmComparison then
			SPMStat.ComparedStatValue:setText( Engine.Localize( spmComparison ) )
		end
	end )
	GameModeName:linkToElementModel( ItemList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			GameModeName.Label:setText( Engine.Localize( name ) )
		end
	end )
	Streak:linkToElementModel( ItemList, "streak", true, function ( model )
		local streak = Engine.GetModelValue( model )
		if streak then
			Streak.StatValue:setText( Engine.Localize( streak ) )
		end
	end )
	Streak:linkToElementModel( ItemList, "streakComparison", true, function ( model )
		local streakComparison = Engine.GetModelValue( model )
		if streakComparison then
			Streak.StatComparisonValue:setText( Engine.Localize( streakComparison ) )
		end
	end )
	LossRecord:linkToElementModel( ItemList, "losses", true, function ( model )
		local losses = Engine.GetModelValue( model )
		if losses then
			LossRecord.StatValue:setText( Engine.Localize( losses ) )
		end
	end )
	LossRecord:linkToElementModel( ItemList, "lossesComparison", true, function ( model )
		local lossesComparison = Engine.GetModelValue( model )
		if lossesComparison then
			LossRecord.StatComparisonValue:setText( Engine.Localize( lossesComparison ) )
		end
	end )
	WinsRecord:linkToElementModel( ItemList, "stat", true, function ( model )
		local stat = Engine.GetModelValue( model )
		if stat then
			WinsRecord.StatValue:setText( Engine.Localize( stat ) )
		end
	end )
	WinsRecord:linkToElementModel( ItemList, "statComparison", true, function ( model )
		local statComparison = Engine.GetModelValue( model )
		if statComparison then
			WinsRecord.StatComparisonValue:setText( Engine.Localize( statComparison ) )
		end
	end )
	GameModeImage:linkToElementModel( ItemList, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			GameModeImage:setImage( RegisterImage( image ) )
		end
	end )
	CombatRecordStatRing:linkToElementModel( ItemList, "wlRatio", true, function ( model )
		local wlRatio = Engine.GetModelValue( model )
		if wlRatio then
			CombatRecordStatRing.StatValue:setText( Engine.Localize( wlRatio ) )
		end
	end )
	CombatRecordStatRing:linkToElementModel( ItemList, "lossRingFrac", true, function ( model )
		local lossRingFrac = Engine.GetModelValue( model )
		if lossRingFrac then
			CombatRecordStatRing.LossRing:setShaderVector( 0, CoD.GetVectorComponentFromString( lossRingFrac, 1 ), CoD.GetVectorComponentFromString( lossRingFrac, 2 ), CoD.GetVectorComponentFromString( lossRingFrac, 3 ), CoD.GetVectorComponentFromString( lossRingFrac, 4 ) )
		end
	end )
	CombatRecordStatRing:linkToElementModel( ItemList, "wlRatioComparison", true, function ( model )
		local wlRatioComparison = Engine.GetModelValue( model )
		if wlRatioComparison then
			CombatRecordStatRing.ComparisonStatValue:setText( Engine.Localize( wlRatioComparison ) )
		end
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordComparing" ), function ( model )
		local f22_local0 = self
		local f22_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CombatRecordComparing"
		}
		CoD.Menu.UpdateButtonShownState( f22_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" ), function ( model )
		local f23_local0 = self
		local f23_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.InProgress"
		}
		CoD.Menu.UpdateButtonShownState( f23_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" ), function ( model )
		local f24_local0 = self
		local f24_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.Success"
		}
		CoD.Menu.UpdateButtonShownState( f24_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f25_local0 = nil
		ShowHeaderKickerAndIcon( self )
		CombatRecordSetHeadingKickerTextToCombatRecordMode( "" )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not f25_local0 then
			f25_local0 = self:dispatchEventToChildren( event )
		end
		return f25_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		CombatRecordSetComparing( self, controller, false )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "F", function ( element, menu, controller, model )
		if EnableCombatRecordCompare( controller ) and not IsCombatRecordForRemotePlayer() then
			OpenPopup( self, "CombatRecordFriendSidebar", controller )
			return true
		elseif EnableCombatRecordCompare( controller ) and IsCombatRecordForRemotePlayer() then
			CombatRecordSetComparing( self, controller, true )
			CombatRecordCompareAgainstLocalPlayer( controller )
			UpdateElementDataSource( self, "ItemList" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if EnableCombatRecordCompare( controller ) and not IsCombatRecordForRemotePlayer() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_COMPARE" )
			return true
		elseif EnableCombatRecordCompare( controller ) and IsCombatRecordForRemotePlayer() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_COMPARE" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "C", function ( element, menu, controller, model )
		if IsComparingStats( controller ) then
			CombatRecordSetComparing( self, controller, false )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsComparingStats( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_CLEAR_COMPARE" )
			return true
		else
			return false
		end
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	ItemList.id = "ItemList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ItemList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.ItemList:close()
		element.WinsStat:close()
		element.KDRatioStat:close()
		element.SPMStat:close()
		element.GameModeName:close()
		element.Streak:close()
		element.LossRecord:close()
		element.WinsRecord:close()
		element.StartMenuframenoBG0:close()
		element.Place3Record:close()
		element.Place2Record:close()
		element.Place1Record:close()
		element.CombatRecordComparingPlayerInfo:close()
		element.CombatRecordStatRing:close()
		element.GameModeImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordGameModes.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

