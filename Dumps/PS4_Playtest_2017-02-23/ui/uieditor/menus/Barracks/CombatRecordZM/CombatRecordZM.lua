require( "ui.uieditor.menus.Barracks.CombatRecordZM.CombatRecordBubblegumBuffs" )
require( "ui.uieditor.menus.Barracks.CombatRecordZM.CombatRecordWeaponsZM" )
require( "ui.uieditor.menus.Barracks.CombatRecordZM.CombatRecordZMMaps" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Barracks.CombatRecord_LineDivider" )
require( "ui.uieditor.widgets.Barracks.CombatRecordItemButton" )
require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStat" )
require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStatSmall" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Prestige.Prestige_MasterTierWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

LUI.createMenu.CombatRecordZM = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordZM" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordZM.buttonPrompts" )
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
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 27, 105 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 136, 1062 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_COMBAT_RECORD_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_COMBAT_RECORD_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SummaryTitle = LUI.UITightText.new()
	SummaryTitle:setLeftRight( 0, 0, 116, 368 )
	SummaryTitle:setTopBottom( 0, 0, 147, 185 )
	SummaryTitle:setText( Engine.Localize( "MENU_GLOBAL_CAREER_SNAPSHOT_CAPS" ) )
	SummaryTitle:setTTF( "fonts/default.ttf" )
	self:addElement( SummaryTitle )
	self.SummaryTitle = SummaryTitle
	
	local TimePlayedText = LUI.UITightText.new()
	TimePlayedText:setLeftRight( 1, 1, -368, -147 )
	TimePlayedText:setTopBottom( 0, 0, 147, 185 )
	TimePlayedText:setText( SecondsAsTimePlayedString( CombatRecordGetStat( controller, "playerstatslist.time_played_total", "Played 8d 19h 33m 19s" ) ) )
	TimePlayedText:setTTF( "fonts/default.ttf" )
	self:addElement( TimePlayedText )
	self.TimePlayedText = TimePlayedText
	
	local RankOrEmblem = LUI.UIImage.new()
	RankOrEmblem:setLeftRight( 0.5, 0.5, -844, -652 )
	RankOrEmblem:setTopBottom( 0, 0, 208, 400 )
	RankOrEmblem:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankOrEmblem:setImage( RegisterImage( GetRankIconLarge( CombatRecordGetRankIcon( controller, modelValue ) ) ) )
		end
	end )
	self:addElement( RankOrEmblem )
	self.RankOrEmblem = RankOrEmblem
	
	local RankNameBackground = LUI.UIImage.new()
	RankNameBackground:setLeftRight( 0.5, 0.5, -636, -350 )
	RankNameBackground:setTopBottom( 0, 0, 263, 305 )
	RankNameBackground:setAlpha( 0.6 )
	self:addElement( RankNameBackground )
	self.RankNameBackground = RankNameBackground
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( 0.5, 0.5, -636, -350 )
	RankBackground:setTopBottom( 0, 0, 305, 347 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0.8 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local RankName = LUI.UIText.new()
	RankName:setLeftRight( 0.5, 0.5, -636, -350 )
	RankName:setTopBottom( 0, 0, 269, 299 )
	RankName:setRGB( 0, 0, 0 )
	RankName:setText( Engine.Localize( CombatRecordGetRankTitle( controller, "Vindicator" ) ) )
	RankName:setTTF( "fonts/escom.ttf" )
	RankName:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	RankName:setShaderVector( 0, 0.05, 0, 0, 0 )
	RankName:setShaderVector( 1, 0, 0, 0, 0 )
	RankName:setShaderVector( 2, 1, 0, 0, 0 )
	RankName:setLetterSpacing( 1 )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RankName )
	self.RankName = RankName
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( 0.5, 0.5, -636, -350 )
	Rank:setTopBottom( 0, 0, 305, 347 )
	Rank:setRGB( CombatRecordGetParagonColorByRank( controller, 255, 255, 255, 1, 1, 1 ) )
	Rank:setTTF( "fonts/escom.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Rank:setText( CombatRecordGetLevelString( controller, modelValue ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local Kills = CoD.CombatRecordSummaryStat.new( self, controller )
	Kills:setLeftRight( 0, 0, 672, 857 )
	Kills:setTopBottom( 0, 0, 227.5, 296.5 )
	Kills.StatLabel:setText( Engine.Localize( "MPUI_KILLS" ) )
	Kills:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Kills.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.kills", modelValue ) ) )
		end
	end )
	self:addElement( Kills )
	self.Kills = Kills
	
	local RoundsSurvived = CoD.CombatRecordSummaryStat.new( self, controller )
	RoundsSurvived:setLeftRight( 0, 0, 847, 1033 )
	RoundsSurvived:setTopBottom( 0, 0, 227.5, 296.5 )
	RoundsSurvived.StatLabel:setText( Engine.Localize( "MENU_ROUNDS_SURVIVED" ) )
	RoundsSurvived.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.total_rounds_survived", "888" ) ) )
	self:addElement( RoundsSurvived )
	self.RoundsSurvived = RoundsSurvived
	
	local AvgGameScore = CoD.CombatRecordSummaryStat.new( self, controller )
	AvgGameScore:setLeftRight( 0, 0, 1052, 1238 )
	AvgGameScore:setTopBottom( 0, 0, 229.5, 298.5 )
	AvgGameScore.StatLabel:setText( Engine.Localize( "MENU_AVERAGE_GAME_SCORE" ) )
	AvgGameScore.StatValue:setText( Engine.Localize( CombatRecordGetTwoStatRatioRounded( controller, "playerstatslist.score", "playerstatslist.total_games_played", "888" ) ) )
	self:addElement( AvgGameScore )
	self.AvgGameScore = AvgGameScore
	
	local Headshots = CoD.CombatRecordSummaryStatSmall.new( self, controller )
	Headshots:setLeftRight( 0, 0, 671, 856 )
	Headshots:setTopBottom( 0, 0, 325, 379 )
	Headshots.StatLabel:setText( Engine.Localize( "MPUI_HEADSHOTS" ) )
	Headshots.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.headshots", "888" ) ) )
	self:addElement( Headshots )
	self.Headshots = Headshots
	
	local AvgRoundsPerGame = CoD.CombatRecordSummaryStatSmall.new( self, controller )
	AvgRoundsPerGame:setLeftRight( 0, 0, 846, 1032 )
	AvgRoundsPerGame:setTopBottom( 0, 0, 325, 379 )
	AvgRoundsPerGame.StatLabel:setText( Engine.Localize( "MENU_AVERAGE_ROUNDS_PER_GAME" ) )
	AvgRoundsPerGame.StatValue:setText( Engine.Localize( CombatRecordGetTwoStatRatioRounded( controller, "playerstatslist.total_rounds_survived", "playerstatslist.total_games_played", "888" ) ) )
	self:addElement( AvgRoundsPerGame )
	self.AvgRoundsPerGame = AvgRoundsPerGame
	
	local SPM = CoD.CombatRecordSummaryStatSmall.new( self, controller )
	SPM:setLeftRight( 0, 0, 1052, 1238 )
	SPM:setTopBottom( 0, 0, 325, 379 )
	SPM.StatLabel:setText( Engine.Localize( "MENU_SCORE_PER_MINUTE" ) )
	SPM.StatValue:setText( Engine.Localize( CombatRecordGetSPM( controller, "playerstatslist.score", "playerstatslist.time_played_total", "425" ) ) )
	self:addElement( SPM )
	self.SPM = SPM
	
	local WeaponsButton = CoD.CombatRecordItemButton.new( self, controller )
	WeaponsButton:setLeftRight( 0, 0, 115.5, 670.5 )
	WeaponsButton:setTopBottom( 0, 0, 461, 707 )
	WeaponsButton.ItemImage:setAlpha( 0 )
	WeaponsButton.GameModeImage2:setAlpha( 0 )
	WeaponsButton.ButtonTitle:setText( Engine.Localize( "MENU_WEAPONS" ) )
	WeaponsButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestWeapon", "itemIndex", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponsButton.WeaponImage:setImage( RegisterImage( AppendIfMatch( "menu_mp_lobby_none_selected", "_rec", AppendIfNotMatch( "menu_mp_lobby_none_selected", "_pu", GetWeaponImageByIndexAndMode( "mp", modelValue ) ) ) ) )
		end
	end )
	WeaponsButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestWeapon", "itemName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponsButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_DEADLIEST", modelValue ) )
		end
	end )
	WeaponsButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	WeaponsButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( WeaponsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "CombatRecordWeaponsZM", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( WeaponsButton )
	self.WeaponsButton = WeaponsButton
	
	local BubblegumBuffsButton = CoD.CombatRecordItemButton.new( self, controller )
	BubblegumBuffsButton:setLeftRight( 0, 0, 682.5, 1237.5 )
	BubblegumBuffsButton:setTopBottom( 0, 0, 461, 707 )
	BubblegumBuffsButton.WeaponImage:setAlpha( 0 )
	BubblegumBuffsButton.GameModeImage2:setAlpha( 0 )
	BubblegumBuffsButton.ButtonTitle:setText( Engine.Localize( "MENU_STORE_BUBBLEGUM_BUFFS" ) )
	BubblegumBuffsButton:subscribeToGlobalModel( controller, "CombatRecordMostUsedBubblegumBuff", "itemIndex", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BubblegumBuffsButton.ItemImage:setImage( RegisterImage( AppendIfMatch( "menu_mp_lobby_none_selected", "_new", GetItemImageByIndexAndMode( "zm", modelValue ) ) ) )
		end
	end )
	BubblegumBuffsButton:subscribeToGlobalModel( controller, "CombatRecordMostUsedBubblegumBuff", "itemName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BubblegumBuffsButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_MOST_USED", modelValue ) )
		end
	end )
	BubblegumBuffsButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	BubblegumBuffsButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( BubblegumBuffsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "CombatRecordBubblegumBuffs", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( BubblegumBuffsButton )
	self.BubblegumBuffsButton = BubblegumBuffsButton
	
	local MapsButton = CoD.CombatRecordItemButton.new( self, controller )
	MapsButton:setLeftRight( 0, 0, 1247.5, 1802.5 )
	MapsButton:setTopBottom( 0, 0, 461, 707 )
	MapsButton.ItemImage:setAlpha( 0 )
	MapsButton.GameModeImage2:setAlpha( 0 )
	MapsButton.ButtonTitle:setText( Engine.Localize( "MENU_MAPS" ) )
	MapsButton:subscribeToGlobalModel( controller, "CombatRecordZMHighestRound", "mapName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapsButton.WeaponImage:setImage( RegisterImage( SetValueIfStringEqualTo( "$black", "menu_mp_lobby_none_selected_rec", MapNameToMapImage( modelValue ) ) ) )
		end
	end )
	MapsButton:subscribeToGlobalModel( controller, "CombatRecordZMHighestRound", "mapName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapsButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_HIGHEST_ROUND", MapNameToLocalizedMapName( modelValue ) ) )
		end
	end )
	MapsButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MapsButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( MapsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "CombatRecordZMMaps", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( MapsButton )
	self.MapsButton = MapsButton
	
	local Line10 = LUI.UIImage.new()
	Line10:setLeftRight( 0, 1, 96, -1786 )
	Line10:setTopBottom( 0, 0, 184, 196 )
	Line10:setAlpha( 0.66 )
	Line10:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Line10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line10 )
	self.Line10 = Line10
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 1, 96, -1786 )
	Image3:setTopBottom( 0, 0, 416, 428 )
	Image3:setAlpha( 0.66 )
	Image3:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local CombatRecordLineDivider1 = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider1:setLeftRight( 0, 0, 657, 695 )
	CombatRecordLineDivider1:setTopBottom( 0, 0, 184, 204 )
	self:addElement( CombatRecordLineDivider1 )
	self.CombatRecordLineDivider1 = CombatRecordLineDivider1
	
	local CombatRecordLineDivider2 = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider2:setLeftRight( 0, 0, 657, 695 )
	CombatRecordLineDivider2:setTopBottom( 0, 0, 408, 428 )
	CombatRecordLineDivider2:setZRot( 180 )
	self:addElement( CombatRecordLineDivider2 )
	self.CombatRecordLineDivider2 = CombatRecordLineDivider2
	
	local CombatRecordLineDivider = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider:setLeftRight( 0, 0, 1224, 1262 )
	CombatRecordLineDivider:setTopBottom( 0, 0, 184, 204 )
	self:addElement( CombatRecordLineDivider )
	self.CombatRecordLineDivider = CombatRecordLineDivider
	
	local CombatRecordLineDivider0 = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider0:setLeftRight( 0, 0, 1224, 1262 )
	CombatRecordLineDivider0:setTopBottom( 0, 0, 408, 428 )
	CombatRecordLineDivider0:setZRot( 180 )
	self:addElement( CombatRecordLineDivider0 )
	self.CombatRecordLineDivider0 = CombatRecordLineDivider0
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 0, 1, 1786, -96 )
	Image4:setTopBottom( 0, 0, 184, 196 )
	Image4:setAlpha( 0.66 )
	Image4:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( 0, 1, 1786, -96 )
	Image5:setTopBottom( 0, 0, 416, 428 )
	Image5:setAlpha( 0.66 )
	Image5:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 1, 687, -1097 )
	Image0:setTopBottom( 0, 0, 306, 312 )
	Image0:setAlpha( 0.33 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Vline2 = LUI.UIImage.new()
	Vline2:setLeftRight( 0, 0, 834, 837 )
	Vline2:setTopBottom( 0, 0, 196, 415 )
	Vline2:setAlpha( 0.5 )
	Vline2:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline2 )
	self.Vline2 = Vline2
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 1241, 1244 )
	Image1:setTopBottom( 0, 0, 191, 428 )
	Image1:setAlpha( 0.35 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0, 0, 674, 677 )
	Image2:setTopBottom( 0, 0, 191, 428 )
	Image2:setAlpha( 0.35 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( 0, 1, 849, -887 )
	Image6:setTopBottom( 0, 0, 306, 312 )
	Image6:setAlpha( 0.33 )
	Image6:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( 0, 0, 1041, 1044 )
	Image7:setTopBottom( 0, 0, 196, 415 )
	Image7:setAlpha( 0.5 )
	Image7:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( 0, 1, 1053, -687 )
	Image8:setTopBottom( 0, 0, 306, 312 )
	Image8:setAlpha( 0.33 )
	Image8:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( self, controller )
	StartMenuframenoBG00:setLeftRight( 0.5, 0.5, -640, -348 )
	StartMenuframenoBG00:setTopBottom( 0.5, 0.5, -282, -190 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local Image60 = LUI.UIImage.new()
	Image60:setLeftRight( 0, 1, 96, -96 )
	Image60:setTopBottom( 0, 0, 186, 194 )
	Image60:setAlpha( 0.15 )
	Image60:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image60:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image60 )
	self.Image60 = Image60
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( 0, 1, 96, -96 )
	Image9:setTopBottom( 0, 0, 418, 426 )
	Image9:setAlpha( 0.15 )
	Image9:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local PrestigeMasterTierWidget = CoD.Prestige_MasterTierWidget.new( self, controller )
	PrestigeMasterTierWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsMaxPrestigeLevelForMode( controller, Enum.eModes.MODE_ZOMBIES )
			end
		}
	} )
	PrestigeMasterTierWidget:setLeftRight( 0.5, 0.5, -671, -319 )
	PrestigeMasterTierWidget:setTopBottom( 0, 0, 345, 381 )
	PrestigeMasterTierWidget:setScale( 0.82 )
	PrestigeMasterTierWidget:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigeMasterTierWidget.ParagonStars:setHorizontalCount( GetPrestigeMasterTierCountFromStorage( controller, "zm", modelValue ) )
		end
	end )
	self:addElement( PrestigeMasterTierWidget )
	self.PrestigeMasterTierWidget = PrestigeMasterTierWidget
	
	MenuFrame.navigation = {
		left = BubblegumBuffsButton,
		right = MapsButton,
		down = {
			WeaponsButton,
			BubblegumBuffsButton,
			MapsButton
		}
	}
	WeaponsButton.navigation = {
		up = MenuFrame,
		right = MenuFrame
	}
	BubblegumBuffsButton.navigation = {
		left = MenuFrame,
		up = MenuFrame,
		right = MapsButton
	}
	MapsButton.navigation = {
		left = MenuFrame,
		up = MenuFrame
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	MenuFrame.id = "MenuFrame"
	WeaponsButton.id = "WeaponsButton"
	BubblegumBuffsButton.id = "BubblegumBuffsButton"
	MapsButton.id = "MapsButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.WeaponsButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.FEMenuLeftGraphics:close()
		self.MenuFrame:close()
		self.Kills:close()
		self.RoundsSurvived:close()
		self.AvgGameScore:close()
		self.Headshots:close()
		self.AvgRoundsPerGame:close()
		self.SPM:close()
		self.WeaponsButton:close()
		self.BubblegumBuffsButton:close()
		self.MapsButton:close()
		self.CombatRecordLineDivider1:close()
		self.CombatRecordLineDivider2:close()
		self.CombatRecordLineDivider:close()
		self.CombatRecordLineDivider0:close()
		self.StartMenuframenoBG00:close()
		self.PrestigeMasterTierWidget:close()
		self.RankOrEmblem:close()
		self.Rank:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordZM.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

