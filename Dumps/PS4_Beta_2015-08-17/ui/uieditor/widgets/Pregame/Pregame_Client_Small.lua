require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_StateIcon_Right" )
require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_StateIcon" )
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
	self:setLeftRight( true, false, 0, 425 )
	self:setTopBottom( true, false, 0, 37 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel1 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel1:setLeftRight( true, false, 72, 339.79 )
	FEButtonPanel1:setTopBottom( true, false, 6.25, 33.5 )
	FEButtonPanel1:setRGB( 0, 0, 0 )
	FEButtonPanel1:setAlpha( 0.35 )
	self:addElement( FEButtonPanel1 )
	self.FEButtonPanel1 = FEButtonPanel1
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( true, false, 46, 74.9 )
	Rank:setTopBottom( true, false, 13.77, 37.75 )
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
	RankIcon:setLeftRight( true, false, 78.9, 102.4 )
	RankIcon:setTopBottom( true, false, 14.25, 37.75 )
	RankIcon:setAlpha( 0 )
	RankIcon:setImage( RegisterImage( "uie_t7_hud_arena_rank_1" ) )
	RankIcon:setupUIStreamedImage( 0 )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local StateLeft = CoD.Competitive_CharacterDraft_StateIcon_Right.new( menu, controller )
	StateLeft:setLeftRight( true, false, 0, 27 )
	StateLeft:setTopBottom( true, false, 5, 32 )
	StateLeft:linkToElementModel( self, nil, false, function ( model )
		StateLeft:setModel( model, controller )
	end )
	StateLeft:mergeStateConditions( {
		{
			stateName = "Choosing",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING ) and IsSelfModelValueEqualTo( element, controller, "team", 2 )
			end
		},
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED ) and IsSelfModelValueEqualTo( element, controller, "team", 2 )
			end
		},
		{
			stateName = "Forced",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED ) and IsSelfModelValueEqualTo( element, controller, "team", 2 )
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
	StateRight:setLeftRight( true, false, 378, 405 )
	StateRight:setTopBottom( true, false, 5, 32 )
	StateRight:linkToElementModel( self, nil, false, function ( model )
		StateRight:setModel( model, controller )
	end )
	StateRight:mergeStateConditions( {
		{
			stateName = "Choosing",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING ) and IsSelfModelValueEqualTo( element, controller, "team", 1 )
			end
		},
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED ) and IsSelfModelValueEqualTo( element, controller, "team", 1 )
			end
		},
		{
			stateName = "Forced",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED ) and IsSelfModelValueEqualTo( element, controller, "team", 1 )
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
	PregamePlayerName0:setLeftRight( true, false, 78.1, 326.1 )
	PregamePlayerName0:setTopBottom( true, false, 8.5, 28.5 )
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
	pixelA0:setLeftRight( true, false, 333, 369 )
	pixelA0:setTopBottom( true, false, 4.5, 8 )
	pixelA0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelA0 )
	self.pixelA0 = pixelA0
	
	local pixelA00 = LUI.UIImage.new()
	pixelA00:setLeftRight( true, false, 333, 369 )
	pixelA00:setTopBottom( true, false, 31.5, 35 )
	pixelA00:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelA00 )
	self.pixelA00 = pixelA00
	
	local LineB1 = LUI.UIImage.new()
	LineB1:setLeftRight( true, false, 72, 346 )
	LineB1:setTopBottom( true, false, 4.5, 8.5 )
	LineB1:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB1 )
	self.LineB1 = LineB1
	
	local LineB00 = LUI.UIImage.new()
	LineB00:setLeftRight( true, false, 72, 346 )
	LineB00:setTopBottom( true, false, 31.5, 35.5 )
	LineB00:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB00 )
	self.LineB00 = LineB00
	
	local pixelA01 = LUI.UIImage.new()
	pixelA01:setLeftRight( true, false, 44, 80 )
	pixelA01:setTopBottom( true, false, 4.5, 8 )
	pixelA01:setZRot( 180 )
	pixelA01:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA01:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelA01 )
	self.pixelA01 = pixelA01
	
	local pixelA000 = LUI.UIImage.new()
	pixelA000:setLeftRight( true, false, 44, 80 )
	pixelA000:setTopBottom( true, false, 30.5, 34 )
	pixelA000:setZRot( 180 )
	pixelA000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA000:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelA000 )
	self.pixelA000 = pixelA000
	
	local SizeElement = LUI.UIImage.new()
	SizeElement:setLeftRight( true, false, 0, 425 )
	SizeElement:setTopBottom( true, false, 1.5, 35.5 )
	SizeElement:setAlpha( 0 )
	self:addElement( SizeElement )
	self.SizeElement = SizeElement
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel1:close()
		self.StateLeft:close()
		self.StateRight:close()
		self.PregamePlayerName0:close()
		self.Rank:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

