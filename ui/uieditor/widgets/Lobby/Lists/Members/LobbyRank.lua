-- 8e344ca93bed54175c5da6a34900db41
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 25 )
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( true, true, 27, -2 )
	rankIcon:setTopBottom( true, true, 2, -2 )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local _rankIcon = Engine.GetModelValue( model )
		if _rankIcon then
			rankIcon:setImage( RegisterImage( _rankIcon ) )
		end
	end )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local rankText = LUI.UIText.new()
	rankText:setLeftRight( true, true, -1, -23 )
	rankText:setTopBottom( true, true, 2, -2 )
	rankText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rankText:setLetterSpacing( 0 )
	rankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			rankText:setRGB( SetToParagonColorIfPrestigeMasterByRank( 188, 198, 201, rank ) )
		end
	end )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			rankText:setText( rank )
		end
	end )
	self:addElement( rankText )
	self.rankText = rankText
	
	local arenaRankIcon = LUI.UIImage.new()
	arenaRankIcon:setLeftRight( true, true, 27, -2 )
	arenaRankIcon:setTopBottom( true, true, 2, -2 )
	arenaRankIcon:setAlpha( 0 )
	arenaRankIcon:linkToElementModel( self, "arenaPoints", true, function ( model )
		local arenaPoints = Engine.GetModelValue( model )
		if arenaPoints then
			arenaRankIcon:setImage( RegisterImage( GetArenaRankIcon( arenaPoints ) ) )
		end
	end )
	self:addElement( arenaRankIcon )
	self.arenaRankIcon = arenaRankIcon
	
	local arenaRankText = LUI.UIText.new()
	arenaRankText:setLeftRight( true, true, -1, -23 )
	arenaRankText:setTopBottom( true, true, 2, -2 )
	arenaRankText:setRGB( 0.74, 0.78, 0.79 )
	arenaRankText:setAlpha( 0 )
	arenaRankText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	arenaRankText:setLetterSpacing( 0 )
	arenaRankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	arenaRankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	arenaRankText:linkToElementModel( self, "arenaPoints", true, function ( model )
		local arenaPoints = Engine.GetModelValue( model )
		if arenaPoints then
			arenaRankText:setText( GetArenaRank( arenaPoints ) )
		end
	end )
	self:addElement( arenaRankText )
	self.arenaRankText = arenaRankText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				rankIcon:completeAnimation()
				self.rankIcon:setLeftRight( true, true, 27, -2 )
				self.rankIcon:setTopBottom( true, true, 2, -2 )
				self.rankIcon:setAlpha( 1 )
				self.clipFinished( rankIcon, {} )

				rankText:completeAnimation()
				self.rankText:setLeftRight( true, true, -1, -23 )
				self.rankText:setTopBottom( true, true, 2, -2 )
				self.rankText:setAlpha( 1 )
				self.clipFinished( rankText, {} )

				arenaRankIcon:completeAnimation()
				self.arenaRankIcon:setAlpha( 0 )
				self.clipFinished( arenaRankIcon, {} )

				arenaRankText:completeAnimation()
				self.arenaRankText:setAlpha( 0 )
				self.clipFinished( arenaRankText, {} )
			end
		},
		ArenaRank = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				rankIcon:completeAnimation()
				self.rankIcon:setAlpha( 0 )
				self.clipFinished( rankIcon, {} )

				rankText:completeAnimation()
				self.rankText:setAlpha( 0 )
				self.clipFinished( rankText, {} )

				arenaRankIcon:completeAnimation()
				self.arenaRankIcon:setLeftRight( true, true, 27, -2 )
				self.arenaRankIcon:setTopBottom( true, true, 2, -2 )
				self.arenaRankIcon:setAlpha( 1 )
				self.clipFinished( arenaRankIcon, {} )

				arenaRankText:completeAnimation()
				self.arenaRankText:setAlpha( 1 )
				self.clipFinished( arenaRankText, {} )
			end
		},
		RankHidden = {
			DefaultClip = function ()
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.rankIcon:close()
		element.rankText:close()
		element.arenaRankIcon:close()
		element.arenaRankText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
