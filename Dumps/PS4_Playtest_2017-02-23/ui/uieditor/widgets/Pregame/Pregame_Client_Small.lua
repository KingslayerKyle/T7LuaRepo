require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_StateIcon" )
require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_StateIcon_Right" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.IconControllerContainer" )
require( "ui.uieditor.widgets.Pregame.Pregame_PlayerName" )

CoD.Pregame_Client_Small = InheritFrom( LUI.UIElement )
CoD.Pregame_Client_Small.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_Client_Small )
	self.id = "Pregame_Client_Small"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 637 )
	self:setTopBottom( 0, 0, 0, 46 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel1 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel1:setLeftRight( 0, 0, 108, 510 )
	FEButtonPanel1:setTopBottom( 0, 0, 3, 44 )
	FEButtonPanel1:setRGB( 0, 0, 0 )
	FEButtonPanel1:setAlpha( 0.35 )
	self:addElement( FEButtonPanel1 )
	self.FEButtonPanel1 = FEButtonPanel1
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( 0, 0, 69, 112 )
	Rank:setTopBottom( 0, 0, 14, 50 )
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
	RankIcon:setLeftRight( 0, 0, 118, 153 )
	RankIcon:setTopBottom( 0, 0, 15, 50 )
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
	StateLeft:setTopBottom( 0, 0, 1, 41 )
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
	StateRight:setLeftRight( 0, 0, 567, 607 )
	StateRight:setTopBottom( 0, 0, 1, 41 )
	StateRight:linkToElementModel( self, nil, false, function ( model )
		StateRight:setModel( model, controller )
	end )
	self:addElement( StateRight )
	self.StateRight = StateRight
	
	local PregamePlayerName0 = CoD.Pregame_PlayerName.new( menu, controller )
	PregamePlayerName0:setLeftRight( 0, 0, 117, 489 )
	PregamePlayerName0:setTopBottom( 0, 0, 6, 36 )
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
	
	local pixelA0 = LUI.UIImage.new()
	pixelA0:setLeftRight( 0, 0, 499, 553 )
	pixelA0:setTopBottom( 0, 0, 0, 5 )
	pixelA0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelA0 )
	self.pixelA0 = pixelA0
	
	local pixelA00 = LUI.UIImage.new()
	pixelA00:setLeftRight( 0, 0, 499, 553 )
	pixelA00:setTopBottom( 0, 0, 41, 46 )
	pixelA00:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelA00 )
	self.pixelA00 = pixelA00
	
	local LineB1 = LUI.UIImage.new()
	LineB1:setLeftRight( 0, 0, 108, 519 )
	LineB1:setTopBottom( 0, 0, 0, 6 )
	LineB1:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB1 )
	self.LineB1 = LineB1
	
	local LineB00 = LUI.UIImage.new()
	LineB00:setLeftRight( 0, 0, 108, 519 )
	LineB00:setTopBottom( 0, 0, 41, 47 )
	LineB00:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB00 )
	self.LineB00 = LineB00
	
	local pixelA01 = LUI.UIImage.new()
	pixelA01:setLeftRight( 0, 0, 66, 120 )
	pixelA01:setTopBottom( 0, 0, 0, 5 )
	pixelA01:setZRot( 180 )
	pixelA01:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA01:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelA01 )
	self.pixelA01 = pixelA01
	
	local pixelA000 = LUI.UIImage.new()
	pixelA000:setLeftRight( 0, 0, 66, 120 )
	pixelA000:setTopBottom( 0, 0, 39, 44 )
	pixelA000:setZRot( 180 )
	pixelA000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA000:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelA000 )
	self.pixelA000 = pixelA000
	
	local SizeElement = LUI.UIImage.new()
	SizeElement:setLeftRight( 0, 0, 0, 638 )
	SizeElement:setTopBottom( 0, 0, 2, 53 )
	SizeElement:setAlpha( 0 )
	self:addElement( SizeElement )
	self.SizeElement = SizeElement
	
	local IconControllerContainer = CoD.IconControllerContainer.new( menu, controller )
	IconControllerContainer:setLeftRight( 0, 0, 21, 107 )
	IconControllerContainer:setTopBottom( 0, 0, 1, 49 )
	IconControllerContainer:setRGB( 0.74, 0.78, 0.79 )
	IconControllerContainer:linkToElementModel( self, nil, false, function ( model )
		IconControllerContainer:setModel( model, controller )
	end )
	self:addElement( IconControllerContainer )
	self.IconControllerContainer = IconControllerContainer
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel1:close()
		self.StateLeft:close()
		self.StateRight:close()
		self.PregamePlayerName0:close()
		self.IconControllerContainer:close()
		self.Rank:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

