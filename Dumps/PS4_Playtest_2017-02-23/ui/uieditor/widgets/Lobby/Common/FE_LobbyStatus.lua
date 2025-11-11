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
	self:setLeftRight( 0, 0, 0, 600 )
	self:setTopBottom( 0, 0, 0, 108 )
	self.anyChildUsesUpdateState = true
	
	local LobbyStatusString3 = CoD.LobbyStateString.new( menu, controller )
	LobbyStatusString3:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "VisibleWithBackground",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	LobbyStatusString3:setLeftRight( 0, 0, 0, 417 )
	LobbyStatusString3:setTopBottom( 0, 0, 72, 108 )
	LobbyStatusString3.TextState:setRGB( 0.93, 0.13, 0.13 )
	LobbyStatusString3:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyStatusString3", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LobbyStatusString3.TextState:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LobbyStatusString3 )
	self.LobbyStatusString3 = LobbyStatusString3
	
	local LobbyStatusString2 = CoD.LobbyStateString.new( menu, controller )
	LobbyStatusString2:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsLobbyStatusVisible()
			end
		},
		{
			stateName = "VisibleWithBackground",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	LobbyStatusString2:setLeftRight( 0, 0, 0, 600 )
	LobbyStatusString2:setTopBottom( 0, 0, 36, 72 )
	LobbyStatusString2:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyStatusString2", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LobbyStatusString2.TextState:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LobbyStatusString2 )
	self.LobbyStatusString2 = LobbyStatusString2
	
	local LobbyStatusString1 = CoD.LobbyStateString.new( menu, controller )
	LobbyStatusString1:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsLobbyStatusVisible()
			end
		},
		{
			stateName = "VisibleWithBackground",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	LobbyStatusString1:setLeftRight( 0, 0, 0, 600 )
	LobbyStatusString1:setTopBottom( 0, 0, 0, 36 )
	LobbyStatusString1:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyStatusString1", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LobbyStatusString1.TextState:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LobbyStatusString1 )
	self.LobbyStatusString1 = LobbyStatusString1
	
	local PartyPrivacyString = CoD.LobbyStateString.new( menu, controller )
	PartyPrivacyString:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsPartyPrivacyVisible() and IsBooleanDvarSet( "partyPrivacyEnabled" )
			end
		},
		{
			stateName = "VisibleWithBackground",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	PartyPrivacyString:setLeftRight( 0, 0, 0, 600 )
	PartyPrivacyString:setTopBottom( 0, 0, 36, 72 )
	PartyPrivacyString.TextState:setText( Engine.Localize( "MENU_PARTY_PRIVACY_STATUS" ) )
	self:addElement( PartyPrivacyString )
	self.PartyPrivacyString = PartyPrivacyString
	
	local LeaderActivityString = CoD.LobbyStateString.new( menu, controller )
	LeaderActivityString:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsPartyLeaderStatusVisible()
			end
		},
		{
			stateName = "VisibleWithBackground",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	LeaderActivityString:setLeftRight( 0, 0, 0, 600 )
	LeaderActivityString:setTopBottom( 0, 0, 0, 36 )
	LeaderActivityString:subscribeToGlobalModel( controller, "LobbyRoot", "leaderActivity", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeaderActivityString.TextState:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LeaderActivityString )
	self.LeaderActivityString = LeaderActivityString
	
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

