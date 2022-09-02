-- 626c85894de5bb482fcbc900072a98b9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsSummaryItem" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsSummaryNoRules" )
require( "ui.uieditor.widgets.Competitive.Competitive_LobbyWidget_Title" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
	Engine.CreateModel( f1_local0, "name" )
	Engine.CreateModel( f1_local0, "kickerText" )
	local f1_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot" ), "playlistId" )
	if Engine.GetModelValue( f1_local1 ) == nil then
		Engine.SetModelValue( f1_local1, Engine.GetPlaylistID() )
	end
end

CoD.Competitive_SettingsSummary = InheritFrom( LUI.UIElement )
CoD.Competitive_SettingsSummary.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Competitive_SettingsSummary )
	self.id = "Competitive_SettingsSummary"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 519 )
	self:setTopBottom( true, false, 0, 223 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( true, false, 23, 164 )
	BoxButtonLrgIdle:setTopBottom( true, false, 34.5, 175 )
	BoxButtonLrgIdle:setAlpha( 0.4 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local pixelLL = LUI.UIImage.new()
	pixelLL:setLeftRight( true, false, 0, 28 )
	pixelLL:setTopBottom( false, false, 59, 63 )
	pixelLL:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL )
	self.pixelLL = pixelLL
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 28 )
	Image1:setTopBottom( false, false, -77, -73 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local pixelMiddle = LUI.UIImage.new()
	pixelMiddle:setLeftRight( true, false, -4, 28 )
	pixelMiddle:setTopBottom( false, false, -33.04, 18.96 )
	pixelMiddle:setZoom( 10 )
	pixelMiddle:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelb" ) )
	pixelMiddle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelMiddle )
	self.pixelMiddle = pixelMiddle
	
	local FEFeaturedFrame0 = CoD.FE_FeaturedFrame.new( menu, controller )
	FEFeaturedFrame0:setLeftRight( true, false, 26, 162 )
	FEFeaturedFrame0:setTopBottom( true, false, 36, 172.92 )
	FEFeaturedFrame0:setAlpha( 0.5 )
	self:addElement( FEFeaturedFrame0 )
	self.FEFeaturedFrame0 = FEFeaturedFrame0
	
	local Vote = CoD.Competitive_SettingsSummaryItem.new( menu, controller )
	Vote:setLeftRight( true, false, 168, 444 )
	Vote:setTopBottom( true, false, 37.5, 102.5 )
	Vote.Title:setText( Engine.Localize( "MENU_BAN_PROTECT_ACTIVE_CAPS" ) )
	Vote.Description:setText( Engine.Localize( "MENU_BAN_PROTECT_ACTIVE_DESC" ) )
	self:addElement( Vote )
	self.Vote = Vote
	
	local GamemodeIcon = LUI.UIImage.new()
	GamemodeIcon:setLeftRight( true, false, 28, 160 )
	GamemodeIcon:setTopBottom( true, false, 38, 170 )
	GamemodeIcon:subscribeToGlobalModel( controller, "LobbyRoot", "playlistId", function ( model )
		local playlistId = Engine.GetModelValue( model )
		if playlistId then
			GamemodeIcon:setImage( RegisterImage( GetPlaylistImage( playlistId ) ) )
		end
	end )
	self:addElement( GamemodeIcon )
	self.GamemodeIcon = GamemodeIcon
	
	local Draft = CoD.Competitive_SettingsSummaryItem.new( menu, controller )
	Draft:setLeftRight( true, false, 168, 444 )
	Draft:setTopBottom( true, false, 106.92, 171.92 )
	Draft.Title:setText( Engine.Localize( "MENU_DRAFT_ACTIVE_CAPS" ) )
	Draft.Description:setText( Engine.Localize( "MENU_DRAFT_ACTIVE_DESC" ) )
	self:addElement( Draft )
	self.Draft = Draft
	
	local NoRules = CoD.Competitive_SettingsSummaryNoRules.new( menu, controller )
	NoRules:setLeftRight( true, false, 169, 444 )
	NoRules:setTopBottom( true, false, 71.92, 141.92 )
	NoRules:setAlpha( 0 )
	NoRules.Description:setText( Engine.Localize( "MENU_BAN_PROTECT_ACTIVE_DESC" ) )
	self:addElement( NoRules )
	self.NoRules = NoRules
	
	local TickTR = LUI.UIImage.new()
	TickTR:setLeftRight( true, false, 437, 473 )
	TickTR:setTopBottom( true, false, 34, 37.5 )
	TickTR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	TickTR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( TickTR )
	self.TickTR = TickTR
	
	local TickBR = LUI.UIImage.new()
	TickBR:setLeftRight( true, false, 437, 473 )
	TickBR:setTopBottom( true, false, 171, 174.5 )
	TickBR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	TickBR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( TickBR )
	self.TickBR = TickBR
	
	local LineT = LUI.UIImage.new()
	LineT:setLeftRight( true, false, 157, 450 )
	LineT:setTopBottom( true, false, 34, 38 )
	LineT:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineT )
	self.LineT = LineT
	
	local LineB = LUI.UIImage.new()
	LineB:setLeftRight( true, false, 157, 450 )
	LineB:setTopBottom( true, false, 171, 175 )
	LineB:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB )
	self.LineB = LineB
	
	local TickTL = LUI.UIImage.new()
	TickTL:setLeftRight( true, false, 160, 176 )
	TickTL:setTopBottom( true, false, 99, 111 )
	TickTL:setImage( RegisterImage( "uie_t7_menu_frontend_buttonsseparate" ) )
	TickTL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TickTL )
	self.TickTL = TickTL
	
	local CompetitiveLobbyWidgetTitle = CoD.Competitive_LobbyWidget_Title.new( menu, controller )
	CompetitiveLobbyWidgetTitle:setLeftRight( true, false, 27, 442 )
	CompetitiveLobbyWidgetTitle:setTopBottom( true, false, 1.5, 31.5 )
	CompetitiveLobbyWidgetTitle:subscribeToGlobalModel( controller, "LobbyPlaylistName", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			CompetitiveLobbyWidgetTitle.Title:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( CompetitiveLobbyWidgetTitle )
	self.CompetitiveLobbyWidgetTitle = CompetitiveLobbyWidgetTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setLeftRight( true, false, 23, 164 )
				self.BoxButtonLrgIdle:setTopBottom( true, false, 34.5, 175 )
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				pixelLL:completeAnimation()
				self.pixelLL:setLeftRight( true, false, 0, 28 )
				self.pixelLL:setTopBottom( false, false, 59, 63 )
				self.pixelLL:setAlpha( 0 )
				self.clipFinished( pixelLL, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )

				pixelMiddle:completeAnimation()
				self.pixelMiddle:setLeftRight( true, false, -4, 28 )
				self.pixelMiddle:setTopBottom( false, false, -33.04, 18.96 )
				self.pixelMiddle:setAlpha( 0 )
				self.clipFinished( pixelMiddle, {} )

				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setLeftRight( true, false, 26, 162 )
				self.FEFeaturedFrame0:setTopBottom( true, false, 36, 172.92 )
				self.FEFeaturedFrame0:setAlpha( 0 )
				self.clipFinished( FEFeaturedFrame0, {} )

				Vote:completeAnimation()
				self.Vote:setLeftRight( true, false, 168, 444 )
				self.Vote:setTopBottom( true, false, 37.5, 102.5 )
				self.Vote:setAlpha( 0 )
				self.clipFinished( Vote, {} )

				GamemodeIcon:completeAnimation()
				self.GamemodeIcon:setLeftRight( true, false, 28, 160 )
				self.GamemodeIcon:setTopBottom( true, false, 38, 170 )
				self.GamemodeIcon:setAlpha( 0 )
				self.clipFinished( GamemodeIcon, {} )

				Draft:completeAnimation()
				self.Draft:setLeftRight( true, false, 168, 444 )
				self.Draft:setTopBottom( true, false, 106.92, 171.92 )
				self.Draft:setAlpha( 0 )
				self.clipFinished( Draft, {} )

				NoRules:completeAnimation()
				self.NoRules:setAlpha( 0 )
				self.clipFinished( NoRules, {} )

				TickTR:completeAnimation()
				self.TickTR:setLeftRight( true, false, 437, 473 )
				self.TickTR:setTopBottom( true, false, 34, 37.5 )
				self.TickTR:setAlpha( 0 )
				self.clipFinished( TickTR, {} )

				TickBR:completeAnimation()
				self.TickBR:setLeftRight( true, false, 437, 473 )
				self.TickBR:setTopBottom( true, false, 171, 174.5 )
				self.TickBR:setAlpha( 0 )
				self.clipFinished( TickBR, {} )

				LineT:completeAnimation()
				self.LineT:setLeftRight( true, false, 157, 450 )
				self.LineT:setTopBottom( true, false, 34, 38 )
				self.LineT:setAlpha( 0 )
				self.clipFinished( LineT, {} )

				LineB:completeAnimation()
				self.LineB:setLeftRight( true, false, 157, 450 )
				self.LineB:setTopBottom( true, false, 171, 175 )
				self.LineB:setAlpha( 0 )
				self.clipFinished( LineB, {} )

				TickTL:completeAnimation()
				self.TickTL:setLeftRight( true, false, 160, 176 )
				self.TickTL:setTopBottom( true, false, 99, 111 )
				self.TickTL:setAlpha( 0 )
				self.clipFinished( TickTL, {} )

				CompetitiveLobbyWidgetTitle:completeAnimation()
				self.CompetitiveLobbyWidgetTitle:setAlpha( 0 )
				self.clipFinished( CompetitiveLobbyWidgetTitle, {} )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 0 )

			end,
			HideForGameStart = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		VoteAndDraftActive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setLeftRight( true, false, 23, 164 )
				self.BoxButtonLrgIdle:setTopBottom( true, false, 34.5, 175 )
				self.BoxButtonLrgIdle:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				pixelLL:completeAnimation()
				self.pixelLL:setLeftRight( true, false, 0, 28 )
				self.pixelLL:setTopBottom( false, false, 59, 63 )
				self.pixelLL:setAlpha( 1 )
				self.clipFinished( pixelLL, {} )

				Image1:completeAnimation()
				self.Image1:setLeftRight( true, false, 0, 28 )
				self.Image1:setTopBottom( false, false, -77, -73 )
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )

				pixelMiddle:completeAnimation()
				self.pixelMiddle:setLeftRight( true, false, -4, 28 )
				self.pixelMiddle:setTopBottom( false, false, -33.04, 18.96 )
				self.pixelMiddle:setAlpha( 1 )
				self.clipFinished( pixelMiddle, {} )

				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setLeftRight( true, false, 26, 162 )
				self.FEFeaturedFrame0:setTopBottom( true, false, 36, 172.92 )
				self.FEFeaturedFrame0:setAlpha( 0.5 )
				self.clipFinished( FEFeaturedFrame0, {} )

				Vote:completeAnimation()
				self.Vote:setLeftRight( true, false, 168, 444 )
				self.Vote:setTopBottom( true, false, 37, 102 )
				self.Vote:setAlpha( 1 )
				self.clipFinished( Vote, {} )

				GamemodeIcon:completeAnimation()
				self.GamemodeIcon:setLeftRight( true, false, 28, 160 )
				self.GamemodeIcon:setTopBottom( true, false, 38, 170 )
				self.GamemodeIcon:setAlpha( 1 )
				self.clipFinished( GamemodeIcon, {} )

				Draft:completeAnimation()
				self.Draft:setLeftRight( true, false, 168, 444 )
				self.Draft:setTopBottom( true, false, 106.92, 171.92 )
				self.Draft:setAlpha( 1 )
				self.clipFinished( Draft, {} )

				NoRules:completeAnimation()
				self.NoRules:setAlpha( 0 )
				self.clipFinished( NoRules, {} )

				TickTR:completeAnimation()
				self.TickTR:setLeftRight( true, false, 437, 473 )
				self.TickTR:setTopBottom( true, false, 34, 37.5 )
				self.TickTR:setAlpha( 1 )
				self.clipFinished( TickTR, {} )

				TickBR:completeAnimation()
				self.TickBR:setLeftRight( true, false, 437, 473 )
				self.TickBR:setTopBottom( true, false, 171, 174.5 )
				self.TickBR:setAlpha( 1 )
				self.clipFinished( TickBR, {} )

				LineT:completeAnimation()
				self.LineT:setLeftRight( true, false, 157, 450 )
				self.LineT:setTopBottom( true, false, 34, 38 )
				self.LineT:setAlpha( 1 )
				self.clipFinished( LineT, {} )

				LineB:completeAnimation()
				self.LineB:setLeftRight( true, false, 157, 450 )
				self.LineB:setTopBottom( true, false, 171, 175 )
				self.LineB:setAlpha( 1 )
				self.clipFinished( LineB, {} )

				TickTL:completeAnimation()
				self.TickTL:setLeftRight( true, false, 160, 176 )
				self.TickTL:setTopBottom( true, false, 99, 111 )
				self.TickTL:setAlpha( 1 )
				self.clipFinished( TickTL, {} )

				CompetitiveLobbyWidgetTitle:completeAnimation()
				self.CompetitiveLobbyWidgetTitle:setLeftRight( true, false, 27, 442 )
				self.CompetitiveLobbyWidgetTitle:setTopBottom( true, false, 1.5, 31.5 )
				self.CompetitiveLobbyWidgetTitle:setAlpha( 1 )
				self.clipFinished( CompetitiveLobbyWidgetTitle, {} )
			end
		},
		VoteActive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				pixelLL:completeAnimation()
				self.pixelLL:setAlpha( 1 )
				self.clipFinished( pixelLL, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )

				pixelMiddle:completeAnimation()
				self.pixelMiddle:setAlpha( 1 )
				self.clipFinished( pixelMiddle, {} )

				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0.5 )
				self.clipFinished( FEFeaturedFrame0, {} )

				Vote:completeAnimation()
				self.Vote:setLeftRight( true, false, 168, 444 )
				self.Vote:setTopBottom( true, false, 37, 170 )
				self.Vote:setAlpha( 1 )
				self.clipFinished( Vote, {} )

				GamemodeIcon:completeAnimation()
				self.GamemodeIcon:setAlpha( 1 )
				self.clipFinished( GamemodeIcon, {} )

				Draft:completeAnimation()
				self.Draft:setAlpha( 0 )
				self.clipFinished( Draft, {} )

				NoRules:completeAnimation()
				self.NoRules:setAlpha( 0 )
				self.clipFinished( NoRules, {} )

				TickTR:completeAnimation()
				self.TickTR:setAlpha( 1 )
				self.clipFinished( TickTR, {} )

				TickBR:completeAnimation()
				self.TickBR:setAlpha( 1 )
				self.clipFinished( TickBR, {} )

				LineT:completeAnimation()
				self.LineT:setAlpha( 1 )
				self.clipFinished( LineT, {} )

				LineB:completeAnimation()
				self.LineB:setAlpha( 1 )
				self.clipFinished( LineB, {} )

				TickTL:completeAnimation()
				self.TickTL:setAlpha( 0 )
				self.clipFinished( TickTL, {} )

				CompetitiveLobbyWidgetTitle:completeAnimation()
				self.CompetitiveLobbyWidgetTitle:setLeftRight( true, false, 27, 442 )
				self.CompetitiveLobbyWidgetTitle:setTopBottom( true, false, 1.5, 31.5 )
				self.CompetitiveLobbyWidgetTitle:setAlpha( 1 )
				self.clipFinished( CompetitiveLobbyWidgetTitle, {} )
			end
		},
		DraftActive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				pixelLL:completeAnimation()
				self.pixelLL:setAlpha( 1 )
				self.clipFinished( pixelLL, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )

				pixelMiddle:completeAnimation()
				self.pixelMiddle:setAlpha( 1 )
				self.clipFinished( pixelMiddle, {} )

				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0.5 )
				self.clipFinished( FEFeaturedFrame0, {} )

				Vote:completeAnimation()
				self.Vote:setAlpha( 0 )
				self.clipFinished( Vote, {} )

				GamemodeIcon:completeAnimation()
				self.GamemodeIcon:setAlpha( 1 )
				self.clipFinished( GamemodeIcon, {} )

				Draft:completeAnimation()
				self.Draft:setLeftRight( true, false, 168, 444 )
				self.Draft:setTopBottom( true, false, 37, 170 )
				self.Draft:setAlpha( 1 )
				self.clipFinished( Draft, {} )

				NoRules:completeAnimation()
				self.NoRules:setAlpha( 0 )
				self.clipFinished( NoRules, {} )

				TickTR:completeAnimation()
				self.TickTR:setAlpha( 1 )
				self.clipFinished( TickTR, {} )

				TickBR:completeAnimation()
				self.TickBR:setAlpha( 1 )
				self.clipFinished( TickBR, {} )

				LineT:completeAnimation()
				self.LineT:setAlpha( 1 )
				self.clipFinished( LineT, {} )

				LineB:completeAnimation()
				self.LineB:setAlpha( 1 )
				self.clipFinished( LineB, {} )

				TickTL:completeAnimation()
				self.TickTL:setAlpha( 0 )
				self.clipFinished( TickTL, {} )

				CompetitiveLobbyWidgetTitle:completeAnimation()
				self.CompetitiveLobbyWidgetTitle:setLeftRight( true, false, 27, 442 )
				self.CompetitiveLobbyWidgetTitle:setTopBottom( true, false, 1.5, 31.5 )
				self.CompetitiveLobbyWidgetTitle:setAlpha( 1 )
				self.clipFinished( CompetitiveLobbyWidgetTitle, {} )
			end
		},
		NoRulesActive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				pixelLL:completeAnimation()
				self.pixelLL:setAlpha( 1 )
				self.clipFinished( pixelLL, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )

				pixelMiddle:completeAnimation()
				self.pixelMiddle:setAlpha( 1 )
				self.clipFinished( pixelMiddle, {} )

				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0.5 )
				self.clipFinished( FEFeaturedFrame0, {} )

				Vote:completeAnimation()
				self.Vote:setAlpha( 0 )
				self.clipFinished( Vote, {} )

				GamemodeIcon:completeAnimation()
				self.GamemodeIcon:setAlpha( 1 )
				self.clipFinished( GamemodeIcon, {} )

				Draft:completeAnimation()
				self.Draft:setLeftRight( true, false, 130, 406 )
				self.Draft:setTopBottom( true, false, 77, 169 )
				self.Draft:setAlpha( 0 )
				self.clipFinished( Draft, {} )

				NoRules:completeAnimation()

				NoRules.Description:completeAnimation()
				self.NoRules:setLeftRight( true, false, 169, 444 )
				self.NoRules:setTopBottom( true, false, 37, 170 )
				self.NoRules:setAlpha( 1 )
				self.NoRules.Description:setText( Engine.Localize( "MENU_NO_RULES_ACTIVE" ) )
				self.clipFinished( NoRules, {} )

				TickTR:completeAnimation()
				self.TickTR:setAlpha( 1 )
				self.clipFinished( TickTR, {} )

				TickBR:completeAnimation()
				self.TickBR:setAlpha( 1 )
				self.clipFinished( TickBR, {} )

				LineT:completeAnimation()
				self.LineT:setAlpha( 1 )
				self.clipFinished( LineT, {} )

				LineB:completeAnimation()
				self.LineB:setAlpha( 1 )
				self.clipFinished( LineB, {} )

				TickTL:completeAnimation()
				self.TickTL:setAlpha( 0 )
				self.clipFinished( TickTL, {} )

				CompetitiveLobbyWidgetTitle:completeAnimation()
				self.CompetitiveLobbyWidgetTitle:setLeftRight( true, false, 27, 442 )
				self.CompetitiveLobbyWidgetTitle:setTopBottom( true, false, 1.5, 31.5 )
				self.CompetitiveLobbyWidgetTitle:setAlpha( 1 )
				self.clipFinished( CompetitiveLobbyWidgetTitle, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "VoteAndDraftActive",
			condition = function ( menu, element, event )
				local f12_local0 = ShouldShowCompetitiveSettingsSummary()
				if f12_local0 then
					f12_local0 = CharacterDraftEnabled()
					if f12_local0 then
						f12_local0 = PregameItemVoteEnabled()
					end
				end
				return f12_local0
			end
		},
		{
			stateName = "VoteActive",
			condition = function ( menu, element, event )
				return ShouldShowCompetitiveSettingsSummary() and PregameItemVoteEnabled()
			end
		},
		{
			stateName = "DraftActive",
			condition = function ( menu, element, event )
				return ShouldShowCompetitiveSettingsSummary() and CharacterDraftEnabled()
			end
		},
		{
			stateName = "NoRulesActive",
			condition = function ( menu, element, event )
				return ShouldShowCompetitiveSettingsSummary()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GametypeSettings.Update"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEFeaturedFrame0:close()
		element.Vote:close()
		element.Draft:close()
		element.NoRules:close()
		element.CompetitiveLobbyWidgetTitle:close()
		element.GamemodeIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

