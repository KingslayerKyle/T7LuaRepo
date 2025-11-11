local PostLoadFunc = function ( self, controller )
	local selfTeam = CoD.TeamUtility.GetTeamID( controller )
	self:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = model:get()
		if self.teamSub then
			self:removeSubscription( self.teamSub )
		end
		local teamModel = nil
		if clientNum >= 0 then
			local f2_local0 = Engine.GetModelForClient( clientNum )
			teamModel = f2_local0:create( "team" )
		else
			teamModel = self:getModel( controller, "team" )
		end
		self.teamSub = self:subscribeToModel( teamModel, function ( model )
			local team = model:get()
			if team then
				if CoD.IsShoutcaster( controller ) then
					self.Background:setRGB( GetScoreboardTeamBackgroundColor( controller, team ) )
				elseif team == selfTeam then
					self.Background:setRGB( CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES ) )
				else
					self.Background:setRGB( CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_AXIS ) )
				end
			end
		end, true )
		if self.selfTeamSub then
			self:removeSubscription( self.selfTeamSub )
		end
		local selfClientNum = Engine.GetClientNum( controller )
		local f2_local1 = Engine.GetModelForClient( selfClientNum )
		local selfTeamModel = f2_local1:create( "team" )
		self.selfTeamSub = self:subscribeToModel( selfTeamModel, function ( model )
			local team = model:get()
			if team then
				selfTeam = team
			end
		end, true )
	end )
end

CoD.PositionDraft_TeamBackground = InheritFrom( LUI.UIElement )
CoD.PositionDraft_TeamBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PositionDraft_TeamBackground )
	self.id = "PositionDraft_TeamBackground"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 200 )
	self:setTopBottom( 0, 0, 0, 198 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setAlpha( 0.6 )
	Background:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Background:setRGB( TeamColorFromClientNum( controller, modelValue ) )
		end
	end )
	self:addElement( Background )
	self.Background = Background
	
	self.resetProperties = function ()
		Background:completeAnimation()
		Background:setAlpha( 0.6 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Background:completeAnimation()
				self.Background:setAlpha( 0.5 )
				self.clipFinished( Background, {} )
			end
		},
		FocusedCharacter = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Background:completeAnimation()
				self.Background:setAlpha( 0.5 )
				self.clipFinished( Background, {} )
			end
		},
		Dead = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Background:completeAnimation()
				self.Background:setAlpha( 0.3 )
				self.clipFinished( Background, {} )
			end
		},
		CharacterIndexValid = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Background:completeAnimation()
				self.Background:setAlpha( 0.5 )
				self.clipFinished( Background, {} )
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
			stateName = "Dead",
			condition = function ( menu, element, event )
				local f13_local0
				if not IsSelfModelValueEqualTo( element, controller, "characterIndex", 255 ) and not IsSelfModelValueGreaterThanOrEqualTo( element, controller, "focusedCharacterIndex", 0 ) then
					f13_local0 = IsSelfModelValueEqualTo( element, controller, "clientInfo.dead", 1 )
				else
					f13_local0 = false
				end
				return f13_local0
			end
		},
		{
			stateName = "CharacterIndexValid",
			condition = function ( menu, element, event )
				local f14_local0
				if not IsSelfModelValueEqualTo( element, controller, "characterIndex", 255 ) then
					f14_local0 = not IsSelfModelValueGreaterThanOrEqualTo( element, controller, "focusedCharacterIndex", 0 )
				else
					f14_local0 = false
				end
				return f14_local0
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
	self:linkToElementModel( self, "clientInfo.dead", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientInfo.dead"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Background:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

