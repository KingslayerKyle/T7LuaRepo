require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordEquipment" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordGameModes" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordScorestreaks" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordSpecialists" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordWeapons" )
require( "ui.uieditor.widgets.Barracks.CombatRecord_LineDivider" )
require( "ui.uieditor.widgets.Barracks.CombatRecordItemButton" )
require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStat" )
require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStatSmall" )
require( "ui.uieditor.widgets.Prestige.Prestige_MasterTierWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local PostLoadFunc = function ( self, controller )
	CoD.CombatRecordMode = "public"
end

CoD.CombatRecordPublicMatchPanel = InheritFrom( LUI.UIElement )
CoD.CombatRecordPublicMatchPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordPublicMatchPanel )
	self.id = "CombatRecordPublicMatchPanel"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1824 )
	self:setTopBottom( 0, 0, 0, 819 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 0, 0, 572 )
	BlackTint:setTopBottom( 0, 0, 45, 271 )
	BlackTint:setAlpha( 0 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local BlackTint2 = LUI.UIImage.new()
	BlackTint2:setLeftRight( 0, 0, 588, 1138 )
	BlackTint2:setTopBottom( 0, 0, 45, 271 )
	BlackTint2:setAlpha( 0 )
	self:addElement( BlackTint2 )
	self.BlackTint2 = BlackTint2
	
	local BlackTint3 = LUI.UIImage.new()
	BlackTint3:setLeftRight( 0, 0, 1154, 1728 )
	BlackTint3:setTopBottom( 0, 0, 45, 271 )
	BlackTint3:setAlpha( 0 )
	self:addElement( BlackTint3 )
	self.BlackTint3 = BlackTint3
	
	local SummaryTitle = LUI.UITightText.new()
	SummaryTitle:setLeftRight( 0, 0, 19, 261 )
	SummaryTitle:setTopBottom( 0, 0, 0, 38 )
	SummaryTitle:setText( Engine.Localize( "MENU_PUBLIC_MATCH_SNAPSHOT_CAPS" ) )
	SummaryTitle:setTTF( "fonts/default.ttf" )
	self:addElement( SummaryTitle )
	self.SummaryTitle = SummaryTitle
	
	local TimePlayedText = LUI.UITightText.new()
	TimePlayedText:setLeftRight( 1, 1, -317, -96 )
	TimePlayedText:setTopBottom( 0, 0, 7, 37 )
	TimePlayedText:setText( SecondsAsTimePlayedString( CombatRecordGetStat( controller, "playerstatslist.time_played_total", "Played 8d 19h 33m 19s" ) ) )
	TimePlayedText:setTTF( "fonts/default.ttf" )
	self:addElement( TimePlayedText )
	self.TimePlayedText = TimePlayedText
	
	local Emblem = LUI.UIImage.new()
	Emblem:setLeftRight( 0.5, 0.5, -874, -682 )
	Emblem:setTopBottom( 0, 0, 62, 254 )
	Emblem:setImage( RegisterImage( GetRankIconLarge( CombatRecordGetRankIcon( controller, "uie_t7_icon_rank_mp_level_25_lrg" ) ) ) )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local RankNameBackground = LUI.UIImage.new()
	RankNameBackground:setLeftRight( 0.5, 0.5, -673, -384 )
	RankNameBackground:setTopBottom( 0, 0, 115, 157 )
	RankNameBackground:setAlpha( 0.7 )
	self:addElement( RankNameBackground )
	self.RankNameBackground = RankNameBackground
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( 0.5, 0.5, -673, -384 )
	RankBackground:setTopBottom( 0, 0, 157, 199 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0.8 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local RankName = LUI.UIText.new()
	RankName:setLeftRight( 0.5, 0.5, -673, -384 )
	RankName:setTopBottom( 0, 0, 121, 151 )
	RankName:setRGB( 0, 0, 0 )
	RankName:setText( Engine.Localize( CombatRecordGetRankTitle( controller, "Vindicator" ) ) )
	RankName:setTTF( "fonts/escom.ttf" )
	RankName:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	RankName:setShaderVector( 0, 0.05, 0, 0, 0 )
	RankName:setShaderVector( 1, 0, 0, 0, 0 )
	RankName:setShaderVector( 2, 1, 0, 0, 0 )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RankName )
	self.RankName = RankName
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( 0.5, 0.5, -670, -387 )
	Rank:setTopBottom( 0, 0, 160, 198 )
	Rank:setRGB( CombatRecordGetParagonColorByRank( controller, 255, 255, 255, 1, 1, 1 ) )
	Rank:setText( CombatRecordGetLevelString( controller, "Level 88" ) )
	Rank:setTTF( "fonts/escom.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Rank )
	self.Rank = Rank
	
	local WeaponsButton = CoD.CombatRecordItemButton.new( menu, controller )
	WeaponsButton:setLeftRight( 0, 0, -2.5, 552.5 )
	WeaponsButton:setTopBottom( 0, 0, 290, 536 )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( WeaponsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenOverlay( self, "CombatRecordWeapons", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( WeaponsButton )
	self.WeaponsButton = WeaponsButton
	
	local EquipmentButton = CoD.CombatRecordItemButton.new( menu, controller )
	EquipmentButton:setLeftRight( 0, 0, -2.5, 552.5 )
	EquipmentButton:setTopBottom( 0, 0, 537, 783 )
	EquipmentButton.WeaponImage:setAlpha( 0 )
	EquipmentButton.GameModeImage2:setAlpha( 0 )
	EquipmentButton.ButtonTitle:setText( Engine.Localize( "MENU_EQUIPMENT" ) )
	EquipmentButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestEquipment", "itemIndex", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EquipmentButton.ItemImage:setImage( RegisterImage( AppendIfMatch( "menu_mp_lobby_none_selected", "_new", GetItemImageByIndexAndMode( "mp", modelValue ) ) ) )
		end
	end )
	EquipmentButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestEquipment", "itemName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EquipmentButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_MOST_EFFECTIVE", modelValue ) )
		end
	end )
	EquipmentButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	EquipmentButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( EquipmentButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenOverlay( self, "CombatRecordEquipment", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( EquipmentButton )
	self.EquipmentButton = EquipmentButton
	
	local SpecialistButton = CoD.CombatRecordItemButton.new( menu, controller )
	SpecialistButton:setLeftRight( 0, 0, 588.5, 1143.5 )
	SpecialistButton:setTopBottom( 0, 0, 290, 536 )
	SpecialistButton.WeaponImage:setAlpha( 0 )
	SpecialistButton.GameModeImage2:setAlpha( 0 )
	SpecialistButton.ButtonTitle:setText( Engine.Localize( "MENU_SPECIALISTS" ) )
	SpecialistButton:subscribeToGlobalModel( controller, "FavoriteSpecialist", "heroImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SpecialistButton.ItemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	SpecialistButton:subscribeToGlobalModel( controller, "FavoriteSpecialist", "heroName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SpecialistButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_DEADLIEST", modelValue ) )
		end
	end )
	SpecialistButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	SpecialistButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( SpecialistButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenOverlay( self, "CombatRecordSpecialists", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( SpecialistButton )
	self.SpecialistButton = SpecialistButton
	
	local ScorestreakButton = CoD.CombatRecordItemButton.new( menu, controller )
	ScorestreakButton:setLeftRight( 0, 0, 588.5, 1143.5 )
	ScorestreakButton:setTopBottom( 0, 0, 537, 783 )
	ScorestreakButton.WeaponImage:setAlpha( 0 )
	ScorestreakButton.GameModeImage2:setAlpha( 0 )
	ScorestreakButton.ButtonTitle:setText( Engine.Localize( "MENU_SCORESTREAKS" ) )
	ScorestreakButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestScorestreak", "itemIndex", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScorestreakButton.ItemImage:setImage( RegisterImage( AppendIfMatch( "menu_mp_lobby_none_selected", "_new", AppendIfNotMatch( "menu_mp_lobby_none_selected", "_menu", GetItemImageByIndexAndMode( "mp", modelValue ) ) ) ) )
		end
	end )
	ScorestreakButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestScorestreak", "itemName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScorestreakButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_MOST_EFFECTIVE", modelValue ) )
		end
	end )
	ScorestreakButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ScorestreakButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ScorestreakButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenOverlay( self, "CombatRecordScorestreaks", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( ScorestreakButton )
	self.ScorestreakButton = ScorestreakButton
	
	local CombatRecordItemButton0 = CoD.CombatRecordItemButton.new( menu, controller )
	CombatRecordItemButton0:setLeftRight( 0, 0, 1172.5, 1727.5 )
	CombatRecordItemButton0:setTopBottom( 0, 0, 290, 783 )
	CombatRecordItemButton0.WeaponImage:setAlpha( 0 )
	CombatRecordItemButton0.ItemImage:setAlpha( 0 )
	CombatRecordItemButton0.ButtonTitle:setText( Engine.Localize( "MENU_CHALLENGES_GAMEMODES" ) )
	CombatRecordItemButton0:subscribeToGlobalModel( controller, "CombatRecordMostWonGameMode", "image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CombatRecordItemButton0.ItemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	CombatRecordItemButton0:subscribeToGlobalModel( controller, "CombatRecordMostWonGameMode", "image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CombatRecordItemButton0.GameModeImage2:setImage( RegisterImage( modelValue ) )
		end
	end )
	CombatRecordItemButton0:subscribeToGlobalModel( controller, "CombatRecordMostWonGameMode", "name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CombatRecordItemButton0.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_MOST_WINS", modelValue ) )
		end
	end )
	CombatRecordItemButton0:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CombatRecordItemButton0:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CombatRecordItemButton0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenOverlay( self, "CombatRecordGameModes", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( CombatRecordItemButton0 )
	self.CombatRecordItemButton0 = CombatRecordItemButton0
	
	local Line10 = LUI.UIImage.new()
	Line10:setLeftRight( 0, 1, 0, -1786 )
	Line10:setTopBottom( 0, 0, 38, 50 )
	Line10:setAlpha( 0.66 )
	Line10:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Line10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line10 )
	self.Line10 = Line10
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 1, 0, -1786 )
	Image3:setTopBottom( 0, 0, 268, 280 )
	Image3:setAlpha( 0.66 )
	Image3:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 0, 1, 1690, -96 )
	Image4:setTopBottom( 0, 0, 38, 50 )
	Image4:setAlpha( 0.66 )
	Image4:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( 0, 1, 1690, -96 )
	Image5:setTopBottom( 0, 0, 268, 280 )
	Image5:setAlpha( 0.66 )
	Image5:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local CombatRecordLineDivider = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider:setLeftRight( 0, 0, 1137, 1175 )
	CombatRecordLineDivider:setTopBottom( 0, 0, 37, 57 )
	self:addElement( CombatRecordLineDivider )
	self.CombatRecordLineDivider = CombatRecordLineDivider
	
	local CombatRecordLineDivider0 = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider0:setLeftRight( 0, 0, 1135, 1173 )
	CombatRecordLineDivider0:setTopBottom( 0, 0, 261, 281 )
	CombatRecordLineDivider0:setZRot( 180 )
	self:addElement( CombatRecordLineDivider0 )
	self.CombatRecordLineDivider0 = CombatRecordLineDivider0
	
	local CombatRecordLineDivider1 = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider1:setLeftRight( 0, 0, 552, 590 )
	CombatRecordLineDivider1:setTopBottom( 0, 0, 37, 57 )
	self:addElement( CombatRecordLineDivider1 )
	self.CombatRecordLineDivider1 = CombatRecordLineDivider1
	
	local CombatRecordLineDivider2 = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider2:setLeftRight( 0, 0, 552, 590 )
	CombatRecordLineDivider2:setTopBottom( 0, 0, 261, 281 )
	CombatRecordLineDivider2:setZRot( 180 )
	self:addElement( CombatRecordLineDivider2 )
	self.CombatRecordLineDivider2 = CombatRecordLineDivider2
	
	local Image50 = LUI.UIImage.new()
	Image50:setLeftRight( 0, 1, 0, -96 )
	Image50:setTopBottom( 0, 0, 272, 276 )
	Image50:setAlpha( 0.25 )
	Image50:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image50:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image50 )
	self.Image50 = Image50
	
	local Image500 = LUI.UIImage.new()
	Image500:setLeftRight( 0, 1, 0, -96 )
	Image500:setTopBottom( 0, 0, 42, 46 )
	Image500:setAlpha( 0.25 )
	Image500:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image500:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image500 )
	self.Image500 = Image500
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 569, 572 )
	Image0:setTopBottom( 0, 0, 45, 275 )
	Image0:setAlpha( 0.35 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 1154, 1157 )
	Image1:setTopBottom( 0, 0, 42, 279 )
	Image1:setAlpha( 0.35 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Kills = CoD.CombatRecordSummaryStat.new( menu, controller )
	Kills:setLeftRight( 0, 0, 591, 749 )
	Kills:setTopBottom( 0, 0, 71.5, 140.5 )
	Kills.StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	Kills.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.kills", "888" ) ) )
	self:addElement( Kills )
	self.Kills = Kills
	
	local Wins = CoD.CombatRecordSummaryStat.new( menu, controller )
	Wins:setLeftRight( 0, 0, 765, 937 )
	Wins:setTopBottom( 0, 0, 71.5, 140.5 )
	Wins.StatLabel:setText( Engine.Localize( "MENU_WINS_CAPS" ) )
	Wins.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.wins", "888" ) ) )
	self:addElement( Wins )
	self.Wins = Wins
	
	local Score = CoD.CombatRecordSummaryStat.new( menu, controller )
	Score:setLeftRight( 0, 0, 947, 1132 )
	Score:setTopBottom( 0, 0, 73.5, 142.5 )
	Score.StatLabel:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	Score.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.score", "888" ) ) )
	self:addElement( Score )
	self.Score = Score
	
	local KDRatio = CoD.CombatRecordSummaryStatSmall.new( menu, controller )
	KDRatio:setLeftRight( 0, 0, 591, 749 )
	KDRatio:setTopBottom( 0, 0, 185, 239 )
	KDRatio.StatLabel:setText( Engine.Localize( "MENU_KDRATIO_ABBR" ) )
	KDRatio.StatValue:setText( Engine.Localize( CombatRecordGetTwoStatRatio( controller, "playerstatslist.kills", "playerstatslist.deaths", "0.93" ) ) )
	self:addElement( KDRatio )
	self.KDRatio = KDRatio
	
	local WLRatio = CoD.CombatRecordSummaryStatSmall.new( menu, controller )
	WLRatio:setLeftRight( 0, 0, 768, 937 )
	WLRatio:setTopBottom( 0, 0, 185, 239 )
	WLRatio.StatLabel:setText( Engine.Localize( "MENU_WLRATIO" ) )
	WLRatio.StatValue:setText( Engine.Localize( CombatRecordGetTwoStatRatio( controller, "playerstatslist.wins", "playerstatslist.losses", "0.93" ) ) )
	self:addElement( WLRatio )
	self.WLRatio = WLRatio
	
	local SPM = CoD.CombatRecordSummaryStatSmall.new( menu, controller )
	SPM:setLeftRight( 0, 0, 947, 1132 )
	SPM:setTopBottom( 0, 0, 185, 239 )
	SPM.StatLabel:setText( Engine.Localize( "MENU_SCORE_PER_MINUTE" ) )
	SPM.StatValue:setText( Engine.Localize( CombatRecordGetSPM( controller, "playerstatslist.score", "playerstatslist.time_played_total", "425" ) ) )
	self:addElement( SPM )
	self.SPM = SPM
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0, 1, 591, -1073 )
	Image00:setTopBottom( 1, 1, -661, -652 )
	Image00:setAlpha( 0.25 )
	Image00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0, 1, 773, -891 )
	Image2:setTopBottom( 1, 1, -661, -652 )
	Image2:setAlpha( 0.25 )
	Image2:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( 0, 1, 960, -704 )
	Image6:setTopBottom( 1, 1, -661, -652 )
	Image6:setAlpha( 0.25 )
	Image6:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Vline2 = LUI.UIImage.new()
	Vline2:setLeftRight( 0, 0, 761, 764 )
	Vline2:setTopBottom( 0, 0, 50, 269 )
	Vline2:setAlpha( 0.35 )
	Vline2:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline2 )
	self.Vline2 = Vline2
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( 0, 0, 945, 948 )
	Image20:setTopBottom( 0, 0, 50, 269 )
	Image20:setAlpha( 0.35 )
	Image20:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( 0.5, 0.5, -676, -380 )
	StartMenuframenoBG00:setTopBottom( 0.5, 0.5, -297, -205 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local PrestigeMasterTierWidget = CoD.Prestige_MasterTierWidget.new( menu, controller )
	PrestigeMasterTierWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsMaxPrestigeLevelForMode( controller, Enum.eModes.MODE_MULTIPLAYER )
			end
		}
	} )
	PrestigeMasterTierWidget:setLeftRight( 0.5, 0.5, -704, -352 )
	PrestigeMasterTierWidget:setTopBottom( 0, 0, 196, 232 )
	PrestigeMasterTierWidget:setScale( 0.82 )
	PrestigeMasterTierWidget:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigeMasterTierWidget.ParagonStars:setHorizontalCount( GetPrestigeMasterTierCountFromStorage( controller, "mp", modelValue ) )
		end
	end )
	self:addElement( PrestigeMasterTierWidget )
	self.PrestigeMasterTierWidget = PrestigeMasterTierWidget
	
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
	self.resetProperties = function ()
		WeaponsButton:completeAnimation()
		EquipmentButton:completeAnimation()
		SpecialistButton:completeAnimation()
		CombatRecordItemButton0:completeAnimation()
		ScorestreakButton:completeAnimation()
		Emblem:completeAnimation()
		Rank:completeAnimation()
		RankName:completeAnimation()
		RankBackground:completeAnimation()
		WeaponsButton:setAlpha( 1 )
		EquipmentButton:setAlpha( 1 )
		SpecialistButton:setAlpha( 1 )
		CombatRecordItemButton0:setAlpha( 1 )
		ScorestreakButton:setAlpha( 1 )
		Emblem:setAlpha( 1 )
		Rank:setAlpha( 1 )
		RankName:setAlpha( 1 )
		RankBackground:setAlpha( 0.8 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
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
				RankBackground:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				RankBackground:setAlpha( 1 )
				RankBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local RankNameFrame2 = function ( RankName, event )
					if not event.interrupted then
						RankName:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					RankName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RankName, event )
					else
						RankName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankName:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				RankName:setAlpha( 0 )
				RankName:registerEventHandler( "transition_complete_keyframe", RankNameFrame2 )
				local RankFrame2 = function ( Rank, event )
					if not event.interrupted then
						Rank:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Bounce )
					end
					Rank:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Rank, event )
					else
						Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				Rank:setAlpha( 0 )
				Rank:registerEventHandler( "transition_complete_keyframe", RankFrame2 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.WeaponsButton:close()
		self.EquipmentButton:close()
		self.SpecialistButton:close()
		self.ScorestreakButton:close()
		self.CombatRecordItemButton0:close()
		self.CombatRecordLineDivider:close()
		self.CombatRecordLineDivider0:close()
		self.CombatRecordLineDivider1:close()
		self.CombatRecordLineDivider2:close()
		self.Kills:close()
		self.Wins:close()
		self.Score:close()
		self.KDRatio:close()
		self.WLRatio:close()
		self.SPM:close()
		self.StartMenuframenoBG00:close()
		self.PrestigeMasterTierWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

