-- 11bd1dc67e5dd63a1656a7bfdbc78880
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Barracks.CombatRecordItemButton" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordWeapons" )
require( "ui.uieditor.menus.Barracks.CombatRecordMP.CombatRecordEquipment" )
require( "ui.uieditor.menus.Barracks.CombatRecordCP.CombatRecordCybercore" )
require( "ui.uieditor.widgets.Barracks.CombatRecord_LineDivider" )
require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStatBig" )
require( "ui.uieditor.menus.Barracks.CombatRecordCP.CombatRecordCPMaps" )
require( "ui.uieditor.menus.Barracks.CombatRecordCP.CombatRecordAccolades" )
require( "ui.uieditor.menus.Barracks.CombatRecordCP.CombatRecordCollectibles" )

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
	self:setLeftRight( true, false, 0, 1125 )
	self:setTopBottom( true, false, 0, 545 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local SummaryTitle = LUI.UITightText.new()
	SummaryTitle:setLeftRight( true, false, 0, 200 )
	SummaryTitle:setTopBottom( true, false, 0, 25 )
	SummaryTitle:setText( Engine.Localize( "MENU_GLOBAL_CAREER_SNAPSHOT_CAPS" ) )
	SummaryTitle:setTTF( "fonts/default.ttf" )
	self:addElement( SummaryTitle )
	self.SummaryTitle = SummaryTitle
	
	local TimePlayedText = LUI.UITightText.new()
	TimePlayedText:setLeftRight( false, true, -146.5, 0 )
	TimePlayedText:setTopBottom( true, false, 5, 25 )
	TimePlayedText:setText( SecondsAsTimePlayedString( CombatRecordGetStat( controller, "playerstatslist.time_played_total", "Played 8d 19h 33m 19s" ) ) )
	TimePlayedText:setTTF( "fonts/default.ttf" )
	self:addElement( TimePlayedText )
	self.TimePlayedText = TimePlayedText
	
	local Emblem = LUI.UIImage.new()
	Emblem:setLeftRight( false, false, -555, -429 )
	Emblem:setTopBottom( true, false, 42, 168 )
	Emblem:setImage( RegisterImage( GetRankIconLarge( CombatRecordGetRankIcon( controller, "uie_t7_icon_rank_mp_level_25_lrg" ) ) ) )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( false, false, -420, -199 )
	StartMenuframenoBG00:setTopBottom( false, false, -198, -137 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local RankNameBackground = LUI.UIImage.new()
	RankNameBackground:setLeftRight( false, false, -417.25, -201.5 )
	RankNameBackground:setTopBottom( true, false, 77, 105 )
	RankNameBackground:setAlpha( 0.6 )
	self:addElement( RankNameBackground )
	self.RankNameBackground = RankNameBackground
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( false, false, -417.25, -201.5 )
	RankBackground:setTopBottom( true, false, 105, 133 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0.8 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local RankName = LUI.UIText.new()
	RankName:setLeftRight( false, false, -417.25, -201.5 )
	RankName:setTopBottom( true, false, 81, 101 )
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
	Rank:setLeftRight( false, false, -417.25, -201.5 )
	Rank:setTopBottom( true, false, 107, 129 )
	Rank:setTTF( "fonts/escom.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp", function ( model )
		local statsCp = Engine.GetModelValue( model )
		if statsCp then
			Rank:setText( RankToLevelString( "cp", CombatRecordGetStat( controller, "playerstatslist.rank", statsCp ) ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local WeaponsButton = CoD.CombatRecordItemButton.new( menu, controller )
	WeaponsButton:setLeftRight( true, false, 0, 370 )
	WeaponsButton:setTopBottom( true, false, 209.5, 373.5 )
	WeaponsButton.ItemImage:setAlpha( 0 )
	WeaponsButton.GameModeImage2:setAlpha( 0 )
	WeaponsButton.ButtonTitle:setText( Engine.Localize( "MENU_WEAPONS" ) )
	WeaponsButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestWeapon", "itemIndex", function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			WeaponsButton.WeaponImage:setImage( RegisterImage( AppendIfMatch( "menu_mp_lobby_none_selected", "_rec", AppendIfNotMatch( "menu_mp_lobby_none_selected", "_pu", GetWeaponImageByIndexAndMode( "cp", itemIndex ) ) ) ) )
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
	menu:AddButtonCallbackFunction( WeaponsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if InSafehouse() then
			OpenOverlay( self, "CombatRecordWeapons", f7_arg2, "", "" )
			UnpauseGame( f7_arg1, f7_arg2 )
			return true
		else
			NavigateToMenu( self, "CombatRecordWeapons", true, f7_arg2 )
			return true
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if InSafehouse() then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		else
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		end
	end, false )
	self:addElement( WeaponsButton )
	self.WeaponsButton = WeaponsButton
	
	local EquipmentButton = CoD.CombatRecordItemButton.new( menu, controller )
	EquipmentButton:setLeftRight( true, false, 377, 747 )
	EquipmentButton:setTopBottom( true, false, 209.5, 373.5 )
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
			EquipmentButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_MOST_USED", itemName ) )
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
	menu:AddButtonCallbackFunction( EquipmentButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if InSafehouse() then
			OpenOverlay( self, "CombatRecordEquipment", f13_arg2, "", "" )
			UnpauseGame( f13_arg1, f13_arg2 )
			return true
		else
			NavigateToMenu( self, "CombatRecordEquipment", true, f13_arg2 )
			return true
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if InSafehouse() then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		else
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		end
	end, false )
	self:addElement( EquipmentButton )
	self.EquipmentButton = EquipmentButton
	
	local CybercoreButton = CoD.CombatRecordItemButton.new( menu, controller )
	CybercoreButton:setLeftRight( true, false, 754, 1124 )
	CybercoreButton:setTopBottom( true, false, 209.5, 373.5 )
	CybercoreButton.WeaponImage:setAlpha( 0 )
	CybercoreButton.GameModeImage2:setAlpha( 0 )
	CybercoreButton.ButtonTitle:setText( Engine.Localize( "MENU_CYBERNETIC_COMBAT" ) )
	CybercoreButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestCybercore", "itemIndex", function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			CybercoreButton.ItemImage:setImage( RegisterImage( GetCybercoreImageByIndexAndMode( "cp", itemIndex ) ) )
		end
	end )
	CybercoreButton:subscribeToGlobalModel( controller, "CombatRecordDeadliestCybercore", "itemName", function ( model )
		local itemName = Engine.GetModelValue( model )
		if itemName then
			CybercoreButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_MOST_USED", itemName ) )
		end
	end )
	CybercoreButton:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f17_local0
	end )
	CybercoreButton:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	menu:AddButtonCallbackFunction( CybercoreButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if InSafehouse() then
			OpenOverlay( self, "CombatRecordCybercore", f19_arg2, "", "" )
			UnpauseGame( f19_arg1, f19_arg2 )
			return true
		else
			NavigateToMenu( self, "CombatRecordCybercore", true, f19_arg2 )
			return true
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if InSafehouse() then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		else
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		end
	end, false )
	self:addElement( CybercoreButton )
	self.CybercoreButton = CybercoreButton
	
	local Line10 = LUI.UIImage.new()
	Line10:setLeftRight( true, true, 1, -1098.5 )
	Line10:setTopBottom( true, false, 25, 33 )
	Line10:setAlpha( 0.66 )
	Line10:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Line10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line10 )
	self.Line10 = Line10
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, true, 1, -1098.5 )
	Image3:setTopBottom( true, false, 179, 187 )
	Image3:setAlpha( 0.66 )
	Image3:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, true, 1099.5, 0 )
	Image4:setTopBottom( true, false, 25, 33 )
	Image4:setAlpha( 0.66 )
	Image4:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, true, 1099.5, 0 )
	Image5:setTopBottom( true, false, 179, 187 )
	Image5:setAlpha( 0.66 )
	Image5:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local CombatRecordLineDivider = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider:setLeftRight( true, false, 362.5, 387.5 )
	CombatRecordLineDivider:setTopBottom( true, false, 25, 38 )
	self:addElement( CombatRecordLineDivider )
	self.CombatRecordLineDivider = CombatRecordLineDivider
	
	local CombatRecordLineDivider2 = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider2:setLeftRight( true, false, 361, 386 )
	CombatRecordLineDivider2:setTopBottom( true, false, 174, 187 )
	CombatRecordLineDivider2:setZRot( 180 )
	self:addElement( CombatRecordLineDivider2 )
	self.CombatRecordLineDivider2 = CombatRecordLineDivider2
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, true, 1, 0 )
	Image6:setTopBottom( true, false, 180.5, 185.5 )
	Image6:setAlpha( 0.15 )
	Image6:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Kills = CoD.CombatRecordSummaryStatBig.new( menu, controller )
	Kills:setLeftRight( true, false, 392.5, 539.5 )
	Kills:setTopBottom( true, false, 77, 138 )
	Kills.StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	Kills.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.kills", "888" ) ) )
	self:addElement( Kills )
	self.Kills = Kills
	
	local Accuracy = CoD.CombatRecordSummaryStatBig.new( menu, controller )
	Accuracy:setLeftRight( true, false, 576, 728 )
	Accuracy:setTopBottom( true, false, 77, 138 )
	Accuracy.StatLabel:setText( Engine.Localize( "MENU_ACCURACY_CAPS" ) )
	Accuracy:subscribeToGlobalModel( controller, "CombatRecordTotalWeaponAccuracy", "percent", function ( model )
		local percent = Engine.GetModelValue( model )
		if percent then
			Accuracy.StatValue:setText( Engine.Localize( percent ) )
		end
	end )
	self:addElement( Accuracy )
	self.Accuracy = Accuracy
	
	local TotalScore = CoD.CombatRecordSummaryStatBig.new( menu, controller )
	TotalScore:setLeftRight( true, false, 766.96, 910.96 )
	TotalScore:setTopBottom( true, false, 77, 138 )
	TotalScore.StatLabel:setText( Engine.Localize( "MENU_TOTAL_SCORE_CAPS" ) )
	TotalScore.StatValue:setText( Engine.Localize( CombatRecordGetStat( controller, "playerstatslist.score", "888" ) ) )
	self:addElement( TotalScore )
	self.TotalScore = TotalScore
	
	local PercentComplete = CoD.CombatRecordSummaryStatBig.new( menu, controller )
	PercentComplete:setLeftRight( true, false, 947.25, 1112.25 )
	PercentComplete:setTopBottom( true, false, 77, 138 )
	PercentComplete.StatLabel:setText( Engine.Localize( "MENU_PERCENT_COMPLETE_CAPS" ) )
	PercentComplete:subscribeToGlobalModel( controller, "CombatRecordCPPercentComplete", "percent", function ( model )
		local percent = Engine.GetModelValue( model )
		if percent then
			PercentComplete.StatValue:setText( Engine.Localize( percent ) )
		end
	end )
	self:addElement( PercentComplete )
	self.PercentComplete = PercentComplete
	
	local MissionButton = CoD.CombatRecordItemButton.new( menu, controller )
	MissionButton:setLeftRight( true, false, 0, 370 )
	MissionButton:setTopBottom( true, false, 380.5, 544.5 )
	MissionButton.WeaponImage:setAlpha( 0 )
	MissionButton.ItemImage:setImage( RegisterImage( "uie_score" ) )
	MissionButton.GameModeImage2:setAlpha( 0 )
	MissionButton.ButtonTitle:setText( Engine.Localize( "MENU_MISSIONS" ) )
	MissionButton:subscribeToGlobalModel( controller, "CombatRecordBestScoreMap", "mapName", function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			MissionButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_HIGHEST_SCORE", MapNameToLocalizedMapName( mapName ) ) )
		end
	end )
	MissionButton:registerEventHandler( "gain_focus", function ( element, event )
		local f24_local0 = nil
		if element.gainFocus then
			f24_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f24_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f24_local0
	end )
	MissionButton:registerEventHandler( "lose_focus", function ( element, event )
		local f25_local0 = nil
		if element.loseFocus then
			f25_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f25_local0 = element.super:loseFocus( event )
		end
		return f25_local0
	end )
	menu:AddButtonCallbackFunction( MissionButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		if InSafehouse() then
			OpenOverlay( self, "CombatRecordCPMaps", f26_arg2, "", "" )
			return true
		else
			NavigateToMenu( self, "CombatRecordCPMaps", true, f26_arg2 )
			return true
		end
	end, function ( f27_arg0, f27_arg1, f27_arg2 )
		CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( MissionButton )
	self.MissionButton = MissionButton
	
	local AccoladesButton = CoD.CombatRecordItemButton.new( menu, controller )
	AccoladesButton:setLeftRight( true, false, 377, 747 )
	AccoladesButton:setTopBottom( true, false, 380.5, 544.5 )
	AccoladesButton.WeaponImage:setAlpha( 0 )
	AccoladesButton.ItemImage:setImage( RegisterImage( "uie_indestructible" ) )
	AccoladesButton.GameModeImage2:setAlpha( 0 )
	AccoladesButton.ButtonTitle:setText( Engine.Localize( "MENU_ACCOLADES" ) )
	AccoladesButton:subscribeToGlobalModel( controller, "CombatRecordTotalAccoladesCompleted", "accoladesCompleted", function ( model )
		local accoladesCompleted = Engine.GetModelValue( model )
		if accoladesCompleted then
			AccoladesButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_EARNED", accoladesCompleted ) )
		end
	end )
	AccoladesButton:registerEventHandler( "gain_focus", function ( element, event )
		local f29_local0 = nil
		if element.gainFocus then
			f29_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f29_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f29_local0
	end )
	AccoladesButton:registerEventHandler( "lose_focus", function ( element, event )
		local f30_local0 = nil
		if element.loseFocus then
			f30_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f30_local0 = element.super:loseFocus( event )
		end
		return f30_local0
	end )
	menu:AddButtonCallbackFunction( AccoladesButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
		if InSafehouse() then
			OpenOverlay( self, "CombatRecordAccolades", f31_arg2, "", "" )
			return true
		else
			NavigateToMenu( self, "CombatRecordAccolades", true, f31_arg2 )
			return true
		end
	end, function ( f32_arg0, f32_arg1, f32_arg2 )
		if InSafehouse() then
			CoD.Menu.SetButtonLabel( f32_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		else
			CoD.Menu.SetButtonLabel( f32_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		end
	end, false )
	self:addElement( AccoladesButton )
	self.AccoladesButton = AccoladesButton
	
	local CollectibleButton = CoD.CombatRecordItemButton.new( menu, controller )
	CollectibleButton:setLeftRight( true, false, 754, 1124 )
	CollectibleButton:setTopBottom( true, false, 380.5, 544.5 )
	CollectibleButton.WeaponImage:setAlpha( 0 )
	CollectibleButton.ItemImage:setImage( RegisterImage( "uie_collectibles" ) )
	CollectibleButton.GameModeImage2:setAlpha( 0 )
	CollectibleButton.ButtonTitle:setText( Engine.Localize( "CPUI_COLLECTIBLES" ) )
	CollectibleButton:subscribeToGlobalModel( controller, "CombatRecordTotalCollectiblesFound", "collectiblesFound", function ( model )
		local collectiblesFound = Engine.GetModelValue( model )
		if collectiblesFound then
			CollectibleButton.ButtonTitle0:setText( LocalizeIntoString( "MENU_CR_FOUND", collectiblesFound ) )
		end
	end )
	CollectibleButton:registerEventHandler( "gain_focus", function ( element, event )
		local f34_local0 = nil
		if element.gainFocus then
			f34_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f34_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f34_local0
	end )
	CollectibleButton:registerEventHandler( "lose_focus", function ( element, event )
		local f35_local0 = nil
		if element.loseFocus then
			f35_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f35_local0 = element.super:loseFocus( event )
		end
		return f35_local0
	end )
	menu:AddButtonCallbackFunction( CollectibleButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		if InSafehouse() then
			OpenOverlay( self, "CombatRecordCollectibles", f36_arg2, "", "" )
			UnpauseGame( f36_arg1, f36_arg2 )
			return true
		else
			NavigateToMenu( self, "CombatRecordCollectibles", true, f36_arg2 )
			return true
		end
	end, function ( f37_arg0, f37_arg1, f37_arg2 )
		if InSafehouse() then
			CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		else
			CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		end
	end, false )
	self:addElement( CollectibleButton )
	self.CollectibleButton = CollectibleButton
	
	local CombatRecordLineDivider0 = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider0:setLeftRight( true, false, 738.5, 763.5 )
	CombatRecordLineDivider0:setTopBottom( true, false, 25, 38 )
	self:addElement( CombatRecordLineDivider0 )
	self.CombatRecordLineDivider0 = CombatRecordLineDivider0
	
	local CombatRecordLineDivider1 = CoD.CombatRecord_LineDivider.new( menu, controller )
	CombatRecordLineDivider1:setLeftRight( true, false, 738, 763 )
	CombatRecordLineDivider1:setTopBottom( true, false, 174, 187 )
	CombatRecordLineDivider1:setZRot( 180 )
	self:addElement( CombatRecordLineDivider1 )
	self.CombatRecordLineDivider1 = CombatRecordLineDivider1
	
	local Image60 = LUI.UIImage.new()
	Image60:setLeftRight( true, true, 1, 0 )
	Image60:setTopBottom( true, false, 26, 31 )
	Image60:setAlpha( 0.15 )
	Image60:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image60:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image60 )
	self.Image60 = Image60
	
	local Vline2 = LUI.UIImage.new()
	Vline2:setLeftRight( true, false, 553.17, 555.17 )
	Vline2:setTopBottom( true, false, 33, 179 )
	Vline2:setAlpha( 0.35 )
	Vline2:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline2 )
	self.Vline2 = Vline2
	
	local Vline20 = LUI.UIImage.new()
	Vline20:setLeftRight( true, false, 927.17, 929.17 )
	Vline20:setTopBottom( true, false, 33, 179 )
	Vline20:setAlpha( 0.35 )
	Vline20:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline20 )
	self.Vline20 = Vline20
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 373.5, 375.5 )
	Image0:setTopBottom( true, false, 30, 183 )
	Image0:setAlpha( 0.35 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 749.5, 751.5 )
	Image1:setTopBottom( true, false, 28, 186 )
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				local f38_local1 = function ( f40_arg0, f40_arg1 )
					if not f40_arg1.interrupted then
						f40_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					f40_arg0:setAlpha( 0.6 )
					if f40_arg1.interrupted then
						self.clipFinished( f40_arg0, f40_arg1 )
					else
						f40_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankNameBackground:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				RankNameBackground:setAlpha( 0 )
				RankNameBackground:registerEventHandler( "transition_complete_keyframe", f38_local1 )
				local f38_local2 = function ( f41_arg0, f41_arg1 )
					if not f41_arg1.interrupted then
						f41_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
					end
					f41_arg0:setAlpha( 1 )
					if f41_arg1.interrupted then
						self.clipFinished( f41_arg0, f41_arg1 )
					else
						f41_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankBackground:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				RankBackground:setAlpha( 0 )
				RankBackground:registerEventHandler( "transition_complete_keyframe", f38_local2 )
				local f38_local3 = function ( f42_arg0, f42_arg1 )
					if not f42_arg1.interrupted then
						f42_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					f42_arg0:setAlpha( 1 )
					if f42_arg1.interrupted then
						self.clipFinished( f42_arg0, f42_arg1 )
					else
						f42_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankName:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				RankName:setAlpha( 0 )
				RankName:registerEventHandler( "transition_complete_keyframe", f38_local3 )
				local f38_local4 = function ( f43_arg0, f43_arg1 )
					if not f43_arg1.interrupted then
						f43_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Bounce )
					end
					f43_arg0:setAlpha( 1 )
					if f43_arg1.interrupted then
						self.clipFinished( f43_arg0, f43_arg1 )
					else
						f43_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				Rank:setAlpha( 0 )
				Rank:registerEventHandler( "transition_complete_keyframe", f38_local4 )
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
				self:setupElementClipCounter( 6 )

				WeaponsButton:completeAnimation()
				self.WeaponsButton:setLeftRight( true, false, 0, 370 )
				self.WeaponsButton:setTopBottom( true, false, 191, 355 )
				self.clipFinished( WeaponsButton, {} )

				EquipmentButton:completeAnimation()
				self.EquipmentButton:setLeftRight( true, false, 377, 747 )
				self.EquipmentButton:setTopBottom( true, false, 191, 355 )
				self.clipFinished( EquipmentButton, {} )

				CybercoreButton:completeAnimation()
				self.CybercoreButton:setLeftRight( true, false, 754, 1124 )
				self.CybercoreButton:setTopBottom( true, false, 191, 355 )
				self.clipFinished( CybercoreButton, {} )

				MissionButton:completeAnimation()
				self.MissionButton:setLeftRight( true, false, 0, 370 )
				self.MissionButton:setTopBottom( true, false, 362, 526 )
				self.clipFinished( MissionButton, {} )

				AccoladesButton:completeAnimation()
				self.AccoladesButton:setLeftRight( true, false, 377, 747 )
				self.AccoladesButton:setTopBottom( true, false, 362, 526 )
				self.clipFinished( AccoladesButton, {} )

				CollectibleButton:completeAnimation()
				self.CollectibleButton:setLeftRight( true, false, 754, 1124 )
				self.CollectibleButton:setTopBottom( true, false, 362, 526 )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.WeaponsButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG00:close()
		element.WeaponsButton:close()
		element.EquipmentButton:close()
		element.CybercoreButton:close()
		element.CombatRecordLineDivider:close()
		element.CombatRecordLineDivider2:close()
		element.Kills:close()
		element.Accuracy:close()
		element.TotalScore:close()
		element.PercentComplete:close()
		element.MissionButton:close()
		element.AccoladesButton:close()
		element.CollectibleButton:close()
		element.CombatRecordLineDivider0:close()
		element.CombatRecordLineDivider1:close()
		element.Rank:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

