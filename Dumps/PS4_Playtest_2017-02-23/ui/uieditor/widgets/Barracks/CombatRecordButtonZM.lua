require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Prestige.Prestige_MasterTierWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Stat" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )

CoD.CombatRecordButtonZM = InheritFrom( LUI.UIElement )
CoD.CombatRecordButtonZM.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordButtonZM )
	self.id = "CombatRecordButtonZM"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1060 )
	self:setTopBottom( 0, 0, 0, 447 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 1, 5, -3 )
	BlackTint:setTopBottom( 0, 1, 4, -4 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.05 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, 0, -2 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, 0, -2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local Emblem = LUI.UIImage.new()
	Emblem:setLeftRight( 0.5, 0.5, -447, -255 )
	Emblem:setTopBottom( 0, 0, 32, 224 )
	Emblem:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Emblem:setImage( RegisterImage( GetRankIconLarge( GetRankOrParagonIcon( controller, "playerstatslist.rank.statvalue", "playerstatslist.plevel.statvalue", "playerstatslist.paragon_icon_id.statvalue", "zm", modelValue ) ) ) )
		end
	end )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local RankNameBackground = LUI.UIImage.new()
	RankNameBackground:setLeftRight( 0.5, 0.5, -496, -204 )
	RankNameBackground:setTopBottom( 0, 0, 250, 292 )
	RankNameBackground:setAlpha( 0.6 )
	self:addElement( RankNameBackground )
	self.RankNameBackground = RankNameBackground
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( 0.5, 0.5, -496, -204 )
	RankBackground:setTopBottom( 0, 0, 295, 337 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0.8 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( 0.5, 0.5, -460, -241 )
	Rank:setTopBottom( 0, 0, 298, 331 )
	Rank:setTTF( "fonts/escom.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Rank:setRGB( SetToParagonColorIfPrestigeMasterFromStorage( controller, "zm", 255, 255, 255, modelValue ) )
		end
	end )
	Rank:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Rank:setText( LevelStringFromStorage( controller, "zm", modelValue ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local TotalKills = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	TotalKills:setLeftRight( 0, 0, 364, 543 )
	TotalKills:setTopBottom( 0, 0, 70, 162 )
	TotalKills.Value:setText( Engine.Localize( "MPUI_KILLS" ) )
	TotalKills:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TotalKills.Title:setText( Engine.Localize( StorageLookup( controller, "playerstatslist.kills.statvalue", modelValue ) ) )
		end
	end )
	self:addElement( TotalKills )
	self.TotalKills = TotalKills
	
	local StartMenuBarracksStat0 = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	StartMenuBarracksStat0:setLeftRight( 0, 0, 606, 786 )
	StartMenuBarracksStat0:setTopBottom( 0, 0, 70, 162 )
	StartMenuBarracksStat0.Value:setText( Engine.Localize( "MENU_ROUNDS_SURVIVED" ) )
	StartMenuBarracksStat0:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksStat0.Title:setText( Engine.Localize( StorageLookup( controller, "playerstatslist.TOTAL_ROUNDS_SURVIVED.statvalue", modelValue ) ) )
		end
	end )
	self:addElement( StartMenuBarracksStat0 )
	self.StartMenuBarracksStat0 = StartMenuBarracksStat0
	
	local StartMenuBarracksStat1 = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	StartMenuBarracksStat1:setLeftRight( 0, 0, 849, 1028 )
	StartMenuBarracksStat1:setTopBottom( 0, 0, 70, 162 )
	StartMenuBarracksStat1.Value:setText( Engine.Localize( "MENU_AVERAGE_GAME_SCORE" ) )
	StartMenuBarracksStat1:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksStat1.Title:setText( Engine.Localize( StorageLookup( controller, "playerstatslist.score.statvalue", modelValue ) ) )
		end
	end )
	self:addElement( StartMenuBarracksStat1 )
	self.StartMenuBarracksStat1 = StartMenuBarracksStat1
	
	local StartMenuBarracksStat2 = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	StartMenuBarracksStat2:setLeftRight( 0, 0, 364, 543 )
	StartMenuBarracksStat2:setTopBottom( 0, 0, 229, 321 )
	StartMenuBarracksStat2.Value:setText( Engine.Localize( "MPUI_HEADSHOTS" ) )
	StartMenuBarracksStat2:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksStat2.Title:setText( Engine.Localize( StorageLookup( controller, "playerstatslist.headshots.statvalue", modelValue ) ) )
		end
	end )
	self:addElement( StartMenuBarracksStat2 )
	self.StartMenuBarracksStat2 = StartMenuBarracksStat2
	
	local StartMenuBarracksStat3 = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	StartMenuBarracksStat3:setLeftRight( 0, 0, 606, 786 )
	StartMenuBarracksStat3:setTopBottom( 0, 0, 229, 321 )
	StartMenuBarracksStat3.Value:setText( Engine.Localize( "MENU_AVERAGE_ROUNDS_PER_GAME" ) )
	StartMenuBarracksStat3:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksStat3.Title:setText( Engine.Localize( StorageLookupTwoStatRatioRounded( controller, "playerstatslist.total_rounds_survived.statvalue", "playerstatslist.total_games_played.statvalue", modelValue ) ) )
		end
	end )
	self:addElement( StartMenuBarracksStat3 )
	self.StartMenuBarracksStat3 = StartMenuBarracksStat3
	
	local StartMenuBarracksStat4 = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	StartMenuBarracksStat4:setLeftRight( 0, 0, 849, 1028 )
	StartMenuBarracksStat4:setTopBottom( 0, 0, 229, 321 )
	StartMenuBarracksStat4.Value:setText( Engine.Localize( "MENU_SCORE_PER_MINUTE" ) )
	StartMenuBarracksStat4:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuBarracksStat4.Title:setText( Engine.Localize( StorageLookupSPM( controller, "playerstatslist.score.statvalue", "playerstatslist.time_played_total.statvalue", modelValue ) ) )
		end
	end )
	self:addElement( StartMenuBarracksStat4 )
	self.StartMenuBarracksStat4 = StartMenuBarracksStat4
	
	local ButtonTitleBG = LUI.UIImage.new()
	ButtonTitleBG:setLeftRight( 0, 1, 8, -8 )
	ButtonTitleBG:setTopBottom( 1, 1, -66, -8 )
	ButtonTitleBG:setRGB( 0, 0, 0 )
	ButtonTitleBG:setAlpha( 0 )
	self:addElement( ButtonTitleBG )
	self.ButtonTitleBG = ButtonTitleBG
	
	local ButtonTitle = LUI.UIText.new()
	ButtonTitle:setLeftRight( 0, 1, 16, -8 )
	ButtonTitle:setTopBottom( 1, 1, -66, -8 )
	ButtonTitle:setAlpha( 0 )
	ButtonTitle:setText( Engine.Localize( "FEATURE_COMBAT_RECORD" ) )
	ButtonTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ButtonTitle )
	self.ButtonTitle = ButtonTitle
	
	local RankName = LUI.UIText.new()
	RankName:setLeftRight( 0.5, 0.5, -460, -241 )
	RankName:setTopBottom( 0, 0, 256, 286 )
	RankName:setRGB( 0, 0, 0 )
	RankName:setTTF( "fonts/escom.ttf" )
	RankName:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	RankName:setShaderVector( 0, 0.05, 0, 0, 0 )
	RankName:setShaderVector( 1, 0, 0, 0, 0 )
	RankName:setShaderVector( 2, 1, 0, 0, 0 )
	RankName:setLetterSpacing( 1 )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	RankName:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankName:setText( Engine.Localize( RankTitleFromStorage( controller, "zm", modelValue ) ) )
		end
	end )
	self:addElement( RankName )
	self.RankName = RankName
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( 0, 0, 7, 541 )
	StartMenuIdentitySubTitle0:setTopBottom( 0, 0, 400, 439 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Combat" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, 0 )
	FocusBarT:setTopBottom( 0, 0, -1, 5 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -5, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 1, 543, -697 )
	Image0:setTopBottom( 1, 1, -252, -240 )
	Image0:setAlpha( 0.25 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 1, 789, -451 )
	Image1:setTopBottom( 1, 1, -252, -240 )
	Image1:setAlpha( 0.25 )
	Image1:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0, 1, 1031, -209 )
	Image2:setTopBottom( 1, 1, -252, -240 )
	Image2:setAlpha( 0.25 )
	Image2:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Vline2 = LUI.UIImage.new()
	Vline2:setLeftRight( 0, 0, 573, 576 )
	Vline2:setTopBottom( 0, 0, 73, 326 )
	Vline2:setAlpha( 0.35 )
	Vline2:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Vline2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Vline2 )
	self.Vline2 = Vline2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 0, 818, 821 )
	Image3:setTopBottom( 0, 0, 73, 326 )
	Image3:setAlpha( 0.35 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local time = LUI.UIText.new()
	time:setLeftRight( 0, 0, 728, 1028 )
	time:setTopBottom( 0, 0, 371, 401 )
	time:setTTF( "fonts/default.ttf" )
	time:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	time:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	time:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			time:setText( SecondsAsTimePlayedString( StorageLookup( controller, "playerstatslist.time_played_total.statvalue", modelValue ) ) )
		end
	end )
	self:addElement( time )
	self.time = time
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( 0.5, 0.5, -499, -201 )
	StartMenuframenoBG00:setTopBottom( 0.5, 0.5, 23, 116 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local PrestigeMasterTierWidget = CoD.Prestige_MasterTierWidget.new( menu, controller )
	PrestigeMasterTierWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsMaxPrestigeLevelForMode( controller, Enum.eModes.MODE_ZOMBIES )
			end
		}
	} )
	PrestigeMasterTierWidget:setLeftRight( 0.5, 0.5, -496, -204 )
	PrestigeMasterTierWidget:setTopBottom( 0, 0, 337, 373 )
	PrestigeMasterTierWidget:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigeMasterTierWidget.ParagonStars:setHorizontalCount( GetPrestigeMasterTierCountFromStorage( controller, "zm", modelValue ) )
		end
	end )
	self:addElement( PrestigeMasterTierWidget )
	self.PrestigeMasterTierWidget = PrestigeMasterTierWidget
	
	self.resetProperties = function ()
		BoxButtonLrgInactiveDiag:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BlackTint:completeAnimation()
		BoxButtonLrgInactive:completeAnimation()
		BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		BlackTint:setAlpha( 0.05 )
		BoxButtonLrgInactive:setAlpha( 0.4 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.TotalKills:close()
		self.StartMenuBarracksStat0:close()
		self.StartMenuBarracksStat1:close()
		self.StartMenuBarracksStat2:close()
		self.StartMenuBarracksStat3:close()
		self.StartMenuBarracksStat4:close()
		self.StartMenuIdentitySubTitle0:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.StartMenuframenoBG00:close()
		self.PrestigeMasterTierWidget:close()
		self.Emblem:close()
		self.Rank:close()
		self.RankName:close()
		self.time:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

