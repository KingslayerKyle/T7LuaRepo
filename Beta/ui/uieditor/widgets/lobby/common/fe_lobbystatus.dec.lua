require( "ui.uieditor.widgets.Lobby.Common.LobbyStateString" )

CoD.FE_LobbyStatus = InheritFrom( LUI.UIElement )
CoD.FE_LobbyStatus.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_LobbyStatus )
	self.id = "FE_LobbyStatus"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 72 )
	self.anyChildUsesUpdateState = true
	
	local LobbyStatusString3 = CoD.LobbyStateString.new( menu, controller )
	LobbyStatusString3:setLeftRight( true, false, 0, 400 )
	LobbyStatusString3:setTopBottom( true, false, 48, 72 )
	LobbyStatusString3:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyStatusString3", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LobbyStatusString3.TextState:setText( Engine.Localize( modelValue ) )
		end
	end )
	LobbyStatusString3:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsLobbyStatusVisible()
			end
		}
	} )
	LobbyStatusString3:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( LobbyStatusString3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( LobbyStatusString3 )
	self.LobbyStatusString3 = LobbyStatusString3
	
	local LobbyStatusString2 = CoD.LobbyStateString.new( menu, controller )
	LobbyStatusString2:setLeftRight( true, false, 0, 400 )
	LobbyStatusString2:setTopBottom( true, false, 24, 48 )
	LobbyStatusString2:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyStatusString2", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LobbyStatusString2.TextState:setText( Engine.Localize( modelValue ) )
		end
	end )
	LobbyStatusString2:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsLobbyStatusVisible()
			end
		}
	} )
	LobbyStatusString2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( LobbyStatusString2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( LobbyStatusString2 )
	self.LobbyStatusString2 = LobbyStatusString2
	
	local LobbyStatusString1 = CoD.LobbyStateString.new( menu, controller )
	LobbyStatusString1:setLeftRight( true, false, 0, 400 )
	LobbyStatusString1:setTopBottom( true, false, 0, 24 )
	LobbyStatusString1:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyStatusString1", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LobbyStatusString1.TextState:setText( Engine.Localize( modelValue ) )
		end
	end )
	LobbyStatusString1:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsLobbyStatusVisible()
			end
		}
	} )
	LobbyStatusString1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( LobbyStatusString1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( LobbyStatusString1 )
	self.LobbyStatusString1 = LobbyStatusString1
	
	local PartyPrivacyString = CoD.LobbyStateString.new( menu, controller )
	PartyPrivacyString:setLeftRight( true, false, 0, 400 )
	PartyPrivacyString:setTopBottom( true, false, 24, 48 )
	PartyPrivacyString.TextState:setText( Engine.Localize( "MENU_PARTY_PRIVACY_STATUS" ) )
	PartyPrivacyString:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f11_local0 = IsPartyPrivacyVisible()
				if f11_local0 then
					f11_local0 = IsBooleanDvarSet( "partyPrivacyEnabled" )
				end
				return f11_local0
			end
		}
	} )
	PartyPrivacyString:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( PartyPrivacyString, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( PartyPrivacyString )
	self.PartyPrivacyString = PartyPrivacyString
	
	local LeaderActivityString = CoD.LobbyStateString.new( menu, controller )
	LeaderActivityString:setLeftRight( true, false, 0, 400 )
	LeaderActivityString:setTopBottom( true, false, 0, 24 )
	LeaderActivityString:subscribeToGlobalModel( controller, "LobbyRoot", "leaderActivity", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeaderActivityString.TextState:setText( Engine.Localize( modelValue ) )
		end
	end )
	LeaderActivityString:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsPartyLeaderStatusVisible()
			end
		}
	} )
	LeaderActivityString:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( LeaderActivityString, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( LeaderActivityString )
	self.LeaderActivityString = LeaderActivityString
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
				self:setupElementClipCounter( 0 )
			end,
			Update = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbyStatusString3:close()
		self.LobbyStatusString2:close()
		self.LobbyStatusString1:close()
		self.PartyPrivacyString:close()
		self.LeaderActivityString:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

