require( "ui.uieditor.widgets.Health.HealthBar" )
require( "ui.uieditor.widgets.InGame.Draft.PositionDraft_ClientDead" )
require( "ui.uieditor.widgets.InGame.Draft.PositionDraft_ClientLevelText" )
require( "ui.uieditor.widgets.InGame.Draft.PositionDraft_ClientNameText" )
require( "ui.uieditor.widgets.InGame.Draft.PositionDraft_TeamBackground" )

CoD.PositionDraft_ClientHeadshot = InheritFrom( LUI.UIElement )
CoD.PositionDraft_ClientHeadshot.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PositionDraft_ClientHeadshot )
	self.id = "PositionDraft_ClientHeadshot"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 200 )
	self:setTopBottom( 0, 0, 0, 260 )
	self.anyChildUsesUpdateState = true
	
	local Background2 = LUI.UIImage.new()
	Background2:setLeftRight( 0, 1, 0, 0 )
	Background2:setTopBottom( 0, 0.24, 198, 198 )
	Background2:setRGB( 0.12, 0.14, 0.15 )
	Background2:setAlpha( 0.8 )
	self:addElement( Background2 )
	self.Background2 = Background2
	
	local Background = CoD.PositionDraft_TeamBackground.new( menu, controller )
	Background:setLeftRight( 0, 0, 0, 200 )
	Background:setTopBottom( 0, 0, 0, 198 )
	Background:linkToElementModel( self, nil, false, function ( model )
		Background:setModel( model, controller )
	end )
	self:addElement( Background )
	self.Background = Background
	
	local defaultCharacterImage = LUI.UIImage.new()
	defaultCharacterImage:setLeftRight( 0, 0.91, 9, 9 )
	defaultCharacterImage:setTopBottom( 0, 0.69, 5, 5 )
	defaultCharacterImage:setRGB( 0, 0, 0 )
	defaultCharacterImage:setImage( RegisterImage( "frontend_mp_specialist_headshot_ruin" ) )
	self:addElement( defaultCharacterImage )
	self.defaultCharacterImage = defaultCharacterImage
	
	local characterImage = LUI.UIImage.new()
	characterImage:setLeftRight( 0, 0, 0, 200 )
	characterImage:setTopBottom( 0, 0, 0, 197 )
	characterImage:setRGB( 0.52, 0.52, 0.52 )
	characterImage:linkToElementModel( self, "characterIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			characterImage:setImage( RegisterImage( GetPositionDraftIconByIndex( modelValue ) ) )
		end
	end )
	self:addElement( characterImage )
	self.characterImage = characterImage
	
	local focusedCharacterImage = LUI.UIImage.new()
	focusedCharacterImage:setLeftRight( 0, 0, 0, 200 )
	focusedCharacterImage:setTopBottom( 0, 0, 0, 198 )
	focusedCharacterImage:setRGB( 0.83, 0.83, 0.83 )
	focusedCharacterImage:linkToElementModel( self, "focusedCharacterIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			focusedCharacterImage:setImage( RegisterImage( GetPositionDraftIconByIndex( modelValue ) ) )
		end
	end )
	self:addElement( focusedCharacterImage )
	self.focusedCharacterImage = focusedCharacterImage
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 0, 0, 200 )
	BlackBG:setTopBottom( 0, 0, 131, 198 )
	BlackBG:setRGB( 0.21, 0.26, 0.28 )
	BlackBG:setAlpha( 0.75 )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local PositionIcon = LUI.UIImage.new()
	PositionIcon:setLeftRight( 0.75, 0.75, -150, -115 )
	PositionIcon:setTopBottom( 0.59, 0.59, -21, 15 )
	PositionIcon:linkToElementModel( self, "characterIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PositionIcon:setImage( RegisterImage( GetPositionCategoryIcon( modelValue ) ) )
		end
	end )
	self:addElement( PositionIcon )
	self.PositionIcon = PositionIcon
	
	local FocusedPositionIcon = LUI.UIImage.new()
	FocusedPositionIcon:setLeftRight( 0.75, 0.75, 0, 23 )
	FocusedPositionIcon:setTopBottom( 0.59, 0.59, -16, 7 )
	FocusedPositionIcon:setAlpha( 0 )
	FocusedPositionIcon:linkToElementModel( self, "focusedCharacterIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FocusedPositionIcon:setImage( RegisterImage( GetPositionCategoryIcon( modelValue ) ) )
		end
	end )
	self:addElement( FocusedPositionIcon )
	self.FocusedPositionIcon = FocusedPositionIcon
	
	local characterName = LUI.UIText.new()
	characterName:setLeftRight( 0, 0.75, 35, 35 )
	characterName:setTopBottom( 0.55, 0.73, -16, -16 )
	characterName:setTTF( "fonts/default.ttf" )
	characterName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	characterName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	characterName:linkToElementModel( self, "characterIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			characterName:setText( Engine.Localize( GetCharacterDisplayNameByIndex( modelValue ) ) )
		end
	end )
	self:addElement( characterName )
	self.characterName = characterName
	
	local focusedCharacterName = LUI.UIText.new()
	focusedCharacterName:setLeftRight( 0, 0.75, 35, 35 )
	focusedCharacterName:setTopBottom( 0.55, 0.73, -16, -16 )
	focusedCharacterName:setTTF( "fonts/default.ttf" )
	focusedCharacterName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	focusedCharacterName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	focusedCharacterName:linkToElementModel( self, "focusedCharacterIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			focusedCharacterName:setText( Engine.Localize( GetCharacterDisplayNameByIndex( modelValue ) ) )
		end
	end )
	self:addElement( focusedCharacterName )
	self.focusedCharacterName = focusedCharacterName
	
	local ClientClanTag = LUI.UIText.new()
	ClientClanTag:setLeftRight( 0, 0, 35, 177 )
	ClientClanTag:setTopBottom( 0.88, 0.88, 5, 31 )
	ClientClanTag:setTTF( "fonts/default.ttf" )
	ClientClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ClientClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ClientClanTag:linkToElementModel( self, "clanTag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ClientClanTag:setText( StringAsClanTag( modelValue ) )
		end
	end )
	self:addElement( ClientClanTag )
	self.ClientClanTag = ClientClanTag
	
	local HealthBar = CoD.HealthBar.new( menu, controller )
	HealthBar:setLeftRight( 0, 0, 3, 197 )
	HealthBar:setTopBottom( 0, 0, 177, 193 )
	HealthBar.HealthFill:setShaderVector( 0, 1, 0, 0, 0 )
	HealthBar:linkToElementModel( self, nil, false, function ( model )
		HealthBar:setModel( model, controller )
	end )
	self:addElement( HealthBar )
	self.HealthBar = HealthBar
	
	local ClientName = CoD.PositionDraft_ClientNameText.new( menu, controller )
	ClientName:setLeftRight( 0, 0, 35, 281 )
	ClientName:setTopBottom( 0, 0, 200, 234 )
	ClientName:linkToElementModel( self, nil, false, function ( model )
		ClientName:setModel( model, controller )
	end )
	self:addElement( ClientName )
	self.ClientName = ClientName
	
	local ClientLevel = CoD.PositionDraft_ClientLevelText.new( menu, controller )
	ClientLevel:setLeftRight( 0, 0, 3, 33 )
	ClientLevel:setTopBottom( 0, 0, 201, 231 )
	ClientLevel:linkToElementModel( self, "clientInfo", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ClientLevel:setModel( modelValue, controller )
		end
	end )
	self:addElement( ClientLevel )
	self.ClientLevel = ClientLevel
	
	local NeedPlayers = LUI.UIText.new()
	NeedPlayers:setLeftRight( 0, 0, 3, 203 )
	NeedPlayers:setTopBottom( 0, 0, 210, 247 )
	NeedPlayers:setAlpha( 0 )
	NeedPlayers:setText( Engine.Localize( "MENU_NEED_PLAYERS" ) )
	NeedPlayers:setTTF( "fonts/default.ttf" )
	NeedPlayers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	NeedPlayers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NeedPlayers )
	self.NeedPlayers = NeedPlayers
	
	local DeathX = CoD.PositionDraft_ClientDead.new( menu, controller )
	DeathX:setLeftRight( 0, 0, 0, 200 )
	DeathX:setTopBottom( 0, 0, 0, 161 )
	DeathX:linkToElementModel( self, nil, false, function ( model )
		DeathX:setModel( model, controller )
	end )
	self:addElement( DeathX )
	self.DeathX = DeathX
	
	self.resetProperties = function ()
		defaultCharacterImage:completeAnimation()
		characterImage:completeAnimation()
		focusedCharacterImage:completeAnimation()
		PositionIcon:completeAnimation()
		characterName:completeAnimation()
		focusedCharacterName:completeAnimation()
		ClientClanTag:completeAnimation()
		HealthBar:completeAnimation()
		Background2:completeAnimation()
		ClientName:completeAnimation()
		ClientLevel:completeAnimation()
		NeedPlayers:completeAnimation()
		FocusedPositionIcon:completeAnimation()
		defaultCharacterImage:setLeftRight( 0, 0.91, 9, 9 )
		defaultCharacterImage:setTopBottom( 0, 0.69, 5, 5 )
		defaultCharacterImage:setAlpha( 1 )
		characterImage:setAlpha( 1 )
		focusedCharacterImage:setAlpha( 1 )
		PositionIcon:setAlpha( 1 )
		characterName:setAlpha( 1 )
		focusedCharacterName:setAlpha( 1 )
		ClientClanTag:setAlpha( 1 )
		HealthBar:setAlpha( 1 )
		Background2:setAlpha( 0.8 )
		ClientName:setAlpha( 1 )
		ClientLevel:setAlpha( 1 )
		NeedPlayers:setAlpha( 0 )
		FocusedPositionIcon:setLeftRight( 0.75, 0.75, 0, 23 )
		FocusedPositionIcon:setTopBottom( 0.59, 0.59, -16, 7 )
		FocusedPositionIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				Background2:completeAnimation()
				self.Background2:setAlpha( 0.4 )
				self.clipFinished( Background2, {} )
				defaultCharacterImage:completeAnimation()
				self.defaultCharacterImage:setLeftRight( 0, 1, 0, 0 )
				self.defaultCharacterImage:setTopBottom( 0, 0.76, 0, 0 )
				self.defaultCharacterImage:setAlpha( 0.3 )
				self.clipFinished( defaultCharacterImage, {} )
				characterImage:completeAnimation()
				self.characterImage:setAlpha( 0 )
				self.clipFinished( characterImage, {} )
				focusedCharacterImage:completeAnimation()
				self.focusedCharacterImage:setAlpha( 0 )
				self.clipFinished( focusedCharacterImage, {} )
				PositionIcon:completeAnimation()
				self.PositionIcon:setAlpha( 0 )
				self.clipFinished( PositionIcon, {} )
				characterName:completeAnimation()
				self.characterName:setAlpha( 0 )
				self.clipFinished( characterName, {} )
				focusedCharacterName:completeAnimation()
				self.focusedCharacterName:setAlpha( 0 )
				self.clipFinished( focusedCharacterName, {} )
				ClientClanTag:completeAnimation()
				self.ClientClanTag:setAlpha( 0 )
				self.clipFinished( ClientClanTag, {} )
				HealthBar:completeAnimation()
				self.HealthBar:setAlpha( 0 )
				self.clipFinished( HealthBar, {} )
				ClientName:completeAnimation()
				self.ClientName:setAlpha( 0 )
				self.clipFinished( ClientName, {} )
				ClientLevel:completeAnimation()
				self.ClientLevel:setAlpha( 0 )
				self.clipFinished( ClientLevel, {} )
				NeedPlayers:completeAnimation()
				self.NeedPlayers:setAlpha( 1 )
				self.clipFinished( NeedPlayers, {} )
			end
		},
		FocusedCharacter = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				Background2:completeAnimation()
				self.Background2:setAlpha( 0.4 )
				self.clipFinished( Background2, {} )
				defaultCharacterImage:completeAnimation()
				self.defaultCharacterImage:setAlpha( 0 )
				self.clipFinished( defaultCharacterImage, {} )
				characterImage:completeAnimation()
				self.characterImage:setAlpha( 0 )
				self.clipFinished( characterImage, {} )
				PositionIcon:completeAnimation()
				self.PositionIcon:setAlpha( 0 )
				self.clipFinished( PositionIcon, {} )
				FocusedPositionIcon:completeAnimation()
				self.FocusedPositionIcon:setLeftRight( 0.75, 0.75, -144, -121 )
				self.FocusedPositionIcon:setTopBottom( 0.59, 0.59, 0, 23 )
				self.FocusedPositionIcon:setAlpha( 1 )
				self.clipFinished( FocusedPositionIcon, {} )
				characterName:completeAnimation()
				self.characterName:setAlpha( 0 )
				self.clipFinished( characterName, {} )
				HealthBar:completeAnimation()
				self.HealthBar:setAlpha( 0 )
				self.clipFinished( HealthBar, {} )
			end
		},
		CharacterIndexValid = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Background2:completeAnimation()
				self.Background2:setAlpha( 0.4 )
				self.clipFinished( Background2, {} )
				defaultCharacterImage:completeAnimation()
				self.defaultCharacterImage:setAlpha( 0 )
				self.clipFinished( defaultCharacterImage, {} )
				focusedCharacterImage:completeAnimation()
				self.focusedCharacterImage:setAlpha( 0 )
				self.clipFinished( focusedCharacterImage, {} )
				focusedCharacterName:completeAnimation()
				self.focusedCharacterName:setAlpha( 0 )
				self.clipFinished( focusedCharacterName, {} )
			end
		},
		ValidClient = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				Background2:completeAnimation()
				self.Background2:setAlpha( 0.4 )
				self.clipFinished( Background2, {} )
				defaultCharacterImage:completeAnimation()
				self.defaultCharacterImage:setLeftRight( 0, 1, 0, 0 )
				self.defaultCharacterImage:setTopBottom( 0, 0.76, 0, 0 )
				self.defaultCharacterImage:setAlpha( 0.3 )
				self.clipFinished( defaultCharacterImage, {} )
				characterImage:completeAnimation()
				self.characterImage:setAlpha( 0 )
				self.clipFinished( characterImage, {} )
				focusedCharacterImage:completeAnimation()
				self.focusedCharacterImage:setAlpha( 0 )
				self.clipFinished( focusedCharacterImage, {} )
				PositionIcon:completeAnimation()
				self.PositionIcon:setAlpha( 0 )
				self.clipFinished( PositionIcon, {} )
				characterName:completeAnimation()
				self.characterName:setAlpha( 0 )
				self.clipFinished( characterName, {} )
				focusedCharacterName:completeAnimation()
				self.focusedCharacterName:setAlpha( 0 )
				self.clipFinished( focusedCharacterName, {} )
				HealthBar:completeAnimation()
				self.HealthBar:setAlpha( 0 )
				self.clipFinished( HealthBar, {} )
				ClientLevel:completeAnimation()
				self.ClientLevel:setAlpha( 0 )
				self.clipFinished( ClientLevel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "FocusedCharacter",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "focusedCharacterIndex", 0 )
			end
		},
		{
			stateName = "CharacterIndexValid",
			condition = function ( menu, element, event )
				local f20_local0
				if not IsSelfModelValueEqualTo( element, controller, "characterIndex", 255 ) then
					f20_local0 = not IsSelfModelValueGreaterThanOrEqualTo( element, controller, "focusedCharacterIndex", 0 )
				else
					f20_local0 = false
				end
				return f20_local0
			end
		},
		{
			stateName = "ValidClient",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "clientNum", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "focusedCharacterIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "focusedCharacterIndex"
		} )
	end )
	self:linkToElementModel( self, "characterIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "characterIndex"
		} )
	end )
	self:linkToElementModel( self, "clientNum", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientNum"
		} )
	end )
	self:subscribeToGlobalModel( controller, "GlobalModel", "Player.healthChanged", function ( model )
		local element = self
		ForceNotifyElementModel( element, "clientNum" )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "UIVisibilityBit.45", function ( model )
		local element = self
		UpdateElementState( self, "HealthBar", controller )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Background:close()
		self.HealthBar:close()
		self.ClientName:close()
		self.ClientLevel:close()
		self.DeathX:close()
		self.characterImage:close()
		self.focusedCharacterImage:close()
		self.PositionIcon:close()
		self.FocusedPositionIcon:close()
		self.characterName:close()
		self.focusedCharacterName:close()
		self.ClientClanTag:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

