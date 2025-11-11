require( "ui.uieditor.widgets.Competitive.Competitive_LobbyWidget_Title" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsSummaryItem" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsSummaryNoRules" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )

local PreLoadFunc = function ( self, controller )
	local playlistModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
	Engine.CreateModel( playlistModel, "name" )
	Engine.CreateModel( playlistModel, "kickerText" )
	local lobbyRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot" )
	local playlistIdModel = Engine.CreateModel( lobbyRootModel, "playlistId" )
	if Engine.GetModelValue( playlistIdModel ) == nil then
		Engine.SetModelValue( playlistIdModel, Engine.GetPlaylistID() )
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
	self:setLeftRight( 0, 0, 0, 778 )
	self:setTopBottom( 0, 0, 0, 334 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( 0, 0, 34, 246 )
	BoxButtonLrgIdle:setTopBottom( 0, 0, 52, 263 )
	BoxButtonLrgIdle:setAlpha( 0.4 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local pixelLL = LUI.UIImage.new()
	pixelLL:setLeftRight( 0, 0, 0, 42 )
	pixelLL:setTopBottom( 0.5, 0.5, 89, 95 )
	pixelLL:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL )
	self.pixelLL = pixelLL
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 0, 42 )
	Image1:setTopBottom( 0.5, 0.5, -115, -109 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local pixelMiddle = LUI.UIImage.new()
	pixelMiddle:setLeftRight( 0, 0, -6, 42 )
	pixelMiddle:setTopBottom( 0.5, 0.5, -50, 28 )
	pixelMiddle:setZoom( 10 )
	pixelMiddle:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelb" ) )
	pixelMiddle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelMiddle )
	self.pixelMiddle = pixelMiddle
	
	local FEFeaturedFrame0 = CoD.FE_FeaturedFrame.new( menu, controller )
	FEFeaturedFrame0:setLeftRight( 0, 0, 39, 243 )
	FEFeaturedFrame0:setTopBottom( 0, 0, 54, 259 )
	FEFeaturedFrame0:setAlpha( 0.5 )
	self:addElement( FEFeaturedFrame0 )
	self.FEFeaturedFrame0 = FEFeaturedFrame0
	
	local Vote = CoD.Competitive_SettingsSummaryItem.new( menu, controller )
	Vote:setLeftRight( 0, 0, 252, 666 )
	Vote:setTopBottom( 0, 0, 56, 154 )
	Vote.Title:setText( Engine.Localize( "MENU_BAN_PROTECT_ACTIVE_CAPS" ) )
	Vote.Description:setText( Engine.Localize( "MENU_BAN_PROTECT_ACTIVE_DESC" ) )
	self:addElement( Vote )
	self.Vote = Vote
	
	local GamemodeIcon = LUI.UIImage.new()
	GamemodeIcon:setLeftRight( 0, 0, 42, 240 )
	GamemodeIcon:setTopBottom( 0, 0, 57, 255 )
	GamemodeIcon:subscribeToGlobalModel( controller, "LobbyRoot", "playlistId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GamemodeIcon:setImage( RegisterImage( GetPlaylistImage( modelValue ) ) )
		end
	end )
	self:addElement( GamemodeIcon )
	self.GamemodeIcon = GamemodeIcon
	
	local Draft = CoD.Competitive_SettingsSummaryItem.new( menu, controller )
	Draft:setLeftRight( 0, 0, 252, 666 )
	Draft:setTopBottom( 0, 0, 160, 258 )
	Draft.Title:setText( Engine.Localize( "MENU_DRAFT_ACTIVE_CAPS" ) )
	Draft.Description:setText( Engine.Localize( "MENU_DRAFT_ACTIVE_DESC" ) )
	self:addElement( Draft )
	self.Draft = Draft
	
	local NoRules = CoD.Competitive_SettingsSummaryNoRules.new( menu, controller )
	NoRules:setLeftRight( 0, 0, 254, 666 )
	NoRules:setTopBottom( 0, 0, 107.5, 212.5 )
	NoRules:setAlpha( 0 )
	NoRules.Description:setText( Engine.Localize( "MENU_BAN_PROTECT_ACTIVE_DESC" ) )
	self:addElement( NoRules )
	self.NoRules = NoRules
	
	local TickTR = LUI.UIImage.new()
	TickTR:setLeftRight( 0, 0, 655, 709 )
	TickTR:setTopBottom( 0, 0, 51, 56 )
	TickTR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	TickTR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( TickTR )
	self.TickTR = TickTR
	
	local TickBR = LUI.UIImage.new()
	TickBR:setLeftRight( 0, 0, 655, 709 )
	TickBR:setTopBottom( 0, 0, 257, 262 )
	TickBR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	TickBR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( TickBR )
	self.TickBR = TickBR
	
	local LineT = LUI.UIImage.new()
	LineT:setLeftRight( 0, 0, 235, 675 )
	LineT:setTopBottom( 0, 0, 51, 57 )
	LineT:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineT )
	self.LineT = LineT
	
	local LineB = LUI.UIImage.new()
	LineB:setLeftRight( 0, 0, 235, 675 )
	LineB:setTopBottom( 0, 0, 257, 263 )
	LineB:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB )
	self.LineB = LineB
	
	local TickTL = LUI.UIImage.new()
	TickTL:setLeftRight( 0, 0, 240, 264 )
	TickTL:setTopBottom( 0, 0, 149, 167 )
	TickTL:setImage( RegisterImage( "uie_t7_menu_frontend_buttonsseparate" ) )
	TickTL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TickTL )
	self.TickTL = TickTL
	
	local CompetitiveLobbyWidgetTitle = CoD.Competitive_LobbyWidget_Title.new( menu, controller )
	CompetitiveLobbyWidgetTitle:setLeftRight( 0, 0, 41, 663 )
	CompetitiveLobbyWidgetTitle:setTopBottom( 0, 0, 2.5, 47.5 )
	CompetitiveLobbyWidgetTitle:subscribeToGlobalModel( controller, "LobbyPlaylistName", "name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CompetitiveLobbyWidgetTitle.Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CompetitiveLobbyWidgetTitle )
	self.CompetitiveLobbyWidgetTitle = CompetitiveLobbyWidgetTitle
	
	self.resetProperties = function ()
		GamemodeIcon:completeAnimation()
		Vote:completeAnimation()
		Draft:completeAnimation()
		TickTL:completeAnimation()
		LineB:completeAnimation()
		LineT:completeAnimation()
		TickBR:completeAnimation()
		TickTR:completeAnimation()
		FEFeaturedFrame0:completeAnimation()
		pixelMiddle:completeAnimation()
		Image1:completeAnimation()
		pixelLL:completeAnimation()
		BoxButtonLrgIdle:completeAnimation()
		CompetitiveLobbyWidgetTitle:completeAnimation()
		NoRules:completeAnimation()
		GamemodeIcon:setAlpha( 1 )
		Vote:setLeftRight( 0, 0, 252, 666 )
		Vote:setTopBottom( 0, 0, 56, 154 )
		Vote:setAlpha( 1 )
		Draft:setLeftRight( 0, 0, 252, 666 )
		Draft:setTopBottom( 0, 0, 160, 258 )
		Draft:setAlpha( 1 )
		TickTL:setAlpha( 1 )
		LineB:setAlpha( 1 )
		LineT:setAlpha( 1 )
		TickBR:setAlpha( 1 )
		TickTR:setAlpha( 1 )
		FEFeaturedFrame0:setAlpha( 0.5 )
		pixelMiddle:setAlpha( 1 )
		Image1:setAlpha( 1 )
		pixelLL:setAlpha( 1 )
		BoxButtonLrgIdle:setAlpha( 0.4 )
		CompetitiveLobbyWidgetTitle:setAlpha( 1 )
		NoRules:setLeftRight( 0, 0, 254, 666 )
		NoRules:setTopBottom( 0, 0, 107.5, 212.5 )
		NoRules:setAlpha( 0 )
		NoRules.Description:setText( Engine.Localize( "MENU_BAN_PROTECT_ACTIVE_DESC" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				pixelLL:completeAnimation()
				self.pixelLL:setAlpha( 0 )
				self.clipFinished( pixelLL, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )
				pixelMiddle:completeAnimation()
				self.pixelMiddle:setAlpha( 0 )
				self.clipFinished( pixelMiddle, {} )
				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0 )
				self.clipFinished( FEFeaturedFrame0, {} )
				Vote:completeAnimation()
				self.Vote:setAlpha( 0 )
				self.clipFinished( Vote, {} )
				GamemodeIcon:completeAnimation()
				self.GamemodeIcon:setAlpha( 0 )
				self.clipFinished( GamemodeIcon, {} )
				Draft:completeAnimation()
				self.Draft:setAlpha( 0 )
				self.clipFinished( Draft, {} )
				TickTR:completeAnimation()
				self.TickTR:setAlpha( 0 )
				self.clipFinished( TickTR, {} )
				TickBR:completeAnimation()
				self.TickBR:setAlpha( 0 )
				self.clipFinished( TickBR, {} )
				LineT:completeAnimation()
				self.LineT:setAlpha( 0 )
				self.clipFinished( LineT, {} )
				LineB:completeAnimation()
				self.LineB:setAlpha( 0 )
				self.clipFinished( LineB, {} )
				TickTL:completeAnimation()
				self.TickTL:setAlpha( 0 )
				self.clipFinished( TickTL, {} )
				CompetitiveLobbyWidgetTitle:completeAnimation()
				self.CompetitiveLobbyWidgetTitle:setAlpha( 0 )
				self.clipFinished( CompetitiveLobbyWidgetTitle, {} )
			end,
			FadeIn = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			HideForGameStart = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		VoteAndDraftActive = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Vote:completeAnimation()
				self.Vote:setLeftRight( 0, 0, 252, 666 )
				self.Vote:setTopBottom( 0, 0, 55, 153 )
				self.clipFinished( Vote, {} )
			end
		},
		VoteActive = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Vote:completeAnimation()
				self.Vote:setLeftRight( 0, 0, 252, 666 )
				self.Vote:setTopBottom( 0, 0, 55, 255 )
				self.clipFinished( Vote, {} )
				Draft:completeAnimation()
				self.Draft:setAlpha( 0 )
				self.clipFinished( Draft, {} )
				TickTL:completeAnimation()
				self.TickTL:setAlpha( 0 )
				self.clipFinished( TickTL, {} )
			end
		},
		DraftActive = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Vote:completeAnimation()
				self.Vote:setAlpha( 0 )
				self.clipFinished( Vote, {} )
				Draft:completeAnimation()
				self.Draft:setLeftRight( 0, 0, 252, 666 )
				self.Draft:setTopBottom( 0, 0, 55, 255 )
				self.clipFinished( Draft, {} )
				TickTL:completeAnimation()
				self.TickTL:setAlpha( 0 )
				self.clipFinished( TickTL, {} )
			end
		},
		NoRulesActive = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Vote:completeAnimation()
				self.Vote:setAlpha( 0 )
				self.clipFinished( Vote, {} )
				Draft:completeAnimation()
				self.Draft:setLeftRight( 0, 0, 195, 609 )
				self.Draft:setTopBottom( 0, 0, 115, 253 )
				self.Draft:setAlpha( 0 )
				self.clipFinished( Draft, {} )
				NoRules:completeAnimation()
				NoRules.Description:completeAnimation()
				self.NoRules:setLeftRight( 0, 0, 254, 666 )
				self.NoRules:setTopBottom( 0, 0, 55, 255 )
				self.NoRules:setAlpha( 1 )
				self.NoRules.Description:setText( Engine.Localize( "MENU_NO_RULES_ACTIVE" ) )
				self.clipFinished( NoRules, {} )
				TickTL:completeAnimation()
				self.TickTL:setAlpha( 0 )
				self.clipFinished( TickTL, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "VoteAndDraftActive",
			condition = function ( menu, element, event )
				local f13_local0 = ShouldShowCompetitiveSettingsSummary()
				if f13_local0 then
					f13_local0 = CharacterDraftEnabled()
					if f13_local0 then
						f13_local0 = PregameItemVoteEnabled()
					end
				end
				return f13_local0
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEFeaturedFrame0:close()
		self.Vote:close()
		self.Draft:close()
		self.NoRules:close()
		self.CompetitiveLobbyWidgetTitle:close()
		self.GamemodeIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

