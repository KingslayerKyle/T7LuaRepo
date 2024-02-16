-- 852e1c3b029946e0e9052218a12b9e5f
-- This hash is used for caching, delete to decompile the file again

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
	LobbyStatusString3.TextState:setRGB( 0.93, 0.13, 0.13 )
	LobbyStatusString3:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyStatusString3", function ( model )
		local lobbyStatusString3 = Engine.GetModelValue( model )
		if lobbyStatusString3 then
			LobbyStatusString3.TextState:setText( Engine.Localize( lobbyStatusString3 ) )
		end
	end )
	LobbyStatusString3:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsIntDvarNonZero( "freedlc_hide_widget" )
			end
		},
		{
			stateName = "VisibleWithBackground",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( LobbyStatusString3 )
	self.LobbyStatusString3 = LobbyStatusString3
	
	local LobbyStatusString2 = CoD.LobbyStateString.new( menu, controller )
	LobbyStatusString2:setLeftRight( true, false, 0, 400 )
	LobbyStatusString2:setTopBottom( true, false, 24, 48 )
	LobbyStatusString2:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyStatusString2", function ( model )
		local lobbyStatusString2 = Engine.GetModelValue( model )
		if lobbyStatusString2 then
			LobbyStatusString2.TextState:setText( Engine.Localize( lobbyStatusString2 ) )
		end
	end )
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
	self:addElement( LobbyStatusString2 )
	self.LobbyStatusString2 = LobbyStatusString2
	
	local LobbyStatusString1 = CoD.LobbyStateString.new( menu, controller )
	LobbyStatusString1:setLeftRight( true, false, 0, 400 )
	LobbyStatusString1:setTopBottom( true, false, 0, 24 )
	LobbyStatusString1:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyStatusString1", function ( model )
		local lobbyStatusString1 = Engine.GetModelValue( model )
		if lobbyStatusString1 then
			LobbyStatusString1.TextState:setText( Engine.Localize( lobbyStatusString1 ) )
		end
	end )
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
	self:addElement( PartyPrivacyString )
	self.PartyPrivacyString = PartyPrivacyString
	
	local LeaderActivityString = CoD.LobbyStateString.new( menu, controller )
	LeaderActivityString:setLeftRight( true, false, 0, 400 )
	LeaderActivityString:setTopBottom( true, false, 0, 24 )
	LeaderActivityString:subscribeToGlobalModel( controller, "LobbyRoot", "leaderActivity", function ( model )
		local leaderActivity = Engine.GetModelValue( model )
		if leaderActivity then
			LeaderActivityString.TextState:setText( Engine.Localize( leaderActivity ) )
		end
	end )
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
	self:addElement( LeaderActivityString )
	self.LeaderActivityString = LeaderActivityString
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				LobbyStatusString3:completeAnimation()
				self.LobbyStatusString3:setLeftRight( true, false, 0, 278 )
				self.LobbyStatusString3:setTopBottom( true, false, 48, 72 )
				self.clipFinished( LobbyStatusString3, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 0 )
			end,
			Update = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		customGames = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				LobbyStatusString3:completeAnimation()
				self.LobbyStatusString3:setLeftRight( true, false, 0, 278 )
				self.LobbyStatusString3:setTopBottom( true, false, -24, 0 )
				self.clipFinished( LobbyStatusString3, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "customGames",
			condition = function ( menu, element, event )
				return IsCustomLobby()
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LobbyStatusString3:close()
		element.LobbyStatusString2:close()
		element.LobbyStatusString1:close()
		element.PartyPrivacyString:close()
		element.LeaderActivityString:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
