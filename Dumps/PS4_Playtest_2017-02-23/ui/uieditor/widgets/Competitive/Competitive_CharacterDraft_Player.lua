require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_CharacterSelection" )
require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_StateIcon" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

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
	self:setLeftRight( 0, 0, 0, 637 )
	self:setTopBottom( 0, 0, 0, 106 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel1 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel1:setLeftRight( 0, 0, 167, 561 )
	FEButtonPanel1:setTopBottom( 0, 0, 0, 105 )
	FEButtonPanel1:setRGB( 0, 0, 0 )
	FEButtonPanel1:setAlpha( 0.26 )
	self:addElement( FEButtonPanel1 )
	self.FEButtonPanel1 = FEButtonPanel1
	
	local FEButtonPanel2 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel2:setLeftRight( 0, 0, 75, 162 )
	FEButtonPanel2:setTopBottom( 0, 0, 0, 105 )
	FEButtonPanel2:setRGB( 0, 0, 0 )
	FEButtonPanel2:setAlpha( 0.26 )
	self:addElement( FEButtonPanel2 )
	self.FEButtonPanel2 = FEButtonPanel2
	
	local Name = LUI.UIText.new()
	Name:setLeftRight( 0, 0, 187, 559 )
	Name:setTopBottom( 0, 0, 17, 47 )
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
	CharacterName:setLeftRight( 0, 0, 187, 337 )
	CharacterName:setTopBottom( 0, 0, 54, 82 )
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
	CharacterAbility:setLeftRight( 0, 0, 337, 487 )
	CharacterAbility:setTopBottom( 0, 0, 54, 82 )
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
	RankBackground:setLeftRight( 0, 0, 75, 162 )
	RankBackground:setTopBottom( 0, 0, 75, 107 )
	RankBackground:setRGB( 0, 0, 0 )
	RankBackground:setAlpha( 0.26 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( 0, 0, 75, 109 )
	Rank:setTopBottom( 0, 0, 78, 106 )
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
	RankIcon:setLeftRight( 0, 0, 118, 145 )
	RankIcon:setTopBottom( 0, 0, 77, 104 )
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
	StateLeft:setLeftRight( 0, 0, 0, 40 )
	StateLeft:setTopBottom( 0, 0, 32, 72 )
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
	StateRight:setLeftRight( 0, 0, 597, 637 )
	StateRight:setTopBottom( 0, 0, 33, 73 )
	StateRight:linkToElementModel( self, nil, false, function ( model )
		StateRight:setModel( model, controller )
	end )
	self:addElement( StateRight )
	self.StateRight = StateRight
	
	local CharacterRender = CoD.Competitive_CharacterDraft_CharacterSelection.new( menu, controller )
	CharacterRender:setLeftRight( 0, 0, 81, 156 )
	CharacterRender:setTopBottom( 0, 0, 0.5, 75.5 )
	CharacterRender:linkToElementModel( self, nil, false, function ( model )
		CharacterRender:setModel( model, controller )
	end )
	self:addElement( CharacterRender )
	self.CharacterRender = CharacterRender
	
	self.resetProperties = function ()
		CharacterRender:completeAnimation()
		FEButtonPanel2:completeAnimation()
		FEButtonPanel1:completeAnimation()
		CharacterName:completeAnimation()
		CharacterAbility:completeAnimation()
		Name:completeAnimation()
		Rank:completeAnimation()
		RankIcon:completeAnimation()
		RankBackground:completeAnimation()
		CharacterRender:setAlpha( 1 )
		FEButtonPanel2:setAlpha( 0.26 )
		FEButtonPanel1:setLeftRight( 0, 0, 167, 561 )
		FEButtonPanel1:setTopBottom( 0, 0, 0, 105 )
		CharacterName:setAlpha( 1 )
		CharacterAbility:setAlpha( 1 )
		Name:setLeftRight( 0, 0, 187, 559 )
		Name:setTopBottom( 0, 0, 17, 47 )
		Rank:setLeftRight( 0, 0, 75, 109 )
		Rank:setTopBottom( 0, 0, 78, 106 )
		RankIcon:setLeftRight( 0, 0, 118, 145 )
		RankIcon:setTopBottom( 0, 0, 77, 104 )
		RankBackground:setAlpha( 0.26 )
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
				self:setupElementClipCounter( 9 )
				FEButtonPanel1:completeAnimation()
				self.FEButtonPanel1:setLeftRight( 0, 0, 75.5, 560.5 )
				self.FEButtonPanel1:setTopBottom( 0, 0, 32, 73 )
				self.clipFinished( FEButtonPanel1, {} )
				FEButtonPanel2:completeAnimation()
				self.FEButtonPanel2:setAlpha( 0 )
				self.clipFinished( FEButtonPanel2, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 187, 559 )
				self.Name:setTopBottom( 0, 0, 37, 67 )
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
				self.Rank:setLeftRight( 0, 0, 75, 109 )
				self.Rank:setTopBottom( 0, 0, 41, 69 )
				self.clipFinished( Rank, {} )
				RankIcon:completeAnimation()
				self.RankIcon:setLeftRight( 0, 0, 118, 145 )
				self.RankIcon:setTopBottom( 0, 0, 40, 67 )
				self.clipFinished( RankIcon, {} )
				CharacterRender:completeAnimation()
				self.CharacterRender:setAlpha( 0 )
				self.clipFinished( CharacterRender, {} )
			end
		},
		SpecialistDraft = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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

