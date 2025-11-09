require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStat" )
require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStatSmall" )
require( "ui.uieditor.widgets.Barracks.CombatRecordItemButton" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordWeapons" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordEquipment" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordSpecialists" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordScorestreaks" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordGameModes" )
require( "ui.uieditor.widgets.Barracks.CombatRecord_LineDivider" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	CoD.CombatRecordMode = "arena"
end

CoD.CombatRecordArenaPanel = InheritFrom( LUI.UIElement )
CoD.CombatRecordArenaPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordArenaPanel )
	self.id = "CombatRecordArenaPanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1216 )
	self:setTopBottom( true, false, 0, 546 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local SummaryTitle = LUI.UITightText.new()
	SummaryTitle:setLeftRight( true, false, 13, 124 )
	SummaryTitle:setTopBottom( true, false, 0, 25 )
	SummaryTitle:setText( Engine.Localize( "MENU_ARENA_SNAPSHOT_CAPS" ) )
	SummaryTitle:setTTF( "fonts/default.ttf" )
	self:addElement( SummaryTitle )
	self.SummaryTitle = SummaryTitle
	
	local TimePlayedText = LUI.UITightText.new()
	TimePlayedText:setLeftRight( false, true, -211.17, -64 )
	TimePlayedText:setTopBottom( true, false, 5, 25 )
	TimePlayedText:setText( SecondsAsTimePlayedString( CombatRecordGetStat( controller, "playerstatslist.time_played_total", "Played 8d 19h 33m 19s" ) ) )
	TimePlayedText:setTTF( "fonts/default.ttf" )
	self:addElement( TimePlayedText )
	self.TimePlayedText = TimePlayedText
	
	local Emblem = LUI.UIImage.new()
	Emblem:setLeftRight( false, false, -583, -455 )
	Emblem:setTopBottom( true, false, 41, 169 )
	Emblem:setImage( RegisterImage( GetArenaRankIconLG( CombatRecordGetStat( controller, "arenaBest.points", "uie_t7_icon_rank_arena_level_21_lrg" ) ) ) )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local RankNameBackground = LUI.UIImage.new()
	RankNameBackground:setLeftRight( false, false, -429, -283 )
	RankNameBackground:setTopBottom( true, false, 77, 105 )
	RankNameBackground:setAlpha( 0.7 )
	self:addElement( RankNameBackground )
	self.RankNameBackground = RankNameBackground
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( false, false, -429, -283 )
	RankBackground:setTopBottom( true, false, 105, 133 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0.8 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local RankName = LUI.UIText.new()
	RankName:setLeftRight( false, false, -429, -283 )
	RankName:setTopBottom( true, false, 81, 101 )
	RankName:setRGB( 0, 0, 0 )
	RankName:setText( Engine.Localize( SetValueIfEmptyString( "--", CombatRecordGetArenaBestPlaylistName( controller, "-" ) ) ) )
	RankName:setTTF( "fonts/escom.ttf" )
	RankName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	RankName:setShaderVector( 0, 0.05, 0, 0, 0 )
	RankName:setShaderVector( 1, 0, 0, 0, 0 )
	RankName:setShaderVector( 2, 1, 0, 0, 0 )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RankName )
	self.RankName = RankName
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( false, false, -429, -283 )
	Rank:setTopBottom( true, false, 105, 133 )
	Rank:setText( Engine.Localize( GetArenaRankName( CombatRecordGetStat( controller, "arenaBest.points", "Rank 15" ) ) ) )
	Rank:setTTF( "fonts/escom.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Rank )
	self.Rank = Rank
	
	local Kills = CoD.CombatRecordSummaryStat.new( menu, controller )
	Kills:setLeftRight( true, false, 394, 499.17 )
	Kills:setTopBottom( true, false, 48, 94 )
	Kills.StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	Kills.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.kills", "888" ) ) )
	self:addElement( Kills )
	self.Kills = Kills
	
	local Wins = CoD.CombatRecordSummaryStat.new( menu, controller )
	Wins:setLeftRight( true, false, 510.17, 624.83 )
	Wins:setTopBottom( true, false, 48, 94 )
	Wins.StatLabel:setText( Engine.Localize( "MENU_WINS_CAPS" ) )
	Wins.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.wins", "888" ) ) )
	self:addElement( Wins )
	self.Wins = Wins
	
	local Score = CoD.CombatRecordSummaryStat.new( menu, controller )
	Score:setLeftRight( true, false, 630.83, 754.5 )
	Score:setTopBottom( true, false, 49, 95 )
	Score.StatLabel:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	Score.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.score", "888" ) ) )
	self:addElement( Score )
	self.Score = Score
	
	local KDRatio = CoD.CombatRecordSummaryStatSmall.new( menu, controller )
	KDRatio:setLeftRight( true, false, 394, 499.17 )
	KDRatio:setTopBottom( true, false, 123, 159 )
	KDRatio.StatLabel:setText( Engine.Localize( "MENU_KDRATIO_ABBR" ) )
	KDRatio.StatValue:setText( Engine.Localize( CombatRecordGetTwoStatRatio( controller, "playerstatslist.kills", "playerstatslist.deaths", "0.93" ) ) )
	self:addElement( KDRatio )
	self.KDRatio = KDRatio
	
	local WLRatio = CoD.CombatRecordSummaryStatSmall.new( menu, controller )
	WLRatio:setLeftRight( true, false, 512.17, 624.83 )
	WLRatio:setTopBottom( true, false, 123, 159 )
	WLRatio.StatLabel:setText( Engine.Localize( "MENU_WLRATIO" ) )
	WLRatio.StatValue:setText( Engine.Localize( CombatRecordGetTwoStatRatio( controller, "playerstatslist.wins", "playerstatslist.losses", "0.93" ) ) )
	self:addElement( WLRatio )
	self.WLRatio = WLRatio
	
	local SPM = CoD.CombatRecordSummaryStatSmall.new( menu, controller )
	SPM:setLeftRight( true, false, 630.83, 754.5 )
	SPM:setTopBottom( true, false, 123, 159 )
	SPM.StatLabel:setText( Engine.Localize( "MENU_SCORE_PER_MINUTE" ) )
	SPM.StatValue:setText( Engine.Localize( CombatRecordGetSPM( controller, "playerstatslist.score", "playerstatslist.time_played_total", "425" ) ) )
	self:addElement( SPM )
	self.SPM = SPM
	
	local WeaponsButton = CoD.CombatRecordItemButton.new( menu, controller )
	WeaponsButton:setLeftRight( true, false, -1.5, 368.5 )
	WeaponsButton:setTopBottom( true, false, 193.5, 357.5 )
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
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	WeaponsButton:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( WeaponsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenOverlay( self, "CombatRecordWeapons", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( WeaponsButton )
	self.WeaponsButton = WeaponsButton
	
	local EquipmentButton = CoD.CombatRecordItemButton.new( menu, controller )
	EquipmentButton:setLeftRight( true, false, -1.5, 368.5 )
	EquipmentButton:setTopBottom( true, false, 358, 522 )
	EquipmentButton.WeaponImage:setAlpha( 0 )
	EquipmentButton.GameModeImage2:setAlpha( 0 )
	EquipmentButton.ButtonTitle:setText( Engine.Localize( "MENU_EQUIPMENT" ) )
	EquipmentButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestEquipment", "itemIndex", function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			EquipmentButton.ItemImage:setImage( RegisterImage( AppendIfMatch( "menu_mp_lobby_none_selected", "_new", GetItemImageByIndexAndMode( "mp", itemIndex ) ) ) )
		end
	end )
	EquipmentButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestEquipment", "itemName", function ( model )
		local itemName = Engine.GetModelValue( model )
		if itemName then
			EquipmentButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_MOST_EFFECTIVE", itemName ) )
		end
	end )
	EquipmentButton:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	EquipmentButton:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	menu:AddButtonCallbackFunction( EquipmentButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenOverlay( self, "CombatRecordEquipment", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( EquipmentButton )
	self.EquipmentButton = EquipmentButton
	
	local SpecialistButton = CoD.CombatRecordItemButton.new( menu, controller )
	SpecialistButton:setLeftRight( true, false, 392, 762 )
	SpecialistButton:setTopBottom( true, false, 193.5, 357.5 )
	SpecialistButton.WeaponImage:setAlpha( 0 )
	SpecialistButton.GameModeImage2:setAlpha( 0 )
	SpecialistButton.ButtonTitle:setText( Engine.Localize( "MENU_SPECIALISTS" ) )
	SpecialistButton:subscribeToGlobalModel( controller, "FavoriteSpecialist", "heroImage", function ( model )
		local heroImage = Engine.GetModelValue( model )
		if heroImage then
			SpecialistButton.ItemImage:setImage( RegisterImage( heroImage ) )
		end
	end )
	SpecialistButton:subscribeToGlobalModel( controller, "FavoriteSpecialist", "heroName", function ( model )
		local heroName = Engine.GetModelValue( model )
		if heroName then
			SpecialistButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_DEADLIEST", heroName ) )
		end
	end )
	SpecialistButton:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f17_local0
	end )
	SpecialistButton:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	menu:AddButtonCallbackFunction( SpecialistButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenOverlay( self, "CombatRecordSpecialists", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( SpecialistButton )
	self.SpecialistButton = SpecialistButton
	
	local ScorestreakButton = CoD.CombatRecordItemButton.new( menu, controller )
	ScorestreakButton:setLeftRight( true, false, 392, 762 )
	ScorestreakButton:setTopBottom( true, false, 358, 522 )
	ScorestreakButton.WeaponImage:setAlpha( 0 )
	ScorestreakButton.GameModeImage2:setAlpha( 0 )
	ScorestreakButton.ButtonTitle:setText( Engine.Localize( "MENU_SCORESTREAKS" ) )
	ScorestreakButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestScorestreak", "itemIndex", function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			ScorestreakButton.ItemImage:setImage( RegisterImage( AppendIfMatch( "menu_mp_lobby_none_selected", "_new", AppendIfNotMatch( "menu_mp_lobby_none_selected", "_menu", GetItemImageByIndexAndMode( "mp", itemIndex ) ) ) ) )
		end
	end )
	ScorestreakButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestScorestreak", "itemName", function ( model )
		local itemName = Engine.GetModelValue( model )
		if itemName then
			ScorestreakButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_MOST_EFFECTIVE", itemName ) )
		end
	end )
	ScorestreakButton:registerEventHandler( "gain_focus", function ( element, event )
		local f23_local0 = nil
		if element.gainFocus then
			f23_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f23_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f23_local0
	end )
	ScorestreakButton:registerEventHandler( "lose_focus", function ( element, event )
		local f24_local0 = nil
		if element.loseFocus then
			f24_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f24_local0 = element.super:loseFocus( event )
		end
		return f24_local0
	end )
	menu:AddButtonCallbackFunction( ScorestreakButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenOverlay( self, "CombatRecordScorestreaks", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ScorestreakButton )
	self.ScorestreakButton = ScorestreakButton
	
	local CombatRecordItemButton0 = CoD.CombatRecordItemButton.new( menu, controller )
	CombatRecordItemButton0:setLeftRight( true, false, 782, 1152 )
	CombatRecordItemButton0:setTopBottom( true, false, 193.5, 522 )
	CombatRecordItemButton0.WeaponImage:setAlpha( 0 )
	CombatRecordItemButton0.ItemImage:setAlpha( 0 )
	CombatRecordItemButton0.ButtonTitle:setText( Engine.Localize( "MENU_CHALLENGES_GAMEMODES" ) )
	CombatRecordItemButton0:subscribeToGlobalModel( controller, "CombatRecordMostWonGameMode", "image", function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			CombatRecordItemButton0.ItemImage:setImage( RegisterImage( image ) )
		end
	end )
	CombatRecordItemButton0:subscribeToGlobalModel( controller, "CombatRecordMostWonGameMode", "image", function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			CombatRecordItemButton0.GameModeImage2:setImage( RegisterImage( image ) )
		end
	end )
	CombatRecordItemButton0:subscribeToGlobalModel( controller, "CombatRecordMostWonGameMode", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			CombatRecordItemButton0.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_MOST_WINS", name ) )
		end
	end )
	CombatRecordItemButton0:registerEventHandler( "gain_focus", function ( element, event )
		local f30_local0 = nil
		if element.gainFocus then
			f30_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f30_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f30_local0
	end )
	CombatRecordItemButton0:registerEventHandler( "lose_focus", function ( element, event )
		local f31_local0 = nil
		if element.loseFocus then
			f31_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f31_local0 = element.super:loseFocus( event )
		end
		return f31_local0
	end )
	menu:AddButtonCallbackFunction( CombatRecordItemButton0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenOverlay( self, "CombatRecordGameModes", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( CombatRecordItemButton0 )
	self.CombatRecordItemButton0 = CombatRecordItemButton0
	
	local Line10 = LUI.UIImage.new()
	Line10:setLeftRight( true, true, 0, -1191 )
	Line10:setTopBottom( true, false, 25, 33 )
	Line10:setAlpha( 0.66 )
	Line10:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Line10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line10 )
	self.Line10 = Line10
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, true, 0, -1191 )
	Image3:setTopBottom( true, false, 179, 187 )
	Image3:setAlpha( 0.66 )
	Image3:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, true, 1127, -64 )
	Image4:setTopBottom( true, false, 25, 33 )
	Image4:setAlpha( 0.66 )
	Image4:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, true, 1127, -64 )
	Image5:setTopBottom( true, false, 179, 187 )
	Image5:setAlpha( 0.66 )
	Image5:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local CombatRecordLineDivider = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider:setLeftRight( true, false, 758, 783 )
	CombatRecordLineDivider:setTopBottom( true, false, 25, 38 )
	self:addElement( CombatRecordLineDivider )
	self.CombatRecordLineDivider = CombatRecordLineDivider
	
	local CombatRecordLineDivider0 = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider0:setLeftRight( true, false, 757, 782 )
	CombatRecordLineDivider0:setTopBottom( true, false, 174, 187 )
	CombatRecordLineDivider0:setZRot( 180 )
	self:addElement( CombatRecordLineDivider0 )
	self.CombatRecordLineDivider0 = CombatRecordLineDivider0
	
	local CombatRecordLineDivider1 = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider1:setLeftRight( true, false, 368, 393 )
	CombatRecordLineDivider1:setTopBottom( true, false, 25, 38 )
	self:addElement( CombatRecordLineDivider1 )
	self.CombatRecordLineDivider1 = CombatRecordLineDivider1
	
	local CombatRecordLineDivider2 = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider2:setLeftRight( true, false, 367, 392 )
	CombatRecordLineDivider2:setTopBottom( true, false, 174, 187 )
	CombatRecordLineDivider2:setZRot( 180 )
	self:addElement( CombatRecordLineDivider2 )
	self.CombatRecordLineDivider2 = CombatRecordLineDivider2
	
	local BestCareerRankLabel = LUI.UITightText.new()
	BestCareerRankLabel:setLeftRight( true, false, 179, 379 )
	BestCareerRankLabel:setTopBottom( true, false, 54, 74 )
	BestCareerRankLabel:setText( Engine.Localize( "MENU_BEST_CAREER_RANK_CAPS" ) )
	BestCareerRankLabel:setTTF( "fonts/default.ttf" )
	self:addElement( BestCareerRankLabel )
	self.BestCareerRankLabel = BestCareerRankLabel
	
	local Image50 = LUI.UIImage.new()
	Image50:setLeftRight( true, true, 0, -64 )
	Image50:setTopBottom( true, false, 181.5, 184.5 )
	Image50:setAlpha( 0.25 )
	Image50:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image50:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image50 )
	self.Image50 = Image50
	
	local Image500 = LUI.UIImage.new()
	Image500:setLeftRight( true, true, 0, -64 )
	Image500:setTopBottom( true, false, 27.5, 30.5 )
	Image500:setAlpha( 0.25 )
	Image500:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image500:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image500 )
	self.Image500 = Image500
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 379.5, 381.5 )
	Image0:setTopBottom( true, false, 30, 183 )
	Image0:setAlpha( 0.35 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 769.5, 771.5 )
	Image1:setTopBottom( true, false, 28, 186 )
	Image1:setAlpha( 0.35 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, true, 394, -714.83 )
	Image00:setTopBottom( false, true, -441, -435 )
	Image00:setAlpha( 0.25 )
	Image00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, true, 514.92, -593.92 )
	Image2:setTopBottom( false, true, -441, -435 )
	Image2:setAlpha( 0.25 )
	Image2:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, true, 639.92, -468.92 )
	Image6:setTopBottom( false, true, -441, -435 )
	Image6:setAlpha( 0.25 )
	Image6:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Vline2 = LUI.UIImage.new()
	Vline2:setLeftRight( true, false, 507.17, 509.17 )
	Vline2:setTopBottom( true, false, 33, 179 )
	Vline2:setAlpha( 0.35 )
	Vline2:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline2 )
	self.Vline2 = Vline2
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( true, false, 629.83, 631.83 )
	Image20:setTopBottom( true, false, 33, 179 )
	Image20:setAlpha( 0.35 )
	Image20:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( false, false, -431, -281 )
	StartMenuframenoBG00:setTopBottom( false, false, -198, -138 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	WeaponsButton.navigation = {
		right = SpecialistButton,
		down = EquipmentButton
	}
	EquipmentButton.navigation = {
		up = WeaponsButton,
		right = ScorestreakButton
	}
	SpecialistButton.navigation = {
		left = WeaponsButton,
		right = CombatRecordItemButton0,
		down = ScorestreakButton
	}
	ScorestreakButton.navigation = {
		left = EquipmentButton,
		up = SpecialistButton,
		right = CombatRecordItemButton0
	}
	CombatRecordItemButton0.navigation = {
		left = {
			SpecialistButton,
			ScorestreakButton
		}
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				local EmblemFrame2 = function ( Emblem, event )
					if not event.interrupted then
						Emblem:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					Emblem:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Emblem, event )
					else
						Emblem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Emblem:completeAnimation()
				self.Emblem:setAlpha( 0 )
				EmblemFrame2( Emblem, {} )
				local f34_local1 = function ( f36_arg0, f36_arg1 )
					if not f36_arg1.interrupted then
						f36_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					f36_arg0:setAlpha( 1 )
					if f36_arg1.interrupted then
						self.clipFinished( f36_arg0, f36_arg1 )
					else
						f36_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankName:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				RankName:setAlpha( 0 )
				RankName:registerEventHandler( "transition_complete_keyframe", f34_local1 )
				local f34_local2 = function ( f37_arg0, f37_arg1 )
					if not f37_arg1.interrupted then
						f37_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Bounce )
					end
					f37_arg0:setAlpha( 1 )
					if f37_arg1.interrupted then
						self.clipFinished( f37_arg0, f37_arg1 )
					else
						f37_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				Rank:setAlpha( 0 )
				Rank:registerEventHandler( "transition_complete_keyframe", f34_local2 )
				local f34_local3 = function ( f38_arg0, f38_arg1 )
					if not f38_arg1.interrupted then
						f38_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					f38_arg0:setAlpha( 1 )
					if f38_arg1.interrupted then
						self.clipFinished( f38_arg0, f38_arg1 )
					else
						f38_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Kills:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				Kills:setAlpha( 0 )
				Kills:registerEventHandler( "transition_complete_keyframe", f34_local3 )
				local f34_local4 = function ( f39_arg0, f39_arg1 )
					if not f39_arg1.interrupted then
						f39_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					f39_arg0:setAlpha( 1 )
					if f39_arg1.interrupted then
						self.clipFinished( f39_arg0, f39_arg1 )
					else
						f39_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Wins:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
				Wins:setAlpha( 0 )
				Wins:registerEventHandler( "transition_complete_keyframe", f34_local4 )
				local f34_local5 = function ( f40_arg0, f40_arg1 )
					if not f40_arg1.interrupted then
						f40_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
					end
					f40_arg0:setAlpha( 1 )
					if f40_arg1.interrupted then
						self.clipFinished( f40_arg0, f40_arg1 )
					else
						f40_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Score:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				Score:setAlpha( 0 )
				Score:registerEventHandler( "transition_complete_keyframe", f34_local5 )
				local f34_local6 = function ( f41_arg0, f41_arg1 )
					if not f41_arg1.interrupted then
						f41_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					f41_arg0:setAlpha( 1 )
					if f41_arg1.interrupted then
						self.clipFinished( f41_arg0, f41_arg1 )
					else
						f41_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				KDRatio:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				KDRatio:setAlpha( 0 )
				KDRatio:registerEventHandler( "transition_complete_keyframe", f34_local6 )
				local f34_local7 = function ( f42_arg0, f42_arg1 )
					if not f42_arg1.interrupted then
						f42_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
					end
					f42_arg0:setAlpha( 1 )
					if f42_arg1.interrupted then
						self.clipFinished( f42_arg0, f42_arg1 )
					else
						f42_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WLRatio:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				WLRatio:setAlpha( 0 )
				WLRatio:registerEventHandler( "transition_complete_keyframe", f34_local7 )
				local f34_local8 = function ( f43_arg0, f43_arg1 )
					if not f43_arg1.interrupted then
						f43_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					f43_arg0:setAlpha( 1 )
					if f43_arg1.interrupted then
						self.clipFinished( f43_arg0, f43_arg1 )
					else
						f43_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SPM:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				SPM:setAlpha( 0 )
				SPM:registerEventHandler( "transition_complete_keyframe", f34_local8 )
				local WeaponsButtonFrame2 = function ( WeaponsButton, event )
					local WeaponsButtonFrame3 = function ( WeaponsButton, event )
						local WeaponsButtonFrame4 = function ( WeaponsButton, event )
							if not event.interrupted then
								WeaponsButton:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							WeaponsButton:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( WeaponsButton, event )
							else
								WeaponsButton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							WeaponsButtonFrame4( WeaponsButton, event )
							return 
						else
							WeaponsButton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							WeaponsButton:setAlpha( 0.54 )
							WeaponsButton:registerEventHandler( "transition_complete_keyframe", WeaponsButtonFrame4 )
						end
					end
					
					if event.interrupted then
						WeaponsButtonFrame3( WeaponsButton, event )
						return 
					else
						WeaponsButton:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Bounce )
						WeaponsButton:setAlpha( 1 )
						WeaponsButton:registerEventHandler( "transition_complete_keyframe", WeaponsButtonFrame3 )
					end
				end
				
				WeaponsButton:completeAnimation()
				self.WeaponsButton:setAlpha( 0 )
				WeaponsButtonFrame2( WeaponsButton, {} )
				local EquipmentButtonFrame2 = function ( EquipmentButton, event )
					local EquipmentButtonFrame3 = function ( EquipmentButton, event )
						local EquipmentButtonFrame4 = function ( EquipmentButton, event )
							local EquipmentButtonFrame5 = function ( EquipmentButton, event )
								if not event.interrupted then
									EquipmentButton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								EquipmentButton:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( EquipmentButton, event )
								else
									EquipmentButton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								EquipmentButtonFrame5( EquipmentButton, event )
								return 
							else
								EquipmentButton:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								EquipmentButton:setAlpha( 0.52 )
								EquipmentButton:registerEventHandler( "transition_complete_keyframe", EquipmentButtonFrame5 )
							end
						end
						
						if event.interrupted then
							EquipmentButtonFrame4( EquipmentButton, event )
							return 
						else
							EquipmentButton:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Bounce )
							EquipmentButton:setAlpha( 1 )
							EquipmentButton:registerEventHandler( "transition_complete_keyframe", EquipmentButtonFrame4 )
						end
					end
					
					if event.interrupted then
						EquipmentButtonFrame3( EquipmentButton, event )
						return 
					else
						EquipmentButton:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						EquipmentButton:registerEventHandler( "transition_complete_keyframe", EquipmentButtonFrame3 )
					end
				end
				
				EquipmentButton:completeAnimation()
				self.EquipmentButton:setAlpha( 0 )
				EquipmentButtonFrame2( EquipmentButton, {} )
				local SpecialistButtonFrame2 = function ( SpecialistButton, event )
					local SpecialistButtonFrame3 = function ( SpecialistButton, event )
						local SpecialistButtonFrame4 = function ( SpecialistButton, event )
							local SpecialistButtonFrame5 = function ( SpecialistButton, event )
								if not event.interrupted then
									SpecialistButton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								SpecialistButton:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( SpecialistButton, event )
								else
									SpecialistButton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								SpecialistButtonFrame5( SpecialistButton, event )
								return 
							else
								SpecialistButton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								SpecialistButton:setAlpha( 0.54 )
								SpecialistButton:registerEventHandler( "transition_complete_keyframe", SpecialistButtonFrame5 )
							end
						end
						
						if event.interrupted then
							SpecialistButtonFrame4( SpecialistButton, event )
							return 
						else
							SpecialistButton:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							SpecialistButton:registerEventHandler( "transition_complete_keyframe", SpecialistButtonFrame4 )
						end
					end
					
					if event.interrupted then
						SpecialistButtonFrame3( SpecialistButton, event )
						return 
					else
						SpecialistButton:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						SpecialistButton:setAlpha( 1 )
						SpecialistButton:registerEventHandler( "transition_complete_keyframe", SpecialistButtonFrame3 )
					end
				end
				
				SpecialistButton:completeAnimation()
				self.SpecialistButton:setAlpha( 0 )
				SpecialistButtonFrame2( SpecialistButton, {} )
				local ScorestreakButtonFrame2 = function ( ScorestreakButton, event )
					local ScorestreakButtonFrame3 = function ( ScorestreakButton, event )
						local ScorestreakButtonFrame4 = function ( ScorestreakButton, event )
							local ScorestreakButtonFrame5 = function ( ScorestreakButton, event )
								if not event.interrupted then
									ScorestreakButton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								ScorestreakButton:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( ScorestreakButton, event )
								else
									ScorestreakButton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ScorestreakButtonFrame5( ScorestreakButton, event )
								return 
							else
								ScorestreakButton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ScorestreakButton:setAlpha( 0.59 )
								ScorestreakButton:registerEventHandler( "transition_complete_keyframe", ScorestreakButtonFrame5 )
							end
						end
						
						if event.interrupted then
							ScorestreakButtonFrame4( ScorestreakButton, event )
							return 
						else
							ScorestreakButton:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Bounce )
							ScorestreakButton:setAlpha( 1 )
							ScorestreakButton:registerEventHandler( "transition_complete_keyframe", ScorestreakButtonFrame4 )
						end
					end
					
					if event.interrupted then
						ScorestreakButtonFrame3( ScorestreakButton, event )
						return 
					else
						ScorestreakButton:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						ScorestreakButton:registerEventHandler( "transition_complete_keyframe", ScorestreakButtonFrame3 )
					end
				end
				
				ScorestreakButton:completeAnimation()
				self.ScorestreakButton:setAlpha( 0 )
				ScorestreakButtonFrame2( ScorestreakButton, {} )
				local CombatRecordItemButton0Frame2 = function ( CombatRecordItemButton0, event )
					local CombatRecordItemButton0Frame3 = function ( CombatRecordItemButton0, event )
						local CombatRecordItemButton0Frame4 = function ( CombatRecordItemButton0, event )
							local CombatRecordItemButton0Frame5 = function ( CombatRecordItemButton0, event )
								if not event.interrupted then
									CombatRecordItemButton0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								CombatRecordItemButton0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( CombatRecordItemButton0, event )
								else
									CombatRecordItemButton0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CombatRecordItemButton0Frame5( CombatRecordItemButton0, event )
								return 
							else
								CombatRecordItemButton0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								CombatRecordItemButton0:setAlpha( 0.34 )
								CombatRecordItemButton0:registerEventHandler( "transition_complete_keyframe", CombatRecordItemButton0Frame5 )
							end
						end
						
						if event.interrupted then
							CombatRecordItemButton0Frame4( CombatRecordItemButton0, event )
							return 
						else
							CombatRecordItemButton0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							CombatRecordItemButton0:setAlpha( 1 )
							CombatRecordItemButton0:registerEventHandler( "transition_complete_keyframe", CombatRecordItemButton0Frame4 )
						end
					end
					
					if event.interrupted then
						CombatRecordItemButton0Frame3( CombatRecordItemButton0, event )
						return 
					else
						CombatRecordItemButton0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						CombatRecordItemButton0:registerEventHandler( "transition_complete_keyframe", CombatRecordItemButton0Frame3 )
					end
				end
				
				CombatRecordItemButton0:completeAnimation()
				self.CombatRecordItemButton0:setAlpha( 0 )
				CombatRecordItemButton0Frame2( CombatRecordItemButton0, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	WeaponsButton.id = "WeaponsButton"
	EquipmentButton.id = "EquipmentButton"
	SpecialistButton.id = "SpecialistButton"
	ScorestreakButton.id = "ScorestreakButton"
	CombatRecordItemButton0.id = "CombatRecordItemButton0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.WeaponsButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Kills:close()
		element.Wins:close()
		element.Score:close()
		element.KDRatio:close()
		element.WLRatio:close()
		element.SPM:close()
		element.WeaponsButton:close()
		element.EquipmentButton:close()
		element.SpecialistButton:close()
		element.ScorestreakButton:close()
		element.CombatRecordItemButton0:close()
		element.CombatRecordLineDivider:close()
		element.CombatRecordLineDivider0:close()
		element.CombatRecordLineDivider1:close()
		element.CombatRecordLineDivider2:close()
		element.StartMenuframenoBG00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

