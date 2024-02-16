require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_StateIcon" )
require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_CharacterSelection" )

CoD.Competitive_CharacterDraft_Player = InheritFrom( LUI.UIElement )
CoD.Competitive_CharacterDraft_Player.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Competitive_CharacterDraft_Player )
	self.id = "Competitive_CharacterDraft_Player"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 425 )
	self:setTopBottom( true, false, 0, 71 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel1 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel1:setLeftRight( true, false, 111, 373.79 )
	FEButtonPanel1:setTopBottom( true, false, 0, 70 )
	FEButtonPanel1:setRGB( 0, 0, 0 )
	FEButtonPanel1:setAlpha( 0.26 )
	self:addElement( FEButtonPanel1 )
	self.FEButtonPanel1 = FEButtonPanel1
	
	local FEButtonPanel2 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel2:setLeftRight( true, false, 50.21, 108 )
	FEButtonPanel2:setTopBottom( true, false, 0, 70 )
	FEButtonPanel2:setRGB( 0, 0, 0 )
	FEButtonPanel2:setAlpha( 0.26 )
	self:addElement( FEButtonPanel2 )
	self.FEButtonPanel2 = FEButtonPanel2
	
	local Name = LUI.UIText.new()
	Name:setLeftRight( true, false, 124.44, 372.59 )
	Name:setTopBottom( true, false, 11.5, 31.5 )
	Name:setRGB( 1, 0.95, 0.28 )
	Name:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Name:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Name:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local CharacterName = LUI.UIText.new()
	CharacterName:setLeftRight( true, false, 124.44, 224.59 )
	CharacterName:setTopBottom( true, false, 36, 55 )
	CharacterName:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	CharacterName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CharacterName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CharacterName:linkToElementModel( self, "characterName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CharacterName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CharacterName )
	self.CharacterName = CharacterName
	
	local CharacterAbility = LUI.UIText.new()
	CharacterAbility:setLeftRight( true, false, 224.59, 324.73 )
	CharacterAbility:setTopBottom( true, false, 36, 55 )
	CharacterAbility:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	CharacterAbility:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CharacterAbility:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CharacterAbility:linkToElementModel( self, "characterLoadoutName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CharacterAbility:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CharacterAbility )
	self.CharacterAbility = CharacterAbility
	
	local RankBackground = CoD.FE_ButtonPanel.new( menu, controller )
	RankBackground:setLeftRight( true, false, 50.21, 108 )
	RankBackground:setTopBottom( true, false, 50, 71 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0.26 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( true, false, 50, 72.9 )
	Rank:setTopBottom( true, false, 52, 71 )
	Rank:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
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
	RankIcon:setLeftRight( true, false, 78.9, 96.9 )
	RankIcon:setTopBottom( true, false, 51.5, 69.5 )
	RankIcon:setupUIStreamedImage( 0 )
	RankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local StateLeft = CoD.Competitive_CharacterDraft_StateIcon.new( menu, controller )
	StateLeft:setLeftRight( true, false, 0, 27 )
	StateLeft:setTopBottom( true, false, 21.5, 48.5 )
	StateLeft:linkToElementModel( self, nil, false, function ( model )
		StateLeft:setModel( model, controller )
	end )
	StateLeft:mergeStateConditions( {
		{
			stateName = "Choosing",
			condition = function ( menu, element, event )
				local f8_local0 = IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING )
				if f8_local0 then
					f8_local0 = IsSelfModelValueEqualTo( element, controller, "team", 2 )
				end
				return f8_local0
			end
		},
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				local f9_local0 = IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED )
				if f9_local0 then
					f9_local0 = IsSelfModelValueEqualTo( element, controller, "team", 2 )
				end
				return f9_local0
			end
		},
		{
			stateName = "Forced",
			condition = function ( menu, element, event )
				local f10_local0 = IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED )
				if f10_local0 then
					f10_local0 = IsSelfModelValueEqualTo( element, controller, "team", 2 )
				end
				return f10_local0
			end
		}
	} )
	StateLeft:linkToElementModel( "clientState", true, function ( model )
		menu:updateElementState( StateLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientState"
		} )
	end )
	StateLeft:linkToElementModel( "team", true, function ( model )
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
	StateRight:setLeftRight( true, false, 398, 425 )
	StateRight:setTopBottom( true, false, 22, 49 )
	StateRight:linkToElementModel( self, nil, false, function ( model )
		StateRight:setModel( model, controller )
	end )
	StateRight:mergeStateConditions( {
		{
			stateName = "Choosing",
			condition = function ( menu, element, event )
				local f14_local0 = IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING )
				if f14_local0 then
					f14_local0 = IsSelfModelValueEqualTo( element, controller, "team", 1 )
				end
				return f14_local0
			end
		},
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				local f15_local0 = IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED )
				if f15_local0 then
					f15_local0 = IsSelfModelValueEqualTo( element, controller, "team", 1 )
				end
				return f15_local0
			end
		},
		{
			stateName = "Forced",
			condition = function ( menu, element, event )
				local f16_local0 = IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED )
				if f16_local0 then
					f16_local0 = IsSelfModelValueEqualTo( element, controller, "team", 1 )
				end
				return f16_local0
			end
		}
	} )
	StateRight:linkToElementModel( "clientState", true, function ( model )
		menu:updateElementState( StateRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientState"
		} )
	end )
	StateRight:linkToElementModel( "team", true, function ( model )
		menu:updateElementState( StateRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "team"
		} )
	end )
	self:addElement( StateRight )
	self.StateRight = StateRight
	
	local CharacterRender = CoD.Competitive_CharacterDraft_CharacterSelection.new( menu, controller )
	CharacterRender:setLeftRight( true, false, 53.9, 103.9 )
	CharacterRender:setTopBottom( true, false, 0, 50 )
	CharacterRender:linkToElementModel( self, nil, false, function ( model )
		CharacterRender:setModel( model, controller )
	end )
	CharacterRender:mergeStateConditions( {
		{
			stateName = "Selected",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED_CHARACTER )
			end
		},
		{
			stateName = "Forced",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_CHARACTER_SELECTION_FORCED )
			end
		}
	} )
	CharacterRender:linkToElementModel( "clientState", true, function ( model )
		menu:updateElementState( CharacterRender, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientState"
		} )
	end )
	self:addElement( CharacterRender )
	self.CharacterRender = CharacterRender
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		ItemRestriction = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( true, false, 50.21, 373.79 )
				self.FEButtonPanel1:setTopBottom( true, false, 21.5, 49 )
				self.clipFinished( FEButtonPanel1, {} )
				FEButtonPanel2:completeAnimation()
				self.FEButtonPanel2:setAlpha( 0 )
				self.clipFinished( FEButtonPanel2, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( true, false, 124.44, 372.59 )
				self.Name:setTopBottom( true, false, 25, 45 )
				self.clipFinished( Name, {} )
				CharacterName:completeAnimation()
				self.CharacterName:setAlpha( 0 )
				self.clipFinished( CharacterName, {} )
				CharacterAbility:completeAnimation()
				self.CharacterAbility:setAlpha( 0 )
				self.clipFinished( CharacterAbility, {} )
				RankBackground:completeAnimation()
				self.RankBackground:setAlpha( 0 )
				self.clipFinished( RankBackground, {} )
				Rank:completeAnimation()
				self.Rank:setLeftRight( true, false, 50, 72.9 )
				self.Rank:setTopBottom( true, false, 27, 46 )
				self.clipFinished( Rank, {} )
				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( true, false, 78.9, 96.9 )
				self.RankIcon:setTopBottom( true, false, 26.5, 44.5 )
				self.clipFinished( RankIcon, {} )
				CharacterRender:completeAnimation()
				self.CharacterRender:setAlpha( 0 )
				self.clipFinished( CharacterRender, {} )
			end
		},
		SpecialistDraft = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( true, false, 111, 373.79 )
				self.FEButtonPanel1:setTopBottom( true, false, 0, 70 )
				self.FEButtonPanel1:setAlpha( 0.26 )
				self.clipFinished( FEButtonPanel1, {} )
				FEButtonPanel2:completeAnimation()
				self.FEButtonPanel2:setLeftRight( true, false, 50.21, 108 )
				self.FEButtonPanel2:setTopBottom( true, false, 0, 70 )
				self.FEButtonPanel2:setAlpha( 0.26 )
				self.clipFinished( FEButtonPanel2, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( true, false, 124.44, 372.59 )
				self.Name:setTopBottom( true, false, 11.5, 31.5 )
				self.Name:setAlpha( 1 )
				self.clipFinished( Name, {} )
				CharacterName:completeAnimation()
				self.CharacterName:setLeftRight( true, false, 124.44, 224.59 )
				self.CharacterName:setTopBottom( true, false, 36, 55 )
				self.CharacterName:setAlpha( 1 )
				self.clipFinished( CharacterName, {} )
				CharacterAbility:completeAnimation()
				self.CharacterAbility:setLeftRight( true, false, 224.59, 324.73 )
				self.CharacterAbility:setTopBottom( true, false, 36, 55 )
				self.CharacterAbility:setAlpha( 1 )
				self.clipFinished( CharacterAbility, {} )
				RankBackground:completeAnimation()
				self.RankBackground:setLeftRight( true, false, 50.21, 108 )
				self.RankBackground:setTopBottom( true, false, 50, 71 )
				self.RankBackground:setAlpha( 0.26 )
				self.clipFinished( RankBackground, {} )
				Rank:completeAnimation()
				self.Rank:setLeftRight( true, false, 50, 72.9 )
				self.Rank:setTopBottom( true, false, 52, 71 )
				self.Rank:setAlpha( 1 )
				self.clipFinished( Rank, {} )
				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( true, false, 78.9, 96.9 )
				self.RankIcon:setTopBottom( true, false, 51.5, 69.5 )
				self.RankIcon:setAlpha( 1 )
				self.clipFinished( RankIcon, {} )
				StateLeft:completeAnimation()
				self.StateLeft:setLeftRight( true, false, 0, 27 )
				self.StateLeft:setTopBottom( true, false, 21.5, 48.5 )
				self.StateLeft:setAlpha( 1 )
				self.clipFinished( StateLeft, {} )
				StateRight:completeAnimation()
				self.StateRight:setLeftRight( true, false, 398, 425 )
				self.StateRight:setTopBottom( true, false, 22, 49 )
				self.StateRight:setAlpha( 1 )
				self.clipFinished( StateRight, {} )
				CharacterRender:completeAnimation()
				self.CharacterRender:setLeftRight( true, false, 53.9, 103.9 )
				self.CharacterRender:setTopBottom( true, false, 0, 50 )
				self.CharacterRender:setAlpha( 1 )
				self.clipFinished( CharacterRender, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel1:close()
		self.FEButtonPanel2:close()
		self.RankBackground:close()
		self.StateLeft:close()
		self.StateRight:close()
		self.CharacterRender:close()
		self.Name:close()
		self.CharacterName:close()
		self.CharacterAbility:close()
		self.Rank:close()
		self.RankIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

