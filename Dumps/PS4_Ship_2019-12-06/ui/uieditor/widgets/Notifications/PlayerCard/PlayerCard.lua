require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )
require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard_Label" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.PlayerCard = InheritFrom( LUI.UIElement )
CoD.PlayerCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PlayerCard )
	self.id = "PlayerCard"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 308 )
	self:setTopBottom( true, false, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local CallingCardsFrameWidget = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardsFrameWidget:setLeftRight( true, false, 92, 304 )
	CallingCardsFrameWidget:setTopBottom( true, false, 2, 57 )
	CallingCardsFrameWidget.CardIconFrame:setScale( 0.44 )
	CallingCardsFrameWidget:linkToElementModel( self, nil, false, function ( model )
		CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( CallingCardsFrameWidget )
	self.CallingCardsFrameWidget = CallingCardsFrameWidget
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, 0, 91 )
	LeftPanel:setTopBottom( true, false, 2, 57 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Top3PlayerScoreBlurBox0 = CoD.Top3PlayerScoreBlurBox.new( menu, controller )
	Top3PlayerScoreBlurBox0:setLeftRight( true, false, 0, 91 )
	Top3PlayerScoreBlurBox0:setTopBottom( true, false, 2, 57 )
	Top3PlayerScoreBlurBox0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	Top3PlayerScoreBlurBox0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Top3PlayerScoreBlurBox0 )
	self.Top3PlayerScoreBlurBox0 = Top3PlayerScoreBlurBox0
	
	local VSpanel = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel:setLeftRight( true, false, 0, 91 )
	VSpanel:setTopBottom( true, false, 2, 57 )
	VSpanel:setRGB( 0, 0, 0 )
	VSpanel:setAlpha( 0.5 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( true, false, 92.41, 136.41 )
	Panel:setTopBottom( true, false, 27, 47 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.6 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local GamerTag = CoD.PlayerCard_Label.new( menu, controller )
	GamerTag:setLeftRight( true, false, 92.41, 300.41 )
	GamerTag:setTopBottom( true, false, 5, 25 )
	GamerTag.Panel:setAlpha( 0.6 )
	GamerTag:linkToElementModel( self, "playerName", true, function ( model )
		local playerName = Engine.GetModelValue( model )
		if playerName then
			GamerTag:setAlpha( HideIfEmptyString( playerName ) )
		end
	end )
	GamerTag:linkToElementModel( self, nil, false, function ( model )
		GamerTag:setModel( model, controller )
	end )
	GamerTag:linkToElementModel( self, "playerName", true, function ( model )
		local playerName = Engine.GetModelValue( model )
		if playerName then
			GamerTag.itemName:setText( playerName )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( GamerTag, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 1 )
	end )
	GamerTag:mergeStateConditions( {
		{
			stateName = "PlayerYellow",
			condition = function ( menu, element, event )
				return IsSelfModelValueMyXuidOrAnyLocalPlayerOnGameOver( element, controller, "xuid" )
			end
		}
	} )
	GamerTag:linkToElementModel( GamerTag, "xuid", true, function ( model )
		menu:updateElementState( GamerTag, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "xuid"
		} )
	end )
	GamerTag:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( GamerTag, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:addElement( GamerTag )
	self.GamerTag = GamerTag
	
	local ClanTag = CoD.PlayerCard_Label.new( menu, controller )
	ClanTag:setLeftRight( true, false, 92.41, 139.41 )
	ClanTag:setTopBottom( true, false, 26, 46 )
	ClanTag.Panel:setAlpha( 0.6 )
	ClanTag:linkToElementModel( self, "clanTag", true, function ( model )
		local clanTag = Engine.GetModelValue( model )
		if clanTag then
			ClanTag:setAlpha( HideIfEmptyString( clanTag ) )
		end
	end )
	ClanTag:linkToElementModel( self, "clanTag", true, function ( model )
		local clanTag = Engine.GetModelValue( model )
		if clanTag then
			ClanTag.itemName:setText( StringAsClanTag( clanTag ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( ClanTag, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 1 )
	end )
	self:addElement( ClanTag )
	self.ClanTag = ClanTag
	
	local HeroBacking = LUI.UIImage.new()
	HeroBacking:setLeftRight( true, false, -2, 62 )
	HeroBacking:setTopBottom( true, false, -8, 64 )
	HeroBacking:setAlpha( 0 )
	HeroBacking:setImage( RegisterImage( "uie_img_t7_hud_widget_playercard_playerbacking" ) )
	HeroBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( HeroBacking )
	self.HeroBacking = HeroBacking
	
	local TeamColor = LUI.UIImage.new()
	TeamColor:setLeftRight( true, false, 31, 95 )
	TeamColor:setTopBottom( true, false, 2, 49 )
	TeamColor:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	TeamColor:setAlpha( 0 )
	TeamColor:setImage( RegisterImage( "uie_img_t7_hud_widget_playercard_playerbackingelements" ) )
	TeamColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( TeamColor )
	self.TeamColor = TeamColor
	
	local HeroLobbyClientExtraCamRender = LUI.UIImage.new()
	HeroLobbyClientExtraCamRender:setLeftRight( true, false, 1, 59 )
	HeroLobbyClientExtraCamRender:setTopBottom( true, false, -9, 49 )
	HeroLobbyClientExtraCamRender:setAlpha( 0 )
	HeroLobbyClientExtraCamRender:linkToElementModel( self, "xuid", true, function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			HeroLobbyClientExtraCamRender:setupCharacterExtraCamRenderForLobbyClient( xuid )
		end
	end )
	self:addElement( HeroLobbyClientExtraCamRender )
	self.HeroLobbyClientExtraCamRender = HeroLobbyClientExtraCamRender
	
	local RankIcon = LUI.UIImage.new()
	RankIcon:setLeftRight( true, false, 115.66, 131.66 )
	RankIcon:setTopBottom( true, false, 29, 45 )
	RankIcon:setAlpha( 0 )
	RankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local rankIcon = Engine.GetModelValue( model )
		if rankIcon then
			RankIcon:setImage( RegisterImage( rankIcon ) )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( true, false, 94.41, 114.41 )
	Rank:setTopBottom( true, false, 26, 46 )
	Rank:setAlpha( 0 )
	Rank:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Rank:setLetterSpacing( 0.5 )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:linkToElementModel( self, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			Rank:setText( Engine.Localize( rank ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local CalloutHeading = LUI.UIText.new()
	CalloutHeading:setLeftRight( true, false, 94.41, 322 )
	CalloutHeading:setTopBottom( true, false, -16, 2 )
	CalloutHeading:setTTF( "fonts/escom.ttf" )
	CalloutHeading:setLetterSpacing( 0.5 )
	CalloutHeading:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CalloutHeading:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CalloutHeading:linkToElementModel( self, "heading", true, function ( model )
		local heading = Engine.GetModelValue( model )
		if heading then
			CalloutHeading:setText( Engine.Localize( heading ) )
		end
	end )
	self:addElement( CalloutHeading )
	self.CalloutHeading = CalloutHeading
	
	local PlayerEmblem = LUI.UIImage.new()
	PlayerEmblem:setLeftRight( true, false, 0, 91 )
	PlayerEmblem:setTopBottom( true, false, 2, 57 )
	PlayerEmblem:linkToElementModel( self, "xuid", true, function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			PlayerEmblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( PlayerEmblem )
	self.PlayerEmblem = PlayerEmblem
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, false, -2.59, 93.41 )
	StartMenuframenoBG0:setTopBottom( true, false, 0, 59 )
	StartMenuframenoBG0:setAlpha( 0.6 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG1 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG1:setLeftRight( true, false, 88.41, 306.41 )
	StartMenuframenoBG1:setTopBottom( true, false, 0, 59 )
	StartMenuframenoBG1:setAlpha( 0.6 )
	self:addElement( StartMenuframenoBG1 )
	self.StartMenuframenoBG1 = StartMenuframenoBG1
	
	local Image00001 = LUI.UIImage.new()
	Image00001:setLeftRight( true, false, -19, -3 )
	Image00001:setTopBottom( true, false, -3, 5 )
	Image00001:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00001 )
	self.Image00001 = Image00001
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, -19, -3 )
	Image2:setTopBottom( true, false, 53, 61 )
	Image2:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image000010 = LUI.UIImage.new()
	Image000010:setLeftRight( true, false, 306, 322 )
	Image000010:setTopBottom( true, false, -2, 6 )
	Image000010:setZRot( 180 )
	Image000010:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image000010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000010 )
	self.Image000010 = Image000010
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( true, false, 306, 322 )
	Image20:setTopBottom( true, false, 53, 61 )
	Image20:setZRot( 180 )
	Image20:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setLeftRight( true, false, 92, 304 )
				self.CallingCardsFrameWidget:setTopBottom( true, false, 2, 57 )
				self.clipFinished( CallingCardsFrameWidget, {} )
				HeroBacking:completeAnimation()
				self.HeroBacking:setAlpha( 0 )
				self.clipFinished( HeroBacking, {} )
				HeroLobbyClientExtraCamRender:completeAnimation()
				self.HeroLobbyClientExtraCamRender:setAlpha( 0 )
				self.clipFinished( HeroLobbyClientExtraCamRender, {} )
				CalloutHeading:completeAnimation()
				self.CalloutHeading:setLeftRight( true, false, 93.41, 365 )
				self.CalloutHeading:setTopBottom( true, false, -16, 2 )
				self.clipFinished( CalloutHeading, {} )
				PlayerEmblem:completeAnimation()
				self.PlayerEmblem:setAlpha( 1 )
				self.clipFinished( PlayerEmblem, {} )
				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setLeftRight( true, false, 89.41, 305.41 )
				self.StartMenuframenoBG1:setTopBottom( true, false, 0, 59 )
				self.clipFinished( StartMenuframenoBG1, {} )
				Image000010:completeAnimation()
				self.Image000010:setLeftRight( true, false, 306, 322 )
				self.Image000010:setTopBottom( true, false, -2, 6 )
				self.clipFinished( Image000010, {} )
				Image20:completeAnimation()
				self.Image20:setLeftRight( true, false, 306, 322 )
				self.Image20:setTopBottom( true, false, 53, 61 )
				self.clipFinished( Image20, {} )
			end,
			Side = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Emblem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setLeftRight( true, false, 92, 304 )
				self.CallingCardsFrameWidget:setTopBottom( true, false, 2, 57 )
				self.clipFinished( CallingCardsFrameWidget, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 0, 91 )
				self.LeftPanel:setTopBottom( true, false, 2.5, 56.5 )
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				Top3PlayerScoreBlurBox0:completeAnimation()
				self.Top3PlayerScoreBlurBox0:setAlpha( 1 )
				self.clipFinished( Top3PlayerScoreBlurBox0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0.5 )
				self.clipFinished( VSpanel, {} )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				HeroBacking:completeAnimation()
				self.HeroBacking:setAlpha( 0 )
				self.clipFinished( HeroBacking, {} )
				TeamColor:completeAnimation()
				self.TeamColor:setAlpha( 0 )
				self.clipFinished( TeamColor, {} )
				HeroLobbyClientExtraCamRender:completeAnimation()
				self.HeroLobbyClientExtraCamRender:setLeftRight( true, false, 8, 66 )
				self.HeroLobbyClientExtraCamRender:setTopBottom( true, false, -9, 49 )
				self.HeroLobbyClientExtraCamRender:setAlpha( 0 )
				self.clipFinished( HeroLobbyClientExtraCamRender, {} )
				RankIcon:completeAnimation()
				self.RankIcon:setAlpha( 0 )
				self.clipFinished( RankIcon, {} )
				PlayerEmblem:completeAnimation()
				self.PlayerEmblem:setAlpha( 1 )
				self.clipFinished( PlayerEmblem, {} )
				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setLeftRight( true, false, 89.41, 306 )
				self.StartMenuframenoBG1:setTopBottom( true, false, 0, 59 )
				self.clipFinished( StartMenuframenoBG1, {} )
				Image000010:completeAnimation()
				self.Image000010:setLeftRight( true, false, 306, 322 )
				self.Image000010:setTopBottom( true, false, -2, 6 )
				self.clipFinished( Image000010, {} )
				Image20:completeAnimation()
				self.Image20:setLeftRight( true, false, 306, 322 )
				self.Image20:setTopBottom( true, false, 53, 61 )
				self.clipFinished( Image20, {} )
			end
		},
		Calingcard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setLeftRight( true, false, 1.59, 213.59 )
				self.CallingCardsFrameWidget:setTopBottom( true, false, 2, 57 )
				self.clipFinished( CallingCardsFrameWidget, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				self.clipFinished( LeftPanel, {} )
				Top3PlayerScoreBlurBox0:completeAnimation()
				self.Top3PlayerScoreBlurBox0:setAlpha( 0 )
				self.clipFinished( Top3PlayerScoreBlurBox0, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0 )
				self.clipFinished( VSpanel, {} )
				Panel:completeAnimation()
				self.Panel:setLeftRight( true, false, 91, 135 )
				self.Panel:setTopBottom( true, false, 27, 47 )
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				GamerTag:completeAnimation()
				self.GamerTag:setLeftRight( true, false, 2, 205 )
				self.GamerTag:setTopBottom( true, false, 5, 25 )
				self.clipFinished( GamerTag, {} )
				ClanTag:completeAnimation()
				self.ClanTag:setLeftRight( true, false, 2, 49 )
				self.ClanTag:setTopBottom( true, false, 26, 46 )
				self.clipFinished( ClanTag, {} )
				HeroBacking:completeAnimation()
				self.HeroBacking:setLeftRight( true, false, -3.41, 60.59 )
				self.HeroBacking:setTopBottom( true, false, -8, 64 )
				self.HeroBacking:setAlpha( 0 )
				self.clipFinished( HeroBacking, {} )
				TeamColor:completeAnimation()
				self.TeamColor:setLeftRight( true, false, 29.59, 93.59 )
				self.TeamColor:setTopBottom( true, false, 2, 49 )
				self.TeamColor:setAlpha( 0 )
				self.clipFinished( TeamColor, {} )
				HeroLobbyClientExtraCamRender:completeAnimation()
				self.HeroLobbyClientExtraCamRender:setLeftRight( true, false, -0.41, 57.59 )
				self.HeroLobbyClientExtraCamRender:setTopBottom( true, false, -9, 49 )
				self.HeroLobbyClientExtraCamRender:setAlpha( 0 )
				self.clipFinished( HeroLobbyClientExtraCamRender, {} )
				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( true, false, 114.25, 130.25 )
				self.RankIcon:setTopBottom( true, false, 29, 45 )
				self.RankIcon:setAlpha( 0 )
				self.clipFinished( RankIcon, {} )
				Rank:completeAnimation()
				self.Rank:setLeftRight( true, false, 5, 25 )
				self.Rank:setTopBottom( true, false, 26, 46 )
				self.Rank:setAlpha( 0 )
				self.clipFinished( Rank, {} )
				CalloutHeading:completeAnimation()
				self.CalloutHeading:setLeftRight( true, false, 2, 213.59 )
				self.CalloutHeading:setTopBottom( true, false, -17, 1 )
				self.clipFinished( CalloutHeading, {} )
				PlayerEmblem:completeAnimation()
				self.PlayerEmblem:setAlpha( 0 )
				self.clipFinished( PlayerEmblem, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, false, -4, 92 )
				self.StartMenuframenoBG0:setTopBottom( true, false, 0, 59 )
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setLeftRight( true, false, -1, 215.59 )
				self.StartMenuframenoBG1:setTopBottom( true, false, 0, 59 )
				self.clipFinished( StartMenuframenoBG1, {} )
				Image00001:completeAnimation()
				self.Image00001:setLeftRight( true, false, -15.41, 0.59 )
				self.Image00001:setTopBottom( true, false, -3, 5 )
				self.clipFinished( Image00001, {} )
				Image2:completeAnimation()
				self.Image2:setLeftRight( true, false, -15.41, 0.59 )
				self.Image2:setTopBottom( true, false, 53, 61 )
				self.clipFinished( Image2, {} )
				Image000010:completeAnimation()
				self.Image000010:setLeftRight( true, false, 215.59, 231.59 )
				self.Image000010:setTopBottom( true, false, -2, 6 )
				self.clipFinished( Image000010, {} )
				Image20:completeAnimation()
				self.Image20:setLeftRight( true, false, 215.59, 231.59 )
				self.Image20:setTopBottom( true, false, 53, 61 )
				self.clipFinished( Image20, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Emblem",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Calingcard",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsFrameWidget:close()
		element.LeftPanel:close()
		element.Top3PlayerScoreBlurBox0:close()
		element.VSpanel:close()
		element.Panel:close()
		element.GamerTag:close()
		element.ClanTag:close()
		element.StartMenuframenoBG0:close()
		element.StartMenuframenoBG1:close()
		element.HeroLobbyClientExtraCamRender:close()
		element.RankIcon:close()
		element.Rank:close()
		element.CalloutHeading:close()
		element.PlayerEmblem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

