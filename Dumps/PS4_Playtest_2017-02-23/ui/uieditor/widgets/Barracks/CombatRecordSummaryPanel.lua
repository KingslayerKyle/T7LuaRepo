require( "ui.uieditor.widgets.Barracks.CombatRecord_LineDivider" )
require( "ui.uieditor.widgets.Barracks.CombatRecordCallingCard" )
require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStat" )
require( "ui.uieditor.widgets.Barracks.CombatRecordSummaryStatSmall" )
require( "ui.uieditor.widgets.Prestige.Prestige_MasterTierWidget" )
require( "ui.uieditor.widgets.Primary_Profile_Snapshot" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local PreLoadFunc = function ( self, controller )
	CoD.CombatRecordMode = "summary"
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
	SummaryTitle:setLeftRight( 0, 0, 20, 320 )
	SummaryTitle:setTopBottom( 0, 0, 0, 38 )
	SummaryTitle:setText( Engine.Localize( "MENU_GLOBAL_CAREER_SNAPSHOT_CAPS" ) )
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
	RankNameBackground:setLeftRight( 0.5, 0.5, -672, -422 )
	RankNameBackground:setTopBottom( 0, 0, 115, 157 )
	RankNameBackground:setAlpha( 0.7 )
	self:addElement( RankNameBackground )
	self.RankNameBackground = RankNameBackground
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( 0.5, 0.5, -672, -422 )
	RankBackground:setTopBottom( 0, 0, 157, 199 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0.8 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local RankName = LUI.UIText.new()
	RankName:setLeftRight( 0.5, 0.5, -672, -422 )
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
	Rank:setLeftRight( 0.5, 0.5, -672, -422 )
	Rank:setTopBottom( 0, 0, 160, 198 )
	Rank:setText( CombatRecordGetLevelString( controller, "Level 88" ) )
	Rank:setTTF( "fonts/escom.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Rank:setRGB( CombatRecordGetParagonColorByRank( controller, 255, 255, 255, modelValue ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
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
	CombatRecordLineDivider0:setLeftRight( 0, 0, 1137, 1175 )
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
	Image500:setTopBottom( 0, 0, 41, 45 )
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
	StartMenuframenoBG00:setLeftRight( 0.5, 0.5, -676, -419 )
	StartMenuframenoBG00:setTopBottom( 0.5, 0.5, -298, -206 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local CallingCardShowcaseList = LUI.UIList.new( menu, controller, 6, 0, nil, false, false, 0, 0, false, false )
	CallingCardShowcaseList:makeFocusable()
	CallingCardShowcaseList:setLeftRight( 0, 0, 19, 469 )
	CallingCardShowcaseList:setTopBottom( 0, 0, 390, 738 )
	CallingCardShowcaseList:setWidgetType( CoD.CombatRecordCallingCard )
	CallingCardShowcaseList:setVerticalCount( 3 )
	CallingCardShowcaseList:setSpacing( 6 )
	CallingCardShowcaseList:setDataSource( "CombatRecordCallingCardShowcase" )
	CallingCardShowcaseList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CallingCardShowcaseList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CallingCardShowcaseList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsCombatRecordForRemotePlayer() then
			CombatRecordOpenCallingCards( self, controller, menu, element )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsCombatRecordForRemotePlayer() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CallingCardShowcaseList )
	self.CallingCardShowcaseList = CallingCardShowcaseList
	
	local CallingCardShowcaseLabel = LUI.UITightText.new()
	CallingCardShowcaseLabel:setLeftRight( 0, 0, 20, 260 )
	CallingCardShowcaseLabel:setTopBottom( 0, 0, 343, 381 )
	CallingCardShowcaseLabel:setText( Engine.Localize( "MENU_CALLING_CARD_SHOWCASE_CAPS" ) )
	CallingCardShowcaseLabel:setTTF( "fonts/default.ttf" )
	self:addElement( CallingCardShowcaseLabel )
	self.CallingCardShowcaseLabel = CallingCardShowcaseLabel
	
	local PrestigeMasterTierWidget = CoD.Prestige_MasterTierWidget.new( menu, controller )
	PrestigeMasterTierWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsMaxPrestigeLevelForMode( controller, Enum.eModes.MODE_MULTIPLAYER )
			end
		}
	} )
	PrestigeMasterTierWidget:setLeftRight( 0.5, 0.5, -702, -392 )
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
	
	local PrimaryProfileSnapshot = CoD.Primary_Profile_Snapshot.new( menu, controller )
	PrimaryProfileSnapshot:setLeftRight( 0, 0, 569, 1154 )
	PrimaryProfileSnapshot:setTopBottom( 0, 0, 392, 734 )
	PrimaryProfileSnapshot.ImageContainer.ImageContainer:setImage( RegisterImage( "t7_menu_startmenu_identity_screenshots" ) )
	self:addElement( PrimaryProfileSnapshot )
	self.PrimaryProfileSnapshot = PrimaryProfileSnapshot
	
	local CallingCardShowcaseLabel0 = LUI.UITightText.new()
	CallingCardShowcaseLabel0:setLeftRight( 0, 0, 569, 881 )
	CallingCardShowcaseLabel0:setTopBottom( 0, 0, 344, 382 )
	CallingCardShowcaseLabel0:setText( Engine.Localize( "MENU_PROFILE_SNAPSHOT_CAPS" ) )
	CallingCardShowcaseLabel0:setTTF( "fonts/default.ttf" )
	self:addElement( CallingCardShowcaseLabel0 )
	self.CallingCardShowcaseLabel0 = CallingCardShowcaseLabel0
	
	CallingCardShowcaseList.navigation = {
		right = PrimaryProfileSnapshot
	}
	PrimaryProfileSnapshot.navigation = {
		left = CallingCardShowcaseList
	}
	self.resetProperties = function ()
		Emblem:completeAnimation()
		Rank:completeAnimation()
		RankName:completeAnimation()
		Emblem:setAlpha( 1 )
		Rank:setAlpha( 1 )
		RankName:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	CallingCardShowcaseList.id = "CallingCardShowcaseList"
	PrimaryProfileSnapshot.id = "PrimaryProfileSnapshot"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.CallingCardShowcaseList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
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
		self.CallingCardShowcaseList:close()
		self.PrestigeMasterTierWidget:close()
		self.PrimaryProfileSnapshot:close()
		self.Rank:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

