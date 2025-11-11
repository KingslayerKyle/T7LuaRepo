require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberTeamColorBackground" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberTeamColorBackground_OnChange" )

local PostLoadFunc = function ( self, controller, menu )
	self.SetupTeamSwitch = function ( self, team )
		if team == Enum.team_t.TEAM_ALLIES then
			self.TeamColorBackground:setState( "Allies" )
		elseif team == Enum.team_t.TEAM_AXIS then
			self.TeamColorBackground:setState( "Axis" )
		elseif team == Enum.team_t.TEAM_SPECTATOR then
			self.TeamColorBackground:setState( "Spectator" )
		end
		self:playClip( "TeamSwitch" )
	end
	
	self.SetupTeamColorBackground = function ( self, team )
		self.TeamColorBackground:SetupTeamColors( team )
	end
	
end

CoD.LobbyMemberTeamColor = InheritFrom( LUI.UIElement )
CoD.LobbyMemberTeamColor.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberTeamColor )
	self.id = "LobbyMemberTeamColor"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 600 )
	self:setTopBottom( 0, 0, 0, 37 )
	self.anyChildUsesUpdateState = true
	
	local Dimmer = LUI.UIImage.new()
	Dimmer:setLeftRight( 0, 1, 0, 0 )
	Dimmer:setTopBottom( 0, 1, 0, 0 )
	Dimmer:setRGB( 0.11, 0.11, 0.11 )
	Dimmer:setAlpha( 0 )
	Dimmer:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	Dimmer:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( Dimmer )
	self.Dimmer = Dimmer
	
	local LobbyMemberTeamColorBackgroundOnChange = CoD.LobbyMemberTeamColorBackground_OnChange.new( menu, controller )
	LobbyMemberTeamColorBackgroundOnChange:setLeftRight( 0, 0, 0, 600 )
	LobbyMemberTeamColorBackgroundOnChange:setTopBottom( 0, 0, 0, 38 )
	self:addElement( LobbyMemberTeamColorBackgroundOnChange )
	self.LobbyMemberTeamColorBackgroundOnChange = LobbyMemberTeamColorBackgroundOnChange
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer0:setLeftRight( 0, 1, 0, 0 )
	FEButtonPanelShaderContainer0:setTopBottom( 0, 1, 0, 0 )
	FEButtonPanelShaderContainer0:setAlpha( 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local TeamColorBackground = CoD.LobbyMemberTeamColorBackground.new( menu, controller )
	TeamColorBackground:mergeStateConditions( {
		{
			stateName = "Axis",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "teamSwitch", Enum.team_t.TEAM_AXIS )
			end
		},
		{
			stateName = "Allies",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "teamSwitch", Enum.team_t.TEAM_ALLIES )
			end
		},
		{
			stateName = "Spectator",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "teamSwitch", Enum.team_t.TEAM_SPECTATOR )
			end
		}
	} )
	TeamColorBackground:linkToElementModel( TeamColorBackground, "teamSwitch", true, function ( model )
		menu:updateElementState( TeamColorBackground, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "teamSwitch"
		} )
	end )
	TeamColorBackground:setLeftRight( 0, 1, 0, 0 )
	TeamColorBackground:setTopBottom( 0, 1, 0, 0 )
	TeamColorBackground:linkToElementModel( self, nil, false, function ( model )
		TeamColorBackground:setModel( model, controller )
	end )
	self:addElement( TeamColorBackground )
	self.TeamColorBackground = TeamColorBackground
	
	self.resetProperties = function ()
		Dimmer:completeAnimation()
		LobbyMemberTeamColorBackgroundOnChange:completeAnimation()
		TeamColorBackground:completeAnimation()
		Dimmer:setAlpha( 0 )
		LobbyMemberTeamColorBackgroundOnChange:setAlpha( 1 )
		TeamColorBackground:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			TeamSwitch = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local DimmerFrame2 = function ( Dimmer, event )
					local DimmerFrame3 = function ( Dimmer, event )
						if not event.interrupted then
							Dimmer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						Dimmer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dimmer, event )
						else
							Dimmer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DimmerFrame3( Dimmer, event )
						return 
					else
						Dimmer:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Dimmer:registerEventHandler( "transition_complete_keyframe", DimmerFrame3 )
					end
				end
				
				Dimmer:completeAnimation()
				self.Dimmer:setAlpha( 0.75 )
				DimmerFrame2( Dimmer, {} )
				local LobbyMemberTeamColorBackgroundOnChangeFrame2 = function ( LobbyMemberTeamColorBackgroundOnChange, event )
					local LobbyMemberTeamColorBackgroundOnChangeFrame3 = function ( LobbyMemberTeamColorBackgroundOnChange, event )
						if not event.interrupted then
							LobbyMemberTeamColorBackgroundOnChange:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						LobbyMemberTeamColorBackgroundOnChange:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( LobbyMemberTeamColorBackgroundOnChange, event )
						else
							LobbyMemberTeamColorBackgroundOnChange:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LobbyMemberTeamColorBackgroundOnChangeFrame3( LobbyMemberTeamColorBackgroundOnChange, event )
						return 
					else
						LobbyMemberTeamColorBackgroundOnChange:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						LobbyMemberTeamColorBackgroundOnChange:registerEventHandler( "transition_complete_keyframe", LobbyMemberTeamColorBackgroundOnChangeFrame3 )
					end
				end
				
				LobbyMemberTeamColorBackgroundOnChange:completeAnimation()
				self.LobbyMemberTeamColorBackgroundOnChange:setAlpha( 1 )
				LobbyMemberTeamColorBackgroundOnChangeFrame2( LobbyMemberTeamColorBackgroundOnChange, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LobbyMemberTeamColorBackgroundOnChange:completeAnimation()
				self.LobbyMemberTeamColorBackgroundOnChange:setAlpha( 0 )
				self.clipFinished( LobbyMemberTeamColorBackgroundOnChange, {} )
				TeamColorBackground:completeAnimation()
				self.TeamColorBackground:setAlpha( 0 )
				self.clipFinished( TeamColorBackground, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not ShowTeams()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbyMemberTeamColorBackgroundOnChange:close()
		self.FEButtonPanelShaderContainer0:close()
		self.TeamColorBackground:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

