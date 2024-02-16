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
	rankIcon:setLeftRight( true, true, 24, -5 )
	rankIcon:setTopBottom( true, true, 2, -2 )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local rankText = LUI.UIText.new()
	rankText:setLeftRight( true, true, -1, -23 )
	rankText:setTopBottom( true, true, 2, -2 )
	rankText:setRGB( 0.74, 0.78, 0.79 )
	rankText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rankText:setLetterSpacing( 0 )
	rankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankText:setText( modelValue )
		end
	end )
	self:addElement( rankText )
	self.rankText = rankText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				rankIcon:completeAnimation()
				self.rankIcon:setLeftRight( true, true, 24, -5 )
				self.rankIcon:setTopBottom( true, true, 2, -2 )
				self.rankIcon:setAlpha( 1 )
				self.clipFinished( rankIcon, {} )
				rankText:completeAnimation()
				self.rankText:setLeftRight( true, true, -1, -23 )
				self.rankText:setTopBottom( true, true, 2, -2 )
				self.rankText:setAlpha( 1 )
				self.clipFinished( rankText, {} )
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
		RankHidden2 = {
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
			stateName = "RankHidden",
			condition = function ( menu, element, event )
				return IsMainModeInvalidAndNotTheaterMode()
			end
		},
		{
			stateName = "RankHidden2",
			condition = function ( menu, element, event )
				return IsLAN()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyMainMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
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
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

