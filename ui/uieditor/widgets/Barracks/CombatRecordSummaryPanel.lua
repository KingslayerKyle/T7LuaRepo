-- d363414071bbe32f30b1589d77483078
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Barracks.CombatRecord_LineDivider" )
require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStat" )
require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStatSmall" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Prestige.Prestige_MasterTierWidget" )
require( "ui.uieditor.widgets.Primary_Profile_Snapshot" )
require( "ui.uieditor.widgets.Barracks.CombatRecordCallingCard" )

local PreLoadFunc = function ( self, controller )
	CoD.CombatRecordMode = "summary"
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot.SelectedFileID" )
end

CoD.CombatRecordSummaryPanel = InheritFrom( LUI.UIElement )
CoD.CombatRecordSummaryPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordSummaryPanel )
	self.id = "CombatRecordSummaryPanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1216 )
	self:setTopBottom( true, false, 0, 546 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, false, 0, 381 )
	BlackTint:setTopBottom( true, false, 30, 181 )
	BlackTint:setAlpha( 0 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local BlackTint2 = LUI.UIImage.new()
	BlackTint2:setLeftRight( true, false, 392, 759 )
	BlackTint2:setTopBottom( true, false, 30, 181 )
	BlackTint2:setAlpha( 0 )
	self:addElement( BlackTint2 )
	self.BlackTint2 = BlackTint2
	
	local BlackTint3 = LUI.UIImage.new()
	BlackTint3:setLeftRight( true, false, 769, 1152 )
	BlackTint3:setTopBottom( true, false, 30, 181 )
	BlackTint3:setAlpha( 0 )
	self:addElement( BlackTint3 )
	self.BlackTint3 = BlackTint3
	
	local SummaryTitle = LUI.UITightText.new()
	SummaryTitle:setLeftRight( true, false, 13, 213 )
	SummaryTitle:setTopBottom( true, false, 0, 25 )
	SummaryTitle:setText( Engine.Localize( "MENU_GLOBAL_CAREER_SNAPSHOT_CAPS" ) )
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
	Emblem:setImage( RegisterImage( GetRankIconLarge( CombatRecordGetRankIcon( controller, "uie_t7_icon_rank_mp_level_25_lrg" ) ) ) )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local RankNameBackground = LUI.UIImage.new()
	RankNameBackground:setLeftRight( false, false, -448, -281 )
	RankNameBackground:setTopBottom( true, false, 77, 105 )
	RankNameBackground:setAlpha( 0.7 )
	self:addElement( RankNameBackground )
	self.RankNameBackground = RankNameBackground
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( false, false, -448, -281 )
	RankBackground:setTopBottom( true, false, 105, 133 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0.8 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local RankName = LUI.UIText.new()
	RankName:setLeftRight( false, false, -448, -281 )
	RankName:setTopBottom( true, false, 81, 101 )
	RankName:setRGB( 0, 0, 0 )
	RankName:setText( Engine.Localize( CombatRecordGetRankTitle( controller, "Vindicator" ) ) )
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
	Rank:setLeftRight( false, false, -448, -281 )
	Rank:setTopBottom( true, false, 107, 132 )
	Rank:setText( CombatRecordGetLevelString( controller, "Level 88" ) )
	Rank:setTTF( "fonts/escom.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			Rank:setRGB( CombatRecordGetParagonColorByRank( controller, 255, 255, 255, statsMp ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
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
	CombatRecordLineDivider0:setLeftRight( true, false, 758, 783 )
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
	CombatRecordLineDivider2:setLeftRight( true, false, 368, 393 )
	CombatRecordLineDivider2:setTopBottom( true, false, 174, 187 )
	CombatRecordLineDivider2:setZRot( 180 )
	self:addElement( CombatRecordLineDivider2 )
	self.CombatRecordLineDivider2 = CombatRecordLineDivider2
	
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
	Image500:setTopBottom( true, false, 27.5, 30 )
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
	StartMenuframenoBG00:setLeftRight( false, false, -450.5, -279 )
	StartMenuframenoBG00:setTopBottom( false, false, -198.5, -137.5 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local CallingCardShowcaseLabel = LUI.UITightText.new()
	CallingCardShowcaseLabel:setLeftRight( true, false, 447.08, 607.08 )
	CallingCardShowcaseLabel:setTopBottom( true, false, 228.5, 253.5 )
	CallingCardShowcaseLabel:setText( Engine.Localize( "MENU_CALLING_CARD_SHOWCASE_CAPS" ) )
	CallingCardShowcaseLabel:setTTF( "fonts/default.ttf" )
	self:addElement( CallingCardShowcaseLabel )
	self.CallingCardShowcaseLabel = CallingCardShowcaseLabel
	
	local PrestigeMasterTierWidget = CoD.Prestige_MasterTierWidget.new( menu, controller )
	PrestigeMasterTierWidget:setLeftRight( false, false, -468, -261.5 )
	PrestigeMasterTierWidget:setTopBottom( true, false, 131, 155 )
	PrestigeMasterTierWidget:setAlpha( ShowIfPrestigeMasterByPLevel( "mp", GetPLevelFromCombatRecord( controller, 1 ) ) )
	PrestigeMasterTierWidget:setScale( 0.82 )
	PrestigeMasterTierWidget.ParagonStars:setHorizontalCount( GetPrestigeMasterTierCountFromCombatRecord( controller, "mp", 10 ) )
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
	
	local PrimaryProfileSnapshot = CoD.Primary_Profile_Snapshot.new( menu, controller )
	PrimaryProfileSnapshot:setLeftRight( true, false, 13, 403 )
	PrimaryProfileSnapshot:setTopBottom( true, false, 260.5, 488.5 )
	PrimaryProfileSnapshot.StartMenuProfileSnapshotPreview.ImageContainer.ImageContainer:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_screenshots" ) )
	PrimaryProfileSnapshot:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordProfileSnapshot.fileId" ), function ( model )
		local f6_local0 = PrimaryProfileSnapshot
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CombatRecordProfileSnapshot.fileId"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f6_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	PrimaryProfileSnapshot:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f7_local0
	end )
	PrimaryProfileSnapshot:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	menu:AddButtonCallbackFunction( PrimaryProfileSnapshot, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if not IsCombatRecordForRemotePlayer() and IsControllerModelValueDefaultID64Value( f9_arg0, f9_arg2, "CombatRecordProfileSnapshot.fileId" ) then
			CombatRecordOpenProfileSnapshot( f9_arg1, f9_arg2 )
			return true
		elseif not IsControllerModelValueDefaultID64Value( f9_arg0, f9_arg2, "CombatRecordProfileSnapshot.fileId" ) then
			CombatRecordProfileSnapshotFullscreenView( self, f9_arg2 )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		if not IsCombatRecordForRemotePlayer() and IsControllerModelValueDefaultID64Value( f10_arg0, f10_arg2, "CombatRecordProfileSnapshot.fileId" ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsControllerModelValueDefaultID64Value( f10_arg0, f10_arg2, "CombatRecordProfileSnapshot.fileId" ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( PrimaryProfileSnapshot, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "C", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if not IsCombatRecordForRemotePlayer() and not IsControllerModelValueDefaultID64Value( f11_arg0, f11_arg2, "CombatRecordProfileSnapshot.fileId" ) then
			CombatRecordClearProfileSnapshot( f11_arg2 )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if not IsCombatRecordForRemotePlayer() and not IsControllerModelValueDefaultID64Value( f12_arg0, f12_arg2, "CombatRecordProfileSnapshot.fileId" ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_CLEAR" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( PrimaryProfileSnapshot )
	self.PrimaryProfileSnapshot = PrimaryProfileSnapshot
	
	local PrimaryProfileSnapshotLabel = LUI.UITightText.new()
	PrimaryProfileSnapshotLabel:setLeftRight( true, false, 13, 221 )
	PrimaryProfileSnapshotLabel:setTopBottom( true, false, 228.5, 253.5 )
	PrimaryProfileSnapshotLabel:setText( Engine.Localize( "MENU_PROFILE_SNAPSHOT_CAPS" ) )
	PrimaryProfileSnapshotLabel:setTTF( "fonts/default.ttf" )
	self:addElement( PrimaryProfileSnapshotLabel )
	self.PrimaryProfileSnapshotLabel = PrimaryProfileSnapshotLabel
	
	local CallingCardShowcaseList = LUI.UIList.new( menu, controller, 4, 0, nil, false, false, 0, 0, false, false )
	CallingCardShowcaseList:makeFocusable()
	CallingCardShowcaseList:setLeftRight( true, false, 447.08, 747.08 )
	CallingCardShowcaseList:setTopBottom( true, false, 261.5, 494.5 )
	CallingCardShowcaseList:setWidgetType( CoD.CombatRecordCallingCard )
	CallingCardShowcaseList:setVerticalCount( 3 )
	CallingCardShowcaseList:setSpacing( 4 )
	CallingCardShowcaseList:setDataSource( "CombatRecordCallingCardShowcase" )
	CallingCardShowcaseList:linkToElementModel( CallingCardShowcaseList, "backgroundID", true, function ( model )
		local f13_local0 = CallingCardShowcaseList
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "backgroundID"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	CallingCardShowcaseList:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f14_local0
	end )
	CallingCardShowcaseList:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	menu:AddButtonCallbackFunction( CallingCardShowcaseList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if not IsCombatRecordForRemotePlayer() then
			CombatRecordOpenCallingCards( self, f16_arg2, f16_arg1, f16_arg0 )
			return true
		else
			
		end
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		if not IsCombatRecordForRemotePlayer() then
			CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( CallingCardShowcaseList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "C", function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		if not IsCombatRecordForRemotePlayer() and not IsSelfModelValueEqualTo( f18_arg0, f18_arg2, "backgroundID", 0 ) then
			CombatRecordClearCallingCard( f18_arg1, f18_arg0, f18_arg2 )
			return true
		else
			
		end
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		if not IsCombatRecordForRemotePlayer() and not IsSelfModelValueEqualTo( f19_arg0, f19_arg2, "backgroundID", 0 ) then
			CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_CLEAR" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CallingCardShowcaseList )
	self.CallingCardShowcaseList = CallingCardShowcaseList
	
	PrimaryProfileSnapshot.navigation = {
		right = CallingCardShowcaseList
	}
	CallingCardShowcaseList.navigation = {
		left = PrimaryProfileSnapshot
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

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
				local f20_local1 = function ( f22_arg0, f22_arg1 )
					if not f22_arg1.interrupted then
						f22_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					f22_arg0:setAlpha( 1 )
					if f22_arg1.interrupted then
						self.clipFinished( f22_arg0, f22_arg1 )
					else
						f22_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankName:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				RankName:setAlpha( 0 )
				RankName:registerEventHandler( "transition_complete_keyframe", f20_local1 )
				local f20_local2 = function ( f23_arg0, f23_arg1 )
					if not f23_arg1.interrupted then
						f23_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Bounce )
					end
					f23_arg0:setAlpha( 1 )
					if f23_arg1.interrupted then
						self.clipFinished( f23_arg0, f23_arg1 )
					else
						f23_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				Rank:setAlpha( 0 )
				Rank:registerEventHandler( "transition_complete_keyframe", f20_local2 )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:subscribeToGlobalModel( controller, "PerController", "CombatRecordProfileSnapshot.fileId", function ( model )
		local f24_local0 = self
		CombatRecordProfileSnapshotDownloadScreenshot( controller )
	end )
	PrimaryProfileSnapshot.id = "PrimaryProfileSnapshot"
	CallingCardShowcaseList.id = "CallingCardShowcaseList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.PrimaryProfileSnapshot:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CombatRecordLineDivider:close()
		element.CombatRecordLineDivider0:close()
		element.CombatRecordLineDivider1:close()
		element.CombatRecordLineDivider2:close()
		element.Kills:close()
		element.Wins:close()
		element.Score:close()
		element.KDRatio:close()
		element.WLRatio:close()
		element.SPM:close()
		element.StartMenuframenoBG00:close()
		element.PrestigeMasterTierWidget:close()
		element.PrimaryProfileSnapshot:close()
		element.CallingCardShowcaseList:close()
		element.Rank:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

