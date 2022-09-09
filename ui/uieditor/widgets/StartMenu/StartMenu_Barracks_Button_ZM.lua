-- f59c480a23390478e97d6dc71ee62090
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Stat" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Prestige.Prestige_MasterTierWidget" )

CoD.StartMenu_Barracks_Button_ZM = InheritFrom( LUI.UIElement )
CoD.StartMenu_Barracks_Button_ZM.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Barracks_Button_ZM )
	self.id = "StartMenu_Barracks_Button_ZM"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 366 )
	self:setTopBottom( true, false, 0, 437 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, -82 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local Tile = LUI.UIImage.new()
	Tile:setLeftRight( true, false, 0, 366 )
	Tile:setTopBottom( true, false, 0, 353 )
	Tile:setImage( RegisterImage( "uie_t7_tile_texture" ) )
	Tile:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Tile:setShaderVector( 0, 13, 13, 0, 0 )
	Tile:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( Tile )
	self.Tile = Tile
	
	local Emblem = LUI.UIImage.new()
	Emblem:setLeftRight( false, false, -61, 67 )
	Emblem:setTopBottom( true, false, 20, 148 )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local RankNameBackground = LUI.UIImage.new()
	RankNameBackground:setLeftRight( false, false, -98, 105 )
	RankNameBackground:setTopBottom( true, false, 178, 206 )
	RankNameBackground:setAlpha( 0.6 )
	self:addElement( RankNameBackground )
	self.RankNameBackground = RankNameBackground
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( false, false, -98, 105 )
	RankBackground:setTopBottom( true, false, 208, 236 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0.6 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local RankName = LUI.UIText.new()
	RankName:setLeftRight( false, false, -141, 147 )
	RankName:setTopBottom( true, false, 182, 202 )
	RankName:setRGB( 0, 0, 0 )
	RankName:setText( Engine.Localize( "Vindicator" ) )
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
	Rank:setLeftRight( false, false, -141, 147 )
	Rank:setTopBottom( true, false, 211, 233 )
	Rank:setText( Engine.Localize( "LEVEL 18" ) )
	Rank:setTTF( "fonts/escom.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Rank )
	self.Rank = Rank
	
	local ButtonTitleBG = LUI.UIImage.new()
	ButtonTitleBG:setLeftRight( true, true, 3, -2 )
	ButtonTitleBG:setTopBottom( true, false, 2, 353 )
	ButtonTitleBG:setRGB( 0, 0, 0 )
	ButtonTitleBG:setAlpha( 0.05 )
	self:addElement( ButtonTitleBG )
	self.ButtonTitleBG = ButtonTitleBG
	
	local SessionName = LUI.UIText.new()
	SessionName:setLeftRight( true, false, 11.73, 353.73 )
	SessionName:setTopBottom( true, false, 305, 327 )
	SessionName:setText( Engine.Localize( "MENU_ZOMBIES_CAPS" ) )
	SessionName:setTTF( "fonts/escom.ttf" )
	SessionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SessionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SessionName )
	self.SessionName = SessionName
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 5, 361 )
	StartMenuIdentitySubTitle0:setTopBottom( true, false, 324, 350 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Combat Record, Challenges, Leaderboards" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, false, 0, 355 )
	BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, false, 0, 355 )
	StartMenuframenoBG0:setAlpha( 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( true, false, 353, 357 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local TotalKills = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	TotalKills:setLeftRight( true, false, 0, 110.67 )
	TotalKills:setTopBottom( true, false, 375.94, 436.94 )
	TotalKills.BorderThin0:setAlpha( 0.3 )
	TotalKills.Value:setText( Engine.Localize( "MPUI_TOTAL_KILLS_CAPS" ) )
	TotalKills.Title:setText( Engine.Localize( "0" ) )
	self:addElement( TotalKills )
	self.TotalKills = TotalKills
	
	local RoundsSurvived = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	RoundsSurvived:setLeftRight( true, false, 116, 244 )
	RoundsSurvived:setTopBottom( true, false, 375.94, 436.94 )
	RoundsSurvived.BorderThin0:setAlpha( 0.3 )
	RoundsSurvived.Value:setText( Engine.Localize( "MENU_ROUNDS_SURVIVED_CAPS" ) )
	RoundsSurvived.Title:setText( Engine.Localize( "0" ) )
	self:addElement( RoundsSurvived )
	self.RoundsSurvived = RoundsSurvived
	
	local SPM = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	SPM:setLeftRight( true, false, 250, 366 )
	SPM:setTopBottom( true, false, 375.94, 436.94 )
	SPM.BorderThin0:setAlpha( 0.3 )
	SPM.Value:setText( Engine.Localize( "MENU_AVERAGE_ROUNDS_CAPS" ) )
	SPM.Title:setText( Engine.Localize( "0" ) )
	self:addElement( SPM )
	self.SPM = SPM
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( true, false, -34, 2 )
	Pixel200:setTopBottom( true, false, 435, 439 )
	Pixel200:setYRot( -180 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -34, 2 )
	Image0:setTopBottom( true, false, 373.94, 377.94 )
	Image0:setYRot( -180 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 364, 400 )
	Image1:setTopBottom( true, false, 435, 439 )
	Image1:setYRot( -180 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 364, 400 )
	Image2:setTopBottom( true, false, 373.94, 377.94 )
	Image2:setYRot( -180 )
	Image2:setZRot( 180 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local unlockRequirements = LUI.UIText.new()
	unlockRequirements:setLeftRight( true, false, 11.5, 353.5 )
	unlockRequirements:setTopBottom( true, false, 263, 285 )
	unlockRequirements:setAlpha( 0 )
	unlockRequirements:setText( Engine.Localize( "CPUI_REQUIRES_LEVEL" ) )
	unlockRequirements:setTTF( "fonts/escom.ttf" )
	unlockRequirements:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	unlockRequirements:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( unlockRequirements )
	self.unlockRequirements = unlockRequirements
	
	local BlackLine = LUI.UIImage.new()
	BlackLine:setLeftRight( true, true, 3, -3 )
	BlackLine:setTopBottom( false, false, -63, -22.5 )
	BlackLine:setRGB( 0, 0, 0 )
	BlackLine:setAlpha( 0 )
	self:addElement( BlackLine )
	self.BlackLine = BlackLine
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -9, 15 )
	lockedIcon:setTopBottom( true, false, 159.75, 191.75 )
	lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( false, false, -100, 107 )
	StartMenuframenoBG00:setTopBottom( false, false, -42.5, 19.5 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local PrestigeMasterTierWidget = CoD.Prestige_MasterTierWidget.new( menu, controller )
	PrestigeMasterTierWidget:setLeftRight( false, false, -98, 105 )
	PrestigeMasterTierWidget:setTopBottom( true, false, 236, 260 )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0.05 )
				self.clipFinished( ButtonTitleBG, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				TotalKills:completeAnimation()
				self.TotalKills:setAlpha( 0 )
				self.clipFinished( TotalKills, {} )

				RoundsSurvived:completeAnimation()
				self.RoundsSurvived:setAlpha( 0 )
				self.clipFinished( RoundsSurvived, {} )

				SPM:completeAnimation()
				self.SPM:setAlpha( 0 )
				self.clipFinished( SPM, {} )

				Pixel200:completeAnimation()
				self.Pixel200:setAlpha( 0 )
				self.clipFinished( Pixel200, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )

				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				self.clipFinished( Image2, {} )

				unlockRequirements:completeAnimation()
				self.unlockRequirements:setAlpha( 0 )
				self.clipFinished( unlockRequirements, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 13 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0 )
				self.clipFinished( ButtonTitleBG, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				TotalKills:completeAnimation()
				self.TotalKills:setAlpha( 1 )
				self.clipFinished( TotalKills, {} )

				RoundsSurvived:completeAnimation()
				self.RoundsSurvived:setAlpha( 1 )
				self.clipFinished( RoundsSurvived, {} )

				SPM:completeAnimation()
				self.SPM:setAlpha( 1 )
				self.clipFinished( SPM, {} )

				Pixel200:completeAnimation()
				self.Pixel200:setAlpha( 1 )
				self.clipFinished( Pixel200, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )

				Image2:completeAnimation()
				self.Image2:setAlpha( 1 )
				self.clipFinished( Image2, {} )
			end
		},
		Disable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0.05 )
				self.clipFinished( ButtonTitleBG, {} )

				SessionName:completeAnimation()
				self.SessionName:setAlpha( 1 )
				self.clipFinished( SessionName, {} )

				StartMenuIdentitySubTitle0:completeAnimation()
				self.StartMenuIdentitySubTitle0:setAlpha( 1 )
				self.clipFinished( StartMenuIdentitySubTitle0, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				TotalKills:completeAnimation()
				self.TotalKills:setAlpha( 0 )
				self.clipFinished( TotalKills, {} )

				RoundsSurvived:completeAnimation()
				self.RoundsSurvived:setAlpha( 0 )
				self.clipFinished( RoundsSurvived, {} )

				SPM:completeAnimation()
				self.SPM:setAlpha( 0 )
				self.clipFinished( SPM, {} )

				Pixel200:completeAnimation()
				self.Pixel200:setAlpha( 0 )
				self.clipFinished( Pixel200, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )

				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				self.clipFinished( Image2, {} )

				unlockRequirements:completeAnimation()
				self.unlockRequirements:setAlpha( 1 )
				self.clipFinished( unlockRequirements, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0.5 )
				self.clipFinished( BlackLine, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 11 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0 )
				self.clipFinished( ButtonTitleBG, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				TotalKills:completeAnimation()
				self.TotalKills:setAlpha( 0 )
				self.clipFinished( TotalKills, {} )

				RoundsSurvived:completeAnimation()
				self.RoundsSurvived:setAlpha( 0 )
				self.clipFinished( RoundsSurvived, {} )

				SPM:completeAnimation()
				self.SPM:setAlpha( 0 )
				self.clipFinished( SPM, {} )

				BlackLine:completeAnimation()
				self.BlackLine:setAlpha( 0.5 )
				self.clipFinished( BlackLine, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		NoStats = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0.05 )
				self.clipFinished( ButtonTitleBG, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				TotalKills:completeAnimation()
				self.TotalKills:setAlpha( 0 )
				self.clipFinished( TotalKills, {} )

				RoundsSurvived:completeAnimation()
				self.RoundsSurvived:setAlpha( 0 )
				self.clipFinished( RoundsSurvived, {} )

				SPM:completeAnimation()
				self.SPM:setAlpha( 0 )
				self.clipFinished( SPM, {} )

				Pixel200:completeAnimation()
				self.Pixel200:setAlpha( 0 )
				self.clipFinished( Pixel200, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )

				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				self.clipFinished( Image2, {} )

				unlockRequirements:completeAnimation()
				self.unlockRequirements:setAlpha( 0 )
				self.clipFinished( unlockRequirements, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 13 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0 )
				self.clipFinished( ButtonTitleBG, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				TotalKills:completeAnimation()
				self.TotalKills:setAlpha( 0 )
				self.clipFinished( TotalKills, {} )

				RoundsSurvived:completeAnimation()
				self.RoundsSurvived:setAlpha( 0 )
				self.clipFinished( RoundsSurvived, {} )

				SPM:completeAnimation()
				self.SPM:setAlpha( 0 )
				self.clipFinished( SPM, {} )

				Pixel200:completeAnimation()
				self.Pixel200:setAlpha( 0 )
				self.clipFinished( Pixel200, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )

				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				self.clipFinished( Image2, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.StartMenuIdentitySubTitle0:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.StartMenuframenoBG0:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.TotalKills:close()
		element.RoundsSurvived:close()
		element.SPM:close()
		element.lockedIcon:close()
		element.StartMenuframenoBG00:close()
		element.PrestigeMasterTierWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
