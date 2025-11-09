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
	self:setLeftRight( true, false, 0, 271 )
	self:setTopBottom( true, false, 0, 25 )
	
	local gamertag = LUI.UITightText.new()
	gamertag:setLeftRight( true, false, 0, 271 )
	gamertag:setTopBottom( true, false, 0, 25 )
	gamertag:setRGB( 0.87, 0.9, 0.9 )
	gamertag:setAlpha( 0.25 )
	gamertag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	gamertag:linkToElementModel( self, "clanTagAndGamertag", true, function ( model )
		local clanTagAndGamertag = Engine.GetModelValue( model )
		if clanTagAndGamertag then
			gamertag:setText( clanTagAndGamertag )
		end
	end )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.96, 1, 0.33 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		IsLackingDLC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 1, 0.36, 0.36 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		IsPartyMember = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.gamertag:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

