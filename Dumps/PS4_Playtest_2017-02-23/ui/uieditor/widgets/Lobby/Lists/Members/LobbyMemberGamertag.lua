CoD.LobbyMemberGamertag = InheritFrom( LUI.UIElement )
CoD.LobbyMemberGamertag.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberGamertag )
	self.id = "LobbyMemberGamertag"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 406 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local gamertag = LUI.UITightText.new()
	gamertag:setLeftRight( 0, 0, 0, 406 )
	gamertag:setTopBottom( 0, 0, 0, 38 )
	gamertag:setRGB( 0.87, 0.9, 0.9 )
	gamertag:setAlpha( 0.25 )
	gamertag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	gamertag:linkToElementModel( self, "clanTagAndGamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gamertag:setText( modelValue )
		end
	end )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	self.resetProperties = function ()
		gamertag:completeAnimation()
		gamertag:setRGB( 0.87, 0.9, 0.9 )
		gamertag:setAlpha( 0.25 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				gamertag:completeAnimation()
				self.gamertag:setAlpha( 1 )
				self.clipFinished( gamertag, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.96, 1, 0.33 )
				self.gamertag:setAlpha( 1 )
				self.clipFinished( gamertag, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		IsLackingDLC = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 1, 0.36, 0.36 )
				self.gamertag:setAlpha( 1 )
				self.clipFinished( gamertag, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		IsPartyMember = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				gamertag:completeAnimation()
				self.gamertag:setAlpha( 1 )
				self.clipFinished( gamertag, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "IsSelf",
			condition = function ( menu, element, event )
				return IsSelfItem( element, controller )
			end
		},
		{
			stateName = "IsLackingDLC",
			condition = function ( menu, element, event )
				return ShowClientInRedForMissingDLC( element, controller )
			end
		},
		{
			stateName = "IsPartyMember",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:linkToElementModel( self, "dlcBits", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "dlcBits"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MapVote.mapVoteMapNext"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.gamertag:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

