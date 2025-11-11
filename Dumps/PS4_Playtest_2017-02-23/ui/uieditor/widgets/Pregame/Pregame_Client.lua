require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_CharacterSelection" )
require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_StateIcon" )
require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_StateIcon_Right" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.IconControllerContainer" )
require( "ui.uieditor.widgets.Pregame.Pregame_PlayerName" )

CoD.Pregame_Client = InheritFrom( LUI.UIElement )
CoD.Pregame_Client.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_Client )
	self.id = "Pregame_Client"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 637 )
	self:setTopBottom( 0, 0, 0, 85 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel1 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel1:setLeftRight( 0, 0, 171, 510 )
	FEButtonPanel1:setTopBottom( 0, 0, 4, 82 )
	FEButtonPanel1:setRGB( 0, 0, 0 )
	FEButtonPanel1:setAlpha( 0.7 )
	self:addElement( FEButtonPanel1 )
	self.FEButtonPanel1 = FEButtonPanel1
	
	local RankBackground = CoD.FE_ButtonPanel.new( menu, controller )
	RankBackground:setLeftRight( 0, 0, 75, 162 )
	RankBackground:setTopBottom( 0, 0, 73, 105 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( 0, 0, 81, 115 )
	Rank:setTopBottom( 0, 0, 71, 107 )
	Rank:setAlpha( 0 )
	Rank:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	Rank:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Rank:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local RankIcon = LUI.UIImage.new()
	RankIcon:setLeftRight( 0, 0, 121, 154 )
	RankIcon:setTopBottom( 0, 0, 73, 105 )
	RankIcon:setAlpha( 0 )
	RankIcon:setImage( RegisterImage( "t7_hud_arena_rank_1" ) )
	RankIcon:setupUIStreamedImage( 0 )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local StateLeft = CoD.Competitive_CharacterDraft_StateIcon_Right.new( menu, controller )
	StateLeft:mergeStateConditions( {
		{
			stateName = "Choosing",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING ) and not IsSelfModelValueEqualToSelfTeam( element, controller, "team" )
			end
		},
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED ) and not IsSelfModelValueEqualToSelfTeam( element, controller, "team" )
			end
		},
		{
			stateName = "Forced",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED ) and not IsSelfModelValueEqualToSelfTeam( element, controller, "team" )
			end
		}
	} )
	StateLeft:linkToElementModel( StateLeft, "clientState", true, function ( model )
		menu:updateElementState( StateLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientState"
		} )
	end )
	StateLeft:linkToElementModel( StateLeft, "team", true, function ( model )
		menu:updateElementState( StateLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "team"
		} )
	end )
	StateLeft:setLeftRight( 0, 0, 0, 40 )
	StateLeft:setTopBottom( 0, 0, 23, 63 )
	StateLeft:linkToElementModel( self, nil, false, function ( model )
		StateLeft:setModel( model, controller )
	end )
	self:addElement( StateLeft )
	self.StateLeft = StateLeft
	
	local StateRight = CoD.Competitive_CharacterDraft_StateIcon.new( menu, controller )
	StateRight:mergeStateConditions( {
		{
			stateName = "Choosing",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING ) and IsSelfModelValueEqualToSelfTeam( element, controller, "team" )
			end
		},
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED ) and IsSelfModelValueEqualToSelfTeam( element, controller, "team" )
			end
		},
		{
			stateName = "Forced",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED ) and IsSelfModelValueEqualToSelfTeam( element, controller, "team" )
			end
		}
	} )
	StateRight:linkToElementModel( StateRight, "clientState", true, function ( model )
		menu:updateElementState( StateRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientState"
		} )
	end )
	StateRight:linkToElementModel( StateRight, "team", true, function ( model )
		menu:updateElementState( StateRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "team"
		} )
	end )
	StateRight:setLeftRight( 0, 0, 567, 619 )
	StateRight:setTopBottom( 0, 0, 23, 63 )
	StateRight:linkToElementModel( self, nil, false, function ( model )
		StateRight:setModel( model, controller )
	end )
	self:addElement( StateRight )
	self.StateRight = StateRight
	
	local PregamePlayerName0 = CoD.Pregame_PlayerName.new( menu, controller )
	PregamePlayerName0:setLeftRight( 0, 0, 174, 506 )
	PregamePlayerName0:setTopBottom( 0, 0, 6, 42 )
	PregamePlayerName0:linkToElementModel( self, nil, false, function ( model )
		PregamePlayerName0:setModel( model, controller )
	end )
	PregamePlayerName0:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PregamePlayerName0.ListHeader.btnDisplayTextStroke:setText( Engine.Localize( modelValue ) )
		end
	end )
	PregamePlayerName0:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PregamePlayerName0.btnDisplayTextStroke:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( PregamePlayerName0 )
	self.PregamePlayerName0 = PregamePlayerName0
	
	local ImagePanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	ImagePanel:setLeftRight( 0, 0, 75, 162 )
	ImagePanel:setTopBottom( 0, 0, 0, 86 )
	ImagePanel:setRGB( 0, 0, 0 )
	ImagePanel:setAlpha( 0.7 )
	self:addElement( ImagePanel )
	self.ImagePanel = ImagePanel
	
	local pixelA0 = LUI.UIImage.new()
	pixelA0:setLeftRight( 0, 0, 499, 553 )
	pixelA0:setTopBottom( 0, 0, -1, 4 )
	pixelA0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelA0 )
	self.pixelA0 = pixelA0
	
	local ImageX = LUI.UIImage.new()
	ImageX:setLeftRight( 0, 0, 75, 163 )
	ImageX:setTopBottom( 0, 0, -1, 87 )
	ImageX:setAlpha( 0 )
	ImageX:setImage( RegisterImage( "uie_t7_menu_frontend_slidex" ) )
	ImageX:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImageX )
	self.ImageX = ImageX
	
	local ImageBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder:setLeftRight( 0, 0, 75, 162 )
	ImageBorder:setTopBottom( 0, 0, 0, 86 )
	self:addElement( ImageBorder )
	self.ImageBorder = ImageBorder
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 63, 87 )
	Image0:setTopBottom( 0, 0, 86, 104 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_buttonsseparate" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local CharacterRender = CoD.Competitive_CharacterDraft_CharacterSelection.new( menu, controller )
	CharacterRender:setLeftRight( 0, 0, 72, 163 )
	CharacterRender:setTopBottom( 0, 0, 0, 91 )
	CharacterRender:linkToElementModel( self, nil, false, function ( model )
		CharacterRender:setModel( model, controller )
	end )
	self:addElement( CharacterRender )
	self.CharacterRender = CharacterRender
	
	local pixelA00 = LUI.UIImage.new()
	pixelA00:setLeftRight( 0, 0, 499, 553 )
	pixelA00:setTopBottom( 0, 0, 84, 89 )
	pixelA00:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelA00 )
	self.pixelA00 = pixelA00
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0, 0, 63, 87 )
	Image00:setTopBottom( 0, 0, -17, 1 )
	Image00:setImage( RegisterImage( "uie_t7_menu_frontend_buttonsseparate" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local CharacterName = LUI.UITightText.new()
	CharacterName:setLeftRight( 0, 0, 182, 281 )
	CharacterName:setTopBottom( 0, 0, 45, 75 )
	CharacterName:setAlpha( 0.7 )
	CharacterName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CharacterName:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	CharacterName:setShaderVector( 0, 0.02, 0, 0, 0 )
	CharacterName:setShaderVector( 1, 0.06, 0, 0, 0 )
	CharacterName:setShaderVector( 2, 1, 0, 0, 0 )
	CharacterName:setLetterSpacing( 0.2 )
	CharacterName:linkToElementModel( self, "characterName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CharacterName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CharacterName )
	self.CharacterName = CharacterName
	
	local CharacterLoadout = LUI.UITightText.new()
	CharacterLoadout:setLeftRight( 0, 0, 278, 506 )
	CharacterLoadout:setTopBottom( 0, 0, 45, 75 )
	CharacterLoadout:setAlpha( 0.7 )
	CharacterLoadout:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CharacterLoadout:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	CharacterLoadout:setShaderVector( 0, 0.03, 0, 0, 0 )
	CharacterLoadout:setShaderVector( 1, 0.06, 0, 0, 0 )
	CharacterLoadout:setShaderVector( 2, 1, 0, 0, 0 )
	CharacterLoadout:setLetterSpacing( 0.2 )
	CharacterLoadout:linkToElementModel( self, "characterLoadoutName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CharacterLoadout:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CharacterLoadout )
	self.CharacterLoadout = CharacterLoadout
	
	local LineB1 = LUI.UIImage.new()
	LineB1:setLeftRight( 0, 0, 165, 519 )
	LineB1:setTopBottom( 0, 0, -1, 5 )
	LineB1:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB1 )
	self.LineB1 = LineB1
	
	local LineB00 = LUI.UIImage.new()
	LineB00:setLeftRight( 0, 0, 165, 519 )
	LineB00:setTopBottom( 0, 0, 84, 90 )
	LineB00:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB00 )
	self.LineB00 = LineB00
	
	local pixelA01 = LUI.UIImage.new()
	pixelA01:setLeftRight( 0, 0, 126, 180 )
	pixelA01:setTopBottom( 0, 0, 21, 26 )
	pixelA01:setAlpha( 0 )
	pixelA01:setZRot( 180 )
	pixelA01:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA01:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelA01 )
	self.pixelA01 = pixelA01
	
	local pixelA000 = LUI.UIImage.new()
	pixelA000:setLeftRight( 0, 0, 126, 180 )
	pixelA000:setTopBottom( 0, 0, 60, 65 )
	pixelA000:setAlpha( 0 )
	pixelA000:setZRot( 180 )
	pixelA000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA000:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelA000 )
	self.pixelA000 = pixelA000
	
	local SizeElement = LUI.UIImage.new()
	SizeElement:setLeftRight( 0, 0, 446, 638 )
	SizeElement:setTopBottom( 0, 0, 0, 86 )
	SizeElement:setAlpha( 0 )
	self:addElement( SizeElement )
	self.SizeElement = SizeElement
	
	local IconControllerContainer = CoD.IconControllerContainer.new( menu, controller )
	IconControllerContainer:setLeftRight( 0, 0, -5, 81 )
	IconControllerContainer:setTopBottom( 0, 0, 19, 67 )
	IconControllerContainer:setRGB( 0.74, 0.78, 0.79 )
	IconControllerContainer:linkToElementModel( self, nil, false, function ( model )
		IconControllerContainer:setModel( model, controller )
	end )
	self:addElement( IconControllerContainer )
	self.IconControllerContainer = IconControllerContainer
	
	self.resetProperties = function ()
		pixelA00:completeAnimation()
		CharacterRender:completeAnimation()
		pixelA0:completeAnimation()
		PregamePlayerName0:completeAnimation()
		RankIcon:completeAnimation()
		Rank:completeAnimation()
		RankBackground:completeAnimation()
		FEButtonPanel1:completeAnimation()
		CharacterName:completeAnimation()
		CharacterLoadout:completeAnimation()
		LineB00:completeAnimation()
		LineB1:completeAnimation()
		ImageBorder:completeAnimation()
		ImageX:completeAnimation()
		ImagePanel:completeAnimation()
		SizeElement:completeAnimation()
		pixelA01:completeAnimation()
		pixelA000:completeAnimation()
		StateRight:completeAnimation()
		Image00:completeAnimation()
		Image0:completeAnimation()
		pixelA00:setLeftRight( 0, 0, 499, 553 )
		pixelA00:setTopBottom( 0, 0, 84, 89 )
		CharacterRender:setLeftRight( 0, 0, 72, 163 )
		CharacterRender:setTopBottom( 0, 0, 0, 91 )
		CharacterRender:setAlpha( 1 )
		pixelA0:setLeftRight( 0, 0, 499, 553 )
		pixelA0:setTopBottom( 0, 0, -1, 4 )
		PregamePlayerName0:setLeftRight( 0, 0, 174, 506 )
		PregamePlayerName0:setTopBottom( 0, 0, 6, 42 )
		RankIcon:setLeftRight( 0, 0, 121, 154 )
		RankIcon:setTopBottom( 0, 0, 73, 105 )
		Rank:setLeftRight( 0, 0, 81, 115 )
		Rank:setTopBottom( 0, 0, 71, 107 )
		RankBackground:setLeftRight( 0, 0, 75, 162 )
		RankBackground:setTopBottom( 0, 0, 73, 105 )
		RankBackground:setAlpha( 0 )
		FEButtonPanel1:setLeftRight( 0, 0, 171, 510 )
		FEButtonPanel1:setTopBottom( 0, 0, 4, 82 )
		CharacterName:setLeftRight( 0, 0, 182, 281 )
		CharacterName:setTopBottom( 0, 0, 45, 75 )
		CharacterName:setAlpha( 0.7 )
		CharacterLoadout:setLeftRight( 0, 0, 278, 506 )
		CharacterLoadout:setTopBottom( 0, 0, 45, 75 )
		CharacterLoadout:setAlpha( 0.7 )
		LineB00:setLeftRight( 0, 0, 165, 519 )
		LineB00:setTopBottom( 0, 0, 84, 90 )
		LineB1:setLeftRight( 0, 0, 165, 519 )
		LineB1:setTopBottom( 0, 0, -1, 5 )
		ImageBorder:setAlpha( 1 )
		ImageX:setLeftRight( 0, 0, 75, 163 )
		ImageX:setTopBottom( 0, 0, -1, 87 )
		ImageX:setAlpha( 0 )
		ImagePanel:setAlpha( 0.7 )
		SizeElement:setLeftRight( 0, 0, 446, 638 )
		SizeElement:setTopBottom( 0, 0, 0, 86 )
		pixelA01:setLeftRight( 0, 0, 126, 180 )
		pixelA01:setTopBottom( 0, 0, 21, 26 )
		pixelA01:setAlpha( 0 )
		pixelA01:setXRot( 0 )
		pixelA01:setYRot( 0 )
		pixelA01:setZRot( 180 )
		pixelA000:setLeftRight( 0, 0, 126, 180 )
		pixelA000:setTopBottom( 0, 0, 60, 65 )
		pixelA000:setAlpha( 0 )
		pixelA000:setZRot( 180 )
		StateRight:setLeftRight( 0, 0, 567, 619 )
		StateRight:setTopBottom( 0, 0, 23, 63 )
		Image00:setLeftRight( 0, 0, 63, 87 )
		Image00:setTopBottom( 0, 0, -17, 1 )
		Image0:setLeftRight( 0, 0, 63, 87 )
		Image0:setTopBottom( 0, 0, 86, 104 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ItemRestriction = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			CharacterDraft = function ()
				self.resetProperties()
				self:setupElementClipCounter( 18 )
				local FEButtonPanel1Frame2 = function ( FEButtonPanel1, event )
					if not event.interrupted then
						FEButtonPanel1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel1:setLeftRight( 0, 0, 107.5, 509.5 )
					FEButtonPanel1:setTopBottom( 0, 0, 23.5, 64.5 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel1, event )
					else
						FEButtonPanel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( 0, 0, 107.5, 509.5 )
				self.FEButtonPanel1:setTopBottom( 0, 0, 23.5, 64.5 )
				FEButtonPanel1Frame2( FEButtonPanel1, {} )
				local RankBackgroundFrame2 = function ( RankBackground, event )
					if not event.interrupted then
						RankBackground:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					RankBackground:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RankBackground, event )
					else
						RankBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankBackground:completeAnimation()
				self.RankBackground:setAlpha( 0 )
				RankBackgroundFrame2( RankBackground, {} )
				local RankFrame2 = function ( Rank, event )
					if not event.interrupted then
						Rank:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Rank:setLeftRight( 0, 0, 69.5, 112.5 )
					Rank:setTopBottom( 0, 0, 35, 71 )
					if event.interrupted then
						self.clipFinished( Rank, event )
					else
						Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:completeAnimation()
				self.Rank:setLeftRight( 0, 0, 69.5, 112.5 )
				self.Rank:setTopBottom( 0, 0, 35, 71 )
				RankFrame2( Rank, {} )
				local RankIconFrame2 = function ( RankIcon, event )
					if not event.interrupted then
						RankIcon:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					RankIcon:setLeftRight( 0, 0, 118, 153 )
					RankIcon:setTopBottom( 0, 0, 35.5, 70.5 )
					if event.interrupted then
						self.clipFinished( RankIcon, event )
					else
						RankIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( 0, 0, 118, 153 )
				self.RankIcon:setTopBottom( 0, 0, 35.5, 70.5 )
				RankIconFrame2( RankIcon, {} )
				local PregamePlayerName0Frame2 = function ( PregamePlayerName0, event )
					if not event.interrupted then
						PregamePlayerName0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					PregamePlayerName0:setLeftRight( 0, 0, 117, 505 )
					PregamePlayerName0:setTopBottom( 0, 0, 27, 57 )
					if event.interrupted then
						self.clipFinished( PregamePlayerName0, event )
					else
						PregamePlayerName0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( 0, 0, 117, 505 )
				self.PregamePlayerName0:setTopBottom( 0, 0, 27, 57 )
				PregamePlayerName0Frame2( PregamePlayerName0, {} )
				local ImagePanelFrame2 = function ( ImagePanel, event )
					if not event.interrupted then
						ImagePanel:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ImagePanel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImagePanel, event )
					else
						ImagePanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImagePanel:completeAnimation()
				self.ImagePanel:setAlpha( 0 )
				ImagePanelFrame2( ImagePanel, {} )
				local pixelA0Frame2 = function ( pixelA0, event )
					if not event.interrupted then
						pixelA0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					pixelA0:setLeftRight( 0, 0, 499, 553 )
					pixelA0:setTopBottom( 0, 0, 21, 26 )
					if event.interrupted then
						self.clipFinished( pixelA0, event )
					else
						pixelA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA0:completeAnimation()
				self.pixelA0:setLeftRight( 0, 0, 499, 553 )
				self.pixelA0:setTopBottom( 0, 0, 21, 26 )
				pixelA0Frame2( pixelA0, {} )
				local ImageXFrame2 = function ( ImageX, event )
					if not event.interrupted then
						ImageX:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ImageX:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImageX, event )
					else
						ImageX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImageX:completeAnimation()
				self.ImageX:setAlpha( 0 )
				ImageXFrame2( ImageX, {} )
				local ImageBorderFrame2 = function ( ImageBorder, event )
					if not event.interrupted then
						ImageBorder:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ImageBorder:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImageBorder, event )
					else
						ImageBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImageBorder:completeAnimation()
				self.ImageBorder:setAlpha( 0 )
				ImageBorderFrame2( ImageBorder, {} )
				local CharacterRenderFrame2 = function ( CharacterRender, event )
					if not event.interrupted then
						CharacterRender:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					CharacterRender:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CharacterRender, event )
					else
						CharacterRender:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterRender:completeAnimation()
				self.CharacterRender:setAlpha( 0 )
				CharacterRenderFrame2( CharacterRender, {} )
				local pixelA00Frame2 = function ( pixelA00, event )
					if not event.interrupted then
						pixelA00:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					pixelA00:setLeftRight( 0, 0, 499, 553 )
					pixelA00:setTopBottom( 0, 0, 62, 67 )
					if event.interrupted then
						self.clipFinished( pixelA00, event )
					else
						pixelA00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA00:completeAnimation()
				self.pixelA00:setLeftRight( 0, 0, 499, 553 )
				self.pixelA00:setTopBottom( 0, 0, 62, 67 )
				pixelA00Frame2( pixelA00, {} )
				local CharacterNameFrame2 = function ( CharacterName, event )
					if not event.interrupted then
						CharacterName:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					CharacterName:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CharacterName, event )
					else
						CharacterName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterName:completeAnimation()
				self.CharacterName:setAlpha( 0 )
				CharacterNameFrame2( CharacterName, {} )
				local CharacterLoadoutFrame2 = function ( CharacterLoadout, event )
					if not event.interrupted then
						CharacterLoadout:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					CharacterLoadout:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CharacterLoadout, event )
					else
						CharacterLoadout:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setAlpha( 0 )
				CharacterLoadoutFrame2( CharacterLoadout, {} )
				local LineB1Frame2 = function ( LineB1, event )
					if not event.interrupted then
						LineB1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					LineB1:setLeftRight( 0, 0, 108.5, 519.5 )
					LineB1:setTopBottom( 0, 0, 21, 27 )
					if event.interrupted then
						self.clipFinished( LineB1, event )
					else
						LineB1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB1:completeAnimation()
				self.LineB1:setLeftRight( 0, 0, 108.5, 519.5 )
				self.LineB1:setTopBottom( 0, 0, 21, 27 )
				LineB1Frame2( LineB1, {} )
				local LineB00Frame2 = function ( LineB00, event )
					if not event.interrupted then
						LineB00:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					LineB00:setLeftRight( 0, 0, 108.5, 519.5 )
					LineB00:setTopBottom( 0, 0, 61, 67 )
					if event.interrupted then
						self.clipFinished( LineB00, event )
					else
						LineB00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB00:completeAnimation()
				self.LineB00:setLeftRight( 0, 0, 108.5, 519.5 )
				self.LineB00:setTopBottom( 0, 0, 61, 67 )
				LineB00Frame2( LineB00, {} )
				local pixelA01Frame2 = function ( pixelA01, event )
					if not event.interrupted then
						pixelA01:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					pixelA01:setLeftRight( 0, 0, 66, 120 )
					pixelA01:setTopBottom( 0, 0, 21, 26 )
					pixelA01:setAlpha( 1 )
					pixelA01:setXRot( 0 )
					pixelA01:setYRot( 0 )
					pixelA01:setZRot( 180 )
					if event.interrupted then
						self.clipFinished( pixelA01, event )
					else
						pixelA01:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA01:completeAnimation()
				self.pixelA01:setLeftRight( 0, 0, 66, 120 )
				self.pixelA01:setTopBottom( 0, 0, 21, 26 )
				self.pixelA01:setAlpha( 1 )
				self.pixelA01:setXRot( 0 )
				self.pixelA01:setYRot( 0 )
				self.pixelA01:setZRot( 180 )
				pixelA01Frame2( pixelA01, {} )
				local pixelA000Frame2 = function ( pixelA000, event )
					if not event.interrupted then
						pixelA000:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					pixelA000:setLeftRight( 0, 0, 66, 120 )
					pixelA000:setTopBottom( 0, 0, 60, 65 )
					pixelA000:setAlpha( 1 )
					pixelA000:setZRot( 180 )
					if event.interrupted then
						self.clipFinished( pixelA000, event )
					else
						pixelA000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA000:completeAnimation()
				self.pixelA000:setLeftRight( 0, 0, 66, 120 )
				self.pixelA000:setTopBottom( 0, 0, 60, 65 )
				self.pixelA000:setAlpha( 1 )
				self.pixelA000:setZRot( 180 )
				pixelA000Frame2( pixelA000, {} )
				local SizeElementFrame2 = function ( SizeElement, event )
					if not event.interrupted then
						SizeElement:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					SizeElement:setLeftRight( 0, 0, 0, 638 )
					SizeElement:setTopBottom( 0, 0, 16.5, 67.5 )
					if event.interrupted then
						self.clipFinished( SizeElement, event )
					else
						SizeElement:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SizeElement:completeAnimation()
				self.SizeElement:setLeftRight( 0, 0, 0, 638 )
				self.SizeElement:setTopBottom( 0, 0, 16.5, 67.5 )
				SizeElementFrame2( SizeElement, {} )
			end
		},
		CharacterDraft = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( 0, 0, 180, 510 )
				self.PregamePlayerName0:setTopBottom( 0, 0, 22.5, 57.5 )
				self.clipFinished( PregamePlayerName0, {} )
				ImageX:completeAnimation()
				self.ImageX:setAlpha( 1 )
				self.clipFinished( ImageX, {} )
				CharacterRender:completeAnimation()
				self.CharacterRender:setLeftRight( 0, 0, 72, 163 )
				self.CharacterRender:setTopBottom( 0, 0, -1, 90 )
				self.CharacterRender:setAlpha( 0 )
				self.clipFinished( CharacterRender, {} )
				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( 0, 0, 187.5, 329.5 )
				self.CharacterName:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterName:setAlpha( 0 )
				self.clipFinished( CharacterName, {} )
				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( 0, 0, 342, 484 )
				self.CharacterLoadout:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterLoadout:setAlpha( 0 )
				self.clipFinished( CharacterLoadout, {} )
				SizeElement:completeAnimation()
				self.SizeElement:setLeftRight( 0, 0, 0, 638 )
				self.SizeElement:setTopBottom( 0, 0, 0, 86 )
				self.clipFinished( SizeElement, {} )
			end,
			CharacterDraftSelected = function ()
				self.resetProperties()
				self:setupElementClipCounter( 19 )
				local FEButtonPanel1Frame2 = function ( FEButtonPanel1, event )
					if not event.interrupted then
						FEButtonPanel1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel1:setLeftRight( 0, 0, 171, 510 )
					FEButtonPanel1:setTopBottom( 0, 0, 4, 82 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel1, event )
					else
						FEButtonPanel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( 0, 0, 171, 510 )
				self.FEButtonPanel1:setTopBottom( 0, 0, 4, 82 )
				FEButtonPanel1Frame2( FEButtonPanel1, {} )
				local RankBackgroundFrame2 = function ( RankBackground, event )
					if not event.interrupted then
						RankBackground:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankBackground:setLeftRight( 0, 0, 75, 162 )
					RankBackground:setTopBottom( 0, 0, 73, 105 )
					if event.interrupted then
						self.clipFinished( RankBackground, event )
					else
						RankBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankBackground:completeAnimation()
				self.RankBackground:setLeftRight( 0, 0, 75, 162 )
				self.RankBackground:setTopBottom( 0, 0, 73, 105 )
				RankBackgroundFrame2( RankBackground, {} )
				local RankFrame2 = function ( Rank, event )
					if not event.interrupted then
						Rank:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Rank:setLeftRight( 0, 0, 81, 115 )
					Rank:setTopBottom( 0, 0, 71, 107 )
					if event.interrupted then
						self.clipFinished( Rank, event )
					else
						Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:completeAnimation()
				self.Rank:setLeftRight( 0, 0, 81, 115 )
				self.Rank:setTopBottom( 0, 0, 71, 107 )
				RankFrame2( Rank, {} )
				local RankIconFrame2 = function ( RankIcon, event )
					if not event.interrupted then
						RankIcon:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankIcon:setLeftRight( 0, 0, 121, 154 )
					RankIcon:setTopBottom( 0, 0, 73, 105 )
					if event.interrupted then
						self.clipFinished( RankIcon, event )
					else
						RankIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( 0, 0, 121, 154 )
				self.RankIcon:setTopBottom( 0, 0, 73, 105 )
				RankIconFrame2( RankIcon, {} )
				StateRight:completeAnimation()
				self.StateRight:setLeftRight( 0, 0, 567, 607 )
				self.StateRight:setTopBottom( 0, 0, 21.5, 62.5 )
				self.clipFinished( StateRight, {} )
				local PregamePlayerName0Frame2 = function ( PregamePlayerName0, event )
					local PregamePlayerName0Frame3 = function ( PregamePlayerName0, event )
						if not event.interrupted then
							PregamePlayerName0:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
						end
						PregamePlayerName0:setLeftRight( 0, 0, 180, 510 )
						PregamePlayerName0:setTopBottom( 0, 0, 12, 48 )
						if event.interrupted then
							self.clipFinished( PregamePlayerName0, event )
						else
							PregamePlayerName0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PregamePlayerName0Frame3( PregamePlayerName0, event )
						return 
					else
						PregamePlayerName0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						PregamePlayerName0:setTopBottom( 0, 0, 20, 56 )
						PregamePlayerName0:registerEventHandler( "transition_complete_keyframe", PregamePlayerName0Frame3 )
					end
				end
				
				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( 0, 0, 180, 510 )
				self.PregamePlayerName0:setTopBottom( 0, 0, 22, 58 )
				PregamePlayerName0Frame2( PregamePlayerName0, {} )
				local pixelA0Frame2 = function ( pixelA0, event )
					if not event.interrupted then
						pixelA0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA0:setLeftRight( 0, 0, 499, 553 )
					pixelA0:setTopBottom( 0, 0, -1, 4 )
					if event.interrupted then
						self.clipFinished( pixelA0, event )
					else
						pixelA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA0:completeAnimation()
				self.pixelA0:setLeftRight( 0, 0, 499, 553 )
				self.pixelA0:setTopBottom( 0, 0, -1, 4 )
				pixelA0Frame2( pixelA0, {} )
				local ImageXFrame2 = function ( ImageX, event )
					if not event.interrupted then
						ImageX:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
					end
					ImageX:setLeftRight( 0, 0, 72, 160 )
					ImageX:setTopBottom( 0, 0, -2, 86 )
					ImageX:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImageX, event )
					else
						ImageX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImageX:completeAnimation()
				self.ImageX:setLeftRight( 0, 0, 72, 160 )
				self.ImageX:setTopBottom( 0, 0, -2, 86 )
				self.ImageX:setAlpha( 1 )
				ImageXFrame2( ImageX, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( 0, 0, 63, 87 )
					Image0:setTopBottom( 0, 0, 86, 104 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( 0, 0, 63, 87 )
				self.Image0:setTopBottom( 0, 0, 86, 104 )
				Image0Frame2( Image0, {} )
				local CharacterRenderFrame2 = function ( CharacterRender, event )
					if not event.interrupted then
						CharacterRender:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterRender:setLeftRight( 0, 0, 72, 163 )
					CharacterRender:setTopBottom( 0, 0, -1, 90 )
					CharacterRender:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CharacterRender, event )
					else
						CharacterRender:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterRender:completeAnimation()
				self.CharacterRender:setLeftRight( 0, 0, 72, 163 )
				self.CharacterRender:setTopBottom( 0, 0, -1, 90 )
				self.CharacterRender:setAlpha( 0 )
				CharacterRenderFrame2( CharacterRender, {} )
				local pixelA00Frame2 = function ( pixelA00, event )
					if not event.interrupted then
						pixelA00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA00:setLeftRight( 0, 0, 499, 553 )
					pixelA00:setTopBottom( 0, 0, 84, 89 )
					if event.interrupted then
						self.clipFinished( pixelA00, event )
					else
						pixelA00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA00:completeAnimation()
				self.pixelA00:setLeftRight( 0, 0, 499, 553 )
				self.pixelA00:setTopBottom( 0, 0, 84, 89 )
				pixelA00Frame2( pixelA00, {} )
				local Image00Frame2 = function ( Image00, event )
					if not event.interrupted then
						Image00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image00:setLeftRight( 0, 0, 63, 87 )
					Image00:setTopBottom( 0, 0, -17, 1 )
					if event.interrupted then
						self.clipFinished( Image00, event )
					else
						Image00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image00:completeAnimation()
				self.Image00:setLeftRight( 0, 0, 63, 87 )
				self.Image00:setTopBottom( 0, 0, -17, 1 )
				Image00Frame2( Image00, {} )
				local CharacterNameFrame2 = function ( CharacterName, event )
					if not event.interrupted then
						CharacterName:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterName:setLeftRight( 0, 0, 187.5, 329.5 )
					CharacterName:setTopBottom( 0, 0, 49.5, 76.5 )
					CharacterName:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterName, event )
					else
						CharacterName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( 0, 0, 187.5, 329.5 )
				self.CharacterName:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterName:setAlpha( 0 )
				CharacterNameFrame2( CharacterName, {} )
				local CharacterLoadoutFrame2 = function ( CharacterLoadout, event )
					if not event.interrupted then
						CharacterLoadout:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterLoadout:setLeftRight( 0, 0, 342, 484 )
					CharacterLoadout:setTopBottom( 0, 0, 49.5, 76.5 )
					CharacterLoadout:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterLoadout, event )
					else
						CharacterLoadout:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( 0, 0, 342, 484 )
				self.CharacterLoadout:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterLoadout:setAlpha( 0 )
				CharacterLoadoutFrame2( CharacterLoadout, {} )
				local LineB1Frame2 = function ( LineB1, event )
					if not event.interrupted then
						LineB1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB1:setLeftRight( 0, 0, 165, 519 )
					LineB1:setTopBottom( 0, 0, -1, 5 )
					if event.interrupted then
						self.clipFinished( LineB1, event )
					else
						LineB1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB1:completeAnimation()
				self.LineB1:setLeftRight( 0, 0, 165, 519 )
				self.LineB1:setTopBottom( 0, 0, -1, 5 )
				LineB1Frame2( LineB1, {} )
				local LineB00Frame2 = function ( LineB00, event )
					if not event.interrupted then
						LineB00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB00:setLeftRight( 0, 0, 165, 519 )
					LineB00:setTopBottom( 0, 0, 84, 90 )
					if event.interrupted then
						self.clipFinished( LineB00, event )
					else
						LineB00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB00:completeAnimation()
				self.LineB00:setLeftRight( 0, 0, 165, 519 )
				self.LineB00:setTopBottom( 0, 0, 84, 90 )
				LineB00Frame2( LineB00, {} )
				local pixelA01Frame2 = function ( pixelA01, event )
					if not event.interrupted then
						pixelA01:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA01:setLeftRight( 0, 0, 126, 180 )
					pixelA01:setTopBottom( 0, 0, 21, 26 )
					if event.interrupted then
						self.clipFinished( pixelA01, event )
					else
						pixelA01:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA01:completeAnimation()
				self.pixelA01:setLeftRight( 0, 0, 126, 180 )
				self.pixelA01:setTopBottom( 0, 0, 21, 26 )
				pixelA01Frame2( pixelA01, {} )
				local pixelA000Frame2 = function ( pixelA000, event )
					if not event.interrupted then
						pixelA000:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA000:setLeftRight( 0, 0, 126, 180 )
					pixelA000:setTopBottom( 0, 0, 60, 65 )
					if event.interrupted then
						self.clipFinished( pixelA000, event )
					else
						pixelA000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA000:completeAnimation()
				self.pixelA000:setLeftRight( 0, 0, 126, 180 )
				self.pixelA000:setTopBottom( 0, 0, 60, 65 )
				pixelA000Frame2( pixelA000, {} )
				SizeElement:completeAnimation()
				self.SizeElement:setLeftRight( 0, 0, 0, 638 )
				self.SizeElement:setTopBottom( 0, 0, 0, 86 )
				self.clipFinished( SizeElement, {} )
			end,
			CharacterDraftForced = function ()
				self.resetProperties()
				self:setupElementClipCounter( 19 )
				local FEButtonPanel1Frame2 = function ( FEButtonPanel1, event )
					if not event.interrupted then
						FEButtonPanel1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel1:setLeftRight( 0, 0, 171, 510 )
					FEButtonPanel1:setTopBottom( 0, 0, 4, 82 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel1, event )
					else
						FEButtonPanel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( 0, 0, 171, 510 )
				self.FEButtonPanel1:setTopBottom( 0, 0, 4, 82 )
				FEButtonPanel1Frame2( FEButtonPanel1, {} )
				local RankBackgroundFrame2 = function ( RankBackground, event )
					if not event.interrupted then
						RankBackground:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankBackground:setLeftRight( 0, 0, 75, 162 )
					RankBackground:setTopBottom( 0, 0, 73, 105 )
					if event.interrupted then
						self.clipFinished( RankBackground, event )
					else
						RankBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankBackground:completeAnimation()
				self.RankBackground:setLeftRight( 0, 0, 75, 162 )
				self.RankBackground:setTopBottom( 0, 0, 73, 105 )
				RankBackgroundFrame2( RankBackground, {} )
				local RankFrame2 = function ( Rank, event )
					if not event.interrupted then
						Rank:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Rank:setLeftRight( 0, 0, 81, 115 )
					Rank:setTopBottom( 0, 0, 71, 107 )
					if event.interrupted then
						self.clipFinished( Rank, event )
					else
						Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:completeAnimation()
				self.Rank:setLeftRight( 0, 0, 81, 115 )
				self.Rank:setTopBottom( 0, 0, 71, 107 )
				RankFrame2( Rank, {} )
				local RankIconFrame2 = function ( RankIcon, event )
					if not event.interrupted then
						RankIcon:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankIcon:setLeftRight( 0, 0, 121, 154 )
					RankIcon:setTopBottom( 0, 0, 73, 105 )
					if event.interrupted then
						self.clipFinished( RankIcon, event )
					else
						RankIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( 0, 0, 121, 154 )
				self.RankIcon:setTopBottom( 0, 0, 73, 105 )
				RankIconFrame2( RankIcon, {} )
				StateRight:completeAnimation()
				self.StateRight:setLeftRight( 0, 0, 567, 607 )
				self.StateRight:setTopBottom( 0, 0, 21.5, 62.5 )
				self.clipFinished( StateRight, {} )
				local PregamePlayerName0Frame2 = function ( PregamePlayerName0, event )
					local PregamePlayerName0Frame3 = function ( PregamePlayerName0, event )
						if not event.interrupted then
							PregamePlayerName0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						PregamePlayerName0:setLeftRight( 0, 0, 180, 510 )
						PregamePlayerName0:setTopBottom( 0, 0, 12, 48 )
						if event.interrupted then
							self.clipFinished( PregamePlayerName0, event )
						else
							PregamePlayerName0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PregamePlayerName0Frame3( PregamePlayerName0, event )
						return 
					else
						PregamePlayerName0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						PregamePlayerName0:setTopBottom( 0, 0, 20, 56 )
						PregamePlayerName0:registerEventHandler( "transition_complete_keyframe", PregamePlayerName0Frame3 )
					end
				end
				
				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( 0, 0, 180, 510 )
				self.PregamePlayerName0:setTopBottom( 0, 0, 22, 58 )
				PregamePlayerName0Frame2( PregamePlayerName0, {} )
				local pixelA0Frame2 = function ( pixelA0, event )
					if not event.interrupted then
						pixelA0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA0:setLeftRight( 0, 0, 499, 553 )
					pixelA0:setTopBottom( 0, 0, -1, 4 )
					if event.interrupted then
						self.clipFinished( pixelA0, event )
					else
						pixelA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA0:completeAnimation()
				self.pixelA0:setLeftRight( 0, 0, 499, 553 )
				self.pixelA0:setTopBottom( 0, 0, -1, 4 )
				pixelA0Frame2( pixelA0, {} )
				local ImageXFrame2 = function ( ImageX, event )
					if not event.interrupted then
						ImageX:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
					end
					ImageX:setLeftRight( 0, 0, 72, 160 )
					ImageX:setTopBottom( 0, 0, -2, 86 )
					ImageX:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImageX, event )
					else
						ImageX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImageX:completeAnimation()
				self.ImageX:setLeftRight( 0, 0, 72, 160 )
				self.ImageX:setTopBottom( 0, 0, -2, 86 )
				self.ImageX:setAlpha( 1 )
				ImageXFrame2( ImageX, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( 0, 0, 63, 87 )
					Image0:setTopBottom( 0, 0, 86, 104 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( 0, 0, 63, 87 )
				self.Image0:setTopBottom( 0, 0, 86, 104 )
				Image0Frame2( Image0, {} )
				local CharacterRenderFrame2 = function ( CharacterRender, event )
					if not event.interrupted then
						CharacterRender:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterRender:setLeftRight( 0, 0, 72, 163 )
					CharacterRender:setTopBottom( 0, 0, -1, 90 )
					CharacterRender:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CharacterRender, event )
					else
						CharacterRender:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterRender:completeAnimation()
				self.CharacterRender:setLeftRight( 0, 0, 72, 163 )
				self.CharacterRender:setTopBottom( 0, 0, -1, 90 )
				self.CharacterRender:setAlpha( 0 )
				CharacterRenderFrame2( CharacterRender, {} )
				local pixelA00Frame2 = function ( pixelA00, event )
					if not event.interrupted then
						pixelA00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA00:setLeftRight( 0, 0, 499, 553 )
					pixelA00:setTopBottom( 0, 0, 84, 89 )
					if event.interrupted then
						self.clipFinished( pixelA00, event )
					else
						pixelA00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA00:completeAnimation()
				self.pixelA00:setLeftRight( 0, 0, 499, 553 )
				self.pixelA00:setTopBottom( 0, 0, 84, 89 )
				pixelA00Frame2( pixelA00, {} )
				local Image00Frame2 = function ( Image00, event )
					if not event.interrupted then
						Image00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image00:setLeftRight( 0, 0, 63, 87 )
					Image00:setTopBottom( 0, 0, -17, 1 )
					if event.interrupted then
						self.clipFinished( Image00, event )
					else
						Image00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image00:completeAnimation()
				self.Image00:setLeftRight( 0, 0, 63, 87 )
				self.Image00:setTopBottom( 0, 0, -17, 1 )
				Image00Frame2( Image00, {} )
				local CharacterNameFrame2 = function ( CharacterName, event )
					if not event.interrupted then
						CharacterName:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterName:setLeftRight( 0, 0, 187.5, 329.5 )
					CharacterName:setTopBottom( 0, 0, 49.5, 76.5 )
					CharacterName:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterName, event )
					else
						CharacterName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( 0, 0, 187.5, 329.5 )
				self.CharacterName:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterName:setAlpha( 0 )
				CharacterNameFrame2( CharacterName, {} )
				local CharacterLoadoutFrame2 = function ( CharacterLoadout, event )
					if not event.interrupted then
						CharacterLoadout:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterLoadout:setLeftRight( 0, 0, 342, 484 )
					CharacterLoadout:setTopBottom( 0, 0, 49.5, 76.5 )
					CharacterLoadout:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterLoadout, event )
					else
						CharacterLoadout:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( 0, 0, 342, 484 )
				self.CharacterLoadout:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterLoadout:setAlpha( 0 )
				CharacterLoadoutFrame2( CharacterLoadout, {} )
				local LineB1Frame2 = function ( LineB1, event )
					if not event.interrupted then
						LineB1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB1:setLeftRight( 0, 0, 165, 519 )
					LineB1:setTopBottom( 0, 0, -1, 5 )
					if event.interrupted then
						self.clipFinished( LineB1, event )
					else
						LineB1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB1:completeAnimation()
				self.LineB1:setLeftRight( 0, 0, 165, 519 )
				self.LineB1:setTopBottom( 0, 0, -1, 5 )
				LineB1Frame2( LineB1, {} )
				local LineB00Frame2 = function ( LineB00, event )
					if not event.interrupted then
						LineB00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB00:setLeftRight( 0, 0, 165, 519 )
					LineB00:setTopBottom( 0, 0, 84, 90 )
					if event.interrupted then
						self.clipFinished( LineB00, event )
					else
						LineB00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB00:completeAnimation()
				self.LineB00:setLeftRight( 0, 0, 165, 519 )
				self.LineB00:setTopBottom( 0, 0, 84, 90 )
				LineB00Frame2( LineB00, {} )
				local pixelA01Frame2 = function ( pixelA01, event )
					if not event.interrupted then
						pixelA01:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA01:setLeftRight( 0, 0, 126, 180 )
					pixelA01:setTopBottom( 0, 0, 21, 26 )
					if event.interrupted then
						self.clipFinished( pixelA01, event )
					else
						pixelA01:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA01:completeAnimation()
				self.pixelA01:setLeftRight( 0, 0, 126, 180 )
				self.pixelA01:setTopBottom( 0, 0, 21, 26 )
				pixelA01Frame2( pixelA01, {} )
				local pixelA000Frame2 = function ( pixelA000, event )
					if not event.interrupted then
						pixelA000:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA000:setLeftRight( 0, 0, 126, 180 )
					pixelA000:setTopBottom( 0, 0, 60, 65 )
					if event.interrupted then
						self.clipFinished( pixelA000, event )
					else
						pixelA000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA000:completeAnimation()
				self.pixelA000:setLeftRight( 0, 0, 126, 180 )
				self.pixelA000:setTopBottom( 0, 0, 60, 65 )
				pixelA000Frame2( pixelA000, {} )
				SizeElement:completeAnimation()
				self.SizeElement:setLeftRight( 0, 0, 0, 638 )
				self.SizeElement:setTopBottom( 0, 0, 0, 86 )
				self.clipFinished( SizeElement, {} )
			end
		},
		CharacterDraftSelecting = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( 0, 0, 180, 510 )
				self.PregamePlayerName0:setTopBottom( 0, 0, 22.5, 57.5 )
				self.clipFinished( PregamePlayerName0, {} )
				ImageX:completeAnimation()
				self.ImageX:setAlpha( 1 )
				self.clipFinished( ImageX, {} )
				CharacterRender:completeAnimation()
				self.CharacterRender:setLeftRight( 0, 0, 72, 163 )
				self.CharacterRender:setTopBottom( 0, 0, -1, 90 )
				self.CharacterRender:setAlpha( 0 )
				self.clipFinished( CharacterRender, {} )
				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( 0, 0, 187.5, 329.5 )
				self.CharacterName:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterName:setAlpha( 0 )
				self.clipFinished( CharacterName, {} )
				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( 0, 0, 342, 484 )
				self.CharacterLoadout:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterLoadout:setAlpha( 0 )
				self.clipFinished( CharacterLoadout, {} )
				SizeElement:completeAnimation()
				self.SizeElement:setLeftRight( 0, 0, 0, 638 )
				self.SizeElement:setTopBottom( 0, 0, 0, 86 )
				self.clipFinished( SizeElement, {} )
			end,
			CharacterDraftSelected = function ()
				self.resetProperties()
				self:setupElementClipCounter( 19 )
				local FEButtonPanel1Frame2 = function ( FEButtonPanel1, event )
					if not event.interrupted then
						FEButtonPanel1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel1:setLeftRight( 0, 0, 171, 510 )
					FEButtonPanel1:setTopBottom( 0, 0, 4, 82 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel1, event )
					else
						FEButtonPanel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( 0, 0, 171, 510 )
				self.FEButtonPanel1:setTopBottom( 0, 0, 4, 82 )
				FEButtonPanel1Frame2( FEButtonPanel1, {} )
				local RankBackgroundFrame2 = function ( RankBackground, event )
					if not event.interrupted then
						RankBackground:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankBackground:setLeftRight( 0, 0, 75, 162 )
					RankBackground:setTopBottom( 0, 0, 73, 105 )
					if event.interrupted then
						self.clipFinished( RankBackground, event )
					else
						RankBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankBackground:completeAnimation()
				self.RankBackground:setLeftRight( 0, 0, 75, 162 )
				self.RankBackground:setTopBottom( 0, 0, 73, 105 )
				RankBackgroundFrame2( RankBackground, {} )
				local RankFrame2 = function ( Rank, event )
					if not event.interrupted then
						Rank:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Rank:setLeftRight( 0, 0, 81, 115 )
					Rank:setTopBottom( 0, 0, 71, 107 )
					if event.interrupted then
						self.clipFinished( Rank, event )
					else
						Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:completeAnimation()
				self.Rank:setLeftRight( 0, 0, 81, 115 )
				self.Rank:setTopBottom( 0, 0, 71, 107 )
				RankFrame2( Rank, {} )
				local RankIconFrame2 = function ( RankIcon, event )
					if not event.interrupted then
						RankIcon:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankIcon:setLeftRight( 0, 0, 121, 154 )
					RankIcon:setTopBottom( 0, 0, 73, 105 )
					if event.interrupted then
						self.clipFinished( RankIcon, event )
					else
						RankIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( 0, 0, 121, 154 )
				self.RankIcon:setTopBottom( 0, 0, 73, 105 )
				RankIconFrame2( RankIcon, {} )
				StateRight:completeAnimation()
				self.StateRight:setLeftRight( 0, 0, 567, 607 )
				self.StateRight:setTopBottom( 0, 0, 21.5, 62.5 )
				self.clipFinished( StateRight, {} )
				local PregamePlayerName0Frame2 = function ( PregamePlayerName0, event )
					local PregamePlayerName0Frame3 = function ( PregamePlayerName0, event )
						if not event.interrupted then
							PregamePlayerName0:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
						end
						PregamePlayerName0:setLeftRight( 0, 0, 180, 510 )
						PregamePlayerName0:setTopBottom( 0, 0, 12, 48 )
						if event.interrupted then
							self.clipFinished( PregamePlayerName0, event )
						else
							PregamePlayerName0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PregamePlayerName0Frame3( PregamePlayerName0, event )
						return 
					else
						PregamePlayerName0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						PregamePlayerName0:setTopBottom( 0, 0, 20, 56 )
						PregamePlayerName0:registerEventHandler( "transition_complete_keyframe", PregamePlayerName0Frame3 )
					end
				end
				
				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( 0, 0, 180, 510 )
				self.PregamePlayerName0:setTopBottom( 0, 0, 22, 58 )
				PregamePlayerName0Frame2( PregamePlayerName0, {} )
				local pixelA0Frame2 = function ( pixelA0, event )
					if not event.interrupted then
						pixelA0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA0:setLeftRight( 0, 0, 499, 553 )
					pixelA0:setTopBottom( 0, 0, -1, 4 )
					if event.interrupted then
						self.clipFinished( pixelA0, event )
					else
						pixelA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA0:completeAnimation()
				self.pixelA0:setLeftRight( 0, 0, 499, 553 )
				self.pixelA0:setTopBottom( 0, 0, -1, 4 )
				pixelA0Frame2( pixelA0, {} )
				local ImageXFrame2 = function ( ImageX, event )
					if not event.interrupted then
						ImageX:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
					end
					ImageX:setLeftRight( 0, 0, 72, 160 )
					ImageX:setTopBottom( 0, 0, -2, 86 )
					ImageX:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImageX, event )
					else
						ImageX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImageX:completeAnimation()
				self.ImageX:setLeftRight( 0, 0, 72, 160 )
				self.ImageX:setTopBottom( 0, 0, -2, 86 )
				self.ImageX:setAlpha( 1 )
				ImageXFrame2( ImageX, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( 0, 0, 63, 87 )
					Image0:setTopBottom( 0, 0, 86, 104 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( 0, 0, 63, 87 )
				self.Image0:setTopBottom( 0, 0, 86, 104 )
				Image0Frame2( Image0, {} )
				local CharacterRenderFrame2 = function ( CharacterRender, event )
					if not event.interrupted then
						CharacterRender:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterRender:setLeftRight( 0, 0, 72, 163 )
					CharacterRender:setTopBottom( 0, 0, -1, 90 )
					CharacterRender:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CharacterRender, event )
					else
						CharacterRender:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterRender:completeAnimation()
				self.CharacterRender:setLeftRight( 0, 0, 72, 163 )
				self.CharacterRender:setTopBottom( 0, 0, -1, 90 )
				self.CharacterRender:setAlpha( 0 )
				CharacterRenderFrame2( CharacterRender, {} )
				local pixelA00Frame2 = function ( pixelA00, event )
					if not event.interrupted then
						pixelA00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA00:setLeftRight( 0, 0, 499, 553 )
					pixelA00:setTopBottom( 0, 0, 84, 89 )
					if event.interrupted then
						self.clipFinished( pixelA00, event )
					else
						pixelA00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA00:completeAnimation()
				self.pixelA00:setLeftRight( 0, 0, 499, 553 )
				self.pixelA00:setTopBottom( 0, 0, 84, 89 )
				pixelA00Frame2( pixelA00, {} )
				local Image00Frame2 = function ( Image00, event )
					if not event.interrupted then
						Image00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image00:setLeftRight( 0, 0, 63, 87 )
					Image00:setTopBottom( 0, 0, -17, 1 )
					if event.interrupted then
						self.clipFinished( Image00, event )
					else
						Image00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image00:completeAnimation()
				self.Image00:setLeftRight( 0, 0, 63, 87 )
				self.Image00:setTopBottom( 0, 0, -17, 1 )
				Image00Frame2( Image00, {} )
				local CharacterNameFrame2 = function ( CharacterName, event )
					if not event.interrupted then
						CharacterName:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterName:setLeftRight( 0, 0, 187.5, 329.5 )
					CharacterName:setTopBottom( 0, 0, 49.5, 76.5 )
					CharacterName:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterName, event )
					else
						CharacterName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( 0, 0, 187.5, 329.5 )
				self.CharacterName:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterName:setAlpha( 0 )
				CharacterNameFrame2( CharacterName, {} )
				local CharacterLoadoutFrame2 = function ( CharacterLoadout, event )
					if not event.interrupted then
						CharacterLoadout:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterLoadout:setLeftRight( 0, 0, 342, 484 )
					CharacterLoadout:setTopBottom( 0, 0, 49.5, 76.5 )
					CharacterLoadout:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterLoadout, event )
					else
						CharacterLoadout:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( 0, 0, 342, 484 )
				self.CharacterLoadout:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterLoadout:setAlpha( 0 )
				CharacterLoadoutFrame2( CharacterLoadout, {} )
				local LineB1Frame2 = function ( LineB1, event )
					if not event.interrupted then
						LineB1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB1:setLeftRight( 0, 0, 165, 519 )
					LineB1:setTopBottom( 0, 0, -1, 5 )
					if event.interrupted then
						self.clipFinished( LineB1, event )
					else
						LineB1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB1:completeAnimation()
				self.LineB1:setLeftRight( 0, 0, 165, 519 )
				self.LineB1:setTopBottom( 0, 0, -1, 5 )
				LineB1Frame2( LineB1, {} )
				local LineB00Frame2 = function ( LineB00, event )
					if not event.interrupted then
						LineB00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB00:setLeftRight( 0, 0, 165, 519 )
					LineB00:setTopBottom( 0, 0, 84, 90 )
					if event.interrupted then
						self.clipFinished( LineB00, event )
					else
						LineB00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB00:completeAnimation()
				self.LineB00:setLeftRight( 0, 0, 165, 519 )
				self.LineB00:setTopBottom( 0, 0, 84, 90 )
				LineB00Frame2( LineB00, {} )
				local pixelA01Frame2 = function ( pixelA01, event )
					if not event.interrupted then
						pixelA01:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA01:setLeftRight( 0, 0, 126, 180 )
					pixelA01:setTopBottom( 0, 0, 21, 26 )
					if event.interrupted then
						self.clipFinished( pixelA01, event )
					else
						pixelA01:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA01:completeAnimation()
				self.pixelA01:setLeftRight( 0, 0, 126, 180 )
				self.pixelA01:setTopBottom( 0, 0, 21, 26 )
				pixelA01Frame2( pixelA01, {} )
				local pixelA000Frame2 = function ( pixelA000, event )
					if not event.interrupted then
						pixelA000:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA000:setLeftRight( 0, 0, 126, 180 )
					pixelA000:setTopBottom( 0, 0, 60, 65 )
					if event.interrupted then
						self.clipFinished( pixelA000, event )
					else
						pixelA000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA000:completeAnimation()
				self.pixelA000:setLeftRight( 0, 0, 126, 180 )
				self.pixelA000:setTopBottom( 0, 0, 60, 65 )
				pixelA000Frame2( pixelA000, {} )
				SizeElement:completeAnimation()
				self.SizeElement:setLeftRight( 0, 0, 0, 638 )
				self.SizeElement:setTopBottom( 0, 0, 0, 86 )
				self.clipFinished( SizeElement, {} )
			end,
			CharacterDraftForced = function ()
				self.resetProperties()
				self:setupElementClipCounter( 19 )
				local FEButtonPanel1Frame2 = function ( FEButtonPanel1, event )
					if not event.interrupted then
						FEButtonPanel1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel1:setLeftRight( 0, 0, 171, 510 )
					FEButtonPanel1:setTopBottom( 0, 0, 4, 82 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel1, event )
					else
						FEButtonPanel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( 0, 0, 171, 510 )
				self.FEButtonPanel1:setTopBottom( 0, 0, 4, 82 )
				FEButtonPanel1Frame2( FEButtonPanel1, {} )
				local RankBackgroundFrame2 = function ( RankBackground, event )
					if not event.interrupted then
						RankBackground:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankBackground:setLeftRight( 0, 0, 75, 162 )
					RankBackground:setTopBottom( 0, 0, 73, 105 )
					if event.interrupted then
						self.clipFinished( RankBackground, event )
					else
						RankBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankBackground:completeAnimation()
				self.RankBackground:setLeftRight( 0, 0, 75, 162 )
				self.RankBackground:setTopBottom( 0, 0, 73, 105 )
				RankBackgroundFrame2( RankBackground, {} )
				local RankFrame2 = function ( Rank, event )
					if not event.interrupted then
						Rank:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Rank:setLeftRight( 0, 0, 81, 115 )
					Rank:setTopBottom( 0, 0, 71, 107 )
					if event.interrupted then
						self.clipFinished( Rank, event )
					else
						Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:completeAnimation()
				self.Rank:setLeftRight( 0, 0, 81, 115 )
				self.Rank:setTopBottom( 0, 0, 71, 107 )
				RankFrame2( Rank, {} )
				local RankIconFrame2 = function ( RankIcon, event )
					if not event.interrupted then
						RankIcon:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankIcon:setLeftRight( 0, 0, 121, 154 )
					RankIcon:setTopBottom( 0, 0, 73, 105 )
					if event.interrupted then
						self.clipFinished( RankIcon, event )
					else
						RankIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( 0, 0, 121, 154 )
				self.RankIcon:setTopBottom( 0, 0, 73, 105 )
				RankIconFrame2( RankIcon, {} )
				StateRight:completeAnimation()
				self.StateRight:setLeftRight( 0, 0, 567, 607 )
				self.StateRight:setTopBottom( 0, 0, 21.5, 62.5 )
				self.clipFinished( StateRight, {} )
				local PregamePlayerName0Frame2 = function ( PregamePlayerName0, event )
					local PregamePlayerName0Frame3 = function ( PregamePlayerName0, event )
						if not event.interrupted then
							PregamePlayerName0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						PregamePlayerName0:setLeftRight( 0, 0, 180, 510 )
						PregamePlayerName0:setTopBottom( 0, 0, 12, 48 )
						if event.interrupted then
							self.clipFinished( PregamePlayerName0, event )
						else
							PregamePlayerName0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PregamePlayerName0Frame3( PregamePlayerName0, event )
						return 
					else
						PregamePlayerName0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						PregamePlayerName0:setTopBottom( 0, 0, 20, 56 )
						PregamePlayerName0:registerEventHandler( "transition_complete_keyframe", PregamePlayerName0Frame3 )
					end
				end
				
				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( 0, 0, 180, 510 )
				self.PregamePlayerName0:setTopBottom( 0, 0, 22, 58 )
				PregamePlayerName0Frame2( PregamePlayerName0, {} )
				local pixelA0Frame2 = function ( pixelA0, event )
					if not event.interrupted then
						pixelA0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA0:setLeftRight( 0, 0, 499, 553 )
					pixelA0:setTopBottom( 0, 0, -1, 4 )
					if event.interrupted then
						self.clipFinished( pixelA0, event )
					else
						pixelA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA0:completeAnimation()
				self.pixelA0:setLeftRight( 0, 0, 499, 553 )
				self.pixelA0:setTopBottom( 0, 0, -1, 4 )
				pixelA0Frame2( pixelA0, {} )
				local ImageXFrame2 = function ( ImageX, event )
					if not event.interrupted then
						ImageX:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
					end
					ImageX:setLeftRight( 0, 0, 72, 160 )
					ImageX:setTopBottom( 0, 0, -2, 86 )
					ImageX:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImageX, event )
					else
						ImageX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImageX:completeAnimation()
				self.ImageX:setLeftRight( 0, 0, 72, 160 )
				self.ImageX:setTopBottom( 0, 0, -2, 86 )
				self.ImageX:setAlpha( 1 )
				ImageXFrame2( ImageX, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( 0, 0, 63, 87 )
					Image0:setTopBottom( 0, 0, 86, 104 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( 0, 0, 63, 87 )
				self.Image0:setTopBottom( 0, 0, 86, 104 )
				Image0Frame2( Image0, {} )
				local CharacterRenderFrame2 = function ( CharacterRender, event )
					if not event.interrupted then
						CharacterRender:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterRender:setLeftRight( 0, 0, 72, 163 )
					CharacterRender:setTopBottom( 0, 0, -1, 90 )
					CharacterRender:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CharacterRender, event )
					else
						CharacterRender:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterRender:completeAnimation()
				self.CharacterRender:setLeftRight( 0, 0, 72, 163 )
				self.CharacterRender:setTopBottom( 0, 0, -1, 90 )
				self.CharacterRender:setAlpha( 0 )
				CharacterRenderFrame2( CharacterRender, {} )
				local pixelA00Frame2 = function ( pixelA00, event )
					if not event.interrupted then
						pixelA00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA00:setLeftRight( 0, 0, 499, 553 )
					pixelA00:setTopBottom( 0, 0, 84, 89 )
					if event.interrupted then
						self.clipFinished( pixelA00, event )
					else
						pixelA00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA00:completeAnimation()
				self.pixelA00:setLeftRight( 0, 0, 499, 553 )
				self.pixelA00:setTopBottom( 0, 0, 84, 89 )
				pixelA00Frame2( pixelA00, {} )
				local Image00Frame2 = function ( Image00, event )
					if not event.interrupted then
						Image00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image00:setLeftRight( 0, 0, 63, 87 )
					Image00:setTopBottom( 0, 0, -17, 1 )
					if event.interrupted then
						self.clipFinished( Image00, event )
					else
						Image00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image00:completeAnimation()
				self.Image00:setLeftRight( 0, 0, 63, 87 )
				self.Image00:setTopBottom( 0, 0, -17, 1 )
				Image00Frame2( Image00, {} )
				local CharacterNameFrame2 = function ( CharacterName, event )
					if not event.interrupted then
						CharacterName:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterName:setLeftRight( 0, 0, 187.5, 329.5 )
					CharacterName:setTopBottom( 0, 0, 49.5, 76.5 )
					CharacterName:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterName, event )
					else
						CharacterName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( 0, 0, 187.5, 329.5 )
				self.CharacterName:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterName:setAlpha( 0 )
				CharacterNameFrame2( CharacterName, {} )
				local CharacterLoadoutFrame2 = function ( CharacterLoadout, event )
					if not event.interrupted then
						CharacterLoadout:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterLoadout:setLeftRight( 0, 0, 342, 484 )
					CharacterLoadout:setTopBottom( 0, 0, 49.5, 76.5 )
					CharacterLoadout:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterLoadout, event )
					else
						CharacterLoadout:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( 0, 0, 342, 484 )
				self.CharacterLoadout:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterLoadout:setAlpha( 0 )
				CharacterLoadoutFrame2( CharacterLoadout, {} )
				local LineB1Frame2 = function ( LineB1, event )
					if not event.interrupted then
						LineB1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB1:setLeftRight( 0, 0, 165, 519 )
					LineB1:setTopBottom( 0, 0, -1, 5 )
					if event.interrupted then
						self.clipFinished( LineB1, event )
					else
						LineB1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB1:completeAnimation()
				self.LineB1:setLeftRight( 0, 0, 165, 519 )
				self.LineB1:setTopBottom( 0, 0, -1, 5 )
				LineB1Frame2( LineB1, {} )
				local LineB00Frame2 = function ( LineB00, event )
					if not event.interrupted then
						LineB00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB00:setLeftRight( 0, 0, 165, 519 )
					LineB00:setTopBottom( 0, 0, 84, 90 )
					if event.interrupted then
						self.clipFinished( LineB00, event )
					else
						LineB00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB00:completeAnimation()
				self.LineB00:setLeftRight( 0, 0, 165, 519 )
				self.LineB00:setTopBottom( 0, 0, 84, 90 )
				LineB00Frame2( LineB00, {} )
				local pixelA01Frame2 = function ( pixelA01, event )
					if not event.interrupted then
						pixelA01:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA01:setLeftRight( 0, 0, 126, 180 )
					pixelA01:setTopBottom( 0, 0, 21, 26 )
					if event.interrupted then
						self.clipFinished( pixelA01, event )
					else
						pixelA01:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA01:completeAnimation()
				self.pixelA01:setLeftRight( 0, 0, 126, 180 )
				self.pixelA01:setTopBottom( 0, 0, 21, 26 )
				pixelA01Frame2( pixelA01, {} )
				local pixelA000Frame2 = function ( pixelA000, event )
					if not event.interrupted then
						pixelA000:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA000:setLeftRight( 0, 0, 126, 180 )
					pixelA000:setTopBottom( 0, 0, 60, 65 )
					if event.interrupted then
						self.clipFinished( pixelA000, event )
					else
						pixelA000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA000:completeAnimation()
				self.pixelA000:setLeftRight( 0, 0, 126, 180 )
				self.pixelA000:setTopBottom( 0, 0, 60, 65 )
				pixelA000Frame2( pixelA000, {} )
				SizeElement:completeAnimation()
				self.SizeElement:setLeftRight( 0, 0, 0, 638 )
				self.SizeElement:setTopBottom( 0, 0, 0, 86 )
				self.clipFinished( SizeElement, {} )
			end
		},
		CharacterDraftSelected = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( 0, 0, 180, 510 )
				self.PregamePlayerName0:setTopBottom( 0, 0, 12, 48 )
				self.clipFinished( PregamePlayerName0, {} )
				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( 0, 0, 187.5, 329.5 )
				self.CharacterName:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterName:setAlpha( 0.75 )
				self.clipFinished( CharacterName, {} )
				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( 0, 0, 342, 484 )
				self.CharacterLoadout:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterLoadout:setAlpha( 0.75 )
				self.clipFinished( CharacterLoadout, {} )
			end
		},
		CACEdit = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( 0, 0, 180, 510 )
				self.PregamePlayerName0:setTopBottom( 0, 0, 12, 48 )
				self.clipFinished( PregamePlayerName0, {} )
				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( 0, 0, 187.5, 329.5 )
				self.CharacterName:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterName:setAlpha( 0.75 )
				self.clipFinished( CharacterName, {} )
				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( 0, 0, 342, 484 )
				self.CharacterLoadout:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterLoadout:setAlpha( 0.75 )
				self.clipFinished( CharacterLoadout, {} )
			end
		},
		StreakEdit = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( 0, 0, 180, 510 )
				self.PregamePlayerName0:setTopBottom( 0, 0, 12, 48 )
				self.clipFinished( PregamePlayerName0, {} )
				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( 0, 0, 187.5, 329.5 )
				self.CharacterName:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterName:setAlpha( 0.75 )
				self.clipFinished( CharacterName, {} )
				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( 0, 0, 342, 484 )
				self.CharacterLoadout:setTopBottom( 0, 0, 49.5, 76.5 )
				self.CharacterLoadout:setAlpha( 0.75 )
				self.clipFinished( CharacterLoadout, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ItemRestriction",
			condition = function ( menu, element, event )
				return ItemRestrictionVoteActive()
			end
		},
		{
			stateName = "CharacterDraft",
			condition = function ( menu, element, event )
				return CharacterDraftActive() and IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_IDLE )
			end
		},
		{
			stateName = "CharacterDraftSelecting",
			condition = function ( menu, element, event )
				return CharacterDraftActive() and IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING )
			end
		},
		{
			stateName = "CharacterDraftSelected",
			condition = function ( menu, element, event )
				return CharacterDraftActive()
			end
		},
		{
			stateName = "CACEdit",
			condition = function ( menu, element, event )
				return ItemRestrictionCACEditActive()
			end
		},
		{
			stateName = "StreakEdit",
			condition = function ( menu, element, event )
				return ItemRestrictionScorestreakEditActive()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:linkToElementModel( self, "clientState", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientState"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel1:close()
		self.RankBackground:close()
		self.StateLeft:close()
		self.StateRight:close()
		self.PregamePlayerName0:close()
		self.ImagePanel:close()
		self.ImageBorder:close()
		self.CharacterRender:close()
		self.IconControllerContainer:close()
		self.Rank:close()
		self.CharacterName:close()
		self.CharacterLoadout:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

