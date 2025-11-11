require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordFriendSidebar" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Barracks.CombatRecordComparingPlayerInfo" )
require( "ui.uieditor.widgets.Barracks.CombatRecordGameModeStat" )
require( "ui.uieditor.widgets.Barracks.CombatRecordLeftTitleWithBackground" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListItem" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatRing" )
require( "ui.uieditor.widgets.Barracks.CombatRecordWinnersCircleStat" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordGameModes.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	StartMenuBackground0:setLeftRight( 0, 1, 0, 0 )
	StartMenuBackground0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setAlpha( 0.9 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0.5, 0.5, -864, -398 )
	BlackTint:setTopBottom( 0.5, 0.5, -414, 453 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 27, 105 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 136, 1062 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CHALLENGES_GAME_MODES" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CHALLENGES_GAME_MODES" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_logowhite" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ItemList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ItemList:makeFocusable()
	ItemList:setLeftRight( 0, 0, 122, 542 )
	ItemList:setTopBottom( 0, 0, 243, 931 )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	ItemList:setDataSource( "CombatRecordGameModeList" )
	ItemList:subscribeToGlobalModel( controller, "OtherPlayerStats", "InProgress", function ( model )
		local element = ItemList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local WeaponLabel = LUI.UITightText.new()
	WeaponLabel:setLeftRight( 0, 0, 122, 192 )
	WeaponLabel:setTopBottom( 0, 0, 184, 222 )
	WeaponLabel:setText( Engine.Localize( "MENU_GAME_MODE_CAPS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( 0, 0, 371, 644 )
	StatLabel:setTopBottom( 0, 0, 184, 222 )
	StatLabel:setText( Engine.Localize( "MENU_WINS_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local WinsStat = CoD.CombatRecordStatHeader.new( self, controller )
	WinsStat:setLeftRight( 0, 0, 1224, 1410 )
	WinsStat:setTopBottom( 0, 0, 236, 320 )
	WinsStat.StatLabel:setText( Engine.Localize( "MENU_WINS_CAPS" ) )
	self:addElement( WinsStat )
	self.WinsStat = WinsStat
	
	local KDRatioStat = CoD.CombatRecordStatHeader.new( self, controller )
	KDRatioStat:setLeftRight( 0, 0, 1410, 1596 )
	KDRatioStat:setTopBottom( 0, 0, 236, 320 )
	KDRatioStat.StatLabel:setText( Engine.Localize( "MENU_KDRATIO_CAPS" ) )
	self:addElement( KDRatioStat )
	self.KDRatioStat = KDRatioStat
	
	local SPMStat = CoD.CombatRecordStatHeader.new( self, controller )
	SPMStat:setLeftRight( 0, 0, 1596, 1782 )
	SPMStat:setTopBottom( 0, 0, 236, 320 )
	SPMStat.StatLabel:setText( Engine.Localize( "MENU_SPM_SHORT" ) )
	self:addElement( SPMStat )
	self.SPMStat = SPMStat
	
	local GameModeName = CoD.CombatRecordLeftTitleWithBackground.new( self, controller )
	GameModeName:setLeftRight( 0, 0, 709, 944 )
	GameModeName:setTopBottom( 0, 0, 236, 281 )
	self:addElement( GameModeName )
	self.GameModeName = GameModeName
	
	local RecordLabel = LUI.UIText.new()
	RecordLabel:setLeftRight( 1, 1, -477, -231 )
	RecordLabel:setTopBottom( 0, 0, 430, 466 )
	RecordLabel:setText( Engine.Localize( "MENU_COMBAT_RECORD_RECORD" ) )
	RecordLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	RecordLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RecordLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RecordLabel )
	self.RecordLabel = RecordLabel
	
	local Streak = CoD.CombatRecordGameModeStat.new( self, controller )
	Streak:setLeftRight( 1, 1, -480, -231 )
	Streak:setTopBottom( 0, 0, 562.5, 613.5 )
	Streak.WinsColorImage:setRGB( 1, 0.12, 0 )
	Streak.WinsLabel:setText( Engine.Localize( "MENU_STREAK" ) )
	self:addElement( Streak )
	self.Streak = Streak
	
	local LossRecord = CoD.CombatRecordGameModeStat.new( self, controller )
	LossRecord:setLeftRight( 1, 1, -480, -231 )
	LossRecord:setTopBottom( 0, 0, 514.5, 565.5 )
	LossRecord.WinsColorImage:setRGB( 0.38, 0.38, 0.38 )
	LossRecord.WinsLabel:setText( Engine.Localize( "MPUI_LOSSES" ) )
	self:addElement( LossRecord )
	self.LossRecord = LossRecord
	
	local WinsRecord = CoD.CombatRecordGameModeStat.new( self, controller )
	WinsRecord:setLeftRight( 1, 1, -480, -231 )
	WinsRecord:setTopBottom( 0, 0, 467.5, 518.5 )
	WinsRecord.WinsLabel:setText( Engine.Localize( "MENU_WINS" ) )
	self:addElement( WinsRecord )
	self.WinsRecord = WinsRecord
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( self, controller )
	StartMenuframenoBG0:setLeftRight( 0.5, 0.5, -379, -252 )
	StartMenuframenoBG0:setTopBottom( 0.5, 0.5, -307, -180 )
	StartMenuframenoBG0:setAlpha( 0.8 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local GameModeImage = LUI.UIImage.new()
	GameModeImage:setLeftRight( 0, 0, 591, 700 )
	GameModeImage:setTopBottom( 0, 0, 241, 350 )
	self:addElement( GameModeImage )
	self.GameModeImage = GameModeImage
	
	local WinnersCircleLabel = LUI.UIText.new()
	WinnersCircleLabel:setLeftRight( 1, 1, -384, -138 )
	WinnersCircleLabel:setTopBottom( 0, 0, 653, 689 )
	WinnersCircleLabel:setAlpha( 0 )
	WinnersCircleLabel:setText( Engine.Localize( "MENU_TIMES_IN_WINNERS_CIRCLE" ) )
	WinnersCircleLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	WinnersCircleLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WinnersCircleLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WinnersCircleLabel )
	self.WinnersCircleLabel = WinnersCircleLabel
	
	local Place3Record = CoD.CombatRecordWinnersCircleStat.new( self, controller )
	Place3Record:setLeftRight( 1, 1, -222, -140 )
	Place3Record:setTopBottom( 0, 0, 692.5, 845.5 )
	Place3Record:setAlpha( 0 )
	Place3Record.RibbonImage:setImage( RegisterImage( "t7_hud_mp_notifications_endgame_ribbon3" ) )
	Place3Record.StatValue:setText( Engine.Localize( "888" ) )
	self:addElement( Place3Record )
	self.Place3Record = Place3Record
	
	local Place2Record = CoD.CombatRecordWinnersCircleStat.new( self, controller )
	Place2Record:setLeftRight( 1, 1, -304, -222 )
	Place2Record:setTopBottom( 0, 0, 692.5, 845.5 )
	Place2Record:setAlpha( 0 )
	Place2Record.RibbonImage:setImage( RegisterImage( "t7_hud_mp_notifications_endgame_ribbon2" ) )
	Place2Record.StatValue:setText( Engine.Localize( "888" ) )
	self:addElement( Place2Record )
	self.Place2Record = Place2Record
	
	local Place1Record = CoD.CombatRecordWinnersCircleStat.new( self, controller )
	Place1Record:setLeftRight( 1, 1, -387, -305 )
	Place1Record:setTopBottom( 0, 0, 692.5, 845.5 )
	Place1Record:setAlpha( 0 )
	Place1Record.RibbonImage:setImage( RegisterImage( "t7_hud_mp_notifications_endgame_ribbon1" ) )
	Place1Record.StatValue:setText( Engine.Localize( "888" ) )
	self:addElement( Place1Record )
	self.Place1Record = Place1Record
	
	local CombatRecordComparingPlayerInfo = CoD.CombatRecordComparingPlayerInfo.new( self, controller )
	CombatRecordComparingPlayerInfo:setLeftRight( 1, 1, -1305, -687 )
	CombatRecordComparingPlayerInfo:setTopBottom( 0, 0, 35, 125 )
	self:addElement( CombatRecordComparingPlayerInfo )
	self.CombatRecordComparingPlayerInfo = CombatRecordComparingPlayerInfo
	
	local CombatRecordStatRing = CoD.CombatRecordStatRing.new( self, controller )
	CombatRecordStatRing:setLeftRight( 0, 0, 852, 1236 )
	CombatRecordStatRing:setTopBottom( 0, 0, 440, 824 )
	CombatRecordStatRing.WLRatioLabel:setText( Engine.Localize( "MENU_WLRATIO_CAPS" ) )
	self:addElement( CombatRecordStatRing )
	self.CombatRecordStatRing = CombatRecordStatRing
	
	WinsStat:linkToElementModel( ItemList, "stat", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WinsStat.StatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	WinsStat:linkToElementModel( ItemList, "statComparison", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WinsStat.ComparedStatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	KDRatioStat:linkToElementModel( ItemList, "kdRatio", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KDRatioStat.StatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	KDRatioStat:linkToElementModel( ItemList, "kdRatioComparison", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KDRatioStat.ComparedStatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	SPMStat:linkToElementModel( ItemList, "spm", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SPMStat.StatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	SPMStat:linkToElementModel( ItemList, "spmComparison", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SPMStat.ComparedStatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	GameModeName:linkToElementModel( ItemList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameModeName.Label:setText( Engine.Localize( modelValue ) )
		end
	end )
	Streak:linkToElementModel( ItemList, "streak", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Streak.StatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	Streak:linkToElementModel( ItemList, "streakComparison", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Streak.StatComparisonValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	LossRecord:linkToElementModel( ItemList, "losses", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LossRecord.StatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	LossRecord:linkToElementModel( ItemList, "lossesComparison", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LossRecord.StatComparisonValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	WinsRecord:linkToElementModel( ItemList, "stat", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WinsRecord.StatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	WinsRecord:linkToElementModel( ItemList, "statComparison", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WinsRecord.StatComparisonValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	GameModeImage:linkToElementModel( ItemList, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameModeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	CombatRecordStatRing:linkToElementModel( ItemList, "wlRatio", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CombatRecordStatRing.StatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	CombatRecordStatRing:linkToElementModel( ItemList, "lossRingFrac", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CombatRecordStatRing.LossRing:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	CombatRecordStatRing:linkToElementModel( ItemList, "wlRatioComparison", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CombatRecordStatRing.ComparisonStatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	MenuFrame.navigation = {
		left = ItemList,
		down = ItemList
	}
	ItemList.navigation = {
		up = MenuFrame,
		right = MenuFrame
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordComparing" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CombatRecordComparing"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.InProgress"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.Success"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		CombatRecordSetHeadingKickerTextToCombatRecordMode( "" )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		CombatRecordSetComparing( self, controller, false )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "F", function ( element, menu, controller, model )
		if EnableCombatRecordCompare( controller ) and not IsCombatRecordForRemotePlayer() then
			OpenPopup( self, "CombatRecordFriendSidebar", controller, "", "" )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_COMPARE", nil )
			return true
		elseif EnableCombatRecordCompare( controller ) and IsCombatRecordForRemotePlayer() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_COMPARE", nil )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_CLEAR_COMPARE", nil )
			return true
		else
			return false
		end
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	MenuFrame.id = "MenuFrame"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.FEMenuLeftGraphics:close()
		self.MenuFrame:close()
		self.ItemList:close()
		self.WinsStat:close()
		self.KDRatioStat:close()
		self.SPMStat:close()
		self.GameModeName:close()
		self.Streak:close()
		self.LossRecord:close()
		self.WinsRecord:close()
		self.StartMenuframenoBG0:close()
		self.Place3Record:close()
		self.Place2Record:close()
		self.Place1Record:close()
		self.CombatRecordComparingPlayerInfo:close()
		self.CombatRecordStatRing:close()
		self.GameModeImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordGameModes.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

