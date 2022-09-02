-- 62db45ce344fa998f70b577f10856c63
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 170 )
	self.anyChildUsesUpdateState = true
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, 1, -1 )
	BlackBox:setTopBottom( true, true, 13.5, 0 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.3 )
	BlackBox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	BlackBox:setShaderVector( 0, 0.01, 0.01, 0.01, 0.01 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local HeroLobbyClientExtraCamRender = LUI.UIImage.new()
	HeroLobbyClientExtraCamRender:setLeftRight( false, false, -80, 80 )
	HeroLobbyClientExtraCamRender:setTopBottom( false, false, -89, 84 )
	HeroLobbyClientExtraCamRender:setScale( 0.98 )
	self:addElement( HeroLobbyClientExtraCamRender )
	self.HeroLobbyClientExtraCamRender = HeroLobbyClientExtraCamRender
	
	local LoadingScreenHeroListWidgetPlayerName = CoD.LoadingScreenHeroListWidgetPlayerName.new( menu, controller )
	LoadingScreenHeroListWidgetPlayerName:setLeftRight( true, true, 0, 0 )
	LoadingScreenHeroListWidgetPlayerName:setTopBottom( false, false, 32, 62 )
	LoadingScreenHeroListWidgetPlayerName.FEButtonPanel00:setAlpha( 0.8 )
	LoadingScreenHeroListWidgetPlayerName:mergeStateConditions( {
		{
			stateName = "Coloured",
			condition = function ( menu, element, event )
				return IsSelfPlayerName( element, controller )
			end
		}
	} )
	self:addElement( LoadingScreenHeroListWidgetPlayerName )
	self.LoadingScreenHeroListWidgetPlayerName = LoadingScreenHeroListWidgetPlayerName
	
	local HeroLoadoutItem = LUI.UIText.new()
	HeroLoadoutItem:setLeftRight( true, true, 0, 0 )
	HeroLoadoutItem:setTopBottom( false, true, -26, -2 )
	HeroLoadoutItem:setAlpha( 0 )
	HeroLoadoutItem:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	HeroLoadoutItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	HeroLoadoutItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HeroLoadoutItem )
	self.HeroLoadoutItem = HeroLoadoutItem
	
	local VOIPImageByXUID = LUI.UIImage.new()
	VOIPImageByXUID:setLeftRight( false, true, -14, 2 )
	VOIPImageByXUID:setTopBottom( false, true, -41.5, -26.5 )
	self:addElement( VOIPImageByXUID )
	self.VOIPImageByXUID = VOIPImageByXUID
	
	local LoadingScreenTeamBoxFactionColor = CoD.LoadingScreenTeamBoxFactionColor.new( menu, controller )
	LoadingScreenTeamBoxFactionColor:setLeftRight( true, true, 2, -2 )
	LoadingScreenTeamBoxFactionColor:setTopBottom( false, true, -4, 0 )
	LoadingScreenTeamBoxFactionColor:linkToElementModel( self, nil, false, function ( model )
		LoadingScreenTeamBoxFactionColor:setModel( model, controller )
	end )
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
	self:addElement( LoadingScreenTeamBoxFactionColor )
	self.LoadingScreenTeamBoxFactionColor = LoadingScreenTeamBoxFactionColor
	
	self.HeroLobbyClientExtraCamRender:linkToElementModel( self, "playerxuid", true, function ( model )
		local playerxuid = Engine.GetModelValue( model )
		if playerxuid then
			HeroLobbyClientExtraCamRender:setupCharacterExtraCamRenderForLobbyClient( playerxuid )
		end
	end )
	self.LoadingScreenHeroListWidgetPlayerName:linkToElementModel( self, "playerName", true, function ( model )
		local playerName = Engine.GetModelValue( model )
		if playerName then
			LoadingScreenHeroListWidgetPlayerName.PlayerName:setText( playerName )
		end
	end )
	self.LoadingScreenHeroListWidgetPlayerName:linkToElementModel( self, "playerHeroLoadoutItem", true, function ( model )
		local playerHeroLoadoutItem = Engine.GetModelValue( model )
		if playerHeroLoadoutItem then
			LoadingScreenHeroListWidgetPlayerName.WpnName:setText( Engine.Localize( playerHeroLoadoutItem ) )
		end
	end )
	self.HeroLoadoutItem:linkToElementModel( self, "playerHeroLoadoutItem", true, function ( model )
		local playerHeroLoadoutItem = Engine.GetModelValue( model )
		if playerHeroLoadoutItem then
			HeroLoadoutItem:setText( Engine.Localize( playerHeroLoadoutItem ) )
		end
	end )
	self.VOIPImageByXUID:linkToElementModel( self, "playerxuid", true, function ( model )
		local playerxuid = Engine.GetModelValue( model )
		if playerxuid then
			VOIPImageByXUID:setupVoipImageByXUID( playerxuid )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				HeroLoadoutItem:completeAnimation()
				self.HeroLoadoutItem:setAlpha( 0 )
				self.clipFinished( HeroLoadoutItem, {} )

				LoadingScreenTeamBoxFactionColor:completeAnimation()
				self.LoadingScreenTeamBoxFactionColor:setLeftRight( true, true, 1.56, -2 )
				self.LoadingScreenTeamBoxFactionColor:setTopBottom( false, true, -4, 0 )
				self.LoadingScreenTeamBoxFactionColor:setAlpha( 1 )
				self.clipFinished( LoadingScreenTeamBoxFactionColor, {} )
			end
		},
		FFA = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				LoadingScreenHeroListWidgetPlayerName:completeAnimation()
				self.LoadingScreenHeroListWidgetPlayerName:setLeftRight( true, true, 0, 0 )
				self.LoadingScreenHeroListWidgetPlayerName:setTopBottom( false, false, 33, 63 )
				self.clipFinished( LoadingScreenHeroListWidgetPlayerName, {} )

				HeroLoadoutItem:completeAnimation()
				self.HeroLoadoutItem:setLeftRight( true, true, 0, 0 )
				self.HeroLoadoutItem:setTopBottom( false, true, -31, -7 )
				self.clipFinished( HeroLoadoutItem, {} )

				VOIPImageByXUID:completeAnimation()
				self.VOIPImageByXUID:setLeftRight( false, true, -14, 2 )
				self.VOIPImageByXUID:setTopBottom( false, true, -40.5, -25.5 )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LoadingScreenHeroListWidgetPlayerName:close()
		element.LoadingScreenTeamBoxFactionColor:close()
		element.HeroLobbyClientExtraCamRender:close()
		element.HeroLoadoutItem:close()
		element.VOIPImageByXUID:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

