CoD.LobbyRank = InheritFrom( LUI.UIElement )
CoD.LobbyRank.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.LobbyRank )
	self.id = "LobbyRank"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 25 )
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( true, false, 28, 49 )
	rankIcon:setTopBottom( true, false, 2, 23 )
	rankIcon:setRGB( 1, 1, 1 )
	rankIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local rankText = LUI.UIText.new()
	rankText:setLeftRight( true, false, 4, 29 )
	rankText:setTopBottom( true, false, 1, 22 )
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
				self.rankIcon:setAlpha( 1 )
				self.clipFinished( rankIcon, {} )
				rankText:completeAnimation()
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyMainMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyGlobalRoot.lobbyMainMode"
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyGlobalRoot.lobbyNetworkMode"
		} )
	end )
	self.close = function ( self )
		self.rankIcon:close()
		self.rankText:close()
		CoD.LobbyRank.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

