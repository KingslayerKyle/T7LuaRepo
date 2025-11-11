require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenHeroListWidgetPlayerName" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenTeamBoxFactionColor" )

CoD.LoadingScreenHeroListWidget = InheritFrom( LUI.UIElement )
CoD.LoadingScreenHeroListWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenHeroListWidget )
	self.id = "LoadingScreenHeroListWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 240 )
	self:setTopBottom( 0, 0, 0, 255 )
	self.anyChildUsesUpdateState = true
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( 0, 1, 2, -2 )
	BlackBox:setTopBottom( 0, 1, 20, 0 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.3 )
	BlackBox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	BlackBox:setShaderVector( 0, 0.01, 0.01, 0.01, 0.01 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local HeroLobbyClientExtraCamRender = LUI.UIImage.new()
	HeroLobbyClientExtraCamRender:setLeftRight( 0.5, 0.5, -120, 120 )
	HeroLobbyClientExtraCamRender:setTopBottom( 0.5, 0.5, -134, 126 )
	HeroLobbyClientExtraCamRender:setScale( 0.98 )
	self:addElement( HeroLobbyClientExtraCamRender )
	self.HeroLobbyClientExtraCamRender = HeroLobbyClientExtraCamRender
	
	local LoadingScreenHeroListWidgetPlayerName = CoD.LoadingScreenHeroListWidgetPlayerName.new( menu, controller )
	LoadingScreenHeroListWidgetPlayerName:mergeStateConditions( {
		{
			stateName = "Coloured",
			condition = function ( menu, element, event )
				return IsSelfPlayerName( element, controller )
			end
		}
	} )
	LoadingScreenHeroListWidgetPlayerName:setLeftRight( 0, 1, 0, 0 )
	LoadingScreenHeroListWidgetPlayerName:setTopBottom( 0.5, 0.5, 47.5, 92.5 )
	LoadingScreenHeroListWidgetPlayerName.FEButtonPanel00:setAlpha( 0.8 )
	self:addElement( LoadingScreenHeroListWidgetPlayerName )
	self.LoadingScreenHeroListWidgetPlayerName = LoadingScreenHeroListWidgetPlayerName
	
	local HeroLoadoutItem = LUI.UIText.new()
	HeroLoadoutItem:setLeftRight( 0, 1, 0, 0 )
	HeroLoadoutItem:setTopBottom( 1, 1, -39, -3 )
	HeroLoadoutItem:setAlpha( 0 )
	HeroLoadoutItem:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	HeroLoadoutItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	HeroLoadoutItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HeroLoadoutItem )
	self.HeroLoadoutItem = HeroLoadoutItem
	
	local VOIPImageByXUID = LUI.UIImage.new()
	VOIPImageByXUID:setLeftRight( 1, 1, -21, 3 )
	VOIPImageByXUID:setTopBottom( 1, 1, -62, -40 )
	self:addElement( VOIPImageByXUID )
	self.VOIPImageByXUID = VOIPImageByXUID
	
	local LoadingScreenTeamBoxFactionColor = CoD.LoadingScreenTeamBoxFactionColor.new( menu, controller )
	LoadingScreenTeamBoxFactionColor:mergeStateConditions( {
		{
			stateName = "FactionAxis",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "team", Enum.team_t.TEAM_AXIS )
			end
		},
		{
			stateName = "FactionAllie",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "team", Enum.team_t.TEAM_ALLIES )
			end
		}
	} )
	LoadingScreenTeamBoxFactionColor:linkToElementModel( LoadingScreenTeamBoxFactionColor, "team", true, function ( model )
		menu:updateElementState( LoadingScreenTeamBoxFactionColor, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "team"
		} )
	end )
	LoadingScreenTeamBoxFactionColor:setLeftRight( 0, 1, 3, -3 )
	LoadingScreenTeamBoxFactionColor:setTopBottom( 1, 1, -6, 0 )
	LoadingScreenTeamBoxFactionColor:linkToElementModel( self, nil, false, function ( model )
		LoadingScreenTeamBoxFactionColor:setModel( model, controller )
	end )
	self:addElement( LoadingScreenTeamBoxFactionColor )
	self.LoadingScreenTeamBoxFactionColor = LoadingScreenTeamBoxFactionColor
	
	self.HeroLobbyClientExtraCamRender:linkToElementModel( self, "playerxuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HeroLobbyClientExtraCamRender:setupCharacterExtraCamRenderForLobbyClient( modelValue )
		end
	end )
	self.LoadingScreenHeroListWidgetPlayerName:linkToElementModel( self, "playerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LoadingScreenHeroListWidgetPlayerName.PlayerName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.LoadingScreenHeroListWidgetPlayerName:linkToElementModel( self, "playerHeroLoadoutItem", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LoadingScreenHeroListWidgetPlayerName.WpnName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.HeroLoadoutItem:linkToElementModel( self, "playerHeroLoadoutItem", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HeroLoadoutItem:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.VOIPImageByXUID:linkToElementModel( self, "playerxuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			VOIPImageByXUID:setupVoipImageByXUID( modelValue )
		end
	end )
	self.resetProperties = function ()
		LoadingScreenTeamBoxFactionColor:completeAnimation()
		HeroLoadoutItem:completeAnimation()
		LoadingScreenHeroListWidgetPlayerName:completeAnimation()
		VOIPImageByXUID:completeAnimation()
		LoadingScreenTeamBoxFactionColor:setAlpha( 1 )
		HeroLoadoutItem:setLeftRight( 0, 1, 0, 0 )
		HeroLoadoutItem:setTopBottom( 1, 1, -39, -3 )
		LoadingScreenHeroListWidgetPlayerName:setLeftRight( 0, 1, 0, 0 )
		LoadingScreenHeroListWidgetPlayerName:setTopBottom( 0.5, 0.5, 47.5, 92.5 )
		VOIPImageByXUID:setLeftRight( 1, 1, -21, 3 )
		VOIPImageByXUID:setTopBottom( 1, 1, -62, -40 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		FFA = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				LoadingScreenHeroListWidgetPlayerName:completeAnimation()
				self.LoadingScreenHeroListWidgetPlayerName:setLeftRight( 0, 1, 0, 0 )
				self.LoadingScreenHeroListWidgetPlayerName:setTopBottom( 0.5, 0.5, 49.5, 94.5 )
				self.clipFinished( LoadingScreenHeroListWidgetPlayerName, {} )
				HeroLoadoutItem:completeAnimation()
				self.HeroLoadoutItem:setLeftRight( 0, 1, 0, 0 )
				self.HeroLoadoutItem:setTopBottom( 1, 1, -46, -10 )
				self.clipFinished( HeroLoadoutItem, {} )
				VOIPImageByXUID:completeAnimation()
				self.VOIPImageByXUID:setLeftRight( 1, 1, -21, 3 )
				self.VOIPImageByXUID:setTopBottom( 1, 1, -61, -39 )
				self.clipFinished( VOIPImageByXUID, {} )
				LoadingScreenTeamBoxFactionColor:completeAnimation()
				self.LoadingScreenTeamBoxFactionColor:setAlpha( 0 )
				self.clipFinished( LoadingScreenTeamBoxFactionColor, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "FFA",
			condition = function ( menu, element, event )
				return not IsTeamBasedGame( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapPreviousGametype" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MapVote.mapVoteMapPreviousGametype"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LoadingScreenHeroListWidgetPlayerName:close()
		self.LoadingScreenTeamBoxFactionColor:close()
		self.HeroLobbyClientExtraCamRender:close()
		self.HeroLoadoutItem:close()
		self.VOIPImageByXUID:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

