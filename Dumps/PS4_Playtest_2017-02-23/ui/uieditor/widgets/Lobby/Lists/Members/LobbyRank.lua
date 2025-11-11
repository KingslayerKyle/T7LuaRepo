CoD.LobbyRank = InheritFrom( LUI.UIElement )
CoD.LobbyRank.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyRank )
	self.id = "LobbyRank"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 75 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( 0, 1, 41, -3 )
	rankIcon:setTopBottom( 0, 1, 3, -3 )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local rankText = LUI.UIText.new()
	rankText:setLeftRight( 0, 1, -2, -34 )
	rankText:setTopBottom( 0, 1, 3, -3 )
	rankText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankText:setRGB( SetToParagonColorIfPrestigeMasterByRank( 188, 198, 201, modelValue ) )
		end
	end )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankText:setText( modelValue )
		end
	end )
	self:addElement( rankText )
	self.rankText = rankText
	
	local arenaRankIcon = LUI.UIImage.new()
	arenaRankIcon:setLeftRight( 0, 1, 41, -3 )
	arenaRankIcon:setTopBottom( 0, 1, 3, -3 )
	arenaRankIcon:setAlpha( 0 )
	arenaRankIcon:linkToElementModel( self, "arenaPoints", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			arenaRankIcon:setImage( RegisterImage( GetArenaRankIcon( modelValue ) ) )
		end
	end )
	self:addElement( arenaRankIcon )
	self.arenaRankIcon = arenaRankIcon
	
	local arenaRankText = LUI.UIText.new()
	arenaRankText:setLeftRight( 0, 1, -2, -34 )
	arenaRankText:setTopBottom( 0, 1, 3, -3 )
	arenaRankText:setRGB( 0.74, 0.78, 0.79 )
	arenaRankText:setAlpha( 0 )
	arenaRankText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	arenaRankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	arenaRankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	arenaRankText:linkToElementModel( self, "arenaPoints", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			arenaRankText:setText( GetArenaRank( modelValue ) )
		end
	end )
	self:addElement( arenaRankText )
	self.arenaRankText = arenaRankText
	
	self.resetProperties = function ()
		rankText:completeAnimation()
		arenaRankText:completeAnimation()
		arenaRankIcon:completeAnimation()
		rankIcon:completeAnimation()
		rankText:setLeftRight( 0, 1, -2, -34 )
		rankText:setTopBottom( 0, 1, 3, -3 )
		rankText:setAlpha( 1 )
		arenaRankText:setAlpha( 0 )
		arenaRankIcon:setAlpha( 0 )
		rankIcon:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				rankText:completeAnimation()
				self.rankText:setLeftRight( 0, 1, -2, -34 )
				self.rankText:setTopBottom( 0, 1, 2.5, -3.5 )
				self.clipFinished( rankText, {} )
			end
		},
		ArenaRank = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				rankIcon:completeAnimation()
				self.rankIcon:setAlpha( 0 )
				self.clipFinished( rankIcon, {} )
				rankText:completeAnimation()
				self.rankText:setAlpha( 0 )
				self.clipFinished( rankText, {} )
				arenaRankIcon:completeAnimation()
				self.arenaRankIcon:setAlpha( 1 )
				self.clipFinished( arenaRankIcon, {} )
				arenaRankText:completeAnimation()
				self.arenaRankText:setAlpha( 1 )
				self.clipFinished( arenaRankText, {} )
			end
		},
		RankHidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				rankIcon:completeAnimation()
				self.rankIcon:setAlpha( 0 )
				self.clipFinished( rankIcon, {} )
				rankText:completeAnimation()
				self.rankText:setAlpha( 0 )
				self.clipFinished( rankText, {} )
			end
		},
		FreeRun = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				rankIcon:completeAnimation()
				self.rankIcon:setAlpha( 0 )
				self.clipFinished( rankIcon, {} )
				rankText:completeAnimation()
				self.rankText:setAlpha( 0 )
				self.clipFinished( rankText, {} )
			end
		},
		Custom = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				rankIcon:completeAnimation()
				self.rankIcon:setAlpha( 0 )
				self.clipFinished( rankIcon, {} )
				rankText:completeAnimation()
				self.rankText:setAlpha( 0 )
				self.clipFinished( rankText, {} )
			end
		},
		Theater = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				rankIcon:completeAnimation()
				self.rankIcon:setAlpha( 0 )
				self.clipFinished( rankIcon, {} )
				rankText:completeAnimation()
				self.rankText:setAlpha( 0 )
				self.clipFinished( rankText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ArenaRank",
			condition = function ( menu, element, event )
				return IsArenaMode()
			end
		},
		{
			stateName = "RankHidden",
			condition = function ( menu, element, event )
				return ShouldHideLobbyMemberRank()
			end
		},
		{
			stateName = "FreeRun",
			condition = function ( menu, element, event )
				return IsFreeRunLobby()
			end
		},
		{
			stateName = "Custom",
			condition = function ( menu, element, event )
				return IsCustomMPLobby()
			end
		},
		{
			stateName = "Theater",
			condition = function ( menu, element, event )
				return LobbyModeTheater()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyMainMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.rankIcon:close()
		self.rankText:close()
		self.arenaRankIcon:close()
		self.arenaRankText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

