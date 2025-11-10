require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Stat" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.CombatRecordButton = InheritFrom( LUI.UIElement )
CoD.CombatRecordButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CombatRecordButton )
	self.id = "CombatRecordButton"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 707 )
	self:setTopBottom( true, false, 0, 298 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, true, 3, -2 )
	BlackTint:setTopBottom( true, true, 3, -3 )
	BlackTint:setAlpha( 0 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, 3, -3 )
	BlackBox:setTopBottom( true, true, 2, -4 )
	BlackBox:setAlpha( 0 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local Emblem = LUI.UIImage.new()
	Emblem:setLeftRight( false, false, -298, -170 )
	Emblem:setTopBottom( true, false, 21, 149 )
	Emblem:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			Emblem:setImage( RegisterImage( GetRankIconLarge( GetRankIcon( controller, "playerstatslist.rank.statvalue", "playerstatslist.plevel.statvalue", "mp", statsMp ) ) ) )
		end
	end )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local RankNameBackground = LUI.UIImage.new()
	RankNameBackground:setLeftRight( false, false, -307, -161 )
	RankNameBackground:setTopBottom( true, false, 166.5, 194.5 )
	RankNameBackground:setAlpha( 0.8 )
	self:addElement( RankNameBackground )
	self.RankNameBackground = RankNameBackground
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( false, false, -307, -161 )
	RankBackground:setTopBottom( true, false, 196.5, 224.5 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0.8 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local RankName = LUI.UIText.new()
	RankName:setLeftRight( false, false, -307, -161 )
	RankName:setTopBottom( true, false, 170.5, 190.5 )
	RankName:setRGB( 0, 0, 0 )
	RankName:setTTF( "fonts/escom.ttf" )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	RankName:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			RankName:setText( Engine.Localize( RankTitleFromStorage( controller, "mp", statsMp ) ) )
		end
	end )
	self:addElement( RankName )
	self.RankName = RankName
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( false, false, -307, -161 )
	Rank:setTopBottom( true, false, 195.5, 223.5 )
	Rank:setTTF( "fonts/escom.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			Rank:setText( Engine.Localize( RankToLevelString( "mp", StorageLookup( controller, "playerstatslist.rank.statvalue", statsMp ) ) ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local TotalKills = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	TotalKills:setLeftRight( true, false, 242.33, 362 )
	TotalKills:setTopBottom( true, false, 48.5, 109.5 )
	TotalKills.Value:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	TotalKills:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			TotalKills.Title:setText( Engine.Localize( StorageLookup( controller, "playerstatslist.kills.statvalue", statsMp ) ) )
		end
	end )
	self:addElement( TotalKills )
	self.TotalKills = TotalKills
	
	local StartMenuBarracksStat0 = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	StartMenuBarracksStat0:setLeftRight( true, false, 404.08, 523.75 )
	StartMenuBarracksStat0:setTopBottom( true, false, 48.5, 109.5 )
	StartMenuBarracksStat0.Value:setText( Engine.Localize( "MENU_WINS_CAPS" ) )
	StartMenuBarracksStat0:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksStat0.Title:setText( Engine.Localize( StorageLookup( controller, "playerstatslist.wins.statvalue", statsMp ) ) )
		end
	end )
	self:addElement( StartMenuBarracksStat0 )
	self.StartMenuBarracksStat0 = StartMenuBarracksStat0
	
	local StartMenuBarracksStat1 = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	StartMenuBarracksStat1:setLeftRight( true, false, 565.83, 685.5 )
	StartMenuBarracksStat1:setTopBottom( true, false, 48.5, 109.5 )
	StartMenuBarracksStat1.Value:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	StartMenuBarracksStat1:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksStat1.Title:setText( Engine.Localize( StorageLookup( controller, "playerstatslist.score.statvalue", statsMp ) ) )
		end
	end )
	self:addElement( StartMenuBarracksStat1 )
	self.StartMenuBarracksStat1 = StartMenuBarracksStat1
	
	local StartMenuBarracksStat2 = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	StartMenuBarracksStat2:setLeftRight( true, false, 242.33, 362 )
	StartMenuBarracksStat2:setTopBottom( true, false, 162.5, 223.5 )
	StartMenuBarracksStat2.Value:setText( Engine.Localize( "MENU_KDRATIO_ABBR" ) )
	StartMenuBarracksStat2:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksStat2.Title:setText( Engine.Localize( StorageLookupTwoStatRatio( controller, "playerstatslist.kills.statvalue", "playerstatslist.deaths.statvalue", statsMp ) ) )
		end
	end )
	self:addElement( StartMenuBarracksStat2 )
	self.StartMenuBarracksStat2 = StartMenuBarracksStat2
	
	local StartMenuBarracksStat3 = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	StartMenuBarracksStat3:setLeftRight( true, false, 404.08, 523.75 )
	StartMenuBarracksStat3:setTopBottom( true, false, 162.5, 223.5 )
	StartMenuBarracksStat3.Value:setText( Engine.Localize( "MENU_WLRATIO" ) )
	StartMenuBarracksStat3:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksStat3.Title:setText( Engine.Localize( StorageLookupTwoStatRatio( controller, "playerstatslist.wins.statvalue", "playerstatslist.losses.statvalue", statsMp ) ) )
		end
	end )
	self:addElement( StartMenuBarracksStat3 )
	self.StartMenuBarracksStat3 = StartMenuBarracksStat3
	
	local StartMenuBarracksStat4 = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	StartMenuBarracksStat4:setLeftRight( true, false, 565.83, 685.5 )
	StartMenuBarracksStat4:setTopBottom( true, false, 162.5, 223.5 )
	StartMenuBarracksStat4.Value:setText( Engine.Localize( "MENU_SCORE_PER_MINUTE" ) )
	StartMenuBarracksStat4:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			StartMenuBarracksStat4.Title:setText( Engine.Localize( StorageLookupSPM( controller, "playerstatslist.score.statvalue", "playerstatslist.time_played_total.statvalue", statsMp ) ) )
		end
	end )
	self:addElement( StartMenuBarracksStat4 )
	self.StartMenuBarracksStat4 = StartMenuBarracksStat4
	
	local ButtonTitleBG0 = LUI.UIImage.new()
	ButtonTitleBG0:setLeftRight( true, true, 3, -2 )
	ButtonTitleBG0:setTopBottom( true, true, 2, -3 )
	ButtonTitleBG0:setRGB( 0, 0, 0 )
	ButtonTitleBG0:setAlpha( 0 )
	self:addElement( ButtonTitleBG0 )
	self.ButtonTitleBG0 = ButtonTitleBG0
	
	local ButtonTitleBG = LUI.UIImage.new()
	ButtonTitleBG:setLeftRight( true, true, 5, -5 )
	ButtonTitleBG:setTopBottom( false, true, -28, -5 )
	ButtonTitleBG:setRGB( 0, 0, 0 )
	ButtonTitleBG:setAlpha( 0 )
	self:addElement( ButtonTitleBG )
	self.ButtonTitleBG = ButtonTitleBG
	
	local ButtonTitle = LUI.UIText.new()
	ButtonTitle:setLeftRight( true, true, 23, 7 )
	ButtonTitle:setTopBottom( false, true, -26.5, -6.5 )
	ButtonTitle:setAlpha( 0 )
	ButtonTitle:setText( Engine.Localize( "FEATURE_COMBAT_RECORD" ) )
	ButtonTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ButtonTitle )
	self.ButtonTitle = ButtonTitle
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 5, 361 )
	StartMenuIdentitySubTitle0:setTopBottom( true, false, 267, 293 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Combat" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 362, -464.67 )
	Image0:setTopBottom( false, true, -168, -160 )
	Image0:setAlpha( 0.25 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, true, 526, -300.67 )
	Image1:setTopBottom( false, true, -168, -160 )
	Image1:setAlpha( 0.25 )
	Image1:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, true, 687.5, -139.17 )
	Image2:setTopBottom( false, true, -168, -160 )
	Image2:setAlpha( 0.25 )
	Image2:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local time = LUI.UIText.new()
	time:setLeftRight( true, false, 485.5, 685.5 )
	time:setTopBottom( true, false, 247, 267 )
	time:setTTF( "fonts/default.ttf" )
	time:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	time:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	time:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			time:setText( Engine.Localize( SecondsAsTimePlayedString( StorageLookup( controller, "playerstatslist.time_played_total.statvalue", statsMp ) ) ) )
		end
	end )
	self:addElement( time )
	self.time = time
	
	local Vline2 = LUI.UIImage.new()
	Vline2:setLeftRight( true, false, 382.17, 384.17 )
	Vline2:setTopBottom( true, false, 48.5, 217 )
	Vline2:setAlpha( 0.35 )
	Vline2:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline2 )
	self.Vline2 = Vline2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 545.17, 547.17 )
	Image3:setTopBottom( true, false, 48.5, 217 )
	Image3:setAlpha( 0.35 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( false, false, -309, -159 )
	StartMenuframenoBG00:setTopBottom( false, false, 15.5, 77.5 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BlackTint:completeAnimation()
				self.BlackTint:setLeftRight( true, true, 3, -2 )
				self.BlackTint:setTopBottom( true, true, 3, -2 )
				self.BlackTint:setRGB( 0, 0, 0 )
				self.BlackTint:setAlpha( 0.05 )
				self.clipFinished( BlackTint, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )
				ButtonTitleBG0:completeAnimation()
				self.ButtonTitleBG0:setAlpha( 0 )
				self.clipFinished( ButtonTitleBG0, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )
				ButtonTitleBG0:completeAnimation()
				self.ButtonTitleBG0:setAlpha( 0 )
				self.clipFinished( ButtonTitleBG0, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.TotalKills:close()
		element.StartMenuBarracksStat0:close()
		element.StartMenuBarracksStat1:close()
		element.StartMenuBarracksStat2:close()
		element.StartMenuBarracksStat3:close()
		element.StartMenuBarracksStat4:close()
		element.StartMenuIdentitySubTitle0:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.StartMenuframenoBG00:close()
		element.Emblem:close()
		element.RankName:close()
		element.Rank:close()
		element.time:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

