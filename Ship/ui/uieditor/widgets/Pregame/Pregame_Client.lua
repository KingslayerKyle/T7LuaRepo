-- d65d5dcc15ec1d8702725b278b42b18e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_StateIcon_Right" )
require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_StateIcon" )
require( "ui.uieditor.widgets.Pregame.Pregame_PlayerName" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_CharacterSelection" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.IconControllerContainer" )

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
	self:setLeftRight( true, false, 0, 425 )
	self:setTopBottom( true, false, 0, 57 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel1 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel1:setLeftRight( true, false, 114, 339.79 )
	FEButtonPanel1:setTopBottom( true, false, 2.5, 54.66 )
	FEButtonPanel1:setRGB( 0, 0, 0 )
	FEButtonPanel1:setAlpha( 0.7 )
	self:addElement( FEButtonPanel1 )
	self.FEButtonPanel1 = FEButtonPanel1
	
	local RankBackground = CoD.FE_ButtonPanel.new( menu, controller )
	RankBackground:setLeftRight( true, false, 50.21, 108 )
	RankBackground:setTopBottom( true, false, 49, 70 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( true, false, 53.9, 76.79 )
	Rank:setTopBottom( true, false, 47.05, 71.05 )
	Rank:setAlpha( 0 )
	Rank:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	Rank:linkToElementModel( self, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			Rank:setText( Engine.Localize( rank ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local RankIcon = LUI.UIImage.new()
	RankIcon:setLeftRight( true, false, 81, 103 )
	RankIcon:setTopBottom( true, false, 49, 70 )
	RankIcon:setAlpha( 0 )
	RankIcon:setImage( RegisterImage( "uie_t7_hud_arena_rank_1" ) )
	RankIcon:setupUIStreamedImage( 0 )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local StateLeft = CoD.Competitive_CharacterDraft_StateIcon_Right.new( menu, controller )
	StateLeft:setLeftRight( true, false, 0, 27 )
	StateLeft:setTopBottom( true, false, 15, 42 )
	StateLeft:linkToElementModel( self, nil, false, function ( model )
		StateLeft:setModel( model, controller )
	end )
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
	self:addElement( StateLeft )
	self.StateLeft = StateLeft
	
	local StateRight = CoD.Competitive_CharacterDraft_StateIcon.new( menu, controller )
	StateRight:setLeftRight( true, false, 378, 413 )
	StateRight:setTopBottom( true, false, 15, 42 )
	StateRight:linkToElementModel( self, nil, false, function ( model )
		StateRight:setModel( model, controller )
	end )
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
	self:addElement( StateRight )
	self.StateRight = StateRight
	
	local PregamePlayerName0 = CoD.Pregame_PlayerName.new( menu, controller )
	PregamePlayerName0:setLeftRight( true, false, 116, 337 )
	PregamePlayerName0:setTopBottom( true, false, 4, 28 )
	PregamePlayerName0:linkToElementModel( self, nil, false, function ( model )
		PregamePlayerName0:setModel( model, controller )
	end )
	PregamePlayerName0:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			PregamePlayerName0.ListHeader.btnDisplayTextStroke:setText( Engine.Localize( gamertag ) )
		end
	end )
	PregamePlayerName0:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			PregamePlayerName0.btnDisplayTextStroke:setText( Engine.Localize( gamertag ) )
		end
	end )
	self:addElement( PregamePlayerName0 )
	self.PregamePlayerName0 = PregamePlayerName0
	
	local ImagePanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	ImagePanel:setLeftRight( true, false, 50, 108 )
	ImagePanel:setTopBottom( true, false, 0, 57.66 )
	ImagePanel:setRGB( 0, 0, 0 )
	ImagePanel:setAlpha( 0.7 )
	self:addElement( ImagePanel )
	self.ImagePanel = ImagePanel
	
	local pixelA0 = LUI.UIImage.new()
	pixelA0:setLeftRight( true, false, 333, 369 )
	pixelA0:setTopBottom( true, false, -1, 2.5 )
	pixelA0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelA0 )
	self.pixelA0 = pixelA0
	
	local ImageX = LUI.UIImage.new()
	ImageX:setLeftRight( true, false, 50, 108.77 )
	ImageX:setTopBottom( true, false, -0.4, 58.37 )
	ImageX:setAlpha( 0 )
	ImageX:setImage( RegisterImage( "uie_t7_menu_frontend_slidex" ) )
	ImageX:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImageX )
	self.ImageX = ImageX
	
	local ImageBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder:setLeftRight( true, false, 50, 108 )
	ImageBorder:setTopBottom( true, false, 0, 57.37 )
	self:addElement( ImageBorder )
	self.ImageBorder = ImageBorder
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 41.71, 57.71 )
	Image0:setTopBottom( true, false, 57.5, 69.5 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_buttonsseparate" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local CharacterRender = CoD.Competitive_CharacterDraft_CharacterSelection.new( menu, controller )
	CharacterRender:setLeftRight( true, false, 47.71, 108.5 )
	CharacterRender:setTopBottom( true, false, -0.4, 60.4 )
	CharacterRender:linkToElementModel( self, nil, false, function ( model )
		CharacterRender:setModel( model, controller )
	end )
	self:addElement( CharacterRender )
	self.CharacterRender = CharacterRender
	
	local pixelA00 = LUI.UIImage.new()
	pixelA00:setLeftRight( true, false, 333, 369 )
	pixelA00:setTopBottom( true, false, 56, 59.5 )
	pixelA00:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelA00 )
	self.pixelA00 = pixelA00
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, 41.71, 57.71 )
	Image00:setTopBottom( true, false, -11, 1 )
	Image00:setImage( RegisterImage( "uie_t7_menu_frontend_buttonsseparate" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local CharacterName = LUI.UITightText.new()
	CharacterName:setLeftRight( true, false, 121, 187 )
	CharacterName:setTopBottom( true, false, 30, 50 )
	CharacterName:setAlpha( 0.7 )
	CharacterName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CharacterName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	CharacterName:setShaderVector( 0, 0.02, 0, 0, 0 )
	CharacterName:setShaderVector( 1, 0.06, 0, 0, 0 )
	CharacterName:setShaderVector( 2, 1, 0, 0, 0 )
	CharacterName:setLetterSpacing( 0.2 )
	CharacterName:linkToElementModel( self, "characterName", true, function ( model )
		local characterName = Engine.GetModelValue( model )
		if characterName then
			CharacterName:setText( Engine.Localize( characterName ) )
		end
	end )
	self:addElement( CharacterName )
	self.CharacterName = CharacterName
	
	local CharacterLoadout = LUI.UITightText.new()
	CharacterLoadout:setLeftRight( true, false, 185.21, 337 )
	CharacterLoadout:setTopBottom( true, false, 30, 50 )
	CharacterLoadout:setAlpha( 0.7 )
	CharacterLoadout:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CharacterLoadout:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	CharacterLoadout:setShaderVector( 0, 0.03, 0, 0, 0 )
	CharacterLoadout:setShaderVector( 1, 0.06, 0, 0, 0 )
	CharacterLoadout:setShaderVector( 2, 1, 0, 0, 0 )
	CharacterLoadout:setLetterSpacing( 0.2 )
	CharacterLoadout:linkToElementModel( self, "characterLoadoutName", true, function ( model )
		local characterLoadoutName = Engine.GetModelValue( model )
		if characterLoadoutName then
			CharacterLoadout:setText( Engine.Localize( characterLoadoutName ) )
		end
	end )
	self:addElement( CharacterLoadout )
	self.CharacterLoadout = CharacterLoadout
	
	local LineB1 = LUI.UIImage.new()
	LineB1:setLeftRight( true, false, 110, 346 )
	LineB1:setTopBottom( true, false, -1, 3 )
	LineB1:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB1 )
	self.LineB1 = LineB1
	
	local LineB00 = LUI.UIImage.new()
	LineB00:setLeftRight( true, false, 110, 346 )
	LineB00:setTopBottom( true, false, 56, 60 )
	LineB00:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB00 )
	self.LineB00 = LineB00
	
	local pixelA01 = LUI.UIImage.new()
	pixelA01:setLeftRight( true, false, 84, 120 )
	pixelA01:setTopBottom( true, false, 14, 17.5 )
	pixelA01:setAlpha( 0 )
	pixelA01:setZRot( 180 )
	pixelA01:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA01:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelA01 )
	self.pixelA01 = pixelA01
	
	local pixelA000 = LUI.UIImage.new()
	pixelA000:setLeftRight( true, false, 84, 120 )
	pixelA000:setTopBottom( true, false, 40, 43.5 )
	pixelA000:setAlpha( 0 )
	pixelA000:setZRot( 180 )
	pixelA000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA000:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelA000 )
	self.pixelA000 = pixelA000
	
	local SizeElement = LUI.UIImage.new()
	SizeElement:setLeftRight( true, false, 297, 425 )
	SizeElement:setTopBottom( true, false, 0, 57 )
	SizeElement:setAlpha( 0 )
	self:addElement( SizeElement )
	self.SizeElement = SizeElement
	
	local IconControllerContainer = CoD.IconControllerContainer.new( menu, controller )
	IconControllerContainer:setLeftRight( true, false, -3, 54 )
	IconControllerContainer:setTopBottom( true, false, 12.5, 44.5 )
	IconControllerContainer:setRGB( 0.74, 0.78, 0.79 )
	IconControllerContainer:linkToElementModel( self, nil, false, function ( model )
		IconControllerContainer:setModel( model, controller )
	end )
	self:addElement( IconControllerContainer )
	self.IconControllerContainer = IconControllerContainer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		ItemRestriction = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			CharacterDraft = function ()
				self:setupElementClipCounter( 18 )

				local FEButtonPanel1Frame2 = function ( FEButtonPanel1, event )
					if not event.interrupted then
						FEButtonPanel1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel1:setLeftRight( true, false, 72, 339.79 )
					FEButtonPanel1:setTopBottom( true, false, 15.75, 43 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel1, event )
					else
						FEButtonPanel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( true, false, 72, 339.79 )
				self.FEButtonPanel1:setTopBottom( true, false, 15.75, 43 )
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
					Rank:setLeftRight( true, false, 46, 74.9 )
					Rank:setTopBottom( true, false, 23.27, 47.25 )
					if event.interrupted then
						self.clipFinished( Rank, event )
					else
						Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:completeAnimation()
				self.Rank:setLeftRight( true, false, 46, 74.9 )
				self.Rank:setTopBottom( true, false, 23.27, 47.25 )
				RankFrame2( Rank, {} )
				local RankIconFrame2 = function ( RankIcon, event )
					if not event.interrupted then
						RankIcon:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					RankIcon:setLeftRight( true, false, 78.9, 102.4 )
					RankIcon:setTopBottom( true, false, 23.75, 47.25 )
					if event.interrupted then
						self.clipFinished( RankIcon, event )
					else
						RankIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( true, false, 78.9, 102.4 )
				self.RankIcon:setTopBottom( true, false, 23.75, 47.25 )
				RankIconFrame2( RankIcon, {} )
				local PregamePlayerName0Frame2 = function ( PregamePlayerName0, event )
					if not event.interrupted then
						PregamePlayerName0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					PregamePlayerName0:setLeftRight( true, false, 78.1, 337 )
					PregamePlayerName0:setTopBottom( true, false, 18, 38 )
					if event.interrupted then
						self.clipFinished( PregamePlayerName0, event )
					else
						PregamePlayerName0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( true, false, 78.1, 337 )
				self.PregamePlayerName0:setTopBottom( true, false, 18, 38 )
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
					pixelA0:setLeftRight( true, false, 333, 369 )
					pixelA0:setTopBottom( true, false, 14, 17.5 )
					if event.interrupted then
						self.clipFinished( pixelA0, event )
					else
						pixelA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA0:completeAnimation()
				self.pixelA0:setLeftRight( true, false, 333, 369 )
				self.pixelA0:setTopBottom( true, false, 14, 17.5 )
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
					pixelA00:setLeftRight( true, false, 333, 369 )
					pixelA00:setTopBottom( true, false, 41, 44.5 )
					if event.interrupted then
						self.clipFinished( pixelA00, event )
					else
						pixelA00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA00:completeAnimation()
				self.pixelA00:setLeftRight( true, false, 333, 369 )
				self.pixelA00:setTopBottom( true, false, 41, 44.5 )
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
					LineB1:setLeftRight( true, false, 72, 346 )
					LineB1:setTopBottom( true, false, 14, 18 )
					if event.interrupted then
						self.clipFinished( LineB1, event )
					else
						LineB1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB1:completeAnimation()
				self.LineB1:setLeftRight( true, false, 72, 346 )
				self.LineB1:setTopBottom( true, false, 14, 18 )
				LineB1Frame2( LineB1, {} )
				local LineB00Frame2 = function ( LineB00, event )
					if not event.interrupted then
						LineB00:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					LineB00:setLeftRight( true, false, 72, 346 )
					LineB00:setTopBottom( true, false, 41, 45 )
					if event.interrupted then
						self.clipFinished( LineB00, event )
					else
						LineB00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB00:completeAnimation()
				self.LineB00:setLeftRight( true, false, 72, 346 )
				self.LineB00:setTopBottom( true, false, 41, 45 )
				LineB00Frame2( LineB00, {} )
				local pixelA01Frame2 = function ( pixelA01, event )
					if not event.interrupted then
						pixelA01:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					pixelA01:setLeftRight( true, false, 44, 80 )
					pixelA01:setTopBottom( true, false, 14, 17.5 )
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
				self.pixelA01:setLeftRight( true, false, 44, 80 )
				self.pixelA01:setTopBottom( true, false, 14, 17.5 )
				self.pixelA01:setAlpha( 1 )
				self.pixelA01:setXRot( 0 )
				self.pixelA01:setYRot( 0 )
				self.pixelA01:setZRot( 180 )
				pixelA01Frame2( pixelA01, {} )
				local pixelA000Frame2 = function ( pixelA000, event )
					if not event.interrupted then
						pixelA000:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					pixelA000:setLeftRight( true, false, 44, 80 )
					pixelA000:setTopBottom( true, false, 40, 43.5 )
					pixelA000:setAlpha( 1 )
					pixelA000:setZRot( 180 )
					if event.interrupted then
						self.clipFinished( pixelA000, event )
					else
						pixelA000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA000:completeAnimation()
				self.pixelA000:setLeftRight( true, false, 44, 80 )
				self.pixelA000:setTopBottom( true, false, 40, 43.5 )
				self.pixelA000:setAlpha( 1 )
				self.pixelA000:setZRot( 180 )
				pixelA000Frame2( pixelA000, {} )
				local SizeElementFrame2 = function ( SizeElement, event )
					if not event.interrupted then
						SizeElement:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					SizeElement:setLeftRight( true, false, 0, 425 )
					SizeElement:setTopBottom( true, false, 11, 45 )
					if event.interrupted then
						self.clipFinished( SizeElement, event )
					else
						SizeElement:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SizeElement:completeAnimation()
				self.SizeElement:setLeftRight( true, false, 0, 425 )
				self.SizeElement:setTopBottom( true, false, 11, 45 )
				SizeElementFrame2( SizeElement, {} )
			end
		},
		CharacterDraft = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )

				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( true, false, 114, 339.79 )
				self.FEButtonPanel1:setTopBottom( true, false, 2.5, 54.66 )
				self.clipFinished( FEButtonPanel1, {} )

				RankBackground:completeAnimation()
				self.RankBackground:setLeftRight( true, false, 50.21, 108 )
				self.RankBackground:setTopBottom( true, false, 49, 70 )
				self.clipFinished( RankBackground, {} )

				Rank:completeAnimation()
				self.Rank:setLeftRight( true, false, 53.9, 76.79 )
				self.Rank:setTopBottom( true, false, 47.05, 71.05 )
				self.clipFinished( Rank, {} )

				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( true, false, 81, 103 )
				self.RankIcon:setTopBottom( true, false, 49, 70 )
				self.clipFinished( RankIcon, {} )

				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( true, false, 120, 339.79 )
				self.PregamePlayerName0:setTopBottom( true, false, 15.08, 38.58 )
				self.clipFinished( PregamePlayerName0, {} )

				pixelA0:completeAnimation()
				self.pixelA0:setLeftRight( true, false, 333, 369 )
				self.pixelA0:setTopBottom( true, false, -1, 2.5 )
				self.clipFinished( pixelA0, {} )

				ImageX:completeAnimation()
				self.ImageX:setAlpha( 1 )
				self.clipFinished( ImageX, {} )

				ImageBorder:completeAnimation()
				self.ImageBorder:setLeftRight( true, false, 50, 108 )
				self.ImageBorder:setTopBottom( true, false, 0, 57.37 )
				self.clipFinished( ImageBorder, {} )

				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 41.71, 57.71 )
				self.Image0:setTopBottom( true, false, 57.5, 69.5 )
				self.clipFinished( Image0, {} )

				CharacterRender:completeAnimation()
				self.CharacterRender:setLeftRight( true, false, 47.71, 108.5 )
				self.CharacterRender:setTopBottom( true, false, -0.4, 60.4 )
				self.CharacterRender:setAlpha( 0 )
				self.clipFinished( CharacterRender, {} )

				pixelA00:completeAnimation()
				self.pixelA00:setLeftRight( true, false, 333, 369 )
				self.pixelA00:setTopBottom( true, false, 56, 59.5 )
				self.clipFinished( pixelA00, {} )

				Image00:completeAnimation()
				self.Image00:setLeftRight( true, false, 41.71, 57.71 )
				self.Image00:setTopBottom( true, false, -11, 1 )
				self.clipFinished( Image00, {} )

				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( true, false, 125, 220 )
				self.CharacterName:setTopBottom( true, false, 33, 51 )
				self.CharacterName:setAlpha( 0 )
				self.clipFinished( CharacterName, {} )

				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( true, false, 228, 323 )
				self.CharacterLoadout:setTopBottom( true, false, 33, 51 )
				self.CharacterLoadout:setAlpha( 0 )
				self.clipFinished( CharacterLoadout, {} )

				LineB1:completeAnimation()
				self.LineB1:setLeftRight( true, false, 110, 346 )
				self.LineB1:setTopBottom( true, false, -1, 3 )
				self.clipFinished( LineB1, {} )

				LineB00:completeAnimation()
				self.LineB00:setLeftRight( true, false, 110, 346 )
				self.LineB00:setTopBottom( true, false, 56, 60 )
				self.clipFinished( LineB00, {} )

				pixelA01:completeAnimation()
				self.pixelA01:setLeftRight( true, false, 84, 120 )
				self.pixelA01:setTopBottom( true, false, 14, 17.5 )
				self.clipFinished( pixelA01, {} )

				pixelA000:completeAnimation()
				self.pixelA000:setLeftRight( true, false, 84, 120 )
				self.pixelA000:setTopBottom( true, false, 40, 43.5 )
				self.clipFinished( pixelA000, {} )

				SizeElement:completeAnimation()
				self.SizeElement:setLeftRight( true, false, 0, 425 )
				self.SizeElement:setTopBottom( true, false, 0, 57 )
				self.clipFinished( SizeElement, {} )
			end,
			CharacterDraftSelected = function ()
				self:setupElementClipCounter( 21 )

				local FEButtonPanel1Frame2 = function ( FEButtonPanel1, event )
					if not event.interrupted then
						FEButtonPanel1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel1:setLeftRight( true, false, 114, 339.79 )
					FEButtonPanel1:setTopBottom( true, false, 2.5, 54.66 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel1, event )
					else
						FEButtonPanel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( true, false, 114, 339.79 )
				self.FEButtonPanel1:setTopBottom( true, false, 2.5, 54.66 )
				FEButtonPanel1Frame2( FEButtonPanel1, {} )
				local RankBackgroundFrame2 = function ( RankBackground, event )
					if not event.interrupted then
						RankBackground:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankBackground:setLeftRight( true, false, 50.21, 108 )
					RankBackground:setTopBottom( true, false, 49, 70 )
					if event.interrupted then
						self.clipFinished( RankBackground, event )
					else
						RankBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankBackground:completeAnimation()
				self.RankBackground:setLeftRight( true, false, 50.21, 108 )
				self.RankBackground:setTopBottom( true, false, 49, 70 )
				RankBackgroundFrame2( RankBackground, {} )
				local RankFrame2 = function ( Rank, event )
					if not event.interrupted then
						Rank:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Rank:setLeftRight( true, false, 53.9, 76.79 )
					Rank:setTopBottom( true, false, 47.05, 71.05 )
					if event.interrupted then
						self.clipFinished( Rank, event )
					else
						Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:completeAnimation()
				self.Rank:setLeftRight( true, false, 53.9, 76.79 )
				self.Rank:setTopBottom( true, false, 47.05, 71.05 )
				RankFrame2( Rank, {} )
				local RankIconFrame2 = function ( RankIcon, event )
					if not event.interrupted then
						RankIcon:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankIcon:setLeftRight( true, false, 81, 103 )
					RankIcon:setTopBottom( true, false, 49, 70 )
					if event.interrupted then
						self.clipFinished( RankIcon, event )
					else
						RankIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( true, false, 81, 103 )
				self.RankIcon:setTopBottom( true, false, 49, 70 )
				RankIconFrame2( RankIcon, {} )

				StateLeft:completeAnimation()
				self.StateLeft:setLeftRight( true, false, 0, 27 )
				self.StateLeft:setTopBottom( true, false, 15, 42 )
				self.StateLeft:setAlpha( 1 )
				self.clipFinished( StateLeft, {} )

				StateRight:completeAnimation()
				self.StateRight:setLeftRight( true, false, 378, 405 )
				self.StateRight:setTopBottom( true, false, 14.49, 41.49 )
				self.StateRight:setAlpha( 1 )
				self.clipFinished( StateRight, {} )
				local PregamePlayerName0Frame2 = function ( PregamePlayerName0, event )
					local PregamePlayerName0Frame3 = function ( PregamePlayerName0, event )
						if not event.interrupted then
							PregamePlayerName0:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
						end
						PregamePlayerName0:setLeftRight( true, false, 120, 339.79 )
						PregamePlayerName0:setTopBottom( true, false, 8, 32 )
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
						PregamePlayerName0:setTopBottom( true, false, 13, 37 )
						PregamePlayerName0:registerEventHandler( "transition_complete_keyframe", PregamePlayerName0Frame3 )
					end
				end
				
				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( true, false, 120, 339.79 )
				self.PregamePlayerName0:setTopBottom( true, false, 15, 39 )
				PregamePlayerName0Frame2( PregamePlayerName0, {} )
				local pixelA0Frame2 = function ( pixelA0, event )
					if not event.interrupted then
						pixelA0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA0:setLeftRight( true, false, 333, 369 )
					pixelA0:setTopBottom( true, false, -1, 2.5 )
					if event.interrupted then
						self.clipFinished( pixelA0, event )
					else
						pixelA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA0:completeAnimation()
				self.pixelA0:setLeftRight( true, false, 333, 369 )
				self.pixelA0:setTopBottom( true, false, -1, 2.5 )
				pixelA0Frame2( pixelA0, {} )
				local ImageXFrame2 = function ( ImageX, event )
					if not event.interrupted then
						ImageX:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
					end
					ImageX:setLeftRight( true, false, 48, 106.77 )
					ImageX:setTopBottom( true, false, -1.4, 57.37 )
					ImageX:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImageX, event )
					else
						ImageX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImageX:completeAnimation()
				self.ImageX:setLeftRight( true, false, 48, 106.77 )
				self.ImageX:setTopBottom( true, false, -1.4, 57.37 )
				self.ImageX:setAlpha( 1 )
				ImageXFrame2( ImageX, {} )

				ImageBorder:completeAnimation()
				self.ImageBorder:setLeftRight( true, false, 50, 108 )
				self.ImageBorder:setTopBottom( true, false, 0, 57.37 )
				self.clipFinished( ImageBorder, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( true, false, 41.71, 57.71 )
					Image0:setTopBottom( true, false, 57.5, 69.5 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 41.71, 57.71 )
				self.Image0:setTopBottom( true, false, 57.5, 69.5 )
				Image0Frame2( Image0, {} )
				local CharacterRenderFrame2 = function ( CharacterRender, event )
					if not event.interrupted then
						CharacterRender:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterRender:setLeftRight( true, false, 47.71, 108.5 )
					CharacterRender:setTopBottom( true, false, -0.4, 60.4 )
					CharacterRender:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CharacterRender, event )
					else
						CharacterRender:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterRender:completeAnimation()
				self.CharacterRender:setLeftRight( true, false, 47.71, 108.5 )
				self.CharacterRender:setTopBottom( true, false, -0.4, 60.4 )
				self.CharacterRender:setAlpha( 0 )
				CharacterRenderFrame2( CharacterRender, {} )
				local pixelA00Frame2 = function ( pixelA00, event )
					if not event.interrupted then
						pixelA00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA00:setLeftRight( true, false, 333, 369 )
					pixelA00:setTopBottom( true, false, 56, 59.5 )
					if event.interrupted then
						self.clipFinished( pixelA00, event )
					else
						pixelA00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA00:completeAnimation()
				self.pixelA00:setLeftRight( true, false, 333, 369 )
				self.pixelA00:setTopBottom( true, false, 56, 59.5 )
				pixelA00Frame2( pixelA00, {} )
				local Image00Frame2 = function ( Image00, event )
					if not event.interrupted then
						Image00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image00:setLeftRight( true, false, 41.71, 57.71 )
					Image00:setTopBottom( true, false, -11, 1 )
					if event.interrupted then
						self.clipFinished( Image00, event )
					else
						Image00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image00:completeAnimation()
				self.Image00:setLeftRight( true, false, 41.71, 57.71 )
				self.Image00:setTopBottom( true, false, -11, 1 )
				Image00Frame2( Image00, {} )
				local CharacterNameFrame2 = function ( CharacterName, event )
					if not event.interrupted then
						CharacterName:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterName:setLeftRight( true, false, 125, 220 )
					CharacterName:setTopBottom( true, false, 33, 51 )
					CharacterName:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterName, event )
					else
						CharacterName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( true, false, 125, 220 )
				self.CharacterName:setTopBottom( true, false, 33, 51 )
				self.CharacterName:setAlpha( 0 )
				CharacterNameFrame2( CharacterName, {} )
				local CharacterLoadoutFrame2 = function ( CharacterLoadout, event )
					if not event.interrupted then
						CharacterLoadout:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterLoadout:setLeftRight( true, false, 228, 323 )
					CharacterLoadout:setTopBottom( true, false, 33, 51 )
					CharacterLoadout:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterLoadout, event )
					else
						CharacterLoadout:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( true, false, 228, 323 )
				self.CharacterLoadout:setTopBottom( true, false, 33, 51 )
				self.CharacterLoadout:setAlpha( 0 )
				CharacterLoadoutFrame2( CharacterLoadout, {} )
				local LineB1Frame2 = function ( LineB1, event )
					if not event.interrupted then
						LineB1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB1:setLeftRight( true, false, 110, 346 )
					LineB1:setTopBottom( true, false, -1, 3 )
					if event.interrupted then
						self.clipFinished( LineB1, event )
					else
						LineB1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB1:completeAnimation()
				self.LineB1:setLeftRight( true, false, 110, 346 )
				self.LineB1:setTopBottom( true, false, -1, 3 )
				LineB1Frame2( LineB1, {} )
				local LineB00Frame2 = function ( LineB00, event )
					if not event.interrupted then
						LineB00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB00:setLeftRight( true, false, 110, 346 )
					LineB00:setTopBottom( true, false, 56, 60 )
					if event.interrupted then
						self.clipFinished( LineB00, event )
					else
						LineB00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB00:completeAnimation()
				self.LineB00:setLeftRight( true, false, 110, 346 )
				self.LineB00:setTopBottom( true, false, 56, 60 )
				LineB00Frame2( LineB00, {} )
				local pixelA01Frame2 = function ( pixelA01, event )
					if not event.interrupted then
						pixelA01:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA01:setLeftRight( true, false, 84, 120 )
					pixelA01:setTopBottom( true, false, 14, 17.5 )
					if event.interrupted then
						self.clipFinished( pixelA01, event )
					else
						pixelA01:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA01:completeAnimation()
				self.pixelA01:setLeftRight( true, false, 84, 120 )
				self.pixelA01:setTopBottom( true, false, 14, 17.5 )
				pixelA01Frame2( pixelA01, {} )
				local pixelA000Frame2 = function ( pixelA000, event )
					if not event.interrupted then
						pixelA000:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA000:setLeftRight( true, false, 84, 120 )
					pixelA000:setTopBottom( true, false, 40, 43.5 )
					if event.interrupted then
						self.clipFinished( pixelA000, event )
					else
						pixelA000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA000:completeAnimation()
				self.pixelA000:setLeftRight( true, false, 84, 120 )
				self.pixelA000:setTopBottom( true, false, 40, 43.5 )
				pixelA000Frame2( pixelA000, {} )

				SizeElement:completeAnimation()
				self.SizeElement:setLeftRight( true, false, 0, 425 )
				self.SizeElement:setTopBottom( true, false, 0, 57 )
				self.clipFinished( SizeElement, {} )
			end,
			CharacterDraftForced = function ()
				self:setupElementClipCounter( 21 )

				local FEButtonPanel1Frame2 = function ( FEButtonPanel1, event )
					if not event.interrupted then
						FEButtonPanel1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel1:setLeftRight( true, false, 114, 339.79 )
					FEButtonPanel1:setTopBottom( true, false, 2.5, 54.66 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel1, event )
					else
						FEButtonPanel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( true, false, 114, 339.79 )
				self.FEButtonPanel1:setTopBottom( true, false, 2.5, 54.66 )
				FEButtonPanel1Frame2( FEButtonPanel1, {} )
				local RankBackgroundFrame2 = function ( RankBackground, event )
					if not event.interrupted then
						RankBackground:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankBackground:setLeftRight( true, false, 50.21, 108 )
					RankBackground:setTopBottom( true, false, 49, 70 )
					if event.interrupted then
						self.clipFinished( RankBackground, event )
					else
						RankBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankBackground:completeAnimation()
				self.RankBackground:setLeftRight( true, false, 50.21, 108 )
				self.RankBackground:setTopBottom( true, false, 49, 70 )
				RankBackgroundFrame2( RankBackground, {} )
				local RankFrame2 = function ( Rank, event )
					if not event.interrupted then
						Rank:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Rank:setLeftRight( true, false, 53.9, 76.79 )
					Rank:setTopBottom( true, false, 47.05, 71.05 )
					if event.interrupted then
						self.clipFinished( Rank, event )
					else
						Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:completeAnimation()
				self.Rank:setLeftRight( true, false, 53.9, 76.79 )
				self.Rank:setTopBottom( true, false, 47.05, 71.05 )
				RankFrame2( Rank, {} )
				local RankIconFrame2 = function ( RankIcon, event )
					if not event.interrupted then
						RankIcon:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankIcon:setLeftRight( true, false, 81, 103 )
					RankIcon:setTopBottom( true, false, 49, 70 )
					if event.interrupted then
						self.clipFinished( RankIcon, event )
					else
						RankIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( true, false, 81, 103 )
				self.RankIcon:setTopBottom( true, false, 49, 70 )
				RankIconFrame2( RankIcon, {} )

				StateLeft:completeAnimation()
				self.StateLeft:setLeftRight( true, false, 0, 27 )
				self.StateLeft:setTopBottom( true, false, 15, 42 )
				self.StateLeft:setAlpha( 1 )
				self.clipFinished( StateLeft, {} )

				StateRight:completeAnimation()
				self.StateRight:setLeftRight( true, false, 378, 405 )
				self.StateRight:setTopBottom( true, false, 14.49, 41.49 )
				self.StateRight:setAlpha( 1 )
				self.clipFinished( StateRight, {} )
				local PregamePlayerName0Frame2 = function ( PregamePlayerName0, event )
					local PregamePlayerName0Frame3 = function ( PregamePlayerName0, event )
						if not event.interrupted then
							PregamePlayerName0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						PregamePlayerName0:setLeftRight( true, false, 120, 339.79 )
						PregamePlayerName0:setTopBottom( true, false, 8, 32 )
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
						PregamePlayerName0:setTopBottom( true, false, 13, 37 )
						PregamePlayerName0:registerEventHandler( "transition_complete_keyframe", PregamePlayerName0Frame3 )
					end
				end
				
				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( true, false, 120, 339.79 )
				self.PregamePlayerName0:setTopBottom( true, false, 15, 39 )
				PregamePlayerName0Frame2( PregamePlayerName0, {} )
				local pixelA0Frame2 = function ( pixelA0, event )
					if not event.interrupted then
						pixelA0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA0:setLeftRight( true, false, 333, 369 )
					pixelA0:setTopBottom( true, false, -1, 2.5 )
					if event.interrupted then
						self.clipFinished( pixelA0, event )
					else
						pixelA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA0:completeAnimation()
				self.pixelA0:setLeftRight( true, false, 333, 369 )
				self.pixelA0:setTopBottom( true, false, -1, 2.5 )
				pixelA0Frame2( pixelA0, {} )
				local ImageXFrame2 = function ( ImageX, event )
					if not event.interrupted then
						ImageX:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
					end
					ImageX:setLeftRight( true, false, 48, 106.77 )
					ImageX:setTopBottom( true, false, -1.4, 57.37 )
					ImageX:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImageX, event )
					else
						ImageX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImageX:completeAnimation()
				self.ImageX:setLeftRight( true, false, 48, 106.77 )
				self.ImageX:setTopBottom( true, false, -1.4, 57.37 )
				self.ImageX:setAlpha( 1 )
				ImageXFrame2( ImageX, {} )

				ImageBorder:completeAnimation()
				self.ImageBorder:setLeftRight( true, false, 50, 108 )
				self.ImageBorder:setTopBottom( true, false, 0, 57.37 )
				self.clipFinished( ImageBorder, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( true, false, 41.71, 57.71 )
					Image0:setTopBottom( true, false, 57.5, 69.5 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 41.71, 57.71 )
				self.Image0:setTopBottom( true, false, 57.5, 69.5 )
				Image0Frame2( Image0, {} )
				local CharacterRenderFrame2 = function ( CharacterRender, event )
					if not event.interrupted then
						CharacterRender:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterRender:setLeftRight( true, false, 47.71, 108.5 )
					CharacterRender:setTopBottom( true, false, -0.4, 60.4 )
					CharacterRender:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CharacterRender, event )
					else
						CharacterRender:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterRender:completeAnimation()
				self.CharacterRender:setLeftRight( true, false, 47.71, 108.5 )
				self.CharacterRender:setTopBottom( true, false, -0.4, 60.4 )
				self.CharacterRender:setAlpha( 0 )
				CharacterRenderFrame2( CharacterRender, {} )
				local pixelA00Frame2 = function ( pixelA00, event )
					if not event.interrupted then
						pixelA00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA00:setLeftRight( true, false, 333, 369 )
					pixelA00:setTopBottom( true, false, 56, 59.5 )
					if event.interrupted then
						self.clipFinished( pixelA00, event )
					else
						pixelA00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA00:completeAnimation()
				self.pixelA00:setLeftRight( true, false, 333, 369 )
				self.pixelA00:setTopBottom( true, false, 56, 59.5 )
				pixelA00Frame2( pixelA00, {} )
				local Image00Frame2 = function ( Image00, event )
					if not event.interrupted then
						Image00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image00:setLeftRight( true, false, 41.71, 57.71 )
					Image00:setTopBottom( true, false, -11, 1 )
					if event.interrupted then
						self.clipFinished( Image00, event )
					else
						Image00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image00:completeAnimation()
				self.Image00:setLeftRight( true, false, 41.71, 57.71 )
				self.Image00:setTopBottom( true, false, -11, 1 )
				Image00Frame2( Image00, {} )
				local CharacterNameFrame2 = function ( CharacterName, event )
					if not event.interrupted then
						CharacterName:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterName:setLeftRight( true, false, 125, 220 )
					CharacterName:setTopBottom( true, false, 33, 51 )
					CharacterName:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterName, event )
					else
						CharacterName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( true, false, 125, 220 )
				self.CharacterName:setTopBottom( true, false, 33, 51 )
				self.CharacterName:setAlpha( 0 )
				CharacterNameFrame2( CharacterName, {} )
				local CharacterLoadoutFrame2 = function ( CharacterLoadout, event )
					if not event.interrupted then
						CharacterLoadout:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterLoadout:setLeftRight( true, false, 228, 323 )
					CharacterLoadout:setTopBottom( true, false, 33, 51 )
					CharacterLoadout:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterLoadout, event )
					else
						CharacterLoadout:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( true, false, 228, 323 )
				self.CharacterLoadout:setTopBottom( true, false, 33, 51 )
				self.CharacterLoadout:setAlpha( 0 )
				CharacterLoadoutFrame2( CharacterLoadout, {} )
				local LineB1Frame2 = function ( LineB1, event )
					if not event.interrupted then
						LineB1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB1:setLeftRight( true, false, 110, 346 )
					LineB1:setTopBottom( true, false, -1, 3 )
					if event.interrupted then
						self.clipFinished( LineB1, event )
					else
						LineB1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB1:completeAnimation()
				self.LineB1:setLeftRight( true, false, 110, 346 )
				self.LineB1:setTopBottom( true, false, -1, 3 )
				LineB1Frame2( LineB1, {} )
				local LineB00Frame2 = function ( LineB00, event )
					if not event.interrupted then
						LineB00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB00:setLeftRight( true, false, 110, 346 )
					LineB00:setTopBottom( true, false, 56, 60 )
					if event.interrupted then
						self.clipFinished( LineB00, event )
					else
						LineB00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB00:completeAnimation()
				self.LineB00:setLeftRight( true, false, 110, 346 )
				self.LineB00:setTopBottom( true, false, 56, 60 )
				LineB00Frame2( LineB00, {} )
				local pixelA01Frame2 = function ( pixelA01, event )
					if not event.interrupted then
						pixelA01:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA01:setLeftRight( true, false, 84, 120 )
					pixelA01:setTopBottom( true, false, 14, 17.5 )
					if event.interrupted then
						self.clipFinished( pixelA01, event )
					else
						pixelA01:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA01:completeAnimation()
				self.pixelA01:setLeftRight( true, false, 84, 120 )
				self.pixelA01:setTopBottom( true, false, 14, 17.5 )
				pixelA01Frame2( pixelA01, {} )
				local pixelA000Frame2 = function ( pixelA000, event )
					if not event.interrupted then
						pixelA000:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA000:setLeftRight( true, false, 84, 120 )
					pixelA000:setTopBottom( true, false, 40, 43.5 )
					if event.interrupted then
						self.clipFinished( pixelA000, event )
					else
						pixelA000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA000:completeAnimation()
				self.pixelA000:setLeftRight( true, false, 84, 120 )
				self.pixelA000:setTopBottom( true, false, 40, 43.5 )
				pixelA000Frame2( pixelA000, {} )

				SizeElement:completeAnimation()
				self.SizeElement:setLeftRight( true, false, 0, 425 )
				self.SizeElement:setTopBottom( true, false, 0, 57 )
				self.clipFinished( SizeElement, {} )
			end
		},
		CharacterDraftSelecting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )

				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( true, false, 114, 339.79 )
				self.FEButtonPanel1:setTopBottom( true, false, 2.5, 54.66 )
				self.clipFinished( FEButtonPanel1, {} )

				RankBackground:completeAnimation()
				self.RankBackground:setLeftRight( true, false, 50.21, 108 )
				self.RankBackground:setTopBottom( true, false, 49, 70 )
				self.clipFinished( RankBackground, {} )

				Rank:completeAnimation()
				self.Rank:setLeftRight( true, false, 53.9, 76.79 )
				self.Rank:setTopBottom( true, false, 47.05, 71.05 )
				self.clipFinished( Rank, {} )

				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( true, false, 81, 103 )
				self.RankIcon:setTopBottom( true, false, 49, 70 )
				self.clipFinished( RankIcon, {} )

				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( true, false, 120, 339.79 )
				self.PregamePlayerName0:setTopBottom( true, false, 15.08, 38.58 )
				self.clipFinished( PregamePlayerName0, {} )

				pixelA0:completeAnimation()
				self.pixelA0:setLeftRight( true, false, 333, 369 )
				self.pixelA0:setTopBottom( true, false, -1, 2.5 )
				self.clipFinished( pixelA0, {} )

				ImageX:completeAnimation()
				self.ImageX:setAlpha( 1 )
				self.clipFinished( ImageX, {} )

				ImageBorder:completeAnimation()
				self.ImageBorder:setLeftRight( true, false, 50, 108 )
				self.ImageBorder:setTopBottom( true, false, 0, 57.37 )
				self.clipFinished( ImageBorder, {} )

				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 41.71, 57.71 )
				self.Image0:setTopBottom( true, false, 57.5, 69.5 )
				self.clipFinished( Image0, {} )

				CharacterRender:completeAnimation()
				self.CharacterRender:setLeftRight( true, false, 47.71, 108.5 )
				self.CharacterRender:setTopBottom( true, false, -0.4, 60.4 )
				self.CharacterRender:setAlpha( 0 )
				self.clipFinished( CharacterRender, {} )

				pixelA00:completeAnimation()
				self.pixelA00:setLeftRight( true, false, 333, 369 )
				self.pixelA00:setTopBottom( true, false, 56, 59.5 )
				self.clipFinished( pixelA00, {} )

				Image00:completeAnimation()
				self.Image00:setLeftRight( true, false, 41.71, 57.71 )
				self.Image00:setTopBottom( true, false, -11, 1 )
				self.clipFinished( Image00, {} )

				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( true, false, 125, 220 )
				self.CharacterName:setTopBottom( true, false, 33, 51 )
				self.CharacterName:setAlpha( 0 )
				self.clipFinished( CharacterName, {} )

				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( true, false, 228, 323 )
				self.CharacterLoadout:setTopBottom( true, false, 33, 51 )
				self.CharacterLoadout:setAlpha( 0 )
				self.clipFinished( CharacterLoadout, {} )

				LineB1:completeAnimation()
				self.LineB1:setLeftRight( true, false, 110, 346 )
				self.LineB1:setTopBottom( true, false, -1, 3 )
				self.clipFinished( LineB1, {} )

				LineB00:completeAnimation()
				self.LineB00:setLeftRight( true, false, 110, 346 )
				self.LineB00:setTopBottom( true, false, 56, 60 )
				self.clipFinished( LineB00, {} )

				pixelA01:completeAnimation()
				self.pixelA01:setLeftRight( true, false, 84, 120 )
				self.pixelA01:setTopBottom( true, false, 14, 17.5 )
				self.clipFinished( pixelA01, {} )

				pixelA000:completeAnimation()
				self.pixelA000:setLeftRight( true, false, 84, 120 )
				self.pixelA000:setTopBottom( true, false, 40, 43.5 )
				self.clipFinished( pixelA000, {} )

				SizeElement:completeAnimation()
				self.SizeElement:setLeftRight( true, false, 0, 425 )
				self.SizeElement:setTopBottom( true, false, 0, 57 )
				self.clipFinished( SizeElement, {} )
			end,
			CharacterDraftSelected = function ()
				self:setupElementClipCounter( 21 )

				local FEButtonPanel1Frame2 = function ( FEButtonPanel1, event )
					if not event.interrupted then
						FEButtonPanel1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel1:setLeftRight( true, false, 114, 339.79 )
					FEButtonPanel1:setTopBottom( true, false, 2.5, 54.66 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel1, event )
					else
						FEButtonPanel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( true, false, 114, 339.79 )
				self.FEButtonPanel1:setTopBottom( true, false, 2.5, 54.66 )
				FEButtonPanel1Frame2( FEButtonPanel1, {} )
				local RankBackgroundFrame2 = function ( RankBackground, event )
					if not event.interrupted then
						RankBackground:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankBackground:setLeftRight( true, false, 50.21, 108 )
					RankBackground:setTopBottom( true, false, 49, 70 )
					if event.interrupted then
						self.clipFinished( RankBackground, event )
					else
						RankBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankBackground:completeAnimation()
				self.RankBackground:setLeftRight( true, false, 50.21, 108 )
				self.RankBackground:setTopBottom( true, false, 49, 70 )
				RankBackgroundFrame2( RankBackground, {} )
				local RankFrame2 = function ( Rank, event )
					if not event.interrupted then
						Rank:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Rank:setLeftRight( true, false, 53.9, 76.79 )
					Rank:setTopBottom( true, false, 47.05, 71.05 )
					if event.interrupted then
						self.clipFinished( Rank, event )
					else
						Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:completeAnimation()
				self.Rank:setLeftRight( true, false, 53.9, 76.79 )
				self.Rank:setTopBottom( true, false, 47.05, 71.05 )
				RankFrame2( Rank, {} )
				local RankIconFrame2 = function ( RankIcon, event )
					if not event.interrupted then
						RankIcon:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankIcon:setLeftRight( true, false, 81, 103 )
					RankIcon:setTopBottom( true, false, 49, 70 )
					if event.interrupted then
						self.clipFinished( RankIcon, event )
					else
						RankIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( true, false, 81, 103 )
				self.RankIcon:setTopBottom( true, false, 49, 70 )
				RankIconFrame2( RankIcon, {} )

				StateLeft:completeAnimation()
				self.StateLeft:setLeftRight( true, false, 0, 27 )
				self.StateLeft:setTopBottom( true, false, 15, 42 )
				self.StateLeft:setAlpha( 1 )
				self.clipFinished( StateLeft, {} )

				StateRight:completeAnimation()
				self.StateRight:setLeftRight( true, false, 378, 405 )
				self.StateRight:setTopBottom( true, false, 14.49, 41.49 )
				self.StateRight:setAlpha( 1 )
				self.clipFinished( StateRight, {} )
				local PregamePlayerName0Frame2 = function ( PregamePlayerName0, event )
					local PregamePlayerName0Frame3 = function ( PregamePlayerName0, event )
						if not event.interrupted then
							PregamePlayerName0:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
						end
						PregamePlayerName0:setLeftRight( true, false, 120, 339.79 )
						PregamePlayerName0:setTopBottom( true, false, 8, 32 )
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
						PregamePlayerName0:setTopBottom( true, false, 13, 37 )
						PregamePlayerName0:registerEventHandler( "transition_complete_keyframe", PregamePlayerName0Frame3 )
					end
				end
				
				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( true, false, 120, 339.79 )
				self.PregamePlayerName0:setTopBottom( true, false, 15, 39 )
				PregamePlayerName0Frame2( PregamePlayerName0, {} )
				local pixelA0Frame2 = function ( pixelA0, event )
					if not event.interrupted then
						pixelA0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA0:setLeftRight( true, false, 333, 369 )
					pixelA0:setTopBottom( true, false, -1, 2.5 )
					if event.interrupted then
						self.clipFinished( pixelA0, event )
					else
						pixelA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA0:completeAnimation()
				self.pixelA0:setLeftRight( true, false, 333, 369 )
				self.pixelA0:setTopBottom( true, false, -1, 2.5 )
				pixelA0Frame2( pixelA0, {} )
				local ImageXFrame2 = function ( ImageX, event )
					if not event.interrupted then
						ImageX:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
					end
					ImageX:setLeftRight( true, false, 48, 106.77 )
					ImageX:setTopBottom( true, false, -1.4, 57.37 )
					ImageX:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImageX, event )
					else
						ImageX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImageX:completeAnimation()
				self.ImageX:setLeftRight( true, false, 48, 106.77 )
				self.ImageX:setTopBottom( true, false, -1.4, 57.37 )
				self.ImageX:setAlpha( 1 )
				ImageXFrame2( ImageX, {} )

				ImageBorder:completeAnimation()
				self.ImageBorder:setLeftRight( true, false, 50, 108 )
				self.ImageBorder:setTopBottom( true, false, 0, 57.37 )
				self.clipFinished( ImageBorder, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( true, false, 41.71, 57.71 )
					Image0:setTopBottom( true, false, 57.5, 69.5 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 41.71, 57.71 )
				self.Image0:setTopBottom( true, false, 57.5, 69.5 )
				Image0Frame2( Image0, {} )
				local CharacterRenderFrame2 = function ( CharacterRender, event )
					if not event.interrupted then
						CharacterRender:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterRender:setLeftRight( true, false, 47.71, 108.5 )
					CharacterRender:setTopBottom( true, false, -0.4, 60.4 )
					CharacterRender:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CharacterRender, event )
					else
						CharacterRender:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterRender:completeAnimation()
				self.CharacterRender:setLeftRight( true, false, 47.71, 108.5 )
				self.CharacterRender:setTopBottom( true, false, -0.4, 60.4 )
				self.CharacterRender:setAlpha( 0 )
				CharacterRenderFrame2( CharacterRender, {} )
				local pixelA00Frame2 = function ( pixelA00, event )
					if not event.interrupted then
						pixelA00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA00:setLeftRight( true, false, 333, 369 )
					pixelA00:setTopBottom( true, false, 56, 59.5 )
					if event.interrupted then
						self.clipFinished( pixelA00, event )
					else
						pixelA00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA00:completeAnimation()
				self.pixelA00:setLeftRight( true, false, 333, 369 )
				self.pixelA00:setTopBottom( true, false, 56, 59.5 )
				pixelA00Frame2( pixelA00, {} )
				local Image00Frame2 = function ( Image00, event )
					if not event.interrupted then
						Image00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image00:setLeftRight( true, false, 41.71, 57.71 )
					Image00:setTopBottom( true, false, -11, 1 )
					if event.interrupted then
						self.clipFinished( Image00, event )
					else
						Image00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image00:completeAnimation()
				self.Image00:setLeftRight( true, false, 41.71, 57.71 )
				self.Image00:setTopBottom( true, false, -11, 1 )
				Image00Frame2( Image00, {} )
				local CharacterNameFrame2 = function ( CharacterName, event )
					if not event.interrupted then
						CharacterName:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterName:setLeftRight( true, false, 125, 220 )
					CharacterName:setTopBottom( true, false, 33, 51 )
					CharacterName:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterName, event )
					else
						CharacterName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( true, false, 125, 220 )
				self.CharacterName:setTopBottom( true, false, 33, 51 )
				self.CharacterName:setAlpha( 0 )
				CharacterNameFrame2( CharacterName, {} )
				local CharacterLoadoutFrame2 = function ( CharacterLoadout, event )
					if not event.interrupted then
						CharacterLoadout:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterLoadout:setLeftRight( true, false, 228, 323 )
					CharacterLoadout:setTopBottom( true, false, 33, 51 )
					CharacterLoadout:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterLoadout, event )
					else
						CharacterLoadout:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( true, false, 228, 323 )
				self.CharacterLoadout:setTopBottom( true, false, 33, 51 )
				self.CharacterLoadout:setAlpha( 0 )
				CharacterLoadoutFrame2( CharacterLoadout, {} )
				local LineB1Frame2 = function ( LineB1, event )
					if not event.interrupted then
						LineB1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB1:setLeftRight( true, false, 110, 346 )
					LineB1:setTopBottom( true, false, -1, 3 )
					if event.interrupted then
						self.clipFinished( LineB1, event )
					else
						LineB1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB1:completeAnimation()
				self.LineB1:setLeftRight( true, false, 110, 346 )
				self.LineB1:setTopBottom( true, false, -1, 3 )
				LineB1Frame2( LineB1, {} )
				local LineB00Frame2 = function ( LineB00, event )
					if not event.interrupted then
						LineB00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB00:setLeftRight( true, false, 110, 346 )
					LineB00:setTopBottom( true, false, 56, 60 )
					if event.interrupted then
						self.clipFinished( LineB00, event )
					else
						LineB00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB00:completeAnimation()
				self.LineB00:setLeftRight( true, false, 110, 346 )
				self.LineB00:setTopBottom( true, false, 56, 60 )
				LineB00Frame2( LineB00, {} )
				local pixelA01Frame2 = function ( pixelA01, event )
					if not event.interrupted then
						pixelA01:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA01:setLeftRight( true, false, 84, 120 )
					pixelA01:setTopBottom( true, false, 14, 17.5 )
					if event.interrupted then
						self.clipFinished( pixelA01, event )
					else
						pixelA01:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA01:completeAnimation()
				self.pixelA01:setLeftRight( true, false, 84, 120 )
				self.pixelA01:setTopBottom( true, false, 14, 17.5 )
				pixelA01Frame2( pixelA01, {} )
				local pixelA000Frame2 = function ( pixelA000, event )
					if not event.interrupted then
						pixelA000:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA000:setLeftRight( true, false, 84, 120 )
					pixelA000:setTopBottom( true, false, 40, 43.5 )
					if event.interrupted then
						self.clipFinished( pixelA000, event )
					else
						pixelA000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA000:completeAnimation()
				self.pixelA000:setLeftRight( true, false, 84, 120 )
				self.pixelA000:setTopBottom( true, false, 40, 43.5 )
				pixelA000Frame2( pixelA000, {} )

				SizeElement:completeAnimation()
				self.SizeElement:setLeftRight( true, false, 0, 425 )
				self.SizeElement:setTopBottom( true, false, 0, 57 )
				self.clipFinished( SizeElement, {} )
			end,
			CharacterDraftForced = function ()
				self:setupElementClipCounter( 21 )

				local FEButtonPanel1Frame2 = function ( FEButtonPanel1, event )
					if not event.interrupted then
						FEButtonPanel1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanel1:setLeftRight( true, false, 114, 339.79 )
					FEButtonPanel1:setTopBottom( true, false, 2.5, 54.66 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel1, event )
					else
						FEButtonPanel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( true, false, 114, 339.79 )
				self.FEButtonPanel1:setTopBottom( true, false, 2.5, 54.66 )
				FEButtonPanel1Frame2( FEButtonPanel1, {} )
				local RankBackgroundFrame2 = function ( RankBackground, event )
					if not event.interrupted then
						RankBackground:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankBackground:setLeftRight( true, false, 50.21, 108 )
					RankBackground:setTopBottom( true, false, 49, 70 )
					if event.interrupted then
						self.clipFinished( RankBackground, event )
					else
						RankBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankBackground:completeAnimation()
				self.RankBackground:setLeftRight( true, false, 50.21, 108 )
				self.RankBackground:setTopBottom( true, false, 49, 70 )
				RankBackgroundFrame2( RankBackground, {} )
				local RankFrame2 = function ( Rank, event )
					if not event.interrupted then
						Rank:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Rank:setLeftRight( true, false, 53.9, 76.79 )
					Rank:setTopBottom( true, false, 47.05, 71.05 )
					if event.interrupted then
						self.clipFinished( Rank, event )
					else
						Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:completeAnimation()
				self.Rank:setLeftRight( true, false, 53.9, 76.79 )
				self.Rank:setTopBottom( true, false, 47.05, 71.05 )
				RankFrame2( Rank, {} )
				local RankIconFrame2 = function ( RankIcon, event )
					if not event.interrupted then
						RankIcon:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					RankIcon:setLeftRight( true, false, 81, 103 )
					RankIcon:setTopBottom( true, false, 49, 70 )
					if event.interrupted then
						self.clipFinished( RankIcon, event )
					else
						RankIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( true, false, 81, 103 )
				self.RankIcon:setTopBottom( true, false, 49, 70 )
				RankIconFrame2( RankIcon, {} )

				StateLeft:completeAnimation()
				self.StateLeft:setLeftRight( true, false, 0, 27 )
				self.StateLeft:setTopBottom( true, false, 15, 42 )
				self.StateLeft:setAlpha( 1 )
				self.clipFinished( StateLeft, {} )

				StateRight:completeAnimation()
				self.StateRight:setLeftRight( true, false, 378, 405 )
				self.StateRight:setTopBottom( true, false, 14.49, 41.49 )
				self.StateRight:setAlpha( 1 )
				self.clipFinished( StateRight, {} )
				local PregamePlayerName0Frame2 = function ( PregamePlayerName0, event )
					local PregamePlayerName0Frame3 = function ( PregamePlayerName0, event )
						if not event.interrupted then
							PregamePlayerName0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						PregamePlayerName0:setLeftRight( true, false, 120, 339.79 )
						PregamePlayerName0:setTopBottom( true, false, 8, 32 )
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
						PregamePlayerName0:setTopBottom( true, false, 13, 37 )
						PregamePlayerName0:registerEventHandler( "transition_complete_keyframe", PregamePlayerName0Frame3 )
					end
				end
				
				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( true, false, 120, 339.79 )
				self.PregamePlayerName0:setTopBottom( true, false, 15, 39 )
				PregamePlayerName0Frame2( PregamePlayerName0, {} )
				local pixelA0Frame2 = function ( pixelA0, event )
					if not event.interrupted then
						pixelA0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA0:setLeftRight( true, false, 333, 369 )
					pixelA0:setTopBottom( true, false, -1, 2.5 )
					if event.interrupted then
						self.clipFinished( pixelA0, event )
					else
						pixelA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA0:completeAnimation()
				self.pixelA0:setLeftRight( true, false, 333, 369 )
				self.pixelA0:setTopBottom( true, false, -1, 2.5 )
				pixelA0Frame2( pixelA0, {} )
				local ImageXFrame2 = function ( ImageX, event )
					if not event.interrupted then
						ImageX:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
					end
					ImageX:setLeftRight( true, false, 48, 106.77 )
					ImageX:setTopBottom( true, false, -1.4, 57.37 )
					ImageX:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImageX, event )
					else
						ImageX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImageX:completeAnimation()
				self.ImageX:setLeftRight( true, false, 48, 106.77 )
				self.ImageX:setTopBottom( true, false, -1.4, 57.37 )
				self.ImageX:setAlpha( 1 )
				ImageXFrame2( ImageX, {} )

				ImageBorder:completeAnimation()
				self.ImageBorder:setLeftRight( true, false, 50, 108 )
				self.ImageBorder:setTopBottom( true, false, 0, 57.37 )
				self.clipFinished( ImageBorder, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( true, false, 41.71, 57.71 )
					Image0:setTopBottom( true, false, 57.5, 69.5 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 41.71, 57.71 )
				self.Image0:setTopBottom( true, false, 57.5, 69.5 )
				Image0Frame2( Image0, {} )
				local CharacterRenderFrame2 = function ( CharacterRender, event )
					if not event.interrupted then
						CharacterRender:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterRender:setLeftRight( true, false, 47.71, 108.5 )
					CharacterRender:setTopBottom( true, false, -0.4, 60.4 )
					CharacterRender:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CharacterRender, event )
					else
						CharacterRender:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterRender:completeAnimation()
				self.CharacterRender:setLeftRight( true, false, 47.71, 108.5 )
				self.CharacterRender:setTopBottom( true, false, -0.4, 60.4 )
				self.CharacterRender:setAlpha( 0 )
				CharacterRenderFrame2( CharacterRender, {} )
				local pixelA00Frame2 = function ( pixelA00, event )
					if not event.interrupted then
						pixelA00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA00:setLeftRight( true, false, 333, 369 )
					pixelA00:setTopBottom( true, false, 56, 59.5 )
					if event.interrupted then
						self.clipFinished( pixelA00, event )
					else
						pixelA00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA00:completeAnimation()
				self.pixelA00:setLeftRight( true, false, 333, 369 )
				self.pixelA00:setTopBottom( true, false, 56, 59.5 )
				pixelA00Frame2( pixelA00, {} )
				local Image00Frame2 = function ( Image00, event )
					if not event.interrupted then
						Image00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					Image00:setLeftRight( true, false, 41.71, 57.71 )
					Image00:setTopBottom( true, false, -11, 1 )
					if event.interrupted then
						self.clipFinished( Image00, event )
					else
						Image00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image00:completeAnimation()
				self.Image00:setLeftRight( true, false, 41.71, 57.71 )
				self.Image00:setTopBottom( true, false, -11, 1 )
				Image00Frame2( Image00, {} )
				local CharacterNameFrame2 = function ( CharacterName, event )
					if not event.interrupted then
						CharacterName:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterName:setLeftRight( true, false, 125, 220 )
					CharacterName:setTopBottom( true, false, 33, 51 )
					CharacterName:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterName, event )
					else
						CharacterName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( true, false, 125, 220 )
				self.CharacterName:setTopBottom( true, false, 33, 51 )
				self.CharacterName:setAlpha( 0 )
				CharacterNameFrame2( CharacterName, {} )
				local CharacterLoadoutFrame2 = function ( CharacterLoadout, event )
					if not event.interrupted then
						CharacterLoadout:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					CharacterLoadout:setLeftRight( true, false, 228, 323 )
					CharacterLoadout:setTopBottom( true, false, 33, 51 )
					CharacterLoadout:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( CharacterLoadout, event )
					else
						CharacterLoadout:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( true, false, 228, 323 )
				self.CharacterLoadout:setTopBottom( true, false, 33, 51 )
				self.CharacterLoadout:setAlpha( 0 )
				CharacterLoadoutFrame2( CharacterLoadout, {} )
				local LineB1Frame2 = function ( LineB1, event )
					if not event.interrupted then
						LineB1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB1:setLeftRight( true, false, 110, 346 )
					LineB1:setTopBottom( true, false, -1, 3 )
					if event.interrupted then
						self.clipFinished( LineB1, event )
					else
						LineB1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB1:completeAnimation()
				self.LineB1:setLeftRight( true, false, 110, 346 )
				self.LineB1:setTopBottom( true, false, -1, 3 )
				LineB1Frame2( LineB1, {} )
				local LineB00Frame2 = function ( LineB00, event )
					if not event.interrupted then
						LineB00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LineB00:setLeftRight( true, false, 110, 346 )
					LineB00:setTopBottom( true, false, 56, 60 )
					if event.interrupted then
						self.clipFinished( LineB00, event )
					else
						LineB00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineB00:completeAnimation()
				self.LineB00:setLeftRight( true, false, 110, 346 )
				self.LineB00:setTopBottom( true, false, 56, 60 )
				LineB00Frame2( LineB00, {} )
				local pixelA01Frame2 = function ( pixelA01, event )
					if not event.interrupted then
						pixelA01:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA01:setLeftRight( true, false, 84, 120 )
					pixelA01:setTopBottom( true, false, 14, 17.5 )
					if event.interrupted then
						self.clipFinished( pixelA01, event )
					else
						pixelA01:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA01:completeAnimation()
				self.pixelA01:setLeftRight( true, false, 84, 120 )
				self.pixelA01:setTopBottom( true, false, 14, 17.5 )
				pixelA01Frame2( pixelA01, {} )
				local pixelA000Frame2 = function ( pixelA000, event )
					if not event.interrupted then
						pixelA000:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					pixelA000:setLeftRight( true, false, 84, 120 )
					pixelA000:setTopBottom( true, false, 40, 43.5 )
					if event.interrupted then
						self.clipFinished( pixelA000, event )
					else
						pixelA000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixelA000:completeAnimation()
				self.pixelA000:setLeftRight( true, false, 84, 120 )
				self.pixelA000:setTopBottom( true, false, 40, 43.5 )
				pixelA000Frame2( pixelA000, {} )

				SizeElement:completeAnimation()
				self.SizeElement:setLeftRight( true, false, 0, 425 )
				self.SizeElement:setTopBottom( true, false, 0, 57 )
				self.clipFinished( SizeElement, {} )
			end
		},
		CharacterDraftSelected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( true, false, 114, 339.79 )
				self.FEButtonPanel1:setTopBottom( true, false, 2.5, 54.66 )
				self.clipFinished( FEButtonPanel1, {} )

				RankBackground:completeAnimation()
				self.RankBackground:setLeftRight( true, false, 50.21, 108 )
				self.RankBackground:setTopBottom( true, false, 49, 70 )
				self.clipFinished( RankBackground, {} )

				Rank:completeAnimation()
				self.Rank:setLeftRight( true, false, 53.9, 76.79 )
				self.Rank:setTopBottom( true, false, 47.05, 71.05 )
				self.clipFinished( Rank, {} )

				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( true, false, 81, 103 )
				self.RankIcon:setTopBottom( true, false, 49, 70 )
				self.clipFinished( RankIcon, {} )

				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( true, false, 120, 339.79 )
				self.PregamePlayerName0:setTopBottom( true, false, 8, 32 )
				self.clipFinished( PregamePlayerName0, {} )

				pixelA0:completeAnimation()
				self.pixelA0:setLeftRight( true, false, 333, 369 )
				self.pixelA0:setTopBottom( true, false, -1, 2.5 )
				self.clipFinished( pixelA0, {} )

				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 41.71, 57.71 )
				self.Image0:setTopBottom( true, false, 57.5, 69.5 )
				self.clipFinished( Image0, {} )

				CharacterRender:completeAnimation()
				self.CharacterRender:setAlpha( 1 )
				self.clipFinished( CharacterRender, {} )

				pixelA00:completeAnimation()
				self.pixelA00:setLeftRight( true, false, 333, 369 )
				self.pixelA00:setTopBottom( true, false, 56, 59.5 )
				self.clipFinished( pixelA00, {} )

				Image00:completeAnimation()
				self.Image00:setLeftRight( true, false, 41.71, 57.71 )
				self.Image00:setTopBottom( true, false, -11, 1 )
				self.clipFinished( Image00, {} )

				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( true, false, 125, 220 )
				self.CharacterName:setTopBottom( true, false, 33, 51 )
				self.CharacterName:setAlpha( 0.75 )
				self.clipFinished( CharacterName, {} )

				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( true, false, 228, 323 )
				self.CharacterLoadout:setTopBottom( true, false, 33, 51 )
				self.CharacterLoadout:setAlpha( 0.75 )
				self.clipFinished( CharacterLoadout, {} )

				LineB1:completeAnimation()
				self.LineB1:setLeftRight( true, false, 110, 346 )
				self.LineB1:setTopBottom( true, false, -1, 3 )
				self.clipFinished( LineB1, {} )

				LineB00:completeAnimation()
				self.LineB00:setLeftRight( true, false, 110, 346 )
				self.LineB00:setTopBottom( true, false, 56, 60 )
				self.clipFinished( LineB00, {} )

				pixelA01:completeAnimation()
				self.pixelA01:setLeftRight( true, false, 84, 120 )
				self.pixelA01:setTopBottom( true, false, 14, 17.5 )
				self.clipFinished( pixelA01, {} )

				pixelA000:completeAnimation()
				self.pixelA000:setLeftRight( true, false, 84, 120 )
				self.pixelA000:setTopBottom( true, false, 40, 43.5 )
				self.clipFinished( pixelA000, {} )
			end
		},
		CACEdit = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( true, false, 114, 339.79 )
				self.FEButtonPanel1:setTopBottom( true, false, 2.5, 54.66 )
				self.clipFinished( FEButtonPanel1, {} )

				RankBackground:completeAnimation()
				self.RankBackground:setLeftRight( true, false, 50.21, 108 )
				self.RankBackground:setTopBottom( true, false, 49, 70 )
				self.clipFinished( RankBackground, {} )

				Rank:completeAnimation()
				self.Rank:setLeftRight( true, false, 53.9, 76.79 )
				self.Rank:setTopBottom( true, false, 47.05, 71.05 )
				self.clipFinished( Rank, {} )

				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( true, false, 81, 103 )
				self.RankIcon:setTopBottom( true, false, 49, 70 )
				self.clipFinished( RankIcon, {} )

				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( true, false, 120, 339.79 )
				self.PregamePlayerName0:setTopBottom( true, false, 8, 32 )
				self.clipFinished( PregamePlayerName0, {} )

				pixelA0:completeAnimation()
				self.pixelA0:setLeftRight( true, false, 333, 369 )
				self.pixelA0:setTopBottom( true, false, -1, 2.5 )
				self.clipFinished( pixelA0, {} )

				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 41.71, 57.71 )
				self.Image0:setTopBottom( true, false, 57.5, 69.5 )
				self.clipFinished( Image0, {} )

				CharacterRender:completeAnimation()
				self.CharacterRender:setAlpha( 1 )
				self.clipFinished( CharacterRender, {} )

				pixelA00:completeAnimation()
				self.pixelA00:setLeftRight( true, false, 333, 369 )
				self.pixelA00:setTopBottom( true, false, 56, 59.5 )
				self.clipFinished( pixelA00, {} )

				Image00:completeAnimation()
				self.Image00:setLeftRight( true, false, 41.71, 57.71 )
				self.Image00:setTopBottom( true, false, -11, 1 )
				self.clipFinished( Image00, {} )

				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( true, false, 125, 220 )
				self.CharacterName:setTopBottom( true, false, 33, 51 )
				self.CharacterName:setAlpha( 0.75 )
				self.clipFinished( CharacterName, {} )

				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( true, false, 228, 323 )
				self.CharacterLoadout:setTopBottom( true, false, 33, 51 )
				self.CharacterLoadout:setAlpha( 0.75 )
				self.clipFinished( CharacterLoadout, {} )

				LineB1:completeAnimation()
				self.LineB1:setLeftRight( true, false, 110, 346 )
				self.LineB1:setTopBottom( true, false, -1, 3 )
				self.clipFinished( LineB1, {} )

				LineB00:completeAnimation()
				self.LineB00:setLeftRight( true, false, 110, 346 )
				self.LineB00:setTopBottom( true, false, 56, 60 )
				self.clipFinished( LineB00, {} )

				pixelA01:completeAnimation()
				self.pixelA01:setLeftRight( true, false, 84, 120 )
				self.pixelA01:setTopBottom( true, false, 14, 17.5 )
				self.clipFinished( pixelA01, {} )

				pixelA000:completeAnimation()
				self.pixelA000:setLeftRight( true, false, 84, 120 )
				self.pixelA000:setTopBottom( true, false, 40, 43.5 )
				self.clipFinished( pixelA000, {} )
			end
		},
		StreakEdit = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( true, false, 114, 339.79 )
				self.FEButtonPanel1:setTopBottom( true, false, 2.5, 54.66 )
				self.clipFinished( FEButtonPanel1, {} )

				RankBackground:completeAnimation()
				self.RankBackground:setLeftRight( true, false, 50.21, 108 )
				self.RankBackground:setTopBottom( true, false, 49, 70 )
				self.clipFinished( RankBackground, {} )

				Rank:completeAnimation()
				self.Rank:setLeftRight( true, false, 53.9, 76.79 )
				self.Rank:setTopBottom( true, false, 47.05, 71.05 )
				self.clipFinished( Rank, {} )

				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( true, false, 81, 103 )
				self.RankIcon:setTopBottom( true, false, 49, 70 )
				self.clipFinished( RankIcon, {} )

				PregamePlayerName0:completeAnimation()
				self.PregamePlayerName0:setLeftRight( true, false, 120, 339.79 )
				self.PregamePlayerName0:setTopBottom( true, false, 8, 32 )
				self.clipFinished( PregamePlayerName0, {} )

				pixelA0:completeAnimation()
				self.pixelA0:setLeftRight( true, false, 333, 369 )
				self.pixelA0:setTopBottom( true, false, -1, 2.5 )
				self.clipFinished( pixelA0, {} )

				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 41.71, 57.71 )
				self.Image0:setTopBottom( true, false, 57.5, 69.5 )
				self.clipFinished( Image0, {} )

				CharacterRender:completeAnimation()
				self.CharacterRender:setAlpha( 1 )
				self.clipFinished( CharacterRender, {} )

				pixelA00:completeAnimation()
				self.pixelA00:setLeftRight( true, false, 333, 369 )
				self.pixelA00:setTopBottom( true, false, 56, 59.5 )
				self.clipFinished( pixelA00, {} )

				Image00:completeAnimation()
				self.Image00:setLeftRight( true, false, 41.71, 57.71 )
				self.Image00:setTopBottom( true, false, -11, 1 )
				self.clipFinished( Image00, {} )

				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( true, false, 125, 220 )
				self.CharacterName:setTopBottom( true, false, 33, 51 )
				self.CharacterName:setAlpha( 0.75 )
				self.clipFinished( CharacterName, {} )

				CharacterLoadout:completeAnimation()
				self.CharacterLoadout:setLeftRight( true, false, 228, 323 )
				self.CharacterLoadout:setTopBottom( true, false, 33, 51 )
				self.CharacterLoadout:setAlpha( 0.75 )
				self.clipFinished( CharacterLoadout, {} )

				LineB1:completeAnimation()
				self.LineB1:setLeftRight( true, false, 110, 346 )
				self.LineB1:setTopBottom( true, false, -1, 3 )
				self.clipFinished( LineB1, {} )

				LineB00:completeAnimation()
				self.LineB00:setLeftRight( true, false, 110, 346 )
				self.LineB00:setTopBottom( true, false, 56, 60 )
				self.clipFinished( LineB00, {} )

				pixelA01:completeAnimation()
				self.pixelA01:setLeftRight( true, false, 84, 120 )
				self.pixelA01:setTopBottom( true, false, 14, 17.5 )
				self.clipFinished( pixelA01, {} )

				pixelA000:completeAnimation()
				self.pixelA000:setLeftRight( true, false, 84, 120 )
				self.pixelA000:setTopBottom( true, false, 40, 43.5 )
				self.clipFinished( pixelA000, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel1:close()
		element.RankBackground:close()
		element.StateLeft:close()
		element.StateRight:close()
		element.PregamePlayerName0:close()
		element.ImagePanel:close()
		element.ImageBorder:close()
		element.CharacterRender:close()
		element.IconControllerContainer:close()
		element.Rank:close()
		element.CharacterName:close()
		element.CharacterLoadout:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
