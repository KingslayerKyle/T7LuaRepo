require( "ui.uieditor.menus.Barracks.CombatRecordCP.CombatRecordAccolades" )
require( "ui.uieditor.menus.Barracks.CombatRecordCP.CombatRecordCollectibles" )
require( "ui.uieditor.menus.Barracks.CombatRecordCP.CombatRecordCPMaps" )
require( "ui.uieditor.menus.Barracks.CombatRecordCP.CombatRecordCybercore" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordEquipment" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordWeapons" )
require( "ui.uieditor.widgets.Barracks.CombatRecord_LineDivider" )
require( "ui.uieditor.widgets.Barracks.CombatRecordItemButton" )
require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStatBig" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.CombatRecordCP_Contents = InheritFrom( LUI.UIElement )
CoD.CombatRecordCP_Contents.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordCP_Contents )
	self.id = "CombatRecordCP_Contents"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1687 )
	self:setTopBottom( 0, 0, 0, 817 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local SummaryTitle = LUI.UITightText.new()
	SummaryTitle:setLeftRight( 0, 0, 0, 300 )
	SummaryTitle:setTopBottom( 0, 0, 0, 38 )
	SummaryTitle:setText( Engine.Localize( "MENU_GLOBAL_CAREER_SNAPSHOT_CAPS" ) )
	SummaryTitle:setTTF( "fonts/default.ttf" )
	self:addElement( SummaryTitle )
	self.SummaryTitle = SummaryTitle
	
	local TimePlayedText = LUI.UITightText.new()
	TimePlayedText:setLeftRight( 1, 1, -220, 0 )
	TimePlayedText:setTopBottom( 0, 0, 7, 37 )
	TimePlayedText:setText( SecondsAsTimePlayedString( CombatRecordGetStat( controller, "playerstatslist.time_played_total", "Played 8d 19h 33m 19s" ) ) )
	TimePlayedText:setTTF( "fonts/default.ttf" )
	self:addElement( TimePlayedText )
	self.TimePlayedText = TimePlayedText
	
	local Emblem = LUI.UIImage.new()
	Emblem:setLeftRight( 0.5, 0.5, -833, -644 )
	Emblem:setTopBottom( 0, 0, 63, 252 )
	Emblem:setImage( RegisterImage( GetRankIconLarge( CombatRecordGetRankIcon( controller, "uie_t7_icon_rank_mp_level_25_lrg" ) ) ) )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( 0.5, 0.5, -630, -298 )
	StartMenuframenoBG00:setTopBottom( 0.5, 0.5, -297, -205 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local RankNameBackground = LUI.UIImage.new()
	RankNameBackground:setLeftRight( 0.5, 0.5, -626, -302 )
	RankNameBackground:setTopBottom( 0, 0, 115, 157 )
	RankNameBackground:setAlpha( 0.6 )
	self:addElement( RankNameBackground )
	self.RankNameBackground = RankNameBackground
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( 0.5, 0.5, -626, -302 )
	RankBackground:setTopBottom( 0, 0, 157, 199 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0.8 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local RankName = LUI.UIText.new()
	RankName:setLeftRight( 0.5, 0.5, -626, -302 )
	RankName:setTopBottom( 0, 0, 121, 151 )
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
	Rank:setLeftRight( 0.5, 0.5, -626, -302 )
	Rank:setTopBottom( 0, 0, 161, 194 )
	Rank:setTTF( "fonts/escom.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Rank:setText( RankToLevelString( "cp", CombatRecordGetStat( controller, "playerstatslist.rank", modelValue ) ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local WeaponsButton = CoD.CombatRecordItemButton.new( menu, controller )
	WeaponsButton:setLeftRight( 0, 0, 0.5, 555.5 )
	WeaponsButton:setTopBottom( 0, 0, 314, 560 )
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
		if InSafehouse() then
			OpenOverlay( self, "CombatRecordWeapons", controller, "", "" )
			UnpauseGame( menu, controller )
			return true
		else
			NavigateToMenu( self, "CombatRecordWeapons", true, controller )
			return true
		end
	end, function ( element, menu, controller )
		if InSafehouse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		end
	end, false )
	self:addElement( WeaponsButton )
	self.WeaponsButton = WeaponsButton
	
	local EquipmentButton = CoD.CombatRecordItemButton.new( menu, controller )
	EquipmentButton:setLeftRight( 0, 0, 565.5, 1120.5 )
	EquipmentButton:setTopBottom( 0, 0, 314, 560 )
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
			EquipmentButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_MOST_USED", modelValue ) )
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
		if InSafehouse() then
			OpenOverlay( self, "CombatRecordEquipment", controller, "", "" )
			UnpauseGame( menu, controller )
			return true
		else
			NavigateToMenu( self, "CombatRecordEquipment", true, controller )
			return true
		end
	end, function ( element, menu, controller )
		if InSafehouse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		end
	end, false )
	self:addElement( EquipmentButton )
	self.EquipmentButton = EquipmentButton
	
	local CybercoreButton = CoD.CombatRecordItemButton.new( menu, controller )
	CybercoreButton:setLeftRight( 0, 0, 1130.5, 1685.5 )
	CybercoreButton:setTopBottom( 0, 0, 314, 560 )
	CybercoreButton.WeaponImage:setAlpha( 0 )
	CybercoreButton.GameModeImage2:setAlpha( 0 )
	CybercoreButton.ButtonTitle:setText( Engine.Localize( "MENU_CYBERNETIC_COMBAT" ) )
	CybercoreButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestCybercore", "itemIndex", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CybercoreButton.ItemImage:setImage( RegisterImage( GetCybercoreImageByIndexAndMode( "cp", modelValue ) ) )
		end
	end )
	CybercoreButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestCybercore", "itemName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CybercoreButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_MOST_USED", modelValue ) )
		end
	end )
	CybercoreButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CybercoreButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CybercoreButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if InSafehouse() then
			OpenOverlay( self, "CombatRecordCybercore", controller, "", "" )
			UnpauseGame( menu, controller )
			return true
		else
			NavigateToMenu( self, "CombatRecordCybercore", true, controller )
			return true
		end
	end, function ( element, menu, controller )
		if InSafehouse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		end
	end, false )
	self:addElement( CybercoreButton )
	self.CybercoreButton = CybercoreButton
	
	local Line10 = LUI.UIImage.new()
	Line10:setLeftRight( 0, 1, 2, -1648 )
	Line10:setTopBottom( 0, 0, 38, 50 )
	Line10:setAlpha( 0.66 )
	Line10:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Line10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line10 )
	self.Line10 = Line10
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 1, 2, -1648 )
	Image3:setTopBottom( 0, 0, 268, 280 )
	Image3:setAlpha( 0.66 )
	Image3:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 0, 1, 1650, 0 )
	Image4:setTopBottom( 0, 0, 38, 50 )
	Image4:setAlpha( 0.66 )
	Image4:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( 0, 1, 1650, 0 )
	Image5:setTopBottom( 0, 0, 268, 280 )
	Image5:setAlpha( 0.66 )
	Image5:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local CombatRecordLineDivider = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider:setLeftRight( 0, 0, 543, 581 )
	CombatRecordLineDivider:setTopBottom( 0, 0, 37, 57 )
	self:addElement( CombatRecordLineDivider )
	self.CombatRecordLineDivider = CombatRecordLineDivider
	
	local CombatRecordLineDivider2 = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider2:setLeftRight( 0, 0, 541, 579 )
	CombatRecordLineDivider2:setTopBottom( 0, 0, 261, 281 )
	CombatRecordLineDivider2:setZRot( 180 )
	self:addElement( CombatRecordLineDivider2 )
	self.CombatRecordLineDivider2 = CombatRecordLineDivider2
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( 0, 1, 2, 0 )
	Image6:setTopBottom( 0, 0, 270, 278 )
	Image6:setAlpha( 0.15 )
	Image6:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Kills = CoD.CombatRecordSummaryStatBig.new( menu, controller )
	Kills:setLeftRight( 0, 0, 589, 809 )
	Kills:setTopBottom( 0, 0, 115, 207 )
	Kills.StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	Kills.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.kills", "888" ) ) )
	self:addElement( Kills )
	self.Kills = Kills
	
	local Accuracy = CoD.CombatRecordSummaryStatBig.new( menu, controller )
	Accuracy:setLeftRight( 0, 0, 864, 1092 )
	Accuracy:setTopBottom( 0, 0, 115, 207 )
	Accuracy.StatLabel:setText( Engine.Localize( "MENU_ACCURACY_CAPS" ) )
	Accuracy:subscribeToGlobalModel( controller, "CombatRecordTotalWeaponAccuracy", "percent", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Accuracy.StatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Accuracy )
	self.Accuracy = Accuracy
	
	local TotalScore = CoD.CombatRecordSummaryStatBig.new( menu, controller )
	TotalScore:setLeftRight( 0, 0, 1150, 1366 )
	TotalScore:setTopBottom( 0, 0, 115, 207 )
	TotalScore.StatLabel:setText( Engine.Localize( "MENU_TOTAL_SCORE_CAPS" ) )
	TotalScore.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.score", "888" ) ) )
	self:addElement( TotalScore )
	self.TotalScore = TotalScore
	
	local PercentComplete = CoD.CombatRecordSummaryStatBig.new( menu, controller )
	PercentComplete:setLeftRight( 0, 0, 1421, 1669 )
	PercentComplete:setTopBottom( 0, 0, 115, 207 )
	PercentComplete.StatLabel:setText( Engine.Localize( "MENU_PERCENT_COMPLETE_CAPS" ) )
	PercentComplete:subscribeToGlobalModel( controller, "CombatRecordCPPercentComplete", "percent", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PercentComplete.StatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( PercentComplete )
	self.PercentComplete = PercentComplete
	
	local MissionButton = CoD.CombatRecordItemButton.new( menu, controller )
	MissionButton:setLeftRight( 0, 0, 0.5, 555.5 )
	MissionButton:setTopBottom( 0, 0, 571, 817 )
	MissionButton.WeaponImage:setAlpha( 0 )
	MissionButton.ItemImage:setImage( RegisterImage( "uie_score" ) )
	MissionButton.GameModeImage2:setAlpha( 0 )
	MissionButton.ButtonTitle:setText( Engine.Localize( "MENU_MISSIONS" ) )
	MissionButton:subscribeToGlobalModel( controller, "CombatRecordBestScoreMap", "mapName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MissionButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_HIGHEST_SCORE", MapNameToLocalizedMapName( modelValue ) ) )
		end
	end )
	MissionButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MissionButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( MissionButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if InSafehouse() then
			OpenOverlay( self, "CombatRecordCPMaps", controller, "", "" )
			return true
		else
			NavigateToMenu( self, "CombatRecordCPMaps", true, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( MissionButton )
	self.MissionButton = MissionButton
	
	local AccoladesButton = CoD.CombatRecordItemButton.new( menu, controller )
	AccoladesButton:setLeftRight( 0, 0, 565.5, 1120.5 )
	AccoladesButton:setTopBottom( 0, 0, 571, 817 )
	AccoladesButton.WeaponImage:setAlpha( 0 )
	AccoladesButton.ItemImage:setImage( RegisterImage( "uie_indestructible" ) )
	AccoladesButton.GameModeImage2:setAlpha( 0 )
	AccoladesButton.ButtonTitle:setText( Engine.Localize( "MENU_ACCOLADES" ) )
	AccoladesButton:subscribeToGlobalModel( controller, "CombatRecordTotalAccoladesCompleted", "accoladesCompleted", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AccoladesButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_EARNED", modelValue ) )
		end
	end )
	AccoladesButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	AccoladesButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( AccoladesButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if InSafehouse() then
			OpenOverlay( self, "CombatRecordAccolades", controller, "", "" )
			return true
		else
			NavigateToMenu( self, "CombatRecordAccolades", true, controller )
			return true
		end
	end, function ( element, menu, controller )
		if InSafehouse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		end
	end, false )
	self:addElement( AccoladesButton )
	self.AccoladesButton = AccoladesButton
	
	local CollectibleButton = CoD.CombatRecordItemButton.new( menu, controller )
	CollectibleButton:setLeftRight( 0, 0, 1130.5, 1685.5 )
	CollectibleButton:setTopBottom( 0, 0, 571, 817 )
	CollectibleButton.WeaponImage:setAlpha( 0 )
	CollectibleButton.ItemImage:setImage( RegisterImage( "uie_collectibles" ) )
	CollectibleButton.GameModeImage2:setAlpha( 0 )
	CollectibleButton.ButtonTitle:setText( Engine.Localize( "CPUI_COLLECTIBLES" ) )
	CollectibleButton:subscribeToGlobalModel( controller, "CombatRecordTotalCollectiblesFound", "collectiblesFound", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CollectibleButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_FOUND", modelValue ) )
		end
	end )
	CollectibleButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CollectibleButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CollectibleButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if InSafehouse() then
			OpenOverlay( self, "CombatRecordCollectibles", controller, "", "" )
			UnpauseGame( menu, controller )
			return true
		else
			NavigateToMenu( self, "CombatRecordCollectibles", true, controller )
			return true
		end
	end, function ( element, menu, controller )
		if InSafehouse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		end
	end, false )
	self:addElement( CollectibleButton )
	self.CollectibleButton = CollectibleButton
	
	local CombatRecordLineDivider0 = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider0:setLeftRight( 0, 0, 1107, 1145 )
	CombatRecordLineDivider0:setTopBottom( 0, 0, 37, 57 )
	self:addElement( CombatRecordLineDivider0 )
	self.CombatRecordLineDivider0 = CombatRecordLineDivider0
	
	local CombatRecordLineDivider1 = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider1:setLeftRight( 0, 0, 1107, 1145 )
	CombatRecordLineDivider1:setTopBottom( 0, 0, 261, 281 )
	CombatRecordLineDivider1:setZRot( 180 )
	self:addElement( CombatRecordLineDivider1 )
	self.CombatRecordLineDivider1 = CombatRecordLineDivider1
	
	local Image60 = LUI.UIImage.new()
	Image60:setLeftRight( 0, 1, 2, 0 )
	Image60:setTopBottom( 0, 0, 39, 47 )
	Image60:setAlpha( 0.15 )
	Image60:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image60:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image60 )
	self.Image60 = Image60
	
	local Vline2 = LUI.UIImage.new()
	Vline2:setLeftRight( 0, 0, 830, 833 )
	Vline2:setTopBottom( 0, 0, 50, 269 )
	Vline2:setAlpha( 0.35 )
	Vline2:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline2 )
	self.Vline2 = Vline2
	
	local Vline20 = LUI.UIImage.new()
	Vline20:setLeftRight( 0, 0, 1391, 1394 )
	Vline20:setTopBottom( 0, 0, 50, 269 )
	Vline20:setAlpha( 0.35 )
	Vline20:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline20 )
	self.Vline20 = Vline20
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 560, 563 )
	Image0:setTopBottom( 0, 0, 45, 275 )
	Image0:setAlpha( 0.35 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 1124, 1127 )
	Image1:setTopBottom( 0, 0, 42, 279 )
	Image1:setAlpha( 0.35 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	WeaponsButton.navigation = {
		right = EquipmentButton,
		down = MissionButton
	}
	EquipmentButton.navigation = {
		left = WeaponsButton,
		right = CybercoreButton,
		down = AccoladesButton
	}
	CybercoreButton.navigation = {
		left = EquipmentButton,
		down = CollectibleButton
	}
	MissionButton.navigation = {
		up = WeaponsButton,
		right = AccoladesButton
	}
	AccoladesButton.navigation = {
		left = MissionButton,
		up = EquipmentButton,
		right = CollectibleButton
	}
	CollectibleButton.navigation = {
		left = AccoladesButton,
		up = CybercoreButton
	}
	self.resetProperties = function ()
		WeaponsButton:completeAnimation()
		EquipmentButton:completeAnimation()
		CybercoreButton:completeAnimation()
		Emblem:completeAnimation()
		MissionButton:completeAnimation()
		AccoladesButton:completeAnimation()
		CollectibleButton:completeAnimation()
		RankBackground:completeAnimation()
		Rank:completeAnimation()
		RankName:completeAnimation()
		RankNameBackground:completeAnimation()
		WeaponsButton:setLeftRight( 0, 0, 0.5, 555.5 )
		WeaponsButton:setTopBottom( 0, 0, 314, 560 )
		WeaponsButton:setAlpha( 1 )
		EquipmentButton:setLeftRight( 0, 0, 565.5, 1120.5 )
		EquipmentButton:setTopBottom( 0, 0, 314, 560 )
		EquipmentButton:setAlpha( 1 )
		CybercoreButton:setLeftRight( 0, 0, 1130.5, 1685.5 )
		CybercoreButton:setTopBottom( 0, 0, 314, 560 )
		CybercoreButton:setAlpha( 1 )
		Emblem:setAlpha( 1 )
		MissionButton:setLeftRight( 0, 0, 0.5, 555.5 )
		MissionButton:setTopBottom( 0, 0, 571, 817 )
		MissionButton:setAlpha( 1 )
		AccoladesButton:setLeftRight( 0, 0, 565.5, 1120.5 )
		AccoladesButton:setTopBottom( 0, 0, 571, 817 )
		AccoladesButton:setAlpha( 1 )
		CollectibleButton:setLeftRight( 0, 0, 1130.5, 1685.5 )
		CollectibleButton:setTopBottom( 0, 0, 571, 817 )
		CollectibleButton:setAlpha( 1 )
		RankBackground:setAlpha( 0.8 )
		Rank:setAlpha( 1 )
		RankName:setAlpha( 1 )
		RankNameBackground:setAlpha( 0.6 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
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
				local RankNameBackgroundFrame2 = function ( RankNameBackground, event )
					if not event.interrupted then
						RankNameBackground:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					RankNameBackground:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( RankNameBackground, event )
					else
						RankNameBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankNameBackground:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				RankNameBackground:setAlpha( 0 )
				RankNameBackground:registerEventHandler( "transition_complete_keyframe", RankNameBackgroundFrame2 )
				local RankBackgroundFrame2 = function ( RankBackground, event )
					if not event.interrupted then
						RankBackground:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
					end
					RankBackground:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RankBackground, event )
					else
						RankBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankBackground:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				RankBackground:setAlpha( 0 )
				RankBackground:registerEventHandler( "transition_complete_keyframe", RankBackgroundFrame2 )
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
				local CybercoreButtonFrame2 = function ( CybercoreButton, event )
					local CybercoreButtonFrame3 = function ( CybercoreButton, event )
						local CybercoreButtonFrame4 = function ( CybercoreButton, event )
							local CybercoreButtonFrame5 = function ( CybercoreButton, event )
								if not event.interrupted then
									CybercoreButton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								CybercoreButton:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( CybercoreButton, event )
								else
									CybercoreButton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CybercoreButtonFrame5( CybercoreButton, event )
								return 
							else
								CybercoreButton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								CybercoreButton:setAlpha( 0.54 )
								CybercoreButton:registerEventHandler( "transition_complete_keyframe", CybercoreButtonFrame5 )
							end
						end
						
						if event.interrupted then
							CybercoreButtonFrame4( CybercoreButton, event )
							return 
						else
							CybercoreButton:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							CybercoreButton:registerEventHandler( "transition_complete_keyframe", CybercoreButtonFrame4 )
						end
					end
					
					if event.interrupted then
						CybercoreButtonFrame3( CybercoreButton, event )
						return 
					else
						CybercoreButton:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						CybercoreButton:setAlpha( 1 )
						CybercoreButton:registerEventHandler( "transition_complete_keyframe", CybercoreButtonFrame3 )
					end
				end
				
				CybercoreButton:completeAnimation()
				self.CybercoreButton:setAlpha( 0 )
				CybercoreButtonFrame2( CybercoreButton, {} )
				local MissionButtonFrame2 = function ( MissionButton, event )
					local MissionButtonFrame3 = function ( MissionButton, event )
						if not event.interrupted then
							MissionButton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						MissionButton:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MissionButton, event )
						else
							MissionButton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MissionButtonFrame3( MissionButton, event )
						return 
					else
						MissionButton:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						MissionButton:registerEventHandler( "transition_complete_keyframe", MissionButtonFrame3 )
					end
				end
				
				MissionButton:completeAnimation()
				self.MissionButton:setAlpha( 0 )
				MissionButtonFrame2( MissionButton, {} )
				local AccoladesButtonFrame2 = function ( AccoladesButton, event )
					local AccoladesButtonFrame3 = function ( AccoladesButton, event )
						if not event.interrupted then
							AccoladesButton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						AccoladesButton:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( AccoladesButton, event )
						else
							AccoladesButton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AccoladesButtonFrame3( AccoladesButton, event )
						return 
					else
						AccoladesButton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						AccoladesButton:registerEventHandler( "transition_complete_keyframe", AccoladesButtonFrame3 )
					end
				end
				
				AccoladesButton:completeAnimation()
				self.AccoladesButton:setAlpha( 0 )
				AccoladesButtonFrame2( AccoladesButton, {} )
				local CollectibleButtonFrame2 = function ( CollectibleButton, event )
					local CollectibleButtonFrame3 = function ( CollectibleButton, event )
						if not event.interrupted then
							CollectibleButton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						CollectibleButton:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CollectibleButton, event )
						else
							CollectibleButton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CollectibleButtonFrame3( CollectibleButton, event )
						return 
					else
						CollectibleButton:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						CollectibleButton:registerEventHandler( "transition_complete_keyframe", CollectibleButtonFrame3 )
					end
				end
				
				CollectibleButton:completeAnimation()
				self.CollectibleButton:setAlpha( 0 )
				CollectibleButtonFrame2( CollectibleButton, {} )
			end
		},
		Safehouse = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				WeaponsButton:completeAnimation()
				self.WeaponsButton:setLeftRight( 0, 0, 0.5, 555.5 )
				self.WeaponsButton:setTopBottom( 0, 0, 287, 533 )
				self.clipFinished( WeaponsButton, {} )
				EquipmentButton:completeAnimation()
				self.EquipmentButton:setLeftRight( 0, 0, 565.5, 1120.5 )
				self.EquipmentButton:setTopBottom( 0, 0, 287, 533 )
				self.clipFinished( EquipmentButton, {} )
				CybercoreButton:completeAnimation()
				self.CybercoreButton:setLeftRight( 0, 0, 1130.5, 1685.5 )
				self.CybercoreButton:setTopBottom( 0, 0, 287, 533 )
				self.clipFinished( CybercoreButton, {} )
				MissionButton:completeAnimation()
				self.MissionButton:setLeftRight( 0, 0, 0.5, 555.5 )
				self.MissionButton:setTopBottom( 0, 0, 543, 789 )
				self.clipFinished( MissionButton, {} )
				AccoladesButton:completeAnimation()
				self.AccoladesButton:setLeftRight( 0, 0, 565.5, 1120.5 )
				self.AccoladesButton:setTopBottom( 0, 0, 543, 789 )
				self.clipFinished( AccoladesButton, {} )
				CollectibleButton:completeAnimation()
				self.CollectibleButton:setLeftRight( 0, 0, 1130.5, 1685.5 )
				self.CollectibleButton:setTopBottom( 0, 0, 543, 789 )
				self.clipFinished( CollectibleButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Safehouse",
			condition = function ( menu, element, event )
				return InSafehouse()
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	WeaponsButton.id = "WeaponsButton"
	EquipmentButton.id = "EquipmentButton"
	CybercoreButton.id = "CybercoreButton"
	MissionButton.id = "MissionButton"
	AccoladesButton.id = "AccoladesButton"
	CollectibleButton.id = "CollectibleButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.WeaponsButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG00:close()
		self.WeaponsButton:close()
		self.EquipmentButton:close()
		self.CybercoreButton:close()
		self.CombatRecordLineDivider:close()
		self.CombatRecordLineDivider2:close()
		self.Kills:close()
		self.Accuracy:close()
		self.TotalScore:close()
		self.PercentComplete:close()
		self.MissionButton:close()
		self.AccoladesButton:close()
		self.CollectibleButton:close()
		self.CombatRecordLineDivider0:close()
		self.CombatRecordLineDivider1:close()
		self.Rank:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

