require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStat" )
require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStatSmall" )
require( "ui.uieditor.widgets.Barracks.CombatRecordItemButton" )
require( "ui.uieditor.menus.Barracks.CombatRecordZM.CombatRecordWeaponsZM" )
require( "ui.uieditor.menus.Barracks.CombatRecordZM.CombatRecordBubblegumBuffs" )
require( "ui.uieditor.menus.Barracks.CombatRecordZM.CombatRecordZMMaps" )
require( "ui.uieditor.widgets.Barracks.CombatRecord_LineDivider" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Prestige.Prestige_MasterTierWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disablePopupOpenCloseAnim = true
end

LUI.createMenu.CombatRecordZM = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordZM" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordZM.buttonPrompts" )
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
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_COMBAT_RECORD_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_COMBAT_RECORD_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SummaryTitle = LUI.UITightText.new()
	SummaryTitle:setLeftRight( true, false, 77, 245 )
	SummaryTitle:setTopBottom( true, false, 98, 123 )
	SummaryTitle:setText( Engine.Localize( "MENU_GLOBAL_CAREER_SNAPSHOT_CAPS" ) )
	SummaryTitle:setTTF( "fonts/default.ttf" )
	self:addElement( SummaryTitle )
	self.SummaryTitle = SummaryTitle
	
	local TimePlayedText = LUI.UITightText.new()
	TimePlayedText:setLeftRight( false, true, -245.17, -98 )
	TimePlayedText:setTopBottom( true, false, 98, 123 )
	TimePlayedText:setText( SecondsAsTimePlayedString( CombatRecordGetStat( controller, "playerstatslist.time_played_total", "Played 8d 19h 33m 19s" ) ) )
	TimePlayedText:setTTF( "fonts/default.ttf" )
	self:addElement( TimePlayedText )
	self.TimePlayedText = TimePlayedText
	
	local RankOrEmblem = LUI.UIImage.new()
	RankOrEmblem:setLeftRight( false, false, -563, -435 )
	RankOrEmblem:setTopBottom( true, false, 139, 267 )
	RankOrEmblem:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local statsZm = Engine.GetModelValue( model )
		if statsZm then
			RankOrEmblem:setImage( RegisterImage( GetRankIconLarge( CombatRecordGetRankIcon( controller, statsZm ) ) ) )
		end
	end )
	self:addElement( RankOrEmblem )
	self.RankOrEmblem = RankOrEmblem
	
	local RankNameBackground = LUI.UIImage.new()
	RankNameBackground:setLeftRight( false, false, -410, -243 )
	RankNameBackground:setTopBottom( true, false, 175, 203 )
	RankNameBackground:setAlpha( 0.6 )
	self:addElement( RankNameBackground )
	self.RankNameBackground = RankNameBackground
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( false, false, -410, -243 )
	RankBackground:setTopBottom( true, false, 203, 231 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0.8 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local RankName = LUI.UIText.new()
	RankName:setLeftRight( false, false, -410, -243 )
	RankName:setTopBottom( true, false, 179, 199 )
	RankName:setRGB( 0, 0, 0 )
	RankName:setText( Engine.Localize( CombatRecordGetRankTitle( controller, "Vindicator" ) ) )
	RankName:setTTF( "fonts/escom.ttf" )
	RankName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	RankName:setShaderVector( 0, 0.05, 0, 0, 0 )
	RankName:setShaderVector( 1, 0, 0, 0, 0 )
	RankName:setShaderVector( 2, 1, 0, 0, 0 )
	RankName:setLetterSpacing( 1 )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RankName )
	self.RankName = RankName
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( false, false, -410, -243 )
	Rank:setTopBottom( true, false, 203, 231 )
	Rank:setRGB( CombatRecordGetParagonColorByRank( controller, 255, 255, 255, 1, 1, 1 ) )
	Rank:setTTF( "fonts/escom.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local statsZm = Engine.GetModelValue( model )
		if statsZm then
			Rank:setText( CombatRecordGetLevelString( controller, statsZm ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local Kills = CoD.CombatRecordSummaryStat.new( self, controller )
	Kills:setLeftRight( true, false, 448, 571.67 )
	Kills:setTopBottom( true, false, 152, 198 )
	Kills.StatLabel:setText( Engine.Localize( "MPUI_KILLS" ) )
	Kills:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local statsZm = Engine.GetModelValue( model )
		if statsZm then
			Kills.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.kills", statsZm ) ) )
		end
	end )
	self:addElement( Kills )
	self.Kills = Kills
	
	local RoundsSurvived = CoD.CombatRecordSummaryStat.new( self, controller )
	RoundsSurvived:setLeftRight( true, false, 565.17, 688.83 )
	RoundsSurvived:setTopBottom( true, false, 152, 198 )
	RoundsSurvived.StatLabel:setText( Engine.Localize( "MENU_ROUNDS_SURVIVED" ) )
	RoundsSurvived.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.total_rounds_survived", "888" ) ) )
	self:addElement( RoundsSurvived )
	self.RoundsSurvived = RoundsSurvived
	
	local AvgGameScore = CoD.CombatRecordSummaryStat.new( self, controller )
	AvgGameScore:setLeftRight( true, false, 701.33, 825 )
	AvgGameScore:setTopBottom( true, false, 153, 199 )
	AvgGameScore.StatLabel:setText( Engine.Localize( "MENU_AVERAGE_GAME_SCORE" ) )
	AvgGameScore.StatValue:setText( Engine.Localize( CombatRecordGetTwoStatRatioRounded( controller, "playerstatslist.score", "playerstatslist.total_games_played", "888" ) ) )
	self:addElement( AvgGameScore )
	self.AvgGameScore = AvgGameScore
	
	local Headshots = CoD.CombatRecordSummaryStatSmall.new( self, controller )
	Headshots:setLeftRight( true, false, 447, 570.67 )
	Headshots:setTopBottom( true, false, 217, 253 )
	Headshots.StatLabel:setText( Engine.Localize( "MPUI_HEADSHOTS" ) )
	Headshots.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.headshots", "888" ) ) )
	self:addElement( Headshots )
	self.Headshots = Headshots
	
	local AvgRoundsPerGame = CoD.CombatRecordSummaryStatSmall.new( self, controller )
	AvgRoundsPerGame:setLeftRight( true, false, 564.17, 687.83 )
	AvgRoundsPerGame:setTopBottom( true, false, 217, 253 )
	AvgRoundsPerGame.StatLabel:setText( Engine.Localize( "MENU_AVERAGE_ROUNDS_PER_GAME" ) )
	AvgRoundsPerGame.StatValue:setText( Engine.Localize( CombatRecordGetTwoStatRatioRounded( controller, "playerstatslist.total_rounds_survived", "playerstatslist.total_games_played", "888" ) ) )
	self:addElement( AvgRoundsPerGame )
	self.AvgRoundsPerGame = AvgRoundsPerGame
	
	local SPM = CoD.CombatRecordSummaryStatSmall.new( self, controller )
	SPM:setLeftRight( true, false, 701.33, 825 )
	SPM:setTopBottom( true, false, 217, 253 )
	SPM.StatLabel:setText( Engine.Localize( "MENU_SCORE_PER_MINUTE" ) )
	SPM.StatValue:setText( Engine.Localize( CombatRecordGetSPM( controller, "playerstatslist.score", "playerstatslist.time_played_total", "425" ) ) )
	self:addElement( SPM )
	self.SPM = SPM
	
	local WeaponsButton = CoD.CombatRecordItemButton.new( self, controller )
	WeaponsButton:setLeftRight( true, false, 77, 447 )
	WeaponsButton:setTopBottom( true, false, 307.5, 471.5 )
	WeaponsButton.ItemImage:setAlpha( 0 )
	WeaponsButton.GameModeImage2:setAlpha( 0 )
	WeaponsButton.ButtonTitle:setText( Engine.Localize( "MENU_WEAPONS" ) )
	WeaponsButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestWeapon", "itemIndex", function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			WeaponsButton.WeaponImage:setImage( RegisterImage( AppendIfMatch( "menu_mp_lobby_none_selected", "_rec", AppendIfNotMatch( "menu_mp_lobby_none_selected", "_pu", GetWeaponImageByIndexAndMode( "mp", itemIndex ) ) ) ) )
		end
	end )
	WeaponsButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestWeapon", "itemName", function ( model )
		local itemName = Engine.GetModelValue( model )
		if itemName then
			WeaponsButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_DEADLIEST", itemName ) )
		end
	end )
	WeaponsButton:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	WeaponsButton:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	self:AddButtonCallbackFunction( WeaponsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "CombatRecordWeaponsZM", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( WeaponsButton )
	self.WeaponsButton = WeaponsButton
	
	local BubblegumBuffsButton = CoD.CombatRecordItemButton.new( self, controller )
	BubblegumBuffsButton:setLeftRight( true, false, 455, 825 )
	BubblegumBuffsButton:setTopBottom( true, false, 307.5, 471.5 )
	BubblegumBuffsButton.WeaponImage:setAlpha( 0 )
	BubblegumBuffsButton.GameModeImage2:setAlpha( 0 )
	BubblegumBuffsButton.ButtonTitle:setText( Engine.Localize( "MENU_STORE_BUBBLEGUM_BUFFS" ) )
	BubblegumBuffsButton:subscribeToGlobalModel( controller, "CombatRecordMostUsedBubblegumBuff", "itemIndex", function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			BubblegumBuffsButton.ItemImage:setImage( RegisterImage( AppendIfMatch( "menu_mp_lobby_none_selected", "_new", GetItemImageByIndexAndMode( "zm", itemIndex ) ) ) )
		end
	end )
	BubblegumBuffsButton:subscribeToGlobalModel( controller, "CombatRecordMostUsedBubblegumBuff", "itemName", function ( model )
		local itemName = Engine.GetModelValue( model )
		if itemName then
			BubblegumBuffsButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_MOST_USED", itemName ) )
		end
	end )
	BubblegumBuffsButton:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f15_local0
	end )
	BubblegumBuffsButton:registerEventHandler( "lose_focus", function ( element, event )
		local f16_local0 = nil
		if element.loseFocus then
			f16_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f16_local0 = element.super:loseFocus( event )
		end
		return f16_local0
	end )
	self:AddButtonCallbackFunction( BubblegumBuffsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "CombatRecordBubblegumBuffs", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( BubblegumBuffsButton )
	self.BubblegumBuffsButton = BubblegumBuffsButton
	
	local MapsButton = CoD.CombatRecordItemButton.new( self, controller )
	MapsButton:setLeftRight( true, false, 831.5, 1201.5 )
	MapsButton:setTopBottom( true, false, 307.5, 471.5 )
	MapsButton.ItemImage:setAlpha( 0 )
	MapsButton.GameModeImage2:setAlpha( 0 )
	MapsButton.ButtonTitle:setText( Engine.Localize( "MENU_MAPS" ) )
	MapsButton:subscribeToGlobalModel( controller, "CombatRecordZMHighestRound", "mapName", function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			MapsButton.WeaponImage:setImage( RegisterImage( SetValueIfStringEqualTo( "$black", "menu_mp_lobby_none_selected_rec", MapNameToMapImage( mapName ) ) ) )
		end
	end )
	MapsButton:subscribeToGlobalModel( controller, "CombatRecordZMHighestRound", "mapName", function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			MapsButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_HIGHEST_ROUND", MapNameToLocalizedMapName( mapName ) ) )
		end
	end )
	MapsButton:registerEventHandler( "gain_focus", function ( element, event )
		local f21_local0 = nil
		if element.gainFocus then
			f21_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f21_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f21_local0
	end )
	MapsButton:registerEventHandler( "lose_focus", function ( element, event )
		local f22_local0 = nil
		if element.loseFocus then
			f22_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f22_local0 = element.super:loseFocus( event )
		end
		return f22_local0
	end )
	self:AddButtonCallbackFunction( MapsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "CombatRecordZMMaps", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( MapsButton )
	self.MapsButton = MapsButton
	
	local Line10 = LUI.UIImage.new()
	Line10:setLeftRight( true, true, 64, -1191 )
	Line10:setTopBottom( true, false, 123, 131 )
	Line10:setAlpha( 0.66 )
	Line10:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Line10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line10 )
	self.Line10 = Line10
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, true, 64, -1191 )
	Image3:setTopBottom( true, false, 277, 285 )
	Image3:setAlpha( 0.66 )
	Image3:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local CombatRecordLineDivider1 = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider1:setLeftRight( true, false, 438, 463 )
	CombatRecordLineDivider1:setTopBottom( true, false, 123, 136 )
	self:addElement( CombatRecordLineDivider1 )
	self.CombatRecordLineDivider1 = CombatRecordLineDivider1
	
	local CombatRecordLineDivider2 = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider2:setLeftRight( true, false, 438, 463 )
	CombatRecordLineDivider2:setTopBottom( true, false, 272, 285 )
	CombatRecordLineDivider2:setZRot( 180 )
	self:addElement( CombatRecordLineDivider2 )
	self.CombatRecordLineDivider2 = CombatRecordLineDivider2
	
	local CombatRecordLineDivider = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider:setLeftRight( true, false, 816, 841 )
	CombatRecordLineDivider:setTopBottom( true, false, 123, 136 )
	self:addElement( CombatRecordLineDivider )
	self.CombatRecordLineDivider = CombatRecordLineDivider
	
	local CombatRecordLineDivider0 = CoD.CombatRecord_LineDivider.new( self, controller )
	CombatRecordLineDivider0:setLeftRight( true, false, 816, 841 )
	CombatRecordLineDivider0:setTopBottom( true, false, 272, 285 )
	CombatRecordLineDivider0:setZRot( 180 )
	self:addElement( CombatRecordLineDivider0 )
	self.CombatRecordLineDivider0 = CombatRecordLineDivider0
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, true, 1191, -64 )
	Image4:setTopBottom( true, false, 123, 131 )
	Image4:setAlpha( 0.66 )
	Image4:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, true, 1191, -64 )
	Image5:setTopBottom( true, false, 277, 285 )
	Image5:setAlpha( 0.66 )
	Image5:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 458, -730.83 )
	Image0:setTopBottom( true, false, 204, 208 )
	Image0:setAlpha( 0.33 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Vline2 = LUI.UIImage.new()
	Vline2:setLeftRight( true, false, 556.17, 558.17 )
	Vline2:setTopBottom( true, false, 131, 277 )
	Vline2:setAlpha( 0.5 )
	Vline2:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline2 )
	self.Vline2 = Vline2
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 827.5, 829.5 )
	Image1:setTopBottom( true, false, 127, 285 )
	Image1:setAlpha( 0.35 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 449.5, 451.5 )
	Image2:setTopBottom( true, false, 127, 285 )
	Image2:setAlpha( 0.35 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, true, 566, -591.83 )
	Image6:setTopBottom( true, false, 204, 208 )
	Image6:setAlpha( 0.33 )
	Image6:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, false, 694.17, 696.17 )
	Image7:setTopBottom( true, false, 131, 277 )
	Image7:setAlpha( 0.5 )
	Image7:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, true, 701.83, -458 )
	Image8:setTopBottom( true, false, 204, 208 )
	Image8:setAlpha( 0.33 )
	Image8:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( self, controller )
	StartMenuframenoBG00:setLeftRight( false, false, -413, -241 )
	StartMenuframenoBG00:setTopBottom( false, false, -187.5, -126.5 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local Image60 = LUI.UIImage.new()
	Image60:setLeftRight( true, true, 64, -64 )
	Image60:setTopBottom( true, false, 124.5, 129.5 )
	Image60:setAlpha( 0.15 )
	Image60:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image60:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image60 )
	self.Image60 = Image60
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( true, true, 64, -64 )
	Image9:setTopBottom( true, false, 278.5, 283.5 )
	Image9:setAlpha( 0.15 )
	Image9:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local PrestigeMasterTierWidget = CoD.Prestige_MasterTierWidget.new( self, controller )
	PrestigeMasterTierWidget:setLeftRight( false, false, -429, -224.5 )
	PrestigeMasterTierWidget:setTopBottom( true, false, 230, 254 )
	PrestigeMasterTierWidget:setAlpha( ShowIfPrestigeMasterByPLevel( "zm", GetPLevelFromCombatRecord( controller, 1 ) ) )
	PrestigeMasterTierWidget:setScale( 0.82 )
	PrestigeMasterTierWidget.ParagonStars:setHorizontalCount( GetPrestigeMasterTierCountFromCombatRecord( controller, "zm", 10 ) )
	PrestigeMasterTierWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( PrestigeMasterTierWidget )
	self.PrestigeMasterTierWidget = PrestigeMasterTierWidget
	
	WeaponsButton.navigation = {
		right = BubblegumBuffsButton
	}
	BubblegumBuffsButton.navigation = {
		left = WeaponsButton,
		right = MapsButton
	}
	MapsButton.navigation = {
		left = BubblegumBuffsButton
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f26_local0 = nil
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not f26_local0 then
			f26_local0 = self:dispatchEventToChildren( event )
		end
		return f26_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.Kills:close()
		element.RoundsSurvived:close()
		element.AvgGameScore:close()
		element.Headshots:close()
		element.AvgRoundsPerGame:close()
		element.SPM:close()
		element.WeaponsButton:close()
		element.BubblegumBuffsButton:close()
		element.MapsButton:close()
		element.CombatRecordLineDivider1:close()
		element.CombatRecordLineDivider2:close()
		element.CombatRecordLineDivider:close()
		element.CombatRecordLineDivider0:close()
		element.StartMenuframenoBG00:close()
		element.PrestigeMasterTierWidget:close()
		element.RankOrEmblem:close()
		element.Rank:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordZM.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

